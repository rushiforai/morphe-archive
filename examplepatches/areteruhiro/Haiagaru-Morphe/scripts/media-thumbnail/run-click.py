import pathlib,json,subprocess,sys,frida,frida_tools,time
serial,package=sys.argv[1:3];adb='D:/Android/Sdk/platform-tools/adb.exe';pid=int(subprocess.check_output([adb,'-s',serial,'shell','pidof',package]).decode().split()[0]);bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js';session=frida.get_device(serial,timeout=15).attach(pid);script=session.create_script(bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path('scripts/media-thumbnail/diagnostic.js').read_text(encoding='utf-8-sig'));script.on('message',lambda m,d:print(json.dumps(m,ensure_ascii=False),flush=True));script.load();rpc=script.exports_sync
try:
 print(json.dumps(rpc.inspect(),ensure_ascii=False),flush=True)
 if len(sys.argv)>3:
  rpc.enable();rpc.trace();rpc.jump(int(sys.argv[3]));time.sleep(1);views=rpc.views();print('VIEWS',json.dumps(views,ensure_ascii=False),flush=True);thumbnail=next(v for v in views if v['click'] and 64<=v['w']<=200 and 64<=v['h']<=200 and 670<v['x'] and 150<v['y']<1000);subprocess.run([adb,'-s',serial,'shell','input','tap',str(thumbnail['x']+thumbnail['w']//2),str(thumbnail['y']+thumbnail['h']//2)],check=True);time.sleep(3);state=rpc.current_viewer();print('VIEWER',state,flush=True);assert state and state['thread'] and state['count']>4,state
  start=state['position'];total=state['count']
  assert str(start)+'/'+str(total) in state['labels'],state
  for n in range(4):
   subprocess.run([adb,'-s',serial,'shell','input','swipe','1500','600','500','600','250'],check=True)
   deadline=time.monotonic()+10
   while time.monotonic()<deadline:
    time.sleep(.3);state=rpc.current_viewer()
    if state and state['position']==start+n+1:break
   print('SWIPE',n+1,state,flush=True);assert state and state['position']==start+n+1 and state['count']==total,state
  print('PASS actual 191 response thumbnail crosses its four attachments into next response video with full-thread position/total',flush=True)
finally:
 try:rpc.cleanup()
 finally:session.detach()
