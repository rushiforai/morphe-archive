/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

/** APK-selected native click-tag identity helpers. No reflection or Now Playing fallback. */
public final class NativeDownloadContext {
    public static final String TAG="com.google.android.libraries.youtube.innertube.endpoint.tag";
    private NativeDownloadContext(){}
    public static String bd_video(Object tag){throw new IllegalStateException("Native download video adapter not installed");}
    public static String bd_playlist(Object tag){throw new IllegalStateException("Native download playlist adapter not installed");}
    public static DownloadCommand.Target target(Object tag){
        if(tag==null)return null;
        String video=bd_video(tag),playlist=bd_playlist(tag);
        // A row may also carry its surrounding playlist. Its explicit video identity wins.
        if(video!=null&&video.matches("[A-Za-z0-9_-]{11}"))return new DownloadCommand.Target(video,false);
        // Explicit 11-character string tags are recordings, including IDs beginning PL.
        if(tag instanceof String id&&id.matches("[A-Za-z0-9_-]{11}"))return new DownloadCommand.Target(id,false);
        if(playlist!=null&&playlist.startsWith("VL")&&PlaylistHeaderModel.validId(playlist.substring(2)))playlist=playlist.substring(2);
        if(PlaylistHeaderModel.validId(playlist))return new DownloadCommand.Target(playlist,true);
        // Native playlist-tag helper deliberately passes string tags through unchanged.
        // An explicit recording-ID tag is also usable; never call an object's toString().
        return null;
    }
}
