package t70;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f88785b = AtomicIntegerFieldUpdater.newUpdater(e.class, "notCompletedCount$volatile");

    /* renamed from: a, reason: collision with root package name */
    public final p0[] f88786a;
    private volatile /* synthetic */ int notCompletedCount$volatile;

    public e(p0[] p0VarArr) {
        this.f88786a = p0VarArr;
        this.notCompletedCount$volatile = p0VarArr.length;
    }
}
