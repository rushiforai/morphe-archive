package com.apm.insight.k;

import android.content.Context;
import android.text.TextUtils;
import com.apm.insight.CrashType;
import com.apm.insight.Npth;
import com.apm.insight.entity.Header;
import com.apm.insight.entity.b;
import com.apm.insight.k.c;
import com.apm.insight.l.n;
import com.apm.insight.nativecrash.NativeImpl;
import com.apm.insight.runtime.m;
import com.apm.insight.runtime.o;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    private static volatile b f21660b;

    /* renamed from: a, reason: collision with root package name */
    private Context f21661a;

    /* renamed from: f, reason: collision with root package name */
    private C0007b f21665f;

    /* renamed from: g, reason: collision with root package name */
    private HashMap<String, C0007b> f21666g;

    /* renamed from: c, reason: collision with root package name */
    private List<File> f21662c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    private List<File> f21663d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    private int f21664e = -1;

    /* renamed from: h, reason: collision with root package name */
    private volatile boolean f21667h = false;

    /* renamed from: i, reason: collision with root package name */
    private Runnable f21668i = new Runnable() { // from class: com.apm.insight.k.b.1
        @Override // java.lang.Runnable
        public final void run() throws Throwable {
            b.this.f();
        }
    };

    /* renamed from: j, reason: collision with root package name */
    private Runnable f21669j = new Runnable() { // from class: com.apm.insight.k.b.2
        @Override // java.lang.Runnable
        public final void run() throws Throwable {
            b.this.d();
        }
    };

    /* renamed from: com.apm.insight.k.b$b, reason: collision with other inner class name */
    public static class C0007b {

        /* renamed from: a, reason: collision with root package name */
        String f21684a;

        /* renamed from: d, reason: collision with root package name */
        a f21687d;

        /* renamed from: e, reason: collision with root package name */
        a f21688e;

        /* renamed from: b, reason: collision with root package name */
        List<a> f21685b = new ArrayList();

        /* renamed from: c, reason: collision with root package name */
        List<a> f21686c = new ArrayList();

        /* renamed from: f, reason: collision with root package name */
        boolean f21689f = false;

        /* renamed from: g, reason: collision with root package name */
        int f21690g = 0;

        public C0007b(String str) {
            this.f21684a = str;
        }
    }

    private b(Context context) {
        this.f21661a = context;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void d() throws Throwable {
        if (this.f21667h || this.f21666g == null) {
            return;
        }
        if (!com.apm.insight.l.k.b(this.f21661a)) {
            e();
        }
        if (this.f21664e == -1) {
            if (com.apm.insight.runtime.a.a() && com.apm.insight.runtime.a.f()) {
                this.f21664e = 1;
            } else {
                this.f21664e = 0;
            }
        }
        boolean z11 = this.f21664e == 1;
        com.apm.insight.runtime.f fVar = new com.apm.insight.runtime.f(this.f21661a);
        Iterator<C0007b> it = this.f21666g.values().iterator();
        while (it.hasNext()) {
            b(it.next(), z11, fVar);
        }
        Iterator<C0007b> it2 = this.f21666g.values().iterator();
        while (it2.hasNext()) {
            a(it2.next(), z11, fVar);
        }
        Iterator<C0007b> it3 = this.f21666g.values().iterator();
        while (it3.hasNext()) {
            com.apm.insight.l.f.a(com.apm.insight.l.j.a(this.f21661a, it3.next().f21684a));
        }
        fVar.a();
        com.apm.insight.runtime.b.a();
        e();
    }

    private void e() {
        this.f21667h = true;
        this.f21666g = null;
        NativeImpl.j();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void f() throws Throwable {
        if (this.f21667h) {
            return;
        }
        if (!com.apm.insight.l.k.b(this.f21661a) || (System.currentTimeMillis() - com.apm.insight.e.j() <= 5000 && com.apm.insight.e.i().isApmExists() && !Npth.hasCrash())) {
            m.a().a(this.f21668i, 5000L);
        } else {
            d();
        }
    }

    private void g() {
        File[] fileArrListFiles = com.apm.insight.l.j.i(this.f21661a).listFiles();
        if (fileArrListFiles == null) {
            return;
        }
        for (int i5 = 0; i5 < fileArrListFiles.length && i5 < 5; i5++) {
            File file = fileArrListFiles[i5];
            if (file.getName().endsWith(".atmp")) {
                com.apm.insight.a.a.a();
                file.getAbsolutePath();
            } else {
                try {
                    com.apm.insight.f.b bVarC = com.apm.insight.l.f.c(file.getAbsolutePath());
                    if (bVarC != null) {
                        if (bVarC.b() != null) {
                            bVarC.b().put("upload_scene", "launch_scan");
                        }
                        if (e.a(e.d(), bVarC.e(), bVarC.d(), bVarC.f(), bVarC.g())) {
                            com.apm.insight.l.f.a(file);
                            String strC = bVarC.c();
                            if (!TextUtils.isEmpty(strC)) {
                                com.apm.insight.l.f.a(new File(strC));
                            }
                        }
                    } else {
                        com.apm.insight.l.f.a(file);
                    }
                } catch (Throwable th2) {
                    com.apm.insight.c.a();
                    com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
                }
            }
        }
    }

    public static b a() {
        if (f21660b == null) {
            synchronized (b.class) {
                try {
                    if (f21660b == null) {
                        f21660b = new b(com.apm.insight.e.g());
                    }
                } finally {
                }
            }
        }
        return f21660b;
    }

    public final void b() {
        try {
            if (!this.f21667h && com.apm.insight.l.a.b(com.apm.insight.e.g())) {
                m.a().a(this.f21669j);
            }
        } catch (Throwable unused) {
        }
    }

    public final boolean c() {
        return this.f21667h;
    }

    private void b(HashMap<String, C0007b> map) {
        File[] fileArrListFiles = com.apm.insight.l.j.d(this.f21661a).listFiles();
        if (fileArrListFiles == null || fileArrListFiles.length == 0) {
            return;
        }
        for (int i5 = 0; i5 < fileArrListFiles.length && i5 < 5; i5++) {
            File file = fileArrListFiles[i5];
            try {
                if (!file.isDirectory()) {
                    com.apm.insight.l.f.a(file);
                } else if (file.getName().endsWith("G")) {
                    String name = file.getName();
                    C0007b c0007b = map.get(name);
                    if (c0007b == null) {
                        c0007b = new C0007b(name);
                        map.put(name, c0007b);
                    }
                    c0007b.f21686c.add(new a(file, CrashType.NATIVE));
                } else {
                    com.apm.insight.l.f.a(file);
                }
            } catch (Throwable th2) {
                com.apm.insight.c.a();
                com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
                com.apm.insight.l.f.a(file);
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class a {

        /* renamed from: a, reason: collision with root package name */
        File f21679a;

        /* renamed from: b, reason: collision with root package name */
        long f21680b;

        /* renamed from: c, reason: collision with root package name */
        long f21681c;

        /* renamed from: d, reason: collision with root package name */
        CrashType f21682d;

        /* renamed from: e, reason: collision with root package name */
        String f21683e;

        public a(File file, CrashType crashType) {
            this.f21680b = -1L;
            this.f21681c = -1L;
            this.f21679a = file;
            this.f21682d = crashType;
            this.f21683e = file.getName();
        }

        public a(File file, long j11, CrashType crashType) {
            this.f21681c = -1L;
            this.f21679a = file;
            this.f21680b = j11;
            this.f21682d = crashType;
            this.f21683e = file.getName();
        }
    }

    public final void a(boolean z11) throws Throwable {
        if (!Npth.isStopUpload() && z11) {
            if (this.f21665f == null) {
                this.f21665f = new C0007b("old_uuid");
                HashMap<String, C0007b> map = new HashMap<>();
                this.f21666g = map;
                a(map);
                a(this.f21666g, this.f21665f);
                com.apm.insight.l.f.a(com.apm.insight.l.j.b(this.f21661a));
                b(this.f21666g);
                b(this.f21665f, true, null);
                a(this.f21665f, true, null);
                this.f21665f = null;
                if (this.f21666g.isEmpty()) {
                    e();
                } else {
                    f();
                }
            }
            g();
            com.apm.insight.a.c();
        }
    }

    private void b(final C0007b c0007b, boolean z11, com.apm.insight.runtime.f fVar) {
        boolean z12;
        JSONObject jSONObjectA;
        if (c0007b.f21686c.size() <= 1 && c0007b.f21686c.isEmpty()) {
            c0007b.f21688e = c0007b.f21687d;
            return;
        }
        boolean zB = com.apm.insight.l.k.b(this.f21661a);
        c0007b.f21688e = c0007b.f21687d;
        com.apm.insight.nativecrash.a aVar = new com.apm.insight.nativecrash.a(this.f21661a);
        for (a aVar2 : c0007b.f21686c) {
            final File file = aVar2.f21679a;
            try {
                aVar.a(file);
                jSONObjectA = a(aVar);
            } catch (Throwable th2) {
                th = th2;
                z12 = zB;
            }
            if (jSONObjectA != null && jSONObjectA.length() != 0) {
                if (jSONObjectA.length() != 0) {
                    if (!z11) {
                        long jOptLong = jSONObjectA.optLong("crash_time");
                        try {
                            a aVar3 = c0007b.f21688e;
                            if (aVar3 == null) {
                                c0007b.f21688e = aVar2;
                                c0007b.f21689f = true;
                                if (fVar == null || fVar.a(CarrierConfigurator.APN_TYPE)) {
                                    z12 = zB;
                                } else {
                                    aVar.i();
                                }
                            } else {
                                z12 = zB;
                                try {
                                    if (!c0007b.f21689f && jOptLong < aVar3.f21680b) {
                                        c0007b.f21688e = aVar2;
                                        if (fVar != null && !fVar.a(CarrierConfigurator.APN_TYPE)) {
                                            aVar.i();
                                            zB = z12;
                                        } else {
                                            a(file);
                                            c0007b.f21689f = true;
                                        }
                                    } else {
                                        com.apm.insight.entity.a.a(jSONObjectA, "filters", "aid", String.valueOf(jSONObjectA.optJSONObject("header").opt("aid")));
                                        jSONObjectA.optJSONObject("header").put("aid", 2010);
                                    }
                                } catch (Throwable th3) {
                                    th = th3;
                                    com.apm.insight.c.a();
                                    com.apm.insight.runtime.j.a(th, "NPTH_CATCH");
                                    com.apm.insight.l.f.a(file);
                                    zB = z12;
                                }
                            }
                        } catch (Throwable th4) {
                            th = th4;
                            z12 = zB;
                        }
                    } else {
                        z12 = zB;
                        if (fVar != null && !fVar.a(CarrierConfigurator.APN_TYPE)) {
                            aVar.i();
                        }
                    }
                    com.apm.insight.entity.a.a(jSONObjectA, "filters", "start_uuid", c0007b.f21684a);
                    com.apm.insight.entity.a.a(jSONObjectA, "filters", "crash_thread_name", jSONObjectA.optString("crash_thread_name", "unknown"));
                    if (z12) {
                        try {
                            c.a aVar4 = new c.a(jSONObjectA, CrashType.NATIVE);
                            com.apm.insight.entity.b.a(jSONObjectA, com.apm.insight.entity.b.a(aVar4.c(), aVar4.a(), o.a().b(aVar4.b() == -1 ? System.currentTimeMillis() : aVar4.b())), new b.a() { // from class: com.apm.insight.k.b.4
                                @Override // com.apm.insight.entity.b.a
                                public final void a(JSONObject jSONObject) {
                                    d.a();
                                    d.a(jSONObject, file, com.apm.insight.l.j.a(b.this.f21661a, c0007b.f21684a));
                                }
                            });
                            if (!aVar.i()) {
                                aVar.f();
                            }
                        } catch (Throwable th5) {
                            th = th5;
                            com.apm.insight.c.a();
                            com.apm.insight.runtime.j.a(th, "NPTH_CATCH");
                            com.apm.insight.l.f.a(file);
                            zB = z12;
                        }
                    }
                    c.a(CrashType.NATIVE, jSONObjectA);
                } else {
                    z12 = zB;
                }
                zB = z12;
            } else {
                z12 = zB;
                aVar.i();
                zB = z12;
            }
        }
    }

    private void a(HashMap<String, C0007b> map) {
        File[] fileArrListFiles = com.apm.insight.l.j.f(this.f21661a).listFiles();
        if (fileArrListFiles == null || fileArrListFiles.length == 0) {
            return;
        }
        for (int i5 = 0; i5 < fileArrListFiles.length && i5 < 5; i5++) {
            File file = fileArrListFiles[i5];
            try {
                if (!file.isDirectory()) {
                    com.apm.insight.l.f.a(file);
                } else if (file.getName().endsWith("G")) {
                    String name = file.getName();
                    C0007b c0007b = map.get(name);
                    if (c0007b == null) {
                        c0007b = new C0007b(name);
                        map.put(name, c0007b);
                    }
                    JSONArray jSONArrayA = com.apm.insight.nativecrash.b.a(com.apm.insight.l.j.l(file), com.apm.insight.l.j.m(file));
                    int length = jSONArrayA.length();
                    c0007b.f21690g = length;
                    if (length > 0) {
                        try {
                            com.apm.insight.l.f.a(com.apm.insight.l.j.n(file), jSONArrayA);
                        } catch (Throwable unused) {
                        }
                    }
                } else {
                    com.apm.insight.l.f.a(file);
                }
            } catch (Throwable th2) {
                com.apm.insight.c.a();
                com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
                com.apm.insight.l.f.a(file);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00c9  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00d2 A[Catch: all -> 0x0037, TryCatch #1 {all -> 0x0037, blocks: (B:9:0x0024, B:11:0x0032, B:14:0x003a, B:17:0x0042, B:20:0x0052, B:22:0x0058, B:23:0x005d, B:25:0x0069, B:27:0x0074, B:31:0x008e, B:48:0x00ca, B:50:0x00d2, B:51:0x00da, B:53:0x00e5, B:61:0x00fd, B:56:0x00ef, B:58:0x00f3, B:60:0x00fb, B:38:0x00a8, B:40:0x00b0, B:41:0x00b3, B:43:0x00bb, B:44:0x00be, B:46:0x00c6, B:62:0x0103, B:63:0x0120, B:29:0x0080), top: B:70:0x0024, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00e5 A[Catch: all -> 0x0037, TryCatch #1 {all -> 0x0037, blocks: (B:9:0x0024, B:11:0x0032, B:14:0x003a, B:17:0x0042, B:20:0x0052, B:22:0x0058, B:23:0x005d, B:25:0x0069, B:27:0x0074, B:31:0x008e, B:48:0x00ca, B:50:0x00d2, B:51:0x00da, B:53:0x00e5, B:61:0x00fd, B:56:0x00ef, B:58:0x00f3, B:60:0x00fb, B:38:0x00a8, B:40:0x00b0, B:41:0x00b3, B:43:0x00bb, B:44:0x00be, B:46:0x00c6, B:62:0x0103, B:63:0x0120, B:29:0x0080), top: B:70:0x0024, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00ed A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void a(HashMap<String, C0007b> map, C0007b c0007b) {
        CrashType crashType;
        C0007b c0007b2;
        a aVar;
        a aVar2;
        File[] fileArrListFiles = com.apm.insight.l.j.a(this.f21661a).listFiles();
        if (fileArrListFiles == null) {
            return;
        }
        Arrays.sort(fileArrListFiles, Collections.reverseOrder());
        char c11 = 0;
        int i5 = 0;
        while (i5 < fileArrListFiles.length) {
            File file = fileArrListFiles[i5];
            try {
                if (com.apm.insight.e.a.a().a(file.getAbsolutePath())) {
                    com.apm.insight.l.f.a(file);
                } else if (!com.apm.insight.l.f.e(file) && !com.apm.insight.g.a.a().b(file.getName())) {
                    if (file.isFile()) {
                        com.apm.insight.l.f.a(file);
                    } else {
                        String name = file.getName();
                        if (name.endsWith("G")) {
                            String[] strArrSplit = name.split("_");
                            if (strArrSplit.length < 5) {
                                c0007b.f21685b.add(new a(file, null));
                            } else {
                                try {
                                    long j11 = Long.parseLong(strArrSplit[c11]);
                                    long j12 = Long.parseLong(strArrSplit[4]);
                                    String str = strArrSplit[2];
                                    String str2 = strArrSplit[1];
                                    int iHashCode = str2.hashCode();
                                    if (iHashCode == -1109843021) {
                                        if (str2.equals("launch")) {
                                            crashType = CrashType.LAUNCH;
                                        }
                                        c0007b2 = map.get(str);
                                        if (c0007b2 == null) {
                                        }
                                        aVar = new a(file, j11, crashType);
                                        aVar.f21681c = j12;
                                        aVar2 = c0007b2.f21687d;
                                        if (aVar2 == null) {
                                        }
                                    } else if (iHashCode != 96741) {
                                        crashType = (iHashCode == 3254818 && str2.equals("java")) ? CrashType.JAVA : null;
                                        c0007b2 = map.get(str);
                                        if (c0007b2 == null) {
                                            c0007b2 = new C0007b(str);
                                            map.put(str, c0007b2);
                                        }
                                        aVar = new a(file, j11, crashType);
                                        aVar.f21681c = j12;
                                        aVar2 = c0007b2.f21687d;
                                        if ((aVar2 == null || aVar2.f21680b > aVar.f21680b) && crashType != null && crashType != CrashType.ANR && !name.contains("ignore")) {
                                            c0007b2.f21687d = aVar;
                                        }
                                        c0007b2.f21685b.add(aVar);
                                    } else {
                                        if (str2.equals("anr")) {
                                            crashType = CrashType.ANR;
                                        }
                                        c0007b2 = map.get(str);
                                        if (c0007b2 == null) {
                                        }
                                        aVar = new a(file, j11, crashType);
                                        aVar.f21681c = j12;
                                        aVar2 = c0007b2.f21687d;
                                        if (aVar2 == null) {
                                            c0007b2.f21687d = aVar;
                                            c0007b2.f21685b.add(aVar);
                                        } else {
                                            c0007b2.f21687d = aVar;
                                            c0007b2.f21685b.add(aVar);
                                        }
                                    }
                                } catch (Throwable unused) {
                                    c0007b.f21685b.add(new a(file, null));
                                    com.apm.insight.c.a();
                                    com.apm.insight.runtime.j.a(new RuntimeException("err format crashTime:".concat(name)), "NPTH_CATCH");
                                }
                            }
                        } else {
                            com.apm.insight.l.f.a(file);
                        }
                    }
                }
            } catch (Throwable th2) {
                com.apm.insight.c.a();
                com.apm.insight.runtime.j.a(th2, "NPTH_CATCH");
            }
            i5++;
            c11 = 0;
        }
    }

    private static JSONObject a(com.apm.insight.nativecrash.a aVar) {
        JSONObject jSONObjectB = aVar.b();
        if (jSONObjectB != null && jSONObjectB.length() != 0) {
            return jSONObjectB;
        }
        if (com.apm.insight.e.d()) {
            aVar.j();
        }
        if (!aVar.a()) {
            aVar.i();
            return null;
        }
        if (!aVar.d()) {
            aVar.i();
            return null;
        }
        if (aVar.e()) {
            aVar.i();
            return null;
        }
        aVar.c();
        return aVar.h();
    }

    /* JADX WARN: Can't wrap try/catch for region: R(13:(5:97|38|39|(1:41)(1:43)|44)|(18:46|89|47|(1:49)|91|55|56|87|57|70|71|93|72|(1:74)|75|78|69|113)(1:52)|53|(5:91|55|56|87|57)(4:64|(0)(1:68)|69|113)|70|71|93|72|(0)|75|78|69|113) */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0166, code lost:
    
        r0 = th;
     */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0154 A[Catch: all -> 0x0166, TryCatch #4 {all -> 0x0166, blocks: (B:72:0x0148, B:74:0x0154, B:78:0x0168), top: B:93:0x0148 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void a(final C0007b c0007b, boolean z11, com.apm.insight.runtime.f fVar) {
        Iterator<a> it;
        final File file;
        CrashType crashType;
        final com.apm.insight.f.b bVarA;
        JSONArray jSONArray;
        JSONObject jSONObjectOptJSONObject;
        CrashType crashType2;
        if (!c0007b.f21685b.isEmpty()) {
            if (c0007b.f21688e == null) {
                c0007b.f21688e = c0007b.f21687d;
            }
            Iterator<a> it2 = c0007b.f21685b.iterator();
            while (it2.hasNext()) {
                a next = it2.next();
                try {
                    file = next.f21679a;
                    crashType = next.f21682d;
                    try {
                        bVarA = a(file, crashType, c0007b.f21684a, next.f21680b, next.f21681c);
                    } catch (Throwable th2) {
                        th = th2;
                        it = it2;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    it = it2;
                }
                if (bVarA == null) {
                    com.apm.insight.l.f.a(file);
                } else {
                    JSONObject jSONObjectB = bVarA.b();
                    if (jSONObjectB == null) {
                        com.apm.insight.l.f.a(file);
                    } else {
                        JSONObject jSONObjectOptJSONObject2 = jSONObjectB.optJSONObject("header");
                        if (jSONObjectOptJSONObject2 == null) {
                            com.apm.insight.l.f.a(file);
                        } else if (crashType == null && (new File(file, file.getName()).exists() || file.getName().split("_").length < 5)) {
                            if (e.b(bVarA.a(), jSONObjectB.toString()).a()) {
                                com.apm.insight.l.f.a(file);
                            }
                        } else {
                            File fileA = com.apm.insight.entity.b.a(file);
                            if (!fileA.exists()) {
                                com.apm.insight.l.f.a(file);
                            } else {
                                try {
                                    jSONArray = new JSONArray(com.apm.insight.l.f.a(fileA, "\n"));
                                    jSONObjectOptJSONObject = crashType == CrashType.LAUNCH ? ((JSONArray) jSONObjectB.opt("data")).optJSONObject(0) : jSONObjectB;
                                } catch (Throwable unused) {
                                    it = it2;
                                }
                                if (z11) {
                                    it = it2;
                                } else {
                                    it = it2;
                                    try {
                                        if (c0007b.f21688e == next) {
                                        }
                                        try {
                                            com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "aid", String.valueOf(jSONObjectOptJSONObject2.opt("aid")));
                                            crashType2 = crashType;
                                            try {
                                                com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "has_ignore", String.valueOf(next.f21683e.contains("ignore")));
                                                jSONObjectOptJSONObject2.put("aid", 2010);
                                            } catch (Throwable th4) {
                                                th = th4;
                                                com.apm.insight.c.a();
                                                com.apm.insight.runtime.j.a(th, "NPTH_CATCH");
                                                com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "start_uuid", c0007b.f21684a);
                                                com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "leak_threads_count", String.valueOf(c0007b.f21690g));
                                                com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "crash_thread_name", jSONObjectOptJSONObject.optString("crash_thread_name", "unknown"));
                                                com.apm.insight.entity.b.a(jSONObjectB, jSONArray, new b.a() { // from class: com.apm.insight.k.b.3
                                                    @Override // com.apm.insight.entity.b.a
                                                    public final void a(JSONObject jSONObject) {
                                                        e.a(bVarA.a(), jSONObject.toString(), new File(file, "logZip"), com.apm.insight.l.j.a(b.this.f21661a, c0007b.f21684a));
                                                    }
                                                });
                                                if (!com.apm.insight.l.f.a(file)) {
                                                }
                                                c.a(crashType2, jSONObjectB);
                                                it2 = it;
                                            }
                                        } catch (Throwable th5) {
                                            th = th5;
                                            crashType2 = crashType;
                                        }
                                        com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "start_uuid", c0007b.f21684a);
                                        com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "leak_threads_count", String.valueOf(c0007b.f21690g));
                                        com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "crash_thread_name", jSONObjectOptJSONObject.optString("crash_thread_name", "unknown"));
                                        com.apm.insight.entity.b.a(jSONObjectB, jSONArray, new b.a() { // from class: com.apm.insight.k.b.3
                                            @Override // com.apm.insight.entity.b.a
                                            public final void a(JSONObject jSONObject) {
                                                e.a(bVarA.a(), jSONObject.toString(), new File(file, "logZip"), com.apm.insight.l.j.a(b.this.f21661a, c0007b.f21684a));
                                            }
                                        });
                                        if (!com.apm.insight.l.f.a(file)) {
                                            com.apm.insight.e.a.a().a(com.apm.insight.d.a.b(file.getAbsolutePath()));
                                        }
                                        c.a(crashType2, jSONObjectB);
                                    } catch (Throwable th6) {
                                        th = th6;
                                        com.apm.insight.c.a();
                                        com.apm.insight.runtime.j.a(th, "NPTH_CATCH");
                                        com.apm.insight.l.f.a(next.f21679a);
                                        it2 = it;
                                    }
                                    it2 = it;
                                }
                                if (next.f21683e.contains("ignore")) {
                                    com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "aid", String.valueOf(jSONObjectOptJSONObject2.opt("aid")));
                                    crashType2 = crashType;
                                    com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "has_ignore", String.valueOf(next.f21683e.contains("ignore")));
                                    jSONObjectOptJSONObject2.put("aid", 2010);
                                } else {
                                    crashType2 = crashType;
                                    if (fVar != null && !fVar.a(jSONObjectOptJSONObject.optString("crash_md5", CarrierConfigurator.APN_TYPE))) {
                                        com.apm.insight.l.f.a(next.f21679a);
                                    }
                                    it2 = it;
                                }
                                com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "start_uuid", c0007b.f21684a);
                                com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "leak_threads_count", String.valueOf(c0007b.f21690g));
                                com.apm.insight.entity.a.a(jSONObjectOptJSONObject, "filters", "crash_thread_name", jSONObjectOptJSONObject.optString("crash_thread_name", "unknown"));
                                com.apm.insight.entity.b.a(jSONObjectB, jSONArray, new b.a() { // from class: com.apm.insight.k.b.3
                                    @Override // com.apm.insight.entity.b.a
                                    public final void a(JSONObject jSONObject) {
                                        e.a(bVarA.a(), jSONObject.toString(), new File(file, "logZip"), com.apm.insight.l.j.a(b.this.f21661a, c0007b.f21684a));
                                    }
                                });
                                if (!com.apm.insight.l.f.a(file)) {
                                }
                                c.a(crashType2, jSONObjectB);
                                it2 = it;
                            }
                        }
                    }
                }
            }
        }
    }

    private static boolean a(File file) {
        String[] list = file.list();
        if (list == null) {
            return false;
        }
        for (String str : list) {
            if (!TextUtils.isEmpty(str) && str.endsWith(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00ac A[Catch: all -> 0x01e1, TRY_ENTER, TryCatch #1 {all -> 0x01e1, blocks: (B:31:0x0072, B:39:0x0090, B:42:0x009d, B:47:0x00b3, B:46:0x00ac), top: B:92:0x0072 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private com.apm.insight.f.b a(File file, CrashType crashType, String str, long j11, long j12) {
        File file2;
        com.apm.insight.f.b bVar;
        com.apm.insight.f.b bVar2 = null;
        try {
            if (file.isFile()) {
                try {
                    com.apm.insight.l.f.a(file);
                    return null;
                } catch (Throwable th2) {
                    th = th2;
                    file2 = file;
                }
            } else {
                boolean z11 = crashType == CrashType.LAUNCH;
                if (crashType == null) {
                    try {
                        file2 = file;
                        try {
                            return com.apm.insight.l.f.b(new File(file2, file.getName()).getAbsolutePath());
                        } catch (Throwable th3) {
                            th = th3;
                            com.apm.insight.l.f.a(file2);
                            com.apm.insight.c.a();
                            com.apm.insight.runtime.j.a(th, "NPTH_CATCH");
                            return bVar2;
                        }
                    } catch (Throwable th4) {
                        th = th4;
                        file2 = file;
                    }
                } else {
                    file2 = file;
                    try {
                        com.apm.insight.f.b bVarA = com.apm.insight.l.f.a(file, crashType);
                        try {
                            JSONObject jSONObjectB = bVarA.b();
                            try {
                                if (bVarA.b() != null) {
                                    boolean z12 = z11;
                                    if (crashType == CrashType.ANR) {
                                        return bVarA;
                                    }
                                    jSONObjectB.put("crash_time", j11);
                                    try {
                                        jSONObjectB.put("app_start_time", j12);
                                        JSONObject jSONObjectOptJSONObject = jSONObjectB.optJSONObject("header");
                                        try {
                                            if (jSONObjectOptJSONObject == null) {
                                                jSONObjectOptJSONObject = Header.a(j11).f();
                                            } else if (z12) {
                                                jSONObjectB.remove("header");
                                            }
                                            String strOptString = jSONObjectOptJSONObject.optString("sdk_version_name", null);
                                            if (strOptString == null) {
                                                strOptString = "2.0.0.9";
                                            }
                                            com.apm.insight.entity.a.a(jSONObjectB, "filters", "sdk_version", strOptString);
                                            JSONArray jSONArrayOptJSONArray = jSONObjectB.optJSONArray("logcat");
                                            if (jSONArrayOptJSONArray != null) {
                                                if (jSONArrayOptJSONArray.length() == 0) {
                                                    jSONObjectB.put("logcat", com.apm.insight.runtime.h.a(str));
                                                }
                                                com.apm.insight.entity.a.a(jSONObjectB, "filters", "has_dump", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
                                                com.apm.insight.entity.a.a(jSONObjectB, "filters", "has_logcat", String.valueOf(!com.apm.insight.a.a(jSONObjectB, "logcat")));
                                                com.apm.insight.entity.a.a(jSONObjectB, "filters", "memory_leak", String.valueOf(com.apm.insight.entity.a.a(str)));
                                                com.apm.insight.entity.a.a(jSONObjectB, "filters", "fd_leak", String.valueOf(com.apm.insight.entity.a.b(str)));
                                                com.apm.insight.entity.a.a(jSONObjectB, "filters", "threads_leak", String.valueOf(com.apm.insight.entity.a.c(str)));
                                                com.apm.insight.entity.a.a(jSONObjectB, "filters", "is_64_devices", String.valueOf(Header.a()));
                                                com.apm.insight.entity.a.a(jSONObjectB, "filters", "is_64_runtime", String.valueOf(NativeImpl.f()));
                                                com.apm.insight.entity.a.a(jSONObjectB, "filters", "is_x86_devices", String.valueOf(Header.b()));
                                                com.apm.insight.entity.a.a(jSONObjectB, "filters", "has_meminfo_file", String.valueOf(com.apm.insight.l.j.d(str).exists()));
                                                com.apm.insight.entity.a.a(jSONObjectB, "filters", "is_root", String.valueOf(com.apm.insight.nativecrash.a.k()));
                                                try {
                                                    jSONObjectB.put("launch_did", com.apm.insight.i.a.a(this.f21661a));
                                                    jSONObjectB.put("crash_uuid", file2.getName());
                                                    try {
                                                        long j13 = Long.parseLong(com.apm.insight.runtime.b.a(j11, str));
                                                        com.apm.insight.entity.a.a(jSONObjectB, "filters", "lastAliveTime", Math.abs(j13 - j11) < 60000 ? "< 60s" : "> 60s");
                                                        jSONObjectB.put("lastAliveTime", String.valueOf(j13));
                                                    } catch (Throwable unused) {
                                                        jSONObjectB.put("lastAliveTime", "unknown");
                                                        com.apm.insight.entity.a.a(jSONObjectB, "filters", "lastAliveTime", "unknown");
                                                    }
                                                    jSONObjectB.put("has_dump", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
                                                    if (jSONObjectB.opt(PlaceTypes.STORAGE) == null) {
                                                        try {
                                                            com.apm.insight.e.g();
                                                            com.apm.insight.entity.a.a(jSONObjectB, n.a());
                                                        } catch (Throwable th5) {
                                                            th = th5;
                                                            bVar2 = bVarA;
                                                            com.apm.insight.l.f.a(file2);
                                                            com.apm.insight.c.a();
                                                            com.apm.insight.runtime.j.a(th, "NPTH_CATCH");
                                                            return bVar2;
                                                        }
                                                    }
                                                    if (Header.b(jSONObjectOptJSONObject)) {
                                                        com.apm.insight.entity.a.a(jSONObjectB, "filters", "unauthentic_version", "unauthentic_version");
                                                    }
                                                    com.apm.insight.entity.d.b(jSONObjectB);
                                                    bVarA.b().put("upload_scene", "launch_scan");
                                                    if (z12) {
                                                        JSONObject jSONObject = new JSONObject();
                                                        jSONObjectB.put("event_type", "start_crash");
                                                        jSONObjectB.put("stack", jSONObjectB.remove("data"));
                                                        jSONObject.put("data", new JSONArray().put(jSONObjectB));
                                                        jSONObject.put("header", jSONObjectOptJSONObject);
                                                        bVar = bVarA;
                                                        bVar.a(jSONObject);
                                                    } else {
                                                        bVar = bVarA;
                                                        jSONObjectB.put("isJava", 1);
                                                    }
                                                } catch (Throwable th6) {
                                                    th = th6;
                                                    bVar = bVarA;
                                                    bVar2 = bVar;
                                                    com.apm.insight.l.f.a(file2);
                                                    com.apm.insight.c.a();
                                                    com.apm.insight.runtime.j.a(th, "NPTH_CATCH");
                                                    return bVar2;
                                                }
                                            }
                                        } catch (Throwable th7) {
                                            th = th7;
                                        }
                                    } catch (Throwable th8) {
                                        th = th8;
                                    }
                                } else {
                                    bVar = bVarA;
                                    com.apm.insight.l.f.a(file2);
                                }
                                return bVar;
                            } catch (Throwable th9) {
                                th = th9;
                            }
                        } catch (Throwable th10) {
                            th = th10;
                            bVar = bVarA;
                        }
                    } catch (Throwable th11) {
                        th = th11;
                        com.apm.insight.l.f.a(file2);
                        com.apm.insight.c.a();
                        com.apm.insight.runtime.j.a(th, "NPTH_CATCH");
                        return bVar2;
                    }
                }
            }
        } catch (Throwable th12) {
            th = th12;
            file2 = file;
        }
        com.apm.insight.l.f.a(file2);
        com.apm.insight.c.a();
        com.apm.insight.runtime.j.a(th, "NPTH_CATCH");
        return bVar2;
    }
}
