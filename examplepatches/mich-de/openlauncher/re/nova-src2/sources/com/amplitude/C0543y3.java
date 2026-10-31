package com.amplitude;

import android.content.Context;
import android.content.SharedPreferences;
import com.amplitude.android.sessionreplay.Diagnostics;
import com.amplitude.common.Logger;
import com.amplitude.core.events.Identify;
import java.io.File;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.io.FilesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.text.Charsets;

/* renamed from: com.amplitude.y3, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0543y3 implements H0 {

    /* renamed from: a, reason: collision with root package name */
    public final K3 f20823a;

    /* renamed from: b, reason: collision with root package name */
    public final SharedPreferences f20824b;

    /* renamed from: c, reason: collision with root package name */
    public final File f20825c;

    /* renamed from: d, reason: collision with root package name */
    public final String f20826d;

    /* renamed from: e, reason: collision with root package name */
    public int f20827e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ com.amplitude.android.sessionreplay.a f20828f;

    public C0543y3(Context context, K3 logger) {
        Intrinsics.g(context, "context");
        Intrinsics.g(logger, "logger");
        this.f20823a = logger;
        SharedPreferences sharedPreferences = context.getSharedPreferences("amplitude-session-replay-replay-sequence", 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.f20824b = sharedPreferences;
        File dir = context.getDir("amplitude-session-replay", 0);
        Intrinsics.f(dir, "getDir(...)");
        this.f20825c = dir;
    }

    public final String a() {
        String str = "replay-sequence-" + this.f20828f.sessionId + Identify.UNSET_VALUE + this.f20827e;
        int i5 = this.f20827e + 1;
        this.f20827e = i5;
        a(this.f20826d, String.valueOf(i5));
        return str;
    }

    public final ArrayList b(String uri) {
        String strT0;
        Intrinsics.g(uri, "uri");
        File file = new File(this.f20825c, uri);
        if (file.exists()) {
            strT0 = FilesKt.t0(file, Charsets.f72000b);
        } else {
            this.f20823a.b(new C0536x1(uri));
            strT0 = null;
        }
        if (strT0 == null) {
            return null;
        }
        List listI1 = r70.k.i1(strT0, new String[]{"\u0000"}, 6);
        ArrayList arrayList = new ArrayList();
        for (Object obj : listI1) {
            if (((String) obj).length() > 0) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public final long c() {
        File[] fileArrListFiles;
        File file = this.f20825c;
        Intrinsics.g(file, "<this>");
        long length = 0;
        if (!file.exists()) {
            return 0L;
        }
        if (!file.isDirectory()) {
            return file.length();
        }
        LinkedList linkedList = new LinkedList();
        linkedList.add(file);
        while (!linkedList.isEmpty()) {
            File file2 = (File) linkedList.remove(0);
            if (file2.exists() && (fileArrListFiles = file2.listFiles()) != null && fileArrListFiles.length != 0) {
                for (File file3 : fileArrListFiles) {
                    if (file3.isDirectory()) {
                        linkedList.add(file3);
                    } else {
                        length += file3.length();
                    }
                }
            }
        }
        return length;
    }

    public final String d() {
        ArrayList arrayListB;
        String string = this.f20824b.getString("persistent-storage-current-file-uri", null);
        String value = a();
        Intrinsics.g(value, "value");
        a2.c.v(this.f20824b, "persistent-storage-current-file-uri", value);
        if (string != null && ((arrayListB = b(string)) == null || arrayListB.isEmpty())) {
            a(string);
        }
        return value;
    }

    public final void a(String key, String value) {
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        a2.c.v(this.f20824b, key, value);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public C0543y3(com.amplitude.android.sessionreplay.a aVar, Context context, K3 k32) {
        this(context, k32);
        this.f20828f = aVar;
        this.f20826d = "replay-storage-current-sequence-id";
        String string = this.f20824b.getString("replay-storage-current-sequence-id", null);
        int i5 = string != null ? Integer.parseInt(string) : 0;
        this.f20827e = i5;
        if (string == null) {
            a("replay-storage-current-sequence-id", String.valueOf(i5));
        }
    }

    public final boolean a(String uri) {
        Intrinsics.g(uri, "uri");
        File file = new File(this.f20825c, uri);
        if (!file.exists()) {
            this.f20823a.b(new C0526v1(uri));
            return false;
        }
        return file.delete();
    }

    public final List b() {
        File[] fileArrListFiles = this.f20825c.listFiles();
        if (fileArrListFiles != null) {
            ArrayList arrayList = new ArrayList(fileArrListFiles.length);
            for (File file : fileArrListFiles) {
                arrayList.add(file.getName());
            }
            return arrayList;
        }
        return EmptyList.f71733a;
    }

    public final void a(W1 data) {
        Intrinsics.g(data, "data");
        List listP = ul.b.P(data);
        String string = this.f20824b.getString("persistent-storage-current-file-uri", null);
        String strD = string == null ? d() : string;
        this.f20823a.a(new C0541y1(strD, string, listP));
        try {
            ArrayList arrayList = new ArrayList(b70.c.u0(listP, 10));
            long j11 = 0;
            for (Object data2 : listP) {
                Intrinsics.g(data2, "data");
                String str = data2 instanceof W1 ? (String) this.f20828f.packFn.invoke(data2) : null;
                if (str == null) {
                    K3 k32 = this.f20823a;
                    k32.getClass();
                    Logger logger = k32.f20306a;
                    if (logger != null) {
                        logger.error("Failed to serialize data");
                    }
                } else if (r70.k.K0(str, "\u0000", false)) {
                    K3 k33 = this.f20823a;
                    k33.getClass();
                    Logger logger2 = k33.f20306a;
                    if (logger2 != null) {
                        logger2.error("Data contains delimiter, rejecting data");
                    }
                    Diagnostics.INSTANCE.trackError("DelimiterInData", "PersistentStorage");
                } else {
                    long jA = V3.a(str);
                    j11 += jA;
                    this.f20823a.c(new D1(jA));
                    arrayList.add(str);
                }
                str = null;
                arrayList.add(str);
            }
            String strF1 = b70.g.f1(b70.g.U0(arrayList), "\u0000", null, "\u0000", 0, null, 58);
            Ref.ObjectRef objectRef = new Ref.ObjectRef();
            File file = new File(this.f20825c, strD);
            objectRef.f71863a = file;
            if (file.length() + j11 > 9437184) {
                String strD2 = d();
                objectRef.f71863a = new File(this.f20825c, strD2);
                this.f20823a.c(new C0546z1(strD, strD2));
            }
            File file2 = (File) objectRef.f71863a;
            Intrinsics.g(file2, "<this>");
            if (!file2.exists()) {
                File parentFile = file2.getParentFile();
                if (parentFile != null) {
                    parentFile.mkdirs();
                }
                file2.createNewFile();
            }
            try {
                AbstractC0530w0.a((File) objectRef.f71863a, strF1);
                this.f20823a.a(new A1(objectRef));
            } catch (Throwable th2) {
                Diagnostics.INSTANCE.trackError(th2, "PersistentStorage");
                this.f20823a.b(new B1(th2));
            }
        } catch (Throwable th3) {
            this.f20823a.b(new C1(th3));
        }
    }
}
