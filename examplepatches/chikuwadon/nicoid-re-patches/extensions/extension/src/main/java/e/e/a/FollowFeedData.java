package e.e.a;

import java.text.SimpleDateFormat;
import java.util.*;
import org.json.*;

/** Feed records keep activity identity separate from the target video. */
final class FollowFeedData {
    static final class Actor {
        final String id,type,name,icon;
        Actor(JSONObject actor) {
            id=string(actor,"id"); type=string(actor,"type"); name=string(actor,"name"); icon=string(actor,"iconUrl");
        }
        String key() { return type+":"+(id.isEmpty()?name:id); }
    }
    static final class Item {
        final String id,title,thumbnail,actor,date,key,kind,message,subMessage,label;
        final Actor author; final long time; final int duration; final boolean shortVideo,upload;
        Item(JSONObject activity,JSONObject content) {
            message=string(activity.optJSONObject("message"),"text");subMessage=string(activity.optJSONObject("subMessage"),"text");label=string(activity.optJSONObject("label"),"text");
            id=string(content,"id"); String label=string(content,"title"); title=label.isEmpty()?id:label;
            thumbnail=string(activity,"thumbnailUrl"); author=new Actor(activity.optJSONObject("actor")); actor=author.name;
            date=string(activity,"createdAt"); time=timestamp(date); kind=string(activity,"kind");
            String normalized=kind.toLowerCase(Locale.ROOT);
            shortVideo=id.startsWith("ss")||string(content,"type").toLowerCase(Locale.ROOT).contains("short");
            upload=normalized.isEmpty()||normalized.contains("upload")||normalized.contains("post")||normalized.contains("publish")||normalized.contains("create");
            JSONObject video=content.optJSONObject("video");duration=Math.max(0,video==null?content.optInt("duration",0):video.optInt("duration",0));
            String activityId=string(activity,"id");
            key=activityId.isEmpty()?id+"|"+kind+"|"+date+"|"+author.key():activityId;
        }
        boolean matches(int filter,String actorKey) {
            return (actorKey==null||actorKey.equals(author.key())) &&
                (filter==3||(upload&&(filter==0||(filter==1&&!shortVideo)||(filter==2&&shortVideo))));
        }
    }
    static String string(JSONObject value,String key) {
        return value==null||value.isNull(key)?"":value.optString(key,"");
    }
    static ArrayList<Item> parse(JSONObject response) {
        ArrayList<Item> result=new ArrayList<>();JSONArray activities=response.optJSONArray("activities");if(activities==null)return result;
        for(int i=0;i<activities.length();i++) {
            JSONObject activity=activities.optJSONObject(i);if(activity==null)continue;
            JSONObject content=activity.optJSONObject("content");if(content==null)continue;
            String type=string(content,"type").toLowerCase(Locale.ROOT);
            if(!type.equals("video")&&!type.equals("short")&&!type.equals("shortvideo"))continue;
            if(!string(content,"id").matches("(?:sm|nm|so|ss)?[0-9]+"))continue;
            result.add(new Item(activity,content));
        }
        return result;
    }
    static ArrayList<Actor> actors(JSONObject response) {
        ArrayList<Actor> result=new ArrayList<>();JSONArray actors=response.optJSONArray("actors");if(actors==null)return result;
        HashSet<String> seen=new HashSet<>();
        for(int i=0;i<actors.length();i++) {
            JSONObject value=actors.optJSONObject(i);if(value==null)continue;
            Actor actor=new Actor(value);if(!actor.id.isEmpty()&&seen.add(actor.key()))result.add(actor);
        }
        return result;
    }
    static long timestamp(String value) {
        if(value.isEmpty())return 0;
        String normalized=value.replaceFirst("Z$","+0000").replaceFirst("([+-]\\d\\d):(\\d\\d)$","$1$2");
        for(String pattern:new String[]{"yyyy-MM-dd'T'HH:mm:ss.SSSZ","yyyy-MM-dd'T'HH:mm:ssZ"})try {
            SimpleDateFormat parser=new SimpleDateFormat(pattern,Locale.ROOT);parser.setLenient(false);
            return parser.parse(normalized).getTime();
        }catch(Exception ignored){}
        return 0;
    }
    /** Calendar-day boundaries avoid DST and time-zone errors in period headings. */
    static int bucket(long time,long now) {
        if(time<=0)return 5;
        Calendar boundary=Calendar.getInstance();boundary.setTimeInMillis(now);
        boundary.set(Calendar.HOUR_OF_DAY,0);boundary.set(Calendar.MINUTE,0);boundary.set(Calendar.SECOND,0);boundary.set(Calendar.MILLISECOND,0);
        if(time>=boundary.getTimeInMillis())return 0;
        boundary.add(Calendar.DAY_OF_MONTH,-1);if(time>=boundary.getTimeInMillis())return 1;
        boundary.add(Calendar.DAY_OF_MONTH,-6);if(time>=boundary.getTimeInMillis())return 2;
        boundary.add(Calendar.DAY_OF_MONTH,-24);return time>=boundary.getTimeInMillis()?3:4;
    }
    static String date(Item item) { return item.time==0?item.date:new SimpleDateFormat("yyyy/M/d",Locale.ROOT).format(new Date(item.time)); }
    static String duration(int seconds) {
        return seconds>=3600?String.format(Locale.ROOT,"%d:%02d:%02d",seconds/3600,seconds/60%60,seconds%60):String.format(Locale.ROOT,"%d:%02d",seconds/60,seconds%60);
    }
}
