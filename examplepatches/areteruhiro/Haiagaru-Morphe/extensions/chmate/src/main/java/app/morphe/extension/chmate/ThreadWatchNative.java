package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Build;
import java.io.*;
import java.util.*;
import org.json.*;

/** Serialize notification delivery and identify replies by their new response number, not anchor target. */
public final class ThreadWatchNative {
    private static final java.util.regex.Pattern SHITARABA_NUMBER=java.util.regex.Pattern.compile("[0-9]{1,7}<>");
    private static final ThreadLocal<ArrayDeque<Frame>> CURRENT=ThreadLocal.withInitial(ArrayDeque::new);
    private static final class Frame{
        final ThreadWatchRules.Target target;final String token;final File dat;final int before;
        String preview;
        Frame(ThreadWatchRules.Target t,String k,File f,int b){target=t;token=k;dat=f;before=b;}
    }
    private static TreeMap<Integer,Integer> ranges(JSONObject item){
        TreeMap<Integer,Integer> result=new TreeMap<>();JSONArray data=item.optJSONArray("delivered");
        if(data!=null)for(int i=0;i<data.length();i++){
            JSONArray range=data.optJSONArray(i);if(range!=null&&range.length()==2){int a=range.optInt(0),b=range.optInt(1);if(a>0&&b>=a)result.put(a,b);}
        }
        return result;
    }
    static Set<Integer> seen(Context c,String url,Collection<Integer> numbers)throws Exception{
        TreeMap<Integer,Integer> ranges=ranges(new JSONObject(ThreadWatch.prefs(c).getString(url,"{}")));Set<Integer> result=new HashSet<>();
        for(int no:numbers){Map.Entry<Integer,Integer> range=ranges.floorEntry(no);if(range!=null&&range.getValue()>=no)result.add(no);}
        return result;
    }
    static int seenCount(Context c,String url,int first,int last)throws Exception{
        int count=0;for(Map.Entry<Integer,Integer> range:ranges(new JSONObject(ThreadWatch.prefs(c).getString(url,"{}"))).entrySet()){
            int a=Math.max(first,range.getKey()),b=Math.min(last,range.getValue());if(b>=a)count+=b-a+1;
        }
        return count;
    }
    static void record(JSONObject item,Collection<Integer> numbers)throws Exception{
        TreeMap<Integer,Integer> all=ranges(item);
        for(int no:numbers)merge(all,no,no);
        store(item,all);
    }
    static void recordRange(JSONObject item,int first,int last)throws Exception{
        TreeMap<Integer,Integer> all=ranges(item);if(first>0&&last>=first)merge(all,first,last);store(item,all);
    }
    private static void merge(TreeMap<Integer,Integer> all,int a,int b){
        Map.Entry<Integer,Integer> lower=all.floorEntry(a);
        if(lower!=null&&(long)lower.getValue()+1>=a){a=lower.getKey();b=Math.max(b,lower.getValue());all.remove(lower.getKey());}
        Map.Entry<Integer,Integer> next=all.ceilingEntry(a);
        while(next!=null&&(long)next.getKey()<=((long)b+1)){b=Math.max(b,next.getValue());all.remove(next.getKey());next=all.ceilingEntry(a);}
        all.put(a,b);
    }
    private static void store(JSONObject item,TreeMap<Integer,Integer> ranges)throws Exception{
        JSONArray data=new JSONArray();for(Map.Entry<Integer,Integer> range:ranges.entrySet())data.put(new JSONArray().put(range.getKey()).put(range.getValue()));item.put("delivered",data);
    }
    public static void beginPacked(Object[] args){begin(args!=null&&args.length>1?args[1]:null);}
    public static void begin(Object info){
        Frame frame=new Frame(null,"",null,-1);Context c=Haiagaru.applicationContextForExtension();
        if(c==null){CURRENT.get().push(frame);return;}
        try{
            String version=c.getPackageManager().getPackageInfo(c.getPackageName(),0).versionName;boolean old=version.contains("191"),middle=version.contains("226");
            String server=(String)NativeFields.find(info.getClass(),old?"i":middle?"g":"f").get(info);
            String board=(String)NativeFields.find(info.getClass(),old?"b":middle?"f":"g").get(info);Object id=NativeFields.find(info.getClass(),middle?"c":"e").get(info);
            ThreadWatchRules.Target t=ThreadWatchRules.fromParts(server,board,id);
            if(t!=null){
                String token=new JSONObject(ThreadWatch.prefs(c).getString(t.url,"{}")).optString("token");
                String name=RefreshTargets.nativeBoard(info,version).toString();
                if(!name.contains("/")&&!name.contains("\\")&&!name.contains("..")){
                    File dat=new File(new File(HaiagaruSyncSnapshot.externalRoot(c),"dat"),name+"_"+t.id+".dat");
                    if(!NotificationNg.enabled(c)&&token.isEmpty()&&!dat.isFile()){
                        CURRENT.get().push(frame);
                        return;
                    }
                    int before=-1;File database=c.getDatabasePath("roidon.sqlite");
                    try(SQLiteDatabase db=SQLiteDatabase.openDatabase(database.getPath(),null,SQLiteDatabase.OPEN_READONLY);
                        Cursor rows=db.rawQuery("SELECT res_count FROM bookmarks WHERE name=? AND created=?",new String[]{name,t.id})){
                        if(rows.moveToFirst())before=rows.getInt(0);
                    }
                    frame=new Frame(t,token,dat,before);
                }
            }
        }catch(Exception ignored){}
        CURRENT.get().push(frame);
    }
    public static void end(){ArrayDeque<Frame> stack=CURRENT.get();stack.poll();if(stack.isEmpty())CURRENT.remove();}
    private static Set<Integer> replies(Frame frame,Context c)throws Exception{
        if(frame.target==null||frame.dat==null||!frame.dat.isFile())return null;
        Set<Integer> own=new HashSet<>(ThreadWatchOwnPosts.read(c,frame.target));
        JSONObject item=new JSONObject(ThreadWatch.prefs(c).getString(frame.target.url,"{}"));JSONArray saved=item.optJSONArray("own");if(saved!=null)for(int i=0;i<saved.length();i++)if(saved.optInt(i)>0)own.add(saved.optInt(i));
        if(own.isEmpty())return null;
        boolean suppress=NotificationNg.enabled(c);
        if(frame.before<0&&!suppress&&frame.token.isEmpty())return null;
        boolean chain=suppress&&NotificationNg.chainedRepliesEnabled(c);
        boolean script=suppress&&ProgrammableNgController.programmableBodyRulesEnabled();
        String charset=frame.target.shitaraba?"EUC-JP":frame.target.url.contains("eddibb.cc/")||frame.target.url.contains("eddibb.net/")?"UTF-8":"MS932";
        if(frame.dat.length()>32L*1024*1024)throw new IOException("Notification DAT too large");
        Map<Integer,String> visible=new TreeMap<>();
        List<NotificationNg.Row> rows=new ArrayList<>();
        try(BufferedReader reader=new BufferedReader(NotificationDatText.reader(frame.dat,charset))){
            String line;int ordinal=0;
            while((line=reader.readLine())!=null){
                ordinal++;
                if(!chain&&!script&&!frame.target.shitaraba&&ordinal<=frame.before)continue;
                // Shitaraba caches can use ordinary DAT or rawmode with a leading response number.
                boolean numbered=frame.target.shitaraba&&SHITARABA_NUMBER.matcher(line).lookingAt()
                        &&line.split("<>",7).length==7;
                NotificationNg.Row row=NotificationNg.Row.parse(line,ordinal,numbered);
                if(row==null)continue;
                boolean reply=row.number>frame.before
                        &&ThreadWatchRules.repliesTo(ProgrammableNgController.plain(row.body),row.number,own);
                if(reply)visible.put(row.number,row.previewBody());
                if(chain||script||suppress&&reply)rows.add(row);
            }
        }
        if(visible.isEmpty())return null;
        if(suppress)NotificationNg.removeBlocked(c,frame.target,rows,visible,chain,script);
        Set<Integer> result=new TreeSet<>(visible.keySet());
        if(!result.isEmpty()){
            List<String> lines=new ArrayList<>();
            for(int number:result){String text=ProgrammableNgController.plain(visible.get(number));
                lines.add(">>"+number+" "+text.substring(0,Math.min(text.length(),300)));
                if(lines.size()>3)lines.remove(0);
            }
            frame.preview=android.text.TextUtils.join("\n",lines);
        }
        return result;
    }
    private static boolean allowed(Context c,String channel){
        NotificationManager manager=(NotificationManager)c.getSystemService(Context.NOTIFICATION_SERVICE);
        if(manager==null||Build.VERSION.SDK_INT>=24&&!manager.areNotificationsEnabled())return false;
        if(Build.VERSION.SDK_INT>=33&&c.checkSelfPermission("android.permission.POST_NOTIFICATIONS")!=android.content.pm.PackageManager.PERMISSION_GRANTED)return false;
        if(Build.VERSION.SDK_INT>=26){NotificationChannel value=manager.getNotificationChannel(channel);if(value!=null&&value.getImportance()==0)return false;}
        return true;
    }
    private static boolean duplicate(Frame frame,Context c,Set<Integer> replies)throws Exception{
        return replies!=null&&(replies.isEmpty()||seen(c,frame.target.url,replies).containsAll(replies));
    }
    private static void delivered(Frame frame,Context c,Set<Integer> replies,String channel)throws Exception{
        if(frame==null||frame.target==null||replies==null||!allowed(c,channel))return;
        if(!ThreadWatch.prefs(c).contains(frame.target.url))return;
        JSONObject item=new JSONObject(ThreadWatch.prefs(c).getString(frame.target.url,"{}"));if(!frame.token.equals(item.optString("token")))return;
        record(item,replies);if(item.optBoolean("stopAfterReply",false))item.put("paused",true);
        ThreadWatch.prefs(c).edit().putString(frame.target.url,item.toString()).commit();ThreadWatch.schedule(c);
    }
    public static void emitLegacy(Context c,int icon,CharSequence title,CharSequence ticker,CharSequence text,int id,PendingIntent tap,Uri sound,long time,String channel){
        Frame frame=CURRENT.get().peek();Set<Integer> replies=null;
        try{if("reply".equals(channel)&&frame!=null&&frame.target!=null)replies=replies(frame,c);}
        catch(Exception error){android.util.Log.w("Haiagaru","Reply NG check unavailable",error);}
        synchronized(ThreadWatch.LOCK){
            try{if(duplicate(frame,c,replies))return;}
            catch(Exception error){android.util.Log.w("Haiagaru","Reply duplicate check unavailable",error);}
            nativeLegacy(c,icon,title,frame!=null&&frame.preview!=null?title:ticker,frame!=null&&frame.preview!=null?frame.preview:text,id,tap,sound,time,channel);
            try{delivered(frame,c,replies,channel);}catch(Exception error){android.util.Log.w("Haiagaru","Reply notification state unavailable",error);}
        }
    }
    public static void emitModern(Context c,int icon,CharSequence title,CharSequence ticker,CharSequence text,PendingIntent tap,Uri sound,String channel){
        Frame frame=CURRENT.get().peek();Set<Integer> replies=null;
        try{if("reply".equals(channel)&&frame!=null&&frame.target!=null)replies=replies(frame,c);}
        catch(Exception error){android.util.Log.w("Haiagaru","Reply NG check unavailable",error);}
        synchronized(ThreadWatch.LOCK){
            try{if(duplicate(frame,c,replies))return;}
            catch(Exception error){android.util.Log.w("Haiagaru","Reply duplicate check unavailable",error);}
            nativeModern(c,icon,title,frame!=null&&frame.preview!=null?title:ticker,frame!=null&&frame.preview!=null?frame.preview:text,tap,sound,channel);
            try{delivered(frame,c,replies,channel);}catch(Exception error){android.util.Log.w("Haiagaru","Reply notification state unavailable",error);}
        }
    }
    private static void nativeLegacy(Context c,int icon,CharSequence title,CharSequence ticker,CharSequence text,int id,PendingIntent tap,Uri sound,long time,String channel){ }
    private static void nativeModern(Context c,int icon,CharSequence title,CharSequence ticker,CharSequence text,PendingIntent tap,Uri sound,String channel){ }
    private ThreadWatchNative(){}
}
