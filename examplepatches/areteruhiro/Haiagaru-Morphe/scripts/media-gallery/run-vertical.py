import pathlib,subprocess,sys,time
source=pathlib.Path('scripts/media-gallery/run.py').read_text(encoding='utf-8-sig');exec(source.split('\ntry:\n rpc.setup',1)[0])
try:
 rpc.setup('http://10.0.2.2:'+str(server.server_port));rpc.launch(1);wait_state('/one.gif','GifViewerActivity',True);rpc.thread_gallery();rpc.up_swipe(-1);wait_state('/clip.mp4','VideoViewerActivity',True);print('PASS upward GIF to video',flush=True)
 rpc.controls(False);rpc.thread_gallery();rpc.up_swipe(-1);wait_state('/two.gif','GifViewerActivity',True);print('PASS upward video to next GIF',flush=True)
 rpc.thread_gallery();rpc.up_swipe(1);wait_state('/clip.mp4','VideoViewerActivity',True);print('PASS downward GIF to previous video',flush=True)
finally:
 try:rpc.cleanup()
 finally:session.detach();server.shutdown()
