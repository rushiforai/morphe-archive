package app.morphe.extension.boost;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import java.lang.reflect.Constructor;
import java.util.List;

/** Fills the empty search page with feeds and subscriptions, using Boost's own rows. */
public final class SearchTweaks {
    private static final String MODEL="com.rubenmayayo.reddit.models.reddit.SubscriptionViewModel";
    static final String FEEDS="Feeds",SUBSCRIPTIONS="Subscriptions";
    private static final int HEADER=6,COMMUNITY=5;
    private static Constructor<?> option;
    private SearchTweaks() { }
    static boolean collapsed(Context context,String section) {
        return SurfaceSettingsActivity.prefs(context).getBoolean("shikify_search_collapsed_"+section,false);
    }
    private static Object row(Context context,int type,String label,Object subscription) throws ReflectiveOperationException {
        if(option==null)option=Class.forName("bn2",true,context.getClassLoader()).getConstructor(int.class,String.class);
        Object row=option.newInstance(type,label);
        if(subscription!=null)row.getClass().getField("c").set(row,subscription);
        return row;
    }
    /** Runs on the empty page only, just before Boost adds its Go to section. */
    public static void onList(Object activity) {
        if(!(activity instanceof Context))return;
        Context context=(Context)activity;
        if(!SurfaceSettingsActivity.enabled(context,"search_page"))return;
        try {
            Object rows=CommentsChromeTweaks.field(activity,"a");
            if(!(rows instanceof List))return;
            @SuppressWarnings("unchecked") List<Object> list=(List<Object>)rows;
            Class<?> model=Class.forName(MODEL,true,context.getClassLoader());
            list.add(row(context,HEADER,FEEDS,null));
            if(!collapsed(context,FEEDS))for(String factory:new String[]{"c","o","a"}){
                Object feed=model.getMethod(factory).invoke(null);
                list.add(row(context,COMMUNITY,HomeAvatarTweaks.string(feed,"a"),feed));
            }
            Object saved=HomeAvatarTweaks.reddit(context).getClass().getMethod("K").invoke(HomeAvatarTweaks.reddit(context));
            if(saved instanceof List && !((List<?>)saved).isEmpty()){
                list.add(row(context,HEADER,SUBSCRIPTIONS,null));
                if(!collapsed(context,SUBSCRIPTIONS))for(Object subscription:(List<?>)saved){
                    if(!model.isInstance(subscription))continue;
                    String name=HomeAvatarTweaks.string(subscription,"a");
                    if(name.isEmpty() || name.startsWith("_") || name.equals("all") || name.equals("popular"))continue;
                    list.add(row(context,COMMUNITY,name,subscription));
                }
            }
            // Boost does not always refresh the adapter on this path.
            Object adapter=CommentsChromeTweaks.field(activity,"b"),recycler=CommentsChromeTweaks.field(activity,"mRecyclerView");
            if(adapter!=null && recycler instanceof View)((View)recycler).post(()->{
                try{adapter.getClass().getMethod("notifyDataSetChanged").invoke(adapter);}
                catch(ReflectiveOperationException | RuntimeException error){}
            });
        }catch(ReflectiveOperationException | RuntimeException error){}
    }
    /** Returns true when the tapped header is one of these sections. */
    public static boolean onHeader(Object activity,Object row) {
        if(!(activity instanceof Context))return false;
        Object title=CommentsChromeTweaks.field(row,"b");
        if(!FEEDS.equals(title) && !SUBSCRIPTIONS.equals(title))return false;
        Context context=(Context)activity;
        SharedPreferences preferences=SurfaceSettingsActivity.prefs(context);
        preferences.edit().putBoolean("shikify_search_collapsed_"+title,!collapsed(context,(String)title)).apply();
        try{activity.getClass().getMethod("y1").invoke(activity);}
        catch(ReflectiveOperationException | RuntimeException error){}
        return true;
    }
}
