package com.android.launcher3;

import android.app.backup.BackupAgent;
import android.app.backup.BackupDataInput;
import android.app.backup.BackupDataOutput;
import android.content.Context;
import android.os.ParcelFileDescriptor;
import ea.b;
import java.io.File;

/* loaded from: classes2.dex */
public class LauncherBackupAgent extends BackupAgent {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f20961a = 0;

    public static File a(Context context, String str) {
        return new File(context.getDataDir(), "shared_prefs/".concat(str));
    }

    @Override // android.app.backup.BackupAgent
    public final void onBackup(ParcelFileDescriptor parcelFileDescriptor, BackupDataOutput backupDataOutput, ParcelFileDescriptor parcelFileDescriptor2) {
    }

    @Override // android.app.backup.BackupAgent
    public final void onCreate() {
        super.onCreate();
        b.i(getFilesDir());
    }

    @Override // android.app.backup.BackupAgent
    public final void onRestore(BackupDataInput backupDataInput, int i5, ParcelFileDescriptor parcelFileDescriptor) {
    }

    @Override // android.app.backup.BackupAgent
    public final void onRestoreFinished() {
        File file = new File(getDataDir(), "restored");
        file.mkdir();
        File databasePath = getDatabasePath("nova.db");
        databasePath.renameTo(new File(file, databasePath.getName()));
        File fileA = a(this, "com.android.launcher3.prefs.xml");
        fileA.renameTo(new File(file, fileA.getName()));
        File fileA2 = a(this, "nova.xml");
        fileA2.renameTo(new File(file, fileA2.getName()));
        File fileStreamPath = getFileStreamPath("downgrade_schema.json");
        fileStreamPath.renameTo(new File(file, fileStreamPath.getName()));
    }
}
