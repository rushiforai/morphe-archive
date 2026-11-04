function run(fn){return new Promise((resolve,reject)=>Java.perform(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}}));}
rpc.exports={test(){return run(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).startsWith('jp.co.airfront.android.a2chMate.haiagaru.bindings'))throw Error('isolated only');
 const Native=Java.use('app.morphe.extension.chmate.NativeImagePacketStack'),Sink=Java.registerClass({name:'app.haiagaru.fixture.PacketSink'+Date.now(),implements:[Java.use('app.morphe.extension.chmate.vpn.sstp.SstpImageSession$PacketWriter')],methods:{writePacket(packet){throw Error('unexpected network output');}}});
 const stack=Native.$new(),sink=Sink.$new();stack.initialize('10.7.0.2','10.7.0.1',1400,sink);stack.close();stack.close();let rejected=false;try{stack.receive(Java.array('byte',[]));}catch(e){rejected=String(e).includes('DISCONNECTED');}if(!rejected)throw Error('closed stack accepted packets');return {ok:true,jniLoaded:true,privateStackInitialized:true,closeIdempotent:true,closedPacketRejected:true,networkRequests:0};
 });}};
