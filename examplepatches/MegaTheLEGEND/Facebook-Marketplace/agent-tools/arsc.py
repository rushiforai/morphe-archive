import struct,sys
# usage: python3 arsc.py <resources.arsc> <hex id> [<hex id> ...]   e.g. 7f0a2044
d=open(sys.argv[1],'rb').read()
def u16(o):return struct.unpack_from('<H',d,o)[0]
def u32(o):return struct.unpack_from('<I',d,o)[0]
def pool(o):
    # returns list of strings
    hs=u16(o+2); n=u32(o+8); flags=u32(o+16); sstart=u32(o+20)
    utf8=flags&0x100
    offs=[u32(o+hs+4*i) for i in range(n)]
    out=[]
    for off in offs:
        p=o+sstart+off
        if utf8:
            l=d[p]; p+=1
            if l&0x80: p+=1
            l2=d[p]; p+=1
            if l2&0x80: l2=((l2&0x7f)<<8)|d[p]; p+=1
            out.append(d[p:p+l2].decode('utf8','replace'))
        else:
            l=u16(p); p+=2
            if l&0x8000: l=((l&0x7fff)<<16)|u16(p); p+=2
            out.append(d[p:p+l*2].decode('utf-16le','replace'))
    return out
want={}
for a in sys.argv[2:]:
    v=int(a,16); want[v]=None
o=u16(2)
hs=u16(0+2)
while o<len(d):
    t=u16(o);h=u16(o+2);s=u32(o+4)
    if t==0x200: # package
        pid=u32(o+8)
        tsp=u32(o+0x10c); ksp=u32(o+0x114)
        types=pool(o+tsp); keys=pool(o+ksp)
        p=o+h
        end=o+s
        # skip pools
        while p<end:
            tt=u16(p);hh=u16(p+2);ss=u32(p+4)
            if tt==0x201:
                tid=d[p+8]; cnt=u32(p+12); estart=u32(p+16)
                flags=d[p+9]
                base=p+hh
                for i in range(cnt):
                    if flags&1:
                        # sparse
                        v=u32(base+4*i); idx=v&0xffff; eoff=(v>>16)*4
                    else:
                        eoff=u32(base+4*i); idx=i
                        if eoff==0xffffffff: continue
                    full=(pid<<24)|(tid<<16)|idx
                    if full in want and want[full] is None:
                        eo=p+estart+eoff
                        ki=u32(eo+4)
                        want[full]=(types[tid-1],keys[ki])
            p+=ss
    o+=s
for k,v in want.items(): print(hex(k),v)
