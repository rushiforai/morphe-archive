package fi;

import com.google.android.gms.tasks.Task;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class l implements g, f, d, e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55138a;

    /* renamed from: b, reason: collision with root package name */
    public final CountDownLatch f55139b;

    public /* synthetic */ l(CountDownLatch countDownLatch) {
        this.f55138a = 1;
        this.f55139b = countDownLatch;
    }

    public boolean a() {
        return this.f55139b.await(5L, TimeUnit.SECONDS);
    }

    public void b() {
        this.f55139b.await();
    }

    public boolean c(long j11, TimeUnit timeUnit) {
        return this.f55139b.await(j11, timeUnit);
    }

    @Override // fi.f
    public void i(Exception exc) {
        switch (this.f55138a) {
            case 0:
                this.f55139b.countDown();
                break;
            default:
                this.f55139b.countDown();
                break;
        }
    }

    @Override // fi.d
    public void onCanceled() {
        switch (this.f55138a) {
            case 0:
                this.f55139b.countDown();
                break;
            default:
                this.f55139b.countDown();
                break;
        }
    }

    @Override // fi.e
    public /* synthetic */ void onComplete(Task task) {
        this.f55139b.countDown();
    }

    @Override // fi.g
    public void onSuccess(Object obj) {
        switch (this.f55138a) {
            case 0:
                this.f55139b.countDown();
                break;
            default:
                this.f55139b.countDown();
                break;
        }
    }

    public l(int i5) {
        this.f55138a = i5;
        switch (i5) {
            case 2:
                this.f55139b = new CountDownLatch(1);
                break;
            default:
                this.f55139b = new CountDownLatch(1);
                break;
        }
    }
}
