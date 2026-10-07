package e.e.a;

import android.content.Context;
import android.preference.PreferenceManager;
import org.json.*;
import java.lang.reflect.*;
import java.text.SimpleDateFormat;
import java.util.*;

/** Optional history loading; the normal response remains usable on any failure. */
public final class CommentHistory {
    private static final ThreadLocal<String> replay = new ThreadLocal<String>();
    private static final ThreadLocal<SimpleDateFormat> dateFormats = new ThreadLocal<SimpleDateFormat>();
    private static final Map<Object, Job> pending = Collections.synchronizedMap(new WeakHashMap<Object, Job>());
    private static Object field(Object owner, String name) throws Exception {
        Field f=owner.getClass().getDeclaredField(name); f.setAccessible(true); return f.get(owner);
    }
    private static String request(Object owner,String url,String body,String token) throws Exception {
        Class<?> type=Class.forName("e.e.a.ModernPlayback");
        Method method=type.getDeclaredMethod("request",owner.getClass(),String.class,String.class,String.class);
        method.setAccessible(true);return (String)method.invoke(null,owner,url,body,token);
    }
    public static String initial(Object owner,String url,String body,String token) throws Exception {
        String replacement=replay.get(); if(replacement!=null)return replacement;
        String response=request(owner,url,body,token);
        Context context=(Context)field(owner,"K");
        int limit=PreferenceManager.getDefaultSharedPreferences(context).getInt("comment_fetch_limit",0);
        pending.remove(owner);
        if(limit>0)pending.put(owner,new Job(owner,url,body,response,Math.min(10000,limit)));
        return response;
    }
    public static void extend(Object owner) {
        if(replay.get()!=null)return;
        Job job=pending.remove(owner);if(job!=null)new Thread(job,"nicoid-comment-history").start();
    }
    private static void log(String message) {
        try {Class.forName("e.e.a.ModernDebug").getMethod("record",String.class).invoke(null,message);}catch(Exception ignored){}
    }
    private static long posted(JSONObject comment) {
        String value=comment.optString("postedAt");
        try {SimpleDateFormat format=dateFormats.get();if(format==null){format=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss",Locale.US);format.setTimeZone(TimeZone.getTimeZone("UTC"));dateFormats.set(format);}long time=format.parse(value.substring(0,19)).getTime()/1000;
            if(value.endsWith("+09:00"))time-=9*3600;
            return time;
        }catch(Exception ignored){return 0;}
    }
    private static String threadId(JSONObject thread){return thread.optString("id")+":"+thread.optString("fork");}
    static final class Job implements Runnable {
        final Object owner,watch; final String video,url,body,response;final int limit;
        Job(Object owner,String url,String body,String response,int limit)throws Exception{
            this.owner=owner;this.url=url;this.body=body;this.response=response;this.limit=limit;
            watch=field(owner,"modernWatch");video=String.valueOf(field(owner,"d"));
        }
        boolean current(){try{return watch==field(owner,"modernWatch")&&video.equals(String.valueOf(field(owner,"d")))&&!Thread.currentThread().isInterrupted();}catch(Exception ignored){return false;}}
        public void run(){
            try {
                JSONObject root=new JSONObject(response), request=new JSONObject(body);
                JSONArray threads=root.getJSONObject("data").getJSONArray("threads");
                Map<String,JSONObject> dest=new LinkedHashMap<String,JSONObject>();
                Set<String> seen=new HashSet<String>();
                Map<String,Long> oldest=new HashMap<String,Long>();
                Map<String,Long> trunkOldest=new HashMap<String,Long>();
                int count=0;
                for(int i=0;i<threads.length();i++){
                    JSONObject t=threads.getJSONObject(i);String key=threadId(t);dest.put(key,t);
                    JSONArray comments=t.optJSONArray("comments");if(comments==null)continue;
                    for(int j=0;j<comments.length();j++){JSONObject c=comments.getJSONObject(j);seen.add(key+":"+c.optString("id",c.optString("no")));count++;long date=posted(c);if(date>0&&(!oldest.containsKey(key)||date<oldest.get(key)))oldest.put(key,date);if(date>0&&"trunk".equals(c.optString("source"))&&(!trunkOldest.containsKey(key)||date<trunkOldest.get(key)))trunkOldest.put(key,date);}
                }
                oldest.putAll(trunkOldest);
                if(count>=limit)return;
                JSONObject params=request.getJSONObject("params");JSONArray targets=params.getJSONArray("targets");
                int calls=0,added=0;
                for(int targetIndex=0;targetIndex<targets.length()&&count<limit&&current();targetIndex++){
                    JSONObject target=targets.getJSONObject(targetIndex);String key=target.optString("id")+":"+target.optString("fork");Long cursor=oldest.get(key);
                    if(cursor==null)continue;
                    while(count<limit&&calls++<80&&current()){
                        Thread.sleep(500);
                        JSONObject targetCopy=new JSONObject(target.toString());targetCopy.put("res_from",-1000);
                        JSONObject pageParams=new JSONObject(params.toString());pageParams.put("targets",new JSONArray().put(targetCopy));
                        JSONObject pageBody=new JSONObject(body);pageBody.put("params",pageParams);pageBody.put("additionals",new JSONObject().put("when",cursor));
                        JSONObject page;try{page=new JSONObject(request(owner,url,pageBody.toString(),null));}catch(Exception error){log("Comment history request stopped: "+error.getClass().getSimpleName());break;}
                        JSONObject data=page.optJSONObject("data");if(data==null)break;
                        JSONArray batch=data.optJSONArray("threads");if(batch==null)break;
                        long next=cursor;int fresh=0;
                        for(int i=0;i<batch.length();i++){
                            JSONObject t=batch.getJSONObject(i);String tk=threadId(t);JSONArray cs=t.optJSONArray("comments");if(cs==null)continue;
                            JSONObject output=dest.get(tk);if(output==null){output=new JSONObject(t.toString());output.put("comments",new JSONArray());dest.put(tk,output);threads.put(output);}
                            JSONArray out=output.getJSONArray("comments");
                            for(int j=0;j<cs.length()&&count<limit;j++){
                                JSONObject c=cs.getJSONObject(j);long date=posted(c);if(date>0&&date<next)next=date;
                                if(seen.add(tk+":"+c.optString("id",c.optString("no")))){out.put(c);fresh++;count++;added++;}
                            }
                        }
                        if(fresh==0||next>=cursor)break;cursor=next;
                    }
                }
                if(added>0&&current()){
                    replay.set(root.toString());
                    try {Class.forName("e.e.a.ModernComments").getMethod("load",owner.getClass()).invoke(null,owner);}
                    finally {replay.remove();}
                }
                log("Comment history: "+count+" comments; target "+limit+"; requests "+calls);
            }catch(Exception error){log("Comment history stopped: "+error.getClass().getSimpleName());}
        }
    }
}
