"""Validate version-independent DEX symbols against the user-tested dev.13.

Smali/dexlib2 can emit identical source under different index orders. Comparing
SHA-256 of the raw DEX would reject harmless reordering, while comparing only
its size would miss unintended modifications. Check complete canonical strings,
methods, fields, classes and protos and the exact resource ZIP hash instead.
"""
from pathlib import Path
from zipfile import ZipFile
from hashlib import sha256
import struct,sys

EXPECTED = {
    'strings': ('2628', '639943e9c2e8ab5ef9c9feef3150fcd017846fd526fb522b4983de7ab593adaa'),
    'types': ('877', 'efda0ebea95073f8ee29236922a6786a3bd9309a3c7d212dbd2f76563edf0e07'),
    'protos': ('644', '7d7d2b66e0f012795dd09dd08af4d63bbfcbc31a9045de522e7e1996f7f0d413'),
    'fields': ('1370', '26957bc00135421ebfda71eb9e5eacfca0825dbdad8ae3e69d6188fa86863347'),
    'methods': ('1905', '44f51fd2bf486970d986030bc0f02fcb46d5d28bd3a5a02b7441016ff17accb8'),
    'classes': ('158', 'a4d8bf995bf61dc77b3803d233072b18c7c4e86e8dcb6ac294273ec20a4720fa'),
}
EXPECTED_RESOURCE_SHA='0f47b86ea5fd172e00b0f767a285fa6a1c72f547beb65f4d0e4520a3a453c343'

def fingerprint(dex):
    def u16(i):return struct.unpack_from('<H',dex,i)[0]
    def u32(i):return struct.unpack_from('<I',dex,i)[0]
    def leb(i):
        while dex[i]&128: i+=1
        return i+1
    if dex[:8] not in (b'dex\n035\x00',b'dex\n037\x00',b'dex\n038\x00',b'dex\n039\x00'):
        raise ValueError('Not a supported Android DEX')
    if u32(32)!=len(dex):raise ValueError('Malformed DEX size')
    count,offset=u32(56),u32(60)
    strings=[]
    for i in range(count):
        at=leb(u32(offset+i*4))
        strings.append(dex[at:dex.index(0,at)])
    typ_count,typ_off=u32(64),u32(68)
    types=[strings[u32(typ_off+i*4)] for i in range(typ_count)]
    proto_count,proto_off=u32(72),u32(76)
    protos=[]
    for i in range(proto_count):
        off=proto_off+i*12
        ret=types[u32(off+4)]
        param_off=u32(off+8)
        args=[] if not param_off else [types[u16(param_off+4+j*2)] for j in range(u32(param_off))]
        protos.append((ret, *args))
    field_count,field_off=u32(80),u32(84)
    fields=[]
    for i in range(field_count):
        off=field_off+i*8
        fields.append(b'|'.join((types[u16(off)],types[u16(off+2)],strings[u32(off+4)])))
    method_count,method_off=u32(88),u32(92)
    methods=[]
    for i in range(method_count):
        off=method_off+i*8
        prot=b'('.join(protos[u16(off+2)])
        methods.append(b'|'.join((types[u16(off)],strings[u32(off+4)],prot)))
    cls_count,cls_off=u32(96),u32(100)
    classes=[types[u32(cls_off+i*32)] for i in range(cls_count)]
    result={}
    for name,group in [('strings',strings),('types',types),('protos',[b'|'.join(p) for p in protos]),('fields',fields),('methods',methods),('classes',classes)]:
        normalized=b'\n'.join(sorted(group))
        result[name]=(len(group),sha256(normalized).hexdigest())
    return result

def main(path):
    with ZipFile(path) as z:
        assert z.testzip() is None
        native=z.read('nicoid/method-delta.dex')
        resources=z.read('nicoid/resources.zip')
    assert sha256(resources).hexdigest()==EXPECTED_RESOURCE_SHA,'Unexpected Android resources'
    actual=fingerprint(native)
    for name,(count,fp) in actual.items():
        expected_count,expected_hash=EXPECTED[name]
        assert count==int(expected_count) and fp==expected_hash,(name,count,fp)
    print('PASS: v2.0.6 native DEX symbol inventory matches user-tested dev.13')
    print('PASS: v2.0.6 Android resources match user-tested dev.13 exactly')

if __name__=='__main__':main(Path(sys.argv[1]))
