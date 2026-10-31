package b4;

import b3.i2;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class l extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f17478j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ m f17479k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l(m mVar, int i5) {
        super(0);
        this.f17478j = i5;
        this.f17479k = mVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v0, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.Lambda] */
    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f17478j;
        m mVar = this.f17479k;
        switch (i5) {
            case 0:
                mVar.f17503y.invalidateLayer$ui_release();
                break;
            default:
                if (mVar.f17485e && mVar.isAttachedToWindow() && mVar.f17482b.getParent() == mVar) {
                    if (!mVar.isAttachedToWindow()) {
                        y2.a.b("Expected AndroidViewHolder to be attached when observing reads.");
                    }
                    i2 snapshotObserver = mVar.f17483c.getSnapshotObserver();
                    int i11 = m.f17480z;
                    snapshotObserver.a(mVar, c.f17450k, mVar.f17484d);
                }
                break;
        }
        return Unit.f71706a;
    }
}
