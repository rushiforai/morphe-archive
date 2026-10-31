package io.branch.search.internal;

import io.branch.search.internal.C3228k5;
import java.io.File;
import java.io.FilenameFilter;
import java.util.Arrays;
import java.util.regex.Pattern;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.k5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3228k5 {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f64916a;

    /* renamed from: b, reason: collision with root package name */
    public static final Pattern f64917b;

    static {
        StringBuilder sb2 = new StringBuilder("^");
        StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
        sb2.append(String.format("(%s|%s)", Arrays.copyOf(new Object[]{"BranchSdkRoomDatabase", "BranchSdkNetworkRoomDatabase"}, 2)));
        sb2.append(".*$");
        f64916a = Pattern.compile(sb2.toString());
        f64917b = Pattern.compile("^androidx.work.workdb.*$");
    }

    @JvmStatic
    @NotNull
    public static final File[] a(@NotNull F4 context, final boolean z11) {
        Intrinsics.g(context, "context");
        File[] fileArrListFiles = context.a(EnumC3073b2.DATABASES).listFiles(new FilenameFilter() { // from class: z40.b
            @Override // java.io.FilenameFilter
            public final boolean accept(File file, String str) {
                return C3228k5.a(z11, file, str);
            }
        });
        return fileArrListFiles == null ? new File[0] : fileArrListFiles;
    }

    public static final boolean a(boolean z11, File file, String s11) {
        if (!z11) {
            return true;
        }
        if (!f64916a.matcher(s11).matches() && !f64917b.matcher(s11).matches()) {
            Intrinsics.f(s11, "s");
            if (!r70.j.A0(s11, "-wal", false) && !r70.j.A0(s11, "-shm", false) && !r70.j.A0(s11, "-journal", false)) {
                return true;
            }
        }
        return false;
    }
}
