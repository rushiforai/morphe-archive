package io.branch.requery.android.database.sqlite;

import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final c[] f61812a = new c[20];

    /* renamed from: b, reason: collision with root package name */
    public int f61813b;

    /* renamed from: c, reason: collision with root package name */
    public int f61814c;

    /* renamed from: d, reason: collision with root package name */
    public volatile boolean f61815d;

    public d(Boolean bool) {
        this.f61815d = bool.booleanValue();
    }

    public final int a(String str, String str2, Object[] objArr) {
        int i5 = -1;
        if (!this.f61815d) {
            return -1;
        }
        synchronized (this.f61812a) {
            try {
                int i11 = (this.f61813b + 1) % 20;
                c cVar = this.f61812a[i11];
                if (cVar == null) {
                    cVar = new c();
                    this.f61812a[i11] = cVar;
                } else {
                    cVar.f61809f = false;
                    cVar.f61810g = null;
                    ArrayList arrayList = cVar.f61808e;
                    if (arrayList != null) {
                        arrayList.clear();
                    }
                }
                cVar.f61804a = System.currentTimeMillis();
                cVar.f61806c = str;
                cVar.f61807d = str2;
                if (objArr != null) {
                    ArrayList arrayList2 = cVar.f61808e;
                    if (arrayList2 == null) {
                        cVar.f61808e = new ArrayList();
                    } else {
                        arrayList2.clear();
                    }
                    for (Object obj : objArr) {
                        if (obj == null || !(obj instanceof byte[])) {
                            cVar.f61808e.add(obj);
                        } else {
                            cVar.f61808e.add(SQLiteConnection.n);
                        }
                    }
                }
                if (this.f61815d) {
                    int i12 = this.f61814c;
                    this.f61814c = i12 + 1;
                    i5 = (i12 << 8) | i11;
                }
                cVar.f61811h = i5;
                this.f61813b = i11;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return i5;
    }

    public final void b(int i5) {
        c cVarE;
        if (!this.f61815d || i5 == -1) {
            return;
        }
        synchronized (this.f61812a) {
            if (this.f61815d && i5 != -1 && (cVarE = e(i5)) != null) {
                cVarE.f61805b = System.currentTimeMillis();
                cVarE.f61809f = true;
            }
        }
    }

    public final void c(int i5) {
        c cVarE;
        if (!this.f61815d || i5 == -1) {
            return;
        }
        synchronized (this.f61812a) {
            if (this.f61815d && i5 != -1 && (cVarE = e(i5)) != null) {
                cVarE.f61805b = System.currentTimeMillis();
                cVarE.f61809f = true;
            }
        }
    }

    public final void d(int i5, RuntimeException runtimeException) {
        if (!this.f61815d || i5 == -1) {
            return;
        }
        synchronized (this.f61812a) {
            try {
                c cVarE = e(i5);
                if (cVarE != null) {
                    cVarE.f61810g = runtimeException;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final c e(int i5) {
        if (this.f61815d && i5 != -1) {
            c cVar = this.f61812a[i5 & 255];
            if (cVar.f61811h == i5) {
                return cVar;
            }
        }
        return null;
    }
}
