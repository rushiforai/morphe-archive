"""APK-bound Marktplaats instructions; explicit platform/stdlib boundaries only."""
import re
from brabant_smali import canonical
from marktplaats_contracts import CONTRACTS
from rtl_vm import Memory,Reference,VmThrown,execute,is_zero
from verify_dumpert import absolute_registers,audit_call

RESPONSE='Lcom/horizon/android/feature/search/search/model/FlexibleSearchResponse;'
REQUEST='Lcom/horizon/android/feature/search/search/api/LrpItemsRequest;'
ITEM='Lcom/horizon/android/core/datamodel/search/SearchResultItem;'
TYPE='Lcom/horizon/android/core/datamodel/search/SearchResultItemType;'
ORDER='Lcom/horizon/android/feature/vip/contentorder/VipContentOrder;'
SECTION='Lcom/horizon/android/feature/vip/VipContentSection;'
LIST='Ljava/util/List;'


class Fixture:
    def __init__(self,source,declarations,sdk):
        self.source,self.declarations,self.sdk=source,declarations,sdk
        self.rows={tuple(r[:2]):r for r in getattr(source,"contracts",CONTRACTS)};self.programs={};self.statics={};self.events=[]
        self.memory=Memory(self.parents);self.memory.statics=self.statics
        owners={RESPONSE,REQUEST,ITEM,TYPE,ORDER,SECTION}
        self.native={key for key in self.rows if key[0] in owners}
        self.native.add(('Lf23;','j([Ljava/lang/Object;)Ljava/util/List;'))
        self.statics['Lkotlin/collections/EmptyList;->INSTANCE:Lkotlin/collections/EmptyList;']=Reference([],'Lkotlin/collections/EmptyList;')
        self.statics['Lcom/horizon/android/HorizonApplication;->f:I']=0
        self.statics['Li41;->a:Li41;']=self.new('Li41;')
        for name,value in [('FALSE',False),('TRUE',True)]:
            self.statics['Ljava/lang/Boolean;->'+name+':Ljava/lang/Boolean;']=Reference(value,'Ljava/lang/Boolean;')
        for owner in owners:
            for sig,m in declarations.classes[owner].methods.items():
                if not sig.startswith('morphe'):continue
                body=source.body(owner,sig);local=int(re.search(r'\.locals (\d+)',body)[1])
                assert m.access_flags==9 and local==5,'Marktplaats policy helper ABI changed'
                self.rows[owner,sig]=(owner,sig,9,local,0,'');self.native.add((owner,sig))
        for owner in (TYPE,SECTION,ORDER):self.run(owner,'<clinit>()V')

    def parents(self,owner):
        if owner in self.declarations.classes:
            c=self.declarations.classes[owner];return tuple(x for x in (c.superclass,*c.interfaces) if x)
        c=self.sdk(owner);assert c,'Missing Marktplaats platform type: '+owner
        return tuple(x for x in (c[1],*self.sdk.interfaces(owner)) if x)

    def defaults(self,value):
        owner=value.descriptor
        while owner in self.declarations.classes:
            for line in self.source.text(owner).splitlines():
                if not line.startswith('.field ') or 'static' in line.split():continue
                m=re.search(r' ([^ ]+):([^ ]+)(?: |$)',line);assert m
                value.value.setdefault(owner+'->'+m[1]+':'+m[2],0)
            owner=self.declarations.classes[owner].superclass
        return value

    def new(self,owner,fields=None):
        value=self.defaults(Reference({},owner));value.value.update(fields or {});return value

    def program(self,owner,sig):
        key=owner,sig
        if key not in self.programs:
            assert key in self.rows,'Unpinned Marktplaats execution: '+str(key)
            value=canonical(self.source.body(owner,sig));local=self.rows[key][3]
            value.program.instructions=[absolute_registers(line,local) for line in value.program.instructions]
            self.programs[key]=value.program
        return self.programs[key]

    def run(self,owner,sig,args=(),start=0,stop_at=(),registers=None):
        local=self.rows[owner,sig][3];frame={'v'+str(local+i):value for i,value in enumerate(args)};frame.update(registers or {})
        kind=''
        def trace(line):
            nonlocal kind
            kind=line.split(' ',1)[0];audit_call(line,owner,self.declarations,self.sdk)
        def invoke(target,values):
            callee,signature=target.split('->',1)
            # A super/direct/static call resolves its named owner. Redispatching
            # super on the receiver would recurse into the overriding method.
            if kind.startswith(('invoke-super','invoke-direct','invoke-static')) and (callee,signature) in self.native:
                return self.run(callee,signature,values)[0]
            return self.invoke(target,values)
        result=execute(self.program(owner,sig),frame,invoke,start=start,stop_at=stop_at,memory=self.memory,trace=trace)
        return result,frame

    def enum(self,owner,name):return self.statics[owner+'->'+name+':'+owner]

    def invoke(self,target,args):
        owner,sig=target.split('->',1)
        if not sig.startswith('<') and args and isinstance(args[0],Reference) and (args[0].descriptor,sig) in self.native:
            return self.run(args[0].descriptor,sig,args)[0]
        if (owner,sig) in self.native:return self.run(owner,sig,args)[0]
        if target=='Ljava/lang/Object;-><init>()V':self.defaults(args[0]);return None
        if target=='Ljava/lang/Object;->getClass()Ljava/lang/Class;':
            if is_zero(args[0]):raise VmThrown(Reference({},'Ljava/lang/NullPointerException;'))
            return Reference({},'Ljava/lang/Class;')
        if target=='Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V':
            self.defaults(args[0]);args[0].value.update({'fixture-name':args[1],'fixture-ordinal':args[2]});return None
        if target=='Ljava/lang/Enum;->ordinal()I':return args[0].value['fixture-ordinal']
        if target=='Ljava/lang/Enum;->name()Ljava/lang/String;':return args[0].value['fixture-name']
        if target=='Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;':
            return Reference({'fixture-values':args[0]},'Lkotlin/enums/EnumEntriesList;')
        if target=='Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;':
            # Platform list view; no fixture operation mutates its backing array.
            return Reference(list(args[0].value),'Ljava/util/ArrayList;')
        if target=='Ljava/lang/String;->equals(Ljava/lang/Object;)Z':return int(args[0]==args[1])
        if target=='Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;':return Reference(bool(args[0]),'Ljava/lang/Boolean;')
        if target=='Ljava/util/ArrayList;-><init>()V':args[0].value=[];return None
        if target in {'Ljava/util/List;->iterator()Ljava/util/Iterator;','Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;'}:
            return Reference({'iterator':iter(args[0].value)},'Ljava/util/Iterator;')
        if target=='Ljava/util/Iterator;->hasNext()Z':
            if 'next' not in args[0].value:
                try:args[0].value['next']=next(args[0].value['iterator'])
                except StopIteration:return 0
            return 1
        if target=='Ljava/util/Iterator;->next()Ljava/lang/Object;':return args[0].value.pop('next')
        if target in {'Ljava/util/List;->size()I','Ljava/util/ArrayList;->size()I'}:return len(args[0].value)
        if target=='Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z':args[0].value.append(args[1]);return 1
        if target=='Lj3k;->b()Landroid/content/Context;':return self.new('Lcom/horizon/android/HorizonApplication;')
        if target=='Landroid/content/Context;->getString(I)Ljava/lang/String;':return 'fixture-resource'
        raise AssertionError('Unmodeled Marktplaats boundary: '+target)
