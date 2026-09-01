package com.pairip.vmencryption;

import android.app.backup.BackupAgent;
import android.app.backup.BackupDataInput;
import android.app.backup.BackupDataOutput;
import android.app.backup.FullBackupDataOutput;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;

/* JADX INFO: loaded from: classes2.dex */
public class KeyImportPlaceholderBackupAgent extends BackupAgent {
    private static final String TAG = "KeyImport.BackupAgent";
    private Boolean cachedIsEncryptionKeyPresent;
    private BackupAgent cachedOriginalBackupAgent;
    private final KeyStoreManager keyStoreManager;

    public KeyImportPlaceholderBackupAgent() {
        this.keyStoreManager = new KeyStoreManager();
    }

    public KeyImportPlaceholderBackupAgent(KeyStoreManager keyStoreManager) {
        this.keyStoreManager = keyStoreManager;
    }

    @Override // android.app.backup.BackupAgent
    public void onCreate() {
        if (!isEncryptionKeyPresent()) {
            Log.w(TAG, "Encryption key not present during backup/restore. Skipping operation gracefully.");
            return;
        }
        try {
            BackupAgent originalBackupAgent = getOriginalBackupAgent();
            attachContextToOriginalAgent(originalBackupAgent);
            originalBackupAgent.onCreate();
        } catch (Exception e) {
            Log.e(TAG, "Failed to initialize original BackupAgent in onCreate.", e);
            throw new IllegalStateException("Failed to initialize original BackupAgent.", e);
        }
    }

    @Override // android.app.backup.BackupAgent
    public void onDestroy() {
        if (isEncryptionKeyPresent()) {
            getOriginalBackupAgent().onDestroy();
        }
    }

    @Override // android.app.backup.BackupAgent
    public void onBackup(ParcelFileDescriptor oldState, BackupDataOutput data, ParcelFileDescriptor newState) throws IOException {
        if (!isEncryptionKeyPresent()) {
            Log.w(TAG, "Encryption key not present. Skipping onBackup.");
        } else {
            getOriginalBackupAgent().onBackup(oldState, data, newState);
        }
    }

    @Override // android.app.backup.BackupAgent
    public void onRestore(BackupDataInput data, int appVersionCode, ParcelFileDescriptor newState) throws IOException {
        if (!isEncryptionKeyPresent()) {
            Log.w(TAG, "Encryption key not present. Skipping onRestore.");
        } else {
            getOriginalBackupAgent().onRestore(data, appVersionCode, newState);
        }
    }

    @Override // android.app.backup.BackupAgent
    public void onRestore(BackupDataInput data, long appVersionCode, ParcelFileDescriptor newState) throws IOException {
        if (!isEncryptionKeyPresent()) {
            Log.w(TAG, "Encryption key not present. Skipping onRestore.");
        } else {
            getOriginalBackupAgent().onRestore(data, appVersionCode, newState);
        }
    }

    @Override // android.app.backup.BackupAgent
    public void onRestoreFinished() {
        if (!isEncryptionKeyPresent()) {
            Log.w(TAG, "Encryption key not present. Skipping onRestoreFinished.");
        } else {
            getOriginalBackupAgent().onRestoreFinished();
        }
    }

    @Override // android.app.backup.BackupAgent
    public void onRestoreFile(ParcelFileDescriptor data, long size, File destination, int type, long mode, long mtime) throws IOException {
        if (!isEncryptionKeyPresent()) {
            Log.w(TAG, "Encryption key not present. Skipping onRestoreFile.");
        } else {
            getOriginalBackupAgent().onRestoreFile(data, size, destination, type, mode, mtime);
        }
    }

    @Override // android.app.backup.BackupAgent
    public void onFullBackup(FullBackupDataOutput data) throws IOException {
        if (!isEncryptionKeyPresent()) {
            Log.w(TAG, "Encryption key not present. Skipping onFullBackup.");
        } else {
            getOriginalBackupAgent().onFullBackup(data);
        }
    }

    @Override // android.app.backup.BackupAgent
    public void onQuotaExceeded(long backupDataBytes, long quotaBytes) {
        if (isEncryptionKeyPresent()) {
            getOriginalBackupAgent().onQuotaExceeded(backupDataBytes, quotaBytes);
        }
    }

    private boolean isEncryptionKeyPresent() {
        Boolean boolValueOf;
        Boolean bool = this.cachedIsEncryptionKeyPresent;
        if (bool != null) {
            return bool.booleanValue();
        }
        try {
            boolValueOf = Boolean.valueOf(this.keyStoreManager.isEncryptionKeyPresent(KeyImportConstants.packageVersionCode));
            this.cachedIsEncryptionKeyPresent = boolValueOf;
        } catch (KeyImportException e) {
            Log.e(TAG, "Failed to check if encryption key is present.", e);
            boolValueOf = Boolean.FALSE;
            this.cachedIsEncryptionKeyPresent = boolValueOf;
        }
        return boolValueOf.booleanValue();
    }

    public BackupAgent getOriginalBackupAgent() {
        BackupAgent backupAgent = this.cachedOriginalBackupAgent;
        if (backupAgent != null) {
            return backupAgent;
        }
        Log.d(TAG, "Creating original BackupAgent: " + KeyImportConstants.originalBackupAgentClassName);
        try {
            Class[] clsArr = new Class[0];
            BackupAgent backupAgent2 = (BackupAgent) Class.forName(KeyImportConstants.originalBackupAgentClassName).getConstructor(null).newInstance(null);
            this.cachedOriginalBackupAgent = backupAgent2;
            return backupAgent2;
        } catch (ReflectiveOperationException e) {
            Log.e(TAG, "Failed to instantiate original BackupAgent.", e);
            throw new IllegalStateException("Failed to instantiate original BackupAgent.", e);
        }
    }

    private void attachContextToOriginalAgent(BackupAgent originalAgent) throws Exception {
        Method declaredMethod = ContextWrapper.class.getDeclaredMethod("attachBaseContext", Context.class);
        declaredMethod.setAccessible(true);
        declaredMethod.invoke(originalAgent, this);
    }
}
