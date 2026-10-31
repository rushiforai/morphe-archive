package nova.branch.engage.sesame_lite.internal;

import java.util.Comparator;
import kotlin.jvm.functions.Function2;

/* loaded from: classes5.dex */
public final /* synthetic */ class q implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78446a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function2 f78447b;

    public /* synthetic */ q(Function2 function2, int i5) {
        this.f78446a = i5;
        this.f78447b = function2;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f78446a) {
            case 0:
                return SesameLiteImpl.zeroState$lambda$30$lambda$19((p) this.f78447b, obj, obj2);
            case 1:
                return SesameLiteImpl.searchMore$lambda$58$lambda$56((x) this.f78447b, obj, obj2);
            default:
                return SesameLiteImpl.createContactShortcutActions$lambda$77((p) this.f78447b, obj, obj2);
        }
    }
}
