"""Actual app FCM dispatcher, Braze classifier and receiver admission regression."""
from marktplaats_security_vm import SecurityFixture
from rtl_vm import Reference,VmThrown
from brabant_smali import canonical

SERVICE='Lcom/horizon/android/core/pushnotification/messaging/FirebaseMessagingReceiver;'
PROCESSOR='Lkn1;'
MESSAGING='Lcom/braze/push/BrazeFirebaseMessagingService$Companion;'
RECEIVER='Lcom/braze/push/BrazePushReceiver$Companion;'
FUNCTIONAL='Lcom/horizon/android/core/pushnotification/messaging/handler/a;'
CLASSIFY='isBrazePushNotification(Lqtc;)Z'
RECEIVE='handleReceivedIntent(Landroid/content/Context;Landroid/content/Intent;Z)V'

class PushFixture(SecurityFixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.native.update({(SERVICE,'b(Lqtc;)V'),(SERVICE,'c(Ljava/lang/String;)V'),
                            (PROCESSOR,'a(Lqtc;)Z'),(MESSAGING,CLASSIFY),(RECEIVER,RECEIVE)})
        self.push_context=self.new('Lcom/horizon/android/HorizonApplication;')
        self.push_companion=self.new(MESSAGING)
        self.statics['Lcom/braze/push/BrazeFirebaseMessagingService;->Companion:'+MESSAGING]=self.push_companion
        self.push_calls=[];self.functional_handled=1

    def invoke(self,target,args):
        if target=='Laq9;->a(Lqtc;)Z' and args[0].descriptor==FUNCTIONAL:
            return self.invoke(FUNCTIONAL+'->a(Lqtc;)Z',args)
        if target=='Lqtc;->a()Ljava/util/HashMap;':return Reference(args[0].value['fixture-data'],'Ljava/util/HashMap;')
        if target=='Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;':return args[0].value.get(args[1],0)
        if target=='Ljava/lang/Object;->equals(Ljava/lang/Object;)Z':return int(args[0]==args[1])
        if target==MESSAGING+'->handleBrazeRemoteMessage(Landroid/content/Context;Lqtc;)Z':
            # External SDK renderer/Android boundary. The real classifier runs;
            # the original graph downstream was independently traced to notify.
            assert args[1] is self.push_context
            self.push_calls.append(('braze-sdk',args[2]))
            return self.run(MESSAGING,CLASSIFY,(args[0],args[2]))[0]
        if target==FUNCTIONAL+'->a(Lqtc;)Z':
            # Real functional handler is graph-pinned, not reimplemented here.
            # Enter its actual method and stop before parsing/platform UI work.
            assert self.run(FUNCTIONAL,'a(Lqtc;)Z',args,stop_at=(0,))[0]==0
            self.push_calls.append(('functional',args[1]));return self.functional_handled
        if target==SERVICE.replace('FirebaseMessagingReceiver;','command/b;')+'->a(Ljava/lang/String;)V':
            self.push_calls.append(('token',args[1]));return None
        return super().invoke(target,args)

def verify_push(f,disabled):
    failures=[]
    processor=f.new(PROCESSOR,{PROCESSOR+'->a:Landroid/app/Application;':f.push_context})
    functional=f.new(FUNCTIONAL)
    service=f.new(SERVICE,{SERVICE+'->b:Ljava/util/List;':Reference([processor,functional],'Ljava/util/ArrayList;'),
                          SERVICE+'->a:Lcom/horizon/android/core/pushnotification/messaging/command/b;':f.new('Lcom/horizon/android/core/pushnotification/messaging/command/b;')})
    for data,recognized in [({'_ab':'true'},True),({'event':'chat'},False),({},False),({'_ab':'TRUE'},False),({'_ab':'false'},False)]:
        message=f.new('Lqtc;',{'fixture-data':data})
        assert f.run(MESSAGING,CLASSIFY,(f.push_companion,message))[0]==int(recognized)
        for handled in (0,1):
            f.functional_handled=handled;f.push_calls=[]
            f.run(SERVICE,'b(Lqtc;)V',(service,message))
            expected=[] if disabled else [('braze-sdk',message)]
            if not recognized:expected.append(('functional',message))
            if f.push_calls!=expected:failures.append('FCM Braze/functional split '+repr(data))
    f.push_calls=[]
    f.run(SERVICE,'c(Ljava/lang/String;)V',(service,'fixture-current-token'))
    assert f.push_calls==[('token','fixture-current-token')],'Functional token registration changed'
    # Direct receiver re-entry must validate inputs but never admit either a
    # coroutine or synchronous notification/asset-fetch dispatch when disabled.
    companion=f.new(RECEIVER);intent=f.new('Landroid/content/Intent;')
    for background,dispatch in ((0,10),(1,3)):
        code=canonical(f.source.body(RECEIVER,RECEIVE)).code
        shift=len(code)-f.rows[RECEIVER,RECEIVE][4]
        result=f.run(RECEIVER,RECEIVE,(companion,f.push_context,intent,background),stop_at=(dispatch+shift,))[0]
        if result!=(None if disabled else dispatch+shift):failures.append('Braze direct receiver dispatch '+str(background))
    for context,notification in ((0,intent),(f.push_context,0)):
        try:f.run(RECEIVER,RECEIVE,(companion,context,notification,1))
        except VmThrown as exc:assert exc.value.descriptor=='Ljava/lang/NullPointerException;'
        else:raise AssertionError('Braze receiver lost native input validation')
    assert not failures,'Marktplaats push failures: '+', '.join(failures)
