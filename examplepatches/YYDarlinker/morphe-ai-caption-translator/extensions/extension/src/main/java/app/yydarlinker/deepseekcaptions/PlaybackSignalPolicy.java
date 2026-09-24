package app.yydarlinker.deepseekcaptions;
/** Android's media-session signal is authoritative only when fresh and consistent with this video. */
final class PlaybackSignalPolicy {
    static long position(long raw,long rawAt,long epoch,long position,long updated,float speed,boolean playing,boolean paused,long now){
        if(position<0||updated<epoch||updated<=0||updated>now||rawAt<epoch||updated>rawAt+1000)return raw;
        if(!playing&&!paused)return raw;
        if(playing&&(!Float.isFinite(speed)||speed<=0||speed>4||now-updated>5000||now-rawAt>2500))return raw;
        long atRaw=position+(playing?Math.round(Math.max(0,rawAt-updated)*speed):0);
        if(Math.abs(atRaw-raw)>1500)return raw; // old video, seek, ad or unrelated player
        return playing?raw+Math.round(Math.min(1000,Math.max(0,now-rawAt))*speed):raw;
    }
}
