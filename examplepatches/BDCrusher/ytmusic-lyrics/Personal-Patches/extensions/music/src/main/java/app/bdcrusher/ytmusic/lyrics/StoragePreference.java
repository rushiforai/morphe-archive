/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.*;
import android.preference.Preference;
import android.view.*;
import android.widget.*;
import org.json.JSONObject;
import java.io.File;
import java.util.*;
import java.util.concurrent.*;
import app.morphe.extension.shared.theme.ThemeUtils;

/** Native storage card: actual owned bytes, quality counts, touch and accessible callouts. */
@SuppressWarnings("deprecation")
public final class StoragePreference extends Preference {
    private static final ExecutorService io=Executors.newSingleThreadExecutor();
    private final boolean quality;
    public StoragePreference(Context c,boolean showQuality){super(c);quality=showQuality;setSelectable(false);}
    private int dp(float value){return Math.round(value*getContext().getResources().getDisplayMetrics().density);}
    static String bytes(long value){if(value<1024)return value+" B";if(value<1024L*1024)return String.format(Locale.getDefault(),"%.1f KiB",value/1024.0);if(value<1024L*1024*1024)return String.format(Locale.getDefault(),"%.1f MiB",value/(1024.0*1024));return String.format(Locale.getDefault(),"%.2f GiB",value/(1024.0*1024*1024));}
    private static long size(File directory){long total=0;File[] files=directory.listFiles();if(files!=null)for(File f:files){if(f.isFile())total+=f.length();}return total;}
    private static long count(File directory,String suffix){File[] files=directory.listFiles((d,n)->n.endsWith(suffix));return files==null?0:files.length;}
    @Override @android.annotation.SuppressLint("MissingSuperCall") protected View onCreateView(ViewGroup parent){
        Context c=getContext();LinearLayout card=new LinearLayout(c);card.setOrientation(LinearLayout.VERTICAL);card.setPadding(dp(16),dp(16),dp(16),dp(12));
        GradientDrawable bg=new GradientDrawable();bg.setColor((ThemeUtils.getAppForegroundColor()&0xffffff)|0x0d000000);bg.setCornerRadius(dp(18));card.setBackground(bg);
        TextView heading=text("Storage",18);heading.setTypeface(null,Typeface.BOLD);card.addView(heading);
        TextView summary=text("Calculating storage…",14);summary.setPadding(0,dp(6),0,dp(8));card.addView(summary);
        io.execute(()->{
            JSONObject library=new LyricsLibrary(c).stats();
            File prefs=new File(c.getApplicationInfo().dataDir,"shared_prefs");
            long preferences=new File(prefs,"bdcrusher_better_lyrics.xml").length()+new File(prefs,"bdcrusher_shaders.xml").length()+new File(prefs,"bdcrusher_playlist_downloads.xml").length()+new File(prefs,"bdcrusher_diagnostics.xml").length()+new File(c.getFilesDir(),"bdcrusher-last-diagnostics.txt").length();
            long[] amounts={library.optLong("bytes")+size(new File(c.getCacheDir(),"bdcrusher-lyrics-v1")),size(new File(c.getCacheDir(),"bdcrusher-shaders-media")),size(new File(c.getFilesDir(),"bdcrusher-shaders-art-metadata"))+size(new File(c.getFilesDir(),"bdcrusher-shaders-recordings")),preferences,size(new File(c.getExternalFilesDir(android.os.Environment.DIRECTORY_MUSIC),"Morphe")),size(new File(c.getFilesDir(),"bdcrusher-offline-playlists"))+size(new File(c.getFilesDir(),"bdcrusher-playlist-pages"))+size(new File(c.getFilesDir(),"bdcrusher-playlist-artwork"))};
            File audio=new File(c.getExternalFilesDir(android.os.Environment.DIRECTORY_MUSIC),"Morphe");
            long preferenceFiles=0;for(String name:new String[]{"bdcrusher_better_lyrics.xml","bdcrusher_shaders.xml","bdcrusher_playlist_downloads.xml","bdcrusher_diagnostics.xml"})if(new File(prefs,name).isFile())preferenceFiles++;
            long[] counts={library.optInt("songs")+count(new File(c.getCacheDir(),"bdcrusher-lyrics-v1"),".json"),count(new File(c.getCacheDir(),"bdcrusher-shaders-media"),".mp4"),count(new File(c.getFilesDir(),"bdcrusher-shaders-art-metadata"),".json")+count(new File(c.getFilesDir(),"bdcrusher-shaders-recordings"),".json"),preferenceFiles,count(audio,".m4a")+count(audio,".webm"),count(new File(c.getFilesDir(),"bdcrusher-offline-playlists"),".json")+count(new File(c.getFilesDir(),"bdcrusher-playlist-pages"),".page")+count(new File(c.getFilesDir(),"bdcrusher-playlist-artwork"),".jpg")};
            new Handler(Looper.getMainLooper()).post(()->{
                long total=0;for(long n:amounts)total+=n;summary.setText(bytes(total)+" · "+library.optInt("songs")+" saved songs");
                bar(card,new String[]{"Saved lyrics","Legacy animation files","Artwork lookup records","Settings","Offline music","Playlist pages and artwork"},amounts,new int[]{0xffa9d3ff,0xffc7a9ff,0xffedb6d1,0xffb9c4cf,0xff9cddb7,0xffffd28e},false,counts);
                if(quality){TextView title=text("Saved lyric quality",14);title.setPadding(0,dp(12),0,dp(6));card.addView(title);bar(card,new String[]{"Syllable","Word","Line","Plain"},new long[]{library.optInt("syllable"),library.optInt("word"),library.optInt("line"),library.optInt("plain")},new int[]{0xfffde69b,0xffaad1ff,0xffc9f8da,0xffb3b3b3},true,new long[]{library.optLong("syllableBytes"),library.optLong("wordBytes"),library.optLong("lineBytes"),library.optLong("plainBytes")});}
            });
        });app.bdcrusher.ytmusic.common.FeaturePreferences.card(card,false);return card;
    }
    private TextView text(String label,int sp){TextView view=new TextView(getContext());view.setText(label);view.setTextSize(sp);view.setTextColor(ThemeUtils.getAppForegroundColor());return view;}
    private void bar(LinearLayout root,String[] names,long[] values,int[] colors,boolean counts,long[] secondary){
        LinearLayout row=new LinearLayout(getContext());row.setOrientation(LinearLayout.HORIZONTAL);long total=0;for(long n:values)total+=n;
        for(int i=0;i<values.length;i++)if(values[i]>0){View segment=new View(getContext());segment.setBackgroundColor(colors[i]);String label=label(names[i],values[i],secondary[i],counts);segment.setContentDescription(label);segment.setFocusable(true);segment.setOnClickListener(v->callout(v,label));row.addView(segment,new LinearLayout.LayoutParams(0,dp(24),Math.max(.025f,(float)values[i]/Math.max(1,total))));}
        if(total==0){TextView empty=text("Nothing saved yet",14);row.addView(empty);}root.addView(row,new LinearLayout.LayoutParams(-1,-2));
        // Text legends keep very small segments reachable without relying on color or precision.
        for(int i=0;i<values.length;i++){String label=label(names[i],values[i],secondary[i],counts);TextView legend=text("●  "+label,13);android.text.SpannableString styled=new android.text.SpannableString("●  "+label);styled.setSpan(new android.text.style.ForegroundColorSpan(colors[i]),0,1,0);legend.setText(styled);legend.setCompoundDrawablePadding(dp(8));legend.setMinHeight(dp(40));legend.setGravity(Gravity.CENTER_VERTICAL);legend.setFocusable(true);legend.setOnClickListener(v->callout(v,label));root.addView(legend);}
    }
    private static String label(String name,long value,long secondary,boolean counts){return name+": "+(counts?value+" songs · "+bytes(secondary):bytes(value)+" · "+secondary+" items");}
    private void callout(View anchor,String label){TextView message=text(label,14);message.setPadding(dp(16),dp(12),dp(16),dp(12));GradientDrawable bg=new GradientDrawable();bg.setColor(ThemeUtils.getAppBackgroundColor());bg.setCornerRadius(dp(12));message.setBackground(bg);PopupWindow popup=new PopupWindow(message,-2,-2,true);popup.setBackgroundDrawable(bg);popup.setElevation(dp(12));popup.setOutsideTouchable(true);popup.showAsDropDown(anchor,0,dp(4));message.announceForAccessibility(label);}
}
