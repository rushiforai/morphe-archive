import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Auto-claim Drops on ART with the real Twitch classes. No account exists, so Twitch's drops notification can't
 * be shown in the app; this hands the injection point real drop presentations instead and checks:
 *
 * <ul>
 *   <li>off: nothing is claimed;</li>
 *   <li>on: a claimable drop goes to Twitch's own Claim handler (the notification presenter's view-event lambda
 *   with the Claim event), which updates its drop state and calls Twitch's GraphQL client with the claim
 *   mutation. The client here is absent, so that call fails right where the request would start: the failure
 *   comes from the client's request method, which proves the handler got there;</li>
 *   <li>the same drop isn't claimed twice, another one is, and a presentation without a claimable drop isn't.</li>
 * </ul>
 *
 * The request itself, its account headers and the server's answer are not exercised.
 */
public final class DropsArtProbe {
    private static final Map<String, Object> settings = new HashMap<>();
    private static final String DROPS = "io.github.jordanwoodson.extension.shared.twitch.TwitchDrops";
    private static Object unsafe;
    private static int failures;

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static void install() throws Exception {
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
            SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
            (proxy, method, values) -> {
                Object value = settings.getOrDefault((String) values[0], values[1]);
                if (method.getName().equals("getBoolean") || method.getName().equals("getString")) return value;
                throw new UnsupportedOperationException(method.getName());
            });
        Context context = new ContextWrapper(null) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) { return preferences; }
        };
        Field field = Class.forName("io.github.jordanwoodson.extension.shared.settings.Settings").getDeclaredField("context");
        field.setAccessible(true);
        field.set(null, context);
        Field theUnsafe = Class.forName("sun.misc.Unsafe").getDeclaredField("theUnsafe");
        theUnsafe.setAccessible(true);
        unsafe = theUnsafe.get(null);
    }

    private static Object allocate(Class<?> type) throws Exception {
        return unsafe.getClass().getMethod("allocateInstance", Class.class).invoke(unsafe, type);
    }

    private static List<Field> instanceFields(Class<?> type) {
        List<Field> out = new ArrayList<>();
        for (Field field : type.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            field.setAccessible(true);
            out.add(field);
        }
        return out;
    }

    private static Object staticField(String name) throws Exception {
        Field field = Class.forName(DROPS).getDeclaredField(name);
        field.setAccessible(true);
        return field.get(null);
    }

    private static Class<?> presentation;
    private static Constructor<?> presentationInit;
    private static Constructor<?> claimableInit;
    private static Object presenter;
    private static Class<?> client;

    private static void setUp() throws Exception {
        presenter = allocate(Class.forName(ProbeLocators.type("twitch.match.drops_notification_presenter", "caf")));
        Class<?> claimable = Class.forName(ProbeLocators.type("twitch.match.claimable_drop", "z6f"));
        for (Constructor<?> constructor : claimable.getDeclaredConstructors()) {
            Class<?>[] types = constructor.getParameterTypes();
            if (types.length == 5 && types[0] == long.class && types[2] == String.class) claimableInit = constructor;
        }
        presentation = Class.forName(ProbeLocators.type("twitch.match.drop_presentation", "o7f"));
        presentationInit = presentation.getDeclaredConstructors()[0];
        check(presentationInit.getParameterTypes().length == 2, "Unexpected drop presentation");
        // The presenter's drops repository: its state subject (Twitch pushes the claiming state there first) and
        // its claim service, whose API holds the GraphQL client, absent here.
        Field repository = null;
        Class<?> repositoryType = null;
        for (Field field : instanceFields(presenter.getClass())) {
            if (isRepository(field.getType())) {
                repository = field;
                repositoryType = field.getType();
            }
        }
        if (repository == null) {
            // R8 merged the presenter with others into a class whose fields are Objects (32.1.0): the repository is
            // the constructor parameter of that shape, kept in field n (Twitch 32.1.0's R8 name).
            for (Constructor<?> constructor : presenter.getClass().getDeclaredConstructors()) {
                for (Class<?> type : constructor.getParameterTypes()) if (isRepository(type)) repositoryType = type;
            }
            repository = presenter.getClass().getDeclaredField("n");
            repository.setAccessible(true);
        }
        check(repositoryType != null, "No drops repository in the presenter");
        Object drops = allocate(repositoryType);
        repository.set(presenter, drops);
        for (Field field : instanceFields(drops.getClass())) {
            if (field.getType().getName().startsWith("io.reactivex.subjects.")) {
                field.set(drops, field.getType().getConstructor().newInstance());
                continue;
            }
            Field api = claimService(field.getType());
            if (api == null) continue;
            // The service and its API (the class holding the GraphQL client), the client left out.
            Object serviceObject = allocate(field.getType());
            api.set(serviceObject, allocate(api.getType()));
            field.set(drops, serviceObject);
            client = instanceFields(api.getType()).get(0).getType();
        }
        check(client != null, "No claim service in the drops repository");
    }

    /** The drops repository shape: a state subject (Twitch pushes the claiming state there first) and a claim service. */
    private static boolean isRepository(Class<?> type) {
        if (type.isInterface() || type.isPrimitive() || type.getName().startsWith("java.")) return false;
        boolean subject = false;
        boolean service = false;
        for (Field inner : instanceFields(type)) {
            if (inner.getType().getName().startsWith("io.reactivex.subjects.")) subject = true;
            if (claimService(inner.getType()) != null) service = true;
        }
        return subject && service;
    }

    /**
     * The claim service shape: a class with one field, an API class whose one field is the GraphQL client (a
     * class). Returns the service's API field, or null.
     */
    private static Field claimService(Class<?> type) {
        if (type.isInterface() || type.isPrimitive() || type.getName().startsWith("java.")) return null;
        List<Field> service = instanceFields(type);
        if (service.size() != 1) return null;
        Class<?> api = service.get(0).getType();
        if (api.isInterface() || api.isPrimitive() || api.getName().startsWith("java.")) return null;
        List<Field> client = instanceFields(api);
        if (client.size() != 1 || client.get(0).getType().isInterface() || client.get(0).getType().isPrimitive()) return null;
        return service.get(0);
    }

    private static Object drop(String instance) throws Exception {
        Object claimable = claimableInit.newInstance(System.currentTimeMillis() + 60_000, System.currentTimeMillis(),
            "object-" + instance, instance, "campaign");
        return presentationInit.newInstance(claimable, allocate(presentationInit.getParameterTypes()[1]));
    }

    private static void present(Object drop) throws Exception {
        Class.forName(DROPS).getMethod("presented", Object.class, Object.class).invoke(null, presenter, drop);
    }

    private static int claims() throws Exception {
        return (Integer) staticField("claims");
    }

    private static void autoClaim() throws Exception {
        setUp();
        Method instanceId = Class.forName(DROPS).getDeclaredMethod("dropInstanceId", Object.class);
        instanceId.setAccessible(true);
        Object first = drop("drop-1");
        // The presentation's drop (its getter is inlined since 32.1.0, so the field).
        Field change = null;
        for (Field field : instanceFields(presentation)) {
            if (field.getType() == claimableInit.getDeclaringClass().getSuperclass()) change = field;
        }
        check(change != null, "The drop presentation has no drop");
        check("drop-1".equals(instanceId.invoke(null, change.get(first))), "The bridge must read the drop instance ID");

        settings.put("drops_auto_claim", false);
        present(first);
        check(claims() == 0, "Off must claim nothing");

        settings.put("drops_auto_claim", true);
        present(first);
        check(claims() == 1, "On must claim a claimable drop");
        Throwable failure = (Throwable) staticField("lastFailure");
        check(failure instanceof NullPointerException, "Twitch's handler should stop at the absent client, got " + failure);
        StackTraceElement top = failure.getStackTrace()[0];
        check(top.getClassName().equals(client.getName()),
            "The handler must reach the GraphQL client's request (" + client.getName() + "), stopped in " + top);
        boolean handler = false;
        for (StackTraceElement frame : failure.getStackTrace()) {
            if (frame.getClassName().equals(ProbeLocators.type("twitch.auto_claim_drops.handler", "z2e"))) handler = true;
        }
        check(handler, "The claim must go through the notification's own Claim handler");
        System.out.println("     reached " + top);

        present(first);
        check(claims() == 1, "The same drop must not be claimed twice");
        present(drop("drop-2"));
        check(claims() == 2, "Another drop must be claimed");
        present(presentationInit.newInstance(null, allocate(presentationInit.getParameterTypes()[1])));
        check(claims() == 2, "A presentation without a claimable drop must not be claimed");
    }

    public static void main(String[] args) throws Exception {
        ProbeLocators.load(args[0]);
        System.out.println(ProbeLocators.loaded() ? "names from the APK's locators" : "no locators in the APK: 31.7.0 names");
        install();
        try {
            autoClaim();
            System.out.println("ok   auto-claim drops: off, on, once per drop, only claimable drops");
        } catch (Throwable failure) {
            Throwable cause = failure instanceof InvocationTargetException ? failure.getCause() : failure;
            System.out.println("FAIL auto-claim drops: " + cause);
            if (cause != null) cause.printStackTrace(System.out);
            failures++;
        }
        if (failures > 0) {
            System.out.println("FAILED");
            System.exit(1);
        }
        System.out.println("PASS: Twitch's drops Claim handler is pressed for claimable drops only, once each");
    }
}
