package io.sentry;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.concurrent.Callable;

/* loaded from: classes4.dex */
public final class z2 {

    /* renamed from: d, reason: collision with root package name */
    public static final Charset f67944d = Charset.forName("UTF-8");

    /* renamed from: a, reason: collision with root package name */
    public final a3 f67945a;

    /* renamed from: b, reason: collision with root package name */
    public final Callable f67946b;

    /* renamed from: c, reason: collision with root package name */
    public byte[] f67947c;

    public z2(a3 a3Var, byte[] bArr) {
        this.f67945a = a3Var;
        this.f67947c = bArr;
        this.f67946b = null;
    }

    public static z2 a(p0 p0Var, io.sentry.clientreport.b bVar) {
        i30.j.Q(p0Var, "ISerializer is required.");
        io.sentry.internal.debugmeta.c cVar = new io.sentry.internal.debugmeta.c(new b.i(8, p0Var, bVar));
        return new z2(new a3(f3.resolve(bVar), new x2(cVar, 4), "application/json", (String) null, (String) null), new x2(cVar, 5));
    }

    public static z2 b(p0 p0Var, h4 h4Var) {
        i30.j.Q(p0Var, "ISerializer is required.");
        i30.j.Q(h4Var, "Session is required.");
        io.sentry.internal.debugmeta.c cVar = new io.sentry.internal.debugmeta.c(new b.i(6, p0Var, h4Var));
        return new z2(new a3(f3.Session, new x2(cVar, 6), "application/json", (String) null, (String) null), new x2(cVar, 7));
    }

    public final io.sentry.clientreport.b c(p0 p0Var) throws IOException {
        a3 a3Var = this.f67945a;
        if (a3Var == null || a3Var.f66743c != f3.ClientReport) {
            return null;
        }
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(d()), f67944d));
        try {
            io.sentry.clientreport.b bVar = (io.sentry.clientreport.b) p0Var.d(bufferedReader, io.sentry.clientreport.b.class);
            bufferedReader.close();
            return bVar;
        } catch (Throwable th2) {
            try {
                bufferedReader.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public final byte[] d() {
        Callable callable;
        if (this.f67947c == null && (callable = this.f67946b) != null) {
            this.f67947c = (byte[]) callable.call();
        }
        return this.f67947c;
    }

    public final io.sentry.protocol.b0 e(p0 p0Var) throws IOException {
        a3 a3Var = this.f67945a;
        if (a3Var == null || a3Var.f66743c != f3.Transaction) {
            return null;
        }
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(d()), f67944d));
        try {
            io.sentry.protocol.b0 b0Var = (io.sentry.protocol.b0) p0Var.d(bufferedReader, io.sentry.protocol.b0.class);
            bufferedReader.close();
            return b0Var;
        } catch (Throwable th2) {
            try {
                bufferedReader.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public z2(a3 a3Var, Callable callable) {
        this.f67945a = a3Var;
        this.f67946b = callable;
        this.f67947c = null;
    }
}
