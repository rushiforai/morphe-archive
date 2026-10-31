package x80;

import b.u4;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.nio.charset.Charset;
import kotlin.Deprecated;
import kotlin.io.CloseableKt;
import kotlin.jvm.JvmName;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class p0 implements Closeable {

    @NotNull
    public static final o0 Companion = new o0();

    @Nullable
    private Reader reader;

    @JvmStatic
    @JvmName
    @NotNull
    public static final p0 create(@NotNull String str, @Nullable a0 a0Var) {
        Companion.getClass();
        return o0.a(str, a0Var);
    }

    @NotNull
    public final InputStream byteStream() {
        return source().b0();
    }

    @NotNull
    public final m90.j byteString() throws IOException {
        long jContentLength = contentLength();
        if (jContentLength > 2147483647L) {
            throw new IOException(u4.g(jContentLength, "Cannot buffer entire body for content length: "));
        }
        m90.i iVarSource = source();
        try {
            m90.j jVarU = iVarSource.U();
            CloseableKt.a(iVarSource, null);
            int iC = jVarU.c();
            if (jContentLength == -1 || jContentLength == iC) {
                return jVarU;
            }
            throw new IOException("Content-Length (" + jContentLength + ") and stream length (" + iC + ") disagree");
        } finally {
        }
    }

    @NotNull
    public final byte[] bytes() throws IOException {
        long jContentLength = contentLength();
        if (jContentLength > 2147483647L) {
            throw new IOException(u4.g(jContentLength, "Cannot buffer entire body for content length: "));
        }
        m90.i iVarSource = source();
        try {
            byte[] bArrL = iVarSource.L();
            CloseableKt.a(iVarSource, null);
            int length = bArrL.length;
            if (jContentLength == -1 || jContentLength == length) {
                return bArrL;
            }
            throw new IOException("Content-Length (" + jContentLength + ") and stream length (" + length + ") disagree");
        } finally {
        }
    }

    @NotNull
    public final Reader charStream() {
        Charset charsetA;
        Reader n0Var = this.reader;
        if (n0Var == null) {
            m90.i iVarSource = source();
            a0 a0VarContentType = contentType();
            if (a0VarContentType == null || (charsetA = a0VarContentType.a(Charsets.f72000b)) == null) {
                charsetA = Charsets.f72000b;
            }
            n0Var = new n0(iVarSource, charsetA);
            this.reader = n0Var;
        }
        return n0Var;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        y80.c.c(source());
    }

    public abstract long contentLength();

    public abstract a0 contentType();

    public abstract m90.i source();

    @NotNull
    public final String string() throws IOException {
        Charset charsetA;
        m90.i iVarSource = source();
        try {
            m90.i iVar = iVarSource;
            a0 a0VarContentType = contentType();
            if (a0VarContentType == null || (charsetA = a0VarContentType.a(Charsets.f72000b)) == null) {
                charsetA = Charsets.f72000b;
            }
            String strQ = iVar.Q(y80.c.q(iVar, charsetA));
            CloseableKt.a(iVarSource, null);
            return strQ;
        } finally {
        }
    }

    @JvmStatic
    @JvmName
    @NotNull
    public static final p0 create(@NotNull m90.i iVar, @Nullable a0 a0Var, long j11) {
        Companion.getClass();
        return o0.b(iVar, a0Var, j11);
    }

    @Deprecated
    @JvmStatic
    @NotNull
    public static final p0 create(@Nullable a0 a0Var, long j11, @NotNull m90.i content) {
        Companion.getClass();
        Intrinsics.g(content, "content");
        return o0.b(content, a0Var, j11);
    }

    @Deprecated
    @JvmStatic
    @NotNull
    public static final p0 create(@Nullable a0 a0Var, @NotNull String content) {
        Companion.getClass();
        Intrinsics.g(content, "content");
        return o0.a(content, a0Var);
    }

    @Deprecated
    @JvmStatic
    @NotNull
    public static final p0 create(@Nullable a0 a0Var, @NotNull m90.j content) {
        Companion.getClass();
        Intrinsics.g(content, "content");
        m90.g gVar = new m90.g();
        gVar.f0(content);
        return o0.b(gVar, a0Var, content.c());
    }

    @Deprecated
    @JvmStatic
    @NotNull
    public static final p0 create(@Nullable a0 a0Var, @NotNull byte[] content) {
        Companion.getClass();
        Intrinsics.g(content, "content");
        return o0.c(content, a0Var);
    }

    @JvmStatic
    @JvmName
    @NotNull
    public static final p0 create(@NotNull byte[] bArr, @Nullable a0 a0Var) {
        Companion.getClass();
        return o0.c(bArr, a0Var);
    }

    @JvmStatic
    @JvmName
    @NotNull
    public static final p0 create(@NotNull m90.j jVar, @Nullable a0 a0Var) {
        Companion.getClass();
        Intrinsics.g(jVar, "<this>");
        m90.g gVar = new m90.g();
        gVar.f0(jVar);
        return o0.b(gVar, a0Var, jVar.c());
    }
}
