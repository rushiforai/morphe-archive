package f10;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import e00.b4;
import e10.y2;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import o9.u2;

/* loaded from: classes4.dex */
public abstract class d extends FancyPrefView {
    public static final /* synthetic */ int R = 0;
    public DialogInterface K;
    public int L;
    public CharSequence M;
    public final String N;
    public String O;
    public Function1 P;
    public b4 Q;

    public d(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.N = context.getString(2132017603);
        this.O = context.getString(2132017756);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.o);
        try {
            CharSequence string = typedArrayObtainStyledAttributes.getString(0);
            if (string == null) {
                TextView textView = this.f46010r;
                string = textView != null ? textView.getText() : null;
            }
            this.M = string;
            this.L = typedArrayObtainStyledAttributes.getResourceId(1, 0);
            typedArrayObtainStyledAttributes.recycle();
            setOnClickListener(new ay.k(this, 19));
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }

    public abstract Function0 K(View view);

    public void L() {
        Context context = this.f46008p;
        d9.f fVar = new d9.f(context);
        if ((context.getResources().getConfiguration().uiMode & 48) == 32) {
            fVar.E = r4.a.j(-2144325584, ((Number) y2.f51877a.P0().l()).intValue());
        }
        String str = this.O;
        if (str != null) {
            String str2 = this.N;
            if (str2 != null) {
                fVar.f49045j = str2;
            }
            fVar.f49043h = str;
        }
        CharSequence charSequence = this.M;
        if (charSequence != null) {
            fVar.f49037b = charSequence;
        }
        View viewInflate = this.L != 0 ? LayoutInflater.from(context).inflate(this.L, (ViewGroup) null, false) : new FrameLayout(context);
        Function0 function0K = K(viewInflate);
        Function1 function1 = this.P;
        if (function1 != null) {
            function1.invoke(viewInflate);
        }
        fVar.g(viewInflate, false);
        d9.c[] cVarArr = {this.O == null ? d9.c.f49028a : d9.c.f49030c};
        fVar.f49054u = new ae.i(cVarArr, 28);
        d9.j jVarP = fVar.p();
        jVarP.setOnDismissListener(new c(function0K, cVarArr, this, viewInflate, 0));
        ex.i.P(jVarP);
        this.K = jVarP;
    }
}
