package defpackage;

import android.util.Log;
import j$.util.Objects;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class h7e {
    public final mi2 a;
    public final String b;
    public final ceg c;
    public final Executor d;
    public String e;
    public u5e h;
    public Executor i;
    public boolean j;
    public int k;
    public final ArrayList f = new ArrayList();
    public final int g = 3;
    public final long l = -1;

    public h7e(String str, ceg cegVar, Executor executor, mi2 mi2Var) {
        Objects.requireNonNull(str, "URL is required.");
        this.b = str;
        this.c = cegVar;
        Objects.requireNonNull(executor, "Executor is required.");
        this.d = executor;
        this.a = mi2Var;
    }

    public final h7e a(String str, String str2) {
        Objects.requireNonNull(str, "Invalid header name.");
        Objects.requireNonNull(str2, "Invalid header value.");
        if ("Accept-Encoding".equalsIgnoreCase(str)) {
            if (Log.isLoggable("h7e", 3)) {
                Log.d("h7e", "It's not necessary to set Accept-Encoding on requests - cronet will do this automatically for you, and setting it yourself has no effect. See https://crbug.com/581399 for details.", new Exception());
            }
            return this;
        }
        this.f.add(new AbstractMap.SimpleEntry(str, str2));
        return this;
    }

    public final sgg b() {
        boolean z = this.j;
        int i = this.k;
        String str = this.e;
        if (str == null) {
            str = "GET";
        }
        return this.a.g0(this.b, this.c, this.d, this.g, z, i, this.l, str, this.f, this.h, this.i);
    }

    public final h7e c(u5e u5eVar, Executor executor) {
        this.h = u5eVar;
        Objects.requireNonNull(executor, "Invalid UploadDataProvider Executor.");
        this.i = executor;
        if (this.e == null) {
            this.e = "POST";
        }
        return this;
    }
}
