package b2;

import h6.c1;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class m implements t {

    /* renamed from: a, reason: collision with root package name */
    public final t f17017a;

    /* renamed from: b, reason: collision with root package name */
    public final t f17018b;

    public m(t tVar, t tVar2) {
        this.f17017a = tVar;
        this.f17018b = tVar2;
    }

    @Override // b2.t
    public final boolean all(Function1 function1) {
        return this.f17017a.all(function1) && this.f17018b.all(function1);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return Intrinsics.b(this.f17017a, mVar.f17017a) && Intrinsics.b(this.f17018b, mVar.f17018b);
    }

    @Override // b2.t
    public final Object foldIn(Object obj, Function2 function2) {
        return this.f17018b.foldIn(this.f17017a.foldIn(obj, function2), function2);
    }

    public final int hashCode() {
        return (this.f17018b.hashCode() * 31) + this.f17017a.hashCode();
    }

    public final String toString() {
        return c1.t(new StringBuilder("["), (String) foldIn(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, l.f17016j), AbstractJsonLexerKt.END_LIST);
    }
}
