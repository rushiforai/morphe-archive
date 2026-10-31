package x80;

import java.io.File;
import kotlin.Deprecated;
import kotlin.jvm.JvmName;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class k0 {

    @NotNull
    public static final j0 Companion = new j0();

    @JvmStatic
    @JvmName
    @NotNull
    public static final k0 create(@NotNull String str, @Nullable a0 a0Var) {
        Companion.getClass();
        return j0.a(str, a0Var);
    }

    public abstract long contentLength();

    public abstract a0 contentType();

    public boolean isDuplex() {
        return false;
    }

    public boolean isOneShot() {
        return false;
    }

    public abstract void writeTo(m90.h hVar);

    @Deprecated
    @JvmStatic
    @NotNull
    public static final k0 create(@Nullable a0 a0Var, @NotNull File file) {
        Companion.getClass();
        Intrinsics.g(file, "file");
        return new eb0.l0(a0Var, file, 1);
    }

    @Deprecated
    @JvmStatic
    @NotNull
    public static final k0 create(@Nullable a0 a0Var, @NotNull String content) {
        Companion.getClass();
        Intrinsics.g(content, "content");
        return j0.a(content, a0Var);
    }

    @Deprecated
    @JvmStatic
    @NotNull
    public static final k0 create(@Nullable a0 a0Var, @NotNull m90.j content) {
        Companion.getClass();
        Intrinsics.g(content, "content");
        return new eb0.l0(a0Var, content, 2);
    }

    @JvmStatic
    @NotNull
    @Deprecated
    @JvmOverloads
    public static final k0 create(@Nullable a0 a0Var, @NotNull byte[] content) {
        j0 j0Var = Companion;
        j0Var.getClass();
        Intrinsics.g(content, "content");
        return j0.c(j0Var, a0Var, content, 0, 12);
    }

    @JvmStatic
    @NotNull
    @Deprecated
    @JvmOverloads
    public static final k0 create(@Nullable a0 a0Var, @NotNull byte[] content, int i5) {
        j0 j0Var = Companion;
        j0Var.getClass();
        Intrinsics.g(content, "content");
        return j0.c(j0Var, a0Var, content, i5, 8);
    }

    @JvmStatic
    @JvmName
    @NotNull
    @JvmOverloads
    public static final k0 create(@NotNull byte[] bArr) {
        j0 j0Var = Companion;
        j0Var.getClass();
        Intrinsics.g(bArr, "<this>");
        return j0.d(j0Var, bArr, null, 0, 7);
    }

    @JvmStatic
    @JvmName
    @NotNull
    @JvmOverloads
    public static final k0 create(@NotNull byte[] bArr, @Nullable a0 a0Var) {
        j0 j0Var = Companion;
        j0Var.getClass();
        Intrinsics.g(bArr, "<this>");
        return j0.d(j0Var, bArr, a0Var, 0, 6);
    }

    @JvmStatic
    @JvmName
    @NotNull
    @JvmOverloads
    public static final k0 create(@NotNull byte[] bArr, @Nullable a0 a0Var, int i5) {
        j0 j0Var = Companion;
        j0Var.getClass();
        Intrinsics.g(bArr, "<this>");
        return j0.d(j0Var, bArr, a0Var, i5, 4);
    }

    @JvmStatic
    @JvmName
    @NotNull
    @JvmOverloads
    public static final k0 create(@NotNull byte[] bArr, @Nullable a0 a0Var, int i5, int i11) {
        Companion.getClass();
        return j0.b(a0Var, bArr, i5, i11);
    }

    @JvmStatic
    @JvmName
    @NotNull
    public static final k0 create(@NotNull m90.j jVar, @Nullable a0 a0Var) {
        Companion.getClass();
        Intrinsics.g(jVar, "<this>");
        return new eb0.l0(a0Var, jVar, 2);
    }

    @JvmStatic
    @JvmName
    @NotNull
    public static final k0 create(@NotNull File file, @Nullable a0 a0Var) {
        Companion.getClass();
        Intrinsics.g(file, "<this>");
        return new eb0.l0(a0Var, file, 1);
    }

    @JvmStatic
    @NotNull
    @Deprecated
    @JvmOverloads
    public static final k0 create(@Nullable a0 a0Var, @NotNull byte[] content, int i5, int i11) {
        Companion.getClass();
        Intrinsics.g(content, "content");
        return j0.b(a0Var, content, i5, i11);
    }
}
