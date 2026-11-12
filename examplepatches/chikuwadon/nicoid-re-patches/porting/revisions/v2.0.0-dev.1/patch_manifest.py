"""Append native live components without recompiling or renumbering resources."""
import struct
from pathlib import Path
U32=lambda x:struct.pack('<I',x)
NONE=0xffffffff

def patch_manifest(data):
 chunks=[];p=8
 while p<len(data):
  typ,head,size=struct.unpack_from('<HHI',data,p);assert size>=head>=8
  chunks.append((typ,data[p:p+size]));p+=size
 assert p==len(data)
 pool=next(b for t,b in chunks if t==1)
 _,header,_,count,styles,flags,start,style_start=struct.unpack_from('<HHIIIIII',pool)
 assert styles==0
 offsets=struct.unpack_from('<'+'I'*count,pool,header)
 def length(pos,utf8):
  if utf8:
   n=pool[pos];return (((n&127)<<8)|pool[pos+1],pos+2) if n&128 else (n,pos+1)
  n=struct.unpack_from('<H',pool,pos)[0];return (((n&32767)<<16)|struct.unpack_from('<H',pool,pos+2)[0],pos+4) if n&32768 else (n,pos+2)
 strings=[]
 for off in offsets:
  n,pos=length(start+off,bool(flags&256))
  if flags&256:n,pos=length(pos,True);strings.append(pool[pos:pos+n].decode('utf8'))
  else:strings.append(pool[pos:pos+n*2].decode('utf-16le'))
 original_count=len(strings)
 def sid(s):
  if s not in strings:strings.append(s)
  return strings.index(s)
 android=sid('http://schemas.android.com/apk/res/android')
 resource=next(b for t,b in chunks if t==0x180)
 ids=list(struct.unpack_from('<'+'I'*((len(resource)-8)//4),resource,8))
 def attr(name,value,kind=3):
  i=sid(name)
  known={'name':0x01010003,'exported':0x01010010,'configChanges':0x0101001f,'foregroundServiceType':0x01010599,'scheme':0x01010027,'host':0x01010028,'pathPrefix':0x0101002b}
  while len(ids)<=i:ids.append(0)
  assert ids[i] in (0,known[name]);ids[i]=known[name]
  v=sid(value) if kind==3 else value
  return struct.pack('<IIIHBBI',android,i,v if kind==3 else NONE,8,0,kind,v)
 def begin(tag,attrs=()):
  ext=struct.pack('<IIHHHHHH',NONE,sid(tag),20,20,len(attrs),0,0,0)
  body=struct.pack('<II',1,NONE)+ext+b''.join(attrs)
  return struct.pack('<HHI',0x102,16,len(body)+8)+body
 def end(tag):return struct.pack('<HHIIIII',0x103,16,24,1,NONE,NONE,sid(tag))
 def node(tag,attrs=(),children=b''):return begin(tag,attrs)+children+end(tag)
 def intent(scheme,host,prefix=None):
  attrs=[attr('scheme',scheme),attr('host',host)]
  if prefix:attrs.append(attr('pathPrefix',prefix))
  children=node('action',[attr('name','android.intent.action.VIEW')])+node('category',[attr('name','android.intent.category.DEFAULT')])+node('category',[attr('name','android.intent.category.BROWSABLE')])+node('data',attrs)
  return node('intent-filter',children=children)
 filters=intent('nicoid-re','live')
 for host in ['live.nicovideo.jp','live2.nicovideo.jp','sp.live.nicovideo.jp']:
  for prefix in ['/watch/','/gate/']:filters+=intent('https',host,prefix)+intent('http',host,prefix)
 components=node('activity',[attr('name','e.e.a.NicoliveActivity'),attr('exported',1,0x12),attr('configChanges',0x6a0,0x11)],filters)
 components+=node('service',[attr('name','e.e.a.NicoliveService'),attr('exported',0,0x12),attr('foregroundServiceType',2,0x11)])
 existing_permissions=set()
 for typ,chunk in chunks:
  if typ==0x102 and strings[struct.unpack_from('<I',chunk,20)[0]]=='uses-permission':
   ac=struct.unpack_from('<H',chunk,28)[0]
   for i in range(ac):
    ns,key,raw,sz,_,kind,value=struct.unpack_from('<IIIHBBI',chunk,36+20*i)
    if strings[key]=='name' and kind==3:existing_permissions.add(strings[value])
 permissions=b''
 for name in ['android.permission.FOREGROUND_SERVICE','android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK']:
  if name not in existing_permissions:permissions+=node('uses-permission',[attr('name',name)])
 def enc_len(n,utf8):
  if utf8:return bytes([n]) if n<128 else bytes([0x80|(n>>8),n&255])
  return struct.pack('<H',n) if n<32768 else struct.pack('<HH',0x8000|(n>>16),n&65535)
 encoded=bytearray();offs=[]
 for s in strings:
  offs.append(len(encoded));u=s.encode('utf-16le');b=s.encode('utf8')
  encoded+=enc_len(len(u)//2,bool(flags&256))
  if flags&256:encoded+=enc_len(len(b),True)+b+b'\0'
  else:encoded+=u+b'\0\0'
 while len(encoded)%4:encoded+=b'\0'
 pool=struct.pack('<HHIIIIII',1,28,28+4*len(strings)+len(encoded),len(strings),0,flags&~1,28+4*len(strings),0)+b''.join(U32(x) for x in offs)+encoded
 resource=struct.pack('<HHI',0x180,8,8+4*len(ids))+b''.join(U32(x) for x in ids)
 out=[];added=0
 for typ,b in chunks:
  if typ==1:b=pool
  if typ==0x180:b=resource
  if typ==0x102 and strings[struct.unpack_from('<I',b,20)[0]]=='application':out.append(permissions)
  if typ==0x103 and strings[struct.unpack_from('<I',b,20)[0]]=='application':out.append(components);added+=1
  out.append(b)
 assert added==1
 body=b''.join(out);return struct.pack('<HHI',3,8,len(body)+8)+body

if __name__=='__main__':
 import sys
 Path(sys.argv[2]).write_bytes(patch_manifest(Path(sys.argv[1]).read_bytes()))
