package app.cesbar.extensions.velov;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.verify.domain.DomainVerificationManager;
import android.content.pm.verify.domain.DomainVerificationUserState;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;

public class DeeplinksHelper {

    private static final String[] SUPPORTED_DOMAINS = {
            "velov.cyclocity.fr",
            "velov.grandlyon.com"
    };

    public static void checkAndOpenSettingsIfNotSetup(final Context context) {
        if (areAllDeeplinksSetup(context)) return;

        final AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle("Manual configuration required")
                .setMessage("Please add the supported links \n  - velov.cyclocity.fr\n  - velov.grandlyon.com\nin the next screen")
                .setCancelable(false)
                .setPositiveButton("Continue", null)
                .setOnKeyListener(new DialogInterface.OnKeyListener() {
                    @Override
                    public boolean onKey(DialogInterface dialogInterface, int keyCode, KeyEvent event) {
                        if (keyCode == KeyEvent.KEYCODE_BACK && event.getAction() == KeyEvent.ACTION_UP) {
                            dialogInterface.dismiss();
                            if (context instanceof Activity) ((Activity) context).finish();
                            return true; 
                        }
                        return false;
                    }
                })
                .create();

        dialog.show();

        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String action = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
                    ? Settings.ACTION_APP_OPEN_BY_DEFAULT_SETTINGS
                    : Settings.ACTION_APPLICATION_DETAILS_SETTINGS;

                Intent intent = new Intent(action);
                intent.setData(Uri.parse("package:" + context.getPackageName()));
                context.startActivity(intent);
            }
        });

        Window window = dialog.getWindow();
        if (window != null) {
            final View decorView = window.getDecorView();
            decorView.getViewTreeObserver().addOnWindowFocusChangeListener(
                    new ViewTreeObserver.OnWindowFocusChangeListener() {
                        @Override
                        public void onWindowFocusChanged(boolean hasFocus) {
                            if (hasFocus && areAllDeeplinksSetup(context)) {
                                decorView.post(new Runnable() {
                                    @Override
                                    public void run() {
                                        dialog.dismiss();
                                    }
                                });
                            }
                        }
                    });
        }
    }

    public static boolean areAllDeeplinksSetup(Context context) {
        for (String domain : SUPPORTED_DOMAINS) {
            boolean isSetup = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
                    ? isDeeplinkSetupApi31(context, domain)
                    : isDeeplinkSetupOld(context, domain);

            if (!isSetup) return false;
        }
        return true;
    }

    private static boolean isDeeplinkSetupApi31(Context context, String domain) {
        DomainVerificationManager manager = context.getSystemService(DomainVerificationManager.class);
        if (manager == null) return false;

        try {
            DomainVerificationUserState userState = manager.getDomainVerificationUserState(context.getPackageName());
            Integer state = userState.getHostToStateMap().get(domain);
            
            return state != null && (state == DomainVerificationUserState.DOMAIN_STATE_VERIFIED || 
                                     state == DomainVerificationUserState.DOMAIN_STATE_SELECTED);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static boolean isDeeplinkSetupOld(Context context, String domain) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://" + domain));
        ResolveInfo resolveInfo = context.getPackageManager().resolveActivity(intent, PackageManager.MATCH_DEFAULT_ONLY);

        return resolveInfo != null && resolveInfo.activityInfo != null &&
                context.getPackageName().equals(resolveInfo.activityInfo.packageName);
    }
}