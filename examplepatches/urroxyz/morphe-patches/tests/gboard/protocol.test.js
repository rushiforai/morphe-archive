'use strict';
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const source = fs.readFileSync('patches/src/main/resources/gboard/clipcascade.js', 'utf8');
const messages = [], sent = [], confirmations = [], statuses = [];
const timers = [];
class FakeSocket {
  constructor(url) { this.url = url; this.readyState = 1; this.sent = []; FakeSocket.last = this; }
  send(data) { this.sent.push(data); }
  close() { this.readyState = 3; if (this.onclose) this.onclose(); }
}
class FakeChannel {
  constructor() { this.readyState = 'open'; this.bufferedAmount = 0; this.sent = []; }
  send(value) { this.sent.push(value); }
}
class FakePeer {
  constructor() { this.remoteDescription = null; FakePeer.last = this; }
  createDataChannel() { return this.channel = new FakeChannel(); }
  async createOffer() { return {type:'offer', sdp:'offer'}; }
  async createAnswer() { return {type:'answer', sdp:'answer'}; }
  async setLocalDescription(value) { this.localDescription = value; }
  async setRemoteDescription(value) { this.remoteDescription = value; }
  async addIceCandidate(value) { this.candidate = value; }
  close() {}
}
const ctx = {
  window: {}, WebSocket: FakeSocket, RTCPeerConnection: FakePeer, TextEncoder, TextDecoder,
  UrroClip: {received: (value,type) => messages.push([value,type]), sent: (id,ok) => confirmations.push([id,ok]), status: value => statuses.push(value)},
  setTimeout: fn => { timers.push(fn); return timers.length; }, clearTimeout:()=>{}, setInterval:()=>1, clearInterval:()=>{},
  console,
};
vm.runInNewContext(source, ctx);
const tick = () => new Promise(resolve => setImmediate(resolve));
(async () => {
  ctx.window.urroStart({mode:'P2S',url:'wss://test/clipsocket',limit:1048576});
  const socket = FakeSocket.last; socket.onopen();
  assert.match(socket.sent[0], /^CONNECT\n/);
  await socket.onmessage({data:'CONNECTED\nversion:1.2\n\n\0'});
  assert.match(socket.sent[1], /destination:\/user\/queue\/cliptext/);
  await socket.onmessage({data:'MESSAGE\nsubscription:clipboard\n\n'+JSON.stringify({payload:'hello 🌍',type:'text'})+'\0'});
  await socket.onmessage({data:'MESSAGE\n\n'+JSON.stringify({payload:'aW1hZ2U=',type:'image'})+'\0'});
  assert.deepEqual(messages, [['hello 🌍','text'], ['aW1hZ2U=','image']]);
  ctx.window.urroSend('test 🌍','text',9,'1');
  assert.match(socket.sent[2], /destination:\/app\/cliptext/);
  assert.deepEqual(confirmations.pop(), ['1',true]);
  ctx.window.urroStop();
  ctx.window.urroStart({mode:'P2P',url:'wss://test/p2psignaling',limit:1048576,stun:'stun:test'});
  const signal = FakeSocket.last; signal.onopen();
  await signal.onmessage({data:JSON.stringify({type:'PEER_LIST',peers:['a','b']})});
  await signal.onmessage({data:JSON.stringify({type:'ASSIGNED_ID',peerId:'a'})});
  await tick();
  assert.equal(JSON.parse(signal.sent[0]).type, 'OFFER');
  const peer = FakePeer.last; peer.channel.onopen();
  await signal.onmessage({data:JSON.stringify({type:'ICE_CANDIDATE',fromPeerId:'b',toPeerId:'a',candidate:{candidate:'test'}})});
  await signal.onmessage({data:JSON.stringify({type:'ANSWER',fromPeerId:'b',toPeerId:'a',answer:{type:'answer',sdp:'ok'}})});
  await tick(); await tick();
  assert.equal(peer.candidate.candidate, 'test');
  peer.channel.onmessage({data:JSON.stringify({type:'text',payload:'part1',metadata:{id:'x',isFragmented:true,index:0,totalFragments:2}})});
  peer.channel.onmessage({data:JSON.stringify({type:'text',payload:'part2',metadata:{id:'x',isFragmented:true,index:1,totalFragments:2}})});
  assert.deepEqual(messages.at(-1), ['part1part2','text']);
  const long = 'a'.repeat(8191)+'🌍'+'z'.repeat(8192);
  ctx.window.urroSend(long,'text',new TextEncoder().encode(long).length,'2');
  while (timers.length) timers.shift()();
  const packets = peer.channel.sent.map(JSON.parse);
  assert.equal(packets.map(packet=>packet.payload).join(''), long);
  assert.equal(packets[0].metadata.combinedRawPayloadSizeInBytes, new TextEncoder().encode(long).length);
  assert.deepEqual(confirmations.pop(), ['2',true]);
  ctx.window.urroStop();
  console.log('PASS: P2S framing, P2P signaling order, ICE, fragments, text and image protocol checks');
})().catch(error => { console.error(error); process.exitCode = 1; });
