package com.apm.insight.runtime;

import com.apm.insight.CrashType;
import com.apm.insight.ICrashCallback;
import com.apm.insight.IOOMCallback;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    private final List<ICrashCallback> f21868a = new CopyOnWriteArrayList();

    /* renamed from: b, reason: collision with root package name */
    private final List<ICrashCallback> f21869b = new CopyOnWriteArrayList();

    /* renamed from: c, reason: collision with root package name */
    private final List<ICrashCallback> f21870c = new CopyOnWriteArrayList();

    /* renamed from: d, reason: collision with root package name */
    private final List<ICrashCallback> f21871d = new CopyOnWriteArrayList();

    /* renamed from: e, reason: collision with root package name */
    private final List<IOOMCallback> f21872e = new CopyOnWriteArrayList();

    /* renamed from: com.apm.insight.runtime.c$1, reason: invalid class name */
    /* loaded from: classes2.dex */
    public static /* synthetic */ class AnonymousClass1 {

        /* renamed from: a, reason: collision with root package name */
        static final /* synthetic */ int[] f21873a;

        static {
            int[] iArr = new int[CrashType.values().length];
            f21873a = iArr;
            try {
                iArr[CrashType.ALL.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                f21873a[CrashType.ANR.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                f21873a[CrashType.JAVA.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                f21873a[CrashType.LAUNCH.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                f21873a[CrashType.NATIVE.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
        }
    }

    public final void a(ICrashCallback iCrashCallback, CrashType crashType) {
        int i5 = AnonymousClass1.f21873a[crashType.ordinal()];
        if (i5 == 1) {
            this.f21868a.add(iCrashCallback);
            this.f21869b.add(iCrashCallback);
            this.f21870c.add(iCrashCallback);
            this.f21871d.add(iCrashCallback);
            return;
        }
        if (i5 == 2) {
            this.f21871d.add(iCrashCallback);
            return;
        }
        if (i5 == 3) {
            this.f21869b.add(iCrashCallback);
        } else if (i5 == 4) {
            this.f21868a.add(iCrashCallback);
        } else {
            if (i5 != 5) {
                return;
            }
            this.f21870c.add(iCrashCallback);
        }
    }

    public final void b(ICrashCallback iCrashCallback, CrashType crashType) {
        int i5 = AnonymousClass1.f21873a[crashType.ordinal()];
        if (i5 == 1) {
            this.f21868a.remove(iCrashCallback);
            this.f21869b.remove(iCrashCallback);
            this.f21870c.remove(iCrashCallback);
            this.f21871d.remove(iCrashCallback);
            return;
        }
        if (i5 == 2) {
            this.f21871d.remove(iCrashCallback);
            return;
        }
        if (i5 == 3) {
            this.f21869b.remove(iCrashCallback);
        } else if (i5 == 4) {
            this.f21868a.remove(iCrashCallback);
        } else {
            if (i5 != 5) {
                return;
            }
            this.f21870c.remove(iCrashCallback);
        }
    }

    public final List<ICrashCallback> c() {
        return this.f21869b;
    }

    public final List<ICrashCallback> d() {
        return this.f21870c;
    }

    public final List<ICrashCallback> e() {
        return this.f21871d;
    }

    public final void a(IOOMCallback iOOMCallback) {
        this.f21872e.add(iOOMCallback);
    }

    public final void b(IOOMCallback iOOMCallback) {
        this.f21872e.remove(iOOMCallback);
    }

    public final List<IOOMCallback> a() {
        return this.f21872e;
    }

    public final List<ICrashCallback> b() {
        return this.f21868a;
    }
}
