package io.sentry.android.core.internal.threaddump;

import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f66923a;

    /* renamed from: b, reason: collision with root package name */
    public final int f66924b;

    /* renamed from: c, reason: collision with root package name */
    public int f66925c;

    public b(ArrayList arrayList) {
        this.f66923a = arrayList;
        this.f66924b = arrayList.size();
    }

    public final a a() {
        int i5 = this.f66925c;
        if (i5 < 0 || i5 >= this.f66924b) {
            return null;
        }
        this.f66925c = i5 + 1;
        return (a) this.f66923a.get(i5);
    }
}
