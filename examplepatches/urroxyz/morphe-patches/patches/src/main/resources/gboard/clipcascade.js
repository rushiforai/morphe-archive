// ClipCascade P2S/STOMP and P2P/RTCDataChannel protocol, based on Sathvik-Rao/ClipCascade.
// GPL-3.0; upstream revision fed738e79605b4045430f6993d4c2208904c66cc.
'use strict';
(() => {
  const peers = new Map(), fragments = new Map();
  let socket, myId, config, stopped = false, retry, incoming = '', pendingPeers;
  const status = text => UrroClip.status(text);
  const signal = message => socket.send(JSON.stringify({...message, fromPeerId: myId}));
  const receive = raw => {
    try {
      const message = JSON.parse(raw);
      if (message._cc_keepalive === true) return;
      if (!['text', 'image'].includes(message.type) || typeof message.payload !== 'string') return;
      const metadata = message.metadata;
      if (!metadata || !metadata.isFragmented) { UrroClip.received(message.payload, message.type); return; }
      const {id, index, totalFragments: count} = metadata;
      if (typeof id !== 'string' || !Number.isInteger(index) || !Number.isInteger(count) || count < 1 || count > 4096 || index < 0 || index >= count) throw Error('Invalid fragment');
      for (const [key, value] of fragments) if (Date.now() - value.time > 60000) fragments.delete(key);
      if (!fragments.has(id)) {
        if (fragments.size >= 8) throw Error('Too many incomplete messages');
        fragments.set(id, {parts: new Map(), count, type: message.type, time: Date.now(), size: 0});
      }
      const frame = fragments.get(id);
      if (frame.count !== count || frame.type !== message.type) throw Error('Conflicting fragment count');
      if (!frame.parts.has(index)) { frame.size += message.payload.length; frame.parts.set(index, message.payload); }
      if (frame.size > config.limit * 2) { fragments.delete(id); throw Error('Clipboard too large'); }
      if (frame.parts.size === count) {
        const complete = Array.from({length: count}, (_, i) => frame.parts.get(i)).join('');
        fragments.delete(id); UrroClip.received(complete, message.type);
      }
    } catch (error) { status('Receive failed: ' + error.message); }
  };
  const channel = (id, data) => {
    const peer = peers.get(id);
    peer.channel = data;
    data.onmessage = event => { if (event.data === 'ping') data.send('pong'); else if (event.data !== 'pong') receive(event.data); };
    let heartbeat;
    data.onopen = () => {
      status('Connected (P2P)');
      heartbeat = setInterval(() => {
        if (data.readyState === 'open') data.send('{"_cc_keepalive":true}');
      }, 20000);
    };
    data.onclose = () => clearInterval(heartbeat);
    data.onerror = () => status('Peer connection failed');
  };
  const createPeer = id => {
    if (peers.has(id)) return peers.get(id);
    const pc = new RTCPeerConnection({iceServers: config.stun ? [{urls: config.stun}] : []});
    const peer = {pc, pending: [], chain: Promise.resolve()};
    peers.set(id, peer);
    pc.onicecandidate = event => { if (event.candidate && socket.readyState === 1) signal({type: 'ICE_CANDIDATE', toPeerId: id, candidate: event.candidate}); };
    pc.ondatachannel = event => channel(id, event.channel);
    pc.onconnectionstatechange = () => {
      if (pc.connectionState === 'failed') { pc.close(); peers.delete(id); status('Peer disconnected; reconnecting'); socket.close(); }
    };
    return peer;
  };
  const description = async (peer, value) => {
    await peer.pc.setRemoteDescription(value);
    for (const candidate of peer.pending.splice(0)) await peer.pc.addIceCandidate(candidate);
  };
  const p2p = async raw => {
    const message = JSON.parse(raw);
    if (message.type === 'ASSIGNED_ID') { myId = message.peerId; if (pendingPeers) { const pending = pendingPeers; pendingPeers = null; await p2p(JSON.stringify({type:'PEER_LIST', peers:pending})); } return; }
    if (message.type === 'PEER_LIST') {
      if (!myId) { pendingPeers = message.peers; return; }
      const list = new Set(message.peers);
      for (const [id, peer] of peers) if (!list.has(id)) { peer.pc.close(); peers.delete(id); }
      for (const id of list) if (myId && id !== myId && !peers.has(id)) {
        const peer = createPeer(id);
        if (myId < id) {
          channel(id, peer.pc.createDataChannel('cliptext'));
          await peer.pc.setLocalDescription(await peer.pc.createOffer());
          signal({type:'OFFER', toPeerId:id, offer:peer.pc.localDescription});
        }
      }
      return;
    }
    if (!message.fromPeerId || message.toPeerId !== myId) return;
    const id = message.fromPeerId, peer = createPeer(id);
    peer.chain = peer.chain.then(async () => {
      if (message.type === 'OFFER') {
        await description(peer, message.offer);
        await peer.pc.setLocalDescription(await peer.pc.createAnswer());
        signal({type:'ANSWER', toPeerId:id, answer:peer.pc.localDescription});
      } else if (message.type === 'ANSWER') await description(peer, message.answer);
      else if (message.type === 'ICE_CANDIDATE') {
        if (peer.pc.remoteDescription) await peer.pc.addIceCandidate(message.candidate);
        else peer.pending.push(message.candidate);
      }
    }).catch(error => status('Peer setup failed: ' + error.message));
  };
  const stomp = data => {
    incoming += data;
    if (incoming.length > config.limit * 2 + 65536) { incoming = ''; throw Error('STOMP frame too large'); }
    let end;
    while ((end = incoming.indexOf('\0')) >= 0) {
      const frame = incoming.slice(0, end).replace(/^\n+/, ''); incoming = incoming.slice(end + 1);
      const boundary = frame.indexOf('\n\n');
      const command = frame.slice(0, frame.indexOf('\n'));
      if (command === 'CONNECTED') {
        socket.send('SUBSCRIBE\nid:clipboard\ndestination:/user/queue/cliptext\nack:auto\n\n\0'); status('Connected (P2S)');
      } else if (command === 'MESSAGE' && boundary >= 0) receive(frame.slice(boundary + 2));
      else if (command === 'ERROR') { status('Server rejected the subscription'); socket.close(); }
    }
    if (/^\n*$/.test(incoming)) incoming = '';
  };
  const connect = () => {
    if (stopped) return;
    incoming = ''; myId = null; pendingPeers = null;
    socket = new WebSocket(config.url); socket.binaryType = 'arraybuffer';
    socket.onopen = () => {
      if (config.mode === 'P2S') socket.send('CONNECT\naccept-version:1.2\nheart-beat:0,20000\n\n\0');
      else status('Connected to P2P signaling');
    };
    socket.onmessage = async event => {
      try {
        const text = typeof event.data === 'string' ? event.data : new TextDecoder().decode(event.data);
        if (config.mode === 'P2S') stomp(text); else await p2p(text);
      } catch (error) { status('Protocol error: ' + error.message); }
    };
    socket.onerror = () => status('Connection failed');
    socket.onclose = () => {
      for (const peer of peers.values()) peer.pc.close(); peers.clear();
      if (!stopped) { status('Disconnected; reconnecting'); retry = setTimeout(connect, 5000); }
    };
  };
  window.urroStart = value => { config = value; stopped = false; connect(); };
  window.urroStop = () => { stopped = true; clearTimeout(retry); if (socket) socket.close(); for (const peer of peers.values()) peer.pc.close(); peers.clear(); };
  window.urroSend = (payload, type, rawSize, id) => {
    if (!socket || socket.readyState !== 1) { UrroClip.sent(id, false); return; }
    if (config.mode === 'P2S') {
      const body = JSON.stringify({payload, type});
      socket.send('SEND\ndestination:/app/cliptext\ncontent-type:application/json\ncontent-length:' + new TextEncoder().encode(body).length + '\n\n' + body + '\0');
      UrroClip.sent(id, true); return;
    }
    const channels = [...peers.values()].map(peer => peer.channel).filter(value => value && value.readyState === 'open');
    if (!channels.length) { UrroClip.sent(id, false); return; }
    // Stock clients accept unfragmented messages with metadata; bound sends to RTC message size.
    const chunks = [];
    for (let start = 0; start < payload.length;) {
      let end = Math.min(start + 8192, payload.length);
      if (end < payload.length && /[\uD800-\uDBFF]/.test(payload[end - 1]) && /[\uDC00-\uDFFF]/.test(payload[end])) end--;
      chunks.push(payload.slice(start, end));
      start = end;
    }
    const packetId = id + '-' + Date.now();
    let index = 0;
    const dispatch = () => {
      try {
        if (channels.some(value => value.readyState !== 'open')) { UrroClip.sent(id, false); return; }
        if (channels.some(value => value.bufferedAmount > 65536)) { setTimeout(dispatch, 20); return; }
        const frame = JSON.stringify({payload: chunks[index], type, metadata:{id:packetId, isFragmented:chunks.length > 1, index, totalFragments:chunks.length, combinedRawPayloadSizeInBytes:rawSize}});
        for (const value of channels) value.send(frame);
        if (++index < chunks.length) setTimeout(dispatch, 0); else UrroClip.sent(id, true);
      } catch (_) { UrroClip.sent(id, false); }
    };
    dispatch();
  };
})();
