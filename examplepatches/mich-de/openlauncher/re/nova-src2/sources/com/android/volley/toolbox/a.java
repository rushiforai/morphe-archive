package com.android.volley.toolbox;

import ai.r2;
import androidx.recyclerview.widget.u1;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: e, reason: collision with root package name */
    public static final r2 f21381e = new r2(10);

    /* renamed from: a, reason: collision with root package name */
    public int f21382a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f21383b;

    /* renamed from: c, reason: collision with root package name */
    public final int f21384c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f21385d;

    public a(int i5, ArrayList arrayList, int i11, InputStream inputStream) {
        this.f21382a = i5;
        this.f21383b = arrayList;
        this.f21384c = i11;
        this.f21385d = inputStream;
    }

    public synchronized byte[] a(int i5) {
        for (int i11 = 0; i11 < ((ArrayList) this.f21385d).size(); i11++) {
            byte[] bArr = (byte[]) ((ArrayList) this.f21385d).get(i11);
            if (bArr.length >= i5) {
                this.f21382a -= bArr.length;
                ((ArrayList) this.f21385d).remove(i11);
                this.f21383b.remove(bArr);
                return bArr;
            }
        }
        return new byte[i5];
    }

    public synchronized void b(byte[] bArr) {
        if (bArr != null) {
            if (bArr.length <= this.f21384c) {
                this.f21383b.add(bArr);
                int iBinarySearch = Collections.binarySearch((ArrayList) this.f21385d, bArr, f21381e);
                if (iBinarySearch < 0) {
                    iBinarySearch = (-iBinarySearch) - 1;
                }
                ((ArrayList) this.f21385d).add(iBinarySearch, bArr);
                this.f21382a += bArr.length;
                synchronized (this) {
                    while (this.f21382a > this.f21384c) {
                        byte[] bArr2 = (byte[]) this.f21383b.remove(0);
                        ((ArrayList) this.f21385d).remove(bArr2);
                        this.f21382a -= bArr2.length;
                    }
                }
            }
        }
    }

    public a() {
        this.f21383b = new ArrayList();
        this.f21385d = new ArrayList(64);
        this.f21382a = 0;
        this.f21384c = u1.FLAG_APPEARED_IN_PRE_LAYOUT;
    }
}
