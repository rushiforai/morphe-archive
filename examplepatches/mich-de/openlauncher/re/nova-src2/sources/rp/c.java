package rp;

import java.util.ArrayList;
import java.util.HashMap;
import sp.r0;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f86132a;

    /* renamed from: b, reason: collision with root package name */
    public final String f86133b;

    /* renamed from: c, reason: collision with root package name */
    public String f86134c;

    /* renamed from: d, reason: collision with root package name */
    public HashMap f86135d = new HashMap();

    /* renamed from: e, reason: collision with root package name */
    public long f86136e = 60;

    /* renamed from: f, reason: collision with root package name */
    public int f86137f = 6;

    /* renamed from: g, reason: collision with root package name */
    public ArrayList f86138g = new ArrayList();

    /* renamed from: h, reason: collision with root package name */
    public ArrayList f86139h = new ArrayList();

    /* renamed from: i, reason: collision with root package name */
    public ArrayList f86140i = new ArrayList();

    /* renamed from: j, reason: collision with root package name */
    public Boolean f86141j = Boolean.FALSE;

    public c(String str, String str2) {
        if (r0.l(str)) {
            throw new IllegalArgumentException("apiKey can not be null or empty");
        }
        if (r0.l(str2)) {
            throw new IllegalArgumentException("secret can not be null or empty");
        }
        this.f86132a = str;
        this.f86133b = str2;
    }

    public static c a(c cVar) {
        String strR = cVar.f86132a;
        String strR2 = cVar.f86133b;
        if (!strR.endsWith("_sl") && !strR2.endsWith("_sl")) {
            return cVar;
        }
        if (strR.endsWith("_sl")) {
            strR = r0.r(r0.b(strR));
        }
        if (strR2.endsWith("_sl")) {
            strR2 = r0.r(r0.b(strR2));
        }
        c cVar2 = new c(strR, strR2);
        cVar2.f86134c = cVar.f86134c;
        cVar2.f86135d = cVar.f86135d;
        cVar2.f86136e = cVar.f86136e;
        cVar2.f86137f = cVar.f86137f;
        cVar2.f86138g = cVar.f86138g;
        cVar2.f86139h = cVar.f86139h;
        cVar2.f86141j = cVar.f86141j;
        cVar2.f86140i = cVar.f86140i;
        return cVar2;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("apiKey='");
        sb2.append(this.f86132a);
        sb2.append("', secret='");
        sb2.append(this.f86133b);
        sb2.append('\'');
        sb2.append(", logging='false', logLevel='");
        return a2.c.m(sb2, this.f86137f, '\'');
    }
}
