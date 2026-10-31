package f2;

import androidx.compose.ui.Modifier$Node;
import b3.q;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class d extends Modifier$Node implements q {

    /* renamed from: a, reason: collision with root package name */
    public Function1 f54232a;

    @Override // b3.q
    public final void draw(k2.c cVar) {
        this.f54232a.invoke(cVar);
        cVar.drawContent();
    }
}
