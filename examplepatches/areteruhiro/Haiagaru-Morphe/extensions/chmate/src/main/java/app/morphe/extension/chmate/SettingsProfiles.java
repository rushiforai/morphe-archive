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
        booleanKey(BrowserUaTemplates.ENABLED);defaultValue(BrowserUaTemplates.ENABLED,false);
        booleanKey(BoardCookies.KEY);defaultValue(BoardCookies.KEY,false);
        numberKey(ViewerCornerControls.BACK,0,3);defaultValue(ViewerCornerControls.BACK,1);
        numberKey(ViewerCornerControls.MORE,0,3);defaultValue(ViewerCornerControls.MORE,0);
        numberKey(VideoViewerSettings.INLINE_LIMIT,1,8);defaultValue(VideoViewerSettings.INLINE_LIMIT,2);
        numberKey(VideoViewerSettings.INLINE_MB,1,64);defaultValue(VideoViewerSettings.INLINE_MB,8);
        booleanKey(VideoViewerSettings.X_GIF_AUTOPLAY);defaultValue(VideoViewerSettings.X_GIF_AUTOPLAY,true);
        booleanKey(VideoViewerSettings.INLINE_GIF);defaultValue(VideoViewerSettings.INLINE_GIF,false);
        booleanKey(ImageViewerRotationButton.MENU_KEY);defaultValue(ImageViewerRotationButton.MENU_KEY,true);
        booleanKey(UpdateConnectionHeaders.KEY);defaultValue(UpdateConnectionHeaders.KEY,true);
        numberKey(CachedSearchOrder.KEY,0,2);defaultValue(CachedSearchOrder.KEY,0);
        booleanKey(GlobalTitleSearch.KEY);defaultValue(GlobalTitleSearch.KEY,false);
        RULES.put(GlobalTitleSearch.BOARDS,v->v instanceof String&&GlobalTitleSearch.validSelection((String)v));defaultValue(GlobalTitleSearch.BOARDS,"");
        for(String key:new String[]{VideoViewerSettings.GIF_NATIVE,VideoViewerSettings.VIDEO_NATIVE,VideoViewerSettings.THREAD_MEDIA}){
            booleanKey(key);defaultValue(key,false);
        }
        RULES.put("userAgent",value->value instanceof String&&ViewingUserAgentRules.valid((String)value));
        defaultValue("userAgent",BrowserUaTemplates.DEFAULT);
        numberKey(HaiagaruSettingsGestures.SENSITIVITY,50,200);
        defaultValue(HaiagaruSettingsGestures.SENSITIVITY,100);
        defaultValue(ExpertSettings.KEY,false);
        for(String key:EXTRA_BOOLEAN)booleanKey(key);
        for(String key:new String[]{VideoViewerSettings.HOLD_SPEED,VideoViewerSettings.TAP_CONTROLS,VideoViewerSettings.CHMATE_GESTURES,
                VideoViewerSettings.MEDIA_SWIPE,VideoViewerSettings.GIF_AUTOPLAY,VideoViewerSettings.LETTERBOX_TOUCH}){booleanKey(key);defaultValue(key,true);}
        numberKey("videoPreviewMinimumSeconds",0,86459);
        numberKey("checkerHeaderPercent",10,60);
        numberKey("hissiViewerResponseSpacingDp",0,20);
        numberKey(SearchRequestPacing.HISSI_INTERVAL_KEY,1,SearchRequestPacing.MAX_INTERVAL_SECONDS);
        numberKey(SearchRequestPacing.KYODEMO_INTERVAL_KEY,1,SearchRequestPacing.MAX_INTERVAL_SECONDS);
        defaultValue(SearchRequestPacing.HISSI_INTERVAL_KEY,3);
        defaultValue(SearchRequestPacing.KYODEMO_INTERVAL_KEY,10);
        numberKey("hissiViewerToolbarHeightDp",20,80);
        numberKey(CheckerBarOptions.TABS,20,80);
        numberKey(CheckerBarOptions.PROVIDERS,20,80);
        defaultValue(CheckerBarOptions.PROVIDERS,32);
        numberKey(HissiScanTemplate.DAYS,0,36524);
        booleanKey(HissiScanTemplate.ENABLED);
        defaultValue(HissiScanTemplate.ENABLED,true);
        numberKey(HissiScanTemplate.PROVIDER,0,3);
        RULES.put(HissiScanTemplate.BOARDS,v->v instanceof String&&((String)v).length()<=4096
                &&(((String)v).isBlank()||((String)v).matches("[A-Za-z0-9_,\\s-]+")));
        numberKey(HissiScanTemplate.PAGES,1,10000);
        numberKey(HissiScanTemplate.REQUESTS,0,Integer.MAX_VALUE);
        defaultValue(CheckerBarOptions.TABS,40);
        booleanKey(CheckerBarOptions.HANDLES);
        defaultValue(CheckerBarOptions.HANDLES,true);
        numberKey(NativeToolTabs.HEADER_HEIGHT_KEY,48,80);
        numberKey(SiteCards.MAX_PER_RESPONSE_KEY,1,20);
        defaultValue(SiteCards.MAX_PER_RESPONSE_KEY,2);
        numberKey(SiteCards.CACHE_HOURS_KEY,1,168);
        defaultValue(SiteCards.CACHE_HOURS_KEY,24);
        booleanKey(XPostPreviewPosition.ENABLED);
        defaultValue(XPostPreviewPosition.ENABLED,true);
        booleanKey(ReadingPosition.ENABLED);
        defaultValue(ReadingPosition.ENABLED,true);
        booleanKey(EmojiFontFallback.ENABLED);
        defaultValue(EmojiFontFallback.ENABLED,true);
        booleanKey(ThreadRefreshOptions.KEY);
        defaultValue(ThreadRefreshOptions.KEY,true);
        booleanKey("hissiViewerShowAdjust");
        defaultValue(NativeToolTabs.HEADER_HEIGHT_KEY,48);
        defaultValue("hissiViewerShowAdjust",true);
        numberKey("hissiViewerTextZoom",100,130);
        numberKey("popularReplyThreshold",1,9999);
        numberKey("popularReplyStandardThreshold",1,9999);
        for(String key:new String[]{"quickFilterAA","quickFilterMine","quickFilterReplies",HiddenNgUnread.KEY})booleanKey(key);
        choiceKey("urlVideoFetchMode",new HashSet<>(Arrays.asList(0,1,2,3)));
        choiceKey(GifAutoFetchPolicy.KEY,new HashSet<>(Arrays.asList(0,1,2,3)));
        defaultValue(GifAutoFetchPolicy.KEY,Haiagaru.gifAutoFetchMode());
        RULES.put("settingsLanguage",v->"ja".equals(v)||"en".equals(v)||"system".equals(v));
        RULES.put("imageVpnDomains",v->{if(!(v instanceof String))return false;
            try{ImageVpnRequestPolicy.parseDomains((String)v);return true;}catch(IllegalArgumentException invalid){return false;}});
        defaultValue("imageVpnDomains",ImageVpnRequestPolicy.DEFAULT_DOMAINS);
    }
    private static final String[] EXTRA_BOOLEAN={
        "hideNgWordIdReplies",
        "urlImageFetchEnabled","videoFrameThumbnailsEnabled","videoSwipeBrightness","videoSwipeVolume","videoDoubleTapSeek","videoYoutubeEnabled","videoAutoplay",
        "siteCardsEnabled","siteCardImages",XPostPreviewPosition.ENABLED,"patrolImagesEnabled","patrolImageFilterEnabled","responseArchiveEnabled","directBodySelection",
        "popularReplyPopup","popularReplyDirect","quickFilterCounts","quickFilterExtras","bottomQuickFilterPanel","persistentBottomQuickFilters","compactQuickFilters","wacchoiSearchEnabled","wacchoiBackgroundSearch",
        "wacchoiLongPressSearch","wacchoiLongPressSuffixSearch","wacchoiLongPressPrefixSearch","wacchoiLongPressSuffixNg","wacchoiLongPressPrefixNg","responseExtraTools","wacchoiSearchHistory","showEdgeSearch","showZzzSearch","readThreadsFirstNewOnly","automaticFoldMode",
        "groupBrowsingHistoryByBoard","imageVpnEnabled","hideDroppedHomeThreads","hideDroppedDrafts","hideDroppedSent","nativeToolTabs","nativeToolTabSettings","nativeToolTabEddi",
        "nativeToolTabSearch","nativeToolTabChecker","nativeToolTabHissi","nativeToolTabWacchoi",NativeToolTabChMateGestures.KEY,"floatingQuickFilterButton","hissiViewerCompactHeader",
        ThreadRefreshOptions.KEY
    };
    static SharedPreferences prefs(Context c){return c.getSharedPreferences(WacchoiSearchOptions.PREFS,0);}
    static boolean resetDefaults(Activity activity){
        catalog(activity);
        SharedPreferences.Editor edit=prefs(activity).edit();
        for(String key:RULES.keySet())edit.remove(key);
        edit.remove(MinimalSetup.ACTIVE);
        if(!edit.commit())return false;
        SharedPreferences.Editor archive=activity.getSharedPreferences("haiagaru_eddi_search",0).edit();
        for(String key:new String[]{"controlTextScale","resultTextScale","resultVerticalPadding","controlLayoutScale","hideSearchForm"})archive.remove(key);
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
                ||values.containsKey("siteCardsEnabled")||values.containsKey("siteCardImages")))SiteCards.changed();
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
        out.put("urlVideoFetchMode",3);
        out.put(GifAutoFetchPolicy.KEY,3);
        return out;
    }
    static Map<String,Object> minimalValues(){
        Map<String,Object> out=new LinkedHashMap<>();for(Map.Entry<String,Rule> e:RULES.entrySet())if(e.getValue().accepts(false))out.put(e.getKey(),false);
        for(String key:new String[]{"edgeReporterId","edgeReporterBoardList","dedicatedViewerEnabled","kyodemoEnhancedViewer","automaticDat",
                "hideAd","videoViewerEnabled","videoYoutubeEnabled","urlImageFetchEnabled","videoFrameThumbnailsEnabled","wacchoiSearchEnabled","showEdgeSearch",
                ThreadRefreshOptions.KEY})out.put(key,true);
        out.put("urlVideoFetchMode",0);return out;
    }
}
