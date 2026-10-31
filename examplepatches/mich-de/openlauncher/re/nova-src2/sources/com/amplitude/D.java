package com.amplitude;

import android.graphics.Bitmap;
import com.amplitude.core.events.Identify;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class D {

    /* renamed from: a, reason: collision with root package name */
    public final C f20204a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashMap f20205b = new LinkedHashMap();

    public D(int i5) {
        this.f20204a = new C(this, i5);
    }

    public static String a(int i5, int i11) {
        return i5 + Identify.UNSET_VALUE + i11;
    }

    public final synchronized void a(Bitmap bitmap) {
        try {
            Intrinsics.g(bitmap, "bitmap");
            if (bitmap.isRecycled()) {
                return;
            }
            String strA = a(bitmap.getWidth(), bitmap.getHeight());
            this.f20204a.put(bitmap, bitmap);
            LinkedHashMap linkedHashMap = this.f20205b;
            Object linkedHashSet = linkedHashMap.get(strA);
            if (linkedHashSet == null) {
                linkedHashSet = new LinkedHashSet();
                linkedHashMap.put(strA, linkedHashSet);
            }
            ((Set) linkedHashSet).add(bitmap);
        } catch (Throwable th2) {
            throw th2;
        }
    }
}
