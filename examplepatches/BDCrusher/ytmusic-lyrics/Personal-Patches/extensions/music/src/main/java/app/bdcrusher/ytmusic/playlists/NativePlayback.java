/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import java.util.*;
import app.morphe.extension.shared.Utils;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;

/** Every entry opens the native Music watch flow, never the legacy file player. */
public final class NativePlayback {
    private NativePlayback(){}
    public static void open(String id){
        String playlist="";int position=-1;
        outer:for(var batch:PlaylistRuntime.snapshot()){var entries=batch.optJSONArray("entries");for(int i=0;entries!=null&&i<entries.length();i++)if(id.equals(entries.optJSONObject(i).optString("id"))){playlist=batch.optString("id");position=i;break outer;}}
        open(id,playlist,position);
    }
    public static void open(String id,String playlist,int position){
        if(id==null||!id.matches("[A-Za-z0-9_-]{11}"))return;Activity activity=Utils.getActivity();if(activity==null)return;
        if(PlaylistBrowse.offline()&&LocalPlayback.response(id)==null){Utils.showToastShort("Saved playback metadata is not ready. Connect once to prepare this recording.");return;}
        Uri.Builder uri=Uri.parse("https://music.youtube.com/watch").buildUpon().appendQueryParameter("v",id);
        if(PlaylistHeaderModel.validId(playlist)){uri.appendQueryParameter("list",playlist);if(position>=0)uri.appendQueryParameter("index",Integer.toString(position));}
        final Uri target=uri.build();Utils.runOnMainThread(()->{try{
            // Stop only the retired local player; the native player handles replacement itself.
            activity.stopService(new Intent(activity,app.morphe.extension.music.patches.downloads.OfflinePlaybackService.class));
            activity.startActivity(new Intent(Intent.ACTION_VIEW,target).setPackage(activity.getPackageName()));
            FeatureDiagnostics.record("Downloads-playback","Native watch opened; saved="+(LocalPlayback.response(id)!=null)+"; playlist="+PlaylistHeaderModel.validId(playlist));
        }catch(RuntimeException failure){Utils.showToastShort("Could not open the native music player");FeatureDiagnostics.record("Downloads-playback",failure.getClass().getSimpleName());}});
    }
}
