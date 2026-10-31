package com.google.android.gms.internal.measurement;

import java.lang.reflect.InvocationTargetException;

/* loaded from: classes3.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final e f32446a;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v6, types: [com.google.android.gms.internal.measurement.e] */
    static {
        i iVar;
        try {
            iVar = j.f32666a;
        } catch (NoClassDefFoundError unused) {
            iVar = null;
        }
        if (iVar == null) {
            StringBuilder sb2 = new StringBuilder();
            for (int i5 = 0; i5 < 3; i5++) {
                String str = e.f32486a[i5];
                try {
                    iVar = (e) Class.forName(str).getConstructor(null).newInstance(null);
                } catch (Throwable th2) {
                    th = th2;
                    sb2.append('\n');
                    sb2.append(str);
                    sb2.append(": ");
                    if (th instanceof InvocationTargetException) {
                        th = th.getCause();
                    }
                    sb2.append(th);
                }
            }
            throw new IllegalStateException(sb2.insert(0, "No logging platforms found:").toString());
        }
        f32446a = iVar;
    }
}
