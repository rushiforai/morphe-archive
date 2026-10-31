package com.teslacoilsw.launcher.backup;

import android.content.Context;
import android.content.Intent;
import androidx.activity.result.contract.ActivityResultContracts$CreateDocument;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"com/teslacoilsw/launcher/backup/BackupCategoryDocStorage$CreateBackup", "Landroidx/activity/result/contract/ActivityResultContracts$CreateDocument;", "<init>", "()V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class BackupCategoryDocStorage$CreateBackup extends ActivityResultContracts$CreateDocument {
    @Override // androidx.activity.result.contract.ActivityResultContracts$CreateDocument, k.b
    /* renamed from: a */
    public final Intent createIntent(Context context, String str) {
        Intent intentCreateIntent = super.createIntent(context, str);
        intentCreateIntent.setType("application/vnd.novalauncher.backup");
        intentCreateIntent.putExtra("android.content.extra.SHOW_ADVANCED", true);
        return intentCreateIntent;
    }
}
