package app.morphe.extension.chmate;

import android.content.Context;
import android.util.Log;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** HOME-only favorites tab. Never changes the persisted favorite filter. */
public final class FavoriteThreads {
    public static final int TAB = 108;
    private static final Map<Object, Boolean> selected = new WeakHashMap<>();
    private FavoriteThreads() { }

    public static synchronized void selected(Object home, int mode) {
        selected.put(home, Math.abs(mode) == TAB);
        HomeRefreshTargets.selected(home,mode);
    }
    public static int nativeMode(int mode) { return Math.abs(mode) == TAB || Math.abs(mode)==HomeRefreshTargets.TAB ? 102 : mode; }
    public static List<?> filterFor(Object home, List<?> rows) {
        if(HomeRefreshTargets.active(home))return HomeRefreshTargets.filter(rows);
        synchronized (FavoriteThreads.class) {
            return Boolean.TRUE.equals(selected.get(home)) ? filter(rows) : rows;
        }
    }
    public static Object legacyRows(Object home, Object rows) {
        boolean targets=HomeRefreshTargets.active(home);
        synchronized (FavoriteThreads.class) {
            if ((!targets&&!Boolean.TRUE.equals(selected.get(home))) || !(rows instanceof List)) return rows;
        }
        try { return rows.getClass().getConstructor(List.class).newInstance(targets?HomeRefreshTargets.filter((List<?>)rows):filter((List<?>) rows)); }
        catch (Exception error) { throw new IllegalStateException("Favorite thread list binding changed", error); }
    }
    public static int titleResource(Object home, int original) {
        if(HomeRefreshTargets.active(home))return HomeRefreshTargets.titleResource(original);
        synchronized (FavoriteThreads.class) {
            if (!Boolean.TRUE.equals(selected.get(home))) return original;
        }
        Context context = Haiagaru.applicationContextForExtension();
        if (context == null) return original;
        int id = context.getResources().getIdentifier("haiagaru_favorite_threads_description", "string", context.getPackageName());
        return id == 0 ? original : id;
    }
    public static String title(Object home, String original) {
        if(HomeRefreshTargets.active(home))return "対象スレ";
        synchronized (FavoriteThreads.class) {
            return Boolean.TRUE.equals(selected.get(home)) ? "★スレ" : original;
        }
    }

    public static List<?> filter(List<?> rows) {
        ArrayList<Object> result = new ArrayList<>();
        if (rows == null) return result;
        for (Object row : rows) {
            if (row == null) continue;
            String type = row.getClass().getName();
            String rating;
            if (type.equals("o.onAdDisplayed$setIcon")) rating = "b";
            else if (type.equals("o.Yy2$open")) rating = "c";
            else if (type.equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ")) rating = "h";
            else continue;
            try {
                Class<?> owner = row.getClass();
                Field field = null;
                while (owner != null) {
                    try { field = owner.getDeclaredField(rating); break; }
                    catch (NoSuchFieldException ignored) { owner = owner.getSuperclass(); }
                }
                if (field == null) throw new NoSuchFieldException(rating);
                field.setAccessible(true);
                if (((Number) field.get(row)).intValue() > 0) result.add(row);
            } catch (Exception error) {
                // Do not accidentally include unstarred threads if a binding changes.
                Log.w("Haiagaru", "Favorite thread rating unavailable", error);
            }
        }
        return result;
    }

    public static boolean refresh(Object fragment, int action) {
        if (action == TAB || action==HomeRefreshTargets.TAB) {
            try {
                String name = fragment.getClass().getName();
                if (!name.equals("o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk") &&
                    !name.equals("jp.syoboi.a2chMate.fragment.HomeFragment") &&
                    !name.equals("jp.syoboi.a2chMate.ui.home.HomeFragment")) return false;
                java.lang.reflect.Method method = fragment.getClass().getDeclaredMethod(
                        name.contains("ui.home") ? "d" : "a", int.class);
                method.setAccessible(true);
                method.invoke(fragment, action);
                return true;
            } catch (Exception error) {
                Log.w("Haiagaru", "Favorite thread tab unavailable", error);
                return true;
            }
        }
        if (action != 5) return false;
        if(HomeRefreshTargets.active(fragment)){
            Context context=Haiagaru.toolbarActivity(fragment);
            if(context!=null)RefreshTargets.enqueue(context);
            return true;
        }
        boolean active;
        synchronized (FavoriteThreads.class) {
            active = Boolean.TRUE.equals(selected.get(fragment));
        }
        if (!active && fragment != null && fragment.getClass().getName().equals("jp.syoboi.a2chMate.ui.home.HomeFragment")) {
            try {
                Object model = fragment.getClass().getMethod("m").invoke(fragment);
                Field flowField = model.getClass().getDeclaredField("o"); flowField.setAccessible(true);
                Object flow = flowField.get(model);
                active = ((Number) flow.getClass().getMethod("d").invoke(flow)).intValue() == TAB;
            } catch (Exception error) { Log.w("Haiagaru", "Favorite tab selection unavailable", error); }
        }
        if (!active) return false;
        try {
            Context context = (Context) fragment.getClass().getMethod("requireContext").invoke(fragment);
            String version = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            String owner = version.contains("191") ? "o.mdExternalSyntheticLambda0"
                    : version.contains("226") ? "o.settings" : "o.TTRewardVideoActivity8";
            String method = version.contains("226") ? "b" : "c";
            Class.forName(owner, false, fragment.getClass().getClassLoader())
                    .getDeclaredMethod(method, Context.class, boolean.class).invoke(null, context, true);
            return true;
        } catch (Exception error) {
            Log.w("Haiagaru", "Favorite thread refresh unavailable", error);
            return true; // Never fall back to refreshing all non-favorite threads.
        }
    }
}
