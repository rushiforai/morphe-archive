"""Simulate a silently dead reused HTTP/1.1 connection; local emulator only."""
import http.server,json,pathlib,subprocess,sys,threading,time
import frida,frida_tools
serial,package=sys.argv[1:3]
patched=len(sys.argv)>3 and sys.argv[3]=='patched'
assert serial.startswith('emulator-')
records=[]
class Handler(http.server.BaseHTTPRequestHandler):
 protocol_version='HTTP/1.1'
 def setup(self):super().setup();self.requests=0
 def log_message(self,*args):pass
 def do_GET(self):
  self.requests+=1
  assert not self.headers.get('Cookie')
  records.append({'path':self.path,'requestOnSocket':self.requests,'close':self.headers.get('Connection')})
  if self.requests>1:
   # The first request succeeded; simulate a route that drops later packets.
   time.sleep(19);self.close_connection=True;return
  self.send_response(200);self.send_header('Content-Length','2');self.end_headers();self.wfile.write(b'ok');self.wfile.flush()
server=http.server.ThreadingHTTPServer(('127.0.0.1',0),Handler);server.daemon_threads=True
threading.Thread(target=server.serve_forever,daemon=True).start()
servers=[server]
adb='D:/Android/Sdk/platform-tools/adb.exe'
pid=int(subprocess.check_output([adb,'-s',serial,'shell','pidof',package]).decode().split()[0])
bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js'
session=frida.get_device(serial,timeout=15).attach(pid)
try:
 script=session.create_script(bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path('scripts/network191-reuse/runtime.js').read_text(encoding='utf-8'))
 script.load();rpc=script.exports_sync
 if patched:print(json.dumps({'policyCases':rpc.policy_cases()}),flush=True)
 results=[]
 for mode in [False,True]:
  if mode:
   server=http.server.ThreadingHTTPServer(('127.0.0.1',0),Handler);server.daemon_threads=True
   threading.Thread(target=server.serve_forever,daemon=True).start();servers.append(server)
  for n in range(3):
   result=rpc.get(f'http://10.0.2.2:{server.server_port}/'+('close' if mode else 'native')+'/subject.txt',mode,patched)
   result.update(close=mode,iteration=n);results.append(result);print(json.dumps(result),flush=True)
  if not mode:time.sleep(5)
 print(json.dumps({'results':results,'server':records}),flush=True)
 assert results[0]['ok'] and not results[1]['ok'] and 14000<=results[1]['elapsed']<19000
 assert all(r['ok'] and r['elapsed']<3000 for r in results[3:])
 print('PASS native reused connection stalls; Connection close avoids repeated stalls',flush=True)
finally:
 session.detach()
 for server in servers:server.shutdown()
