package vf;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class m {

    /* renamed from: c, reason: collision with root package name */
    public int f92700c;

    /* renamed from: d, reason: collision with root package name */
    public int f92701d;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f92698a = true;

    /* renamed from: b, reason: collision with root package name */
    public final int f92699b = SQLiteDatabase.OPEN_FULLMUTEX;

    /* renamed from: e, reason: collision with root package name */
    public int f92702e = 0;

    /* renamed from: f, reason: collision with root package name */
    public a[] f92703f = new a[100];

    public final synchronized void a(int i5) {
        boolean z11 = i5 < this.f92700c;
        this.f92700c = i5;
        if (z11) {
            b();
        }
    }

    public final synchronized void b() {
        int iMax = Math.max(0, wf.v.f(this.f92700c, this.f92699b) - this.f92701d);
        int i5 = this.f92702e;
        if (iMax >= i5) {
            return;
        }
        Arrays.fill(this.f92703f, iMax, i5, (Object) null);
        this.f92702e = iMax;
    }
}
