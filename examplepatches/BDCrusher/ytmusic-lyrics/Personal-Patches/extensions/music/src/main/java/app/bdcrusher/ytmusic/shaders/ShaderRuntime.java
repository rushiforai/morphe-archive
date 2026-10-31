/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.shaders;
import android.content.*;
import android.graphics.Bitmap;
import android.media.MediaMetadata;
import android.media.session.PlaybackState;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.*;
import org.json.*;
import app.bdcrusher.ytmusic.common.PersonalRuntime;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;
import app.morphe.extension.music.shared.VideoInformation;
import app.morphe.extension.shared.Utils;

/** Typed native callbacks. Only registered player/native Lyrics containers can host effects. */
public final class ShaderRuntime {
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static final Map<View,Binding> surfaces=new WeakHashMap<>();
    private static final Map<View,Boolean> watched=new WeakHashMap<>();
    private static MediaMetadata metadata;
    private static Bitmap artwork;
    private static String media;
    private static boolean foreground=true;
    private static int failures;
    public static void hostVisible(boolean shown){foreground=shown;if(watching)main.post(ShaderRuntime::refresh);}
    static boolean wantsAnimatedFrame(){return watching&&preferences.getBoolean("background",true)&&preferences.getBoolean("animateBackground",true);}
    static void animatedFrame(Bitmap frame){if(artwork==null)artwork=frame.copy(Bitmap.Config.ARGB_8888,false);for(Binding b:new ArrayList<>(surfaces.values()))if(b.active&&!b.cover)b.image(frame,generation);ShaderSurface.IMAGES.execute(frame::recycle);}
    private static String identity="",mediaKey="";
    private static int generation;
    private static int panelEpoch;
    private static Runnable panelRetry;
    private static String frameFor="";
    private static boolean playing,watching;
    private static volatile boolean effectsActive;
    private static SharedPreferences preferences;
    private static ArtworkRepository.Track currentTrack;
    private static long lastLookup;
    private static WeakReference<View> lyricsBody=new WeakReference<>(null);
    private static WeakReference<Object> panelOwner=new WeakReference<>(null);
    private ShaderRuntime(){}
    static int generation(){return generation;}
    public static boolean isEffectSurface(View view){return view instanceof ShaderSurface||view instanceof AnimatedCoverSurface;}
    private static boolean enabled(Context c){return PersonalRuntime.installed(c,"shaders");}
    private static final SharedPreferences.OnSharedPreferenceChangeListener changed=(p,k)->main.post(()->{refresh();if("mediaLimit".equals(k))ArtworkRepository.trim(Utils.getContext());if("artworkToken".equals(k)||"enabled".equals(k)){lastLookup=0;retryArtwork();}});
    private static void init(Context c){if(!watching){watching=true;preferences=ArtworkRepository.preferences(c);preferences.registerOnSharedPreferenceChangeListener(changed);ArtworkRepository.trim(c);VideoInformation.addVideoIdListener(id->main.post(ShaderRuntime::track));
        try{android.net.ConnectivityManager connectivity=(android.net.ConnectivityManager)c.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE);connectivity.registerDefaultNetworkCallback(new android.net.ConnectivityManager.NetworkCallback(){private boolean usable;@Override public void onCapabilitiesChanged(android.net.Network n,android.net.NetworkCapabilities capabilities){boolean next=capabilities.hasTransport(android.net.NetworkCapabilities.TRANSPORT_WIFI)&&capabilities.hasCapability(android.net.NetworkCapabilities.NET_CAPABILITY_NOT_METERED);boolean recovered=next&&!usable;usable=next;if(recovered)main.post(()->{lastLookup=0;retryArtwork();});}@Override public void onLost(android.net.Network n){usable=false;}});}catch(Exception unavailable){}
    }}
    static boolean active(){return effectsActive;}
    static void retryArtwork(){
        if(currentTrack==null||media!=null||!active()||lastLookup!=0&&SystemClock.elapsedRealtime()-lastLookup<30000)return;
        lastLookup=SystemClock.elapsedRealtime();int expected=generation;
        ArtworkRepository.lookup(Utils.getContext(),currentTrack,(file,key)->{if(generation!=expected)return;media=file;mediaKey=key;if(artwork==null&&file!=null)nativePoster();refresh();});
    }
    public static void onMetadata(MediaMetadata value){main.post(()->{metadata=value;track();});}
    public static void onPlayback(PlaybackState value){boolean active=value!=null&&value.getState()==PlaybackState.STATE_PLAYING;main.post(()->{playing=active;refresh();});}
    private static void track(){
        Context c=Utils.getActivity();if(c==null||!enabled(c)||metadata==null)return;init(c);
        String id=VideoInformation.getVideoId();if(id==null||!id.matches("[A-Za-z0-9_-]{11}"))return;
        String mediaId=metadata.getString(MediaMetadata.METADATA_KEY_MEDIA_ID);if(mediaId!=null&&mediaId.matches("[A-Za-z0-9_-]{11}")&&!id.equals(mediaId))return;
        String title=metadata.getString(MediaMetadata.METADATA_KEY_TITLE),artist=metadata.getString(MediaMetadata.METADATA_KEY_ARTIST),album=metadata.getString(MediaMetadata.METADATA_KEY_ALBUM);
        if(title==null||artist==null)return;String next=id+"|"+title+"|"+artist+"|"+album;
        if(next.equals(identity)){refresh();return;}boolean sameRecording=identity.startsWith(id+"|");identity=next;if(!sameRecording){generation++;media=null;mediaKey="";frameFor="";failures=0;}int expected=generation;
        Bitmap cover=metadata.getBitmap(MediaMetadata.METADATA_KEY_ART);if(cover==null)cover=metadata.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);if(cover==null)cover=metadata.getBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON);if(cover!=null||!sameRecording)artwork=cover;
        for(Binding binding:new ArrayList<>(surfaces.values())){if(!sameRecording)binding.clearImage();if(artwork!=null)binding.image(artwork,expected);}
        currentTrack=new ArtworkRepository.Track(id,title,artist,album==null?"":album,(int)(metadata.getLong(MediaMetadata.METADATA_KEY_DURATION)/1000));lastLookup=0;retryArtwork();refresh();
    }
    @android.annotation.SuppressLint("ResourceType")
    public static void onArtwork(View player,Bitmap bitmap){
        if(!enabled(player.getContext()))return;if(bitmap!=null)artwork=bitmap;
        View anchor=player.findViewById(thumbnailId()); // Exact APK resource verified with the artwork-owner fingerprint.
        if(anchor!=null)watch(anchor,true);for(Binding binding:new ArrayList<>(surfaces.values())){if(bitmap!=null)binding.image(bitmap,generation);}refresh();
    }
    public static void onPlayerBackground(View view){if(enabled(view.getContext()))watch(view,false);}
    private static void watch(View anchor,boolean cover){
        init(anchor.getContext());
        if(!watched.containsKey(anchor)){
            watched.put(anchor,cover);
            anchor.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
                public void onViewAttachedToWindow(View v){watch(v,cover);}
                public void onViewDetachedFromWindow(View v){Binding old=surfaces.remove(v);if(old!=null)old.close();}
            });
        }
        Binding existing=surfaces.get(anchor);if(existing!=null){existing.update();return;}
        if(anchor.getParent() instanceof ViewGroup parent&&anchor.isAttachedToWindow()){Binding binding=new Binding(anchor,parent,cover);surfaces.put(anchor,binding);track();binding.update();}
    }
    public static void onNativeLayout(){if(watching)refresh();}
    static void refresh(){if(!watching)return;Object owner=panelOwner.get();if(owner!=null)attachLyrics(owner,0,panelEpoch);nativePoster();effectsActive=false;for(Binding binding:new ArrayList<>(surfaces.values())){binding.update();effectsActive|=binding.active;}if(effectsActive)retryArtwork();}
    static void mediaFailed(){ArtworkRepository.invalidate(Utils.getContext(),mediaKey);media=null;lastLookup=SystemClock.elapsedRealtime();refresh();int expected=generation;if(++failures<=3)main.postDelayed(()->{if(expected==generation&&active()){lastLookup=0;retryArtwork();}},3000);}
    static boolean requestProof(int id,JSONObject challenge){for(Binding binding:new ArrayList<>(surfaces.values()))if(binding.surface instanceof ShaderSurface background&&background.solve(id,challenge))return true;return false;}
    public static void onNativePanel(Object panel){
        main.post(()->{
            if(panel==panelOwner.get()){if(panel!=null)attachLyrics(panel,0,panelEpoch);refresh();return;}panelOwner=new WeakReference<>(panel);
            int epoch=++panelEpoch;
            if(panelRetry!=null){main.removeCallbacks(panelRetry);panelRetry=null;}
            View previous=lyricsBody.get();if(previous!=null){Binding old=surfaces.remove(previous);if(old!=null)old.close();lyricsBody.clear();}
            if(panel==null){refresh();return;}
            try{String id=nativePanelId(panel);if(!"music_watch_lyrics_panel".equals(id)&&!"music_offline_lyrics_panel".equals(id)){refresh();return;}attachLyrics(panel,0,epoch);}
            catch(Exception ignored){}
        });
    }
    private static void attachLyrics(Object panel,int attempt,int epoch){
        if(epoch!=panelEpoch)return;
        try{View root=nativePanelView(panel);if(root==null){retryPanel(panel,attempt,epoch);return;}if(!enabled(root.getContext()))return;if(!(root instanceof FrameLayout body))return;
            if(!root.isAttachedToWindow()){retryPanel(panel,attempt,epoch);return;}
            if(panelRetry!=null){main.removeCallbacks(panelRetry);panelRetry=null;}
            if(surfaces.containsKey(root)){lyricsBody=new WeakReference<>(root);return;}View previous=lyricsBody.get();if(previous!=null&&previous!=root){Binding old=surfaces.remove(previous);if(old!=null)old.close();}
            Binding binding=new Binding(root,body,false);surfaces.put(root,binding);lyricsBody=new WeakReference<>(root);PersonalRuntime.lyricsViewport(root);binding.update();
        }catch(Exception ignored){}
    }
    private static void retryPanel(Object panel,int attempt,int epoch){
        if(attempt>=120||panelRetry!=null)return;
        panelRetry=()->{panelRetry=null;attachLyrics(panel,attempt+1,epoch);};main.postDelayed(panelRetry,32);
    }
    // Replaced with typed native panel calls by the exact-target Shaders patch.
    private static int thumbnailId(){throw new IllegalStateException("Missing exact native artwork resource hook");}
    private static String nativePanelId(Object value){throw new IllegalStateException("Missing native panel identity hook");}
    private static View nativePanelView(Object value){throw new IllegalStateException("Missing native panel root hook");}
    private static boolean visible(View view){return view!=null&&view.isShown()&&view.getWindowVisibility()==View.VISIBLE&&view.hasWindowFocus()&&view.getAlpha()>0&&view.getGlobalVisibleRect(new android.graphics.Rect());}
    private static Bitmap bitmap(View view){if(view instanceof ImageView image&&image.getDrawable() instanceof android.graphics.drawable.BitmapDrawable d)return d.getBitmap();if(view instanceof android.view.ViewGroup group)for(int i=0;i<group.getChildCount();i++){Bitmap found=bitmap(group.getChildAt(i));if(found!=null)return found;}return null;}
    private static void nativePoster(){if(artwork!=null)return;for(Binding b:new ArrayList<>(surfaces.values()))if(b.cover){Bitmap value=bitmap(b.anchor);if(value!=null){artwork=value;for(Binding target:new ArrayList<>(surfaces.values()))target.image(value,generation);FeatureDiagnostics.event("Artwork-poster","Native thumbnail reused for background");break;}}}
    private static final class Binding implements AutoCloseable {
        final View anchor;final ViewGroup parent;final View surface;final boolean cover;
        boolean closed,active;
        final ViewTreeObserver.OnGlobalLayoutListener layout=this::update;
        final ViewTreeObserver.OnWindowFocusChangeListener focus=this::focusChanged;
        void focusChanged(boolean focused){refresh();if(focused){retryArtwork();ArtworkToken.ensure(anchor.getContext());}}
        final View.OnAttachStateChangeListener attachment=new View.OnAttachStateChangeListener(){public void onViewAttachedToWindow(View v){update();}public void onViewDetachedFromWindow(View v){surfaces.remove(anchor);close();}};
        Binding(View a,ViewGroup p,boolean image){
            anchor=a;parent=p;cover=image;surface=image?new AnimatedCoverSurface(a.getContext()):new ShaderSurface(a.getContext());
            surface.setClipToOutline(true);
            surface.setOutlineProvider(new ViewOutlineProvider(){@Override public void getOutline(View v,android.graphics.Outline out){ViewOutlineProvider provider=anchor.getOutlineProvider();if(provider!=null)provider.getOutline(anchor,out);}});
            ViewGroup.LayoutParams params=a==p?new FrameLayout.LayoutParams(-1,-1):a.getLayoutParams();
            int index=a==p?0:p.indexOfChild(a)+1;p.addView(surface,index,params);
            a.addOnAttachStateChangeListener(attachment);a.getViewTreeObserver().addOnGlobalLayoutListener(layout);a.getViewTreeObserver().addOnWindowFocusChangeListener(focus);
            if(artwork!=null)image(artwork,generation);update();
        }
        void image(Bitmap value,int expected){if(surface instanceof ShaderSurface background)background.image(value,expected);}
        void clearImage(){if(surface instanceof ShaderSurface background)background.clearImage();}
        void update(){
            if(closed)return;SharedPreferences prefs=ArtworkRepository.preferences(anchor.getContext());boolean master=prefs.getBoolean("enabled",true);
            if(anchor!=parent){if(surface.getLayoutParams()!=anchor.getLayoutParams())surface.setLayoutParams(anchor.getLayoutParams());if(surface.getTranslationX()!=anchor.getTranslationX())surface.setTranslationX(anchor.getTranslationX());if(surface.getTranslationY()!=anchor.getTranslationY())surface.setTranslationY(anchor.getTranslationY());if(surface.getScaleX()!=anchor.getScaleX())surface.setScaleX(anchor.getScaleX());if(surface.getScaleY()!=anchor.getScaleY())surface.setScaleY(anchor.getScaleY());}
            boolean shown=master&&foreground&&visible(anchor);View panel=lyricsBody.get();if(panel!=null&&panel!=anchor&&visible(panel)&&(!cover||!wantsAnimatedFrame()))shown=false;
            active=shown&&(cover?prefs.getBoolean("animatedCover",true):prefs.getBoolean("background",true));
            int visibility=active?View.VISIBLE:View.INVISIBLE;if(surface.getVisibility()!=visibility)surface.setVisibility(visibility);
            surface.setAlpha(anchor==parent?1:anchor.getAlpha());
            boolean reduced=prefs.getBoolean("reducedMotion",false)||SettingsMotion.reduced(anchor.getContext());
            if(surface instanceof AnimatedCoverSurface animation){animation.update(media,active,playing,reduced);return;}
            try{
                ShaderSurface background=(ShaderSurface)surface;
                JSONObject options=new JSONObject().put("animateBackground",prefs.getBoolean("animateBackground",true)).put("fps",Integer.parseInt(prefs.getString("fps","30"))).put("speed",prefs.getInt("speed",100)/100.0).put("strength",prefs.getInt("strength",100)/100.0).put("saturation",prefs.getInt("saturation",150)/100.0).put("opacity",prefs.getInt("opacity",75)/100.0).put("dimming",prefs.getInt("dimming",30)/100.0).put("transition",prefs.getInt("transition",1000)).put("reducedMotion",reduced);
                JSONObject state=new JSONObject().put("frame",false).put("generation",generation).put("playing",playing).put("visible",active).put("background",true).put("image",background.imageUrl());
                background.update(state,options,null);
            }catch(Exception invalid){surface.setVisibility(View.INVISIBLE);}
        }
        public void close(){if(closed)return;closed=true;active=false;anchor.removeOnAttachStateChangeListener(attachment);if(anchor.getViewTreeObserver().isAlive()){anchor.getViewTreeObserver().removeOnGlobalLayoutListener(layout);anchor.getViewTreeObserver().removeOnWindowFocusChangeListener(focus);}parent.removeView(surface);if(surface instanceof ShaderSurface background)background.closeSurface();else ((AnimatedCoverSurface)surface).closeSurface();}
    }
    private static final class SettingsMotion {static boolean reduced(Context c){try{return android.provider.Settings.Global.getFloat(c.getContentResolver(),android.provider.Settings.Global.ANIMATOR_DURATION_SCALE,1)==0;}catch(Exception unavailable){return false;}}}
}
