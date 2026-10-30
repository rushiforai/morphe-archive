"""Real OSB Android caller paths with explicit Android/HTTP/TCF boundaries.

No network or permission requests are performed. TCF parsing remains the shipped
SDK call; its version/invalid-result protocol is modelled here, not a grant.
"""
import re
import json
from brabant_smali import canonical
from rtl_vm import Reference, VmThrown, execute, is_zero
from tvgids_android_vm import AdViewFixture
from tvgids_osb_contracts import OSB_CONTRACTS
from verify_dumpert import absolute_registers, audit_call

OSB='Ljz3;'
QUEUE='Lxs8;'
CHANNEL='Lda;'
METHOD='onMethodCall(Lin3;Lln3;)V'
TCF='Ljp5;'


class OsbFixture(AdViewFixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.rows.update({r[:2]:r for r in OSB_CONTRACTS})
        self.native.update({key for key in self.rows if key[0]==OSB})
        self.native.add(('Lyn8;','<init>(Landroid/content/Context;Lio0;)V'))
        self.native.add(('Lug0;','p(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V'))
        self.native.update({(CHANNEL,METHOD),('Lz72;','<init>(Landroid/content/Context;)V'),
                            ('Lqc0;','run()V'),('Lqc0;','<init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V'),
                            ('Lgz3;','run()V'),('Lgz3;','<init>(Ljz3;I)V'),
                            (QUEUE,'i()V'),(QUEUE,'k(Ljava/lang/String;Ljava/lang/String;)V')})
        self.osb_calls=[];self.prefs={};self.adid='fixture-advertising-id'
        self.stops={};self.context=self.new('Landroid/content/Context;')
        self.location_manager=self.new('Landroid/location/LocationManager;')
        self.memory.statics['Landroidx/lifecycle/ProcessLifecycleOwner;->i:Landroidx/lifecycle/ProcessLifecycleOwner;']=self.new('Landroidx/lifecycle/ProcessLifecycleOwner;',{'Landroidx/lifecycle/ProcessLifecycleOwner;->f:Lyb3;':self.new('Lyb3;')})
        self.memory.statics['Lxu4;->a:I']=0
        self.memory.statics['Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;']=self.new('Ljava/util/Locale;')

    def run(self,owner,signature,args):
        assert (owner,signature) in self.rows
        body=self.source.body(owner,signature);local=int(re.search(r'\.locals (\d+)',body)[1])
        p=canonical(body).program;p.instructions=[absolute_registers(l,local) for l in p.instructions]
        registers={'v'+str(local+i):v for i,v in enumerate(args)}
        def trace(line):
            self.last_instruction=(owner,signature,line)
            audit_call(line,owner,self.declarations,self.sdk)
        return execute(p,registers,self.invoke,stop_at=self.stops.get((owner,signature),()),memory=self.memory,trace=trace)

    def invoke(self,target,args):
        owner,sig=target.split('->',1)
        if target=='Ljava/util/UUID;->randomUUID()Ljava/util/UUID;':
            self.osb_calls.append(('uuid',));return Reference('01234567-fixture-uuid','Ljava/util/UUID;')
        if target=='Ljava/util/UUID;->toString()Ljava/lang/String;':return args[0].value
        if target=='Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z':return int(is_zero(args[0]) or args[0]=='')
        if target=='Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;':return args[1] % tuple(x.value if isinstance(x,Reference) else x for x in args[2].value)
        if target=='Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;':return args[0] % tuple(args[1].value)
        if target=='Ljava/lang/String;->substring(II)Ljava/lang/String;':return args[0][args[1]:args[2]]
        if target=='Lorg/json/JSONObject;->toString()Ljava/lang/String;':return json.dumps(args[0].value,separators=(',',':'))
        if target=='Ljava/lang/Object;->equals(Ljava/lang/Object;)Z':
            if is_zero(args[0]):raise VmThrown(self.new('Ljava/lang/NullPointerException;'))
            return int(args[0]==args[1])
        if target=='Ljava/lang/String;->isEmpty()Z':return int(not args[0])
        if target=='Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;':return args[0]+args[1]
        if owner=='Ljava/lang/StringBuilder;':
            if sig.startswith('<init>('):args[0].value=[str(args[1])] if len(args)>1 else [];return None
            if sig.startswith('append('):args[0].value.append(str(args[1]));return args[0]
            if sig=='toString()Ljava/lang/String;':return ''.join(args[0].value)
        if owner in ('Ljava/util/HashMap;','Ljava/util/Hashtable;') and sig.startswith('<init>('):
            args[0].value=dict(args[1].value) if len(args)>1 else {};return None
        if owner in ('Ljava/util/ArrayList;','Ljava/util/LinkedList;','Ljava/util/HashSet;') and sig.startswith('<init>('):
            args[0].value=list(args[1].value) if len(args)>1 else [];return None
        if owner in ('Ljava/util/HashMap;','Ljava/util/Map;') and sig.startswith('put('):
            old=args[0].value.get(args[1],0);args[0].value[args[1]]=args[2];return old
        if owner in ('Ljava/util/HashMap;','Ljava/util/Map;') and sig.startswith('get('):return args[0].value.get(args[1],0)
        if target=='Liz3;->p(I)Ljava/lang/String;':return 'fixture-event-'+str(args[0])
        if owner=='Ljava/util/ArrayList;' and sig.startswith('add('):args[0].value.append(args[1]);return 1
        if target in ('Ljava/util/LinkedList;->clear()V','Ljava/util/ArrayList;->clear()V'):args[0].value.clear();return None
        if target=='Ljava/util/AbstractCollection;->isEmpty()Z':return int(not args[0].value)
        if target=='Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;':return args[0].value.pop(0)
        if target=='Ljava/util/Set;->size()I':return len(args[0].value)
        if target=='Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;':
            args[1].value[:]=args[0].value;return args[1]
        if target=='Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V':args[0].value={'runnable':args[1]};return None
        if target=='Ljava/lang/Thread;->start()V':self.osb_calls.append(('thread',args[0].value['runnable']));return None
        if owner=='Landroid/util/Log;' or target=='Lbt;->o(Ljava/lang/String;)V':return 0
        if target=='Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;':
            if args[1]=='location':self.osb_calls.append(('location-manager',));return self.location_manager
            assert args[1]=='connectivity';return self.new('Landroid/net/ConnectivityManager;')
        if target=='Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;':return self.new('Landroid/net/NetworkInfo;')
        if target=='Landroid/net/NetworkInfo;->isConnected()Z':return 1
        if target=='Landroid/net/NetworkInfo;->getType()I':return 1
        if target=='Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z':return 1
        if target=='Lgo2;->e(Landroid/content/Context;Ljava/lang/String;)I':return 0
        if owner=='Landroid/location/LocationManager;' and sig.startswith('requestLocationUpdates('):
            self.osb_calls.append(('location-updates',args[1]));return None
        if target=='Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;':
            self.osb_calls.append(('location-read',args[1]));return 0
        if target=='Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V':
            self.osb_calls.append(('location-stop',));return None
        if target=='Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;':
            self.osb_calls.append(('adid',));return Reference(self.adid,'Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;') if self.adid else 0
        if target=='Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;':return args[0].value
        if target=='Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;':return self.new('Landroid/content/ContentResolver;')
        if target=='Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;':
            assert args[1]=='android_id';self.osb_calls.append(('android-id',));return 'fixture-android-id'
        if target=='Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;':
            return Reference(self.prefs.setdefault(args[1],{}),'Landroid/content/SharedPreferences;')
        if owner=='Landroid/content/SharedPreferences;' and sig.startswith('get'):
            self.osb_calls.append(('preference-read',args[1]));return args[0].value.get(args[1],args[2])
        if owner=='Landroid/content/SharedPreferences;' and sig=='edit()Landroid/content/SharedPreferences$Editor;':
            return Reference(args[0].value,'Landroid/content/SharedPreferences$Editor;')
        if owner=='Landroid/content/SharedPreferences$Editor;':
            if sig.startswith('put'):args[0].value[args[1]]=args[2];return args[0]
            if sig.startswith('remove('):args[0].value.pop(args[1],None);return args[0]
            if sig in ('apply()V','commit()Z'):return 1
        if target=='Lin3;->a(Ljava/lang/String;)Ljava/lang/Object;':return args[0].value.get('args',{}).get(args[1],0)
        if target=='Ljw1;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V':
            args[0].value['results'].append(('error',*args[1:]));return None
        if target==TCF+'->g(Ljava/lang/String;[Luz0;)Ljp5;':
            self.osb_calls.append(('decode-consent',args[0]));assert args[0] in ('fixture-valid','fixture-old','fixture-invalid')
            if args[0]=='fixture-invalid':raise VmThrown(self.new('Ljava/lang/IllegalArgumentException;'))
            return Reference(3 if args[0]=='fixture-valid' else 1,TCF)
        if target==TCF+'->h()I':return args[0].value
        if target=='Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;':return Reference(bool(args[0]),'Ljava/lang/Boolean;')
        if target=='Lyb3;->a(Lvb3;)V':self.osb_calls.append(('lifecycle-registration',args[1]));return None
        if target=='Lug8;->c(Lmn8;Lgn8;Ldf8;)V':self.osb_calls.append(('functional-merged-callback',*args));return None
        # Explicit OkHttp request/response boundary; no actual network is used.
        if target=='Ljava/lang/System;->currentTimeMillis()J':return 1000
        if target=='Le04;-><init>()V':return None
        if target=='Llx0;->l(Ljava/lang/String;Lik3;)Lwu4;':return Reference(args[0],'Lwu4;')
        if target=='Ltu4;-><init>()V':
            args[0].value={'Ltu4;->c:Lrx4;':self.new('Lrx4;')};return None
        if target=='Ltu4;->c(Ljava/lang/String;)V':args[0].value['url']=args[1];return None
        if target=='Ltu4;->b(Ljava/lang/String;Lxu4;)V':args[0].value.update(method=args[1],body=args[2].value);return None
        if owner=='Lbx2;' and sig.startswith(('r(','s(','e(')):return None
        if target=='Luu4;-><init>(Ltu4;)V':args[0].value=dict(args[1].value);return None
        if target=='Lno4;-><init>(Le04;Luu4;)V':args[0].value=args[2].value;return None
        if target=='Lno4;->e()Lrv4;':
            self.osb_calls.append(('http',dict(args[0].value)))
            return self.new('Lrv4;',{'Lrv4;->d:I':200,'Lrv4;->g:Ltv4;':0})
        return super().invoke(target,args)

    def state(self):
        state=self.new(OSB);self.run(OSB,'<init>()V',(state,))
        config=state.value[OSB+'->a:Lio0;']
        config.value.update({'Lio0;->b:Ljava/lang/Object;':'fixture-publisher','Lio0;->c:Ljava/lang/Object;':'https://privacy.fixture.invalid','Lio0;->d:Ljava/lang/Object;':'fixture-site'})
        state.value[OSB+'->d:Landroid/content/Context;']=self.context
        state.value[OSB+'->e:Z']=1
        queue=self.new(QUEUE,{QUEUE+'->a:Ljava/lang/Object;':self.context,QUEUE+'->b:Z':1,
                             QUEUE+'->c:Ljava/lang/Object;':Reference([],'Ljava/util/LinkedList;'),
                             QUEUE+'->d:Ljava/lang/Object;':'fixture-user-agent',QUEUE+'->e:Ljava/lang/Object;':self.new('Lik3;')})
        state.value[OSB+'->c:Lxs8;']=queue
        self.memory.statics[OSB+'->j:'+OSB]=state
        return state,queue

    def channel(self,state,name,args=None):
        plugin=self.new('Lyn8;',{'Lyn8;->b:Ljava/lang/Object;':state})
        channel=self.new(CHANNEL,{CHANNEL+'->b:Ljava/lang/Object;':plugin,CHANNEL+'->c:Ljava/lang/Object;':self.new('Lnl/tvgids/MainActivity;')})
        method=self.new('Lin3;',{'Lin3;->a:Ljava/lang/String;':name,'Lin3;->b:Ljava/lang/Object;':Reference(args or {},'Ljava/util/HashMap;'),'args':args or {}})
        self.current_channel=name
        response=self.new('Ljw1;',{'results':[]});self.run(CHANNEL,METHOD,(channel,method,response));return response.value['results']


def verify_osb(f,disabled,group=None):
    failures=[]
    def check(ok,message):
        if not ok:failures.append(message)
    state,queue=f.state()
    if group in (None,'ids'):
        check(state.value[OSB+'->g:Ljava/lang/String;']==('' if disabled else '01234567'),'new session identifier')
        f.osb_calls=[];adid=f.run(OSB,'d()Ljava/lang/String;',(state,))
        check(adid==(0 if disabled else f.adid),'advertising identifier return')
        check(f.osb_calls==([] if disabled else [('adid',)]),'advertising identifier query')
    if group in (None,'events'):
        for code in (1,3,6,7,9,10):
            f.osb_calls=[];props=Reference({'fixture':'value'},'Ljava/util/HashMap;')
            f.run(OSB,'g(ILjava/util/Map;)V',(state,code,props))
            check(not any(x[0]=='thread' for x in f.osb_calls) if disabled else any(x[0]=='thread' for x in f.osb_calls),'foreground event job '+str(code))
        for sig,args in [('i(ILjava/util/Map;)V',(state,3,Reference({'fixture':'context'},'Ljava/util/HashMap;'))),
                         ('h(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V',(state,'fixture-category','fixture-action',Reference({},'Ljava/util/HashMap;')))]:
            before=dict(state.value[OSB+'->h:Ljava/util/HashMap;'].value);supplied=dict(args[-1].value);f.osb_calls=[];f.run(OSB,sig,args)
            if disabled:check(state.value[OSB+'->h:Ljava/util/HashMap;'].value==before and args[-1].value==supplied and not f.osb_calls,'context or page admission')
    if group in (None,'location'):
        state.value[OSB+'->b:Lz72;']=0;f.osb_calls=[];f.run(OSB,'k()V',(state,))
        check(not f.osb_calls if disabled else any(x[0]=='location-updates' for x in f.osb_calls),'GPS admission')
        f.osb_calls=[];f.run(OSB,'onResume(Lwb3;)V',(state,f.new('Lwb3;')))
        check(not f.osb_calls if disabled else any(x[0]=='thread' for x in f.osb_calls),'resume queue job')
        # A pre-existing listener is still detached by the untouched pause path.
        listener=f.new('Lz72;',{'Lz72;->f:Landroid/location/LocationManager;':f.location_manager})
        state.value[OSB+'->b:Lz72;']=listener;f.osb_calls=[]
        f.run(OSB,'onPause(Lwb3;)V',(state,f.new('Lwb3;')))
        check(('location-stop',) in f.osb_calls and listener.value['Lz72;->f:Landroid/location/LocationManager;']==0,'pause cleanup')
    if group in (None,'queue'):
        item=f.new('Lup;',{'Lup;->a:Lorg/json/JSONObject;':Reference({},'Lorg/json/JSONObject;'),'Lup;->b:Ljava/lang/String;':'https://fixture.invalid/metrics'})
        queue.value[QUEUE+'->c:Ljava/lang/Object;'].value=[item,item];queue.value[QUEUE+'->b:Z']=1;f.osb_calls=[]
        f.run(QUEUE,'i()V',(queue,))
        check(not any(x[0]=='http' for x in f.osb_calls) if disabled else any(x[0]=='http' for x in f.osb_calls),'queued upload')
        check(len(queue.value[QUEUE+'->c:Ljava/lang/Object;'].value)==(0 if disabled else 1),'queued records disposition')
        f.osb_calls=[];f.run(QUEUE,'k(Ljava/lang/String;Ljava/lang/String;)V',(queue,'https://fixture.invalid/direct','{}'))
        check(not f.osb_calls if disabled else any(x[0]=='http' for x in f.osb_calls),'final HTTP transport')
    if group in (None,'late'):
        event=f.new('Lpj1;',{'Lpj1;->a:I':3})
        runnable=f.new('Lqc0;');f.run('Lqc0;','<init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V',
                                     (runnable,state,event,'fixture-session',Reference({},'Ljava/util/HashMap;'),1))
        code=canonical(f.source.body('Lqc0;','run()V')).code
        stop=next(i for i,l in enumerate(code) if 'Settings$Secure;->getString' in l)+2
        f.stops['Lqc0;','run()V']=(stop,);f.osb_calls=[];f.run('Lqc0;','run()V',(runnable,));f.stops.clear()
        check(not f.osb_calls if disabled else any(x[0]=='android-id' for x in f.osb_calls),'late event identifier reads')
        args=[f.new(t) for t in ('Lmn8;','Lgn8;','Ldf8;')]
        holder=f.new('Lor7;',{'Lor7;->e:Ljava/lang/Object;':0})
        callback=f.new('Lqc0;');f.run('Lqc0;','<init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V',
                                   (callback,args[2],holder,args[0],args[1],6))
        f.osb_calls=[];f.run('Lqc0;','run()V',(callback,))
        check(f.osb_calls==[('functional-merged-callback',*args)],'unrelated merged callback changed')
        lifecycle=f.new('Lgz3;');f.run('Lgz3;','<init>(Ljz3;I)V',(lifecycle,state,1))
        f.osb_calls=[];f.run('Lgz3;','run()V',(lifecycle,))
        check(f.osb_calls==[('lifecycle-registration',state)],'native OSB lifecycle registration lost')
        late=f.new('Lgz3;');f.run('Lgz3;','<init>(Ljz3;I)V',(late,state,0))
        f.osb_calls=[];f.run('Lgz3;','run()V',(late,))
        check(not any(x[0]=='http' for x in f.osb_calls) if disabled else True,'late resume uploader')
        if disabled:check(queue.value[QUEUE+'->b:Z']==0,'late resume re-enabled queue')
    if group in (None,'channel'):
        for name in ('sendPageView','sendEvent','sendViewableImpression','sendAggregateEvent','emptySet','setIds'):
            f.osb_calls=[];reply=f.channel(state,name,{'pageName':'fixture-page','page':'fixture-page','screenName':'fixture-screen','className':'fixture-class','category':'fixture-category','action':'fixture-action','label':'fixture-label','scope':'fixture-scope','name':'fixture-name','value':Reference(1.5,'Ljava/lang/Double;'),'data':Reference({},'Ljava/util/HashMap;')})
            check(len(reply)==1 and reply[0][0]=='success','channel completion '+name)
        check(is_zero(state.value[OSB+'->i:Ljava/util/ArrayList;']) or not state.value[OSB+'->i:Ljava/util/ArrayList;'].value if disabled else True,'setIds retained user identifiers')
        for cached in (None,'fixture-cached-id'):
            for gaid in (None,'fixture-gaid'):
                prefs=f.prefs.setdefault('osb-shared-preferences',{});prefs.clear()
                if cached:prefs['osb-cduid']=cached
                f.adid=gaid;f.osb_calls=[];reply=f.channel(state,'getConsentWebviewURL')
                check(len(reply)==(1 if disabled else 2) and reply[0][0]=='success','manual CMP completion')
                url=reply[0][1]
                check(url.endswith('&cduid=') if disabled else url.endswith(cached or gaid or 'fixture-android-id'),'manual CMP identifier')
                if disabled:check(not any(x[0] in ('adid','android-id') or (x[0]=='preference-read' and x[1]=='osb-cduid') for x in f.osb_calls),'manual CMP ID lookup')
        f.prefs['osb-shared-preferences']['osb-remote-cmp']=2
        for value,expected in [('fixture-valid',True),('fixture-old',False),('fixture-invalid',False)]:
            reply=f.channel(state,'isIABConsentValid',{'tcString':value})
            check(len(reply)==1 and reply[0][0]=='success' and reply[0][1].value==expected,'genuine validity comparison '+value)
        reply=f.channel(state,'isIABConsentValid');check(len(reply)==1 and reply[0][0]=='error','missing consent error')
    assert not failures,'OSB policies failed: '+', '.join(failures)
    print('PASS TVgids OSB '+(group or 'all')+' native paths')
