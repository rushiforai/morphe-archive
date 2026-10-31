package io.branch.search.internal;

import java.io.File;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class O6 implements W5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f63013a;

    public O6(@NotNull F4 contextDelegate) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        this.f63013a = contextDelegate;
    }

    public static long a(File file) {
        File[] fileArrListFiles = file.listFiles();
        long length = 0;
        if (fileArrListFiles != null) {
            for (File file2 : fileArrListFiles) {
                length += file2.isFile() ? file2.length() : a(file2);
            }
        }
        return length;
    }

    /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
        java.lang.NullPointerException
        */
    @Override // io.branch.search.internal.W5
    public final void a(@org.jetbrains.annotations.NotNull java.lang.String r24, @org.jetbrains.annotations.NotNull io.branch.search.internal.U5 r25) {
        /*
            Method dump skipped, instructions count: 373
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: io.branch.search.internal.O6.a(java.lang.String, io.branch.search.internal.U5):void");
    }

    @Override // io.branch.search.internal.W5
    @NotNull
    public final String a() {
        return "files_diagnostic";
    }
}
