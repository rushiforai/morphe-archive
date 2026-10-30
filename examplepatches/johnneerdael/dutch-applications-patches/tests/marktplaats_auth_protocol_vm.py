"""Execute credential IPC construction and real result receiver control flow.

The 7.2.1 microG-Re wire constants and Bundle result shape were observed on-device.
Android/Google SDK object construction and executor dispatch are explicit boundaries;
provider serialization, routing, normalization and receiver branches execute real smali.
"""
import re
from pathlib import Path
from brabant_smali import canonical
from marktplaats_auth_vm import AuthFixture, PROVIDER, FIELD
from rtl_vm import Reference

NATIVE='com.google.android.libraries.identity.googleid.'
MICRO='app.revanced.android.libraries.identity.googleid.'
TYPE='TYPE_GOOGLE_ID_TOKEN_CREDENTIAL'
RECEIVER='Landroidx/credentials/playservices/controllers/identitycredentials/getcredential/a;'
GET='onGetCredential(Landroid/content/Context;Llj6;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Ldt3;)V'
RESULT='onReceiveResult(ILandroid/os/Bundle;)V'
RESPONSE_KEY='android.service.credentials.extra.GET_CREDENTIAL_RESPONSE'
ERROR_KEY='android.service.credentials.extra.GET_CREDENTIAL_EXCEPTION'
CREDENTIAL_TYPE='androidx.credentials.provider.extra.EXTRA_CREDENTIAL_TYPE'
CREDENTIAL_DATA='androidx.credentials.provider.extra.EXTRA_CREDENTIAL_DATA'
ERROR_TYPE='androidx.credentials.provider.extra.CREATE_CREDENTIAL_EXCEPTION_TYPE'
ERROR_MESSAGE='androidx.credentials.provider.extra.CREATE_CREDENTIAL_EXCEPTION_MESSAGE'

class Dispatched(Exception): pass

class ProtocolFixture(AuthFixture):
    def __init__(self,*args):
        super().__init__(*args)
        for owner,sig in [(PROVIDER,GET),(RECEIVER,RESULT),('Lk3d;','<init>(Ldt3;Landroidx/credentials/exceptions/GetCredentialException;B)V'),('Lk3d;','run()V'),('Ld9c;','<init>(Ljava/lang/Object;Ljava/lang/Object;B)V'),('Ld9c;','run()V')]:
            body=self.source.body(owner,sig)
            self.rows[owner,sig]=(owner,sig,1,int(re.search(r'\.locals (\d+)',body)[1]),0,'')
            self.native.add((owner,sig))
        self.statics[PROVIDER+'->Companion:Lcu3;']=self.new('Lcu3;')
        self.statics['Landroidx/credentials/exceptions/GetCredentialException;->Companion:Lij6;']=self.new('Lij6;')
        self.statics['Ljr7;->l:Lola;']=self.new('Lola;')
        self.statics['Lem6;->c:Lem6;']=self.new('Lem6;')
        self.statics['Ly80;->U:Lx80;']=self.new('Lx80;')
        self.statics['Li3l;->a:Ltn5;']=self.new('Ltn5;')
        self.statics['Lot3;->a:Ljt3;']=self.new('Ljt3;')
        self.statics['Lot3;->c:Z']=1
        self.protocol_callbacks=[];self.runnables={};self.wire=None

    def bundle(self,data):return Reference(dict(data),'Landroid/os/Bundle;')

    def invoke(self,target,args):
        owner,sig=target.split('->',1)
        if target=='Lcu3;->a(Landroid/os/CancellationSignal;)Z':return int(bool(args[0]))
        if target=='Lgj6;-><init>(Landroid/content/Context;)V':args[0].value['Lgj6;->d:Landroid/content/Context;']=args[1];return None
        if owner=='Landroid/os/Bundle;' and sig in ('<init>()V','<init>(Landroid/os/Bundle;)V'):
            args[0].value={} if len(args)==1 else dict(args[1].value);return None
        if target=='Landroid/os/Bundle;->keySet()Ljava/util/Set;':return Reference(list(args[0].value),'Ljava/util/HashSet;')
        if target=='Ljava/util/Set;->iterator()Ljava/util/Iterator;':return Reference({'iterator':iter(args[0].value)},'Ljava/util/Iterator;')
        if owner in ('Landroid/os/Bundle;','Landroid/os/BaseBundle;'):
            if sig.startswith(('putBoolean(','putString(','putBundle(','putSerializable(','putParcelable(')):
                args[0].value[args[1]]=args[2];return None
            if sig in ('get(Ljava/lang/String;)Ljava/lang/Object;','getString(Ljava/lang/String;)Ljava/lang/String;','getBundle(Ljava/lang/String;)Landroid/os/Bundle;'):
                return args[0].value.get(args[1],0)
            if sig=='getInt(Ljava/lang/String;)I':return args[0].value.get(args[1],0)
        if target=='Ljava/lang/String;->startsWith(Ljava/lang/String;)Z':return int(args[0].startswith(args[1]))
        if target=='Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;':return args[0].replace(args[1],args[2])
        if target=='Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;':return Reference(args[0],'Landroid/net/Uri;')
        if target=='Lg23;->r(Ljava/lang/Iterable;I)I':return len(args[0].value)
        if target=='Ljava/util/ArrayList;-><init>(I)V':args[0].value=[];return None
        if target=='Lft3;-><init>(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V':
            args[0].value.update({f'Lft3;->{k}:{t}':v for k,t,v in zip('abcdef',['Ljava/lang/String;','Landroid/os/Bundle;','Landroid/os/Bundle;','Ljava/lang/String;','Ljava/lang/String;','Ljava/lang/String;'],args[1:])});return None
        if owner=='Landroid/os/ResultReceiver;' and sig.startswith('<init>'):return None
        if owner=='Lcom/google/android/gms/identitycredentials/GetCredentialRequest;' and sig.startswith('<init>'):
            args[0].value={'options':args[1],'data':args[2],'origin':args[3],'receiver':args[4]};return None
        if owner=='Lfm6;' and sig.startswith('<init>'):return None
        if target=='Lgzf;->b()Lgzf;':return self.new('Lgzf;')
        if target=='Lgzf;->a()Lgzf;':return args[0]
        if target=='Lbgg;-><init>(Ljava/lang/Object;)V':args[0].value['request']=args[1];return None
        if target=='Lfm6;->e(ILgzf;)Li6l;':
            self.wire=args[2].value['Lgzf;->d:Ljava/lang/Object;'].value['request'];raise Dispatched()
        if owner=='Landroid/content/Intent;':
            if sig=='getExtras()Landroid/os/Bundle;':return self.bundle(args[0].value)
            if sig=='getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;':
                v=args[0].value.get(args[1],0);return v if isinstance(v,Reference) and v.descriptor=='Landroid/os/Bundle;' else 0
            if sig=='putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;':args[0].value[args[1]]=args[2];return args[0]
        if target=='Labk;->f(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;':return args[0].value.get(args[1],0)
        if owner=='Landroidx/credentials/playservices/controllers/identitycredentials/getcredential/GetCredentialController$resultReceiver$1$onReceiveResult$1;' and sig.startswith('<init>'):return None
        if target=='Lot3;->b(Landroid/os/Bundle;Lkotlin/jvm/functions/Function2;Ljava/util/concurrent/Executor;Ldt3;Landroid/os/CancellationSignal;)Z':return 0
        if target=='Lt6;->f(Landroid/content/Intent;)Lmj6;':
            v=args[0].value.get(RESPONSE_KEY,0)
            return v if isinstance(v,Reference) and v.descriptor=='Lmj6;' else 0
        if target=='Lt6;->e(Landroid/content/Intent;)Landroidx/credentials/exceptions/GetCredentialException;':
            v=args[0].value.get(ERROR_KEY,0)
            return v if isinstance(v,Reference) and v.descriptor!='Landroid/os/Bundle;' else 0
        if target=='La1l;->a(Landroid/os/Bundle;Ljava/lang/String;)Lv6;':return Reference({'type':args[1],'data':args[0]},'Law3;')
        if target=='Lmj6;-><init>(Lv6;)V':args[0].value['credential']=args[1];return None
        if target=='Lij6;->b(Landroid/os/Bundle;)Landroidx/credentials/exceptions/GetCredentialException;':
            b=args[0].value
            return Reference({'type':b.get(ERROR_TYPE),'message':b.get(ERROR_MESSAGE)},'Landroidx/credentials/exceptions/GetCredentialException;') if b.get(ERROR_TYPE) else 0
        if target=='Ld9c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V':self.runnables[id(args[0])]=('success',args[2]);return None
        if target=='Lk3d;-><init>(Ldt3;Landroidx/credentials/exceptions/GetCredentialException;B)V':self.runnables[id(args[0])]=('error',args[2]);return None
        if target=='Lxt3;-><init>(Ldt3;B)V':self.runnables[id(args[0])]=('error',0);return None
        if target=='Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V':return self.run(args[1].descriptor,'run()V',(args[1],))[0]
        if target=='Ldt3;->onResult(Ljava/lang/Object;)V':self.protocol_callbacks.append(('success',args[1]));return None
        if target=='Ldt3;->a(Ljava/lang/Object;)V':self.protocol_callbacks.append(('error',args[1]));return None
        if target=='Lnt3;->a(I)Ljava/lang/String;':return 'result '+str(args[0])
        if owner in ('Lkotlin/jvm/internal/Ref$ObjectRef;','Landroidx/credentials/exceptions/GetCredentialUnknownException;','Landroidx/credentials/exceptions/GetCredentialCancellationException;') and sig.startswith('<init>'):return None
        return super().invoke(target,args)


def verify_protocol(f):
    for marked in (False,True):
        client='opaque-client-id';nonce='opaque-nonce';sentinel=Reference('opaque-object','Landroid/net/Uri;')
        data=f.bundle({NATIVE+'BUNDLE_KEY_SERVER_CLIENT_ID':client,NATIVE+'BUNDLE_KEY_NONCE':nonce,NATIVE+'BUNDLE_KEY_LINKED_SERVICE_ID':0,NATIVE+'BUNDLE_KEY_FILTER_BY_AUTHORIZED_ACCOUNTS':f.false if hasattr(f,'false') else f.statics['Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;'],'unrelated':sentinel})
        option=f.new('Lik6;',{'Lgt3;->a:Ljava/lang/String;':NATIVE+TYPE,'Lgt3;->b:Landroid/os/Bundle;':data,'Lgt3;->c:Landroid/os/Bundle;':data})
        request=f.new('Llj6;',{'Llj6;->a:Ljava/util/List;':Reference([option],'Ljava/util/ArrayList;')})
        provider=f.new(PROVIDER,{PROVIDER+'->context:Landroid/content/Context;':f.context,FIELD:int(marked)})
        f.google_available=True
        try:f.run(PROVIDER,GET,(provider,f.context,request,0,f.new('Ljava/util/concurrent/Executor;'),f.new('Ldt3;')))
        except Dispatched:pass
        else:raise AssertionError('Google API dispatch not reached')
        wire=f.wire.value['options'].value[0].value
        prefix=MICRO if marked else NATIVE
        assert wire['Lft3;->a:Ljava/lang/String;']==prefix+TYPE,'microG-Re rejects native GoogleID credential type'
        out=wire['Lft3;->b:Landroid/os/Bundle;'].value
        assert out[prefix+'BUNDLE_KEY_SERVER_CLIENT_ID'] is client and out[prefix+'BUNDLE_KEY_NONCE'] is nonce
        assert out[prefix+'BUNDLE_KEY_LINKED_SERVICE_ID']==0,'Nullable GoogleID key was lost'
        assert out['unrelated'] is sentinel
        assert out[prefix+'BUNDLE_KEY_FILTER_BY_AUTHORIZED_ACCOUNTS'] is data.value[NATIVE+'BUNDLE_KEY_FILTER_BY_AUTHORIZED_ACCOUNTS']
        assert set(data.value)=={NATIVE+'BUNDLE_KEY_SERVER_CLIENT_ID',NATIVE+'BUNDLE_KEY_NONCE',NATIVE+'BUNDLE_KEY_LINKED_SERVICE_ID',NATIVE+'BUNDLE_KEY_FILTER_BY_AUTHORIZED_ACCOUNTS','unrelated'},'Original request mutated'
    for sdk in (32,33,34,36):
        f.statics['Landroid/os/Build$VERSION;->SDK_INT:I']=sdk
        receiver=f.new(RECEIVER)
        controller=f.new('Lgj6;',{'Lgj6;->e:Ldt3;':f.new('Ldt3;'),'Lgj6;->f:Ljava/util/concurrent/Executor;':f.new('Ljava/util/concurrent/Executor;'),'Lgj6;->g:Landroid/os/CancellationSignal;':0})
        receiver.value[RECEIVER+'->a:Lgj6;']=controller
        for result_code,extras,expected in [
            (-1,{RESPONSE_KEY:f.bundle({CREDENTIAL_TYPE:MICRO+TYPE,CREDENTIAL_DATA:f.bundle({MICRO+'BUNDLE_KEY_ID':'opaque-id',MICRO+'BUNDLE_KEY_ID_TOKEN':'opaque-token',MICRO+'BUNDLE_KEY_PROFILE_PICTURE_URI':'https://example.invalid/avatar'})})},'success'),
            (-1,{ERROR_KEY:f.bundle({ERROR_TYPE:'android.credentials.GetCredentialException.TYPE_NO_CREDENTIAL',ERROR_MESSAGE:'no credential'})},'error'),
            (0,{},'error'),(-1,{},'error'),
            (-1,{RESPONSE_KEY:f.bundle({CREDENTIAL_TYPE:MICRO+TYPE})},'error')]:
            intent=Reference(extras,'Landroid/content/Intent;');bundle=f.bundle({'ACTIVITY_REQUEST_CODE':1,'RESULT_DATA':intent})
            f.protocol_callbacks=[]
            f.run(RECEIVER,RESULT,(receiver,result_code,bundle))
            assert len(f.protocol_callbacks)==1 and f.protocol_callbacks[0][0]==expected,'Credential callback lost or duplicated'
            if expected=='success':
                credential=f.protocol_callbacks[0][1].value['credential'].value
                assert credential['type']==NATIVE+TYPE,'microG response type not normalized'
                assert credential['data'].value[NATIVE+'BUNDLE_KEY_ID_TOKEN']=='opaque-token'
                assert credential['data'].value[NATIVE+'BUNDLE_KEY_PROFILE_PICTURE_URI'].descriptor=='Landroid/net/Uri;'
    # Native framework Parcelables keep the native parser and object identities.
    f.statics['Landroid/os/Build$VERSION;->SDK_INT:I']=36
    native_response=f.new('Lmj6;')
    native_error=f.new('Landroidx/credentials/exceptions/GetCredentialException;')
    for key,value,kind in [(RESPONSE_KEY,native_response,'success'),(ERROR_KEY,native_error,'error')]:
        f.protocol_callbacks=[]
        f.run(RECEIVER,RESULT,(receiver,-1,f.bundle({'ACTIVITY_REQUEST_CODE':1,'RESULT_DATA':Reference({key:value},'Landroid/content/Intent;')})))
        assert f.protocol_callbacks==[(kind,value)],'Native framework result route changed'
    controller.value['Lgj6;->g:Landroid/os/CancellationSignal;']=f.new('Landroid/os/CancellationSignal;')
    f.protocol_callbacks=[]
    f.run(RECEIVER,RESULT,(receiver,0,f.bundle({'ACTIVITY_REQUEST_CODE':1,'RESULT_DATA':Reference({},'Landroid/content/Intent;')})))
    assert not f.protocol_callbacks,'Cancelled signal received a callback'
    marked=f.new(PROVIDER,{FIELD:1})
    other=f.new('Lft3;',{'Lft3;->a:Ljava/lang/String;':'android.credentials.TYPE_PASSWORD_CREDENTIAL'})
    assert f.run(PROVIDER,'morpheGoogleOption('+PROVIDER+'Lft3;)Lft3;',(marked,other))[0] is other,'Non-Google option changed'
    uri=Reference('opaque-uri','Landroid/net/Uri;')
    payload=f.bundle({MICRO+'BUNDLE_KEY_PROFILE_PICTURE_URI':uri,'other':uri})
    normalized=f.run(PROVIDER,'morpheGoogleBundle(Landroid/os/Bundle;Z)Landroid/os/Bundle;',(payload,0))[0]
    assert normalized.value[NATIVE+'BUNDLE_KEY_PROFILE_PICTURE_URI'] is uri
    assert normalized.value['other'] is uri and NATIVE+'BUNDLE_KEY_PROFILE_PICTURE_URI' not in payload.value
    print('PASS GoogleID IPC namespaces, immutable request values, SDK32/33/34/36 Bundle success/error/cancel callback dispatch')

if __name__=='__main__':
    import argparse
    from verify_dumpert import Smali
    from dex_declarations import DexDeclarations
    from verify_parool import sdk_classes
    a=argparse.ArgumentParser();a.add_argument('root',type=Path);a.add_argument('--apk',required=True,type=Path);args=a.parse_args()
    sdk,archive=sdk_classes()
    try:verify_protocol(ProtocolFixture(Smali(args.root),DexDeclarations.from_apk(args.apk),sdk))
    finally:archive.close()
