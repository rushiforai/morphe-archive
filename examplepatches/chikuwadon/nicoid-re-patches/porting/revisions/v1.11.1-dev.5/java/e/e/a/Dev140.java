package e.e.a;

import android.app.Activity;
import android.app.Service;
import android.content.Intent;
import android.util.Log;
import java.lang.reflect.Field;
import java.util.UUID;
import java.util.WeakHashMap;

/** A notification's Activity is the destination of the existing decoder handoff. */
public final class Dev140 {
    private static final String NOTIFICATION = "nicoid_notification_return_140";
    private static final String RETURN = "nicoid_popup_return_244";
    private static final String POPUP = "com.sauzask.nicoid.NicoidPopupViewService";
    private static final WeakHashMap<Object, String> TICKETS = new WeakHashMap<>();

    private static final ThreadLocal<Intent> DESTINATION = new ThreadLocal<>();

    private Dev140() {}

    public static boolean isNotificationDispatch() {
        return DESTINATION.get() != null;
    }


    private static Object field(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(owner);
    }

    private static synchronized String ticket(Object state, boolean create) {
        String ticket = TICKETS.get(state);
        if (ticket == null && create) {
            ticket = UUID.randomUUID().toString();
            TICKETS.put(state, ticket);
        }
        return ticket;
    }

    public static void markNotification(Object state, Intent intent) {
        try {
            Object owner = field(state, "owner");
            if (owner instanceof Service && POPUP.equals(owner.getClass().getName())) {
                intent.putExtra(NOTIFICATION, ticket(state, true));
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_ANIMATION);
            }
        } catch (Exception failure) {
            Log.w("nicoid-return", "Cannot mark media notification return", failure);
        }
    }

    public static boolean prepare(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent == null) return true;
        if (!intent.hasExtra(NOTIFICATION)) {
            if (!intent.hasExtra(RETURN) || matches(activity)) return true;
            activity.finish();
            return false;
        }
        try {
            String requested = intent.getStringExtra(NOTIFICATION);
            Field active = Class.forName("e.e.a.MediaControls").getDeclaredField("active");
            active.setAccessible(true);
            Object state = active.get(null);
            if (state != null && requested != null && requested.equals(ticket(state, false))) {
                Object owner = field(state, "owner");
                DESTINATION.set(intent);
                try {
                    if (Dev115.seamlessReturn(owner) && intent.hasExtra(RETURN)) {
                        Dev111.notificationReturnOpened();
                        return true;
                    }
                } finally {
                    DESTINATION.remove();
                }
            }
        } catch (Exception failure) {
            Log.w("nicoid-return", "Notification return could not be attached", failure);
        }
        activity.finish();
        return false;
    }

    private static boolean matches(Activity activity) {
        try {
            java.lang.reflect.Method method = Class.forName("e.e.a.PopupReturn244")
                    .getDeclaredMethod("matches", Activity.class);
            method.setAccessible(true);
            return Boolean.TRUE.equals(method.invoke(null, activity));
        } catch (Exception failure) {
            return false;
        }
    }

    public static boolean consumeLaunch(Service service, Intent prepared) {
        if (!prepared.hasExtra(RETURN)) return false;
        try {
            Dev139.remember(field(service, "e"));
        } catch (Exception failure) {
            Log.d("nicoid-return", "No output snapshot before return");
        }
        Intent destination = DESTINATION.get();
        if (destination == null) return false;
        destination.replaceExtras(prepared);
        destination.setData(prepared.getData());
        return true;
    }

    /** The existing return completes before restoring the portrait layout. */
    public static void retireReturnToken(Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        Intent intent = activity.getIntent();
        if (intent != null && intent.hasExtra(RETURN) && !matches(activity)) {
            intent.removeExtra(RETURN);
        }
    }

    /** A retained-return Activity must never fall through to a fresh load. */
    public static boolean abortFailedReturn(Object fragment) {
        try {
            Activity activity = (Activity) field(fragment, "A1");
            if (activity == null || !activity.getIntent().hasExtra(RETURN)) return false;
            return activity.isFinishing() || Dev111.cancelPendingReturn(activity);
        } catch (Exception failure) {
            Log.w("nicoid-return", "Could not close failed retained-return screen", failure);
            return false;
        }
    }

}
