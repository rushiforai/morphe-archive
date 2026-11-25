"""Measurement dispatch: real app control flow, explicit SDK/IO boundaries."""
from rtl_vm import Reference,VmThrown
from vi_tracking_vm import TrackingFixture

GMS='Lcom/google/android/gms/measurement/internal/'
CCT='Lcom/google/android/datatransport/cct/CctTransportBackend;'
REQUEST='Lcom/google/android/datatransport/runtime/backends/BackendRequest;'
RESPONSE='Lcom/google/android/datatransport/runtime/backends/BackendResponse;'
FILTER='morpheMeasurementRequest('+REQUEST+')'+REQUEST
REPORT='Lcom/google/firebase/crashlytics/internal/send/ReportQueue;'
COMSCORE='Lcom/comscore/metrics/Request;'


class DispatchReached(Exception):pass


class DispatchFixture(TrackingFixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.rows[CCT,FILTER]=(CCT,FILTER,9,5,0,'')
        self.native |= {(o,s) for o,s in self.rows if o in {GMS+'zzgg;',GMS+'zzkr;',GMS+'zzko;',REPORT,REPORT[:-1]+'$$ExternalSyntheticLambda1;'} and s.startswith(('<init>(', 'run()V','zza(','zzb(','onSchedule(','lambda$sendReport$1$'))}
        self.callbacks=[]
        self.network_error=Reference({'message':'fixture IO failure'},'Ljava/io/IOException;')
        self.scheduler=Reference({},GMS+'zzhh;')

    def invoke(self,target,args):
        owner,sig=target.split('->',1)
        if owner=='Lcom/google/android/gms/common/internal/Preconditions;' and sig.startswith(('checkNotNull(', 'checkNotEmpty(')):
            assert args[0] is not None and args[0]!=0;return args[0]
        if (owner,sig)==(CCT,FILTER):return self.run(owner,sig,args)[0]
        if target==GMS+'zzim;->zzr()V':return None
        if target==GMS+'zzim;->zzl()'+GMS+'zzhh;':return self.scheduler
        if target==GMS+'zzhh;->zzb(Ljava/lang/Runnable;)V':
            self.events.append('measurement-worker');return self.run(args[1].descriptor,'run()V',(args[1],))[0]
        if owner in {GMS+'zzgh;',GMS+'zzkp;'} and sig.startswith('zza('):self.callbacks.append(args[1:]);return None
        if target=='Lcom/google/android/gms/internal/measurement/zzcq;->zza()Lcom/google/android/gms/internal/measurement/zzcq;':return Reference({},'Lcom/google/android/gms/internal/measurement/zzcq;')
        if target=='Lcom/google/android/gms/internal/measurement/zzcq;->zza(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URLConnection;':self.events.append('measurement-connect');raise VmThrown(self.network_error)
        if owner==COMSCORE:
            if sig=='b()Z':return 0  # SDK redirection-support configuration.
            if sig.startswith('process('):return Reference({},'Ljava/net/URL;')
            if sig=='a(Ljava/net/URL;)Ljava/net/HttpURLConnection;':self.events.append('comscore-connect');raise DispatchReached()
        if target=='Landroid/os/SystemClock;->elapsedRealtime()J':return 10000
        if target=='Lcom/google/firebase/crashlytics/internal/Logger;->getLogger()Lcom/google/firebase/crashlytics/internal/Logger;':return Reference({},'Lcom/google/firebase/crashlytics/internal/Logger;')
        if target=='Lcom/google/firebase/crashlytics/internal/Logger;->d(Ljava/lang/String;)V':return None
        if target=='Lcom/google/firebase/crashlytics/internal/common/CrashlyticsReportWithSessionId;->getSessionId()Ljava/lang/String;':return 'fixture-session'
        if target=='Lcom/google/firebase/crashlytics/internal/common/CrashlyticsReportWithSessionId;->getReport()Lcom/google/firebase/crashlytics/internal/model/CrashlyticsReport;':return Reference({},'Lcom/google/firebase/crashlytics/internal/model/CrashlyticsReport;')
        if target=='Lcom/google/android/datatransport/Event;->ofUrgent(Ljava/lang/Object;)Lcom/google/android/datatransport/Event;':return Reference({},'Lcom/google/android/datatransport/Event;')
        if target=='Lcom/google/android/datatransport/Transport;->schedule(Lcom/google/android/datatransport/Event;Lcom/google/android/datatransport/TransportScheduleCallback;)V':
            self.events.append('crash-schedule');return self.run(args[2].descriptor,'onSchedule(Ljava/lang/Exception;)V',(args[2],self.network_error))[0]
        if target=='Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetException(Ljava/lang/Exception;)Z':self.events.append('task-error');args[0].value['error']=args[1];return 1
        if target=='Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetResult(Ljava/lang/Object;)Z':raise AssertionError('Discarded report completed as successful')
        if owner=='Ljava/util/ArrayList;' and sig=='<init>()V':args[0].value=[];return None
        if owner in {'Ljava/util/ArrayList;','Ljava/lang/Iterable;'} and sig=='iterator()Ljava/util/Iterator;':return Reference({'items':args[0].value,'index':0},'Ljava/util/Iterator;')
        if target=='Ljava/util/ArrayList;->isEmpty()Z':return int(not args[0].value)
        if target=='Lcom/google/android/datatransport/runtime/EventInternal;->getTransportName()Ljava/lang/String;':return args[0].value['name']
        if target==REQUEST+'->getEvents()Ljava/lang/Iterable;':return args[0].value['events']
        if target==REQUEST+'->getExtras()[B':return args[0].value['extras']
        if target==REQUEST+'->builder()Lcom/google/android/datatransport/runtime/backends/BackendRequest$Builder;':return Reference({},'Lcom/google/android/datatransport/runtime/backends/BackendRequest$Builder;')
        if owner=='Lcom/google/android/datatransport/runtime/backends/BackendRequest$Builder;':
            if sig.startswith('setEvents('):args[0].value['events']=args[1];return args[0]
            if sig.startswith('setExtras('):args[0].value['extras']=args[1];return args[0]
            if sig.startswith('build('):return Reference(dict(args[0].value),REQUEST)
        if target==RESPONSE+'->fatalError()'+RESPONSE:self.events.append('backend-fatal');return Reference({'status':'FATAL_ERROR'},RESPONSE)
        if owner==CCT and sig.startswith('getRequestBody('):self.events.append(('backend-dispatch',args[1]));raise DispatchReached()
        return super().invoke(target,args)
