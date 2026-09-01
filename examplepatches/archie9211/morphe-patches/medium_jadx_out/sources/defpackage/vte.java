package defpackage;

import android.content.Context;
import android.content.ContextWrapper;
import android.view.LayoutInflater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vte extends ContextWrapper {
    public LayoutInflater a;
    public LayoutInflater b;

    /* JADX WARN: Illegal instructions before constructor call */
    public vte(LayoutInflater layoutInflater, j15 j15Var) {
        layoutInflater.getClass();
        Context context = layoutInflater.getContext();
        context.getClass();
        super(context);
        ywa ywaVar = new ywa(6, this);
        this.a = layoutInflater;
        j15Var.getClass();
        j15Var.O.a(ywaVar);
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public final Object getSystemService(String str) {
        if (!"layout_inflater".equals(str)) {
            return getBaseContext().getSystemService(str);
        }
        LayoutInflater layoutInflater = this.b;
        if (layoutInflater != null) {
            return layoutInflater;
        }
        LayoutInflater layoutInflater2 = this.a;
        if (layoutInflater2 == null) {
            layoutInflater2 = (LayoutInflater) getBaseContext().getSystemService("layout_inflater");
            this.a = layoutInflater2;
        }
        LayoutInflater layoutInflaterCloneInContext = layoutInflater2.cloneInContext(this);
        this.b = layoutInflaterCloneInContext;
        return layoutInflaterCloneInContext;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vte(Context context, j15 j15Var) {
        super(context);
        context.getClass();
        ywa ywaVar = new ywa(6, this);
        this.a = null;
        j15Var.getClass();
        j15Var.O.a(ywaVar);
    }
}
