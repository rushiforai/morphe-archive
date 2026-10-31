package n4;

import android.util.SparseIntArray;
import android.view.FrameMetrics;
import android.view.Window;

/* loaded from: classes2.dex */
public final class j implements Window.OnFrameMetricsAvailableListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ og.g f77811a;

    public j(og.g gVar) {
        this.f77811a = gVar;
    }

    @Override // android.view.Window.OnFrameMetricsAvailableListener
    public final void onFrameMetricsAvailable(Window window, FrameMetrics frameMetrics, int i5) {
        og.g gVar = this.f77811a;
        int i11 = gVar.f80406a;
        if ((i11 & 1) != 0) {
            og.g.b(((SparseIntArray[]) gVar.f80407b)[0], frameMetrics.getMetric(8));
        }
        if ((i11 & 2) != 0) {
            og.g.b(((SparseIntArray[]) gVar.f80407b)[1], frameMetrics.getMetric(1));
        }
        if ((i11 & 4) != 0) {
            og.g.b(((SparseIntArray[]) gVar.f80407b)[2], frameMetrics.getMetric(3));
        }
        if ((i11 & 8) != 0) {
            og.g.b(((SparseIntArray[]) gVar.f80407b)[3], frameMetrics.getMetric(4));
        }
        if ((i11 & 16) != 0) {
            og.g.b(((SparseIntArray[]) gVar.f80407b)[4], frameMetrics.getMetric(5));
        }
        if ((i11 & 64) != 0) {
            og.g.b(((SparseIntArray[]) gVar.f80407b)[6], frameMetrics.getMetric(7));
        }
        if ((i11 & 32) != 0) {
            og.g.b(((SparseIntArray[]) gVar.f80407b)[5], frameMetrics.getMetric(6));
        }
        if ((i11 & 128) != 0) {
            og.g.b(((SparseIntArray[]) gVar.f80407b)[7], frameMetrics.getMetric(0));
        }
        if ((i11 & 256) != 0) {
            og.g.b(((SparseIntArray[]) gVar.f80407b)[8], frameMetrics.getMetric(2));
        }
    }
}
