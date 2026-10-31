package b3;

import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.NodeChain;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class m1 {

    /* renamed from: a, reason: collision with root package name */
    public Modifier$Node f17290a;

    /* renamed from: b, reason: collision with root package name */
    public int f17291b;

    /* renamed from: c, reason: collision with root package name */
    public r1.e f17292c;

    /* renamed from: d, reason: collision with root package name */
    public r1.e f17293d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f17294e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ NodeChain f17295f;

    public m1(NodeChain nodeChain, Modifier$Node modifier$Node, int i5, r1.e eVar, r1.e eVar2, boolean z11) {
        this.f17295f = nodeChain;
        this.f17290a = modifier$Node;
        this.f17291b = i5;
        this.f17292c = eVar;
        this.f17293d = eVar2;
        this.f17294e = z11;
    }

    public final boolean a(int i5, int i11) {
        r1.e eVar = this.f17292c;
        int i12 = this.f17291b;
        b2.s sVar = (b2.s) eVar.f85077a[i5 + i12];
        b2.s sVar2 = (b2.s) this.f17293d.f85077a[i12 + i11];
        return Intrinsics.b(sVar, sVar2) || sVar.getClass() == sVar2.getClass();
    }

    public final void b(r1.e eVar) {
        this.f17293d = eVar;
    }

    public final void c(r1.e eVar) {
        this.f17292c = eVar;
    }

    public final void d(Modifier$Node modifier$Node) {
        this.f17290a = modifier$Node;
    }

    public final void e(int i5) {
        this.f17291b = i5;
    }

    public final void f(boolean z11) {
        this.f17294e = z11;
    }
}
