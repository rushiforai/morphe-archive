package nl.johninnl.musicprobe;

import android.app.Instrumentation;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Bundle;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/** Execute the emitted app hooks on ART without a music account or exported browser. */
public final class BrowseProbe extends Instrumentation {
    private Bundle arguments;
    private int checks;
    @Override public void onCreate(Bundle args) { super.onCreate(args); arguments = args; start(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            if ("ytm".equals(arguments.getString("app"))) ytm(); else myspoti();
            result.putString("result", "PASS " + checks + " actual-DEX browser checks");
            result.putString("scope", "Accountless hook execution. Signed-in content, playback and Manager installation require separate testing.");
            finish(-1, result);
        } catch (Throwable failure) {
            result.putString("result", "FAIL after " + checks + " checks: " + android.util.Log.getStackTraceString(failure));
            finish(1, result);
        }
    }
    private void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); checks++; }
    private static Object allocate(Class<?> type) throws Exception {
        Class<?> unsafe = Class.forName("sun.misc.Unsafe");
        Field instance = unsafe.getDeclaredField("theUnsafe"); instance.setAccessible(true);
        return unsafe.getMethod("allocateInstance", Class.class).invoke(instance.get(null), type);
    }
    private static String mediaId(Object item) throws Exception {
        for (Method method : item.getClass().getDeclaredMethods()) {
            if (method.getParameterTypes().length == 0 && method.getReturnType() == String.class && !method.getName().equals("toString")) {
                method.setAccessible(true); return (String) method.invoke(item);
            }
        }
        throw new AssertionError("No media-item ID accessor");
    }
    private void ytm() throws Exception {
        Context context = getTargetContext();
        ClassLoader loader = context.getClassLoader();
        Class<?> utils = loader.loadClass("app.morphe.extension.shared.Utils");
        Field stored = utils.getDeclaredField("context"); stored.setAccessible(true);
        final String resourcePackage = arguments.getString("resourcePackage", "app.morphe.android.apps.youtube.music");
        // Resources are byte-for-byte from the input APK; only the fixture manifest is renamed.
        stored.set(null, new ContextWrapper(context) {
            @Override public String getPackageName() { return resourcePackage; }
        });
        Class<?> request = loader.loadClass("app.morphe.extension.music.patches.AndroidAutoPatch$BrowseRequest");
        Class<?> captured = loader.loadClass("patches.ytmusic.GearslipLibrarySupport$Request");
        Class<?> adapter = loader.loadClass("app.morphe.extension.music.patches.AndroidAutoPatch");
        Method handler = adapter.getDeclaredMethod("handleBrowseRequest", request);
        final String host = "app.seb3thehacker.gearslip";
        List<?> root = browse(loader, request, captured, handler, host, host, true);
        check(root.size() == 2, "Home/Library root size");
        check(mediaId(root.get(0)).equals("morphe:gearslip:home"), "Home root ID");
        check(mediaId(root.get(1)).equals("morphe:gearslip:library"), "Library root ID");
        List<?> folders = browse(loader, request, captured, handler, host, "morphe:gearslip:library", true);
        Set<String> ids = new HashSet<>(); for (Object item : folders) ids.add(mediaId(item));
        check(folders.size() == 7, "Native library folder count");
        for (String id : new String[]{"PLAYLISTS", "SONGS", "ALBUMS", "ARTISTS", "LAST_PLAYED", "SUBSCRIPTIONS", "PODCASTS"})
            check(ids.contains("morphe-aa-library://collection/" + id), "Native folder " + id);
        browse(loader, request, captured, handler, "unrelated.client", host, false);
        browse(loader, request, captured, handler, "unrelated.client", "morphe:gearslip:library", false);
        browse(loader, request, captured, handler, host + ".spoof", host, false);
        CountDownLatch homeFinished = new CountDownLatch(1);
        Object home = Proxy.newProxyInstance(loader, new Class<?>[]{request, captured}, (object, method, args) -> {
            switch (method.getName()) {
                case "morphe_getCallerPackage": return host;
                case "patch_getRequestedMediaId": return "morphe:gearslip:home";
                case "patch_getBrowserConnection": return null;
                case "patch_deliverBrowseItems": homeFinished.countDown(); return null;
                default: throw new AssertionError(method.getName());
            }
        });
        check(Boolean.TRUE.equals(handler.invoke(null, home)), "Native Home loader starts");
        check(homeFinished.await(12, TimeUnit.SECONDS), "Native Home loader safely completes without an account");
        // Instantiate the actual request implementation and populate its captured RemoteUserInfo.
        Class<?> actual = loader.loadClass(arguments.getString("requestClass", "llc"));
        Method caller = actual.getDeclaredMethod("morphe_getCallerPackage");
        Object actualRequest = allocate(actual);
        check(caller.invoke(actualRequest) == null, "Absent captured browser stays absent");
        Class<?> info = loader.loadClass(arguments.getString("infoClass", "ccn"));
        Field infoField = null;
        for (Field field : actual.getDeclaredFields()) if (field.getType() == info) { check(infoField == null, "Unique browser field"); infoField = field; }
        if (infoField == null) throw new AssertionError("Captured browser field missing");
        infoField.setAccessible(true);
        infoField.set(actualRequest, info.getConstructor(String.class, int.class, int.class).newInstance(host, 123, context.getApplicationInfo().uid));
        check(host.equals(caller.invoke(actualRequest)), "Caller bridge reads actual RemoteUserInfo");
    }
    private List<?> browse(ClassLoader loader, Class<?> request, Class<?> captured, Method handler,
            String caller, String id, boolean handled) throws Exception {
        final List<?>[] delivered = new List<?>[1];
        Object proxy = Proxy.newProxyInstance(loader, new Class<?>[]{request, captured}, (object, method, args) -> {
            switch (method.getName()) {
                case "morphe_getCallerPackage": return caller;
                case "patch_getRequestedMediaId": return id;
                case "patch_getBrowserConnection": return null;
                case "patch_deliverBrowseItems": delivered[0] = (List<?>) args[0]; return null;
                default: throw new AssertionError(method.getName());
            }
        });
        check(Boolean.valueOf(handled).equals(handler.invoke(null, proxy)), "Routing " + caller + " / " + id);
        check((delivered[0] != null) == handled, "Delivery " + caller + " / " + id);
        return delivered[0];
    }
    private void myspoti() throws Exception {
        Context context = getTargetContext();
        Class<?> service = context.getClassLoader().loadClass("app.myspoti.host.android.PlaybackService");
        Object instance = allocate(service);
        Method attach = ContextWrapper.class.getDeclaredMethod("attachBaseContext", Context.class); attach.setAccessible(true); attach.invoke(instance, context);
        Method original = service.getDeclaredMethod("morpheOriginalBrowsePermission", String.class); original.setAccessible(true);
        Method policy = null, root = null;
        for (Method method : service.getDeclaredMethods()) {
            if (method.getReturnType() == boolean.class && Arrays.equals(method.getParameterTypes(), new Class<?>[]{String.class}) && !method.getName().equals(original.getName())) policy = method;
            if (Arrays.equals(method.getParameterTypes(), new Class<?>[]{int.class, String.class}) && !method.getReturnType().isPrimitive()) root = method;
        }
        if (policy == null || root == null) throw new AssertionError("Browser methods missing");
        policy.setAccessible(true); root.setAccessible(true);
        String host = "app.seb3thehacker.gearslip";
        check(Boolean.TRUE.equals(policy.invoke(instance, host)), "Configured Gearslip capability");
        for (String client : new String[]{"unrelated.client", host + ".spoof", context.getPackageName(), "com.android.systemui"})
            check(Objects.equals(policy.invoke(instance, client), original.invoke(instance, client)), "Original client policy: " + client);
        check(root.invoke(instance, context.getApplicationInfo().uid, host) == null, "Forged package under another UID rejected");
    }
}
