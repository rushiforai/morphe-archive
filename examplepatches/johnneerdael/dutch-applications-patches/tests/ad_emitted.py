"""Small strict interpreter for generated AD DTO filters, not a second policy."""
from verify_ad import code
from verify_weerplaza import smali_string
from ad_contracts import OWNER, TYPE


def obj(typ, **fields):
    return {'type': 'L'+typ+';', **fields}


def evaluate(root, sig, args):
    registers = {'p'+str(i): v for i,v in enumerate(args)}
    lines = code(root, OWNER, sig)
    result, pc = None, 0
    def names(value):
        if ' .. ' in value:
            a,b=value.split(' .. '); return [a[0]+str(n) for n in range(int(a[1:]),int(b[1:])+1)]
        return value.split(', ') if value else []
    for _ in range(10000):
        line=lines[pc];pc+=1
        if line.startswith('const-string '):
            dst,value=line.split(' ',1)[1].split(', ',1);registers[dst]=smali_string(value)
        elif line.startswith(('const/4 ','const/16 ')):
            dst,value=line.split(' ',1)[1].split(', ');registers[dst]=int(value,16)
        elif line.startswith('move-result'):
            registers[line.split()[1]]=result
        elif line.startswith(('move-object ','move-object/from16 ')):
            dst,src=line.split(' ',1)[1].split(', ');registers[dst]=registers[src]
        elif line.startswith('check-cast '): pass
        elif line.startswith('new-instance '):
            dst,typ=line.split(' ',1)[1].split(', ');registers[dst]=[] if typ=='Ljava/util/ArrayList;' else obj(typ[1:-1])
        elif line.startswith('instance-of '):
            dst,src,typ=line.split(' ',1)[1].split(', ');value=registers[src];registers[dst]=isinstance(value,dict) and value.get('type')==typ
        elif line.startswith(('iget-object ','iget-boolean ')):
            dst,src,ref=line.split(' ',1)[1].split(', ');registers[dst]=registers[src].get(ref.split('->')[1].split(':')[0])
        elif line.startswith('invoke-'):
            n=line.split('{',1)[1].split('}')[0];v=[registers[k] for k in names(n)];ref=line.split('}, ',1)[1]
            if ref.startswith(TYPE+'->morphe'):result=evaluate(root,ref.split('->')[1],v)
            elif 'ArrayList;-><init>' in ref: pass
            elif 'MediaOverlayComponent$Properties;-><init>' in ref:
                v[0].update({k:(None if value==0 else value) for k,value in zip(['a','b','c','d'],v[1:])})
            elif 'MediaOverlayComponent;-><init>' in ref:v[0].update(c=v[1],d=v[2])
            elif '->isAdvertorial()Z' in ref:result=v[0].get('advertorial',False)
            elif 'String;->equalsIgnoreCase' in ref:result=isinstance(v[1],str) and v[0].lower()==v[1].lower()
            elif '->iterator()' in ref:result=iter(v[0])
            elif '->hasNext()Z' in ref:
                # A buffered iterator models the actual Java iterator protocol.
                if isinstance(v[0],dict):
                    result=v[0]['index']<len(v[0]['list'])
                else:
                    remaining=list(v[0]);v[0]={'list':remaining,'index':0};registers[n]=v[0];result=bool(remaining)
            elif '->next()' in ref:result=v[0]['list'][v[0]['index']];v[0]['index']+=1
            elif '->add(' in ref:v[0].append(v[1]);result=True
            elif '->isEmpty()Z' in ref:result=not v[0]
            elif '->size()I' in ref:result=len(v[0])
            elif '->remove(I)' in ref:result=v[0].pop(v[1])
            else:raise AssertionError('Unsupported emitted AD call: '+line)
        elif line.startswith(('if-eqz ','if-nez ')):
            op,reg,target=line.replace(',','').split()
            value=registers[reg]
            nonzero=(value is not None and value != 0) if isinstance(value,(type(None),int,bool)) else True
            if nonzero==(op=='if-nez'):pc=int(target[1:])
        elif line.startswith(('if-eq ','if-ne ')):
            op,left,right,target=line.replace(',','').split()
            a,b=registers[left],registers[right]
            equal=(a is b) if isinstance(a,(dict,list)) or isinstance(b,(dict,list)) else (a==b or a in (0,None) and b in (0,None))
            if equal==(op=='if-eq'):pc=int(target[1:])
        elif line.startswith('goto'):pc=int(line.split('@')[1])
        elif line.startswith('return-object ') or line.startswith('return '):return registers[line.split()[1]]
        else:raise AssertionError('Unsupported emitted AD instruction: '+line)
    raise AssertionError('AD helper did not terminate: '+sig)
