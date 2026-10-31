package bn;

import com.google.android.gms.internal.measurement.v6;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.attribute.FileAttribute;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class q implements dn.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18265a;

    public /* synthetic */ q(int i5) {
        this.f18265a = i5;
    }

    public static t5.c0 a(t5.c1 c1Var, v6 v6Var, y70.d dVar, Function0 function0) {
        EmptyList migrations = EmptyList.f71733a;
        try {
            System.loadLibrary("datastore_shared_counter");
            Intrinsics.g(migrations, "migrations");
            return new t5.c0(new t5.h0(c1Var, new androidx.fragment.app.p(dVar, 29), function0), ul.b.P(new g20.q(migrations, null, 5)), v6Var, dVar);
        } catch (SecurityException | UnsatisfiedLinkError unused) {
            return t5.h.b(c1Var, v6Var, migrations, dVar, function0);
        }
    }

    public static void b(File file) {
        File parentFile = file.getParentFile();
        if (parentFile == null) {
            return;
        }
        if (parentFile.exists() && !parentFile.isDirectory() && Intrinsics.b(parentFile.getName(), "firebaseSessions") && !parentFile.delete()) {
            throw new IOException(h6.c1.q(parentFile, "Failed to delete conflicting file: "));
        }
        if (parentFile.isDirectory()) {
            return;
        }
        try {
            Files.createDirectories(parentFile.toPath(), new FileAttribute[0]);
        } catch (Exception e3) {
            throw new IOException(h6.c1.q(parentFile, "Failed to create directory: "), e3);
        }
    }

    @Override // w60.a
    public Object get() {
        switch (this.f18265a) {
            case 1:
                return i1.f18217a;
            default:
                return j1.f18233a;
        }
    }
}
