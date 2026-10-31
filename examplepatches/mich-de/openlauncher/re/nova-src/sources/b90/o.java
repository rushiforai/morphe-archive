package b90;

import java.util.ArrayList;

/* loaded from: classes.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public int f17722a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f17723b;

    public o(ArrayList arrayList) {
        this.f17723b = arrayList;
    }

    public boolean a() {
        return this.f17722a < this.f17723b.size();
    }

    public o(int i5) {
        this.f17722a = i5;
        this.f17723b = new ArrayList(i5);
    }
}
