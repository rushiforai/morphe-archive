package b3;

import androidx.compose.ui.node.LayoutNode;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class j extends Lambda implements Function0 {

    /* renamed from: k, reason: collision with root package name */
    public static final j f17266k;

    /* renamed from: l, reason: collision with root package name */
    public static final j f17267l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f17268j;

    static {
        int i5 = 0;
        f17266k = new j(i5, 0);
        f17267l = new j(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j(int i5, int i11) {
        super(i5);
        this.f17268j = i11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f17268j) {
            case 0:
                return new LayoutNode(true, 0, 2, null);
            default:
                return new LayoutNode(false, 0, 3, null);
        }
    }
}
