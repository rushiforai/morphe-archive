"""Execute real credential routing; Android/package/binder boundaries are explicit."""
import re
from marktplaats_consent_vm import ConsentFixture
from marktplaats_auth_contracts import AUTH_CONTRACTS
from rtl_vm import Reference

PROVIDER='Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;'
FACTORY='Lrt3;'
CONFIG='Lnsk;'
INTENTS='Lfdj;'
ACTION='com.google.android.gms.identitycredentials.service.START'
MICROG='app.revanced.android.gms'
AVAILABLE='morpheMicrogAvailable(Landroid/content/Context;)Z'
GOOGLE='morpheGoogleRequest(Ljava/lang/Object;)Z'
CHOOSE='morpheGoogleProvider(Lrt3;Ljava/lang/Object;)Lit3;'
FIELD=PROVIDER+'->morpheGoogleMicrog:Z'


class AuthFixture(ConsentFixture):
    def __init__(self,*args):
        self.auth_active=False
        super().__init__(*args)
        self.rows.update({r[:2]:r for r in AUTH_CONTRACTS})
        self.native.update({(FACTORY,'a(Lrt3;Ljava/lang/Object;)Lit3;'),
                            (INTENTS,'a(Landroid/content/Context;Lnsk;)Landroid/content/Intent;'),
                            (PROVIDER,'isAvailableOnDevice(I)Z')})
        for sig,m in self.declarations.classes[PROVIDER].methods.items():
            if sig.startswith('morphe'):
                local=int(re.search(r'\.locals (\d+)',self.source.body(PROVIDER,sig))[1])
                assert m.access_flags==9 and local==({"morpheGoogleBundle":8,"morpheGoogleOption":7}.get(sig.split("(",1)[0],4))
                self.rows[PROVIDER,sig]=(PROVIDER,sig,9,local,0,'');self.native.add((PROVIDER,sig))
        self.microg=True;self.service_enabled=True;self.exported=True;self.app_enabled=True
        self.google_available=False;self.framework_available=True;self.auth_calls=[];self.auth_active=False
        self.statics['Lcom/google/android/gms/common/GoogleApiAvailability;->e:Lcom/google/android/gms/common/GoogleApiAvailability;']=self.new('Lcom/google/android/gms/common/GoogleApiAvailability;')
        self.context=self.new('Landroid/content/Context;');self.pm=self.new('Landroid/content/pm/PackageManager;')
        self.statics['Landroid/os/Build$VERSION;->SDK_INT:I']=34
        self.original_provider=self.new(PROVIDER,{PROVIDER+'->context:Landroid/content/Context;':self.context})

    def invoke(self,target,args):
        if target=='Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;':return self.pm
        if target=='Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z':return 0
        if target=='Ljava/util/List;->get(I)Ljava/lang/Object;':return args[0].value[args[1]]
        if target==PROVIDER+'-><init>(Landroid/content/Context;)V':
            self.auth_calls.append(('construct-provider',))
            return self.run(PROVIDER,'<init>(Landroid/content/Context;)V',args)[0]
        if target=='Landroid/content/Intent;-><init>(Ljava/lang/String;)V':
            args[0].value={'action':args[1]};return None
        if target=='Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;':
            args[0].value['package']=args[1];return args[0]
        if target=='Landroid/content/Intent;-><init>()V':args[0].value={};return None
        if target=='Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;':
            args[0].value['component']=args[1];return args[0]
        if target=='Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;':
            assert args[1].value=={'action':ACTION.replace('com.google','app.revanced'),'package':MICROG} and args[2]==0
            self.auth_calls.append(('resolve-microg',))
            if not self.microg:return 0
            app=self.new('Landroid/content/pm/ApplicationInfo;',{'Landroid/content/pm/ApplicationInfo;->enabled:Z':int(self.app_enabled)})
            service=self.new('Landroid/content/pm/ServiceInfo;',{
                'Landroid/content/pm/ServiceInfo;->enabled:Z':int(self.service_enabled),
                'Landroid/content/pm/ServiceInfo;->exported:Z':int(self.exported),
                'Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;':app})
            return self.new('Landroid/content/pm/ResolveInfo;',{'Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;':service})
        if target==FACTORY+'->b()Lit3;':self.auth_calls.append(('original-provider-factory',));return self.original_provider
        if target=='Ltt3;-><init>(Landroid/content/Context;)V':return None
        if target=='Ltt3;->isAvailableOnDevice()Z':return int(self.framework_available)
        if target==PROVIDER+'->isGooglePlayServicesAvailable(Landroid/content/Context;I)I':
            self.auth_calls.append(('google-availability',args[2]));return 0 if self.google_available else 1
        if target=='Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V':return None
        if self.auth_active and target.startswith('Ljava/lang/StringBuilder;->'):
            if target.endswith('toString()Ljava/lang/String;'):return 'fixture-availability-error'
            return args[0] if 'append' in target else None
        if target=='Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I':return 0
        return super().invoke(target,args)

    def request(self,types):
        return self.new('Llj6;',{'Llj6;->a:Ljava/util/List;':Reference([self.new(t) for t in types],'Ljava/util/ArrayList;')})


def verify_auth(f,enabled):
    f.auth_active=True
    factory=f.new(FACTORY,{FACTORY+'->a:Landroid/content/Context;':f.context})
    select='a(Lrt3;Ljava/lang/Object;)Lit3;'
    # Newer Android must choose microG's app provider; older Android keeps native fallback.
    for sdk in (32,33,34,36):
        f.statics['Landroid/os/Build$VERSION;->SDK_INT:I']=sdk
        for option in ('Lik6;','Lsj6;'):
            request=f.request([option]);f.auth_calls=[]
            provider=f.run(FACTORY,select,(factory,request))[0]
            if enabled:
                assert provider.descriptor==PROVIDER and provider.value[FIELD]==1
                assert f.auth_calls==[('resolve-microg',),('construct-provider',)]
                f.auth_calls=[];assert f.run(PROVIDER,'isAvailableOnDevice(I)Z',(provider,252400000))[0]==1
                assert f.auth_calls==[('resolve-microg',)]
            else:
                assert provider.descriptor==('Ltt3;' if sdk>=34 else PROVIDER)
        # Unknown/mixed/empty requests keep original factory selection.
        for types in ([],['Lgt3;'],['Lik6;','Lsj6;']):
            provider=f.run(FACTORY,select,(factory,f.request(types)))[0]
            assert provider.descriptor==('Ltt3;' if sdk>=34 else PROVIDER)
    f.statics['Landroid/os/Build$VERSION;->SDK_INT:I']=34
    for attr in ('microg','service_enabled','exported','app_enabled'):
        setattr(f,attr,False)
        provider=f.run(FACTORY,select,(factory,f.request(['Lik6;'])))[0]
        assert provider.descriptor=='Ltt3;','Unavailable microG changed original factory'
        if enabled:
            marked=f.new(PROVIDER,{PROVIDER+'->context:Landroid/content/Context;':f.context,FIELD:1})
            assert f.run(PROVIDER,'isAvailableOnDevice(I)Z',(marked,123))[0]==0,'Stale marked provider ignored unavailable microG'
        setattr(f,attr,True)
    # Original provider instances keep Google's actual availability result.
    for available in (False,True):
        f.google_available=available;f.auth_calls=[]
        assert f.run(PROVIDER,'isAvailableOnDevice(I)Z',(f.original_provider,123))[0]==int(available)
        assert f.auth_calls==[('google-availability',123)]
    for action in (ACTION,'com.google.android.gms.maps.service.START','com.google.android.c2dm.intent.REGISTER',ACTION+'.other'):
        for installed in (False,True):
            f.microg=installed;f.auth_calls=[]
            config=f.new(CONFIG,{CONFIG+'->a:Ljava/lang/String;':action,CONFIG+'->b:Z':0})
            intent=f.run(INTENTS,'a(Landroid/content/Context;Lnsk;)Landroid/content/Intent;',(f.context,config))[0]
            routed=enabled and installed and action==ACTION
            assert intent.value=={'action':action.replace('com.google','app.revanced') if routed else action,
                                  'package':MICROG if routed else 'com.google.android.gms'}
            if action!=ACTION:assert not f.auth_calls,'Unrelated GMS service consulted microG'
    f.microg=True
    if enabled:
        config=f.new(CONFIG,{CONFIG+'->a:Ljava/lang/String;':ACTION,CONFIG+'->b:Z':1})
        intent=f.run(INTENTS,'a(Landroid/content/Context;Lnsk;)Landroid/content/Intent;',(f.context,config))[0]
        assert intent.value['package']==MICROG,'Auth still entered Google Chimera lookup'
    f.auth_active=False
    print('PASS Marktplaats Google provider/service routing, missing/disabled fallback and original availability')
