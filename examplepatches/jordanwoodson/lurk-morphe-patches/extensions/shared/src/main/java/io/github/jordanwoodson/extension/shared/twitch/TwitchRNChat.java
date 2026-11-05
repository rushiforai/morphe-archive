package io.github.jordanwoodson.extension.shared.twitch;

import android.content.res.AssetManager;
import io.github.jordanwoodson.extension.shared.CompiledBundle;
import io.github.jordanwoodson.extension.shared.ChatFilter;
import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;
import java.nio.charset.StandardCharsets;
import org.json.JSONObject;
import org.json.JSONArray;
import java.util.Map;
import java.util.HashMap;
import java.util.WeakHashMap;
import java.util.function.BooleanSupplier;

/** Data-only RN bridge. JSON inputs and results are bounded; provider snapshots never perform network IO. */
public final class TwitchRNChat {
    private static final String ASSET = "lurk-twitch-chat";
    private static final String[] KEYS = {"chat_timestamps", "chat_show_deleted", "chat_keywords", "chat_appearance",
        "emotes_7tv", "emotes_bttv", "emotes_ffz", "badges_ffz", "badges_chatterino", "badges_pronouns", "badges_7tv"};
    private static Object previousLists;
    private static String previousConfig;
    private static int[] previousValues;
    private static int revision;
    private static boolean lifecycle;
    private static final Map<Object,Scope> OWNERS = new WeakHashMap<>();
    private static final class Interest implements BooleanSupplier {
        volatile int count;
        @Override public boolean getAsBoolean() { return count > 0; }
    }
    private static final class Scope {
        final Map<String,Lease> rows = new HashMap<>();
        final Map<String,String> streams = new HashMap<>();
        final Map<String,Interest> rooms = new HashMap<>(), users = new HashMap<>();
        final Interest all = new Interest();
    }
    private static final class Lease {
        final String room,user,userId;
        final Interest roomInterest,userInterest;
        Lease(String room,String user,String userId,Interest roomInterest,Interest userInterest) {
            this.room=room;this.user=user;this.userId=userId;this.roomInterest=roomInterest;this.userInterest=userInterest;
        }
    }
    private TwitchRNChat() { }

    private static boolean on(String key) { return Settings.isRegistered(key) && Settings.isEnabled(key); }
    public static void afterMain(Object instance, AssetManager assets, String sourceUrl) {
        if (!"assets://index.android.bundle".equals(sourceUrl)) return;
        boolean enabled = false;
        for (String key : KEYS) enabled |= on(key);
        if (!enabled || !CompiledBundle.load(instance, assets, ASSET, 98)) return;
        invalidateOnResume();
        try {
            CompiledBundle.call(ASSET, "LurkTwitchChat", "configure",
                new String(CompiledBundle.read(assets, ASSET + "-contract.json", 8192), StandardCharsets.UTF_8));
        } catch (Exception e) { Logger.d("Twitch chat: missing compiled contract"); }
    }
    public static void afterFile(Object instance, String sourceUrl) {
        try {
            Object context = instance.getClass().getMethod("access$getContext$p", instance.getClass()).invoke(null, instance);
            afterMain(instance, ((android.content.Context)context).getAssets(), sourceUrl);
        } catch (Exception e) { Logger.d("Twitch chat: file context unavailable"); }
    }

    /** Called by the existing, synchronously registered feed-settings module, with its own lifetime. */
    public static synchronized String exchange(Object owner, String raw) {
        if (owner == null || raw == null || raw.length() > 20000) return "{}";
        try {
            JSONObject request = new JSONObject(raw);
            switch (request.optString("op")) {
                case "config": return config();
                case "revision": return providerRevision(owner);
                case "watch": return watch(owner,request);
                case "unwatch": {
                    Scope scope=OWNERS.get(owner);
                    if(scope!=null)scope.streams.remove(request.optString("id"));
                    return "{}";
                }
                case "live": live(owner,request); return "{}";
                case "acquire": return acquire(owner,request);
                case "release": release(owner,request.optString("id")); return "{\"active\":false}";
                case "catalog": return catalog(owner,request);
                case "verdict": {
                    String user = request.optString("user"), body = request.optString("body");
                    int verdict = on("chat_keywords") && user.length() <= 100 && body.length() <= 10000
                        ? TwitchChatKeywords.classify(user,body) : 0;
                    return new JSONObject().put("verdict",verdict).toString();
                }
                default: return "{}";
            }
        } catch (Exception e) { return "{}"; }
    }

    private static String watch(Object owner,JSONObject request) {
        String id=request.optString("id"),room=request.optString("channel");
        // Store identity is the original channel login, distinct from numeric provider room IDs.
        if(id.isEmpty() || id.length()>64 || !room.matches("[a-zA-Z0-9_]{1,25}"))return "{}";
        Scope scope=OWNERS.computeIfAbsent(owner,key->new Scope());
        if(!scope.streams.containsKey(id) && scope.streams.size()>=16)return "{}";
        scope.streams.put(id,room);
        return "{\"active\":true}";
    }

    /** Only a committed store's new live-line handler calls this; histories and renders never do. */
    private static void live(Object owner,JSONObject request) {
        Scope scope=OWNERS.get(owner);
        String room=request.optString("channel"),id=request.optString("messageId");
        String user=request.optString("user"),body=request.optString("body");
        if(scope==null || !room.equals(scope.streams.get(request.optString("id"))) ||
            !on("chat_keywords") || !on("chat_highlight_vibrate") || id.isEmpty() || id.length()>256 ||
            user.length()>100 || body.length()>10000)return;
        if(TwitchChatKeywords.classify(user,body)==ChatFilter.HIGHLIGHT &&
            !user.equalsIgnoreCase(TwitchChatKeywords.lists().self)) {
            ChatFilter.vibrate(TwitchContext.application(),id);
        }
    }

    private static String acquire(Object owner,JSONObject request) throws Exception {
        String id=request.optString("id"),room=request.optString("channel"),user=request.optString("user").toLowerCase(java.util.Locale.ROOT);
        String userId=request.optString("userId");
        if (id.isEmpty() || id.length()>64 || !room.matches("[0-9]{1,12}") || !user.matches("[a-z0-9_]{1,25}")) return "{}";
        Scope scope=OWNERS.get(owner);
        if (scope==null) { scope=new Scope();OWNERS.put(owner,scope); }
        Lease current=scope.rows.get(id);
        if (current!=null && current.room.equals(room) && current.user.equals(user) && current.userId.equals(userId)) return "{\"active\":true}";
        release(owner,id);
        if (scope.rows.size()>=1000 || (!scope.rooms.containsKey(room) && scope.rooms.size()>=16)) return "{}";
        Interest roomInterest=scope.rooms.computeIfAbsent(room,key->new Interest());
        Interest userInterest=scope.users.computeIfAbsent(user,key->new Interest());
        roomInterest.count++;userInterest.count++;scope.all.count++;
        scope.rows.put(id,new Lease(room,user,userId,roomInterest,userInterest));
        TwitchEmotes.requestRn(room,roomInterest);
        TwitchBadges.requestRn(scope.all);
        TwitchSevenTvBadges.requestRn(room,roomInterest);
        TwitchPronouns.requestRn(user,userInterest);
        return "{\"active\":true}";
    }

    private static void release(Object owner,String id) {
        Scope scope=OWNERS.get(owner);if(scope==null)return;
        Lease lease=scope.rows.remove(id);if(lease==null)return;
        if (--lease.roomInterest.count==0) scope.rooms.remove(lease.room);
        if (--lease.userInterest.count==0) scope.users.remove(lease.user);
        scope.all.count--;
    }

    /** Native module invalidation retires pending requests even when React effects cannot run. */
    public static synchronized void dispose(Object owner) {
        Scope scope=OWNERS.remove(owner);if(scope==null)return;
        scope.all.count=0;
        for(Interest interest:scope.rooms.values())interest.count=0;
        for(Interest interest:scope.users.values())interest.count=0;
        scope.rows.clear();scope.rooms.clear();scope.users.clear();scope.streams.clear();
    }

    /** One small cache-only token per runtime, independent of the number of visible rows. */
    private static String providerRevision(Object owner) throws Exception {
        Scope scope=OWNERS.get(owner);int enabled=0;
        for(int i=4;i<KEYS.length;i++)if(on(KEYS[i]))enabled|=1<<(i-4);
        boolean active=enabled!=0 && scope!=null && !scope.rows.isEmpty();
        return new JSONObject().put("active",active).put("token",
            enabled+":"+TwitchEmotes.rnRevision()+":"+TwitchThirdParty.catalogRevision()).toString();
    }

    private static String catalog(Object owner,JSONObject request) throws Exception {
        Scope scope=OWNERS.get(owner);Lease lease=scope==null?null:scope.rows.get(request.optString("id"));
        if(lease==null)return "{}";
        JSONObject out=new JSONObject();int generation=TwitchEmotes.rnRevision();
        out.put("id",request.optString("id")).put("channel",lease.room).put("user",lease.user).put("userId",lease.userId);
        out.put("generation",generation);
        if(request.optInt("generation",-1)!=generation) {
            JSONObject emotes=new JSONObject();int count=0;
            for(Map.Entry<String,String> entry:TwitchEmotes.cachedRn(lease.room).entrySet()) {
                if(count++>=2000)break;
                emotes.put(entry.getKey(),entry.getValue());
            }
            out.put("emotes",emotes);
        }
        JSONArray badges=new JSONArray();
        for(String[] badge:TwitchBadges.cachedRn(lease.userId))badges.put(new JSONObject().put("title",badge[0]).put("url",badge[1]));
        if(on("badges_pronouns")) {
            String[] pronoun=TwitchPronouns.cachedRn(lease.user);
            if(pronoun!=null)badges.put(new JSONObject().put("title",pronoun[0]).put("url",pronoun[1]));
        }
        out.put("badges",badges);
        return out.toString();
    }

    /**
     * The settings the compiled chat reads, as JSON with a revision that changes with any of them or the
     * keyword lists. The JSON is built only when a value changed; otherwise the last string is returned.
     */
    private static String config() throws Exception {
        boolean providers = false;
        for (int i=4;i<KEYS.length;i++) providers |= on(KEYS[i]);
        int[] values = {on("chat_timestamps") ? 1 : 0, Settings.getInt("chat_timestamp_format"),
            on("chat_show_deleted") ? 1 : 0, on("chat_keywords") ? 1 : 0, on("chat_highlight_vibrate") ? 1 : 0,
            on("chat_appearance") ? 1 : 0, Settings.getInt("chat_text_size"), Settings.getInt("chat_me_style"),
            on("chat_alternate_rows") ? 1 : 0, Settings.getInt("chat_landscape_width"),
            Settings.getInt("chat_landscape_opacity"), providers ? 1 : 0};
        Object lists = values[3] == 1 ? TwitchChatKeywords.lists() : null;
        if (previousConfig != null && java.util.Arrays.equals(values, previousValues) && lists == previousLists) {
            return previousConfig;
        }
        previousValues = values; previousLists = lists; revision++;
        previousConfig = new JSONObject().put("version",1)
            .put("timestamps",values[0] == 1).put("clock",values[1])
            .put("deleted",values[2] == 1).put("keywords",values[3] == 1).put("vibrate",values[4] == 1)
            .put("appearance",values[5] == 1).put("scale",values[6]).put("plain",values[7] == 1)
            .put("alternate",values[8] == 1).put("width",values[9]).put("opacity",values[10])
            .put("providers",providers).put("revision",revision).toString();
        return previousConfig;
    }

    /**
     * The compiled chat keeps its config until told it may have changed. Lurk settings is an activity of
     * its own, so any activity resuming (chat's, when the user comes back) invalidates it.
     */
    private static synchronized void invalidateOnResume() {
        if (lifecycle) return;
        android.content.Context context = Settings.appContext();
        if (!(context instanceof android.app.Application)) return;
        lifecycle = true;
        ((android.app.Application) context).registerActivityLifecycleCallbacks(new android.app.Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityResumed(android.app.Activity activity) {
                CompiledBundle.call(ASSET, "LurkTwitchChat", "invalidate", "{}");
            }
            @Override public void onActivityCreated(android.app.Activity activity, android.os.Bundle state) { }
            @Override public void onActivityStarted(android.app.Activity activity) { }
            @Override public void onActivityPaused(android.app.Activity activity) { }
            @Override public void onActivityStopped(android.app.Activity activity) { }
            @Override public void onActivitySaveInstanceState(android.app.Activity activity, android.os.Bundle state) { }
            @Override public void onActivityDestroyed(android.app.Activity activity) { }
        });
    }
}
