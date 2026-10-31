package io.branch.search.internal;

import java.io.File;
import java.util.UUID;
import kotlin.io.FilesKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class E9 implements Eb {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f62410a;

    public static final class a {
    }

    public E9(@NotNull F4 context) {
        Intrinsics.g(context, "context");
        this.f62410a = context;
    }

    public static void a(F4 f42) {
        File[] fileArrListFiles = f42.a(EnumC3073b2.FILES).listFiles(new com.amplitude.core.diagnostics.b(1));
        if (fileArrListFiles != null) {
            for (File it : fileArrListFiles) {
                try {
                    Intrinsics.f(it, "it");
                    FilesKt.n0(it);
                } catch (Exception e3) {
                    C3296o5.a(UUID.randomUUID().toString(), e3, "NukeOption.deleteFilesDirectory");
                }
            }
        }
    }

    public static void b(F4 f42) {
        File[] fileArrListFiles = f42.a(EnumC3073b2.SHARED_PREFERENCES).listFiles(new com.google.firebase.crashlytics.internal.persistence.b(3));
        if (fileArrListFiles != null) {
            for (File file : fileArrListFiles) {
                try {
                    file.delete();
                } catch (Exception e3) {
                    C3296o5.a(UUID.randomUUID().toString(), e3, "NukeOption.deletePreference");
                }
            }
        }
    }

    public static final boolean a(File file) {
        if (file.isDirectory()) {
            String name = file.getName();
            Intrinsics.f(name, "file.name");
            if (r70.j.I0(name, "bnc", false)) {
                return true;
            }
        }
        return file.getName().equals("FLAG_BNC_INIT");
    }

    public static final boolean a(File file, String name) {
        Intrinsics.f(name, "name");
        return r70.j.I0(name, "BNC_", false);
    }
}
