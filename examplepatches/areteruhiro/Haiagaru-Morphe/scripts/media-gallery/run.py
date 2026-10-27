import base64,collections,http.server,json,pathlib,re,subprocess,sys,threading,time,frida,frida_tools,zlib,struct
serial,package=sys.argv[1:3]
assert serial.startswith('emulator-'), 'Local HTTP fixtures target the emulator only'
clip=pathlib.Path(sys.argv[3]).read_bytes()
counts=collections.Counter()
def png():
 def chunk(k,b): return struct.pack('>I',len(b))+k+b+struct.pack('>I',zlib.crc32(k+b)&0xffffffff)
 return b'\x89PNG\r\n\x1a\n'+chunk(b'IHDR',struct.pack('>IIBBBBB',320,240,8,2,0,0,0))+chunk(b'IDAT',zlib.compress((b'\0'+b'\x30\x90\xe0'*320)*240))+chunk(b'IEND',b'')
gif=base64.b64decode('R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7')
class Handler(http.server.BaseHTTPRequestHandler):
 def log_message(self,*args): pass
 def do_GET(self):
  counts[self.path]+=1
  assert not self.headers.get('Cookie'), 'Fixture received cookies'
  if self.path=='/slow.gif': time.sleep(8)
  data=clip if self.path.endswith('.mp4') else png() if self.path.endswith('.png') else gif
  begin,end=0,len(data)-1; status=200
  match=re.fullmatch(r'bytes=(\d+)-(\d*)',self.headers.get('Range',''))
  if match:
   begin=int(match[1]);end=min(end,int(match[2])) if match[2] else end;status=206
  try:
   self.send_response(status);self.send_header('Content-Type','video/mp4' if self.path.endswith('.mp4') else 'image/png' if self.path.endswith('.png') else 'image/gif')
   self.send_header('Content-Length',str(end-begin+1));self.send_header('Accept-Ranges','bytes')
   if status==206:self.send_header('Content-Range',f'bytes {begin}-{end}/{len(data)}')
   self.end_headers();self.wfile.write(data[begin:end+1])
  except (BrokenPipeError,ConnectionResetError):pass
server=http.server.ThreadingHTTPServer(('127.0.0.1',0),Handler);server.daemon_threads=True
threading.Thread(target=server.serve_forever,daemon=True).start()
adb='D:/Android/Sdk/platform-tools/adb.exe'
pid=int(subprocess.check_output([adb,'-s',serial,'shell','pidof',package]).decode().split()[0])
bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js'
session=frida.get_device(serial,timeout=15).attach(pid)
script=session.create_script(bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path('scripts/media-gallery/runtime.js').read_text(encoding='utf-8-sig')+'\n'+pathlib.Path('scripts/media-gallery/thread-runtime.js').read_text(encoding='utf-8-sig'))
script.on('message',lambda m,d:print(json.dumps(m,ensure_ascii=False),flush=True));script.load();rpc=script.exports_sync
checks=[]
def check(ok,label):
 if not ok:raise AssertionError(label)
 checks.append(label);print('PASS '+label,flush=True)
def wait_state(suffix,kind=None,ready=False):
 end=time.monotonic()+25
 while time.monotonic()<end:
  state=rpc.state()
  if state and str(state.get('url','')).endswith(suffix) and (not kind or kind in state['type']) and (not ready or state.get('ready')):return state
  time.sleep(.2)
 raise AssertionError('Viewer not ready: '+suffix+' '+str(state))
try:
 rpc.setup('http://10.0.2.2:'+str(server.server_port));check(rpc.body_links(),'shortened native URL spans retain same-response media order')
 check(str(rpc.native_routing()).startswith('PASS'),'independent GIF/video native and dedicated routing')
 if package.endswith('242'):check(str(rpc.thread_collection()).startswith('PASS'),'real native thumbnail factory collects full thread media; OFF and foreign thread isolation')
 rpc.launch(1)
 state=wait_state('/one.gif','GifViewerActivity',True);check(state['count']==4 and state['index']==1,'GIF opens with same-response mixed media list')
 rpc.swipe(-1,False);check(wait_state('/clip.mp4','VideoViewerActivity',True)['index']==2,'left swipe GIF to real video')
 check(rpc.video_prepare(),'local MediaPlayer is prepared and muted')
 rpc.preference('videoHoldDoubleSpeed',True);rpc.press(0);time.sleep(.75)
 check(rpc.state()['hold'] and abs(rpc.state()['speed']-2)<.01,'hold enabled reaches 2x')
 rpc.press(1);check(not rpc.state()['hold'] and abs(rpc.state()['speed']-1.25)<.01,'release restores previous speed')
 rpc.preference('videoHoldDoubleSpeed',False);rpc.press(0);time.sleep(.75);check(not rpc.state()['hold'],'hold disabled does not change speed');rpc.press(1)
 rpc.preference('videoTapControls',False);rpc.controls(False);rpc.press(0);rpc.press(1);time.sleep(.1);check(not rpc.state()['controls'],'tap control OFF leaves bar hidden')
 rpc.preference('videoTapControls',True);rpc.press(0);rpc.press(1);time.sleep(.1);check(rpc.state()['controls'],'tap control ON shows bar once');rpc.controls(False)
 check(rpc.native_gestures_off(),'ChMate gestures OFF does not start recognition');rpc.toolbar_swipe();time.sleep(.3);check(rpc.state()['url'].endswith('/clip.mp4'),'toolbar drag does not switch media')
 rpc.show_settings();time.sleep(.5);result=rpc.check_settings();check(result==8,'eight real settings switches save and restore their values');time.sleep(.3)
 wait_state('/clip.mp4','VideoViewerActivity',True)
 print('VIDEO_SWIPE_STATE',rpc.state(),flush=True);rpc.swipe(-1,False);check(wait_state('/two.gif','GifViewerActivity',True)['index']==3,'video to next GIF')
 rpc.swipe(-1,False);time.sleep(.3);check(rpc.state()['url'].endswith('/two.gif'),'last item does not wrap')
 rpc.swipe(1,False);wait_state('/clip.mp4','VideoViewerActivity',True);rpc.swipe(1,False);wait_state('/one.gif','GifViewerActivity',True)
 check(True,'right swipe moves back through video to previous GIF')
 rpc.swipe(1,False);wait_state('/a.png','ImagesViewer2Activity');check(True,'GIF to native image viewer')
 rpc.swipe(-1,False);wait_state('/one.gif','GifViewerActivity',True);check(True,'native image swipe re-enters GIF viewer')
 rpc.preference('mediaSwipeNavigation',False);rpc.swipe(-1,False);time.sleep(.3);check(rpc.state()['url'].endswith('/one.gif'),'media swipe OFF prevents mixed-media navigation')
 rpc.preference('mediaSwipeNavigation',True);rpc.swipe(-1,True);time.sleep(.3);check(rpc.state()['url'].endswith('/one.gif'),'vertical gesture does not navigate')
 rpc.pinch();time.sleep(.3);check(rpc.state()['url'].endswith('/one.gif'),'two-finger gesture does not switch media')
 rpc.preference('gifAutoplay',False);rpc.launch(3);state=wait_state('/two.gif','GifViewerActivity',True);check(not state['playing'],'GIF autoplay OFF opens paused')
 rpc.cancel_fixture();end=time.monotonic()+8
 while time.monotonic()<end:
  result=rpc.cancel_result()
  if result:break
  time.sleep(.1)
 check(counts['/slow.gif']==1,'cancel fixture reached delayed response headers');check(str(result).startswith('PASS'),'HTTP response-header wait cancels promptly: '+str(result))
 print('REQUEST_COUNTS',dict(counts),flush=True);check(counts['/one.gif']==1 and counts['/two.gif']==1,'warm GIF navigation reuses encoded-file cache')
 rpc.preference('gifUseNativeViewer',True);rpc.launch(1);wait_state('/one.gif','ImagesViewer2Activity')
 check(True,'GIF opt-out opens ChMate standard viewer without redirect loop')
 check(rpc.native_declined(),'native GIF/video entry preserves standard behavior when opted out')
 rpc.swipe(-1,False);wait_state('/clip.mp4','VideoViewerActivity',True);check(True,'swipe from standard GIF to dedicated video respects independent preferences')
 if package.endswith('242'):
  rpc.preference('gifUseNativeViewer',False);rpc.launch_thread();state=wait_state('/one.gif','GifViewerActivity',True)
  check(state['count']==3 and state['index']==1,'thumbnail preserves selected media in full-thread gallery')
  snapshot=rpc.thread_snapshot_reuse();check(snapshot['count']==3 and snapshot['index']==1,'thread snapshot reused for 100 interaction lookups')
  rpc.swipe(-1,False);check(wait_state('/clip.mp4','VideoViewerActivity',True)['index']==2,'whole-thread swipe crosses posts even when same-response swipe is OFF')
 print(json.dumps({'checks':len(checks),'passed':checks,'requests':dict(counts)},ensure_ascii=False),flush=True)
 pathlib.Path('build/media-gallery-runtime-result.json').write_text(json.dumps({'checks':checks,'requests':dict(counts)},ensure_ascii=False,indent=2),encoding='utf-8')
finally:
 try:rpc.cleanup()
 finally:session.detach();server.shutdown()
