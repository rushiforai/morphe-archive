"""Execute pinned 9292 instructions; model only explicit platform/SDK boundaries."""
import re
from decimal import Decimal,ROUND_HALF_EVEN
from brabant_smali import canonical
from rtl_vm import Memory,Reference,VmThrown,execute,is_zero
from verify_dumpert import absolute_registers,audit_call
from n9292_contracts import CONTRACTS

CONFIG='Lj0a;'
DELEGATE='Lmq;'
BOOL='b(Ljava/lang/String;)Z'
GET='g(Ljl6;Ljava/lang/Object;)Ljava/lang/Object;'
LOCATION='Lx43;'
LOCATE='a(Lq43;Lez2;)Ljava/lang/Object;'
CONT='Lw43;'
LATLNG='Lcom/google/android/gms/maps/model/LatLng;'


class Fixture:
    def __init__(self,source,declarations,sdk):
        self.source,self.declarations,self.sdk=source,declarations,sdk
        self.rows={r[:2]:r for r in CONTRACTS};self.programs={};self.events=[];self.statics={}
        self.memory=Memory(self.parents);self.memory.statics=self.statics
        self.native={(CONFIG,BOOL),(DELEGATE,GET),('Lxr2;','<clinit>()V')}
        self.run('Lxr2;','<clinit>()V')
        self.native.update({(LOCATION,LOCATE),(LOCATION,'c(Lt43;Z)Lt43;'),
            (CONT,'<init>(Lx43;Lez2;)V'),(CONT,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'),
            ('Lt43;','<init>(Landroid/location/Location;)V'),('Lt43;','a()'+LATLNG),
            ('Lr43;','<init>(Ljava/lang/Throwable;)V'),('Lc63;','c0(Ljava/lang/Object;)V'),('Lj6e;','v(DI)D')})
        self.native.add(('Lbl9;','<init>(Lzk9;Lal9;Z)V'))
        self.suspended=Reference({},'Lq13;');self.statics['Lq13;->COROUTINE_SUSPENDED:Lq13;']=self.suspended
        self.statics['Lv43;->a:[I']=Reference([1,2],'[I')
        self.statics['Lu29;->Location:Lu29;']=self.new('Lu29;')
        self.statics['Lin4;->Companion:Lhn4;']=self.new('Lhn4;')
        self.statics['Lin4;->None:Lin4;']=self.new('Lin4;')
        self.statics['Lyv3;->u:[Ljl6;']=Reference([self.new('Ljl6;') for _ in range(6)],'[Ljl6;')
        self.statics[CONFIG+'->n:[Ljl6;']=Reference([self.new('Ljl6;') for _ in range(20)],'[Ljl6;')
        mode='Lcom/pubmatic/sdk/common/models/POBLocation$Source;'
        self.statics[mode+'->GPS:'+mode]=self.new(mode)
        self.statics['Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;']=Reference('HALF_EVEN','Ljava/math/RoundingMode;')
        self.statics['Lo43;->d:Lo43;']=self.new('Lo43;')
        self.location_reply=0;self.location_wait=False;self.saved_location=None

    def parents(self,owner):
        if owner in self.declarations.classes:
            c=self.declarations.classes[owner];return tuple(x for x in (c.superclass,*c.interfaces) if x)
        c=self.sdk(owner);assert c,'Missing9292 platform type: '+owner
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
            assert key in self.rows,'Unpinned9292 execution: '+str(key)
            value=canonical(self.source.body(owner,sig))
            value.program.instructions=[absolute_registers(l,self.rows[key][3]) for l in value.program.instructions]
            self.programs[key]=value.program
        return self.programs[key]

    def run(self,owner,sig,args=(),start=0,stop_at=(),registers=None):
        local=self.rows[owner,sig][3];frame={'v'+str(local+i):v for i,v in enumerate(args)};frame.update(registers or {})
        value=execute(self.program(owner,sig),frame,self.invoke,start=start,stop_at=stop_at,memory=self.memory,
                      trace=lambda line:audit_call(line,owner,self.declarations,self.sdk))
        return value,frame

    def configuration(self,fetched=None,defaults=None):
        def cache(values):
            data=0 if values is None else Reference({'Lrr2;->b:Lorg/json/JSONObject;':Reference(dict(values),'Lorg/json/JSONObject;')},'Lrr2;')
            return self.new('Lpr2;',{'fixture':data})
        getter=self.new('Lxr2;',{'Lxr2;->c:Lpr2;':cache(fetched),'Lxr2;->d:Lpr2;':cache(defaults)})
        remote=self.new('Lls4;',{'Lls4;->h:Lxr2;':getter})
        config=self.new(CONFIG,{CONFIG+'->a:Lls4;':remote})
        for field,key in [('e','disable_ads_android'),('f','disable_station_ads'),('g','sovendus_android')]:
            config.value[CONFIG+'->'+field+':Lmq;']=self.new(DELEGATE,{DELEGATE+'->b:Ljava/lang/Object;':config,DELEGATE+'->c:Ljava/lang/Object;':key})
        return config

    def location_service(self):
        preferences=self.new('Lyv3;',{'Lyv3;->l:Le6;':self.new('Le6;')})
        return self.new(LOCATION,{LOCATION+'->a:Lq6b;':self.new('Lq6b;'),
            LOCATION+'->b:Lcg;':self.new('Lcg;'),LOCATION+'->c:Lyv3;':preferences})

    def invoke(self,target,args):
        owner,sig=target.split('->',1)
        if (owner,sig) in self.native:return self.run(owner,sig,args)[0]
        if target=='Ljava/lang/Object;-><init>()V':self.defaults(args[0]);return None
        if target=='Ljava/lang/Object;->getClass()Ljava/lang/Class;':
            if is_zero(args[0]):raise VmThrown(Reference({},'Ljava/lang/NullPointerException;'))
            return Reference({},'Ljava/lang/Class;')
        if target=='Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;':
            assert args[0]=='UTF-8';return Reference('UTF-8','Ljava/nio/charset/Charset;')
        if target=='Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;':
            assert args[1]==2;return Reference(re.compile(args[0],re.I),'Ljava/util/regex/Pattern;')
        if target=='Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;':
            return Reference((args[0].value,args[1]),'Ljava/util/regex/Matcher;')
        if target=='Ljava/util/regex/Matcher;->matches()Z':return int(args[0].value[0].fullmatch(args[0].value[1]) is not None)
        if target=='Ljava/lang/String;->equals(Ljava/lang/Object;)Z':return int(args[0]==args[1])
        if target=='Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;':return Reference(bool(args[0]),'Ljava/lang/Boolean;')
        if target=='Ljava/lang/Boolean;->booleanValue()Z':return int(args[0].value)
        if target=='Lpr2;->c()Lrr2;':return args[0].value['fixture']
        if target=='Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;':
            if args[1] is None or args[1] not in args[0].value:raise VmThrown(Reference({},'Lorg/json/JSONException;'))
            return args[0].value[args[1]]
        if target=='Lxr2;->a(Ljava/lang/String;Lrr2;)V':self.events.append(('config-read',args[1]));return None
        if target=='Lez2;-><init>(Lkotlin/coroutines/Continuation;)V':self.defaults(args[0]);return None
        if target=='Ljava/lang/Enum;->ordinal()I':return args[0].value['fixture-ordinal']
        if target=='Lq6b;->d(Lq6b;Landroidx/fragment/app/Fragment;Lu29;)Landroidx/lifecycle/l;':
            assert is_zero(args[1]);self.events.append(('permission-observer',args[2]));return self.new('Landroidx/lifecycle/l;')
        if owner=='Lcg;' and sig in {'p(Lw43;)Ljava/lang/Object;','o(Lw43;)Ljava/lang/Object;'}:
            self.saved_location=args[1];self.events.append(('location-request',sig[0]))
            if self.location_wait:return self.suspended
            if isinstance(self.location_reply,VmThrown):raise self.location_reply
            return self.location_reply
        if target=='Lb6;->o(Lav5;Ljl6;)Ljava/lang/Object;':return 0  # absent debug-location preference
        if owner=='Landroid/location/Location;' and sig in {'getLatitude()D','getLongitude()D'}:
            return args[0].value['latitude' if 'Latitude' in sig else 'longitude']
        if owner==LATLNG and sig=='<init>(DD)V':
            self.defaults(args[0]);args[0].value.update({LATLNG+'->a:D':args[1],LATLNG+'->b:D':args[3]});return None
        if owner==LATLNG and sig=='toString()Ljava/lang/String;':return 'fixture-latlng'
        if target=='Ljava/math/BigDecimal;-><init>(D)V':args[0].value=Decimal.from_float(args[1]);return None
        if target=='Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;':
            assert args[2].value=='HALF_EVEN';return Reference(args[0].value.quantize(Decimal(1).scaleb(-args[1]),rounding=ROUND_HALF_EVEN),'Ljava/math/BigDecimal;')
        if target=='Ljava/math/BigDecimal;->doubleValue()D':return float(args[0].value)
        if target=='Lcom/pubmatic/sdk/common/models/POBLocation;-><init>(Lcom/pubmatic/sdk/common/models/POBLocation$Source;DD)V':
            args[0].value['fixture-coordinates']=(args[2],args[4]);return None
        if target=='Lcom/pubmatic/sdk/common/OpenWrapSDK;->setLocation(Lcom/pubmatic/sdk/common/models/POBLocation;)V':
            self.events.append(('ad-location',args[0].value['fixture-coordinates']));return None
        if target=='Lnl/negentwee/services/library/current_location/CurrentLocationException;-><init>(Lp43;Ljava/lang/Exception;I)V':
            self.defaults(args[0]);args[0].value['fixture-native-arguments']=tuple(args[1:]);return None
        if target=='Lus;->l(Ljava/lang/String;)V':raise VmThrown(Reference({'message':args[0]},'Ljava/lang/IllegalStateException;'))
        if target=='Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V':
            self.events.append(('play-license-entry',args[0]));return None
        if target=='Lcom/pairip/application/Application;->attachBaseContext(Landroid/content/Context;)V':
            self.events.append(('native-super-attach',args[0],args[1]));return None
        raise AssertionError('Unmodeled9292 boundary: '+target)
