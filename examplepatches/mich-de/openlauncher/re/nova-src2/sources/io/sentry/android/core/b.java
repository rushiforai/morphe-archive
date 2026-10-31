package io.sentry.android.core;

import android.app.Activity;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.SparseIntArray;
import androidx.core.app.FrameMetricsAggregator;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f66847a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ bn.s0 f66848b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Activity f66849c;

    public /* synthetic */ b(bn.s0 s0Var, Activity activity, int i5) {
        this.f66847a = i5;
        this.f66848b = s0Var;
        this.f66849c = activity;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Activity activity;
        switch (this.f66847a) {
            case 0:
                og.g gVar = ((FrameMetricsAggregator) this.f66848b.f18279b).f14217a;
                gVar.getClass();
                if (og.g.f80404f == null) {
                    HandlerThread handlerThread = new HandlerThread("FrameMetricsAggregator");
                    og.g.f80404f = handlerThread;
                    handlerThread.start();
                    og.g.f80405g = new Handler(og.g.f80404f.getLooper());
                }
                for (int i5 = 0; i5 <= 8; i5++) {
                    SparseIntArray[] sparseIntArrayArr = (SparseIntArray[]) gVar.f80407b;
                    if (sparseIntArrayArr[i5] == null && (gVar.f80406a & (1 << i5)) != 0) {
                        sparseIntArrayArr[i5] = new SparseIntArray();
                    }
                }
                Activity activity2 = this.f66849c;
                activity2.getWindow().addOnFrameMetricsAvailableListener((n4.j) gVar.f80409d, og.g.f80405g);
                ((ArrayList) gVar.f80408c).add(new WeakReference(activity2));
                break;
            default:
                og.g gVar2 = ((FrameMetricsAggregator) this.f66848b.f18279b).f14217a;
                ArrayList arrayList = (ArrayList) gVar2.f80408c;
                Iterator it = arrayList.iterator();
                while (true) {
                    boolean zHasNext = it.hasNext();
                    activity = this.f66849c;
                    if (zHasNext) {
                        WeakReference weakReference = (WeakReference) it.next();
                        if (weakReference.get() == activity) {
                            arrayList.remove(weakReference);
                        }
                    }
                }
                activity.getWindow().removeOnFrameMetricsAvailableListener((n4.j) gVar2.f80409d);
                break;
        }
    }
}
