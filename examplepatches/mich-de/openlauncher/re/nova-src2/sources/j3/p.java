package j3;

import androidx.compose.ui.Modifier$Node;
import b3.p2;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class p extends Modifier$Node implements p2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Lambda f68819a;

    /* JADX WARN: Multi-variable type inference failed */
    public p(Function1 function1) {
        this.f68819a = (Lambda) function1;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.Lambda] */
    @Override // b3.p2
    public final void applySemantics(b0 b0Var) {
        this.f68819a.invoke(b0Var);
    }
}
