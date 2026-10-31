package nova.branch.engage.sesame_lite.internal;

import java.util.LinkedHashMap;
import kotlin.jvm.functions.Function2;

/* loaded from: classes5.dex */
public final /* synthetic */ class p implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78444a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ LinkedHashMap f78445b;

    public /* synthetic */ p(LinkedHashMap linkedHashMap, int i5) {
        this.f78444a = i5;
        this.f78445b = linkedHashMap;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int iZeroState$lambda$30$lambda$18;
        switch (this.f78444a) {
            case 0:
                iZeroState$lambda$30$lambda$18 = SesameLiteImpl.zeroState$lambda$30$lambda$18(this.f78445b, (LinkEntity) obj, (LinkEntity) obj2);
                break;
            default:
                iZeroState$lambda$30$lambda$18 = SesameLiteImpl.createContactShortcutActions$lambda$76(this.f78445b, (r80.b) obj, (r80.b) obj2);
                break;
        }
        return Integer.valueOf(iZeroState$lambda$30$lambda$18);
    }
}
