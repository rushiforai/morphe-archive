package fr;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.CancellationException;
import kotlin.Result;
import kotlin.ResultKt;

/* loaded from: classes4.dex */
public final class o implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55670a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t70.m f55671b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ListenableFuture f55672c;

    public /* synthetic */ o(t70.m mVar, ListenableFuture listenableFuture, int i5) {
        this.f55670a = i5;
        this.f55671b = mVar;
        this.f55672c = listenableFuture;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = this.f55670a;
        ListenableFuture listenableFuture = this.f55672c;
        t70.m mVar = this.f55671b;
        switch (i5) {
            case 0:
                try {
                    int i11 = Result.f71687b;
                    mVar.resumeWith(listenableFuture.get());
                    break;
                } catch (Throwable th2) {
                    Throwable cause = th2.getCause();
                    if (cause == null) {
                        cause = th2;
                    }
                    if (th2 instanceof CancellationException) {
                        mVar.a(cause);
                        return;
                    } else {
                        int i12 = Result.f71687b;
                        mVar.resumeWith(ResultKt.a(cause));
                        return;
                    }
                }
            default:
                try {
                    int i13 = Result.f71687b;
                    mVar.resumeWith(listenableFuture.get());
                    break;
                } catch (Throwable th3) {
                    Throwable cause2 = th3.getCause();
                    if (cause2 == null) {
                        cause2 = th3;
                    }
                    if (th3 instanceof CancellationException) {
                        mVar.a(cause2);
                        return;
                    } else {
                        int i14 = Result.f71687b;
                        mVar.resumeWith(ResultKt.a(cause2));
                    }
                }
        }
    }
}
