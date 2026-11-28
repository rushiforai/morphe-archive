package app.sharklatan.youtube.airplay;

/** Logical playback state. Transport acknowledgements and local rendering never imply remote success. */
final class PlaybackSession {
    enum Connection { DISCONNECTED, CONNECTING, LOADING, ACTIVE, LOST }
    private Connection connection=Connection.DISCONNECTED;
    private boolean desiredPlaying=true,reportedPlaying,ready,waiting,seeking;
    private long desiredPosition,confirmedPosition=-1,confirmedAt,seekRevision;
    synchronized void connect(long position,boolean playing){
        connection=Connection.CONNECTING;desiredPosition=Math.max(0,position);desiredPlaying=playing;
        confirmedPosition=-1;ready=false;waiting=true;seeking=false;seekRevision++;
    }
    synchronized void loading(){if(connection!=Connection.DISCONNECTED&&connection!=Connection.LOST)connection=Connection.LOADING;}
    synchronized void requestPlaying(boolean value){desiredPlaying=value;}
    synchronized long seek(long position){desiredPosition=Math.max(0,position);seeking=true;waiting=true;connection=Connection.LOADING;return ++seekRevision;}
    synchronized boolean report(long position,boolean playing,boolean isReady,boolean isWaiting,long now){
        if(connection==Connection.DISCONNECTED||connection==Connection.LOST||position<0)return false;
        confirmedPosition=position;confirmedAt=now;reportedPlaying=playing;ready=isReady;waiting=isWaiting;
        boolean completed=seeking&&isReady&&Math.abs(position-desiredPosition)<=2500;
        if(completed)seeking=false;
        if(isReady&&!seeking)connection=Connection.ACTIVE;
        return completed;
    }
    synchronized boolean desiredPlaying(){return desiredPlaying;}
    synchronized long target(){return desiredPosition;}
    synchronized long seekRevision(){return seekRevision;}
    synchronized boolean seeking(){return seeking;}
    synchronized Connection connection(){return connection;}
    synchronized boolean hasConfirmedPosition(){return confirmedPosition>=0;}
    synchronized boolean effectivePlaying(){return ready&&reportedPlaying&&!waiting;}
    synchronized long position(long now){
        if(confirmedPosition<0)return -1;
        return confirmedPosition+(effectivePlaying()?Math.max(0,now-confirmedAt):0);
    }
    synchronized void disconnect(boolean lost){connection=lost?Connection.LOST:Connection.DISCONNECTED;ready=false;waiting=false;seeking=false;confirmedPosition=-1;seekRevision++;}
}
