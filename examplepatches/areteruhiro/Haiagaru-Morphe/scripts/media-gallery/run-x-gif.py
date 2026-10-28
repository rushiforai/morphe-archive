import pathlib,subprocess,sys,time
source=pathlib.Path('scripts/media-gallery/run.py').read_text(encoding='utf-8-sig');exec(source.split('\ntry:\n rpc.setup',1)[0])
try:
 rpc.setup('http://10.0.2.2:'+str(server.server_port))
 for enabled in (True,False):
  rpc.open_x_gif(enabled);time.sleep(8);s=rpc.x_gif_state();print('X_GIF',enabled,s,flush=True);assert s['wanted']==enabled and s['playing']==enabled and s['loop'],s
  if enabled:
   time.sleep(1);assert rpc.x_gif_state()['position']!=s['position'];print('PASS actual X GIF playback advances with video autoplay OFF',flush=True)
 print('PASS GIF autoplay OFF stays paused with video autoplay ON',flush=True)
finally:
 try:rpc.cleanup()
 finally:session.detach();server.shutdown()
