package androidx.compose.ui.input.pointer;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import v2.l0;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/input/pointer/SuspendPointerInputElement;", "Lb3/j1;", "Lv2/l0;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final class SuspendPointerInputElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final Object f14153b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f14154c;

    /* renamed from: d, reason: collision with root package name */
    public final PointerInputEventHandler f14155d;

    public SuspendPointerInputElement(Object obj, Object obj2, PointerInputEventHandler pointerInputEventHandler, int i5) {
        obj2 = (i5 & 2) != 0 ? null : obj2;
        this.f14153b = obj;
        this.f14154c = obj2;
        this.f14155d = pointerInputEventHandler;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new l0(this.f14153b, this.f14154c, this.f14155d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SuspendPointerInputElement)) {
            return false;
        }
        SuspendPointerInputElement suspendPointerInputElement = (SuspendPointerInputElement) obj;
        return Intrinsics.b(this.f14153b, suspendPointerInputElement.f14153b) && Intrinsics.b(this.f14154c, suspendPointerInputElement.f14154c) && this.f14155d == suspendPointerInputElement.f14155d;
    }

    public final int hashCode() {
        Object obj = this.f14153b;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * 31;
        Object obj2 = this.f14154c;
        return this.f14155d.hashCode() + ((iHashCode + (obj2 != null ? obj2.hashCode() : 0)) * 961);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("pointerInput");
        q2Var.b().b("key1", this.f14153b);
        q2Var.b().b("key2", this.f14154c);
        q2Var.b().b(UserMetadata.KEYDATA_FILENAME, null);
        q2Var.b().b("pointerInputEventHandler", this.f14155d);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        l0 l0Var = (l0) modifier$Node;
        Object obj = l0Var.f91965a;
        Object obj2 = this.f14153b;
        boolean z11 = !Intrinsics.b(obj, obj2);
        l0Var.f91965a = obj2;
        Object obj3 = l0Var.f91966b;
        Object obj4 = this.f14154c;
        if (!Intrinsics.b(obj3, obj4)) {
            z11 = true;
        }
        l0Var.f91966b = obj4;
        Class<?> cls = l0Var.f91967c.getClass();
        PointerInputEventHandler pointerInputEventHandler = this.f14155d;
        if (cls == pointerInputEventHandler.getClass() ? z11 : true) {
            l0Var.F();
        }
        l0Var.f91967c = pointerInputEventHandler;
    }
}
