package app.morphe.extension.boost;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;

/**
 * Boost asks getActiveNetworkInfo() if it is online. Android reports BLOCKED there for an app with
 * restricted data on a metered network, so Boost gives up without trying. Asking whether a usable
 * network exists lets the request run, and a real block then fails with a real error.
 */
public final class NetworkTweaks {
    /** ThingsAsyncLoader, LoadCommentsAsync, LoadMoreCommentsAsync and LoadSubmissionAsync. */
    private static final java.util.Set<String> CONTENT=new java.util.HashSet<>(java.util.Arrays.asList("r83","ak1","dk1","gk1"));
    private static final ThreadLocal<Object> ACCOUNT=new ThreadLocal<>();
    private static final ThreadLocal<Boolean> IN_TOKEN=new ThreadLocal<>();
    private static final ThreadLocal<Boolean> RESTORING=new ThreadLocal<>();
    /** A token this close to expiry is refreshed the usual way. */
    private static final long RESTORE_MARGIN=5*60*1000;
    private static boolean restoreTried;
    private static final int FIRST_PAGE=25,DEFAULT_PAGE=50;
    private static volatile java.lang.reflect.Method tokenCheck;
    /** Requests per minute while Reddit reports enough budget: one every 100 ms. */
    private static final int BURST_RATE=600;
    /** Below this many requests left in Reddit's window, the paced rate applies again. */
    private static final double LOW_BUDGET=20;
    private static volatile double remaining=-1;
    private static volatile boolean parallel=true,burst=true,instantLogin=true,smallPage=true,reachable=true;
    private NetworkTweaks() { }
    /** Read once at launch. Requests can start before any screen exists. */
    public static void init(Context context) {
        parallel=SurfaceSettingsActivity.enabled(context,"parallel_loading");
        burst=SurfaceSettingsActivity.enabled(context,"request_queue");
        instantLogin=SurfaceSettingsActivity.enabled(context,"instant_login");
        smallPage=SurfaceSettingsActivity.enabled(context,"first_page");
        reachable=SurfaceSettingsActivity.enabled(context,"online_check");
    }
    /** Larger requests made on purpose, such as Patcheddit's popular list, are left alone. */
    public static int pageLimit(int limit,boolean started) {
        return smallPage && !started && limit>FIRST_PAGE && limit<=DEFAULT_PAGE ? FIRST_PAGE:limit;
    }
    /** Reddit sends what is left of the current window with each response. */
    public static void remaining(String header) {
        if(header==null)return;
        try {remaining=Double.parseDouble(header);}catch(NumberFormatException ignored){ }
    }
    /**
     * JRAW spaces requests evenly, starting at one a second, which queues a cold start for
     * seconds. Requests go through quickly while Reddit reports budget, and JRAW's pacing returns
     * when it runs low.
     */
    public static int rate(int requestsPerMinute) {
        return !burst || requestsPerMinute<1 || remaining>=0 && remaining<LOW_BUDGET ? requestsPerMinute:BURST_RATE;
    }
    /**
     * Runs Boost's token check under a lock so parallel loaders share one login. It returns true
     * once the check has run, and false on the inner call, which lets Boost's own code continue.
     */
    public static boolean token(Object api) throws Throwable {
        if(Boolean.TRUE.equals(IN_TOKEN.get()))return false;
        synchronized(api) {
            IN_TOKEN.set(true);
            try {
                boolean restored=Features.instantLogin() && instantLogin && !restoreTried && restore(api);
                restoreTried=true;
                if(tokenCheck==null)tokenCheck=api.getClass().getMethod("b");
                tokenCheck.invoke(api);
                if(restored)renew(api);
            }catch(java.lang.reflect.InvocationTargetException error){
                throw error.getCause();
            }finally{IN_TOKEN.remove();}
        }
        return true;
    }
    /**
     * Boost saves its login but fetches a new token on every launch, and content waits for that.
     * A saved token that is still valid is used straight away. The normal login then runs in the
     * background, which fills in the account and replaces a token Reddit no longer accepts. Any
     * problem here leaves the client as it was, so Boost logs in the usual way.
     */
    private static boolean restore(Object api) {
        try {
            Object user=api.getClass().getField("a").get(api),client=api.getClass().getField("e").get(api);
            if(user==null || client==null)return false;
            java.util.Date expires=(java.util.Date)user.getClass().getField("expirationDate").get(user);
            String saved=(String)user.getClass().getField("oAuthData").get(user);
            String refresh=(String)user.getClass().getField("refreshToken").get(user);
            String name=(String)user.getClass().getField("name").get(user);
            if(expires==null || saved==null || refresh==null || name==null || expires.getTime()-System.currentTimeMillis()<RESTORE_MARGIN)return false;
            if((Boolean)client.getClass().getMethod("isAuthenticated").invoke(client))return false;
            ClassLoader loader=client.getClass().getClassLoader();
            Class<?> method=Class.forName("net.dean.jraw.http.AuthenticationMethod",true,loader);
            Class<?> node=Class.forName("com.fasterxml.jackson.databind.JsonNode",true,loader);
            Class<?> status=Class.forName("net.dean.jraw.http.oauth.OAuthHelper$AuthStatus",true,loader);
            Object json=Class.forName("net.dean.jraw.util.JrawUtils",true,loader).getMethod("fromString",String.class).invoke(null,saved);
            Object data=Class.forName("net.dean.jraw.http.oauth.OAuthData",true,loader).getConstructor(method,node).newInstance(enumValue(method,"APP"),json);
            Object helper=client.getClass().getMethod("getOAuthHelper").invoke(client);
            helper.getClass().getMethod("setRefreshToken",String.class).invoke(helper,refresh);
            java.lang.reflect.Field authorized=helper.getClass().getDeclaredField("authStatus");
            authorized.setAccessible(true);
            authorized.set(helper,enumValue(status,"AUTHORIZED"));
            java.lang.reflect.Field username=Class.forName("net.dean.jraw.RedditClient",true,loader).getDeclaredField("authenticatedUser");
            username.setAccessible(true);
            RESTORING.set(true);
            try {
                client.getClass().getMethod("authenticate",data.getClass()).invoke(client,data);
            }finally{RESTORING.remove();}
            username.set(client,name);
            return true;
        }catch(ReflectiveOperationException | RuntimeException error){
            return false;
        }
    }
    @SuppressWarnings({"rawtypes","unchecked"})
    private static Object enumValue(Class<?> type,String name) {return Enum.valueOf((Class)type,name);}
    private static void renew(Object api) {
        new Thread(()->{
            try {api.getClass().getMethod("M").invoke(api);}
            catch(ReflectiveOperationException | RuntimeException ignored){ }
        },"ShikifyLogin").start();
    }
    /** authenticate() would fetch the account and hold up content; renew() does that afterwards. */
    public static boolean accountCheck(boolean allowed) {return allowed && !Boolean.TRUE.equals(RESTORING.get());}
    public static void clearAccount() {ACCOUNT.remove();}
    /** Login reads the account right after authenticate() already fetched it on this thread. */
    public static void keepAccount(Object account) {ACCOUNT.set(account);}
    public static Object takeAccount() {
        Object account=ACCOUNT.get();
        ACCOUNT.remove();
        return account;
    }
    /**
     * Every Boost task shares AsyncTask's one-at-a-time queue, so a feed waits behind unrelated
     * work. Content loaders run in parallel; everything else keeps its original order.
     */
    @SuppressWarnings({"rawtypes","unchecked"})
    public static android.os.AsyncTask execute(android.os.AsyncTask task,Object[] parameters) {
        if(parallel)for(Class<?> type=task.getClass();type!=null && type!=android.os.AsyncTask.class;type=type.getSuperclass())
            if(CONTENT.contains(type.getName()))return task.executeOnExecutor(android.os.AsyncTask.THREAD_POOL_EXECUTOR,parameters);
        return task.execute(parameters);
    }
    public static boolean online(Context context) {
        try {
            ConnectivityManager manager=(ConnectivityManager)context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if(!reachable){android.net.NetworkInfo active=manager.getActiveNetworkInfo();return active!=null && active.isConnected();}
            for(Network network:manager.getAllNetworks()){
                NetworkCapabilities capabilities=manager.getNetworkCapabilities(network);
                if(capabilities!=null && capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET))return true;
            }
            return false;
        }catch(RuntimeException error){return true;}
    }
}
