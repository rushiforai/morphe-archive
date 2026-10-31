package uy;

import android.content.ContentResolver;
import com.android.launcher3.util.ComponentKey;

/* loaded from: classes4.dex */
public final class p extends o {

    /* renamed from: j, reason: collision with root package name */
    public boolean f91744j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ q f91745k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(q qVar) {
        super(qVar);
        this.f91745k = qVar;
        this.f91744j = false;
    }

    @Override // uy.o
    public final synchronized void g(ContentResolver contentResolver, ComponentKey componentKey, int i5, boolean z11) {
        try {
            super.g(contentResolver, componentKey, i5, z11);
            if (!this.f91744j) {
                if (z11) {
                    d0.f91699e.c(this.f91745k, componentKey);
                } else {
                    d0.f91699e.t(this.f91745k, componentKey);
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void h(ContentResolver contentResolver, boolean z11) {
        this.f91744j = true;
        try {
            c(contentResolver, z11);
        } finally {
            this.f91744j = false;
        }
    }
}
