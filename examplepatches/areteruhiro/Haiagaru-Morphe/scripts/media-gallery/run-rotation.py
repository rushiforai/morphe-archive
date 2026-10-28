import pathlib,subprocess,sys,time
source=pathlib.Path('scripts/media-gallery/run.py').read_text(encoding='utf-8-sig');exec(source.split('\ntry:\n rpc.setup',1)[0])
try:
 rpc.setup('http://10.0.2.2:'+str(server.server_port));rpc.launch(0);wait_state('/a.png','ImagesViewer2Activity',True);time.sleep(2);print(rpc.rotate_check(),flush=True)
finally:
 try:rpc.cleanup()
 finally:session.detach();server.shutdown()
