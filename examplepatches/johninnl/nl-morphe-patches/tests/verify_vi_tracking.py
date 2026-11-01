"""Privacy/provider invariants against actual VI code and restored settings."""
from rtl_vm import Reference,VmThrown
from vi_tracking_vm import CRASH,FACEBOOK,LOCAL,SESSIONS,MEASUREMENT,DISPLAY_ID,VIDEO_ID,AVAILABLE_ID,IdentifierLookup


def verify_provider_policies(f,enabled):
    for stored in (False,True,None):
        value=0 if stored is None else Reference(stored,'Ljava/lang/Boolean;')
        arbiter=f.new(CRASH,{CRASH+'->crashlyticsDataCollectionEnabled:Ljava/lang/Boolean;':value})
        assert f.run(CRASH,'isAutomaticDataCollectionEnabled()Z',(arbiter,))[0]==int(not enabled and (stored is None or stored)), 'VI restored crash collection override remains enabled'
    for stored in (False,True):
        f.facebook_stored=stored
        for sig in ('getAutoLogAppEventsEnabled()Z','getAdvertiserIDCollectionEnabled()Z'):
            assert f.run(FACEBOOK,sig)[0]==int(stored and not enabled), 'VI optional Facebook collection remains enabled'
    assert f.run(MEASUREMENT,'zzw()Z',(f.new(MEASUREMENT),))[0]==int(enabled), 'VI explicit analytics deactivation missing'
    local=f.new(LOCAL,{LOCAL+'->metadata:Landroid/os/Bundle;':Reference(f.metadata,'Landroid/os/Bundle;')})
    for remote in (False,True):
        settings=f.new(SESSIONS,{SESSIONS+'->localOverrideSettings:Lcom/google/firebase/sessions/settings/SettingsProvider;':local,
            SESSIONS+'->remoteSettings:Lcom/google/firebase/sessions/settings/SettingsProvider;':Reference({'enabled':remote},'Lcom/google/firebase/sessions/settings/SettingsProvider;')})
        assert f.run(SESSIONS,'getSessionsEnabled()Z',(settings,))[0]==int(not enabled and remote), 'VI remote session setting overrides local privacy default'
    f.events.clear()
    f.run('Lnl/vi/application/App;','enableFirebaseCrashAnalytics()V',(f.new('Lnl/vi/application/App;'),))
    assert f.events==[('crash-collection',int(not enabled))], 'VI App explicitly re-enabled crash collection'


def verify_identifiers(f,enabled):
    signature='invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'
    for owner,field,role in ((DISPLAY_ID,'$onCompletion','display-id'),(VIDEO_ID,'$result$inlined','video-id'),(AVAILABLE_ID,'$isAvailable$inlined','available-id')):
        callback=Reference({'role':role},'Lkotlin/jvm/functions/Function1;')
        job=f.new(owner,{owner+'->'+field+':Lkotlin/jvm/functions/Function1;':callback})
        job.value[owner+'->$context:Landroid/content/Context;']=f.context
        job.value[owner+'->$activity$inlined:Landroid/app/Activity;']=Reference({},'Landroid/app/Activity;')
        f.events.clear();f.defer_main=False;f.dispatcher=None
        try:result=f.run(owner,signature,(job,0))[0]
        except IdentifierLookup:
            assert not enabled, 'VI identifier lookup still reached'
            continue
        assert enabled, 'Original VI identifier fixture missed lookup'
        assert result is f.statics['Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;']
        callbacks=[e for e in f.events if isinstance(e,tuple) and e[0]==role]
        assert len(callbacks)==1, 'VI identifier callback missing/duplicated'
        _,value,context=callbacks[0]
        if role=='display-id':
            assert value.descriptor=='Lnl/vi/core/ads/config/FetchIDResult;' and context=='current'
            assert any(isinstance(v,Reference) and v.descriptor=='Ljava/io/IOException;' for v in value.value.values()), 'VI display ID did not report native unavailable result'
        elif role=='video-id':assert value=='' and context=='main'
        else:assert value.value is False and context=='current'
        invalid=f.new(owner,{owner+'->label:I':2})
        try:f.run(owner,signature,(invalid,0))
        except VmThrown as thrown:assert thrown.value.descriptor=='Ljava/lang/IllegalStateException;'
        else:raise AssertionError('VI identifier invalid label accepted')
    if enabled:
        callback=Reference({'role':'video-id'},'Lkotlin/jvm/functions/Function1;')
        job=f.new(VIDEO_ID,{VIDEO_ID+'->$result$inlined:Lkotlin/jvm/functions/Function1;':callback})
        f.events.clear();f.defer_main=True
        assert f.run(VIDEO_ID,signature,(job,0))[0] is f.suspended
        assert not any(isinstance(e,tuple) and e[0]=='video-id' for e in f.events)
        f.defer_main=False;f.dispatcher=f.main
        f.run(f.pending.descriptor,signature,(f.pending,0))
        f.dispatcher=None
        assert f.run(VIDEO_ID,signature,(job,f.statics['Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;']))[0] is f.statics['Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;']
        assert [e for e in f.events if isinstance(e,tuple) and e[0]=='video-id']==[('video-id','','main')], 'VI suspended identifier callback missing/duplicated'
