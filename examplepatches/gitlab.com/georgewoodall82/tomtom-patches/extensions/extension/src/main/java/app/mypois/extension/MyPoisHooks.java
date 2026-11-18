package app.mypois.extension;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

/**
 * Entry points called from the code injected by the patch.
 * <p>
 * Every method here must never throw: a failure in "My POIs" must not take the navigation app down.
 * TomTom's location classes are obfuscated, so they are only touched through reflection
 * on names that are stable in the supported app version (3.6.326).
 */
@SuppressWarnings({"unused", "WeakerAccess"})
public final class MyPoisHooks {

    private static final String TAG = "MyPois";

    /** Directive id for the extra button; any value not used by the app's own directives. */
    private static final int DIRECTIVE_ID = 0x4d500001;
    /** The app's own "Add to My Places" button (R.id.navui_directive_add_to_my_places_id). */
    private static final int ADD_TO_MY_PLACES_DIRECTIVE_ID = 0x7f0b061c;
    /** Theme attribute "navui_mapContextPopupAddToMyPlacesIcon". */
    private static final int ATTR_ADD_TO_MY_PLACES_ICON = 0x7f040eb7;

    private MyPoisHooks() {
    }

    static Context appContext() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Application app = (Application) activityThread.getMethod("currentApplication").invoke(null);
            return app;
        } catch (Throwable t) {
            return null;
        }
    }

    // ---- Hook 0: the "My POIs" settings menu entry ------------------------------------------

    /**
     * Called first thing in the app's "LaunchExternal" menu action (hc.G.u). That action expects an
     * Android intent URI and crashes on anything else, so the menu entry uses a plain marker link and
     * this hook opens the My POIs screen itself.
     *
     * @param action the action object; its field {@code b} holds the action URI
     * @return true if the action was handled here
     */
    public static boolean interceptLaunchExternal(Object action) {
        try {
            Object uri = readField(action, "b");
            if (uri == null || !uri.toString().toLowerCase(java.util.Locale.ROOT).contains("mypois")) return false;

            Context context = appContext();
            if (context == null) return false;
            context.startActivity(new Intent(context, MyPoisActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "interceptLaunchExternal failed", t);
            return false;
        }
    }

    // ---- Hook 1: My Places list loaded (read-only copy for the "add from My Places" picker) --

    /**
     * Called with the list of locations TomTom just loaded for the My Places screen.
     * Only copies name and coordinates; the list is released by the app right after this returns.
     */
    public static void onMyPlaces(List<?> locations) {
        try {
            Context context = appContext();
            if (context == null || locations == null) return;

            List<PoiStore.Place> favourites = new ArrayList<>();
            for (Object location : locations) {
                if (location == null) continue;
                // Folder "/" is the top level of My Places; Home, Work and Recent live in other folders.
                Object folder = call(location, "c4");
                if (!"/".equals(folder)) continue;
                Object name = call(location, "getName");
                Object coordinate = call(location, "getCoordinate");
                if (!(name instanceof String) || coordinate == null) continue;
                Object lat = call(coordinate, "getLatitudeInDegrees");
                Object lon = call(coordinate, "getLongitudeInDegrees");
                if (!(lat instanceof Double) || !(lon instanceof Double)) continue;
                favourites.add(new PoiStore.Place((String) name, (Double) lat, (Double) lon));
            }
            // The same callback also serves sub-folders (e.g. Recent); don't wipe the copy for those.
            if (!favourites.isEmpty()) {
                PoiStore.saveMyPlacesCache(context, favourites);
            }
        } catch (Throwable t) {
            Log.w(TAG, "onMyPlaces failed", t);
        }
    }

    // ---- Hook 2: "Add to My POIs" button on the location preview screen ----------------------

    /**
     * Builds the click handler for the extra button. The handler type is TomTom's obfuscated
     * interface {@code x6.c}, so it is created as a dynamic proxy.
     *
     * @param screen the screen the button was added to (location preview or home screen)
     * @return the handler, or null if it could not be built (the patch then skips the button)
     */
    public static Object createAddHandler(final Object screen) {
        try {
            Class<?> handlerInterface = Class.forName("x6.c", false, screen.getClass().getClassLoader());
            return Proxy.newProxyInstance(handlerInterface.getClassLoader(), new Class<?>[]{handlerInterface},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) {
                            if (method.getDeclaringClass() == Object.class) {
                                switch (method.getName()) {
                                    case "equals":
                                        return proxy == args[0];
                                    case "hashCode":
                                        return System.identityHashCode(proxy);
                                    default:
                                        return "MyPoisAddHandler";
                                }
                            }
                            Log.i(TAG, "Add to My POIs pressed");
                            onAddClicked(screen);
                            return null;
                        }
                    });
        } catch (Throwable t) {
            Log.w(TAG, "createAddHandler failed", t);
            return null;
        }
    }

    private static volatile Object pendingBar;

    /** Called at the start of the preview screen's directive setup; remembers the directive bar. */
    public static void beginDirectives(Object screen, Object bar) {
        pendingBar = bar;
        Log.i(TAG, "directives requested by " + screen.getClass().getName());
    }

    /**
     * Called at the end of the preview screen's directive setup: adds an "Add to My POIs" button
     * next to the screen's other actions, built the same way the screen builds its own.
     * Uses TomTom's obfuscated {@code x6.b} (directive bar) and {@code yc.d} (directive) via reflection.
     */
    public static void addDirective(Object screen) {
        try {
            Object bar = pendingBar;
            pendingBar = null;
            if (bar == null) return;
            Object handler = createAddHandler(screen);
            if (handler == null) return;

            ClassLoader loader = screen.getClass().getClassLoader();
            Class<?> barType = Class.forName("x6.b", false, loader);
            Class<?> directiveType = Class.forName("yc.d", false, loader);

            Object directive = barType.getMethod("E", int.class, int.class).invoke(bar, 1, DIRECTIVE_ID);
            if (directive == null) return;

            // Copy the settings of the screen's own "Add to My Places" button (icon, which screens and
            // situations it is shown in, priority), so the new button appears wherever that one does.
            Object template = barType.getMethod("P", int.class).invoke(bar, ADD_TO_MY_PLACES_DIRECTIVE_ID);
            if (template != null) {
                for (Field field : directiveType.getFields()) {
                    int modifiers = field.getModifiers();
                    String name = field.getName();
                    if (java.lang.reflect.Modifier.isFinal(modifiers) || java.lang.reflect.Modifier.isStatic(modifiers)) continue;
                    // c, d, e are the label texts; q and r are the click actions; v is the owning screen.
                    if (name.equals("c") || name.equals("d") || name.equals("e")
                            || name.equals("q") || name.equals("r") || name.equals("v")) continue;
                    field.set(directive, field.get(template));
                }
            } else {
                Log.w(TAG, "No Add to My Places button to copy settings from");
                Context themed = (Context) readField(screen, "z1");
                if (themed != null) {
                    Object icon = Class.forName("Jg.r1", false, loader)
                            .getMethod("g", Context.class, int.class).invoke(null, themed, ATTR_ADD_TO_MY_PLACES_ICON);
                    directiveType.getField("f").setInt(directive, (Integer) icon);
                }
            }
            directiveType.getMethod("a0", String.class).invoke(directive, "Add to My POIs");
            directiveType.getField("r").set(directive, handler);
            Log.i(TAG, "Added the Add to My POIs button to " + screen.getClass().getName());
        } catch (Throwable t) {
            Log.w(TAG, "addDirective failed", t);
        }
    }

    /**
     * The place the screen is about. The location preview screen keeps it in field {@code g2}; the
     * home screen's map popup keeps it in the shared helper {@code I1} -> {@code Y} -> {@code c()}.
     */
    private static Object selectedLocation(Object screen) {
        // Field names are reused across TomTom's obfuscated classes (the home screen has its own,
        // unrelated "g2"), so every candidate is checked to really be a location.
        Object location = readField(screen, "g2");
        if (isLocation(location)) return location;

        Object helper = readField(screen, "I1");
        Object popup = helper == null ? null : readField(helper, "Y");
        location = popup == null ? null : call(popup, "c");
        return isLocation(location) ? location : null;
    }

    private static boolean isLocation(Object candidate) {
        return candidate != null && call(candidate, "getCoordinate") != null;
    }

    /** Reads a field by name from the object's class or any superclass. */
    private static Object readField(Object target, String name) {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
                // keep walking up
            } catch (Throwable t) {
                return null;
            }
        }
        return null;
    }

    private static void onAddClicked(Object screen) {
        Context context = appContext();
        try {
            if (context == null) return;

            Object location = selectedLocation(screen);
            if (location == null) {
                Log.w(TAG, "No selected location on " + screen.getClass().getName());
                toast(context, "My POIs: couldn't read the selected place");
                return;
            }

            Object name = call(location, "getName");
            Object coordinate = call(location, "getCoordinate");
            Object lat = call(coordinate, "getLatitudeInDegrees");
            Object lon = call(coordinate, "getLongitudeInDegrees");
            if (!(lat instanceof Double) || !(lon instanceof Double)) {
                Log.w(TAG, "Unreadable coordinate " + coordinate);
                toast(context, "My POIs: couldn't read the place's position");
                return;
            }

            Intent intent = new Intent(context, MyPoisActivity.class)
                    .setAction(MyPoisActivity.ACTION_ADD)
                    .putExtra(MyPoisActivity.EXTRA_NAME, name instanceof String ? (String) name : "")
                    .putExtra(MyPoisActivity.EXTRA_LAT, (Double) lat)
                    .putExtra(MyPoisActivity.EXTRA_LON, (Double) lon)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable t) {
            Log.w(TAG, "onAddClicked failed", t);
            if (context != null) toast(context, "My POIs: " + t);
        }
    }

    private static void toast(Context context, String text) {
        try {
            android.widget.Toast.makeText(context, text, android.widget.Toast.LENGTH_LONG).show();
        } catch (Throwable ignored) {
            // Not on a thread with a looper; the log line is enough.
        }
    }

    // ---- Helpers ------------------------------------------------------------------------------

    /** Calls a public no-argument method by name; returns null on any failure. */
    private static Object call(Object target, String methodName) {
        try {
            Method method = target.getClass().getMethod(methodName);
            method.setAccessible(true);
            return method.invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }
}
