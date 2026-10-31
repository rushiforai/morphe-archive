package io.branch.search.internal;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Unit;
import kotlin.io.CloseableKt;
import kotlin.io.FilesKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class T implements S {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3141f2 f63363a;

    public T(@NotNull C3141f2 fileManager) {
        Intrinsics.g(fileManager, "fileManager");
        this.f63363a = fileManager;
    }

    @Override // io.branch.search.internal.S
    public final void a(@NotNull String key) {
        Intrinsics.g(key, "key");
        C3141f2 c3141f2 = this.f63363a;
        String name = key.concat(".txt");
        c3141f2.getClass();
        Intrinsics.g(name, "name");
        FilesKt.u0((File) c3141f2.f64465c.getValue(), name).delete();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public T(@NotNull F4 contextDelegate, @NotNull String suffix) {
        this(new C3141f2(contextDelegate, suffix.concat("_bnc_persisted_analytics_buffer")));
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(suffix, "suffix");
    }

    @Override // io.branch.search.internal.S
    public final void a(@NotNull ArrayList keys) {
        Intrinsics.g(keys, "keys");
        Iterator it = keys.iterator();
        while (it.hasNext()) {
            a((String) it.next());
        }
    }

    @Override // io.branch.search.internal.S
    public final void a(@NotNull String key, @NotNull Function1<? super String, Unit> handleLine) throws IOException {
        Intrinsics.g(key, "key");
        Intrinsics.g(handleLine, "handleLine");
        C3141f2 c3141f2 = this.f63363a;
        String name = key.concat(".txt");
        c3141f2.getClass();
        Intrinsics.g(name, "name");
        File fileU0 = FilesKt.u0((File) c3141f2.f64465c.getValue(), name);
        if (fileU0.exists()) {
            FilesKt.o0(fileU0, Charsets.f72000b, handleLine);
        }
    }

    @Override // io.branch.search.internal.S
    public final void a(@NotNull String key, @NotNull String content) {
        Intrinsics.g(key, "key");
        Intrinsics.g(content, "content");
        C3141f2 c3141f2 = this.f63363a;
        String name = key.concat(".txt");
        c3141f2.getClass();
        Intrinsics.g(name, "name");
        OutputStream outputStreamB = c3141f2.b(name);
        try {
            PrintWriter printWriter = new PrintWriter(outputStreamB);
            try {
                printWriter.println(content);
                Unit unit = Unit.f71706a;
                printWriter.close();
                CloseableKt.a(outputStreamB, null);
            } finally {
            }
        } finally {
        }
    }
}
