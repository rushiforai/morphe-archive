package e.e.a;
import android.app.*;
import android.content.*;
import android.os.*;
import android.preference.*;
import android.view.View;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;
import org.json.JSONObject;
/** Dev-only: cache inventory/delete report, retained playback and viewport hooks. */
public final class Dev115 {
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static final ExecutorService WORK=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"nicoid-cache-size");t.setPriority(Thread.MIN_PRIORITY);return t;});
 private static final Pattern VIDEO=Pattern.compile("^((?:sm|so|nm|ss)[0-9]+)(?:[._].*)?$");
 private Dev115(){}
 private static String tr(Context c,String j,String e,String z){return Dev112.tr(c,j,e,z);}
 private static String fmt(long n){return String.format(Locale.ROOT,"%.2f MB",n/1000000.0);}
 private static final class Count {long bytes;int files;final Set<String> videos=new HashSet<>();}
 private static String folder(Context c)throws Exception{
  Class<?> k=Class.forName("e.e.a.CacheFolders");
  String root=String.valueOf(k.getMethod("root",Context.class).invoke(null,c));
  if(root.isEmpty()||root.endsWith("unselected"))throw new IOException("No cache folder");
  return root+"/nicoid/nicoid_cache/";
 }
 private static Count count(Context c)throws Exception{
  File dir=(File)Class.forName("e.e.a.CacheFile").getConstructor(String.class).newInstance(folder(c));
  File[] files=dir.listFiles();if(files==null)throw new IOException("Cannot enumerate cache");
  Count result=new Count();
  for(File f:files){
   if(!f.isFile())continue;
   Matcher m=VIDEO.matcher(f.getName());if(!m.matches())continue;
   result.files++;result.bytes+=Math.max(0,f.length());result.videos.add(m.group(1));
  }
  return result;
 }
 private static void info(Activity a,String message){
  if(a.isFinishing()||a.isDestroyed())return;
  Dev112.show(Dev112.builder(a).setTitle(tr(a,"キャッシュ削除結果","Cache deletion result","快取刪除結果")).setMessage(message).setPositiveButton("OK",null).create());
 }
 public static void cacheSettings(PreferenceActivity a){
  Preference option=a.findPreference("cache_all_delete");if(option==null)return;
  option.setSummary(tr(a,"現在の保存先にある動画キャッシュを削除します",
   "Delete cached videos in the current folder",
   "刪除目前儲存位置的影片快取"));
  option.setOnPreferenceClickListener(p->{
   String location;
   try{location=folder(a);}catch(Exception e){info(a,tr(a,"キャッシュ保存先を確認できませんでした。","Cache folder unavailable.","無法存取快取資料夾。"));return true;}
   final String root=location;
   WORK.execute(()->{
    try{Count found=count(a.getApplicationContext());MAIN.post(()->confirm(a,root,found));}
    catch(Exception e){MAIN.post(()->info(a,tr(a,"キャッシュ容量を取得できませんでした。","Cannot measure cached videos.","無法計算快取容量。")));}
   });
   return true;
  });
 }
 private static void confirm(PreferenceActivity a,String root,Count found){
  if(a.isFinishing()||a.isDestroyed())return;
  if(found.files==0){info(a,tr(a,"削除する動画キャッシュはありません。","No cached videos found.","沒有影片快取。"));return;}
  String content=found.videos.size()+tr(a,"動画"," videos"," 部影片")+" / "+found.files+
   tr(a,"ファイル"," files"," 個檔案")+" / "+fmt(found.bytes)+"\n\n"+
   tr(a,"現在のキャッシュ保存先だけを削除します。旧保存先、MP4、設定やプレイリストは削除しません。",
      "Only the current cache folder will be cleared; previous folders, MP4s, settings and playlists are retained.",
      "只刪除目前快取資料夾，不影響舊位置、MP4、設定或播放清單。");
  Dev112.show(Dev112.builder(a).setTitle(tr(a,"キャッシュをすべて削除しますか？","Delete all cached videos?","刪除全部快取影片？"))
   .setMessage(content).setNegativeButton(tr(a,"キャンセル","Cancel","取消"),null)
   .setPositiveButton(tr(a,"削除","Delete","刪除"),(d,w)->WORK.execute(()->{
    try{
     if(!root.equals(folder(a)))throw new IOException("Cache location changed");
     Count fresh=count(a.getApplicationContext());
     if(fresh.bytes!=found.bytes||fresh.files!=found.files||!fresh.videos.equals(found.videos))
      throw new IOException("Cache inventory changed");
     MAIN.post(()->remove(a,root,fresh));
    }catch(Exception ex){MAIN.post(()->info(a,tr(a,"確認後にキャッシュの保存先や内容が変わったため、削除を中止しました。",
      "The cache folder or contents changed. Deletion cancelled.","快取位置或內容已變更，取消刪除。")));}
   })).create());
 }
 private static void remove(PreferenceActivity a,String root,Count before){
  try{
   Class<?> k=Class.forName("e.e.a.CacheControl110");
   Method method=k.getDeclaredMethod("remove",Activity.class,String.class,Runnable.class);
   method.setAccessible(true);
   Runnable done=()->WORK.execute(()->{
    try{
     if(!root.equals(folder(a)))throw new IOException("Cache folder changed during deletion");
     Count after=count(a.getApplicationContext());
     int files=Math.max(0,before.files-after.files), videos=Math.max(0,before.videos.size()-after.videos.size());
     long bytes=Math.max(0,before.bytes-after.bytes);
     MAIN.post(()->info(a,tr(a,"削除完了","Deletion completed","刪除完成")+"\n"+
       videos+tr(a,"動画"," videos"," 部影片")+" / "+files+
       tr(a,"ファイル"," files"," 個檔案")+" / "+fmt(bytes)));
    }catch(Exception e){MAIN.post(()->info(a,tr(a,"削除後の容量を再測定できませんでした。","Could not remeasure cache after deletion.","無法重新計算快取容量。")));}
   });
   method.invoke(null,a,null,done);
  }catch(Exception ex){info(a,tr(a,"キャッシュ削除を開始できませんでした。","Cannot start cache deletion.","無法開始刪除快取。"));}
 }
 public static String thumbnail(JSONObject video){
  if(video==null)return "";
  String image=video.optString("thumbnail","").trim();
  if(image.isEmpty()||"null".equalsIgnoreCase(image))image=video.optString("thumbnailUrl",video.optString("thumbnail_url","")).trim();
  if(image.startsWith("//"))image="https:"+image;
  if(image.startsWith("http://"))image="https://"+image.substring(7);
  return image.startsWith("https://")?image:video.optString("videoId","");
 }
 public static void seamlessReturn(Object service){
  if(!(service instanceof Service))return;
  try{
   Object started=Class.forName("e.e.a.PopupReturn244").getMethod("start",Service.class).invoke(null,service);
   if(Boolean.TRUE.equals(started)){
    android.util.Log.i("nicoid-return","Seamless return via retained popup decoder");
    return;
   }
  }catch(Exception e){android.util.Log.w("nicoid-return","Retained playback unavailable, using fallback",e);}
  try{Class.forName("e.e.a.PlaybackReturn").getMethod("open",Object.class).invoke(null,service);}
  catch(Exception e){android.util.Log.w("nicoid-return","Playback return failed",e);}
 }
 public static void afterFullscreenRestore(View root){
  if(root==null)return;
  Runnable fix=()->{
   if(root.getWindowToken()==null)return;
   try{Class.forName("e.e.a.FullscreenViewport209").getMethod("side",View.class).invoke(null,root);}
   catch(Exception e){android.util.Log.w("nicoid-layout","Normal status inset update failed",e);}
  };
  root.postDelayed(fix,40);
  root.postDelayed(fix,240);
 }
}
