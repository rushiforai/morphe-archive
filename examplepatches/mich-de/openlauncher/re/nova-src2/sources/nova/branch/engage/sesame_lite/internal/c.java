package nova.branch.engage.sesame_lite.internal;

import java.util.ArrayList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final /* synthetic */ class c implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78394a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ DataImporters f78395b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ArrayList f78396c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f78397d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f78398e;

    public /* synthetic */ c(DataImporters dataImporters, ArrayList arrayList, boolean z11, Ref.ObjectRef objectRef) {
        this.f78395b = dataImporters;
        this.f78396c = arrayList;
        this.f78397d = z11;
        this.f78398e = objectRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f78394a) {
            case 0:
                ArrayList arrayList = this.f78396c;
                return DataImporters.pullContacts$lambda$58(this.f78397d, this.f78398e, arrayList, this.f78395b, (DbView) obj);
            default:
                return DataImporters.pullContacts$lambda$67(this.f78395b, this.f78396c, this.f78397d, this.f78398e, (DbView) obj);
        }
    }

    public /* synthetic */ c(boolean z11, Ref.ObjectRef objectRef, ArrayList arrayList, DataImporters dataImporters) {
        this.f78397d = z11;
        this.f78398e = objectRef;
        this.f78396c = arrayList;
        this.f78395b = dataImporters;
    }
}
