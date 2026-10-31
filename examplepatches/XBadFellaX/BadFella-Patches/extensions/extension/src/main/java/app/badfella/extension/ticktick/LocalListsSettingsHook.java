package app.badfella.extension.ticktick;

import android.content.Context;
import android.content.Intent;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.util.Log;

import app.badfella.extension.ticktick.locallists.AccountScope;

import java.lang.reflect.Method;

/**
 * Inserts one preference into the already-created More Settings screen. The
 * androidx preference classes in this APK keep their public class names but
 * PreferenceGroup.addPreference is obfuscated to a(Preference); that signature
 * was verified in the 8.2.4.0 DEX. The entry is added only after the stock
 * preferences exist and is skipped if it is already present.
 */
public final class LocalListsSettingsHook {
    public static final String ACTIVITY =
            "app.badfella.extension.ticktick.BadFellaSettingsActivity";
    private static final String KEY = "badfella_local_lists";
    private static final String LOG_TAG = "TickTickPatch";

    private LocalListsSettingsHook() {
    }

    public static void install(Object fragment) {
        if (fragment == null) return;
        try {
            Method getContext = fragment.getClass().getMethod("getContext");
            Context context = (Context) getContext.invoke(fragment);
            if (context == null) return;
            Method getScreen = fragment.getClass().getMethod("getPreferenceScreen");
            Object screen = getScreen.invoke(fragment);
            if (screen == null) return;

            try {
                Method find = fragment.getClass().getMethod("findPreference", CharSequence.class);
                if (find.invoke(fragment, KEY) != null) return;
            } catch (NoSuchMethodException ignored) {
                // Older layouts: no de-duplication lookup; adding once is still safe.
            }

            Class<?> preferenceClass = Class.forName("androidx.preference.Preference");
            Object preference = preferenceClass.getConstructor(Context.class).newInstance(context);
            preferenceClass.getMethod("setTitle", CharSequence.class)
                    .invoke(preference, "BadFella Settings");
            preferenceClass.getMethod("setSummary", CharSequence.class)
                    .invoke(preference, "Local lists and backups");
            preferenceClass.getMethod("setKey", String.class).invoke(preference, KEY);
            preferenceClass.getMethod("setPersistent", boolean.class).invoke(preference, false);
            preferenceClass.getMethod("setOrder", int.class).invoke(preference, 10000);
            // Reuse TickTick's card, padding and arrow instead of AndroidX's default row.
            Object template = fragment.getClass().getMethod("findPreference", CharSequence.class)
                    .invoke(fragment, "prefkey_custom_swipe");
            if (template == null) throw new IllegalStateException("Missing stock settings row");
            int layout = (Integer) preferenceClass.getMethod("getLayoutResource").invoke(template);
            preferenceClass.getMethod("setLayoutResource", int.class).invoke(preference, layout);
            Intent intent = new Intent();
            intent.setClassName(context.getPackageName(), ACTIVITY);
            preferenceClass.getMethod("setIntent", Intent.class).invoke(preference, intent);

            Method add;
            try {
                add = screen.getClass().getMethod("addPreference", preferenceClass);
            } catch (NoSuchMethodException obfuscated) {
                add = screen.getClass().getMethod("a", preferenceClass);
            }
            add.invoke(screen, preference);
        } catch (Throwable error) {
            // Keep the stock settings screen usable and reveal only the type.
            Log.w(LOG_TAG, "BadFella Settings entry unavailable: " + error.getClass().getSimpleName());
        }
    }

    /** The drawer's verified Add List entry. Project counts are read off the UI thread. */
    public static void openListCreator(Object fragment) {
        try {
            final Activity activity = (Activity) fragment.getClass().getMethod("getActivity")
                    .invoke(fragment);
            if (activity == null || activity.isFinishing()) return;
            new Thread(new Runnable() {
                @Override public void run() {
                    try {
                        final TickTickBridge bridge = TickTickBridge.create(activity);
                        final AccountScope account = bridge.accountScope();
                        final int count = bridge.cloudListCount(account);
                        activity.runOnUiThread(new Runnable() {
                            @Override public void run() {
                                if (activity.isFinishing() || activity.isDestroyed()) return;
                                try {
                                    bridge.verifyAccount(account);
                                    if (count < 10) {
                                        openCloudListCreator(activity);
                                        return;
                                    }
                                    new AlertDialog.Builder(activity)
                                            .setTitle("Create a local list")
                                            .setMessage("You have " + count + " TickTick lists. "
                                                    + "A local list lets you organize more tasks on this device. "
                                                    + "Task contents still sync in their real TickTick lists; "
                                                    + "local list names and assignments need a BadFella backup. "
                                                    + "Open local lists from Settings → General → BadFella Settings. "
                                                    + "Cloud list creation remains subject to your account's allowance.")
                                            .setPositiveButton("New local list", new DialogInterface.OnClickListener() {
                                                @Override public void onClick(DialogInterface dialog, int which) {
                                                    try {
                                                        bridge.verifyAccount(account);
                                                        Intent intent = new Intent();
                                                        intent.setClassName(activity.getPackageName(), ACTIVITY);
                                                        intent.putExtra(BadFellaSettingsActivity.EXTRA_CREATE_LIST, true);
                                                        activity.startActivity(intent);
                                                    } catch (Exception error) { showError(activity); }
                                                }
                                            })
                                            .setNeutralButton("Cloud list", new DialogInterface.OnClickListener() {
                                                @Override public void onClick(DialogInterface dialog, int which) {
                                                    try {
                                                        bridge.verifyAccount(account);
                                                        openCloudListCreator(activity);
                                                    } catch (Exception error) { showError(activity); }
                                                }
                                            })
                                            .setNegativeButton("Cancel", null).show();
                                } catch (Exception error) { showError(activity); }
                            }
                        });
                    } catch (Exception error) {
                        activity.runOnUiThread(new Runnable() {
                            @Override public void run() { showError(activity); }
                        });
                    }
                }
            }, "BadFella-list-routing").start();
        } catch (Exception error) {
            Log.w(LOG_TAG, "List creator unavailable: " + error.getClass().getSimpleName());
        }
    }

    private static void openCloudListCreator(Activity activity) {
        Intent intent = new Intent();
        intent.setClassName(activity.getPackageName(), "com.ticktick.task.activity.ProjectEditActivity");
        intent.putExtra("tasklist_id", 0L);
        activity.startActivityForResult(intent, 5);
    }

    private static void showError(Activity activity) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        new AlertDialog.Builder(activity).setTitle("List creator unavailable")
                .setMessage("The account may have changed. Reopen TickTick and try again.")
                .setPositiveButton("Close", null).show();
    }
}
