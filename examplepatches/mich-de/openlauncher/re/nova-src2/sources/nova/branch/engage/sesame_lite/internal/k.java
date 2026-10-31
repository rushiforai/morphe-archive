package nova.branch.engage.sesame_lite.internal;

import android.app.AppOpsManager;
import android.content.Context;
import kotlin.jvm.functions.Function0;
import nova.branch.engage.sesame_lite.internal.ListenersKt;

/* loaded from: classes.dex */
public final /* synthetic */ class k implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78424a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f78425b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f78426c;

    public /* synthetic */ k(int i5, Object obj, Object obj2) {
        this.f78424a = i5;
        this.f78425b = obj;
        this.f78426c = obj2;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f78424a) {
            case 0:
                return ListenersKt.AnonymousClass1.invokeSuspend$lambda$0((Context) this.f78425b, (ListenersKt$broadcastReceiverFlow$1$receiver$1) this.f78426c);
            default:
                return ListenersKt.C35171.invokeSuspend$lambda$1((AppOpsManager) this.f78425b, (l) this.f78426c);
        }
    }
}
