package se;

import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class a extends ie.a {

    /* renamed from: c, reason: collision with root package name */
    public final long f87236c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f87237d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f87238e;

    public a(int i5, long j11) {
        super(i5, 2);
        this.f87236c = j11;
        this.f87237d = new ArrayList();
        this.f87238e = new ArrayList();
    }

    public final a q(int i5) {
        ArrayList arrayList = this.f87238e;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            a aVar = (a) arrayList.get(i11);
            if (aVar.f61556b == i5) {
                return aVar;
            }
        }
        return null;
    }

    public final b t(int i5) {
        ArrayList arrayList = this.f87237d;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            b bVar = (b) arrayList.get(i11);
            if (bVar.f61556b == i5) {
                return bVar;
            }
        }
        return null;
    }

    @Override // ie.a
    public final String toString() {
        return ie.a.c(this.f61556b) + " leaves: " + Arrays.toString(this.f87237d.toArray()) + " containers: " + Arrays.toString(this.f87238e.toArray());
    }
}
