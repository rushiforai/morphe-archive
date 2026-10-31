package e2;

import b3.t2;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class e extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f51993j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(cm.f fVar, g gVar, Ref.BooleanRef booleanRef) {
        super(1);
        this.f51993j = booleanRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        g gVar = (g) obj;
        if (!gVar.getIsAttached()) {
            return t2.f17371b;
        }
        if (gVar.f51999c != null) {
            y2.a.b("DragAndDropTarget self reference must be null at the start of a drag and drop session");
        }
        gVar.f51999c = null;
        Ref.BooleanRef booleanRef = this.f51993j;
        booleanRef.f71859a = booleanRef.f71859a;
        return t2.f17370a;
    }
}
