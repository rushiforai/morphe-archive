"""Read JVM declaration tables for platform inheritance resolution (no execution)."""
from zipfile import ZipFile
from struct import unpack_from

def read_class(b):
    pos=8
    def u(n):
        nonlocal pos
        r=int.from_bytes(b[pos:pos+n],'big');pos+=n;return r
    count=u(2);cp=[None]*count;i=1
    while i<count:
        tag=u(1)
        if tag==1:
            l=u(2);cp[i]=b[pos:pos+l].decode('utf8','replace');pos+=l
        elif tag in (7,8,16,19,20):cp[i]=u(2)
        elif tag in (9,10,11,12,17,18,3,4):pos+=4
        elif tag in (5,6):pos+=8;i+=1
        elif tag==15:pos+=3
        else:raise ValueError(tag)
        i+=1
    def desc(i):return 'L'+cp[cp[i]]+';'
    u(2);self=desc(u(2));superclass=u(2);parents=[desc(superclass)] if superclass else []
    parents.extend(desc(u(2)) for _ in range(u(2)))
    members=set()
    for fields in [True,False]:
        for _ in range(u(2)):
            u(2);name=cp[u(2)];signature=cp[u(2)];members.add(name+(':' if fields else '')+signature)
            for _ in range(u(2)):u(2);n=u(4);pos+=n
    return self,(parents,members)
def read_android(path):
    with ZipFile(path) as z:return dict(read_class(z.read(n)) for n in z.namelist() if n.endswith('.class') and not n.startswith('META-INF/'))
