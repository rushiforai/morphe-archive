/* Copyright 2026 BDCrusher. GPL-3.0. Native playlist presenter lifecycle, no row overlays. */
package app.bdcrusher.ytmusic.playlists;
import android.os.*;
import android.view.View;
import app.bdcrusher.ytmusic.lyrics.ProtoWire;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** Rebind only visible, changed native rows through their original typed presenter method. */
public final class PlaylistRows {
    public interface Owner {void bd_playlistRow(Object context,Object model,int nativeMode);View bd_playlistRowView();}
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final List<Row> rows=new ArrayList<>();
    private static boolean queued;
    private static final class Row {
        final WeakReference<Owner> owner;WeakReference<Object> context;Object model;int mode;String video="",state="";boolean replaying;
        Row(Owner owner){this.owner=new WeakReference<>(owner);}
    }
    private PlaylistRows(){}
    /** Native mode is opaque: retain it byte-for-byte rather than mistaking it for a playlist index. */
    public static byte[] capture(Owner owner,Object context,Object model,int nativeMode,byte[] bytes){
        rows.removeIf(row->row.owner.get()==null);Row current=null;for(Row row:rows)if(row.owner.get()==owner){current=row;break;}
        if(current!=null&&current.replaying)return PlaylistPageModel.rowStatus(bytes);
        String video="";try{ProtoWire watch=new ProtoWire(new ProtoWire(new ProtoWire(bytes).child(5)).child(48687757));String playlist=new String(watch.child(2),StandardCharsets.US_ASCII);if(PlaylistHeaderModel.validId(playlist))video=new String(watch.child(1),StandardCharsets.US_ASCII);}catch(IllegalArgumentException ignored){}
        if(bytes.length>256*1024||!video.matches("[A-Za-z0-9_-]{11}")){if(current!=null)rows.remove(current);return bytes;}
        if(current==null){current=new Row(owner);if(rows.size()>=128)rows.remove(0);rows.add(current);}
        current.context=new WeakReference<>(context);current.model=model;current.mode=nativeMode;current.video=video;current.state=PlaylistRuntime.state(video);return PlaylistPageModel.rowStatus(bytes);
    }
    public static void changed(){if(queued)return;queued=true;MAIN.postDelayed(PlaylistRows::refresh,500);}
    private static void refresh(){
        queued=false;rows.removeIf(row->row.owner.get()==null);
        for(Row row:List.copyOf(rows)){
            Owner owner=row.owner.get();Object context=row.context.get();if(owner==null||context==null||row.replaying)continue;
            String state=PlaylistRuntime.state(row.video);if(state.equals(row.state))continue;
            View view=owner.bd_playlistRowView();if(view==null||!view.isAttachedToWindow()||!view.isShown())continue;
            row.replaying=true;try{owner.bd_playlistRow(context,row.model,row.mode);row.state=state;}catch(Exception failure){FeatureDiagnostics.record("Playlist-row","Native status rebind failed: "+failure.getClass().getSimpleName());}finally{row.replaying=false;}
        }
    }
}
