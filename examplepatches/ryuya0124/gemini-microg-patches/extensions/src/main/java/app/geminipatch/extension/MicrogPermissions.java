package app.geminipatch.extension;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.FragmentManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.pm.PackageManager;
import android.content.pm.PermissionInfo;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.Locale;

/** Runtime code merged into Google; no dependency on the patcher's runtime. */
public final class MicrogPermissions {
    private static final String EXTENDED = "app.revanced.gms.EXTENDED_ACCESS";
    private static final String PROVIDER = "app.revanced.android.gms";
    private static final String PREFS = "morphe_microg_permissions";
    private static final String DECIDED = "explanation_decided_v1";
    private static final String TAG = "morphe.microg.account.permissions";

    private MicrogPermissions() {}

    private static String[] missingPermissions(Activity activity) {
        try {
            if (!activity.getPackageManager().getApplicationInfo(PROVIDER, 0).enabled) return new String[0];
            PermissionInfo permission = activity.getPackageManager().getPermissionInfo(EXTENDED, 0);
            if (!PROVIDER.equals(permission.packageName)
                    || (permission.protectionLevel & PermissionInfo.PROTECTION_MASK_BASE)
                    != PermissionInfo.PROTECTION_DANGEROUS) return new String[0];
        } catch (PackageManager.NameNotFoundException unavailable) {
            // Retry on a later launch after microG is installed in this profile.
            return new String[0];
        }
        ArrayList<String> missing = new ArrayList<>();
        for (String permission : new String[] {Manifest.permission.GET_ACCOUNTS, EXTENDED}) {
            if (activity.checkSelfPermission(permission) != PackageManager.PERMISSION_GRANTED) {
                missing.add(permission);
            }
        }
        return missing.toArray(new String[0]);
    }

    public static void onCreate(Activity activity) {
        if (activity.isFinishing() || activity.isDestroyed()
                || missingPermissions(activity).length == 0
                || activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(DECIDED, false)) return;
        FragmentManager manager = activity.getFragmentManager();
        if (!manager.isDestroyed() && !manager.isStateSaved() && manager.findFragmentByTag(TAG) == null) {
            new PermissionDialog().show(manager, TAG);
        }
    }

    /** Native DialogFragment handles rotation and activity destruction. */
    public static final class PermissionDialog extends DialogFragment implements DialogInterface.OnClickListener {
        public PermissionDialog() {}

        @Override public void onStart() {
            super.onStart();
            Activity activity = getActivity();
            if (activity == null || missingPermissions(activity).length == 0
                    || activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(DECIDED, false)) {
                dismissAllowingStateLoss();
            }
        }

        @Override public Dialog onCreateDialog(Bundle savedInstanceState) {
            boolean japanese = "ja".equals(Locale.getDefault().getLanguage());
            return new AlertDialog.Builder(getActivity())
                    .setTitle(japanese ? "Geminiのアカウントへのアクセス" : "Account access for Gemini")
                    .setMessage(japanese
                            ? "microGでGoogleアカウントを使うために、次の画面で権限を確認します。「連絡先」や「不明な操作」と表示される場合がありますが、この設定で求めるのはアカウントへのアクセスです。後で許可する場合は、Androidのアプリ情報から権限を変更できます。"
                            : "The next screens ask for access to your Google account through microG. Android may call these permissions Contacts and an unknown action. This setup requests account access. You can choose Not now and change permissions later in Android app info.")
                    .setPositiveButton(japanese ? "次へ" : "Continue", this)
                    .setNegativeButton(japanese ? "後で" : "Not now", this)
                    .create();
        }

        private void rememberDecision() {
            Activity activity = getActivity();
            if (activity != null) activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .edit().putBoolean(DECIDED, true).apply();
        }

        @Override public void onClick(DialogInterface dialog, int which) {
            rememberDecision();
            Activity activity = getActivity();
            if (which == DialogInterface.BUTTON_POSITIVE && activity != null
                    && !activity.isFinishing() && !activity.isDestroyed()) {
                String[] missing = missingPermissions(activity);
                if (missing.length != 0) activity.requestPermissions(missing, 0x6d47);
            }
        }

        @Override public void onCancel(DialogInterface dialog) {
            rememberDecision();
            super.onCancel(dialog);
        }
    }
}
