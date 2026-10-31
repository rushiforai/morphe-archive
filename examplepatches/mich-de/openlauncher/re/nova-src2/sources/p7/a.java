package p7;

import android.content.Context;
import java.io.File;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f82315a = new a();

    @NotNull
    public final File a(@NotNull Context context) {
        Intrinsics.g(context, "context");
        File noBackupFilesDir = context.getNoBackupFilesDir();
        Intrinsics.f(noBackupFilesDir, "context.noBackupFilesDir");
        return noBackupFilesDir;
    }
}
