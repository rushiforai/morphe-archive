package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.net.Uri;
import android.widget.*;
import org.json.*;
import java.io.*;
import java.util.*;
import java.util.concurrent.*;

/** A settings-only interchange format. Never serializes cookies, tokens, paths or history. */
public final class SettingsProfiles {
    static final int OPEN=0x4849,MAX_BYTES=512*1024;
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private interface Rule{boolean accepts(Object value);}
    private static final Map<String,Rule> RULES=new java.util.concurrent.ConcurrentHashMap<>();
    private static final Map<String,Object> DEFAULTS=new java.util.concurrent.ConcurrentHashMap<>();
    static void defaultValue(String key,Object value){DEFAULTS.put(key,value);}
    static void booleanKey(String key){RULES.put(key,v->v instanceof Boolean);}
    static void numberKey(String key,int min,int max){RULES.put(key,v->v instanceof Integer&&(Integer)v>=min&&(Integer)v<=max);}
    static void choiceKey(String key,Set<Integer> choices){RULES.put(key,v->v instanceof Integer&&choices.contains(v));}
    static void catalog(Activity activity){
        // Expert is a projection of these same controls, not a second catalog.
        for(SettingsSections.Category c:SettingsSections.Category.values())if(c!=SettingsSections.Category.EXPERT)Haiagaru.settingsCategory(activity,c.name());
        booleanKey(ExpertSettings.KEY);
        booleanKey(ThumbnailAppearance.GRAY);defaultValue(ThumbnailAppearance.GRAY,false);
        booleanKey(ThumbnailAppearance.MOSAIC);defaultValue(ThumbnailAppearance.MOSAIC,false);
        numberKey(ThumbnailAppearance.STRENGTH,1,5);defaultValue(ThumbnailAppearance.STRENGTH,3);
        numberKey(ThumbnailAppearance.SENSITIVITY,0,2);defaultValue(ThumbnailAppearance.SENSITIVITY,1);
        booleanKey(ThumbnailAppearance.ALWAYS_GRAY);defaultValue(ThumbnailAppearance.ALWAYS_GRAY,false);
        booleanKey(ThumbnailAppearance.ALWAYS_STRENGTH);defaultValue(ThumbnailAppearance.ALWAYS_STRENGTH,false);
        booleanKey(ImageModeration.ADULT);defaultValue(ImageModeration.ADULT,false);
        booleanKey(ImageModeration.GORE);defaultValue(ImageModeration.GORE,false);
        booleanKey(ImageModeration.LIST);defaultValue(ImageModeration.LIST,false);
        booleanKey(NotificationNg.KEY);defaultValue(NotificationNg.KEY,true);
        booleanKey(NotificationNg.CHAIN_KEY);defaultValue(NotificationNg.CHAIN_KEY,false);
        choiceKey(BoardUrlPicker.STYLE,new HashSet<>(Arrays.asList(0,1)));defaultValue(BoardUrlPicker.STYLE,1);
        RULES.put(BoardUrlPicker.KEY,v->v instanceof String&&BoardUrlPicker.validSaved((String)v));
        for(int slot=0;slot<DirectBoardShortcut.COUNT;slot++) RULES.put(DirectBoardShortcut.key(slot),v->v instanceof String&&DirectBoardShortcut.validSaved((String)v));
        booleanKey(AppTrafficUsage.ENABLED);defaultValue(AppTrafficUsage.ENABLED,false);
        booleanKey(ThreadScopedNg.ENABLED);defaultValue(ThreadScopedNg.ENABLED,!prefs(activity).getBoolean(MinimalSetup.ACTIVE,false));
        booleanKey(QuickFilterOptions.TRANSPARENT);defaultValue(QuickFilterOptions.TRANSPARENT,false);
        booleanKey(MediaUploadHosts.ASK_DESTINATION);defaultValue(MediaUploadHosts.ASK_DESTINATION,false);
        booleanKey(NativeImageNgList.ENABLE);defaultValue(NativeImageNgList.ENABLE,false);
        numberKey(ThreadListThumbnail.REGISTERED_ACTION,0,3);defaultValue(ThreadListThumbnail.REGISTERED_ACTION,0);
        booleanKey(PostingSettingLinks.KEY);defaultValue(PostingSettingLinks.KEY,false);
        booleanKey(StockChmatePosting.ALWAYS);defaultValue(StockChmatePosting.ALWAYS,false);
        booleanKey(FutabaPostingPopup.DIRECT);defaultValue(FutabaPostingPopup.DIRECT,true);
        booleanKey(FutabaPostingPopup.OFFICIAL);defaultValue(FutabaPostingPopup.OFFICIAL,true);
        for(String key:new String[]{ThreadTitleActions.SHOW_REFRESH,ThreadTitleActions.SHOW_WATCH,ThreadTitleActions.SHOW_AUTH}){booleanKey(key);defaultValue(key,true);}
        booleanKey(StockChmatePosting.LONG_PRESS);defaultValue(StockChmatePosting.LONG_PRESS,false);
        booleanKey(StockChmatePosting.SKIP_CONFIRM);defaultValue(StockChmatePosting.SKIP_CONFIRM,false);
        booleanKey(StockChmatePosting.SHOW_MENU);defaultValue(StockChmatePosting.SHOW_MENU,true);
        numberKey(StockChmatePosting.DISPLAY_MODE,0,1);defaultValue(StockChmatePosting.DISPLAY_MODE,1);
        booleanKey(ThreadPostingNames.ENABLED);defaultValue(ThreadPostingNames.ENABLED,false);
        for(String key:new String[]{"settingsOptionLinksEnabled","reporterSearchEnabled"}){
            booleanKey(key);defaultValue(key,true);
        }
        booleanKey(ExternalBoardGroups.KEY);defaultValue(ExternalBoardGroups.KEY,false);
        booleanKey(BrowserUaTemplates.ENABLED);defaultValue(BrowserUaTemplates.ENABLED,false);
        booleanKey(ResponseMultiSelection.COPY_POPUP);defaultValue(ResponseMultiSelection.COPY_POPUP,false);
        booleanKey(DirectCopyGesture.KEY);defaultValue(DirectCopyGesture.KEY,false);
        booleanKey(WacchoiClipboard.STRIP_PARENTHESES);defaultValue(WacchoiClipboard.STRIP_PARENTHESES,false);
        booleanKey("videoLandscapeImmersive");defaultValue("videoLandscapeImmersive",false);
        booleanKey(BoardCookies.KEY);defaultValue(BoardCookies.KEY,false);
        booleanKey(FirstResponseNg.KEY);defaultValue(FirstResponseNg.KEY,FirstResponseNg.DEFAULT);
        booleanKey(MediaViewerBackGesture.DOUBLE_BACK);
        booleanKey(NativeImagePaging.ENABLED);defaultValue(NativeImagePaging.ENABLED,false);
        numberKey(NativeImagePaging.NEXT,0,4);defaultValue(NativeImagePaging.NEXT,NativeImagePaging.defaultDirection(activity,NativeImagePaging.NEXT));
        numberKey(NativeImagePaging.PREVIOUS,0,4);defaultValue(NativeImagePaging.PREVIOUS,NativeImagePaging.defaultDirection(activity,NativeImagePaging.PREVIOUS));
        numberKey(ViewerCornerControls.BACK,0,3);defaultValue(ViewerCornerControls.BACK,1);
        numberKey(ViewerCornerControls.MORE,0,3);defaultValue(ViewerCornerControls.MORE,0);
        numberKey(VideoViewerSettings.INLINE_LIMIT,1,8);defaultValue(VideoViewerSettings.INLINE_LIMIT,2);
        numberKey(VideoViewerSettings.INLINE_MB,1,64);defaultValue(VideoViewerSettings.INLINE_MB,8);
        booleanKey(VideoViewerSettings.X_GIF_AUTOPLAY);defaultValue(VideoViewerSettings.X_GIF_AUTOPLAY,true);
        booleanKey(VideoViewerSettings.INLINE_WIFI);defaultValue(VideoViewerSettings.INLINE_WIFI,false);
        booleanKey(HomeSelectionBar.KEY);defaultValue(HomeSelectionBar.KEY,false);
        booleanKey(VideoViewerSettings.INLINE_GIF);defaultValue(VideoViewerSettings.INLINE_GIF,false);
        booleanKey(ImageViewerRotationButton.HIDE_BOTTOM_ACTIONS);
        booleanKey(ImageViewerRotationButton.MENU_KEY);defaultValue(ImageViewerRotationButton.MENU_KEY,true);
        booleanKey(UpdateConnectionHeaders.KEY);defaultValue(UpdateConnectionHeaders.KEY,true);
        booleanKey(ResponseNoteIndicator.KEY);defaultValue(ResponseNoteIndicator.KEY,true);
        booleanKey("animanchHeart");defaultValue("animanchHeart",true);
        booleanKey(GigaFilePosting.SHOW_BUTTON);defaultValue(GigaFilePosting.SHOW_BUTTON,false);
        numberKey(GigaFilePosting.LINK_MODE,0,2);defaultValue(GigaFilePosting.LINK_MODE,GigaFilePosting.IN_APP);
        booleanKey(ExtraQuickFilters.OPTIMIZATION);defaultValue(ExtraQuickFilters.OPTIMIZATION,false);
        booleanKey(ExpertSettings.MIGRATION_ONCE);defaultValue(ExpertSettings.MIGRATION_ONCE,true);
        booleanKey(ExpertSettings.HISTORY_LIMIT);defaultValue(ExpertSettings.HISTORY_LIMIT,true);
        booleanKey(ExpertSettings.CHAIN_ANCESTORS);defaultValue(ExpertSettings.CHAIN_ANCESTORS,true);
        booleanKey(ExpertSettings.BOARD_DB);defaultValue(ExpertSettings.BOARD_DB,true);
        booleanKey(ExpertSettings.MODEL_ACCESS);defaultValue(ExpertSettings.MODEL_ACCESS,true);
        booleanKey(ExpertSettings.NEW_DAT);defaultValue(ExpertSettings.NEW_DAT,true);
        booleanKey(ExpertSettings.BOARD_COOKIES);defaultValue(ExpertSettings.BOARD_COOKIES,true);
        booleanKey(ExpertSettings.COOKIE_AUTH_UI);defaultValue(ExpertSettings.COOKIE_AUTH_UI,true);
        booleanKey(ExpertSettings.RUNTIME_VERSION);defaultValue(ExpertSettings.RUNTIME_VERSION,true);
        booleanKey(HomeThreadOrder.FOLD_ON_TAP);defaultValue(HomeThreadOrder.FOLD_ON_TAP,true);
        booleanKey(HomeBoardFoldLabels.TITLE_CONTROL);defaultValue(HomeBoardFoldLabels.TITLE_CONTROL,true);
        booleanKey(ExpertSettings.BACKGROUND_POSTING);defaultValue(ExpertSettings.BACKGROUND_POSTING,false);
        booleanKey(ShortThreadFilter.ENABLED);defaultValue(ShortThreadFilter.ENABLED,false);
        numberKey(ShortThreadFilter.LIMIT,1,ShortThreadFilter.MAX);defaultValue(ShortThreadFilter.LIMIT,1);
        booleanKey(FilterPosition.DELAYED_SNAPSHOT);defaultValue(FilterPosition.DELAYED_SNAPSHOT,false);
        booleanKey(ArchiveSearchLayout.ORIGINAL_SITE);defaultValue(ArchiveSearchLayout.ORIGINAL_SITE,false);
        for(String key:new String[]{"fast191UpdateConnect","optimize191UpdateProgress"}){booleanKey(key);defaultValue(key,true);}
        numberKey(CachedSearchOrder.KEY,0,4);defaultValue(CachedSearchOrder.KEY,0);
        for(String k:new String[]{EdgeLevelNg.OBSERVED}){booleanKey(k);defaultValue(k,false);}
        booleanKey("edgeLevelAutoSync");defaultValue("edgeLevelAutoSync",true);
        numberKey("edgeLevelThreshold",0,9999);defaultValue("edgeLevelThreshold",5);
        numberKey("edgeLevelIntervalMinutes",15,1440);defaultValue("edgeLevelIntervalMinutes",30);

        for(String key:new String[]{GlobalSearchHome.BACKGROUND,GlobalSearchHome.HISTORY,GlobalSearchHome.PARTIAL}){booleanKey(key);defaultValue(key,true);}
        booleanKey(GlobalTitleSearch.KEY);defaultValue(GlobalTitleSearch.KEY,false);
        numberKey(GlobalTitleSearch.MODE,0,1);defaultValue(GlobalTitleSearch.MODE,1);
        RULES.put(GlobalTitleSearch.BOARDS,v->v instanceof String&&GlobalTitleSearch.validSelection((String)v));defaultValue(GlobalTitleSearch.BOARDS,"");
        for(String key:new String[]{VideoViewerSettings.GIF_NATIVE,VideoViewerSettings.VIDEO_NATIVE,VideoViewerSettings.THREAD_MEDIA}){
            booleanKey(key);defaultValue(key,false);
        }
        booleanKey(VideoViewerSettings.GIF_DEDICATED);defaultValue(VideoViewerSettings.GIF_DEDICATED,false);
        RULES.put("userAgent",value->value instanceof String&&ViewingUserAgentRules.valid((String)value));
        defaultValue("userAgent",BrowserUaTemplates.DEFAULT);
        numberKey(HaiagaruSettingsGestures.SENSITIVITY,50,200);
        defaultValue(HaiagaruSettingsGestures.SENSITIVITY,100);
        defaultValue(ExpertSettings.KEY,false);
        defaultValue("quickFilterExtras",false);
        for(String key:EXTRA_BOOLEAN)booleanKey(key);
        for(String key:new String[]{ThreadSearchOptions.MENU_SEARCH,ThreadSearchOptions.MENU_SELECTION}){booleanKey(key);defaultValue(key,true);}
        for(String key:new String[]{ThreadSearchOptions.ID,ThreadSearchOptions.WACCHOI,ThreadSearchOptions.NAME}){booleanKey(key);defaultValue(key,false);}
        for(String key:new String[]{VideoViewerSettings.HOLD_SPEED,VideoViewerSettings.TAP_CONTROLS,VideoViewerSettings.CHMATE_GESTURES,
                VideoViewerSettings.MEDIA_SWIPE,VideoViewerSettings.GIF_AUTOPLAY,VideoViewerSettings.LETTERBOX_TOUCH}){booleanKey(key);defaultValue(key,true);}
        choiceKey("update191TimeoutSeconds",new HashSet<>(Arrays.asList(0,30,60,120)));defaultValue("update191TimeoutSeconds",60);
        numberKey("videoPreviewMinimumSeconds",0,86459);
        numberKey("checkerHeaderPercent",10,60);
        numberKey("hissiViewerResponseSpacingDp",0,20);
        numberKey(SearchRequestPacing.HISSI_INTERVAL_KEY,1,SearchRequestPacing.MAX_INTERVAL_SECONDS);
        numberKey(SearchRequestPacing.KYODEMO_INTERVAL_KEY,1,SearchRequestPacing.MAX_INTERVAL_SECONDS);
        defaultValue(SearchRequestPacing.HISSI_INTERVAL_KEY,3);
        defaultValue(SearchRequestPacing.KYODEMO_INTERVAL_KEY,10);
        numberKey("hissiViewerToolbarHeightDp",20,80);
        numberKey(CheckerBarOptions.PALETTE,0,3);
        numberKey(CheckerBarOptions.TABS,20,80);
        numberKey(CheckerBarOptions.PROVIDERS,20,80);
        defaultValue(CheckerBarOptions.PROVIDERS,32);
        numberKey(HissiScanTemplate.DAYS,0,36524);
        booleanKey(HissiScanTemplate.ENABLED);
        defaultValue(HissiScanTemplate.ENABLED,true);
        booleanKey(Haiagaru.HISSI_MENU_ENABLED_KEY);
        defaultValue(Haiagaru.HISSI_MENU_ENABLED_KEY,true);
        numberKey(HissiScanTemplate.PROVIDER,0,3);
        RULES.put(HissiScanTemplate.BOARDS,v->v instanceof String&&((String)v).length()<=4096
                &&(((String)v).isBlank()||((String)v).matches("[A-Za-z0-9_,\\s-]+")));
        numberKey(HissiScanTemplate.PAGES,1,10000);
        numberKey(HissiScanTemplate.REQUESTS,0,Integer.MAX_VALUE);
        defaultValue(CheckerBarOptions.TABS,40);
        booleanKey(QuickFilterOptions.HANDLE);defaultValue(QuickFilterOptions.HANDLE,true);
        numberKey(QuickFilterOptions.HEIGHT,0,10000);defaultValue(QuickFilterOptions.HEIGHT,0);
        booleanKey(CheckerBarOptions.HANDLES);
        defaultValue(CheckerBarOptions.HANDLES,true);
        numberKey(NativeToolTabs.HEADER_HEIGHT_KEY,48,80);
        numberKey(SiteCards.MAX_PER_RESPONSE_KEY,1,20);
        defaultValue(SiteCards.MAX_PER_RESPONSE_KEY,2);
        numberKey(SiteCards.CACHE_HOURS_KEY,1,168);
        defaultValue(SiteCards.CACHE_HOURS_KEY,24);
        choiceKey("xPostWarningThresholdMode",new HashSet<>(Arrays.asList(0,1)));
        defaultValue("xPostWarningThresholdMode",1);
        RULES.put(SiteCardExclusions.KEY,v->{if(!(v instanceof String))return false;
            try{SiteCardExclusions.parse((String)v);return true;}catch(IllegalArgumentException invalid){return false;}});
        defaultValue(SiteCardExclusions.KEY,SiteCardExclusions.DEFAULT);
        booleanKey(XPostPreviewPosition.ENABLED);
        defaultValue(XPostPreviewPosition.ENABLED,true);
        booleanKey(ReadingPosition.ENABLED);
        booleanKey(EmojiFontFallback.ENABLED);
        defaultValue(EmojiFontFallback.ENABLED,true);
        booleanKey(ThreadRefreshOptions.KEY);
        defaultValue(ThreadRefreshOptions.KEY,false);
        booleanKey("hissiViewerShowAdjust");
        defaultValue(NativeToolTabs.HEADER_HEIGHT_KEY,48);
        RULES.put(NativeTabGroups.DATA,v->{
            if(!(v instanceof String)||((String)v).length()>1048576)return false;
            try{ThreadTabGroupStore.decode((String)v);return true;}catch(Exception invalid){return false;}
        });
        defaultValue("hissiViewerShowAdjust",true);
        numberKey("hissiViewerTextZoom",100,130);
        booleanKey(PopularReplies.CUSTOM_THRESHOLD);defaultValue(PopularReplies.CUSTOM_THRESHOLD,false);
        booleanKey(PostEditorLimits.KEY);defaultValue(PostEditorLimits.KEY,true);
        numberKey("popularReplyThreshold",1,9999);
        numberKey("popularReplyStandardThreshold",1,9999);
        for(String key:new String[]{"quickFilterAA","quickFilterMine","quickFilterReplies",HiddenNgUnread.KEY,HiddenNgUnread.NEW_ARRIVAL_KEY})booleanKey(key);
        booleanKey(ThreadTitleActions.SHOW_REPORTER);defaultValue(ThreadTitleActions.SHOW_REPORTER,true);
        booleanKey(EdgeReporterOptions.COPY_SUFFIX);defaultValue(EdgeReporterOptions.COPY_SUFFIX,true);
        booleanKey(SelectionMenuPriority.KEY);defaultValue(SelectionMenuPriority.KEY,false);
        numberKey("previewFileLimitMb",0,1024);
        for(String key:new String[]{MobileMediaPolicy.IMAGE,MobileMediaPolicy.LIST,MobileMediaPolicy.WEB,MobileMediaPolicy.X}){choiceKey(key,new HashSet<>(Arrays.asList(0,1,2)));defaultValue(key,2);}
        choiceKey("urlVideoFetchMode",new HashSet<>(Arrays.asList(0,1,2,3,4,5)));defaultValue("urlVideoFetchMode",4);
        choiceKey(GifAutoFetchPolicy.KEY,new HashSet<>(Arrays.asList(0,1,2,3,4,5)));
        defaultValue(GifAutoFetchPolicy.KEY,4);
        RULES.put("settingsLanguage",v->"ja".equals(v)||"en".equals(v)||"system".equals(v));
        RULES.put("imageVpnDomains",v->{if(!(v instanceof String))return false;
            try{ImageVpnRequestPolicy.parseDomains((String)v);return true;}catch(IllegalArgumentException invalid){return false;}});
        defaultValue("imageVpnDomains",ImageVpnRequestPolicy.DEFAULT_DOMAINS);
    }
    private static final String[] EXTRA_BOOLEAN={
        "hideNgWordIdReplies",ChainAboneVisibility.KEY,EdgeLevelNg.OBSERVED,
        "urlImageFetchEnabled","videoFrameThumbnailsEnabled","videoSwipeBrightness","videoSwipeVolume","videoDoubleTapSeek","videoYoutubeEnabled","videoAutoplay",
        "siteCardsEnabled","siteCardImages",XPostPreviewPosition.ENABLED,"patrolImagesEnabled","patrolImageFilterEnabled","responseArchiveEnabled","directBodySelection",
        "popularReplyPopup","popularReplyDirect","quickFilterCounts","quickFilterExtras","bottomQuickFilterPanel","persistentBottomQuickFilters",QuickFilterOptions.TRANSPARENT,"compactQuickFilters","wacchoiSearchEnabled","wacchoiBackgroundSearch",
        "wacchoiLongPressSearch","wacchoiLongPressSuffixSearch","wacchoiLongPressPrefixSearch","wacchoiLongPressSuffixNg","wacchoiLongPressPrefixNg","responseExtraTools","wacchoiSearchHistory","showEdgeSearch","showZzzSearch","readThreadsFirstNewOnly","automaticFoldMode",
        "groupBrowsingHistoryByBoard","showRefreshTargetsInHistoryPopup","imageVpnEnabled","hideDroppedHomeThreads","hideDroppedDrafts","hideDroppedSent","nativeToolTabs","nativeToolTabSettings","nativeToolTabEddi",
        "threadTabGroupsEnabled",NativeTabGroups.BUTTON_KEY,"nativeToolTabNotes","nativeToolTabSearch","nativeToolTabChecker","nativeToolTabHissi","nativeToolTabWacchoi",NativeToolTabChMateGestures.KEY,"floatingQuickFilterButton","hissiViewerCompactHeader",
        ThreadRefreshOptions.KEY
    };
    static SharedPreferences prefs(Context c){return c.getSharedPreferences(WacchoiSearchOptions.PREFS,0);}
    static boolean resetDefaults(Activity activity){
        catalog(activity);
        SharedPreferences.Editor edit=prefs(activity).edit();
        for(String key:RULES.keySet())if(!NativeTabGroups.DATA.equals(key))edit.remove(key);
        edit.remove(MinimalSetup.ACTIVE);
        if(!edit.commit())return false;
        SharedPreferences.Editor archive=activity.getSharedPreferences("haiagaru_eddi_search",0).edit();
        for(String key:new String[]{"controlTextScale","resultTextScale","resultVerticalPadding","controlLayoutScale","hideSearchForm",ArchiveSearchLayout.HEIGHT,ArchiveSearchLayout.LOCKED})archive.remove(key);
        if(!archive.commit())return false;
        for(String name:new String[]{PosterHighlight.PREFS,ProgrammableNgController.PREFS,"haiagaru.hidden-id-ng",StringReplacement.PREFS})
            if(!activity.getSharedPreferences(name,0).edit().remove("enabled").commit())return false;
        SharedPreferences.Editor actions=activity.getSharedPreferences("haiagaru_response_actions",0).edit();
        for(String key:new String[]{"wacchoiLongPressSearch","wacchoiLongPressSuffixSearch","wacchoiLongPressPrefixSearch","wacchoiLongPressSuffixNg","wacchoiLongPressPrefixNg"})actions.remove(key);
        for(int id:ResponseMenuSettings.IDS){actions.remove("visibility."+id);actions.remove("responseVisibility."+id);}
        if(!actions.commit())return false;
        DEFAULTS.clear();catalog(activity);
        SiteCards.changed();XPostPreviewPosition.settingsChanged();FoldLayout.settingsChanged();
        return true;
    }
    static void confirmReset(Activity activity){
        new HaiagaruDialog.Builder(activity).setTitle("Haiagaruの設定を初期設定に戻す")
            .setMessage("Haiagaruの表示・動作設定を初期値に戻します。ChMate標準設定、スレ・履歴・登録済みNGルール、ログイン情報、バックアップの保存先は保持します。反映には再起動が必要です。")
            .setNegativeButton("キャンセル",null)
            .setPositiveButton("初期設定に戻す",(dialog,which)->{
                if(resetDefaults(activity))SettingsRestart.confirm(activity);
                else new HaiagaruDialog.Builder(activity).setTitle("初期設定に戻せませんでした").setMessage("一部の設定が変更されている可能性があります。保存状態を確認し、もう一度お試しください。").setPositiveButton("閉じる",null).show();
            }).show();
    }
    static JSONObject exportData(Context c)throws JSONException{
        Map<String,Object> all=new LinkedHashMap<>(DEFAULTS);all.putAll(prefs(c).getAll());
        JSONObject values=new JSONObject();for(Map.Entry<String,?> e:all.entrySet()){
            Rule rule=RULES.get(e.getKey());if(rule!=null&&rule.accepts(e.getValue()))values.put(e.getKey(),e.getValue());
        }
        return new JSONObject().put("format","haiagaru-settings").put("version",1).put("settings",values);
    }
    static Map<String,Object> validate(JSONObject data)throws JSONException{
        if(!"haiagaru-settings".equals(data.optString("format"))||data.optInt("version")!=1)throw new JSONException("対応していない設定ファイルです");
        JSONObject values=data.getJSONObject("settings");if(values.length()>512)throw new JSONException("設定項目が多すぎます");
        Map<String,Object> accepted=new LinkedHashMap<>();Iterator<String> keys=values.keys();
        while(keys.hasNext()){String key=keys.next();Rule rule=RULES.get(key);if(rule==null)continue;
            Object value=values.get(key);if(!rule.accepts(value))throw new JSONException("設定値が不正です: "+key);accepted.put(key,value);
        }
        if(accepted.isEmpty())throw new JSONException("読み込める設定がありません");return accepted;
    }
    static boolean apply(Context c,Map<String,Object> values){
        SharedPreferences.Editor e=prefs(c).edit();for(Map.Entry<String,Object> v:values.entrySet()){
            if(v.getValue() instanceof Boolean)e.putBoolean(v.getKey(),(Boolean)v.getValue());
            else if(v.getValue() instanceof Integer)e.putInt(v.getKey(),(Integer)v.getValue());
            else if(v.getValue() instanceof String)e.putString(v.getKey(),(String)v.getValue());
        }boolean saved=e.commit();
        if(saved&&values.containsKey("imageVpnDomains")){ImageVpnController.reloadDomains();SiteCards.clear(()->{});}
        if(saved&&(values.containsKey(SiteCards.MAX_PER_RESPONSE_KEY)||values.containsKey(SiteCards.CACHE_HOURS_KEY)
                ||values.containsKey("siteCardsEnabled")||values.containsKey("siteCardImages")||values.containsKey(SiteCardExclusions.KEY)))SiteCards.changed();
        if(saved&&values.containsKey(XPostPreviewPosition.ENABLED))XPostPreviewPosition.settingsChanged();
        return saved;
    }
    public static void share(Activity a){
        try{catalog(a);byte[] bytes=exportData(a).toString(2).getBytes("UTF-8");
            IO.execute(()->{try{
                File dir=new File(a.getCacheDir(),"haiagaru-shares");if(!dir.isDirectory()&&!dir.mkdirs())throw new IOException("保存先を作成できません");
                File file=new File(dir,UUID.randomUUID()+".haiagaru");
                try(FileOutputStream out=new FileOutputStream(file)){out.write(bytes);}
                Uri uri=Uri.parse("content://"+a.getPackageName()+".haiagaru.settings/"+file.getName());
                a.runOnUiThread(()->{if(a.isFinishing()||a.isDestroyed())return;
                    Intent send=new Intent(Intent.ACTION_SEND).setType("application/vnd.haiagaru.settings").putExtra(Intent.EXTRA_STREAM,uri)
                        .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                    send.setClipData(ClipData.newRawUri("Haiagaru設定",uri));
                    a.startActivity(Intent.createChooser(send,"Haiagaru設定を共有"));
                });
            }catch(Exception e){error(a,e);}});
        }catch(Exception e){error(a,e);}
    }
    public static void open(Activity a){
        a.startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("*/*").addCategory(Intent.CATEGORY_OPENABLE),OPEN);
    }
    static void load(Activity a,Uri uri){
        if(uri==null){a.finish();return;}
        catalog(a);
        IO.execute(()->{try{
            String scheme=uri.getScheme();if(!"content".equals(scheme)&&!"file".equals(scheme))throw new IOException("設定ファイルを選択してください");
            JSONObject data;
            try(InputStream in=a.getContentResolver().openInputStream(uri);ByteArrayOutputStream out=new ByteArrayOutputStream()){
                if(in==null)throw new IOException("ファイルを開けません");
                byte[] b=new byte[8192];int n;while((n=in.read(b))!=-1){if(out.size()+n>MAX_BYTES)throw new IOException("設定ファイルは512KiBまでです");out.write(b,0,n);}
                data=new JSONObject(out.toString("UTF-8"));
            }
            Map<String,Object> accepted=validate(data);
            a.runOnUiThread(()->{if(a.isFinishing()||a.isDestroyed())return;
                new HaiagaruDialog.Builder(a).setTitle("Haiagaru設定を読み込む")
                    .setMessage(accepted.size()+"項目の表示・動作設定を上書きします。認証情報・履歴・NG登録・コマンド・標準ツールバー設定は含みません。知らない相手のファイルは読み込まないでください。\n\n"+android.text.TextUtils.join("、",accepted.keySet()))
                    .setNegativeButton("キャンセル",(d,w)->a.finish()).setPositiveButton("読み込む",(d,w)->{
                        IO.execute(()->{boolean ok=apply(a,accepted);a.runOnUiThread(()->{
                            if(!ok){error(a,new IOException("設定の保存に失敗しました"));return;}
                            Haiagaru.refreshBoardListAfterReadSortChange();
                            SettingsRestart.confirm(a,a::finish);
                        });});
                    }).setOnCancelListener(d->a.finish()).show();
            });
        }catch(Exception e){error(a,e);}});
    }
    private static void error(Activity a,Exception e){a.runOnUiThread(()->{if(!a.isFinishing()&&!a.isDestroyed())new HaiagaruDialog.Builder(a)
        .setTitle("設定ファイル").setMessage(e.getMessage()).setPositiveButton("閉じる",(d,w)->{if(a instanceof SettingsImportActivity)a.finish();}).show();});}
    private SettingsProfiles(){}
    /** Existing optional settings only. Native ChMate settings and user data stay outside this map. */
    static Map<String,Object> adsOnlyValues(){
        Map<String,Object> out=new LinkedHashMap<>();
        for(Map.Entry<String,Rule> entry:RULES.entrySet())
            if(entry.getValue().accepts(false))out.put(entry.getKey(),false);
        out.put("hideAd",true);
        out.put("chtoio",true);
        out.put("urlVideoFetchMode",3);
        out.put(GifAutoFetchPolicy.KEY,3);
        return out;
    }
    static Map<String,Object> minimalValues(){return minimalValues(false);}
    static Map<String,Object> minimalValues(boolean adsOnly){
        if(adsOnly)return adsOnlyValues();
        Map<String,Object> out=new LinkedHashMap<>();for(Map.Entry<String,Rule> e:RULES.entrySet())if(e.getValue().accepts(false))out.put(e.getKey(),false);
        for(String key:new String[]{"edgeReporterId","edgeReporterBoardList","dedicatedViewerEnabled","kyodemoEnhancedViewer","automaticDat",
                "hideAd","chtoio","videoViewerEnabled","videoYoutubeEnabled","urlImageFetchEnabled","videoFrameThumbnailsEnabled","wacchoiSearchEnabled","showEdgeSearch",
                UpdateConnectionHeaders.KEY,"fast191UpdateConnect","optimize191UpdateProgress"})out.put(key,true);
        out.put("urlVideoFetchMode",0);return out;
    }
}
