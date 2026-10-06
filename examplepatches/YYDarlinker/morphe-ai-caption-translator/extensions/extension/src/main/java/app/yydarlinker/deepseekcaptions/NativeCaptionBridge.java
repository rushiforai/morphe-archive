package app.yydarlinker.deepseekcaptions;
import android.content.Context;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Typed host accessors are bound and structurally validated by the patch, not runtime reflection. */
public final class NativeCaptionBridge {
    private static volatile Context context;
    private static String lastTrackListMark = "", lastSourcePrewarm = "";
    private NativeCaptionBridge() {}
    static void initialize(Context value) { context=value.getApplicationContext(); }
    static boolean enabled() { return CaptionAddonSupport.aiInstalled() && context!=null && DeepSeekConfig.enabled(context); }

    /** Called when the native model first exposes its signed source tracks. */
    public static void onOriginalTrackList(List<?> tracks) {
        Context c = context;
        if (!CaptionAddonSupport.aiInstalled() || c == null || tracks == null || tracks.isEmpty()
                || RebuildController.visible()) return;
        String owner = "", sourceUrl = "";
        Set<String> sources = new HashSet<>();
        try {
            for (Object track : tracks) {
                String candidate = url(track);
                if (!DeepSeekCaptionHook.isYouTubeTimedTextUrl(candidate)) continue;
                String candidateOwner = PageCaptionController.videoIdFromUrl(candidate);
                if (candidateOwner.isEmpty()) continue;
                if (!owner.isEmpty() && !owner.equals(candidateOwner)) return;
                owner = candidateOwner;
                String source = CaptionEngine.sourceCaptionUrl(candidate);
                sources.add(source);
                sourceUrl = source;
            }
            if (owner.isEmpty()) return;
            boolean foreground = owner.equals(PageCaptionController.currentVideoIdSnapshot());
            String markKey = owner + ":" + foreground;
            synchronized (SELECTION_LOCK) {
                if (!markKey.equals(lastTrackListMark)) {
                    lastTrackListMark = markKey;
                    CaptionDiagnostics.mark(c, "NATIVE_TRACK_LIST_READY",
                            "video=" + owner + ";foreground=" + foreground + ";tracks=" + tracks.size()
                                    + ";sources=" + sources.size() + ";elapsed_realtime_ms=" + SystemClock.elapsedRealtime());
                }
                if (!foreground || sources.size() != 1 || !enabled() || !DeepSeekConfig.isReady(c)) return;
                // An explicit Off always wins. Remembered intent is used only while the new
                // video's native selection has not yet committed a current choice.
                boolean chosen = CaptionChoice.known();
                boolean translate = chosen
                        ? CaptionChoice.isOn() && CaptionChoice.translates()
                        : RememberedCaptionSelection.decision() == 1
                                && RememberedCaptionSelection.translated();
                if (!translate) return;
                String target = chosen ? CaptionChoice.language() : RememberedCaptionSelection.language();
                TargetLanguage language = TargetLanguage.fromCode(target);
                if (language == null) return;
                String key = owner + "|" + SourceCaptionCache.key(sourceUrl) + "|" + language.code;
                if (key.equals(lastSourcePrewarm)) return;
                lastSourcePrewarm = key;
                CaptionDiagnostics.mark(c, "NATIVE_SOURCE_PREWARM",
                        "video=" + owner + ";intent=" + (chosen ? "current" : "remembered")
                                + ";elapsed_realtime_ms=" + SystemClock.elapsedRealtime());
                // Invisible sessions fetch the source but cannot schedule API translation.
                RebuildController.activate(c, TargetLanguage.withCode(sourceUrl, language.code), false, false);
            }
        } catch (Exception failure) {
            CaptionDiagnostics.mark(c, "NATIVE_TRACK_LIST_FAILED", failure.getClass().getSimpleName());
        }
    }

    private static final java.util.concurrent.atomic.AtomicBoolean drawObserved=new java.util.concurrent.atomic.AtomicBoolean();
    public static boolean suppressNativeDraw() {
        if(CaptionAddonSupport.aiInstalled() && context!=null && drawObserved.compareAndSet(false,true))
            CaptionDiagnostics.mark(context,"NATIVE_DRAW_HOOK_CONNECTED","build=n30;official=1.45.0;presentation=n29-presentation-v3;hook=SubtitleWindowView.draw");
        // Holding an accepted AI track survives waiting, safe blanks and rotation; source-only
        // keeps its previously recognized visible-overlay behavior rather than being redefined.
        return enabled() && (RebuildController.ownsNativeTrack() || DynamicCaptionController.isVisibleActive());
    }
    private static volatile Set<String> availableLanguages=java.util.Collections.emptySet();
    private static volatile java.util.Map<String,String> nativeLabels=java.util.Collections.emptyMap();
    private static volatile String labelLocale="";
    private static volatile boolean languagePrototypeAvailable;
    static void observeLanguageMetadata(java.util.Map<String,String> labels) {
        nativeLabels=java.util.Collections.unmodifiableMap(new java.util.HashMap<>(labels));
        availableLanguages=java.util.Collections.unmodifiableSet(new HashSet<>(labels.keySet()));
        labelLocale=LanguageMenuOrder.locale().toLanguageTag();languagePrototypeAvailable=!labels.isEmpty();
    }
    static String languageStatus(String code) {
        if(!labelLocale.equals(LanguageMenuOrder.locale().toLanguageTag()) || !languagePrototypeAvailable)return "languages_unavailable";
        return availableLanguages.contains(code)?"languages_existing":"languages_new";
    }
    public static String translationLabel(String code) {
        String name=labelLocale.equals(LanguageMenuOrder.locale().toLanguageTag())?nativeLabels.get(code):null;
        return name==null?LanguageMenuOrder.label(code):name;
    }
    public static List<?> augmentTranslations(List<?> original) {
        if((!CaptionAddonSupport.aiInstalled() && !CaptionAddonSupport.simplifiedInstalled()) || original==null || original.isEmpty())return original;
        long started=System.nanoTime();
        try {
            Set<String> chosen=CaptionLanguageSelection.menuCodes();
            if(chosen.isEmpty())return original;
            Object prototype=null;Set<String> present=new HashSet<>();List<Object> copy=new ArrayList<>(original);
            for(Object track:original){String code=CaptionLanguageSelection.canonical(language(track));if(!code.isEmpty())present.add(code);
                if(prototype==null && DeepSeekCaptionHook.isYouTubeTimedTextUrl(url(track)))prototype=track;}
            if(prototype==null)return original;
            java.text.Collator collator=java.text.Collator.getInstance(LanguageMenuOrder.locale());
            for(String code:chosen) {
                if(!present.add(code))continue;
                Object added=cloneTranslation(prototype,code);if(added==null)continue;
                String label=displayName(added).toString();int at=copy.size();
                for(int i=0;i<copy.size();i++)if(collator.compare(LanguageMenuOrder.sortLabel(label),LanguageMenuOrder.sortLabel(displayName(copy.get(i)).toString()))<0){at=i;break;}
                copy.add(at,added);
                CaptionDiagnostics.mark(context,"LANGUAGE_MENU_INSERTED","code="+code+";display_name="+label+";position="+at+";native_preserved=true");
            }
            CaptionDiagnostics.mark(context,"LANGUAGE_MENU_READY","selected="+chosen.size()+";items="+copy.size()+";deduplicated=true;elapsed_us="+((System.nanoTime()-started)/1000));
            return copy.size()==original.size()?original:copy;
        }catch(Exception failed){CaptionDiagnostics.mark(context,"AI_MENU_INSERT_FAILED",failed.getClass().getSimpleName());return original;}
    }
    public static void onSelection(Object track) { applySelection(track,true); }
    static void applySelection(Object track,boolean remember) {
        if(!CaptionAddonSupport.aiInstalled()) return;
        try {
            String code=track==null ? "DISABLE_CAPTIONS_OPTION" : language(track);
            if("AUTO_TRANSLATE_CAPTIONS_OPTION".equals(code)) return;
            if(track==null || "DISABLE_CAPTIONS_OPTION".equals(code)) {
                if(remember) CaptionChoice.toggle(false);
                if(enabled())DynamicCaptionController.deactivateFromNativeCaptionState(); return;
            }
            String selected=url(track);
            if(!DeepSeekCaptionHook.isYouTubeTimedTextUrl(selected)) return;
            boolean translate=TargetLanguage.fromUrl(selected)!=null;
            if(remember) CaptionChoice.select(code,translate,vss(track).startsWith("a."));
            if(!enabled())return;
            CaptionButtonController.noteAiTrackSelected();
            if(translate) {
                CaptionLifecycleRestore.noteAiTarget(selected);
                DynamicCaptionController.activate(context,selected);
            } else ContextualUnitCaptionController.activateSource(context,selected);
            CaptionMusicSuppressor.kick();
        } catch(Exception failed) {
            CaptionDiagnostics.mark(context,"AI_SELECTION_FAILED",failed.getClass().getSimpleName());
        }
    }
    private static final Object SELECTION_LOCK=new Object();
    private static final java.util.LinkedHashMap<String,Selection> selections=new java.util.LinkedHashMap<>();
    private static String visibleVideo="";
    private static Object switchingManager;
    enum Refresh { APPLIED, AI_STARTED, CAPTIONS_OFF, DEFERRED }
    /** Per-video weak references, not one process-wide "last callback" slot. */
    private static final class Selection {
        final String video,language,selectedUrl;final boolean off,translated,asr;
        final java.lang.ref.WeakReference<Object> manager,track;
        final Object origin;final int reason;
        Selection(String video,Object manager,Object track,Object origin,int reason){
            this.video=video;this.manager=new java.lang.ref.WeakReference<>(manager);this.track=new java.lang.ref.WeakReference<>(track);
            this.origin=origin;this.reason=reason;off=track==null||"DISABLE_CAPTIONS_OPTION".equals(language(track));
            selectedUrl=off?"":url(track);language=off?"":language(track);translated=!off&&TargetLanguage.fromUrl(url(track))!=null;asr=!off&&vss(track).startsWith("a.");
        }
    }
    public static void onNativeSelectionWithReason(Object manager,Object track,Object origin,int reason){
        captureSelection(manager,track,origin,reason,null);
    }
    public static void onNativeSelection(Object manager,Object track,Object origin){captureSelection(manager,track,origin,0,null);}
    /** Bound to the shared native dispatcher, after native track filtering, before loading text.
     * Both the manual menu and automatic model initialization flow through this point. */
    public static void onNativeTrackApplied(Object manager,Object event) {} // bound at patch time
    /** modelOwner is the caption model's videoId, NOT the event's playback nonce (CPN). */
    public static void onNativeAppliedEvent(Object manager,Object committed,Object requested,Object origin,int reason,String modelOwner){
        // Forced-caption fallback can make the committed track non-null even after explicit Off.
        // Preserve that user intent; automatic null/default events still use the actual track.
        boolean explicit=origin instanceof Enum<?> && "PREFERRED_TRACK".equals(((Enum<?>)origin).name());
        Object selected=explicit && (requested==null || "DISABLE_CAPTIONS_OPTION".equals(language(requested)))?null:committed;
        onNativeSelectionApplied(manager,selected,origin,reason,modelOwner);
    }
    public static void onNativeSelectionApplied(Object manager,Object track,Object origin,int reason,String modelOwner){
        try { captureSelection(manager,track,origin,reason,modelOwner==null?"":modelOwner.trim()); }
        catch(Exception failed){CaptionDiagnostics.mark(context,"NATIVE_APPLIED_CAPTURE_FAILED",failed.getClass().getSimpleName());}
    }
    private static void captureSelection(Object manager,Object track,Object origin,int reason,String modelOwner){
        synchronized(SELECTION_LOCK){
            // Internal null/reselect callbacks must not erase the snapshot or change memory.
            if(manager!=null&&manager==switchingManager)return;
            String code=track==null?"DISABLE_CAPTIONS_OPTION":language(track);
            if("AUTO_TRANSLATE_CAPTIONS_OPTION".equals(code))return;
            boolean off=track==null||"DISABLE_CAPTIONS_OPTION".equals(code);
            String video=off?(modelOwner==null?modelVideo(manager):modelOwner):PageCaptionController.videoIdFromUrl(url(track));
            String current=PageCaptionController.currentVideoIdSnapshot();
            // A reset with no model emits a null selection, not an explicit Off on the departed
            // video. Never infer its owner from a reused manager's previous selection.
            if(modelOwner!=null && off && video.isEmpty())return;
            if(modelOwner!=null && !modelOwner.isEmpty() && !off && !modelOwner.equals(video)){
                CaptionDiagnostics.mark(context,"NATIVE_APPLIED_OWNER_REJECTED","model_track_mismatch;model_foreground="+
                        modelOwner.equals(current)+";track_foreground="+video.equals(current));return;
            }
            if(video.isEmpty()&&off){Selection owner=latestForManager(manager);if(owner!=null)video=owner.video;}
            // An unidentified background null callback is not evidence that the visible CC is off.
            if(video.isEmpty()&&!current.isEmpty())return;
            if(!off&&!DeepSeekCaptionHook.isYouTubeTimedTextUrl(url(track)))return;
            Selection value=new Selection(video,manager,track,origin,reason);
            if(modelOwner!=null) {
                CaptionDiagnostics.mark(context,"NATIVE_TRACK_APPLIED",
                        "owner=caption_model;foreground="+video.equals(current)+";off="+off
                                +";translated="+value.translated+";reason="+reason
                                +";elapsed_realtime_ms="+SystemClock.elapsedRealtime());
                if(video.equals(current) && !off)
                    CaptionDiagnostics.mark(context,"NATIVE_OWNER_ESTABLISHED",
                            "video="+video+";translated="+value.translated
                                    +";elapsed_realtime_ms="+SystemClock.elapsedRealtime());
            }
            selections.remove(video);selections.put(video,value);
            while(selections.size()>6)selections.remove(selections.keySet().iterator().next());
            if(!current.isEmpty()&&!current.equals(video)){
                CaptionDiagnostics.mark(context,"NATIVE_SELECTION_BACKGROUND","visible_state_preserved");return;
            }
            rememberAsrTracks(manager);
            boolean explicit=origin instanceof Enum<?> && "PREFERRED_TRACK".equals(((Enum<?>)origin).name());
            if(explicit&&CaptionAddonSupport.memoryInstalled()){
                if(off)RememberedCaptionSelection.off();
                else if(!code.endsWith("_OPTION"))RememberedCaptionSelection.select(code,value.translated,value.asr);
            }
            applySelection(track,off||explicit||!CaptionChoice.known()||!CaptionChoice.isOn());
        }
    }
    static void onVideoId(String video){
        video=video==null?"":video.trim();
        synchronized(SELECTION_LOCK){
            if(video.equals(visibleVideo))return;
            visibleVideo=video;CaptionChoice.reset();
            if(video.isEmpty())return;
            Selection value=selections.get(video);
            if(value==null)return;
            if(value.off){CaptionChoice.toggle(false);return;}
            Object track=currentTrack(value);
            if(track!=null)applySelection(track,true);
            else if(canActivateSnapshot(value))activateSnapshot(value,true);
        }
    }
    private static Selection currentSelection(){
        String video=PageCaptionController.currentVideoIdSnapshot();return video.isEmpty()?null:selections.get(video);
    }
    private static Selection latestForManager(Object manager){
        if(manager==null)return null;Selection found=null;
        for(Selection value:selections.values())if(value.manager.get()==manager)found=value;
        return found;
    }
    private static boolean ownsManager(Selection value){
        Object manager=value.manager.get();if(manager==null)return false;
        Selection owner=latestForManager(manager);if(owner!=null&&!owner.video.equals(value.video))return false;
        String model=modelVideo(manager);return model.isEmpty()||model.equals(value.video);
    }
    private static String modelVideo(Object manager){
        if(manager==null)return "";
        try{String bound=nativeModelVideo(manager);if(bound!=null&&!bound.isEmpty())return bound;
            List<?> tracks=nativeTracks(manager);if(tracks==null)return "";String owner="";
            for(Object track:tracks){String video=PageCaptionController.videoIdFromUrl(url(track));if(video.isEmpty())continue;
                if(!owner.isEmpty()&&!owner.equals(video))return "mixed_model";owner=video;}
            return owner;
        }catch(Exception unavailable){return "";}
    }
    private static Object currentTrack(Selection value){
        if(value.off||!ownsManager(value))return null;
        Object manager=value.manager.get();if(manager==null)return null;
        try{
            List<?> tracks=value.translated?translatedTracks(manager):nativeTracks(manager);
            if(tracks!=null&&!tracks.isEmpty()){
                for(Object track:tracks)if(value.video.equals(PageCaptionController.videoIdFromUrl(url(track)))&&value.language.equals(language(track))
                        &&value.translated==(TargetLanguage.fromUrl(url(track))!=null)&&value.asr==vss(track).startsWith("a."))return track;
                return null; // A changed native model is authoritative; never reuse its old object.
            }
        }catch(Exception unavailable){return null;}
        Object track=value.track.get();return track!=null&&value.video.equals(PageCaptionController.videoIdFromUrl(url(track)))?track:null;
    }
    /** Native managers may be collected after Shorts prefetch. Keep only the selected descriptor,
     * not strong player objects; never use a descriptor contradicted by a surviving native model. */
    private static boolean canActivateSnapshot(Selection value){
        if(value.off || !value.video.equals(PageCaptionController.currentVideoIdSnapshot()) ||
                !value.video.equals(PageCaptionController.videoIdFromUrl(value.selectedUrl)))return false;
        Object manager=value.manager.get();
        if(manager==null)return true;
        if(!ownsManager(value))return false;
        try{
            List<?> tracks=value.translated?translatedTracks(manager):nativeTracks(manager);
            return tracks==null || tracks.isEmpty() || currentTrack(value)!=null;
        }catch(Exception unavailable){return false;}
    }
    private static void activateSnapshot(Selection value,boolean updateChoice){
        if(updateChoice)CaptionChoice.select(value.language,value.translated,value.asr);
        if(!enabled())return;
        rememberAsrTracks(value.manager.get()); // Publish references before the source worker starts.
        Object fresh=currentTrack(value);
        String selected=fresh==null?value.selectedUrl:url(fresh);
        CaptionButtonController.noteAiTrackSelected();
        if(value.translated){CaptionLifecycleRestore.noteAiTarget(selected);DynamicCaptionController.activate(context,selected);}
        else ContextualUnitCaptionController.activateSource(context,selected);
        CaptionMusicSuppressor.forceNativeRendererScan();CaptionMusicSuppressor.kick();
        CaptionDiagnostics.mark(context,"ENGINE_SNAPSHOT_ACTIVATED","same_video=true;source_only="+!value.translated);
    }
    static Refresh refreshNativeTrack(){
        synchronized(SELECTION_LOCK){
            if(CaptionChoice.known()&&!CaptionChoice.isOn())return Refresh.CAPTIONS_OFF;
            Selection value=currentSelection();
            if(value==null)return Refresh.DEFERRED;
            // AI startup must not wait for (or depend on) native null/reselect callbacks.
            // This also recovers a collected Shorts manager without waiting for another network fetch.
            if(enabled() && canActivateSnapshot(value)){
                activateSnapshot(value,!CaptionChoice.known());
                if(!ownsManager(value)||value.origin==null||currentTrack(value)==null)return Refresh.AI_STARTED;
            }
            if(!ownsManager(value)||value.origin==null)return Refresh.DEFERRED;
            if(value.off)return Refresh.CAPTIONS_OFF;
            Object track=currentTrack(value),manager=value.manager.get();
            if(track==null||manager==null)return Refresh.DEFERRED;
            String current=PageCaptionController.currentVideoIdSnapshot();
            if(!current.isEmpty()&&!current.equals(value.video))return Refresh.DEFERRED;
            rememberAsrTracks(manager);
            try{
                switchingManager=manager;
                selectNative(manager,null,value.origin,value.reason);
                // A video transition while the selector runs must not resurrect the old video.
                current=PageCaptionController.currentVideoIdSnapshot();
                if(!current.isEmpty()&&!current.equals(value.video))return Refresh.DEFERRED;
                selectNative(manager,track,value.origin,value.reason);
            }finally{switchingManager=null;}
            current=PageCaptionController.currentVideoIdSnapshot();
            if(!current.isEmpty()&&!current.equals(value.video))return Refresh.DEFERRED;
            if(enabled())applySelection(track,false);
            return Refresh.APPLIED;
        }
    }
    public static void selectNative(Object manager,Object track,Object origin,int reason) {} // bound at patch time
    private static void rememberAsrTracks(Object manager) {
        if(!enabled() || manager==null)return;
        try{List<?> tracks=nativeTracks(manager);if(tracks!=null)for(Object track:tracks)
            NativeAsrTrackReference.remember(language(track),vss(track),url(track));
        }catch(Exception ignored){}
    }
    public static Object resolveRemembered(Object manager) {
        rememberAsrTracks(manager);
        if(!CaptionAddonSupport.memoryInstalled() || RememberedCaptionSelection.decision()!=1)return null;
        List<?> list=RememberedCaptionSelection.translated()?translatedTracks(manager):nativeTracks(manager);
        Object fallback=null;
        if(list!=null)for(Object track:list)if(RememberedCaptionSelection.language().equals(language(track))) {
            if(RememberedCaptionSelection.translated() || vss(track).startsWith("a.")==RememberedCaptionSelection.asr())return track;
            fallback=track;
        }
        return fallback;
    }
    public static int restoreDecision() { return !CaptionAddonSupport.memoryInstalled()?-1:RememberedCaptionSelection.decision(); }
    /** Real caption model videoId; never the unrelated caption event playback identifier. */
    public static String nativeModelVideo(Object manager) { return ""; } // bound at patch time
    public static List<?> nativeTracks(Object manager) { return null; }
    public static List<?> translatedTracks(Object manager) { return null; }
    public static String simplifiedUrl(String value) { return TargetLanguage.withCode(value,"zh-Hans"); }
    public static String simplifiedVss(String value) {
        if(value==null) return "tzh-Hans";
        int separator=value.indexOf('.');
        return "tzh-Hans"+(separator<0 ? "" : value.substring(separator));
    }
    public static Object augmentMetadata(Object metadata) { return metadata; }
    public static CharSequence displayName(Object track) { return ""; }
    public static String language(Object track) { return ""; } // replaced at patch time
    public static String vss(Object track) { return ""; }
    public static String url(Object track) { return ""; }
    public static Object cloneSimplified(Object track) { return null; }
    public static Object cloneTranslation(Object track,String code) { return null; }
    public static String translationUrl(String url,String code){return TargetLanguage.withCode(url,code);}
    public static String translationVss(String value,String code){int at=value==null?-1:value.indexOf('.');return "t"+code+(at<0?"":value.substring(at));}
}
