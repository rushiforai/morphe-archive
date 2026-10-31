package com.google.android.gms.internal.measurement;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

/* loaded from: classes3.dex */
public final class jd implements Comparable {

    /* renamed from: c, reason: collision with root package name */
    public static final AtomicReferenceFieldUpdater f32687c = AtomicReferenceFieldUpdater.newUpdater(jd.class, Object.class, "b");

    /* renamed from: a, reason: collision with root package name */
    public final String f32688a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f32689b;

    public /* synthetic */ jd(String str, byte[] bArr) {
        this.f32688a = str;
        this.f32689b = bArr;
    }

    public final /* synthetic */ void a(byte[] bArr) {
        byte[][] bArr2;
        int i5 = 0;
        while (true) {
            Object obj = this.f32689b;
            if (!(obj instanceof byte[])) {
                byte[][] bArr3 = (byte[][]) obj;
                while (true) {
                    int length = bArr3.length;
                    if (i5 >= length) {
                        bArr2 = (byte[][]) Arrays.copyOf(bArr3, length + 1);
                        bArr2[length] = bArr;
                        break;
                    } else if (Arrays.equals(bArr, bArr3[i5])) {
                        return;
                    } else {
                        i5++;
                    }
                }
            } else {
                byte[] bArr4 = (byte[]) obj;
                if (Arrays.equals(bArr, bArr4)) {
                    return;
                }
                i5 = 1;
                bArr2 = new byte[][]{bArr4, bArr};
            }
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f32687c;
            while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, bArr2)) {
                if (atomicReferenceFieldUpdater.get(this) != obj) {
                    break;
                }
            }
            return;
        }
    }

    @Override // java.lang.Comparable
    public final /* synthetic */ int compareTo(Object obj) {
        return this.f32688a.compareTo((String) obj);
    }
}
