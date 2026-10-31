package io.branch.search.internal;

import android.content.Context;
import android.os.Environment;
import android.os.StatFs;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Y6 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final File f63725a;

    public static final class a {
    }

    public Y6(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f63725a = new File(context.getFilesDir(), "FLAG_BNC_INIT");
    }

    public final boolean a() {
        if (this.f63725a.exists()) {
            return true;
        }
        StatFs statFs = new StatFs(Environment.getDataDirectory().getAbsolutePath());
        return statFs.getBlockSizeLong() * statFs.getAvailableBlocksLong() > 3145728;
    }

    public final void b() throws IOException {
        try {
            File file = this.f63725a;
            if (!file.exists()) {
                new FileOutputStream(file).close();
            }
            file.setLastModified(System.currentTimeMillis());
        } catch (IOException unused) {
        }
    }
}
