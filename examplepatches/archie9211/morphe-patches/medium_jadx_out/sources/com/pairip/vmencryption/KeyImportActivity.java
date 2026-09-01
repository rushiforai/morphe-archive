package com.pairip.vmencryption;

import android.R;
import android.app.Activity;
import android.app.ActivityOptions;
import android.app.AlertDialog;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.ViewTreeObserver;
import java.util.Objects;

/* JADX INFO: loaded from: classes2.dex */
public class KeyImportActivity extends Activity {
    private static final String TAG = "KeyImport.Activity";
    private KeyImportActiveClient keyImportClientCatched;

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        findViewById(R.id.content).getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener(this) { // from class: com.pairip.vmencryption.KeyImportActivity.1
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                return false;
            }

            {
                Objects.requireNonNull(this);
            }
        });
        getKeyImportActiveClient().importEncryptionKey(getApplicationContext(), new KeyImportResultListener(this) { // from class: com.pairip.vmencryption.KeyImportActivity.2
            final /* synthetic */ KeyImportActivity this$0;

            {
                Objects.requireNonNull(this);
                this.this$0 = this;
            }

            @Override // com.pairip.vmencryption.KeyImportResultListener
            public void onSuccess() {
                Log.i(KeyImportActivity.TAG, "Key import succeeded.");
                this.this$0.triggerAppRestart();
            }

            @Override // com.pairip.vmencryption.KeyImportResultListener
            public void onActionRequired(PendingIntent pendingIntent) {
                Log.i(KeyImportActivity.TAG, "Key import requested extra action.");
                this.this$0.launchPendingIntent(pendingIntent);
            }

            @Override // com.pairip.vmencryption.KeyImportResultListener
            public void onFailure(Exception exception) {
                Log.e(KeyImportActivity.TAG, "Key import failed.", exception);
                this.this$0.showErrorDialog();
            }
        });
    }

    protected KeyImportActiveClient getKeyImportActiveClient() {
        KeyImportActiveClient keyImportActiveClient = this.keyImportClientCatched;
        if (keyImportActiveClient != null) {
            return keyImportActiveClient;
        }
        KeyImportActiveClient keyImportActiveClient2 = new KeyImportActiveClient(new KeyStoreManager(), getPackageName(), KeyImportConstants.packageVersionCode);
        this.keyImportClientCatched = keyImportActiveClient2;
        return keyImportActiveClient2;
    }

    protected void triggerAppRestart() {
        ComponentName component = getPackageManager().getLaunchIntentForPackage(getPackageName()).getComponent();
        Log.i(TAG, "Activity that will be started: " + component.getClassName());
        Intent intentMakeRestartActivityTask = Intent.makeRestartActivityTask(component);
        intentMakeRestartActivityTask.setPackage(getPackageName());
        startActivity(intentMakeRestartActivityTask);
        closeApp();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void launchPendingIntent(final PendingIntent pendingIntent) {
        runOnUiThread(new Runnable() { // from class: com.pairip.vmencryption.KeyImportActivity$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.lambda$launchPendingIntent$0(pendingIntent);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$launchPendingIntent$0(PendingIntent pendingIntent) {
        try {
            if (Build.VERSION.SDK_INT >= 34) {
                pendingIntent.send(ActivityOptions.makeBasic().setPendingIntentBackgroundActivityStartMode(1).toBundle());
            } else {
                pendingIntent.send();
            }
            closeApp();
        } catch (PendingIntent.CanceledException e) {
            Log.e(TAG, "Play Store intent from key import result was unexpectedly cancelled.", e);
            showErrorDialog();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showErrorDialog() {
        runOnUiThread(new Runnable() { // from class: com.pairip.vmencryption.KeyImportActivity$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.lambda$showErrorDialog$0();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$showErrorDialog$0() {
        try {
            new AlertDialog.Builder(this).setTitle("Something went wrong").setMessage("Check that Google Play is enabled on your device and that you're using an up-to-date version before opening the app. If the problem persists try reinstalling the app.").setPositiveButton("Close", new DialogInterface.OnClickListener() { // from class: com.pairip.vmencryption.KeyImportActivity$$ExternalSyntheticLambda1
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    this.f$0.lambda$showErrorDialog$1(dialogInterface, i);
                }
            }).setCancelable(false).show();
        } catch (RuntimeException e) {
            Log.d(TAG, "Couldn't show the error dialog. " + Log.getStackTraceString(e));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$showErrorDialog$1(DialogInterface dialogInterface, int i) {
        closeApp();
    }

    protected void closeApp() {
        finishAndRemoveTask();
        finish();
        Runtime.getRuntime().exit(0);
    }
}
