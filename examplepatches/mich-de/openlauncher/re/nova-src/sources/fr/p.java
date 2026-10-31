package fr;

import com.google.common.util.concurrent.ListenableFuture;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class p extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f55678j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ ListenableFuture f55679k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ p(ListenableFuture listenableFuture, int i5) {
        super(1);
        this.f55678j = i5;
        this.f55679k = listenableFuture;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f55678j) {
            case 0:
                this.f55679k.cancel(false);
                break;
            default:
                this.f55679k.cancel(false);
                break;
        }
        return Unit.f71706a;
    }
}
