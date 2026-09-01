package com.pairip.vmencryption;

import android.app.Service;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.pairip.vmencryption.IKeyImportService;
import java.util.Objects;

/* JADX INFO: loaded from: classes2.dex */
public class KeyImportService extends Service {
    private static final String KEY_IMPORT_REQUIRED_PROPERTY_NAME = "KEY_IMPORT_REQUIRED";
    private static final String SUCCESS_PROPERTY_NAME = "SUCCESS";
    private static final String TAG = "KeyImport.Service";
    private static final String WRAPPING_KEY_PROPERTY_NAME = "WRAPPING_KEY";
    private final IKeyImportService.Stub binder = new IKeyImportService.Stub(this) { // from class: com.pairip.vmencryption.KeyImportService.1
        final /* synthetic */ KeyImportService this$0;

        {
            Objects.requireNonNull(this);
            this.this$0 = this;
        }

        @Override // com.pairip.vmencryption.IKeyImportService
        public void requestWrappingKey(int versionCode, Bundle extraParams, IKeyImportServiceRequestWrappingKeyCallback callback) {
            Log.i(KeyImportService.TAG, String.format("Wrapping key is requested for version %d", Integer.valueOf(versionCode)));
            Bundle bundle = new Bundle();
            try {
                boolean zIsEncryptionKeyPresent = this.this$0.getKeyStoreManager().isEncryptionKeyPresent(versionCode);
                bundle.putBoolean(KeyImportService.KEY_IMPORT_REQUIRED_PROPERTY_NAME, !zIsEncryptionKeyPresent);
                if (!zIsEncryptionKeyPresent) {
                    Log.i(KeyImportService.TAG, String.format("Providing a wrapping key for version %s", Integer.valueOf(versionCode)));
                    bundle.putByteArray(KeyImportService.WRAPPING_KEY_PROPERTY_NAME, this.this$0.getKeyStoreManager().getWrappingKey());
                }
                bundle.putBoolean(KeyImportService.SUCCESS_PROPERTY_NAME, true);
            } catch (KeyImportException e) {
                Log.e(KeyImportService.TAG, String.format("Failed to get wrapping key for version %d", Integer.valueOf(versionCode)), e);
                bundle.putBoolean(KeyImportService.SUCCESS_PROPERTY_NAME, false);
            }
            try {
                callback.onRequestWrappingKeyResponse(bundle);
            } catch (RemoteException e2) {
                Log.e(KeyImportService.TAG, "Failed to call callback.onRequestWrappingKeyResponse", e2);
            }
        }

        @Override // com.pairip.vmencryption.IKeyImportService
        public void importWrappedKey(int versionCode, byte[] wrappedKey, Bundle extraParams, IKeyImportServiceImportWrappedKeyCallback callback) {
            Log.i(KeyImportService.TAG, String.format("Wrapped key import is requested for version %d", Integer.valueOf(versionCode)));
            Bundle bundle = new Bundle();
            try {
                this.this$0.getKeyStoreManager().saveWrappedEncryptionKey(versionCode, wrappedKey);
                bundle.putBoolean(KeyImportService.SUCCESS_PROPERTY_NAME, true);
            } catch (KeyImportException e) {
                Log.e(KeyImportService.TAG, String.format("Failed to import wrapped key for version %d", Integer.valueOf(versionCode)), e);
                bundle.putBoolean(KeyImportService.SUCCESS_PROPERTY_NAME, false);
            }
            try {
                callback.onImportWrappedKeyResponse(bundle);
            } catch (RemoteException e2) {
                Log.e(KeyImportService.TAG, "Failed to call callback.onImportWrappedKeyResponse", e2);
            }
        }

        @Override // com.pairip.vmencryption.IKeyImportService
        public void importUnwrappedKey(int versionCode, byte[] unwrappedKey, Bundle extraParams, IKeyImportServiceImportUnwrappedKeyCallback callback) {
            Log.i(KeyImportService.TAG, String.format("Unwrapped key import is requested for version %d", Integer.valueOf(versionCode)));
            Bundle bundle = new Bundle();
            try {
                this.this$0.getKeyStoreManager().saveUnwrappedEncryptionKey(versionCode, unwrappedKey);
                bundle.putBoolean(KeyImportService.SUCCESS_PROPERTY_NAME, true);
            } catch (KeyImportException e) {
                Log.e(KeyImportService.TAG, String.format("Failed to import unwrapped key for version %d", Integer.valueOf(versionCode)), e);
                bundle.putBoolean(KeyImportService.SUCCESS_PROPERTY_NAME, false);
            }
            try {
                callback.onImportUnwrappedKeyResponse(bundle);
            } catch (RemoteException e2) {
                Log.e(KeyImportService.TAG, "Failed to call callback.onImportUnwrappedKeyResponse", e2);
            }
        }
    };
    private KeyStoreManager keyStoreManagerCached;

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        Log.i(TAG, "Binding to KeyImportService.");
        return this.binder;
    }

    protected KeyStoreManager getKeyStoreManager() {
        KeyStoreManager keyStoreManager = this.keyStoreManagerCached;
        if (keyStoreManager != null) {
            return keyStoreManager;
        }
        KeyStoreManager keyStoreManager2 = new KeyStoreManager();
        this.keyStoreManagerCached = keyStoreManager2;
        return keyStoreManager2;
    }
}
