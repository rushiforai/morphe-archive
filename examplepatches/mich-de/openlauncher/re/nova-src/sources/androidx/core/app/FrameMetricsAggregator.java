package androidx.core.app;

import android.util.SparseIntArray;
import java.util.ArrayList;
import n4.j;
import og.g;

/* loaded from: classes2.dex */
public class FrameMetricsAggregator {

    /* renamed from: a, reason: collision with root package name */
    public final g f14217a;

    public FrameMetricsAggregator() {
        this(1);
    }

    public FrameMetricsAggregator(int i5) {
        g gVar = new g();
        gVar.f80407b = new SparseIntArray[9];
        gVar.f80408c = new ArrayList();
        gVar.f80409d = new j(gVar);
        gVar.f80406a = i5;
        this.f14217a = gVar;
    }
}
