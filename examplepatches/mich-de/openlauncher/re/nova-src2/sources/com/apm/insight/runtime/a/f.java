package com.apm.insight.runtime.a;

import android.annotation.SuppressLint;
import android.content.Context;
import com.apm.insight.CrashType;
import com.apm.insight.entity.Header;
import com.apm.insight.runtime.a.c;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    @SuppressLint({"StaticFieldLeak"})
    private static volatile f f21860a;

    /* renamed from: b, reason: collision with root package name */
    private Context f21861b;

    /* renamed from: c, reason: collision with root package name */
    private Map<CrashType, c> f21862c = new HashMap();

    /* renamed from: d, reason: collision with root package name */
    private b f21863d;

    /* renamed from: e, reason: collision with root package name */
    private d f21864e;

    /* renamed from: com.apm.insight.runtime.a.f$1, reason: invalid class name */
    /* loaded from: classes2.dex */
    public static /* synthetic */ class AnonymousClass1 {

        /* renamed from: a, reason: collision with root package name */
        static final /* synthetic */ int[] f21865a;

        static {
            int[] iArr = new int[CrashType.values().length];
            f21865a = iArr;
            try {
                iArr[CrashType.JAVA.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                f21865a[CrashType.LAUNCH.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                f21865a[CrashType.NATIVE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                f21865a[CrashType.ANR.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                f21865a[CrashType.DART.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                f21865a[CrashType.CUSTOM_JAVA.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                f21865a[CrashType.BLOCK.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                f21865a[CrashType.ENSURE.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
        }
    }

    private f(Context context) {
        this.f21861b = context;
        try {
            this.f21863d = b.d();
            this.f21864e = new d(this.f21861b);
        } catch (Throwable th2) {
            com.apm.insight.c.a();
            com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
        }
    }

    public static f a() {
        if (f21860a == null) {
            Context contextG = com.apm.insight.e.g();
            if (contextG == null) {
                throw new IllegalArgumentException("NpthBus not init");
            }
            f21860a = new f(contextG);
        }
        return f21860a;
    }

    private c a(CrashType crashType) {
        c jVar = this.f21862c.get(crashType);
        if (jVar != null) {
            return jVar;
        }
        switch (AnonymousClass1.f21865a[crashType.ordinal()]) {
            case 1:
                jVar = new j(this.f21861b, this.f21863d, this.f21864e);
                break;
            case 2:
                jVar = new k(this.f21861b, this.f21863d, this.f21864e);
                break;
            case 3:
                jVar = new l(this.f21861b, this.f21863d, this.f21864e);
                break;
            case 4:
                jVar = new a(this.f21861b, this.f21863d, this.f21864e);
                break;
            case 5:
                jVar = new h(this.f21861b, this.f21863d, this.f21864e);
                break;
            case 6:
                jVar = new g(this.f21861b, this.f21863d, this.f21864e);
                break;
            case 7:
                jVar = new e(this.f21861b, this.f21863d, this.f21864e);
                break;
            case 8:
                jVar = new i(this.f21861b, this.f21863d, this.f21864e);
                break;
        }
        if (jVar != null) {
            this.f21862c.put(crashType, jVar);
        }
        return jVar;
    }

    public final com.apm.insight.entity.a a(CrashType crashType, c.a aVar) {
        c cVarA;
        if (crashType == null || (cVarA = a(crashType)) == null) {
            return null;
        }
        return cVarA.a(null, aVar, true);
    }

    public final com.apm.insight.entity.a a(CrashType crashType, com.apm.insight.entity.a aVar) {
        c cVarA;
        return (crashType == null || (cVarA = a(crashType)) == null) ? aVar : cVarA.a(aVar, null, false);
    }

    public final com.apm.insight.entity.a a(List<com.apm.insight.entity.a> list, JSONArray jSONArray) throws JSONException {
        if (list.isEmpty()) {
            return null;
        }
        com.apm.insight.entity.a aVar = new com.apm.insight.entity.a();
        JSONArray jSONArray2 = new JSONArray();
        Iterator<com.apm.insight.entity.a> it = list.iterator();
        while (it.hasNext()) {
            jSONArray2.put(it.next().c());
        }
        aVar.a("data", (Object) jSONArray2);
        aVar.a("all_data", (Object) jSONArray);
        Header headerA = Header.a(this.f21861b);
        Header.a(headerA);
        headerA.c();
        headerA.d();
        headerA.e();
        Header.b(headerA);
        aVar.a(headerA);
        return aVar;
    }
}
