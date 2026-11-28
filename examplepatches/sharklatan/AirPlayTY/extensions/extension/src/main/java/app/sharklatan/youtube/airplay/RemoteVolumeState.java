package app.sharklatan.youtube.airplay;
/** Requested volume is separate from asynchronous receiver reports. No Android dependencies. */
final class RemoteVolumeState {
    private int requested=50;
    private long revision;
    synchronized int current(){return requested;}
    synchronized long revision(){return revision;}
    synchronized int adjust(int direction){
        // ADJUST_SAME (key release/UI refresh), mute flags and other values are not a +/- press.
        if(direction!=1&&direction!=-1)return -1;
        return request(requested+direction);
    }
    synchronized int request(int value){requested=Math.max(0,Math.min(100,value));revision++;return requested;}
    synchronized boolean report(long expected,int value){if(expected!=revision)return false;requested=Math.max(0,Math.min(100,value));return true;}
}
