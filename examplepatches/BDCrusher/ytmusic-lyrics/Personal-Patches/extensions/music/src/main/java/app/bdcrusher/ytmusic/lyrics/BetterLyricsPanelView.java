/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.webkit.JavascriptInterface;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.webkit.RenderProcessGoneDetail;
import android.widget.FrameLayout;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;
import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import app.morphe.extension.music.patches.lyrics.LyricsManager;
import app.morphe.extension.music.patches.lyrics.model.Lyrics;
import app.morphe.extension.music.patches.lyrics.model.LyricsLine;
import app.morphe.extension.music.patches.lyrics.model.Word;
import app.morphe.extension.music.patches.lyrics.model.TrackInfo;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.music.shared.VideoInformation;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/** Local-only privileged renderer. Network services never load inside its native bridge origin. */
@SuppressLint("SetJavaScriptEnabled")
public final class BetterLyricsPanelView extends FrameLayout implements LyricsManager.Listener {
    private static final String ORIGIN="https://appassets.androidplatform.net";
    private static final String ROOT=ORIGIN+"/bdcrusher-lyrics/";
    private final Handler handler=new Handler(Looper.getMainLooper());
    private WebView web;
    private boolean ready,attached,hasDisplay;
    private volatile int generation;
    private String identity="";
    private String lastSettings="",lastInsets="";
    private final LyricsFrameRate frameRate=new LyricsFrameRate();
    private Boolean debug;private int rendererRecoveries;
    private int insetLeft,insetRight,insetBottom;
    private TrackInfo track;
    private final java.util.Map<View,Integer> covered=new java.util.IdentityHashMap<>();
    private final android.view.ViewTreeObserver.OnGlobalLayoutListener layoutListener=this::syncOverlay;
    private LyricsCatalog.Sink catalogSink;
    private LyricsNetwork enrichmentNetwork;
    private java.util.concurrent.ExecutorService enrichmentExecutor;
    private final List<JSONObject> pending=new ArrayList<>();
    private JSONObject sourceHealth;
    private final SharedPreferences.OnSharedPreferenceChangeListener listener=(preferences,key)->handler.post(()->{
        if(!"serviceJwt".equals(key))applySettings();
    });
    private final Runnable tick=new Runnable(){public void run(){
        if(!attached)return;
        try{
            updateTrack();
            if(ready){
                boolean d=app.bdcrusher.ytmusic.common.FeatureDiagnostics.detailed();if(debug==null||debug!=d){debug=d;call("debug",String.valueOf(d));}
                LyricsManager manager=LyricsManager.getInstance();
                long[] clock=RendererPlayback.snapshot(VideoInformation.getVideoId(),manager.getVideoPositionMs(),manager.isPlaybackPlaying(),manager.getPlaybackSpeed());
                JSONObject sample=new JSONObject().put("generation",generation).put("sampledAt",System.currentTimeMillis())
                    .put("position",clock[0]-Settings.LYRICS_OFFSET_MS.get()-manager.getTemporaryOffsetMs()).put("playing",clock[1]!=0)
                    .put("rate",Float.intBitsToFloat((int)clock[2])).put("revision",clock[3]).put("visible",isShown()&&getWindowVisibility()==View.VISIBLE&&NativeLyricsHost.isOpen());
                frameRate.update(web,clock[1]!=0&&sample.optBoolean("visible")&&!LyricsConfig.preferences(getContext()).getBoolean("reducedMotion",false),app.morphe.extension.shared.settings.SharedYouTubeSettings.APP_REFRESH_RATE.get());
                call("state",sample.toString());
            }
        }catch(Exception ex){Logger.printException(()->"BDCrusher lyric clock",ex);}
        handler.postDelayed(this,isShown()&&getWindowVisibility()==View.VISIBLE?250:1000);
    }};
    public BetterLyricsPanelView(Context context){super(context);setVisibility(View.INVISIBLE);}
    @Override protected void onWindowVisibilityChanged(int visibility){super.onWindowVisibilityChanged(visibility);if(visibility!=View.VISIBLE&&web!=null)frameRate.release(web);call("visible",String.valueOf(visibility==View.VISIBLE&&isShown()));}
    @Override protected void onVisibilityChanged(View changed,int visibility){super.onVisibilityChanged(changed,visibility);if(visibility!=View.VISIBLE&&web!=null)frameRate.release(web);call("visible",String.valueOf(isShown()&&getWindowVisibility()==View.VISIBLE));}
    @Override protected void onAttachedToWindow(){
        super.onAttachedToWindow();attached=true;iconsLoading=false;createWebView();getViewTreeObserver().addOnGlobalLayoutListener(layoutListener);
        enrichmentNetwork=new LyricsNetwork();enrichmentExecutor=java.util.concurrent.Executors.newSingleThreadExecutor();
        LyricsConfig.preferences(getContext()).registerOnSharedPreferenceChangeListener(listener);
        LyricsManager.getInstance().addListener(this);handler.post(tick);
    }
    @Override protected void onDetachedFromWindow(){
        if(getViewTreeObserver().isAlive())getViewTreeObserver().removeOnGlobalLayoutListener(layoutListener);
        restoreNativeContent();
        attached=false;if(web!=null)frameRate.release(web);handler.removeCallbacksAndMessages(null);
        LyricsConfig.preferences(getContext()).unregisterOnSharedPreferenceChangeListener(listener);
        LyricsManager.getInstance().removeListener(this);if(catalogSink!=null){LyricsRepository.unsubscribe(catalogSink);catalogSink=null;}
        if(enrichmentNetwork!=null)enrichmentNetwork.close();if(enrichmentExecutor!=null)enrichmentExecutor.shutdownNow();
        if(web!=null){frameRate.release(web);web.removeJavascriptInterface("BDNative");web.stopLoading();app.bdcrusher.ytmusic.common.ViewDisposal.dispose(web,web::destroy);web=null;}
        ready=false;identity="";lastSettings="";lastInsets="";pending.clear();super.onDetachedFromWindow();
    }
    private void createWebView(){
        if(web!=null)return;
        try{
            web=new WebView(getContext());web.setBackgroundColor(Color.TRANSPARENT);
            web.setVerticalScrollBarEnabled(false);web.setHorizontalScrollBarEnabled(false);
            web.getSettings().setJavaScriptEnabled(true);web.getSettings().setAllowFileAccess(false);
            web.getSettings().setAllowContentAccess(false);web.getSettings().setDomStorageEnabled(false);
            web.getSettings().setMixedContentMode(android.webkit.WebSettings.MIXED_CONTENT_NEVER_ALLOW);
            web.getSettings().setSupportMultipleWindows(false);web.getSettings().setSaveFormData(false);
            web.getSettings().setTextZoom(Math.round(100*getResources().getConfiguration().fontScale));
            web.addJavascriptInterface(new Bridge(),"BDNative");
            web.setWebViewClient(new WebViewClient(){
                @Override public boolean shouldOverrideUrlLoading(WebView view,WebResourceRequest request){return true;}
                @Override public WebResourceResponse shouldInterceptRequest(WebView view,WebResourceRequest request){
                    String url=request.getUrl().toString();
                    try{
                        if(url.startsWith(ROOT)){
                            String file=url.substring(ROOT.length());
                            if(file.matches("[A-Za-z0-9_.-]+")){
                                String mime=file.endsWith(".html")?"text/html":file.endsWith(".css")?"text/css":file.endsWith(".woff2")?"font/woff2":"application/javascript";
                                return new WebResourceResponse(mime,"UTF-8",getContext().getAssets().open("bdcrusher-lyrics/"+file));
                            }
                        }
                    }catch(Exception ignored){}
                    return new WebResourceResponse("text/plain","UTF-8",403,"Blocked",java.util.Collections.emptyMap(),new ByteArrayInputStream(new byte[0]));
                }
                @Override public boolean onRenderProcessGone(WebView view,RenderProcessGoneDetail detail){
                    LyricsDiagnostics.record("Renderer","WebView render process exited; crashed="+detail.didCrash());ready=false;hasDisplay=false;restoreNativeContent();setVisibility(View.INVISIBLE);frameRate.release(view);app.bdcrusher.ytmusic.common.ViewDisposal.dispose(view,view::destroy);web=null;identity="";if(++rendererRecoveries<=2)handler.postDelayed(()->{if(attached&&NativeLyricsHost.isOpen()&&web==null)createWebView();},500);return true;
                }
            });
            addView(web,new FrameLayout.LayoutParams(-1,-1));web.loadUrl(ROOT+"index.html");
        }catch(Exception ex){Logger.printException(()->"Could not initialize Better Lyrics WebView",ex);setVisibility(View.INVISIBLE);}
    }
    private void call(String method,String args){if(ready&&web!=null)web.evaluateJavascript("window.BDC&&window.BDC."+method+"("+args+")",null);}
    public void applySettings(){
        if(!ready)return;
        try{JSONObject options=LyricsConfig.read(getContext());options.put("offset",Settings.LYRICS_OFFSET_MS.get()+LyricsManager.getInstance().getTemporaryOffsetMs());
            if(cachedIcons!=null)options.put("buttonIcons",cachedIcons);else loadToolbarIcons();
            int pill=app.morphe.extension.shared.ResourceUtils.getColor("ytm_color_white_at_10pct",0x1AFFFFFF);options.put("pillColor",String.format(java.util.Locale.ROOT,"rgba(%d,%d,%d,%.3f)",android.graphics.Color.red(pill),android.graphics.Color.green(pill),android.graphics.Color.blue(pill),android.graphics.Color.alpha(pill)/255.0));String value=options.toString();if(!value.equals(lastSettings)){lastSettings=value;call("settings",value);}
        }catch(Exception ex){LyricsDiagnostics.record("settings",ex.getClass().getSimpleName());}
    }
    private JSONObject cachedIcons;
    private boolean iconsLoading;
    private void loadToolbarIcons(){
        if(iconsLoading||enrichmentExecutor==null||enrichmentExecutor.isShutdown())return;
        iconsLoading=true;final int tint=app.morphe.extension.shared.theme.ThemeUtils.getAppForegroundColor();
        enrichmentExecutor.execute(()->{
            JSONObject icons=new JSONObject();
            try{
                String[] keys={"copy","translate","romanize","refresh"};String[] names={"morphe_yt_copy_bold","yt_outline_experimental_translate_vd_theme_24","morphe_yt_romanize","ic_mtrl_arrow_circle"};
                for(int i=0;i<keys.length;i++){
                    android.graphics.drawable.Drawable d=app.morphe.extension.shared.ResourceUtils.getDrawable(names[i]);if(d==null)continue;
                    android.graphics.Bitmap bitmap=android.graphics.Bitmap.createBitmap(72,72,android.graphics.Bitmap.Config.ARGB_8888);d=d.mutate();d.setTint(tint);d.setBounds(0,0,72,72);d.draw(new android.graphics.Canvas(bitmap));
                    java.io.ByteArrayOutputStream out=new java.io.ByteArrayOutputStream();bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG,100,out);bitmap.recycle();
                    icons.put(keys[i],"data:image/png;base64,"+android.util.Base64.encodeToString(out.toByteArray(),android.util.Base64.NO_WRAP));
                }
            }catch(Exception ex){LyricsDiagnostics.record("icons",ex.getClass().getSimpleName());}
            handler.post(()->{iconsLoading=false;if(attached){cachedIcons=icons;applySettings();}});
        });
    }
    public void recordingChanged(){updateTrack();syncOverlay();}
    private String recordingId="";
    private boolean currentRecording(){return !recordingId.isEmpty()&&recordingId.equals(VideoInformation.getVideoId());}
    private void updateTrack(){
        String nextId=VideoInformation.getVideoId();
        TrackInfo next=LyricsRepository.track(nextId);
        if(nextId==null||next==null){
            if(!identity.isEmpty()){
                identity="";recordingId="";generation++;hasDisplay=false;track=null;pending.clear();sourceHealth=null;syncOverlay();
                if(catalogSink!=null)LyricsRepository.unsubscribe(catalogSink);catalogSink=null;
                if(ready)call("track","{\"generation\":"+generation+",\"title\":\"\",\"artist\":\"\",\"album\":\"\",\"duration\":0,\"videoId\":\"\"}");
            }
            return;
        }
        String key=LyricsRepository.identity(next,nextId);
        if(key.equals(identity)){if(track==null||!track.equals(next)){track=next;if(ready)try{call("metadata",trackJson());}catch(JSONException ignored){}}return;}
        identity=key;recordingId=nextId;track=next;generation++;hasDisplay=false;pending.clear();sourceHealth=null;
        syncOverlay();if(catalogSink!=null)LyricsRepository.unsubscribe(catalogSink);
        if(ready)sendTrack();
        int expected=generation;
        LyricsRepository.ensure(getContext(),track,nextId,false);
        catalogSink=new LyricsCatalog.Sink(){
            public void health(JSONObject status){handler.post(()->{if(attached&&generation==expected){sourceHealth=status;call("health",expected+","+status);}});}
            public void reconnect(){handler.postDelayed(()->{if(attached&&generation==expected&&NativeLyricsHost.isOpen())ServiceConnection.renew(getContext());},700);}
            public void result(JSONObject payload){handler.post(()->receive(expected,payload));}
            public void notice(String message,boolean finished){handler.post(()->{if(attached&&generation==expected&&ready)call("notice",expected+","+JSONObject.quote(message)+","+finished);});}
        };
        LyricsRepository.subscribe(catalogSink);
    }
    private String trackJson()throws JSONException{return new JSONObject().put("generation",generation).put("title",track.title()).put("artist",track.artist()).put("album",track.album()).put("duration",track.durationSeconds()).put("videoId",recordingId).put("preferredSource",LyricsConfig.preferences(getContext()).getString("source_"+recordingId,"")).toString();}
    private void sendTrack(){if(track!=null)try{call("track",trackJson());}catch(JSONException ignored){}}
    private void receive(int expected,JSONObject payload){
        if(!attached||expected!=generation||!currentRecording())return;
        if(!ready){if(pending.size()<64)pending.add(payload);return;}
        call("source",expected+","+payload);
    }
    @Override public void onLyricsChanged(LyricsManager.State state,Lyrics lyrics){
        updateTrack();
        if(state!=LyricsManager.State.LOADED||lyrics==null||lyrics.isEmpty()||track==null||!currentRecording()||!recordingId.equals(LyricsManager.getInstance().getLyricsVideoId()))return;
        try{
            JSONObject payload=NativeLyricPayload.from(lyrics,track);
            if(payload==null)return;
            new LyricsLibrary(getContext()).offer(VideoInformation.getVideoId(),payload);
            receive(generation,payload);
        }catch(Exception ex){Logger.printException(()->"Could not adapt native lyric fallback",ex);}
    }
    // A displayed acknowledgement changes visibility only. Reconfiguring here feeds
    // settings -> render -> displayed -> settings forever through the JS bridge.
    private void restoreNativeContent(){for(var entry:covered.entrySet())entry.getKey().setVisibility(entry.getValue());covered.clear();}
    public void syncOverlay(){
        boolean show=Settings.LYRICS_ENABLED.get()&&NativeLyricsHost.owns(this);
        boolean keep=show&&Settings.LYRICS_KEEP_SCREEN_ON.get();if(getKeepScreenOn()!=keep)setKeepScreenOn(keep);
        if(show&&getParent() instanceof android.view.ViewGroup parent){for(int i=0;i<parent.getChildCount();i++){View child=parent.getChildAt(i);if(child!=this&&!app.bdcrusher.ytmusic.shaders.ShaderRuntime.isEffectSurface(child)){covered.putIfAbsent(child,child.getVisibility());if(child.getVisibility()!=View.INVISIBLE)child.setVisibility(View.INVISIBLE);}}}
        else restoreNativeContent();
        int visibility=show?View.VISIBLE:View.INVISIBLE;if(getVisibility()!=visibility)setVisibility(visibility);
    }
    @Override protected void onSizeChanged(int w,int h,int oldw,int oldh){super.onSizeChanged(w,h,oldw,oldh);if(w!=oldw||h!=oldh)app.bdcrusher.ytmusic.common.FeatureDiagnostics.event("Renderer-layout","size="+w+"x"+h+" previous="+oldw+"x"+oldh);}
    public void setNavigationInsets(int left,int right,int bottom){
        insetLeft=left;insetRight=right;insetBottom=bottom;if(!ready)return;
        float density=getResources().getDisplayMetrics().density;
        String value="{\"left\":"+(left/density)+",\"right\":"+(right/density)+",\"bottom\":"+(bottom/density)+"}";
        if(!value.equals(lastInsets)){lastInsets=value;call("insets",value);}
    }
    // Preserve the installer's settings callbacks while the personal controls own rendering.
    public void applyToolbarButtonSettings(){applySettings();}public void applyTextSize(){applySettings();}
    public void applyLyricLayoutSettings(){applySettings();}public void applyWordSyncSetting(){applySettings();}
    public void applyHideInfo(){applySettings();}public void applyShowSection(){applySettings();}
    public void applyLineOverlaySettings(){applySettings();}
    public final class Bridge {
        @JavascriptInterface public void cacheResult(int id,String key,String result){
            if(result==null||result.length()>4*1024*1024||!key.matches("[A-Za-z-]{1,64}"))return;
            handler.post(()->{if(id!=generation||!currentRecording()||track==null||enrichmentExecutor==null||enrichmentExecutor.isShutdown())return;String videoId=recordingId;
                enrichmentExecutor.execute(()->{if(id!=generation)return;try{new LyricsLibrary(getContext()).offer(videoId,new JSONObject().put("kind","cachedResult").put("key",key).put("result",new JSONObject(result)));}catch(JSONException invalid){LyricsDiagnostics.record("Lyrics library","Invalid renderer result rejected");}});
            });
        }
        @JavascriptInterface public void ready(){handler.post(()->{if(!attached||web==null)return;ready=true;debug=null;lastSettings="";lastInsets="";sendTrack();applySettings();setNavigationInsets(insetLeft,insetRight,insetBottom);for(JSONObject payload:pending)receive(generation,payload);pending.clear();if(sourceHealth!=null)call("health",generation+","+sourceHealth);});}
        @JavascriptInterface public void displayed(int id,String source){handler.post(()->{if(id==generation&&currentRecording()){app.bdcrusher.ytmusic.common.FeatureDiagnostics.event("Lyrics-source","generation="+id+" variant="+source);hasDisplay=true;syncOverlay();}});}
        @JavascriptInterface public void noLyrics(int id){handler.post(()->{if(id==generation&&currentRecording()){hasDisplay=false;syncOverlay();}});}
        @JavascriptInterface public void dock(boolean collapsed){handler.post(()->LyricsConfig.preferences(getContext()).edit().putBoolean("dockCollapsed",collapsed).apply());}
        @JavascriptInterface public void copy(int id,String text){if(text.length()>100000)return;handler.post(()->{if(id!=generation||!currentRecording())return;android.content.ClipboardManager cb=(android.content.ClipboardManager)getContext().getSystemService(Context.CLIPBOARD_SERVICE);cb.setPrimaryClip(android.content.ClipData.newPlainText("Lyrics",text));});}
        @JavascriptInterface public void diagnostic(int id,String source,String message){if(id==generation&&source.matches("[A-Za-z-]{1,64}")&&message.length()<=240)LyricsDiagnostics.record(source,message);}
        @JavascriptInterface public void seek(int id,long milliseconds){handler.post(()->{
            if(id!=generation||!LyricsConfig.preferences(getContext()).getBoolean("tapSeek",true)||track==null||!currentRecording())return;
            LyricsManager manager=LyricsManager.getInstance();
            long target=milliseconds+Settings.LYRICS_OFFSET_MS.get()+manager.getTemporaryOffsetMs();
            long duration=VideoInformation.getVideoLength();
            target=Math.max(0,duration>0?Math.min(duration,target):target);
            RendererPlayback.seek(VideoInformation.getVideoId(),target);VideoInformation.seekTo(target);
        });}
        @JavascriptInterface public void refresh(int id){handler.post(()->{if(id==generation&&track!=null&&currentRecording())LyricsRepository.ensure(getContext(),track,VideoInformation.getVideoId(),true);});}
        @JavascriptInterface public void pin(int id,String key){
            if(!key.isEmpty()&&!key.matches("[a-zA-Z-]{1,64}"))return;
            handler.post(()->{String videoId=VideoInformation.getVideoId();if(id!=generation||!currentRecording()||videoId==null||videoId.isEmpty())return;
                SharedPreferences.Editor editor=LyricsConfig.preferences(getContext()).edit();
                if(key.isEmpty())editor.remove("source_"+videoId);else editor.putString("source_"+videoId,key);editor.apply();
            });
        }
        @JavascriptInterface public void configure(){handler.post(()->LyricsConfig.show(getContext()));}
        @JavascriptInterface public void connect(){handler.post(()->ServiceConnection.show(getContext()));}
        @JavascriptInterface public void toggle(String kind){handler.post(()->{String key="translate".equals(kind)?"translation":"romanize".equals(kind)?"romanization":null;if(key!=null){SharedPreferences p=LyricsConfig.preferences(getContext());p.edit().putBoolean(key,!p.getBoolean(key,false)).apply();}});}
        @JavascriptInterface public void enrich(int id,String source,String body){
            if(body.length()>120000||source.length()>64)return;
            handler.post(()->{
                if(id!=generation||!currentRecording()||!attached||enrichmentExecutor==null||enrichmentExecutor.isShutdown())return;
                LyricsNetwork network=enrichmentNetwork;
                enrichmentExecutor.execute(()->{
                    if(id!=generation||!attached)return;
                    try{
                        JSONObject request=new JSONObject(body);int start=request.optInt("start",0);request.remove("start");
                        JSONObject response=LyricsEnrichment.fetch(network,request);
                        handler.post(()->{if(id==generation&&attached)call("enrichment",id+","+JSONObject.quote(source)+","+start+","+JSONObject.quote(request.optString("to","en"))+","+response);});
                    }catch(Exception ignored){handler.post(()->{if(id==generation&&ready)call("notice",id+","+JSONObject.quote("Translation or romanization service unavailable")+",false");});}
                });
            });
        }
        @JavascriptInterface public void offset(int id,int delta){if(Math.abs(delta)!=100)return;handler.post(()->{if(id!=generation||!currentRecording())return;LyricsManager manager=LyricsManager.getInstance();int next=Math.max(-30000,Math.min(30000,manager.getTemporaryOffsetMs()+delta));manager.setTemporaryOffsetMs(next);manager.persistTemporaryOffsetMs();applySettings();});}
    }
}
