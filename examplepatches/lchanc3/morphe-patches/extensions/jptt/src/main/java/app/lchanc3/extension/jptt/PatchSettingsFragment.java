package app.lchanc3.extension.jptt;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.Toast;

import android.text.InputType;

import androidx.preference.Preference;
import androidx.preference.PreferenceCategory;
import androidx.preference.PreferenceFragmentCompat;
import androidx.preference.PreferenceManager;
import androidx.preference.PreferenceScreen;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * The settings page these patches add, built in code rather than from an XML
 * resource so that the bundle stays a bytecode-only patch.
 *
 * <p>It lives as one more tab in JPTT's own settings, so everything on it is
 * stored in the same {@code SharedPreferences} as the rest of the app's
 * settings, and is therefore part of what export writes out.
 */
@SuppressWarnings("unused")
public final class PatchSettingsFragment extends PreferenceFragmentCompat {

    /** Each number's preference, so an import can refresh what they show. */
    private final java.util.Map<String, Preference> shown = new java.util.LinkedHashMap<>();

    private static final int REQUEST_EXPORT = 0x6C63;
    private static final int REQUEST_IMPORT = 0x6C64;

    /*
     * Every androidx.preference call here has to exist in JPTT's own copy of the
     * library, which R8 has already shrunk to what the app itself uses. So the
     * preferences are built with the two argument constructors the XML inflater
     * needs -- the Context only ones are gone -- and createPreferenceScreen(),
     * setDialogTitle() and setPersistent() are avoided for the same reason.
     */

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        Context context = getContext();
        // What PreferenceManager.createPreferenceScreen() does, which is not in the
        // app's copy of the library: build the screen and attach it to the
        // hierarchy. Without the second half every addPreference() throws, because
        // a preference asks the manager it has not got for an id.
        PreferenceScreen screen = new PreferenceScreen(context, null);
        if (!attachToHierarchy(screen)) {
            // Nothing can be added to a screen with no manager, so leave the page
            // empty rather than take the app down with it.
            setPreferenceScreen(screen);
            toast("此 JPTT 版本無法開啟設定頁");
            return;
        }

        java.util.List<PatchSettings.Setting> options = PatchSettings.registered();
        if (!options.isEmpty()) {
            PreferenceCategory category = category(context, "選項");
            screen.addPreference(category);
            for (PatchSettings.Setting setting : options) {
                Preference preference = number(context, setting);
                shown.put(setting.key, preference);
                category.addPreference(preference);
            }
        }

        PreferenceCategory backup = category(context, "備份");
        screen.addPreference(backup);

        backup.addPreference(action(context, "匯出設定",
                "將所有設定匯出為 JSON 檔，不包含帳號密碼",
                preference -> {
                    startExport();
                    return true;
                }));

        backup.addPreference(action(context, "匯入設定",
                "從匯出的檔案還原設定，重新啟動應用程式生效",
                preference -> {
                    startImport();
                    return true;
                }));

        setPreferenceScreen(screen);
    }

    /**
     * Attaches a hand built screen to the fragment's preference hierarchy, which
     * is what {@code PreferenceManager.createPreferenceScreen()} would have done.
     *
     * <p>That method is not in the app's copy of the library, {@code
     * PreferenceScreen} is final so a subclass cannot reach the attach step, and
     * the step itself is {@code protected} -- so it is called by reflection. The
     * method is there in both 3.8.4 and 3.8.5; this returns false rather than
     * throwing if some future build drops it too.
     *
     * <p>Without it the first {@code addPreference()} throws, because the
     * preference being added asks the manager the group has not got for an id.
     */
    private boolean attachToHierarchy(PreferenceScreen screen) {
        try {
            Method attach = Preference.class.getDeclaredMethod(
                    "onAttachedToHierarchy", PreferenceManager.class);
            attach.setAccessible(true);
            attach.invoke(screen, getPreferenceManager());
            return true;
        } catch (Throwable ex) {
            Log.e(JpttContext.LOG_TAG, "Could not attach the settings screen", ex);
            return false;
        }
    }

    private void startExport() {
        String name = "jptt-settings-"
                + new SimpleDateFormat("yyyyMMdd-HHmm", Locale.US).format(new Date())
                + ".json";
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .setType("application/json")
                .putExtra(Intent.EXTRA_TITLE, name);
        startActivityForResult(intent, REQUEST_EXPORT);
    }

    private void startImport() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                // Some file pickers will not show a .json saved by another app
                // when the filter is that narrow, so ask for anything readable.
                .setType("*/*");
        startActivityForResult(intent, REQUEST_IMPORT);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) {
            return;
        }
        Uri uri = data.getData();
        Context context = getContext();
        if (context == null) {
            return;
        }

        try {
            if (requestCode == REQUEST_EXPORT) {
                SettingsBackup.write(
                        context.getContentResolver().openOutputStream(uri),
                        SettingsBackup.export(context));
                toast("設定已匯出");
            } else if (requestCode == REQUEST_IMPORT) {
                int written = SettingsBackup.importFrom(
                        context,
                        SettingsBackup.read(context.getContentResolver().openInputStream(uri)));
                refreshShownValues();
                toast("已匯入 " + written + " 項設定，重新啟動應用程式生效");
            }
        } catch (Throwable ex) {
            Log.e(JpttContext.LOG_TAG, "Settings backup failed", ex);
            String message = ex.getMessage();
            toast((requestCode == REQUEST_EXPORT ? "匯出失敗" : "匯入失敗")
                    + (message == null ? "" : "：" + message));
        }
    }

    /** An import writes values behind the page's back, so redraw what it shows. */
    private void refreshShownValues() {
        for (java.util.Map.Entry<String, Preference> entry : shown.entrySet()) {
            PatchSettings.Setting setting = PatchSettings.setting(entry.getKey());
            if (setting != null) {
                entry.getValue().setSummary(summaryOf(setting));
            }
        }
    }

    private void toast(String message) {
        Context context = getContext();
        if (context != null) {
            Toast.makeText(context, message, Toast.LENGTH_LONG).show();
        }
    }

    /**
     * One numeric setting, as a plain preference that opens a dialog of its own.
     *
     * <p>Not an {@code EditTextPreference}: that one is opened by handing its key
     * to {@code EditTextPreferenceDialogFragmentCompat}, which looks the
     * preference back up by that key -- and these have no key, because
     * {@code Preference.setKey()} is not in the app's copy of the library. The
     * dialog is built here instead, from the platform's own, and the value is read
     * and written through {@link PatchSettings}.
     */
    private Preference number(Context context, PatchSettings.Setting setting) {
        Preference preference = new Preference(context, null);
        preference.setTitle(setting.title);
        preference.setIconSpaceReserved(false);
        preference.setSummary(summaryOf(setting));
        preference.setOnPreferenceClickListener(clicked -> {
            askForNumber(setting, clicked);
            return true;
        });
        return preference;
    }

    private static String summaryOf(PatchSettings.Setting setting) {
        return PatchSettings.value(setting.key)
                + "（預設 " + setting.defaultValue
                + "，範圍 " + setting.min + "–" + setting.max + "）\n"
                + setting.summary;
    }

    private void askForNumber(PatchSettings.Setting setting, Preference preference) {
        Context context = getContext();
        if (context == null) {
            return;
        }

        EditText input = new EditText(context);
        input.setInputType(InputType.TYPE_CLASS_NUMBER);
        input.setText(String.valueOf(PatchSettings.value(setting.key)));
        input.setSelection(input.getText().length());

        int padding = (int) (24 * context.getResources().getDisplayMetrics().density);
        FrameLayout frame = new FrameLayout(context);
        frame.setPadding(padding, padding / 2, padding, 0);
        frame.addView(input);

        new AlertDialog.Builder(context)
                .setTitle(setting.title)
                .setMessage(setting.summary)
                .setView(frame)
                .setPositiveButton("確定", (dialog, which) -> {
                    PatchSettings.store(context, setting.key, input.getText().toString());
                    preference.setSummary(summaryOf(setting));
                })
                .setNeutralButton("恢復預設", (dialog, which) -> {
                    PatchSettings.store(context, setting.key, "");
                    preference.setSummary(summaryOf(setting));
                })
                .setNegativeButton("取消", null)
                .show();
    }

    private static PreferenceCategory category(Context context, String title) {
        PreferenceCategory category = new PreferenceCategory(context, null);
        category.setTitle(title);
        category.setIconSpaceReserved(false);
        return category;
    }

    private static Preference action(
            Context context,
            String title,
            String summary,
            Preference.OnPreferenceClickListener onClick
    ) {
        Preference preference = new Preference(context, null);
        preference.setTitle(title);
        preference.setSummary(summary);
        preference.setIconSpaceReserved(false);
        preference.setOnPreferenceClickListener(onClick);
        return preference;
    }
}
