package app.afterglow.extension.downloads;

import android.content.Context;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.diagnostics.DebugLog;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Single FIFO transfer worker, with serialized queue mutations and detached main-thread snapshots. */
public final class DownloadManager {
    public interface Listener { void onDownloadsChanged(); }
    public interface Callback<T> { void onResult(T value,String error); }
    private static volatile DownloadManager instance;
    private final Context context;
    private final Object lock=new Object();
    private final List<QueueRecord> jobs=new ArrayList<>();
    private final CopyOnWriteArrayList<Listener> listeners=new CopyOnWriteArrayList<>();
    private final ExecutorService control=Executors.newSingleThreadExecutor(r->new Thread(r,"Afterglow-Queue"));
    private final ExecutorService transfer=Executors.newSingleThreadExecutor(r->new Thread(r,"Afterglow-Transfer"));
    private final ExecutorService inspect=Executors.newFixedThreadPool(2,r->new Thread(r,"Afterglow-Inspect"));
    private final DownloadLibrary library;
    private volatile DownloadResolver resolver=AfterglowDownloadResolver.INSTANCE;
    private volatile DownloadStorage storage;
    private volatile boolean loaded, writable, serviceReady, serviceRequested;
    private final java.util.concurrent.CountDownLatch initialized=new java.util.concurrent.CountDownLatch(1);
    private volatile String recovery="";
    private volatile Work active;
    private long ordinal;
    private static final class Work {
        final QueueRecord record;final DownloadTransfer.Control cancellation=new DownloadTransfer.Control();
        long lastProgress;
        Work(QueueRecord record) {this.record=record;}
    }
    private DownloadManager(Context context) {
        Context app=context.getApplicationContext();this.context=app==null?context:app;library=new DownloadLibrary(this.context,this);
        control.execute(()->{
            try {
                storage=new DownloadStorage(new File(this.context.getFilesDir(),"afterglow-vault"));
                library.initialize(storage);List<QueueRecord> restored=storage.loadQueue();
                synchronized(lock) {
                    jobs.addAll(restored);
                    for(QueueRecord r:jobs) {
                        ordinal=Math.max(ordinal,r.ordinal);
                        LibraryItem complete=library.item(r.id);
                        if(complete!=null && !complete.isMissing() && (r.state==DownloadJob.State.QUEUED || r.state==DownloadJob.State.RUNNING)) {
                            finishRecord(r,complete);
                            if(r.request.postAction==DownloadRequest.PostAction.SAVE_TO_GALLERY) {r.state=DownloadJob.State.WAITING_FOR_DELIVERY;r.phase=DownloadJob.Phase.SHARE;r.error="Saved in Vault. Choose Export to finish saving a public copy.";}
                        }
                    }
                }
                recovery=storage.recoveryMessage;writable=true;save();cleanAbandonedWork();
            }catch(Exception e) {recovery="The download queue could not be loaded. Existing files have been kept.";writable=false;}
            loaded=true;initialized.countDown();changed();
        });
    }
    public static DownloadManager get(Context context) {
        if(context==null) throw new IllegalArgumentException("Afterglow context is unavailable.");
        DownloadManager current=instance;
        if(current==null) synchronized(DownloadManager.class) {current=instance;if(current==null)instance=current=new DownloadManager(context);}
        return current;
    }
    public void setResolver(DownloadResolver resolver) {if(resolver==null)throw new IllegalArgumentException("A resolver is required.");this.resolver=resolver;}
    public boolean isLoaded() {return loaded;}
    boolean awaitLoaded(long milliseconds) {try{return initialized.await(milliseconds,java.util.concurrent.TimeUnit.MILLISECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();return false;}}
    public String recoveryMessage() {return recovery;}
    public DownloadLibrary library() {return library;}
    public List<DownloadJob> snapshot() {
        synchronized(lock) {List<DownloadJob> list=new ArrayList<>();for(QueueRecord r:jobs)list.add(r.snapshot());return Collections.unmodifiableList(list);}
    }
    public void addListener(Listener listener) {if(listener!=null)listeners.addIfAbsent(listener);}
    public void removeListener(Listener listener) {listeners.remove(listener);}
    void changed() {Afterglow.runOnMain(()->{for(Listener listener:listeners)try{listener.onDownloadsChanged();}catch(Exception ignored){}});}
    <T> void callback(Callback<T> callback,T value,String error) {if(callback!=null)Afterglow.runOnMain(()->callback.onResult(value,error));}
    public void inspect(String videoId,Callback<DownloadCatalog> callback) {
        inspect.execute(()->{
            try {DownloadRequest r=DownloadPolicy.sanitize(new DownloadRequest(videoId));DownloadCatalog catalog=resolver.inspect(r.videoId,new DownloadTransfer.Control());if(catalog==null)throw new IOException();callback(callback,catalog,null);}
            catch(Exception e) {callback(callback,null,safeError(e,DownloadJob.Phase.EXTRACTION));}
        });
    }
    public DownloadJob findDuplicate(DownloadRequest input) {
        DownloadRequest request=DownloadPolicy.sanitize(input);
        synchronized(lock) {
            for(QueueRecord r:jobs) if(r.state!=DownloadJob.State.FAILED && r.state!=DownloadJob.State.CANCELLED && DownloadPolicy.sameSelection(request,r.request)) {
                if(r.state!=DownloadJob.State.SUCCEEDED || library.item(r.output)!=null && !library.item(r.output).isMissing()) return r.snapshot();
            }
        }
        return null;
    }
    public String enqueue(DownloadRequest request) {return enqueue(request,false);}
    public String enqueueReplacement(DownloadRequest input,String existingJobOrItemId) {
        String itemId=existingJobOrItemId;
        synchronized(lock){QueueRecord job=find(existingJobOrItemId);if(job!=null)itemId=job.output;}
        LibraryItem existing=library.item(itemId);if(existing==null)throw new IllegalArgumentException("The existing Vault item is unavailable.");
        DownloadRequest request=input.copy();request.replacesItemId=existing.id;return enqueue(request,true);
    }
    public String enqueue(DownloadRequest input,boolean allowDuplicate) {
        DownloadRequest request=DownloadPolicy.sanitize(input);
        if(!loaded) throw new IllegalStateException("The Vault is loading. Try again in a moment.");
        if(!writable) throw new IllegalStateException("The download queue is unavailable. Existing files have been kept.");
        QueueRecord record=new QueueRecord();
        synchronized(lock) {
            if(!allowDuplicate) {DownloadJob duplicate=findDuplicate(request);if(duplicate!=null)return duplicate.id;}
            // Bound history while preserving all active and paused jobs.
            while(jobs.size()>=DownloadPolicy.MAX_JOBS) {
                QueueRecord oldest=jobs.stream().filter(r->r.snapshot().isTerminal()).min(Comparator.comparingLong(r->r.updated)).orElse(null);
                if(oldest==null)throw new IllegalStateException("The queue is full. Finish or cancel a download first.");jobs.remove(oldest);
            }
            record.id=UUID.randomUUID().toString();record.request=request;record.created=record.updated=System.currentTimeMillis();record.ordinal=++ordinal;jobs.add(record);
        }
        changed();control.execute(()->{if(save())requestStart();});return record.id;
    }
    /** Called from a visible UI; recovered queued jobs never require persisted network credentials. */
    public void resumePending() {control.execute(this::requestStart);}
    public void pause(String id) {stopImmediately(id);control.execute(()->{changeState(id,DownloadJob.State.PAUSED);pump();});}
    public void cancel(String id) {
        stopImmediately(id);control.execute(()->{changeState(id,DownloadJob.State.CANCELLED);if(active==null || !active.record.id.equals(id))cleanWork(id);pump();});
    }
    public void resume(String id) {control.execute(()->{
        synchronized(lock) {QueueRecord r=find(id);if(r==null || r.state!=DownloadJob.State.PAUSED)return;r.error="";r.phase=DownloadJob.Phase.EXTRACTION;setState(r,DownloadJob.State.QUEUED);}
        if(save())requestStart();changed();
    });}
    public void retry(String id) {control.execute(()->{
        synchronized(lock) {QueueRecord r=find(id);if(r==null || r.state!=DownloadJob.State.FAILED && r.state!=DownloadJob.State.CANCELLED)return;r.error="";r.retries=0;r.phase=DownloadJob.Phase.EXTRACTION;setState(r,DownloadJob.State.QUEUED);}
        if(save())requestStart();changed();
    });}
    private void stopImmediately(String id) {Work work=active;if(work!=null && work.record.id.equals(id))work.cancellation.cancel();}
    private void changeState(String id,DownloadJob.State state) {
        synchronized(lock) {QueueRecord r=find(id);if(r==null || !DownloadPolicy.transition(r.state,state))return;setState(r,state);r.error="";}
        save();changed();
    }
    private QueueRecord find(String id) {for(QueueRecord r:jobs)if(r.id.equals(id))return r;return null;}
    private void setState(QueueRecord r,DownloadJob.State state) {if(!DownloadPolicy.transition(r.state,state))throw new IllegalStateException("Invalid download transition.");r.state=state;r.updated=System.currentTimeMillis();DebugLog.write("download","state="+state+" phase="+r.phase+" queue="+jobs.size());}
    private boolean save() {
        try {
            synchronized(lock){storage.saveQueue(jobs);}writable=true;
            if(recovery.startsWith("The queue could not be saved."))recovery="";
            return true;
        }
        catch(Exception e) {
            writable=false;recovery="The queue could not be saved. Free some storage before starting more downloads.";
            Work work=active;if(work!=null)work.cancellation.cancel();
            synchronized(lock) {
                for(QueueRecord r:jobs) {
                    if(r.state==DownloadJob.State.RUNNING) {r.state=DownloadJob.State.FAILED;r.error="The queue could not be saved. Free some storage, then retry.";}
                    else if(r.state==DownloadJob.State.QUEUED) {r.state=DownloadJob.State.PAUSED;r.error="The queue could not be saved. Free some storage, then resume.";}
                }
            }
            serviceReady=false;serviceRequested=false;Afterglow.runOnMain(()->DownloadService.stop(context));changed();return false;
        }
    }
    private void requestStart() {
        if(!loaded || !writable)return;
        boolean queued; synchronized(lock){queued=jobs.stream().anyMatch(r->r.state==DownloadJob.State.QUEUED);}
        if(!queued)return;
        if(serviceReady) {pump();return;}
        if(serviceRequested)return;serviceRequested=true;
        Afterglow.runOnMain(()->{
            try {DownloadService.start(context);}catch(Exception e){serviceRequested=false;recovery="Open Afterglow and resume the queue to continue downloading.";changed();}
        });
    }
    void serviceStarted() {control.execute(()->{serviceRequested=false;serviceReady=true;pump();});}
    void serviceStopped() {serviceReady=false;serviceRequested=false;Work work=active;if(work!=null){work.cancellation.cancel();control.execute(()->{synchronized(lock){if(work.record.state==DownloadJob.State.RUNNING)setState(work.record,DownloadJob.State.QUEUED);}save();changed();});}}
    void serviceTimedOut() {Work work=active;if(work!=null)pause(work.record.id);serviceReady=false;}
    private void pump() {
        if(!loaded || !writable || active!=null)return;
        QueueRecord next;
        synchronized(lock) {next=jobs.stream().filter(r->r.state==DownloadJob.State.QUEUED).min(Comparator.comparingLong(r->r.ordinal)).orElse(null);}
        if(next==null) {if(serviceReady){serviceReady=false;Afterglow.runOnMain(()->DownloadService.stop(context));}return;}
        if(!serviceReady)return;
        Work work=new Work(next);active=work;
        synchronized(lock){setState(next,DownloadJob.State.RUNNING);next.error="";next.phase=DownloadJob.Phase.EXTRACTION;}
        if(!save()){active=null;return;}changed();transfer.execute(()->run(work));
    }
    private void run(Work work) {
        LibraryItem complete=null;Exception failure=null;QueueRecord r=work.record;
        try {
            work.cancellation.throwIfCancelled();complete=library.item(r.id);
            if(complete==null || complete.isMissing()) {
                int retries=0,rebinds=0;
                while(true) {
                    work.cancellation.throwIfCancelled();setPhase(work,DownloadJob.Phase.EXTRACTION);
                    try {
                        DownloadResolver.ResolvedDownload resolved=resolver.resolve(r.request.copy(),work.cancellation);
                        if(resolved==null || resolved.tracks.isEmpty() || resolved.tracks.size()>3) throw new DownloadResolver.Failure(DownloadResolver.Failure.Category.UNSUPPORTED,"This format is unavailable.");
                        String container=DownloadPolicy.extension(resolved.container);List<DownloadAssembler.Input> inputs=new ArrayList<>();
                        long prior=0,total=0;boolean known=true;
                        for(DownloadResolver.Track t:resolved.tracks){if(t.expectedBytes<=0)known=false;else total+=t.expectedBytes;}
                        final long expected=known?total:-1;
                        for(int i=0;i<resolved.tracks.size();i++) {
                            DownloadResolver.Track track=resolved.tracks.get(i);setPhase(work,phase(track.role));
                            File part=DownloadStorage.child(storage.work,r.id+"-"+i+".part");final long before=prior;
                            new DownloadTransfer().download(track,part,work.cancellation,(bytes,length)->progress(work,before+bytes,expected));
                            prior+=part.length();inputs.add(new DownloadAssembler.Input(part,track.role));
                        }
                        progress(work,prior,prior);setPhase(work,DownloadJob.Phase.MUX);
                        File output=DownloadStorage.child(storage.work,r.id+".assembled");
                        DownloadAssembler.assemble(inputs,output,container,r.request.kind,work.cancellation);
                        work.cancellation.throwIfCancelled();setPhase(work,DownloadJob.Phase.LIBRARY_MOVE);
                        complete=library.accept(output,r,container);break;
                    }catch(Exception e) {
                        work.cancellation.throwIfCancelled();
                        boolean auth=e instanceof DownloadTransfer.HttpFailure && (((DownloadTransfer.HttpFailure)e).status==401 || ((DownloadTransfer.HttpFailure)e).status==403);
                        boolean transientFailure=e instanceof DownloadTransfer.HttpFailure?DownloadPolicy.retryHttp(((DownloadTransfer.HttpFailure)e).status):!(e instanceof DownloadResolver.Failure) || ((DownloadResolver.Failure)e).category==DownloadResolver.Failure.Category.NETWORK;
                        if(auth && rebinds++<1) continue;
                        if(!auth && transientFailure && r.phase!=DownloadJob.Phase.MUX && r.phase!=DownloadJob.Phase.LIBRARY_MOVE && retries<3) {
                            long delay=DownloadPolicy.retryDelay(retries++);synchronized(lock){r.retries=retries;}changed();
                            for(long until=System.currentTimeMillis()+delay;System.currentTimeMillis()<until;){work.cancellation.throwIfCancelled();Thread.sleep(Math.min(100,Math.max(1,until-System.currentTimeMillis())));}continue;
                        }
                        throw e;
                    }
                }
            }
            if(!work.cancellation.isCancelled() && r.request.postAction==DownloadRequest.PostAction.SAVE_TO_GALLERY) {
                try {library.exportBlocking(complete.id);}catch(Exception e){synchronized(lock){r.output=complete.id;r.phase=DownloadJob.Phase.SHARE;}throw new DeliveryFailure();}
            }
        }catch(Exception e) {failure=e;}
        final LibraryItem output=complete;final Exception error=failure;
        control.execute(()->{
            synchronized(lock) {
                if(!work.cancellation.isCancelled() && r.state==DownloadJob.State.RUNNING) {
                    if(error==null && output!=null)finishRecord(r,output);
                    else if(error instanceof DeliveryFailure){setState(r,DownloadJob.State.WAITING_FOR_DELIVERY);r.error="The file is saved in Vault. Retry exporting when you are ready.";}
                    else {setState(r,DownloadJob.State.FAILED);r.error=safeError(error,r.phase);}
                } else if(r.state==DownloadJob.State.RUNNING) {setState(r,DownloadJob.State.QUEUED);}
            }
            active=null;save();
            if(r.state==DownloadJob.State.SUCCEEDED || r.state==DownloadJob.State.WAITING_FOR_DELIVERY || r.state==DownloadJob.State.CANCELLED)cleanWork(r.id);
            changed();pump();
        });
    }
    private static final class DeliveryFailure extends IOException {}
    private void finishRecord(QueueRecord r,LibraryItem output) {
        r.output=output.id;r.bytes=r.total=Math.max(r.bytes,output.fileSize);r.error="";
        if(r.request.postAction==DownloadRequest.PostAction.ASK || r.request.postAction==DownloadRequest.PostAction.SHARE) {r.state=DownloadJob.State.WAITING_FOR_DELIVERY;r.phase=DownloadJob.Phase.SHARE;}
        else {r.state=DownloadJob.State.SUCCEEDED;r.phase=DownloadJob.Phase.FINISHED;}
        r.updated=System.currentTimeMillis();
        DebugLog.write("download","state="+r.state+" phase="+r.phase+" bytes="+r.bytes);
    }
    private void setPhase(Work work,DownloadJob.Phase phase) throws IOException {
        work.cancellation.throwIfCancelled();synchronized(lock){work.record.phase=phase;work.record.updated=System.currentTimeMillis();}DebugLog.write("download","phase="+phase);changed();
    }
    private void progress(Work work,long bytes,long total) {
        long now=System.currentTimeMillis();synchronized(lock){work.record.bytes=bytes;work.record.total=total;work.record.updated=now;}
        if(now-work.lastProgress>=300){work.lastProgress=now;changed();}
    }
    private static DownloadJob.Phase phase(DownloadResolver.Role role) {
        switch(role) {case AUDIO:return DownloadJob.Phase.AUDIO_TRANSFER;case CAPTIONS:return DownloadJob.Phase.CAPTIONS_TRANSFER;case THUMBNAIL:return DownloadJob.Phase.THUMBNAIL_TRANSFER;default:return DownloadJob.Phase.VIDEO_TRANSFER;}
    }
    public void deliver(String id,DownloadRequest.PostAction action,Callback<LibraryItem> callback) {
        QueueRecord record;synchronized(lock){record=find(id);}
        LibraryItem item=record==null?null:library.item(record.output);
        if(item==null || item.isMissing()){callback(callback,null,"The saved file is unavailable.");return;}
        if(action==DownloadRequest.PostAction.SAVE_TO_GALLERY) {
            library.exportToMediaStore(item.id,(uri,error)->{if(error==null)finishDelivery(id);callback(callback,error==null?item:null,error);});
        } else if(action==DownloadRequest.PostAction.KEEP) {finishDelivery(id);callback(callback,item,null);}
        else callback(callback,item,null);
    }
    public void finishDelivery(String id) {control.execute(()->{synchronized(lock){QueueRecord r=find(id);if(r==null || r.state!=DownloadJob.State.WAITING_FOR_DELIVERY)return;setState(r,DownloadJob.State.SUCCEEDED);r.phase=DownloadJob.Phase.FINISHED;r.error="";}save();changed();});}
    private void cleanWork(String id) {
        if(storage==null)return;File[] files=storage.work.listFiles();if(files==null)return;
        // Library imports and rollback files share this directory but have a separate IO owner.
        // A resolved download has at most three tracks, plus its assembled output.
        for(File file:files) {
            String name=file.getName(),prefix=id+"-";
            boolean part=name.startsWith(prefix) && name.substring(prefix.length()).matches("[0-2]\\.part(\\.identity)?");
            if(name.equals(id+".assembled") || part)try{java.nio.file.Files.deleteIfExists(DownloadStorage.child(storage.work,name).toPath());}catch(IOException ignored){}
        }
    }
    private void cleanAbandonedWork() {
        File[] files=storage.work.listFiles();if(files==null)return;
        for(File file:files) {
            String name=file.getName();if(name.length()<36)continue;String id=name.substring(0,36);QueueRecord r=find(id);
            if(r==null || r.state==DownloadJob.State.SUCCEEDED || r.state==DownloadJob.State.CANCELLED || r.state==DownloadJob.State.WAITING_FOR_DELIVERY)cleanWork(id);
        }
    }
    static String safeError(Exception error,DownloadJob.Phase phase) {
        if(error instanceof DownloadResolver.Failure) {
            switch(((DownloadResolver.Failure)error).category) {
                case AUTHENTICATION:return "YouTube requires sign-in or has restricted this download.";
                case UNAVAILABLE:return "This video or selected format is unavailable.";
                case UNSUPPORTED:return "This format cannot be downloaded. Choose another option.";
                case STORAGE:return "Not enough free storage to save this download.";
                default:return "The network request failed. Check your connection and retry.";
            }
        }
        if(error instanceof DownloadTransfer.HttpFailure)return "The media server refused the transfer (HTTP "+((DownloadTransfer.HttpFailure)error).status+"). Retry to refresh its address.";
        if(phase==DownloadJob.Phase.MUX)return "Android could not assemble this format. Try another MP4 or WebM option.";
        if(phase==DownloadJob.Phase.LIBRARY_MOVE)return "The file could not be added to Vault. Check free storage and retry.";
        return "The download was interrupted. Check your connection and free storage, then retry.";
    }
}
