package ads_mobile_sdk;

import b.f0;
import java.lang.ref.PhantomReference;
import java.lang.ref.ReferenceQueue;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class nu0 extends PhantomReference {

    /* renamed from: a, reason: collision with root package name */
    public final f0 f7676a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nu0(f0 task, Object a11, ReferenceQueue queue) {
        super(a11, queue);
        Intrinsics.g(task, "task");
        Intrinsics.g(a11, "a");
        Intrinsics.g(queue, "queue");
        this.f7676a = task;
    }
}
