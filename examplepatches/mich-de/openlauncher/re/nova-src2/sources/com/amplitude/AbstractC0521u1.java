package com.amplitude;

import com.amplitude.common.Logger;
import java.util.Iterator;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.u1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public abstract class AbstractC0521u1 {

    /* renamed from: a, reason: collision with root package name */
    public static K3 f20771a;

    /* renamed from: b, reason: collision with root package name */
    public static final LinkedHashMap f20772b = new LinkedHashMap();

    /* renamed from: c, reason: collision with root package name */
    public static int f20773c;

    /* renamed from: d, reason: collision with root package name */
    public static int f20774d;

    /* renamed from: e, reason: collision with root package name */
    public static float f20775e;

    public static void a(C0436f2 c0436f2) {
        K3 k32 = f20771a;
        if (k32 != null ? k32.a(Logger.LogMode.DEBUG) : false) {
            String strY = c0436f2.y();
            c0436f2.x().getClass();
            LinkedHashMap linkedHashMap = f20772b;
            if (linkedHashMap.containsKey(strY)) {
                Object obj = linkedHashMap.get(strY);
                Intrinsics.d(obj);
                C0502q1 c0502q1 = (C0502q1) obj;
                c0502q1.f20730b = c0502q1.f20730b;
                c0502q1.f20731c++;
            } else {
                linkedHashMap.put(strY, new C0502q1(strY));
            }
            Iterator it = c0436f2.f().iterator();
            while (it.hasNext()) {
                a((C0436f2) it.next());
            }
        }
    }
}
