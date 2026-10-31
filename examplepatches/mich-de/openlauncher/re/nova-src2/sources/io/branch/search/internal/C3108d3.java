package io.branch.search.internal;

import io.branch.search.internal.C3296o5;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.DeflaterInputStream;
import java.util.zip.InflaterInputStream;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.brotli.dec.BrotliInputStream;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.d3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3108d3 {
    @JvmStatic
    @NotNull
    public static final byte[] a(@NotNull byte[] input) throws Throwable {
        Intrinsics.g(input, "input");
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArr = new byte[1024];
        BrotliInputStream brotliInputStream = null;
        try {
            BrotliInputStream brotliInputStream2 = new BrotliInputStream(new ByteArrayInputStream(input));
            try {
                for (int i5 = brotliInputStream2.read(bArr); i5 > 0; i5 = brotliInputStream2.read(bArr)) {
                    byteArrayOutputStream.write(bArr, 0, i5);
                }
                brotliInputStream2.close();
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                Intrinsics.f(byteArray, "buffer.toByteArray()");
                return byteArray;
            } catch (IOException e3) {
                e = e3;
                brotliInputStream = brotliInputStream2;
                if (brotliInputStream != null) {
                    brotliInputStream.close();
                }
                C3296o5.a("Branchzip.brotliUnzip", e, "Exception brotli-unzipping network response.");
                throw e;
            } catch (Throwable th2) {
                th = th2;
                brotliInputStream = brotliInputStream2;
                if (brotliInputStream != null) {
                    brotliInputStream.close();
                }
                throw th;
            }
        } catch (IOException e11) {
            e = e11;
        } catch (Throwable th3) {
            th = th3;
        }
    }

    @NotNull
    public static byte[] b(@NotNull byte[] input) throws IOException {
        Intrinsics.g(input, "input");
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(input);
        try {
            InflaterInputStream inflaterInputStream = new InflaterInputStream(byteArrayInputStream);
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                byte[] bArr = new byte[1024];
                try {
                    for (int i5 = inflaterInputStream.read(bArr, 0, 1024); i5 != -1; i5 = inflaterInputStream.read(bArr, 0, 1024)) {
                        byteArrayOutputStream.write(bArr, 0, i5);
                    }
                    inflaterInputStream.close();
                    byteArrayOutputStream.flush();
                    byte[] byteArray = byteArrayOutputStream.toByteArray();
                    Intrinsics.f(byteArray, "buffer.toByteArray()");
                    inflaterInputStream.close();
                    byteArrayInputStream.close();
                    return byteArray;
                } catch (IOException e3) {
                    inflaterInputStream.close();
                    C3296o5.a aVar = C3296o5.f65426a;
                    C3296o5.a(new F6("Branchzip.unzip", "Exception unzipping network response.", null, e3, null));
                    throw e3;
                } catch (Throwable th2) {
                    inflaterInputStream.close();
                    throw th2;
                }
            } finally {
            }
        } finally {
        }
    }

    @NotNull
    public static byte[] c(@NotNull byte[] input) throws IOException {
        Intrinsics.g(input, "input");
        DeflaterInputStream deflaterInputStream = new DeflaterInputStream(new ByteArrayInputStream(input));
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArr = new byte[1024];
        try {
            for (int i5 = deflaterInputStream.read(bArr, 0, 1024); i5 != -1; i5 = deflaterInputStream.read(bArr, 0, 1024)) {
                byteArrayOutputStream.write(bArr, 0, i5);
            }
            deflaterInputStream.close();
            byteArrayOutputStream.flush();
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            Intrinsics.f(byteArray, "buffer.toByteArray()");
            return byteArray;
        } catch (IOException e3) {
            deflaterInputStream.close();
            C3296o5.a aVar = C3296o5.f65426a;
            C3296o5.a(new F6("Branchzip.zip", "Exception zipping network response", null, e3, null));
            throw e3;
        } catch (Throwable th2) {
            deflaterInputStream.close();
            throw th2;
        }
    }
}
