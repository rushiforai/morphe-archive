import pathlib,os,time,json
source=pathlib.Path('scripts/media-gallery/run.py').read_text(encoding='utf-8-sig').split('\ntry:\n rpc.setup',1)[0]
source=source.replace("adb='D:/Android/Sdk/platform-tools/adb.exe'","adb='C:/Users/narum/AppData/Local/Android/Sdk/platform-tools/adb.exe'")
source=source.replace('frida.get_device(serial,timeout=15)',"frida.get_device_manager().add_remote_device('127.0.0.1:27052')")
source=source.replace("pathlib.Path('scripts/media-gallery/thread-runtime.js').read_text(encoding='utf-8-sig'))","pathlib.Path('scripts/media-gallery/thread-runtime.js').read_text(encoding='utf-8-sig')+'\\n'+pathlib.Path('scripts/media-gallery/native-back-runtime.js').read_text(encoding='utf-8')+'\\n'+pathlib.Path('scripts/media-gallery/native-zoom-runtime.js').read_text(encoding='utf-8'))")
exec(source)
try:
 rpc.setup('http://10.0.2.2:'+str(server.server_port));rpc.launch(0);wait_state('/a.png','ImagesViewer2Activity');time.sleep(2);rpc.configure_back(0)
 initial=rpc.native_zoom(False);enlarged=rpc.native_zoom(True);print(json.dumps({'initial':initial,'enlarged':enlarged}),flush=True)
 if '--probe' not in sys.argv:
  check(not initial['blocked'],'automatic fit is not mistaken for user zoom');check(enlarged['blocked'],'manual zoom blocks gallery paging')
  for dx,dy in [(-450,0),(450,0),(0,-450),(0,450)]:
   rpc.full_swipe(dx,dy);time.sleep(.35);check(rpc.state()['url'].endswith('/a.png'),f'zoomed pan {dx}/{dy} retains image')
  rpc.restore_zoom();check(not rpc.native_zoom(False)['blocked'],'restoring fit re-enables gallery');rpc.full_swipe(-450,0);wait_state('/one.gif','GifViewerActivity',True);check(True,'fit image can advance to next GIF')
 print(json.dumps({'checks':len(checks),'passed':checks}),flush=True)
finally:
 try:rpc.restore_zoom();rpc.restore_back();rpc.cleanup()
 finally:session.detach();server.shutdown()
