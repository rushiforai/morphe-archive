package nl.johninnl.wuplaycar;

import android.app.Application;
import android.content.Context;
import android.view.SurfaceHolder;
import java.util.*;
import kotlin.coroutines.CoroutineContext;

/** A car-owned instance of WuPlay's native PlaybackFacade and native Media3 engine. */
final class NativePlayer implements CarPlayback.Engine<SurfaceHolder> {
    private final Context context;private final NativeData data;
    private NativeData.Item item;private NativeData.Choice choice;
    private Object facade,session,player,scope,job,disposer,key,settingsViewModel,libraryViewModel,subtitleViewModel;
    private SurfaceHolder surface;private long requestedResume;private boolean skipFinalSave;private int rebuilds;
    void profileChanged(){skipFinalSave=true;}
    NativePlayer(Context context,NativeData data){this.context=context.getApplicationContext();this.data=data;}
    void selection(NativeData.Item item,NativeData.Choice choice){this.item=item;this.choice=choice;}
    @Override public void prepare(String url,Map<String,String> headers,long resume) {
        if(choice==null||!choice.direct()||!CarStreamPolicy.eligible(choice.rate))throw new IllegalStateException("No suitable stream within 10 Mbps");
        release();requestedResume=resume;
        try {
            job=NativeCalls.call(Class.forName("kotlinx.coroutines.JobKt"),"SupervisorJob$default");
            Object main=Class.forName("kotlinx.coroutines.internal.MainDispatcherLoader").getField("dispatcher").get(null);
            CoroutineContext combined=((CoroutineContext)main).plus((CoroutineContext)job);
            scope=NativeCalls.call(Class.forName("kotlinx.coroutines.JobKt"),"CoroutineScope",combined);
            Object group=NativeCalls.make("app.wuplay.androidtv.domain.model.AddonStreamGroup",choice.addonUrl,choice.addonName,Collections.singletonList(choice.value));
            List<?> empty=Collections.emptyList();
            Object state=NativeCalls.make("app.wuplay.androidtv.ui.player.PlayerLaunchState",
                url,item.title,item.subtitle,NativeCalls.optional(item.value,"background"),NativeCalls.optional(item.value,"logo"),NativeCalls.optional(item.value,"poster"),item.title,choice.addonUrl,item.type,item.id,item.parentId,
                Collections.singletonList(choice.addonUrl),Collections.singletonMap(choice.addonUrl,choice.addonName),choice.addonUrl,choice.value,Collections.singletonList(group),item.videos,
                false,false,false,false,false,null,null,NativeCalls.optional(item.value,"year"),empty,empty,
                item.value.getClass().getName().endsWith(".MetaPreview")?item.value:null,NativeCalls.optional(item.value,"originalLanguage"));
            session=NativeCalls.make("app.wuplay.androidtv.playback.PlaybackSession",state);
            Object factory=NativeCalls.make("app.wuplay.android.ui.MobileContainerViewModelFactory",(Application)context);
            Object settings=NativeCalls.call(factory,"create",Class.forName("app.wuplay.androidtv.ui.screens.settings.SettingsViewModel"));settingsViewModel=settings;
            Object library=NativeCalls.call(factory,"create",Class.forName("app.wuplay.androidtv.ui.player.PlayerLibraryViewModel"));libraryViewModel=library;
            Object subtitle=NativeCalls.make("app.wuplay.androidtv.ui.player.SubtitleViewModel");subtitleViewModel=subtitle;
            Object platform=NativeCalls.make("app.wuplay.android.ui.screens.player.MobilePlaybackPlatform",new Object[]{null});
            facade=NativeCalls.make("app.wuplay.androidtv.playback.PlaybackFacade",session,context,
                NativeCalls.call(data.container,"getBackendHttpClient"),NativeCalls.call(data.container,"getDiagnosticReporter"),
                NativeCalls.call(data.container,"getSkipIntroRepository"),NativeCalls.call(data.container,"getScopedCreditsRepository"),data.settings,
                NativeCalls.field(data.container,"addonRepository"),NativeCalls.field(data.container,"metaRepository"),settings,library,subtitle,
                NativeCalls.make("kotlinx.serialization.json.JsonArray",empty),platform,scope);
            Object tracker=NativeCalls.field(facade,"progressTracker");tracker.getClass().getField("foreground").setBoolean(tracker,true);
            Object runner=NativeCalls.make("app.wuplay.androidtv.playback.PlaybackFacade$run$2$1",facade,null,1);
            NativeCalls.call(Class.forName("kotlinx.coroutines.JobKt"),"launch$default",scope,null,null,runner,3);
            rebuild();
        } catch(Exception e){release();throw new IllegalStateException("WuPlay native player could not start",e);}
    }
    String diagnostics(){
        String extra="";
        try{if(facade!=null){Object tracker=NativeCalls.field(facade,"progressTracker");extra=" trackedState="+NativeCalls.call(NativeCalls.field(tracker,"playerPlaybackState"),"getValue")+" subtitles="+subtitles().size();}}
        catch(Exception e){extra=" trackedState=unavailable";}
        return "rebuilds="+rebuilds+" position="+position()+" duration="+duration()+" wanted="+playing()+" status="+status()+extra;
    }
    private void rebuild() throws Exception {
        rebuilds++;
        if(disposer!=null){NativeCalls.call(disposer,"dispose");disposer=null;}
        boolean pcm=Boolean.TRUE.equals(NativeCalls.call(session,"getPcmOnlyFallbackActive"));
        boolean mapDv=Boolean.TRUE.equals(NativeCalls.call(NativeCalls.call(settingsViewModel,"getMapDv7ToHevc"),"getValue"));
        boolean transcode=Boolean.TRUE.equals(NativeCalls.call(NativeCalls.field(session,"ddTranscodeRecoveryActive$delegate"),"getValue"))&&!pcm;
        Object config=NativeCalls.make("app.wuplay.androidtv.playback.EngineConfig",mapDv,transcode,pcm);
        player=NativeCalls.call(Class.forName("app.wuplay.androidtv.playback.PlaybackFacade"),"buildPlayer$default",facade,config);
        Object effect=NativeCalls.make("androidx.compose.runtime.Recomposer$$ExternalSyntheticLambda4",facade,28,player);
        Object effectScope=Class.forName("androidx.compose.runtime.Stack").getField("InternalDisposableEffectScope").get(null);
        disposer=NativeCalls.call(effect,"invoke",effectScope);
        key=NativeCalls.call(facade,"getPlayerKey");
        AdaptiveCap.apply(player);
        if(surface!=null)NativeCalls.call(player,"setVideoSurfaceHolder",surface);
        if(requestedResume>0){NativeCalls.call(player,"seekTo",requestedResume);requestedResume=0;}
    }
    static final class Track {
        final String title;final int group,index;final Object subtitle,owner;
        Track(String title,int group,int index,Object subtitle,Object owner){this.title=title;this.group=group;this.index=index;this.subtitle=subtitle;this.owner=owner;}
    }
    List<Track> audioTracks() throws Exception {
        List<Track> result=new ArrayList<>();if(player==null)return result;
        List<?> groups=(List<?>)NativeCalls.field(NativeCalls.call(player,"getCurrentTracks"),"groups");
        for(int g=0;g<groups.size();g++) {
            Object group=groups.get(g),nativeGroup=NativeCalls.field(group,"mediaTrackGroup");
            if(!Integer.valueOf(1).equals(NativeCalls.field(nativeGroup,"type")))continue;
            int length=(Integer)NativeCalls.field(group,"length");
            for(int t=0;t<length;t++) {
                if(!Boolean.TRUE.equals(NativeCalls.call(group,"isTrackSupported",t)))continue;
                Object format=NativeCalls.call(group,"getTrackFormat",t);
                Object bitrate=NativeCalls.optional(format,"bitrate");if(bitrate instanceof Number&&((Number)bitrate).longValue()>1_000_000L)continue;
                String language=NativeCalls.text(format,"language"),label=NativeCalls.text(format,"label");
                String name=label.isEmpty()?language:label;if(name.isEmpty())name="Audio "+(t+1);
                result.add(new Track(name,g,t,null,player));
            }
        }
        return result;
    }
    List<Track> subtitles() throws Exception {
        List<Track> result=new ArrayList<>();if(facade==null)return result;
        Object state=NativeCalls.call(NativeCalls.call(NativeCalls.field(facade,"subtitleViewModel"),"getState"),"getValue");
        for(Object subtitle:(List<?>)NativeCalls.field(state,"availableTracks")) {
            String name=NativeCalls.text(subtitle,"name");if(name.isEmpty())name=NativeCalls.text(subtitle,"lang");
            result.add(new Track(name.isEmpty()?"Subtitle":name,-1,-1,subtitle,player));
        }
        return result;
    }
    void audio(Track track) throws Exception {
        if(track.owner!=player)throw new IllegalStateException("Playback changed; reload tracks");
        NativeCalls.call(Class.forName("androidx.media3.ui.HtmlUtils"),"selectAudioTrack",player,track.group,track.index);
    }
    void subtitle(Track track) throws Exception {
        if(track!=null&&track.owner!=player)throw new IllegalStateException("Playback changed; reload tracks");
        if(facade!=null)NativeCalls.call(NativeCalls.field(facade,"subtitleViewModel"),"selectTrack",new Object[]{track==null?null:track.subtitle});
    }
    void refresh() throws Exception {
        // Native controllers use snapshotFlow. A car service has no ComposeView to
        // start the phone UI's global write/apply dispatcher; drive its retained pulse.
        if(facade!=null&&!((java.util.concurrent.atomic.AtomicBoolean)Class.forName("androidx.compose.ui.platform.GlobalSnapshotManager").getField("started").get(null)).get())
            NativeCalls.call(Class.forName("androidx.compose.runtime.snapshots.SnapshotKt"),"access$advanceGlobalSnapshot");
        if(facade!=null && !Objects.equals(key,NativeCalls.call(facade,"getPlayerKey")))rebuild();
        if(player!=null)AdaptiveCap.apply(player);
    }
    List<?> cues() {
        if(facade==null)return Collections.emptyList();
        try {Object cues=NativeCalls.call(NativeCalls.call(facade,"getActiveCues"),"getValue");return cues instanceof List?(List<?>)cues:Collections.emptyList();}
        catch(Exception e){return Collections.emptyList();}
    }
    float aspect() {
        if(player==null)return 16f/9f;
        try {Object size=NativeCalls.call(player,"getVideoSize");int w=(Integer)NativeCalls.field(size,"width"),h=(Integer)NativeCalls.field(size,"height");
            Object ratio=NativeCalls.optional(size,"pixelWidthHeightRatio");return w>0&&h>0?w*(ratio instanceof Float?(Float)ratio:1f)/h:16f/9f;
        } catch(Exception e){return 16f/9f;}
    }
    String status() {
        if(player==null)return "Choose a stream";
        try {
            if(NativeCalls.call(player,"getPlayerError")!=null)return "Playback failed. Choose another stream.";
            int state=(Integer)NativeCalls.call(player,"getPlaybackState");
            return state==1?"Playback stopped. Choose another stream.":state==2?"Buffering…":state==4?"Finished":playing()?"Playing":"Paused";
        }catch(Exception e){return "Player unavailable";}
    }
    @Override public void surface(SurfaceHolder holder) {
        surface=holder;
        try {if(player!=null)NativeCalls.call(player,"setVideoSurfaceHolder",new Object[]{holder});}
        catch(Exception e){throw new IllegalStateException("Car video surface could not attach",e);}
    }
    @Override public boolean playing() {
        try{return player!=null && Boolean.TRUE.equals(NativeCalls.call(player,"getPlayWhenReady")) && !Integer.valueOf(4).equals(NativeCalls.call(player,"getPlaybackState")) && !Integer.valueOf(1).equals(NativeCalls.call(player,"getPlaybackState"));}catch(Exception e){return false;}
    }
    @Override public void playing(boolean value) {
        try{if(player!=null){if(value&&Integer.valueOf(4).equals(NativeCalls.call(player,"getPlaybackState")))NativeCalls.call(player,"seekTo",0L);NativeCalls.call(player,"setPlayWhenReady",value);}}catch(Exception e){throw new IllegalStateException("Playback control failed",e);}
    }
    @Override public long position(){return time("getCurrentPosition");}
    @Override public long duration(){return time("getDuration");}
    private long time(String method){try{return player==null?0:(Long)NativeCalls.call(player,method);}catch(Exception e){return 0;}}
    @Override public void seek(long position){try{if(player!=null)NativeCalls.call(player,"seekTo",position);}catch(Exception e){throw new IllegalStateException("Seek failed",e);}}
    @Override public void release() {
        if(skipFinalSave&&facade!=null&&session!=null) {
            try {Object tracker=NativeCalls.field(facade,"progressTracker");String id=NativeCalls.text(NativeCalls.call(session,"getLaunchState"),"contentId");
                tracker.getClass().getField("exitSavedContentId").set(tracker,id);tracker.getClass().getField("backgroundSavedContentId").set(tracker,id);
            }catch(Exception e){android.util.Log.w("WuPlayCar","Profile-change progress guard failed");}
        }
        skipFinalSave=false;NativeCalls.cancel(job);job=null;
        try {
            if(disposer==null&&facade!=null&&player!=null)disposer=NativeCalls.make("androidx.navigation.compose.NavHostKt$NavHost$16$1$invoke$$inlined$onDispose$1",facade,12,player);
            if(disposer!=null)NativeCalls.call(disposer,"dispose");
        }
        catch(Exception e){android.util.Log.w("WuPlayCar","Native playback cleanup failed");}
        finally {disposer=null;player=null;facade=null;session=null;scope=null;key=null;
            for(Object model:new Object[]{settingsViewModel,libraryViewModel,subtitleViewModel})if(model!=null){try{NativeCalls.call(model,"clear$lifecycle_viewmodel_release");}catch(Exception ignored){}}
            settingsViewModel=null;libraryViewModel=null;subtitleViewModel=null;}
    }
}
