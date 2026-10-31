package com.amplitude;

import android.graphics.Bitmap;
import android.util.LruCache;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class C extends LruCache {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ D f20193a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C(D d5, int i5) {
        super(i5);
        this.f20193a = d5;
    }

    @Override // android.util.LruCache
    public final void entryRemoved(boolean z11, Object obj, Object obj2, Object obj3) {
        Set set;
        Bitmap key = (Bitmap) obj;
        Bitmap oldValue = (Bitmap) obj2;
        Bitmap bitmap = (Bitmap) obj3;
        Intrinsics.g(key, "key");
        Intrinsics.g(oldValue, "oldValue");
        if (bitmap != null || (set = (Set) this.f20193a.f20205b.get(D.a(key.getWidth(), key.getHeight()))) == null) {
            return;
        }
        set.remove(key);
    }

    @Override // android.util.LruCache
    public final int sizeOf(Object obj, Object obj2) {
        Bitmap key = (Bitmap) obj;
        Bitmap value = (Bitmap) obj2;
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        return value.getByteCount();
    }
}
