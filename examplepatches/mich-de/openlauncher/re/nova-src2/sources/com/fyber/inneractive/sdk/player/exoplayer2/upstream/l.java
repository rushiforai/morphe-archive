package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class l implements b {

    /* renamed from: b, reason: collision with root package name */
    public int f30372b;

    /* renamed from: c, reason: collision with root package name */
    public int f30373c;

    /* renamed from: d, reason: collision with root package name */
    public int f30374d = 0;

    /* renamed from: e, reason: collision with root package name */
    public a[] f30375e = new a[100];

    /* renamed from: a, reason: collision with root package name */
    public final a[] f30371a = new a[1];

    public final synchronized void a(int i5) {
        boolean z11 = i5 < this.f30372b;
        this.f30372b = i5;
        if (z11) {
            a();
        }
    }

    public final synchronized void a(a[] aVarArr) {
        try {
            int i5 = this.f30374d;
            int length = aVarArr.length + i5;
            a[] aVarArr2 = this.f30375e;
            if (length >= aVarArr2.length) {
                this.f30375e = (a[]) Arrays.copyOf(aVarArr2, Math.max(aVarArr2.length * 2, i5 + aVarArr.length));
            }
            for (a aVar : aVarArr) {
                byte[] bArr = aVar.f30272a;
                if (bArr != null && bArr.length != 65536) {
                    throw new IllegalArgumentException();
                }
                a[] aVarArr3 = this.f30375e;
                int i11 = this.f30374d;
                this.f30374d = i11 + 1;
                aVarArr3[i11] = aVar;
            }
            this.f30373c -= aVarArr.length;
            notifyAll();
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void a() {
        int i5 = this.f30372b;
        int i11 = com.fyber.inneractive.sdk.player.exoplayer2.util.z.f30489a;
        int iMax = Math.max(0, ((i5 + 65535) / SQLiteDatabase.OPEN_FULLMUTEX) - this.f30373c);
        int i12 = this.f30374d;
        if (iMax >= i12) {
            return;
        }
        Arrays.fill(this.f30375e, iMax, i12, (Object) null);
        this.f30374d = iMax;
    }
}
