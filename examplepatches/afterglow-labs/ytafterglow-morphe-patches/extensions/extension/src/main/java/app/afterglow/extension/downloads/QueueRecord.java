package app.afterglow.extension.downloads;

final class QueueRecord {
    String id, error="", output="";
    DownloadRequest request;
    DownloadJob.State state=DownloadJob.State.QUEUED;
    DownloadJob.Phase phase=DownloadJob.Phase.EXTRACTION;
    long bytes, total=-1, created, updated, ordinal;
    int retries;
    DownloadJob snapshot() { return new DownloadJob(id,request,state,phase,bytes,total,created,updated,error,output,retries); }
    void recover() {
        if(state==DownloadJob.State.RUNNING || state==DownloadJob.State.QUEUED) { state=DownloadJob.State.QUEUED; phase=DownloadJob.Phase.EXTRACTION; }
        if(state==DownloadJob.State.PAUSED) phase=DownloadJob.Phase.EXTRACTION;
    }
}
