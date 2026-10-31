package com.pgl.ssdk;

import android.content.Context;

/* loaded from: classes.dex */
public class ao implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    private Context f42309a;

    /* renamed from: b, reason: collision with root package name */
    private int f42310b;

    /* renamed from: c, reason: collision with root package name */
    private Object[] f42311c;

    public ao(Context context, int i5, Object[] objArr) {
        this.f42309a = context;
        this.f42310b = i5;
        this.f42311c = objArr;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            if (this.f42310b == 222) {
                ak.a(this.f42309a).a();
            }
            byte[] bArr = (byte[]) com.pgl.ssdk.ces.a.meta(this.f42310b, this.f42309a, this.f42311c);
            if (bArr == null || bArr.length <= 0) {
                return;
            }
            new ap(this.f42309a, this.f42310b).a(1, 2, bArr);
        } catch (Throwable unused) {
        }
    }
}
