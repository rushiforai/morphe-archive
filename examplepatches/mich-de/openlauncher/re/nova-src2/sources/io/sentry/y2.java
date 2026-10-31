package io.sentry;

import io.sentry.exception.SentryEnvelopeException;
import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.List;
import java.util.concurrent.Callable;

/* loaded from: classes4.dex */
public final /* synthetic */ class y2 implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67914a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f67915b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p0 f67916c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f67917d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f67918e;

    public /* synthetic */ y2(a aVar, long j11, p0 p0Var, ILogger iLogger) {
        this.f67917d = aVar;
        this.f67915b = j11;
        this.f67916c = p0Var;
        this.f67918e = iLogger;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() throws SentryEnvelopeException, IOException {
        ByteArrayOutputStream byteArrayOutputStream;
        BufferedWriter bufferedWriter;
        int i5 = this.f67914a;
        p0 p0Var = this.f67916c;
        Object obj = this.f67918e;
        long j11 = this.f67915b;
        Object obj2 = this.f67917d;
        switch (i5) {
            case 0:
                a aVar = (a) obj2;
                ILogger iLogger = (ILogger) obj;
                byte[] byteArray = aVar.f66728a;
                String str = aVar.f66730c;
                if (byteArray == null) {
                    io.sentry.protocol.g0 g0Var = aVar.f66729b;
                    if (g0Var != null) {
                        Charset charset = io.sentry.util.a.f67825a;
                        try {
                            byteArrayOutputStream = new ByteArrayOutputStream();
                            try {
                                bufferedWriter = new BufferedWriter(new OutputStreamWriter(byteArrayOutputStream, io.sentry.util.a.f67825a));
                            } finally {
                            }
                        } catch (Throwable th2) {
                            iLogger.e(g3.ERROR, "Could not serialize serializable", th2);
                            byteArray = null;
                        }
                        try {
                            p0Var.e(g0Var, bufferedWriter);
                            byteArray = byteArrayOutputStream.toByteArray();
                            bufferedWriter.close();
                            byteArrayOutputStream.close();
                            if (byteArray != null) {
                                long length = byteArray.length;
                                if (length > j11) {
                                    throw new SentryEnvelopeException(String.format("Dropping attachment with filename '%s', because the size of the passed bytes with %d bytes is bigger than the maximum allowed attachment size of %d bytes.", str, Long.valueOf(length), Long.valueOf(j11)));
                                }
                            }
                        } finally {
                        }
                    }
                    throw new SentryEnvelopeException(b.c0.l("Couldn't attach the attachment ", str, ".\nPlease check that either bytes, serializable or a path is set."));
                }
                long length2 = byteArray.length;
                if (length2 > j11) {
                    throw new SentryEnvelopeException(String.format("Dropping attachment with filename '%s', because the size of the passed bytes with %d bytes is bigger than the maximum allowed attachment size of %d bytes.", str, Long.valueOf(length2), Long.valueOf(j11)));
                }
                return byteArray;
            default:
                File file = (File) obj2;
                c2 c2Var = (c2) obj;
                if (!file.exists()) {
                    throw new SentryEnvelopeException(b.c0.l("Dropping profiling trace data, because the file '", file.getName(), "' doesn't exists"));
                }
                String path = file.getPath();
                File file2 = new File(path);
                if (!file2.exists()) {
                    throw new IOException(b.c0.l("File '", file2.getName(), "' doesn't exists"));
                }
                if (!file2.isFile()) {
                    throw new IOException(b.c0.l("Reading path ", path, " failed, because it's not a file."));
                }
                if (!file2.canRead()) {
                    throw new IOException(b.c0.l("Reading the item ", path, " failed, because can't read the file."));
                }
                if (file2.length() > j11) {
                    throw new IOException(String.format("Reading file failed, because size located at '%s' with %d bytes is bigger than the maximum allowed size of %d bytes.", path, Long.valueOf(file2.length()), Long.valueOf(j11)));
                }
                FileInputStream fileInputStream = new FileInputStream(path);
                try {
                    BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
                    try {
                        ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream();
                        try {
                            byte[] bArr = new byte[1024];
                            while (true) {
                                int i11 = bufferedInputStream.read(bArr);
                                if (i11 == -1) {
                                    byte[] byteArray2 = byteArrayOutputStream2.toByteArray();
                                    byteArrayOutputStream2.close();
                                    bufferedInputStream.close();
                                    fileInputStream.close();
                                    try {
                                        String str2 = new String(io.sentry.vendor.a.a(byteArray2), "US-ASCII");
                                        if (str2.isEmpty()) {
                                            throw new SentryEnvelopeException("Profiling trace file is empty");
                                        }
                                        c2Var.B = str2;
                                        try {
                                            c2Var.f67140l = (List) c2Var.f67130b.call();
                                        } catch (Throwable unused) {
                                        }
                                        try {
                                            try {
                                                ByteArrayOutputStream byteArrayOutputStream3 = new ByteArrayOutputStream();
                                                try {
                                                    BufferedWriter bufferedWriter2 = new BufferedWriter(new OutputStreamWriter(byteArrayOutputStream3, z2.f67944d));
                                                    try {
                                                        p0Var.e(c2Var, bufferedWriter2);
                                                        byte[] byteArray3 = byteArrayOutputStream3.toByteArray();
                                                        bufferedWriter2.close();
                                                        byteArrayOutputStream3.close();
                                                        return byteArray3;
                                                    } finally {
                                                    }
                                                } catch (Throwable th3) {
                                                    try {
                                                        byteArrayOutputStream3.close();
                                                    } catch (Throwable th4) {
                                                        th3.addSuppressed(th4);
                                                    }
                                                    throw th3;
                                                }
                                            } catch (IOException e3) {
                                                throw new SentryEnvelopeException("Failed to serialize profiling trace data\n" + e3.getMessage());
                                            }
                                        } finally {
                                            file.delete();
                                        }
                                    } catch (UnsupportedEncodingException e11) {
                                        throw new AssertionError(e11);
                                    }
                                }
                                byteArrayOutputStream2.write(bArr, 0, i11);
                            }
                        } finally {
                        }
                    } finally {
                    }
                } catch (Throwable th5) {
                    try {
                        fileInputStream.close();
                    } catch (Throwable th6) {
                        th5.addSuppressed(th6);
                    }
                    throw th5;
                }
        }
    }

    public /* synthetic */ y2(File file, long j11, c2 c2Var, p0 p0Var) {
        this.f67917d = file;
        this.f67915b = j11;
        this.f67918e = c2Var;
        this.f67916c = p0Var;
    }
}
