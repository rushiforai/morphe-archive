package d10;

import android.graphics.Bitmap;
import android.view.PixelCopy;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements PixelCopy.OnPixelCopyFinishedListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48819a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f48820b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f48821c;

    public /* synthetic */ b(int i5, Object obj, Object obj2) {
        this.f48819a = i5;
        this.f48820b = obj;
        this.f48821c = obj2;
    }

    @Override // android.view.PixelCopy.OnPixelCopyFinishedListener
    public final void onPixelCopyFinished(int i5) {
        switch (this.f48819a) {
            case 0:
                cs.h hVar = (cs.h) this.f48820b;
                Bitmap bitmap = (Bitmap) this.f48821c;
                if (i5 == 0) {
                    hVar.invoke(bitmap);
                    break;
                }
                break;
            case 1:
                AtomicBoolean atomicBoolean = (AtomicBoolean) this.f48820b;
                CountDownLatch countDownLatch = (CountDownLatch) this.f48821c;
                atomicBoolean.set(i5 == 0);
                countDownLatch.countDown();
                break;
            default:
                com.vungle.ads.internal.util.j.a((Function1) this.f48820b, (Bitmap) this.f48821c, i5);
                break;
        }
    }
}
