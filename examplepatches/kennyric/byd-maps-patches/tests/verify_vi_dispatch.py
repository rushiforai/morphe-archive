"""Known telemetry is blocked; failures complete honestly and unknown data stays native."""
from rtl_vm import Reference,is_zero
from vi_dispatch_vm import GMS,CCT,REQUEST,FILTER,REPORT,COMSCORE,DispatchReached

SEND='send('+REQUEST+')Lcom/google/android/datatransport/runtime/backends/BackendResponse;'


def verify_dispatch(f,enabled):
    f.events.clear()
    try:result=f.run(COMSCORE,'a()Z',(f.new(COMSCORE,{COMSCORE+'->a:Ljava/net/URL;':Reference({},'Ljava/net/URL;')}),))[0]
    except DispatchReached:assert not enabled, 'VI comScore still opens measurement connections'
    else:assert enabled and result==0 and not f.events
    for name,callback in [('zzgi','zzgh'),('zzko','zzkp')]:
        owner=GMS+name+';'
        obj=f.new(owner,{owner+'->zza:Ljava/net/URL;':Reference({},'Ljava/net/URL;'),
            owner+'->zzf:'+GMS+('zzge;' if name=='zzgi' else 'zzkm;'):Reference({},GMS+('zzge;' if name=='zzgi' else 'zzkm;')),
            owner+'->zzc:'+GMS+callback+';':Reference({},GMS+callback+';'),owner+'->zzd:Ljava/lang/String;':'fixture-app'})
        f.events.clear();f.callbacks.clear();f.run(owner,'run()V',(obj,))
        assert f.events.count('measurement-connect')==int(not enabled), 'VI persisted analytics still connects'
        assert f.events.count('measurement-worker')==1 and len(f.callbacks)==1
        app,status,error,body,headers=f.callbacks[0]
        assert app=='fixture-app' and status==0 and error.descriptor=='Ljava/io/IOException;' and is_zero(body) and is_zero(headers), 'VI measurement failure callback changed'

    tcs=Reference({},'Lcom/google/android/gms/tasks/TaskCompletionSource;')
    queue=f.new(REPORT,{REPORT+'->transport:Lcom/google/android/datatransport/Transport;':Reference({},'Lcom/google/android/datatransport/Transport;')})
    report=Reference({},'Lcom/google/firebase/crashlytics/internal/common/CrashlyticsReportWithSessionId;')
    f.events.clear()
    f.run(REPORT,'sendReport(Lcom/google/firebase/crashlytics/internal/common/CrashlyticsReportWithSessionId;Lcom/google/android/gms/tasks/TaskCompletionSource;)V',(queue,report,tcs))
    assert f.events.count('crash-schedule')==int(not enabled) and f.events.count('task-error')==1
    assert tcs.value['error'].descriptor=='Ljava/io/IOException;', 'VI discarded crash report did not fail its waiter'

    helper=FILTER in f.declarations.classes[CCT].methods
    assert helper==enabled, 'VI persisted measurement helper missing'
    for names in [('FIREBASE_CRASHLYTICS_REPORT',),('FIREBASE_APPQUALITY_SESSION',),('FUNCTIONAL_CUSTOM',),('FIREBASE_CRASHLYTICS_REPORT','FUNCTIONAL_CUSTOM','FCM_CLIENT_EVENT_LOGGING','OTHER_CUSTOM')]:
        events=[Reference({'name':n},'Lcom/google/android/datatransport/runtime/EventInternal;') for n in names]
        extras=Reference([1,2,3],'[B')
        req=Reference({'events':Reference(events,'Ljava/util/ArrayList;'),'extras':extras},REQUEST)
        expected=[event for event in events if event.value['name'] in {'FUNCTIONAL_CUSTOM','OTHER_CUSTOM'}]
        f.events.clear()
        try:result=f.run(CCT,SEND,(f.new(CCT),req))[0]
        except DispatchReached:
            assert not enabled or expected, 'VI discarded telemetry reached the backend'
            handed=f.events[-1][1]
            assert handed.value['events'].value==(expected if enabled else events) and handed.value['extras'] is extras
        else:assert enabled and not expected and result.value['status']=='FATAL_ERROR' and f.events==['backend-fatal'], 'VI discarded batch returned fake success'
