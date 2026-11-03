/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

import android.view.*;
import android.widget.*;
import android.graphics.Bitmap;
import android.app.AlertDialog;
import java.util.*;
import java.util.concurrent.*;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.theme.ThemeUtils;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;
import app.morphe.extension.music.patches.downloads.OfflineTrack;

/** Virtualized owned-media catalogue inside the native Library Downloads content frame. */
public final class DownloadsHost {
    public interface Owner {ViewGroup bd_downloadContent();boolean bd_downloadDestination();}
    private static final WeakHashMap<Object,Pane> panes=new WeakHashMap<>();
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private DownloadsHost(){}
    public static void changed(Object value){
        if(!(value instanceof Owner owner))return;
        try{
            ViewGroup host=owner.bd_downloadContent();Pane old=panes.get(value);
            if(host==null||!owner.bd_downloadDestination()){release(value);return;}
            if(old!=null&&!old.closed&&old.host==host){old.occupy();old.refresh();return;}
            if(old!=null)old.close();Pane pane=new Pane(host);panes.put(value,pane);pane.occupy();pane.refresh();
            FeatureDiagnostics.record("Downloads-library","Owned catalogue attached inside native Downloads destination");
        }catch(RuntimeException failure){FeatureDiagnostics.record("Downloads-library","Native content binding failed: "+failure.getClass().getSimpleName());}
    }
    public static void release(Object value){Pane pane=panes.remove(value);if(pane!=null)pane.close();}
    private record Pending(DownloadCatalog.Progress job,String title){}
    private static final class Pane {
        final ViewGroup host;
        final ListView list;
        final Map<View,Integer> hidden=new IdentityHashMap<>();
        final Runnable listener=this::refresh;
        final android.util.LruCache<String,Bitmap> covers=new android.util.LruCache<>(24);
        final Set<String> loadingCovers=new HashSet<>();
        final Adapter adapter=new Adapter();
        List<Object> items=List.of();boolean closed,loading,again;
        Pane(ViewGroup host){
            this.host=host;list=new ListView(host.getContext());list.setDivider(null);
            list.setVerticalScrollBarEnabled(false);list.setClipToPadding(false);
            list.setPadding(dp(16),dp(8),dp(16),dp(32));list.setBackgroundColor(ThemeUtils.getAppBackgroundColor());
            list.setAdapter(adapter);DownloadCatalog.add(listener);PlaylistRuntime.addListener(listener);
            list.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
                public void onViewAttachedToWindow(View v){}
                public void onViewDetachedFromWindow(View v){close();v.removeOnAttachStateChangeListener(this);}
            });
        }
        int dp(int n){return Math.round(n*host.getResources().getDisplayMetrics().density);}
        TextView text(String s,int size){TextView t=new TextView(host.getContext());t.setText(s);t.setTextSize(size);t.setTextColor(ThemeUtils.getAppForegroundColor());return t;}
        void occupy(){
            if(closed)return;
            for(int n=0;n<host.getChildCount();n++){View v=host.getChildAt(n);if(v!=list){hidden.putIfAbsent(v,v.getVisibility());v.setVisibility(View.GONE);}}
            if(list.getParent()==null)host.addView(list,new ViewGroup.LayoutParams(-1,-1));list.setVisibility(View.VISIBLE);
        }
        void close(){
            if(closed)return;closed=true;DownloadCatalog.remove(listener);PlaylistRuntime.removeListener(listener);
            if(list.getParent()==host)host.removeView(list);
            for(var e:hidden.entrySet())if(e.getKey().getParent()==host)e.getKey().setVisibility(e.getValue());
            hidden.clear();covers.evictAll();
        }
        void refresh(){
            if(android.os.Looper.myLooper()!=android.os.Looper.getMainLooper()){Utils.runOnMainThread(this::refresh);return;}
            if(closed||!host.isShown())return;if(loading){again=true;return;}loading=true;
            IO.execute(()->{
                var tracks=DownloadCatalog.tracks();var pending=DownloadCatalog.pending();var batches=PlaylistRuntime.snapshot();
                List<Object> next=new ArrayList<>();next.add(tracks.size()+" downloaded \u00b7 "+pending.size()+" pending");
                if(tracks.isEmpty()&&pending.isEmpty())next.add("Music you download will appear here");
                Set<String> pendingIds=new HashSet<>();
                for(var job:pending){pendingIds.add(job.id());String title=OfflineTrack.load(new java.io.File(DownloadCatalog.directory(),job.id()+".webm")).displayTitle();
                    if(title.equals(job.id()))for(var batch:batches){var entries=batch.optJSONArray("entries");for(int i=0;entries!=null&&i<entries.length();i++){var entry=entries.optJSONObject(i);if(entry!=null&&job.id().equals(entry.optString("id"))&&!entry.optString("title").isEmpty()){title=entry.optString("title");break;}}}
                    next.add(new Pending(job,title));
                }
                for(var track:tracks)if(!pendingIds.contains(track.videoId()))next.add(track);if(!batches.isEmpty()){next.add("Playlists");next.addAll(batches);}
                Utils.runOnMainThread(()->{loading=false;if(closed)return;items=List.copyOf(next);adapter.notifyDataSetChanged();if(again){again=false;list.postDelayed(this::refresh,250);}});
            });
        }
        private final class Adapter extends BaseAdapter {
            public int getCount(){return items.size();}public Object getItem(int n){return items.get(n);}public long getItemId(int n){return n;}
            public View getView(int n,View recycled,ViewGroup parent){
                Object item=getItem(n);LinearLayout row=recycled instanceof LinearLayout?(LinearLayout)recycled:new LinearLayout(host.getContext());
                row.removeAllViews();row.setOrientation(LinearLayout.HORIZONTAL);row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(0,dp(12),0,dp(12));row.setMinimumHeight(dp(64));row.setOnClickListener(null);row.setOnLongClickListener(null);row.setContentDescription(null);
                if(item instanceof String heading){TextView t=text(heading,16);t.setPadding(0,dp(8),0,dp(8));row.addView(t);return row;}
                if(item instanceof Pending pending){var job=pending.job();
                    LinearLayout labels=new LinearLayout(host.getContext());labels.setOrientation(LinearLayout.VERTICAL);
                    TextView title=text(pending.title(),16);title.setMaxLines(2);labels.addView(title);
                    TextView status=text(DownloadCatalog.label(job.id()),14);status.setTextColor(0xff3ea6ff);labels.addView(status);row.addView(labels,new LinearLayout.LayoutParams(0,-2,1));
                    row.setOnClickListener(v->{if(LocalPlayback.response(job.id())!=null)NativePlayback.open(job.id());});
                    Button action=new Button(host.getContext());boolean running=job.state().equals("downloading");
                    action.setText(running?"Downloading":job.state().equals("queued")?"Resume":"Retry");action.setEnabled(!running);
                    action.setOnClickListener(v->app.morphe.extension.music.patches.downloads.LocalDownloadManager.enqueueMedia(job.id(),job.selection()));row.addView(action);
                    row.setOnLongClickListener(v->{new AlertDialog.Builder(host.getContext()).setMessage(job.detail().isEmpty()?DownloadCatalog.label(job.id()):job.detail()).setPositiveButton("OK",null).show();return true;});return row;
                }
                if(item instanceof org.json.JSONObject batch){
                    TextView label=text(batch.optString("title",batch.optString("id"))+"\n"+batch.optInt("available")+" saved \u00b7 "+batch.optString("status"),16);
                    row.addView(label,new LinearLayout.LayoutParams(0,-2,1));Button more=new Button(host.getContext());more.setText("\u22ee");more.setContentDescription("Playlist download actions");
                    more.setOnClickListener(v->batchActions(batch.optString("id")));row.addView(more,new LinearLayout.LayoutParams(dp(48),dp(48)));
                    row.setOnClickListener(v->PlaylistRuntime.play(Utils.getActivity(),batch));return row;
                }
                OfflineTrack track=(OfflineTrack)item;ImageView cover=new ImageView(host.getContext());cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
                row.addView(cover,new LinearLayout.LayoutParams(dp(56),dp(56)));Bitmap cached=covers.get(track.videoId());
                if(cached!=null)cover.setImageBitmap(cached);else if(loadingCovers.add(track.videoId()))IO.execute(()->{
                    Bitmap image=track.artwork(dp(112));Utils.runOnMainThread(()->{loadingCovers.remove(track.videoId());if(closed||image==null)return;covers.put(track.videoId(),image);adapter.notifyDataSetChanged();});
                });
                LinearLayout labels=new LinearLayout(host.getContext());labels.setOrientation(LinearLayout.VERTICAL);labels.setPadding(dp(14),0,dp(8),0);
                TextView title=text(track.displayTitle(),16);title.setMaxLines(2);title.setEllipsize(android.text.TextUtils.TruncateAt.END);labels.addView(title);
                TextView artist=text("Downloaded \u00b7 "+track.displayArtist(),14);artist.setText(DownloadText.spans(artist.getText()));artist.setAlpha(.7f);labels.addView(artist);
                java.io.File video=DownloadCatalog.video(track.videoId());String media=video==null?"Audio":"Video + audio";
                TextView size=text(media+" \u00b7 "+android.text.format.Formatter.formatShortFileSize(host.getContext(),track.audioFile().length()+(video==null?0:video.length())),12);
                size.setAlpha(.6f);labels.addView(size);row.addView(labels,new LinearLayout.LayoutParams(0,-2,1));Button more=new Button(host.getContext());more.setText("\u22ee");
                more.setContentDescription("Actions for "+track.displayTitle());more.setOnClickListener(v->actions(track));row.addView(more,new LinearLayout.LayoutParams(dp(48),dp(48)));
                row.setOnClickListener(v->NativePlayback.open(track.videoId()));row.setContentDescription(track.displayTitle()+", "+track.displayArtist()+", downloaded "+media);return row;
            }
        }
        void actions(OfflineTrack track){
            new AlertDialog.Builder(host.getContext()).setTitle(track.displayTitle()).setItems(new String[]{"Play","Download options","Delete download"},(d,n)->{
                if(n==0)NativePlayback.open(track.videoId());else if(n==1)DownloadPrompt.song(track.videoId());
                else new AlertDialog.Builder(host.getContext()).setMessage("Delete saved audio and video? Lyrics and settings are kept.").setNegativeButton("Cancel",null).setPositiveButton("Delete",(x,y)->IO.execute(()->{DownloadCatalog.delete(track.videoId());refresh();})).show();
            }).show();
        }
        void batchActions(String id){new AlertDialog.Builder(host.getContext()).setItems(new String[]{"Pause","Resume","Cancel remaining","Retry missing"},(d,n)->PlaylistRuntime.control(id,new String[]{"pause","resume","cancel","retry"}[n])).show();}
    }
}
