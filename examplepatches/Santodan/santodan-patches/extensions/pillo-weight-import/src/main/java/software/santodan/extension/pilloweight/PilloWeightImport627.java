package software.santodan.extension.pilloweight;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;

/** Uses the selected profile and Pillo's native repository; never edits SQLite directly. */
public final class PilloWeightImport627 {
    private static final String TAG = "santodan.weight.import";
    private static final Object IMPORT_LOCK = new Object();
    private static java.lang.ref.WeakReference<Activity> host = new java.lang.ref.WeakReference<>(null);
    private PilloWeightImport627() {}

    public static void attach(Activity activity) {
        host = new java.lang.ref.WeakReference<>(activity);
        activity.getWindow().getDecorView().post(() -> {
            if (!activity.isFinishing() && activity.getFragmentManager().findFragmentByTag(TAG) == null)
                activity.getFragmentManager().beginTransaction().add(new ImportFragment(), TAG).commit();
        });
    }

    /** Composed in the native weight footer, above its existing Skip/Next row. */
    public static void footer(Object modifier, Object back, Object next, boolean showPrevious,
            boolean enabled, String label, Object composer, int flags, int defaults) throws Exception {
        Class<?> function0 = Class.forName("kotlin.jvm.functions.Function0");
        Class<?> function2 = Class.forName("kotlin.jvm.functions.Function2");
        Class<?> function3 = Class.forName("kotlin.jvm.functions.Function3");
        Object click = Proxy.newProxyInstance(function0.getClassLoader(), new Class<?>[]{function0}, (proxy, method, args) -> {
            if (!method.getName().equals("invoke")) return proxyObject(proxy, method.getName(), args);
            Activity activity = host.get();
            if (activity != null && !activity.isFinishing()) {
                ImportFragment fragment = (ImportFragment) activity.getFragmentManager().findFragmentByTag(TAG);
                if (fragment != null) fragment.chooseFile();
            }
            return unit();
        });
        Object content = Proxy.newProxyInstance(function3.getClassLoader(), new Class<?>[]{function3}, (proxy, method, args) -> {
            if (!method.getName().equals("invoke")) return proxyObject(proxy, method.getName(), args);
            Object current = args[1];
            method(Class.forName("xyz.rtrvr.pillo.ui.components.buttons.ButtonsKt"), "ButtonM-vRFhKjU", 10)
                .invoke(null, null, true, "Import weights JSON", 0L, 0L, null, click, current, 0, 57);
            method(Class.forName("xyz.rtrvr.pillo.ui.tracker.common.components.LoggingBottomBarKt"), "LoggingBottomBar", 9)
                .invoke(null, modifier, back, next, showPrevious, enabled, label, current, flags, defaults);
            return unit();
        });
        method(Class.forName("xyz.rtrvr.pillo.ui.components.layout.SpacedColumnKt"), "SpacedColumn-DzVHIIc", 7)
            .invoke(null, null, 8f, null, content, composer, 0, 5);
    }
    private static Object unit() throws Exception { return Class.forName("kotlin.Unit").getField("a").get(null); }
    private static Object proxyObject(Object proxy, String name, Object[] args) {
        if (name.equals("toString")) return "PilloWeightImport627Action";
        if (name.equals("hashCode")) return System.identityHashCode(proxy);
        if (name.equals("equals")) return proxy == args[0];
        throw new UnsupportedOperationException(name);
    }

    public static final class ImportFragment extends Fragment {
        private String profileId;
        private boolean kilograms = true;
        private boolean busy;

        @Override public void onCreate(Bundle state) {
            super.onCreate(state);
            setRetainInstance(true);
            if (state != null) {
                profileId = state.getString("profileId");
                kilograms = state.getBoolean("kilograms", true);
            }
        }

        @Override public void onSaveInstanceState(Bundle state) {
            super.onSaveInstanceState(state);
            state.putString("profileId", profileId);
            state.putBoolean("kilograms", kilograms);
        }

        @Override public void onActivityCreated(Bundle state) {
            super.onActivityCreated(state);
        }

        @Override public void onDestroyView() {
            super.onDestroyView();
        }

        private void chooseFile() {
            if (busy) return;
            try {
                Object vm = call(getActivity(), "getVm");
                Object type = call(vm, "getTrackerType");
                if (!(type instanceof Enum) || !"WEIGHT".equals(((Enum<?>) type).name())) {
                    message("Open Add record for Weight before importing.");
                    return;
                }
                Object profile = call(vm, "getUserProfile");
                if (profile == null) { message("Select a profile before importing."); return; }
                profileId = (String) call(profile, "getUserProfileId");
                new AlertDialog.Builder(getActivity()).setTitle("Weight unit in the JSON")
                    .setSingleChoiceItems(new String[]{"Kilograms (kg)", "Pounds (lb)"}, kilograms ? 0 : 1,
                        (dialog, which) -> kilograms = which == 0)
                    .setNegativeButton("Cancel", null).setPositiveButton("Choose JSON", (dialog, which) -> {
                        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("*/*")
                            .addCategory(Intent.CATEGORY_OPENABLE);
                        startActivityForResult(intent, 7194);
                    }).show();
            } catch (Exception error) { message("Cannot open importer: " + reason(error)); }
        }

        @Override public void onActivityResult(int request, int result, Intent data) {
            super.onActivityResult(request, result, data);
            if (request != 7194 || result != Activity.RESULT_OK || data == null || data.getData() == null) return;
            if (profileId == null || busy) return;
            Uri uri = data.getData();
            Activity activity = getActivity();
            String selectedProfile = profileId;
            boolean selectedUnit = kilograms;
            busy = true;
            new Thread(() -> {
                try {
                    String json;
                    try (InputStream input = activity.getContentResolver().openInputStream(uri)) {
                        if (input == null) throw new IllegalArgumentException("Cannot read the selected file.");
                        ByteArrayOutputStream output = new ByteArrayOutputStream();
                        byte[] buffer = new byte[8192]; int count;
                        while ((count = input.read(buffer)) != -1) {
                            if (output.size() + count > 2 * 1024 * 1024)
                                throw new IllegalArgumentException("The JSON exceeds 2 MB.");
                            output.write(buffer, 0, count);
                        }
                        json = new String(output.toByteArray(), StandardCharsets.UTF_8);
                    }
                    List<WeightBackup.Entry> entries = WeightBackup.parse(json, selectedUnit);
                    activity.runOnUiThread(() -> {
                        busy = false;
                        Activity current = getActivity();
                        if (current == null || current.isFinishing()) return;
                        java.text.DateFormat format = java.text.DateFormat.getDateInstance();
                        String range = format.format(new java.util.Date(entries.get(0).seconds * 1000L)) + " – "
                            + format.format(new java.util.Date(entries.get(entries.size() - 1).seconds * 1000L));
                        new AlertDialog.Builder(current).setTitle("Import " + entries.size() + " weights?")
                            .setMessage(range + "\nSource unit: " + (selectedUnit ? "kg" : "lb")
                                + "\nAdds records to the profile selected when you opened the file picker."
                                + " Existing records stay unchanged; matching date and weight entries are skipped.")
                            .setNegativeButton("Cancel", null).setPositiveButton("Import", (dialog, which) ->
                                save(entries, selectedProfile)).show();
                    });
                } catch (Exception error) {
                    android.util.Log.e("PilloWeightImport627", "Cannot read weight backup", error);
                    complete(activity, "Import failed: " + reason(error));
                }
            }, "PilloWeightRead").start();
        }

        private void save(List<WeightBackup.Entry> entries, String selectedProfile) {
            if (busy) return;
            busy = true;
            Activity activity = getActivity();
            new Thread(() -> {
                try {
                    int imported;
                    synchronized (IMPORT_LOCK) { imported = importEntries(entries, selectedProfile); }
                    complete(activity, "Imported " + imported + " weights. Skipped "
                        + (entries.size() - imported) + " existing entries.");
                } catch (Exception error) {
                    android.util.Log.e("PilloWeightImport627", "Cannot import weight records", error);
                    complete(activity, "Import failed: " + reason(error));
                }
            }, "PilloWeightImport627").start();
        }

        private void complete(Activity activity, String text) {
            activity.runOnUiThread(() -> {
                busy = false;
                message(text);
            });
        }

        private void message(String text) {
            Activity current = getActivity();
            if (current != null && !current.isFinishing())
                new AlertDialog.Builder(current).setTitle("Weight import").setMessage(text)
                    .setPositiveButton("OK", null).show();
        }
    }

    static int importEntries(List<WeightBackup.Entry> entries, String profileId) throws Exception {
        Class<?> managerClass = Class.forName("xyz.rtrvr.pillo.data.persistence.database.AppDatabaseManager");
        Object manager = call(managerClass.getField("Companion").get(null), "getInstance");
        Object repository = call(manager, "getTrackerEventRepository");
        Object type = Class.forName("xyz.rtrvr.pillo.models.entities.tracker.TrackerType").getField("WEIGHT").get(null);
        Object flow = call(repository, "findTrackedEventsByUserProfileIdAndTrackerType", profileId, type);
        Class<?> flowClass = Class.forName("xyz.rtrvr.pillo.shared.coroutine.FlowExtensionsKt");
        Object existing = suspend(method(flowClass, "firstOnIO", 2), null, flow);
        Set<String> seen = new HashSet<>();
        for (Object event : (List<?>) existing) {
            Object record = call(event, "getWeightRecord");
            Object date = call(event, "getRecordedAtEpochSec");
            if (record != null && date != null)
                seen.add(new WeightBackup.Entry(((Number) date).longValue(),
                    ((Number) call(record, "getWeightLbs")).floatValue()).key());
        }
        Constructor<?> recordConstructor = Class.forName(
            "xyz.rtrvr.pillo.models.entities.tracker.type.weight.WeightTrackerRecord").getConstructor(float.class, String.class);
        Constructor<?> eventConstructor = null;
        for (Constructor<?> candidate : Class.forName("xyz.rtrvr.pillo.models.entities.tracker.TrackerEvent").getConstructors())
            if (candidate.getParameterTypes().length == 23) eventConstructor = candidate;
        if (eventConstructor == null) throw new IllegalStateException("Unsupported Pillo event constructor.");
        List<Object> pending = new ArrayList<>();
        for (WeightBackup.Entry entry : entries) {
            if (!seen.add(entry.key())) continue;
            Object[] args = new Object[23];
            args[0] = 0L; // Room generates the ID; null trackerId means an extra, unscheduled record.
            args[2] = profileId;
            args[3] = type;
            args[7] = false;
            args[8] = entry.seconds;
            args[14] = recordConstructor.newInstance(entry.pounds, "");
            pending.add(eventConstructor.newInstance(args));
        }
        if (pending.isEmpty()) return 0;
        // Pillo's batch API drops the null-trackerId group. Its single-record
        // API explicitly permits extra records without a reminder, like these.
        Method insert = method(repository.getClass(), "insertWithConstraint", 2);
        int saved = 0;
        for (Object event : pending) {
            try {
                Object id = suspend(insert, repository, event);
                if (!(id instanceof Number) || ((Number) id).longValue() <= 0)
                    throw new IllegalStateException("Pillo did not confirm the inserted record.");
                saved++;
            } catch (Exception error) {
                throw new IllegalStateException("Saved " + saved + " of " + pending.size()
                    + " new weights. Reimport to continue; already saved entries will be skipped. Details: " + reason(error), error);
            }
        }
        return pending.size();
    }

    private static Method method(Class<?> owner, String name, int count) throws Exception {
        for (Class<?> c = owner; c != null; c = c.getSuperclass())
            for (Method m : c.getDeclaredMethods())
                if (m.getName().equals(name) && m.getParameterTypes().length == count) {
                    m.setAccessible(true); return m;
                }
        throw new NoSuchMethodException(name);
    }

    private static Object call(Object receiver, String name, Object... args) throws Exception {
        return method(receiver.getClass(), name, args.length).invoke(receiver, args);
    }

    /** Suspend functions resume on native dispatchers; only this worker waits. */
    private static Object suspend(Method method, Object receiver, Object... args) throws Exception {
        Class<?> continuation = Class.forName("kotlin.coroutines.Continuation");
        Object context = Class.forName("kotlin.coroutines.EmptyCoroutineContext").getField("a").get(null);
        CountDownLatch done = new CountDownLatch(1);
        Object[] result = new Object[1];
        Object callback = Proxy.newProxyInstance(continuation.getClassLoader(), new Class<?>[]{continuation}, (proxy, m, values) -> {
            if (m.getName().equals("getContext")) return context;
            if (m.getName().equals("resumeWith")) { result[0] = values[0]; done.countDown(); return null; }
            if (m.getName().equals("toString")) return "PilloWeightImport627Continuation";
            if (m.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (m.getName().equals("equals")) return proxy == values[0];
            throw new UnsupportedOperationException(m.getName());
        });
        Object[] parameters = new Object[args.length + 1];
        System.arraycopy(args, 0, parameters, 0, args.length);
        parameters[args.length] = callback;
        Object immediate = method.invoke(receiver, parameters);
        Class<?> singleton = Class.forName("kotlin.coroutines.intrinsics.CoroutineSingletons");
        Object suspended = singleton.getField("a").get(null);
        if (immediate != suspended) return immediate;
        done.await();
        Class.forName("kotlin.ResultKt").getMethod("b", Object.class).invoke(null, result[0]);
        return result[0];
    }

    private static String reason(Throwable error) {
        if (error instanceof IllegalStateException && error.getMessage() != null
            && error.getMessage().startsWith("Saved ")) return error.getMessage();
        while (error.getCause() != null) error = error.getCause();
        return error.getMessage() == null ? error.getClass().getSimpleName() : error.getMessage();
    }
}
