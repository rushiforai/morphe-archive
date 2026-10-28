import json,pathlib,re,subprocess,sys,time,xml.etree.ElementTree as ET,frida,frida_tools
serial,package=sys.argv[1:3];adb='D:/Android/Sdk/platform-tools/adb.exe';opened=False

def call(*args):return subprocess.check_output([adb,'-s',serial,*args])
def dump():
 call('shell','uiautomator','dump','/sdcard/haiagaru-hissi-select.xml');call('pull','/sdcard/haiagaru-hissi-select.xml','build/hissi-select-ui.xml');return list(ET.parse('build/hissi-select-ui.xml').iter('node'))
def bounds(node):return tuple(map(int,re.findall(r'\d+',node.get('bounds',''))))
def tap(node):
 x1,y1,x2,y2=bounds(node);call('shell','input','tap',str((x1+x2)//2),str((y1+y2)//2))
def find(nodes,part,exact=False):
 for node in nodes:
  text=node.get('text','') or node.get('content-desc','')
  if (text==part if exact else part in text) and len(bounds(node))==4 and bounds(node)[3]>bounds(node)[1]:return node
 return None
def checked(nodes,label):
 node=find(nodes,label);assert node is not None,label
 if node.get('checkable')=='true':return node.get('checked')
 y=(bounds(node)[1]+bounds(node)[3])/2
 options=[n for n in nodes if n.get('checkable')=='true' and abs((bounds(n)[1]+bounds(n)[3])/2-y)<35]
 assert len(options)==1,[(n.attrib) for n in options]
 return options[0].get('checked')
pid=int(call('shell','pidof',package).decode().split()[0]);bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js';session=frida.get_device(serial,timeout=15).attach(pid)
script=session.create_script(bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path('scripts/hissi-board-catalog/runtime.js').read_text(encoding='utf-8-sig'));script.load();rpc=script.exports_sync
try:
 rpc.seed();nodes=dump()
 print('WARM_LOAD_WHILE_SCAN_BUSY',rpc.prepare(),flush=True);time.sleep(.5);nodes=dump();button=find(nodes,'掲示板（')
 if button is None:
  call('shell','input','swipe','1350','950','1350','430','300');nodes=dump();button=find(nodes,'掲示板（')
 assert button is not None,'board picker button missing';tap(button);opened=True;time.sleep(.5);nodes=dump();software=find(nodes,'Software')
 if software is None:
  call('shell','input','swipe','960','1050','960','400','300');nodes=dump();software=find(nodes,'Software')
 assert software is not None,'Software board missing';assert checked(nodes,'Software')=='false'
 tap(software);time.sleep(.1);state=rpc.selected();assert state['software'] and state['count']==2,state
 nodes=dump();assert checked(nodes,'Software')=='true','checked appearance not updated';assert any('選択中 2' in n.get('text','') for n in nodes),'selected count stale'
 print('PASS native toggle and visible Compose checked state update without closing selector',flush=True)
 call('shell','screencap','-p','/sdcard/haiagaru-hissi-selection-proof.png');call('pull','/sdcard/haiagaru-hissi-selection-proof.png','build/hissi-board-selection-proof.png')
 call('shell','input','keyevent','4');opened=False;time.sleep(.3);nodes=dump();assert find(nodes,'掲示板（2件選択）') is not None,'collapsed selection count stale'
 print('PASS collapsed board count reflects the same selection immediately',flush=True)
 assert rpc.clear_race();print('PASS late catalog completion preserves explicit clear',flush=True)
finally:
 if opened:call('shell','input','keyevent','4')
 try:print('RESTORE',rpc.cleanup(),flush=True)
 finally:session.detach()
