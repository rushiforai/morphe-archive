import pathlib,subprocess,sys,time,json
source=pathlib.Path('scripts/media-gallery/run.py').read_text(encoding='utf-8-sig');exec(source.split('\ntry:\n rpc.setup',1)[0])
# Extend the same foreground runtime session; no account or posting requests.
extra=script.exports_sync
try:
 rpc.setup('http://10.0.2.2:'+str(server.server_port))
 print('ROTATION_MENU',rpc.rotation_menu(),flush=True)


 for index,kind in [(1,'GifViewerActivity'),(2,'VideoViewerActivity')]:
  rpc.launch(index);wait_state('/one.gif' if index==1 else '/clip.mp4',kind,True)
  if index==2:rpc.controls(True)
  print('CORNERS',kind,rpc.corners(),flush=True)
  print('BACK',kind,rpc.back_priority(),flush=True)
 print('PASS_CORNERS_AND_BACK',flush=True)
finally:
 try:rpc.cleanup()
 finally:session.detach();server.shutdown()
