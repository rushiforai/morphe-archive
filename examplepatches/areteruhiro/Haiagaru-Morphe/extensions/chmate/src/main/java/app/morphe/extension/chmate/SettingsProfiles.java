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
        for(SettingsSections.Category c:SettingsSections.Category.values())Haiagaru.settingsCategory(activity,c.name());
        for(String key:EXTRA_BOOLEAN)booleanKey(key);
        numberKey("videoPreviewMinimumSeconds",0,86459);
        numberKey("checkerHeaderPercent",10,60);
        numberKey("hissiViewerResponseSpacingDp",0,20);
        numberKey("hissiViewerToolbarHeightDp",32,56);
        numberKey(NativeToolTabs.HEADER_HEIGHT_KEY,32,64);
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
        "urlImageFetchEnabled","videoFrameThumbnailsEnabled","videoSwipeBrightness","videoSwipeVolume","videoDoubleTapSeek","videoYoutubeEnabled",
        "siteCardsEnabled","siteCardImages","patrolImagesEnabled","patrolImageFilterEnabled","responseArchiveEnabled","directBodySelection",
        "popularReplyPopup","popularReplyDirect","quickFilterCounts","quickFilterExtras","bottomQuickFilterPanel","persistentBottomQuickFilters","compactQuickFilters","wacchoiSearchEnabled","wacchoiBackgroundSearch",
        "wacchoiLongPressSearch","wacchoiLongPressSuffixSearch","wacchoiLongPressPrefixSearch","wacchoiLongPressSuffixNg","wacchoiLongPressPrefixNg","responseExtraTools","wacchoiSearchHistory","showEdgeSearch","showZzzSearch","readThreadsFirstNewOnly","automaticFoldMode",
        "groupBrowsingHistoryByBoard","imageVpnEnabled","hideDroppedHomeThreads","hideDroppedDrafts","hideDroppedSent","nativeToolTabs","nativeToolTabSettings","nativeToolTabEddi",
        "nativeToolTabSearch","nativeToolTabChecker","nativeToolTabHissi","nativeToolTabWacchoi","floatingQuickFilterButton","hissiViewerCompactHeader"
    };
    static SharedPreferences prefs(Context c){return c.getSharedPreferences(WacchoiSearchOptions.PREFS,0);}
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
    static Map<String,Object> minimalValues(){
        Map<String,Object> out=new LinkedHashMap<>();for(Map.Entry<String,Rule> e:RULES.entrySet())if(e.getValue().accepts(false))out.put(e.getKey(),false);
        for(String key:new String[]{"edgeReporterId","edgeReporterBoardList","dedicatedViewerEnabled","kyodemoEnhancedViewer","automaticDat",
                "hideAd","videoViewerEnabled","videoYoutubeEnabled","urlImageFetchEnabled","videoFrameThumbnailsEnabled","wacchoiSearchEnabled","showEdgeSearch"})out.put(key,true);
        out.put("urlVideoFetchMode",0);return out;
    }
}
