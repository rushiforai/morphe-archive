import Java from 'frida-java-bridge';
const libs=__LIBRARIES__;
const holders=__HOLDERS__;

Java.perform(()=>{
 const launch=Java.use('com.pairip.StartupLauncher').launch.overload();
 launch.implementation=function(){
  const result=launch.call(this),values={};
  for(const [owner,fields] of Object.entries(holders)) {const cls=Java.use(owner); values[owner]={};for(const field of fields)values[owner][field]=cls[field].value===null?null:String(cls[field].value);}
  send({kind:'values',values});
  for(const protection of ['r--','rw-'])for(const r of Process.enumerateRanges(protection)){
   if(r.size>64*1024*1024||(r.file&&!r.file.path.includes('dalvik')&&!r.file.path.includes('memfd')))continue;
   try{for(const m of Memory.scanSync(r.base,r.size,'64 65 78 0a 30 ?? ?? 00')){const size=m.address.add(32).readU32();if(size>=112&&size<20*1024*1024&&m.address.add(size).compare(r.base.add(r.size))<=0)send({kind:'dex',address:m.address.toString(),size},m.address.readByteArray(size));}}catch(e){}
  }
  const inv=Java.use('com.pairip.VMRunner').invoke.overload('java.lang.String','[Ljava.lang.Object;');
  inv.implementation=function(token,args){
   if(args===null||args.length!==1)return inv.call(this,token,args);
   let base;try{base=ptr(Java.cast(args[0],Java.use('java.lang.Long')).longValue().toString());}catch(e){return inv.call(this,token,args);}
   const maps=File.readAllText('/proc/self/maps');let name;
   for(const line of maps.split('\n'))for(const n of Object.keys(libs))if(line.includes('/'+n)&&line.trim().split(/\s+/)[2]==='00000000'&&ptr('0x'+line.split('-')[0]).equals(base))name=n;
   if(!name){send({kind:'unknown-native',token:String(token),base:String(base)});return inv.call(this,token,args);}
   send({kind:'base',name,base:String(base),token:String(token)});let value;
   for(const phase of ['before','after']){if(phase==='after')value=inv.call(this,token,args);for(let i=0;i<libs[name].length;i++){const [offset,size]=libs[name][i];send({kind:'native',name,phase,index:i,offset,size},base.add(offset).readByteArray(size));}}
   send({kind:'maps',name,maps:File.readAllText('/proc/self/maps')});return value;
  };
  return result;
 };
 send({kind:'ready'});
});
