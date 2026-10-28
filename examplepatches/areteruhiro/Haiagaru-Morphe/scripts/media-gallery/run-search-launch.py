import pathlib,subprocess,sys,time
source=pathlib.Path('scripts/media-gallery/run.py').read_text(encoding='utf-8-sig');exec(source.split('\ntry:\n rpc.setup',1)[0])
try:
 rpc.setup('http://10.0.2.2:'+str(server.server_port));rpc.actual_search();time.sleep(3);print('SEARCH_STATE',rpc.state(),flush=True)
finally:
 try:rpc.cleanup()
 finally:session.detach();server.shutdown()
