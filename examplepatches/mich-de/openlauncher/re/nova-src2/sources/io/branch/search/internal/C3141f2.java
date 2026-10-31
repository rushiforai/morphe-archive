package io.branch.search.internal;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.io.CloseableKt;
import kotlin.io.FilesKt;
import kotlin.io.TextStreamsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.f2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3141f2 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f64463a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64464b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Lazy f64465c;

    /* renamed from: io.branch.search.internal.f2$a */
    public static final class a {
    }

    /* renamed from: io.branch.search.internal.f2$b */
    public static final class b extends Lambda implements Function0<File> {
        public b() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            File filesDir = C3141f2.this.f64463a.f62438a.getFilesDir();
            Intrinsics.f(filesDir, "context.filesDir");
            File fileU0 = FilesKt.u0(filesDir, C3141f2.this.f64464b);
            if (!fileU0.exists()) {
                fileU0.mkdir();
            }
            return fileU0;
        }
    }

    public C3141f2(@NotNull F4 contextDelegate, @NotNull String subDir) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(subDir, "subDir");
        this.f64463a = contextDelegate;
        this.f64464b = subDir;
        this.f64465c = LazyKt.a(new b());
    }

    @NotNull
    public final File[] a() {
        Object objA;
        try {
            int i5 = Result.f71687b;
            objA = ((File) this.f64465c.getValue()).listFiles();
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        File[] fileArr = (File[]) objA;
        return fileArr == null ? new File[0] : fileArr;
    }

    @NotNull
    public final OutputStream b(@NotNull String name) {
        Intrinsics.g(name, "name");
        try {
            return new FileOutputStream(FilesKt.u0((File) this.f64465c.getValue(), name), true);
        } catch (Throwable unused) {
            return new ByteArrayOutputStream();
        }
    }

    @NotNull
    public static InputStreamReader a(@NotNull File file) {
        Intrinsics.g(file, "file");
        try {
            return new InputStreamReader(new FileInputStream(file));
        } catch (Throwable unused) {
            return new InputStreamReader(new ByteArrayInputStream(new byte[0]));
        }
    }

    @NotNull
    public final OutputStreamWriter a(@NotNull String name) {
        Intrinsics.g(name, "name");
        try {
            return new OutputStreamWriter(new FileOutputStream(FilesKt.u0((File) this.f64465c.getValue(), name)));
        } catch (Throwable unused) {
            return new OutputStreamWriter(new ByteArrayOutputStream());
        }
    }

    public static String a(File file, int i5) {
        InputStreamReader inputStreamReaderA = a(file);
        try {
            String strB = TextStreamsKt.b(new BufferedReader(inputStreamReaderA, i5));
            CloseableKt.a(inputStreamReaderA, null);
            return strB;
        } finally {
        }
    }

    @NotNull
    public final String a(@NotNull String name, int i5) {
        Intrinsics.g(name, "name");
        try {
            return a(FilesKt.u0((File) this.f64465c.getValue(), name), i5);
        } catch (Throwable unused) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    public final void a(@NotNull String name, @NotNull String content) {
        Intrinsics.g(name, "name");
        Intrinsics.g(content, "content");
        OutputStreamWriter outputStreamWriterA = a(name);
        try {
            outputStreamWriterA.write(content);
            Unit unit = Unit.f71706a;
            outputStreamWriterA.close();
        } finally {
        }
    }
}
