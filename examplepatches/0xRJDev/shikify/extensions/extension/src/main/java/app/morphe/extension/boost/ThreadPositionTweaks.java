package app.morphe.extension.boost;

import android.content.SharedPreferences;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.List;
import java.util.WeakHashMap;
import org.json.JSONObject;

public final class ThreadPositionTweaks {
    private static final WeakHashMap<View,Boolean> SEEN=new WeakHashMap<>();
    private static final WeakHashMap<View,Pending> PENDING=new WeakHashMap<>();
    private ThreadPositionTweaks(){}
    static String text(Object owner,String field){Object value=CommentsChromeTweaks.field(owner,field);return value instanceof String ? (String)value:"";}
    static String key(Object fragment,View view){
        String post=text(fragment,"y");
        if(post.isEmpty())post=text(CommentsChromeTweaks.field(fragment,"c"),"b");
        if(post.isEmpty() || !text(fragment,"z").isEmpty() || CommentsChromeTweaks.field(fragment,"v0")!=null || !text(fragment,"P").isEmpty())return "";
        Object sort=CommentsChromeTweaks.field(CommentsChromeTweaks.field(fragment,"b"),"c");
        return HomeAvatarTweaks.currentUser(view.getContext())+"/"+post+"/"+String.valueOf(sort);
    }
    static String commentId(Object model){
        if(model==null)return "";
        boolean comment=false;
        for(Class<?> type=model.getClass();type!=null;type=type.getSuperclass())if(type.getName().equals("com.rubenmayayo.reddit.models.reddit.CommentViewModel"))comment=true;
        if(!comment || Boolean.FALSE.equals(CommentsChromeTweaks.field(model,"S")))return "";
        String identifier=text(model,"b");return identifier.isEmpty() ? text(model,"a"):identifier;
    }
    static SharedPreferences prefs(View view){return view.getContext().getSharedPreferences("shikify_thread_positions",0);}
    public static void resume(Object fragment){
        Object value=CommentsChromeTweaks.field(fragment,"mRecyclerView");if(!(value instanceof ViewGroup))return;
        ViewGroup recycler=(ViewGroup)value;if(!SurfaceSettingsActivity.enabled(recycler.getContext(),"remember_position"))return;if(SEEN.put(recycler,Boolean.TRUE)!=null)return;
        String key=key(fragment,recycler);if(key.isEmpty())return;
        try{
            JSONObject saved=new JSONObject(prefs(recycler).getString("positions","{}"));JSONObject point=saved.optJSONObject(key);
            if(point==null)return;
            Pending pending=new Pending(fragment,recycler,point.getString("id"),point.getInt("offset"));
            PENDING.put(recycler,pending);recycler.getViewTreeObserver().addOnPreDrawListener(pending);
        }catch(Exception error){}
    }
    public static void pause(Object fragment){
        Object value=CommentsChromeTweaks.field(fragment,"mRecyclerView"),data=CommentsChromeTweaks.field(fragment,"B");
        if(!(value instanceof ViewGroup) || !(data instanceof List))return;
        ViewGroup recycler=(ViewGroup)value;
        if(!SurfaceSettingsActivity.enabled(recycler.getContext(),"remember_position"))return;
        Pending pending=PENDING.remove(recycler);
        if(pending!=null){
            pending.detach();
            return;
        }
        String key=key(fragment,recycler);if(key.isEmpty())return;
        try{
            List<?> models=(List<?>)data;View first=null;String identifier="";boolean atTop=false;
            java.lang.reflect.Method position=recycler.getClass().getMethod("J",View.class);
            for(int index=0;index<recycler.getChildCount();index++){
                View child=recycler.getChildAt(index);if(child.getBottom()<=recycler.getPaddingTop() || child.getTop()>=recycler.getHeight()-recycler.getPaddingBottom())continue;
                int item=(Integer)position.invoke(null,child);if(item<0 || item>=models.size())continue;
                if(item==0 && child.getTop()>=recycler.getPaddingTop())atTop=true;
                String candidate=commentId(models.get(item));if(candidate.isEmpty())continue;
                if(first==null || child.getTop()<first.getTop()){first=child;identifier=candidate;}
            }
            SharedPreferences preferences=prefs(recycler);JSONObject saved=new JSONObject(preferences.getString("positions","{}"));saved.remove(key);
            if(first!=null && !atTop){
                JSONObject point=new JSONObject();
                point.put("id",identifier);
                point.put("offset",first.getTop()-recycler.getPaddingTop());
                point.put("time",System.currentTimeMillis());
                saved.put(key,point);
            }
            while(saved.length()>100){
                String oldest=null;
                long timestamp=Long.MAX_VALUE;
                java.util.Iterator<String> keys=saved.keys();
                while(keys.hasNext()){
                    String candidate=keys.next();
                    long time=saved.getJSONObject(candidate).optLong("time");
                    if(time<timestamp){
                        timestamp=time;
                        oldest=candidate;
                    }
                }
                if(oldest==null)break;
                saved.remove(oldest);
            }
            preferences.edit().putString("positions",saved.toString()).apply();
        }catch(Exception error){}
    }
    private static final class Pending implements ViewTreeObserver.OnPreDrawListener {
        final WeakReference<Object> fragment;
        final WeakReference<ViewGroup> recycler;
        final String identifier;
        final int offset;
        final long deadline=SystemClock.uptimeMillis()+10000;
        Object lastData;
        int lastSize=-1;
        Pending(Object owner,ViewGroup view,String identifier,int offset){fragment=new WeakReference<>(owner);recycler=new WeakReference<>(view);this.identifier=identifier;this.offset=offset;}
        void detach(){ViewGroup view=recycler.get();if(view!=null){if(view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnPreDrawListener(this);PENDING.remove(view);}}
        @Override public boolean onPreDraw(){
            ViewGroup view=recycler.get();Object owner=fragment.get();if(view==null || owner==null){detach();return true;}
            try{
                if(SystemClock.uptimeMillis()>deadline || (Integer)view.getClass().getMethod("getScrollState").invoke(view)!=0){detach();return true;}
                Object value=CommentsChromeTweaks.field(owner,"B");if(!(value instanceof List))return true;
                List<?> models=(List<?>)value;if(value==lastData && models.size()==lastSize)return true;lastData=value;lastSize=models.size();
                for(int index=0;index<models.size();index++)if(identifier.equals(commentId(models.get(index)))){
                    Object manager=CommentsChromeTweaks.field(owner,"D");if(manager!=null)manager.getClass().getMethod("p1",int.class,int.class).invoke(manager,index,offset);
                    detach();break;
                }
            }catch(Exception error){detach();}
            return true;
        }
    }
}
