package b4;

import android.graphics.Rect;
import android.view.FocusFinder;
import android.view.View;
import android.view.ViewGroup;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class t extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f17523j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ u f17524k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t(u uVar, int i5) {
        super(1);
        this.f17523j = i5;
        this.f17524k = uVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f17523j) {
            case 0:
                g2.a aVar = (g2.a) obj;
                u uVar = this.f17524k;
                View viewC = o.c(uVar);
                if (!viewC.isFocused() && !viewC.hasFocus()) {
                    if (!u90.b.Z(viewC, u90.b.h0(aVar.b()), o.b(b3.o.g(uVar).getFocusOwner(), b3.g.g(uVar), viewC))) {
                        aVar.a();
                    }
                }
                return Unit.f71706a;
            default:
                g2.a aVar2 = (g2.a) obj;
                u uVar2 = this.f17524k;
                View viewC2 = o.c(uVar2);
                if (viewC2.hasFocus()) {
                    g2.j focusOwner = b3.o.g(uVar2).getFocusOwner();
                    View viewG = b3.g.g(uVar2);
                    if (viewC2 instanceof ViewGroup) {
                        Rect rectB = o.b(focusOwner, viewG, viewC2);
                        Integer numH0 = u90.b.h0(aVar2.b());
                        int iIntValue = numH0 != null ? numH0.intValue() : Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE;
                        FocusFinder focusFinder = FocusFinder.getInstance();
                        View view = uVar2.f17525a;
                        View viewFindNextFocus = view != null ? focusFinder.findNextFocus((ViewGroup) viewG, view, iIntValue) : focusFinder.findNextFocusFromRect((ViewGroup) viewG, rectB, iIntValue);
                        if (viewFindNextFocus != null && o.a(viewC2, viewFindNextFocus)) {
                            viewFindNextFocus.requestFocus(iIntValue, rectB);
                            aVar2.a();
                        } else if (!viewG.requestFocus()) {
                            throw new IllegalStateException("host view did not take focus");
                        }
                    } else if (!viewG.requestFocus()) {
                        throw new IllegalStateException("host view did not take focus");
                    }
                }
                return Unit.f71706a;
        }
    }
}
