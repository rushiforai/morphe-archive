import http.server,json,pathlib,subprocess,sys,threading,time,frida,frida_tools
serial,pkg=sys.argv[1:3];assert serial=='emulator-5580' and pkg.endswith('settingsfix191')
records=[]
class Handler(http.server.BaseHTTPRequestHandler):
 protocol_version='HTTP/1.1'
 def setup(self):super().setup();self.requests=0
 def log_message(self,*args):pass
 def do_GET(self):
  self.requests+=1;assert not self.headers.get('Cookie');records.append({'requestOnSocket':self.requests,'close':self.headers.get('Connection')})
  if self.requests>1:time.sleep(6);self.close_connection=True;return
  self.send_response(200);self.send_header('Content-Length','2');self.end_headers();self.wfile.write(b'ok');self.wfile.flush()
server=http.server.ThreadingHTTPServer(('127.0.0.1',0),Handler);server.daemon_threads=True
threading.Thread(target=server.serve_forever,daemon=True).start()
adb='C:/Users/narum/AppData/Local/Android/Sdk/platform-tools/adb.exe'
pid=int(subprocess.check_output([adb,'-s',serial,'shell','pidof',pkg]).decode().split()[0])
bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js';session=frida.get_device_manager().add_remote_device('127.0.0.1:27052').attach(pid)
script=session.create_script(bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path('scripts/network191-reuse/runtime.js').read_text(encoding='utf-8'));script.load()
try:
 rpc=script.exports_sync;url=f'http://10.0.2.2:{server.server_port}/board/subject.txt'
 results=[rpc.get(url,False,True)]
 for i in range(3):results.append(rpc.get(url,True,True))
 assert all(r['ok'] and r['elapsed']<3000 for r in results),results
 assert len(records)==4 and all(r['requestOnSocket']==1 for r in records),records
 print(json.dumps({'results':results,'server':records}));print('PASS pre-existing pooled connection never borrowed; each scoped GET starts a fresh socket')
finally:session.detach();server.shutdown()
