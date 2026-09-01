package defpackage;

import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SelectionPb;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nde implements nu3 {
    public final /* synthetic */ l29 a;
    public final /* synthetic */ int b;
    public final /* synthetic */ int c;
    public final /* synthetic */ String d;
    public final /* synthetic */ ode e;
    public final /* synthetic */ int f;

    public nde(l29 l29Var, int i, int i2, String str, ode odeVar, int i3) {
        this.a = l29Var;
        this.b = i;
        this.c = i2;
        this.d = str;
        this.e = odeVar;
        this.f = i3;
    }

    @Override // java.lang.Runnable
    public final void run() {
        l29 l29Var = this.a;
        int i = this.b;
        MarkupModel markupModelC = l29Var.c(i, false);
        if (markupModelC != null) {
            l29Var.h(markupModelC);
        }
        int i2 = this.c;
        MarkupModel markupModelC2 = l29Var.c(i2, false);
        if (markupModelC2 != null) {
            l29Var.h(markupModelC2);
        }
        l29Var.i(i, i2);
        String str = this.d;
        l29Var.e(i, str);
        fi9 fi9Var = this.e.a;
        ParagraphPb paragraphPb = l29Var.a;
        d73 d73Var = d73.COMMAND;
        int i3 = this.f;
        ((EditPostBodyView) fi9Var).s(i3, paragraphPb, d73Var);
        SelectionPb selectionPb = rxb.a;
        fi9Var.setSelection(rxb.a(i3, str.length() + i));
    }
}
