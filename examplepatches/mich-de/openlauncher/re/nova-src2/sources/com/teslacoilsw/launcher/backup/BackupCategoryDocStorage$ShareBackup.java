package com.teslacoilsw.launcher.backup;

import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import androidx.activity.result.ActivityResult;
import b70.g;
import k.b;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"com/teslacoilsw/launcher/backup/BackupCategoryDocStorage$ShareBackup", "Lk/b;", "Landroid/net/Uri;", "Landroidx/activity/result/ActivityResult;", "<init>", "()V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class BackupCategoryDocStorage$ShareBackup extends b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Uri uri = (Uri) obj;
        Intent intent = new Intent("android.intent.action.SEND");
        intent.setType("application/vnd.novalauncher.backup");
        intent.putExtra("android.intent.extra.STREAM", uri);
        intent.putExtra("android.intent.extra.TITLE", (String) g.h1(uri.getPathSegments()));
        intent.setClipData(ClipData.newRawUri(null, uri));
        intent.addFlags(1);
        return Intent.createChooser(intent, context.getString(2132019515));
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        return new ActivityResult(i5, intent);
    }
}
