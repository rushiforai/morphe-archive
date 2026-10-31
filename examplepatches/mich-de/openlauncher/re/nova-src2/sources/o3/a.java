package o3;

import android.text.SegmentFinder;
import m.w;

/* loaded from: classes2.dex */
public final class a extends SegmentFinder {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ w f79457a;

    public a(w wVar) {
        this.f79457a = wVar;
    }

    public final int nextEndBoundary(int i5) {
        return this.f79457a.e(i5);
    }

    public final int nextStartBoundary(int i5) {
        return this.f79457a.c(i5);
    }

    public final int previousEndBoundary(int i5) {
        return this.f79457a.f(i5);
    }

    public final int previousStartBoundary(int i5) {
        return this.f79457a.d(i5);
    }
}
