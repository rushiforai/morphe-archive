package io.branch.search.internal;

import android.os.Environment;
import android.os.StatFs;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.a7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3061a7 {
    @Nullable
    public static final Long a() {
        if (!Intrinsics.b(Environment.getExternalStorageState(), "mounted")) {
            return null;
        }
        StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
        return Long.valueOf(statFs.getAvailableBlocksLong() * statFs.getBlockSizeLong());
    }
}
