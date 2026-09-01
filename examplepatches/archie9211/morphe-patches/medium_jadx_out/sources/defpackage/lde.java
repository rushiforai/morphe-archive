package defpackage;

import android.content.Context;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import com.medium.proto.model.MarkupModel;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lde extends ClickableSpan implements ni7 {
    public final Context a;
    public final MarkupModel b;
    public final m45 c;

    public lde(Context context, MarkupModel markupModel, m45 m45Var) {
        context.getClass();
        this.a = context;
        this.b = markupModel;
        this.c = m45Var;
    }

    @Override // defpackage.ni7
    public final MarkupModel b() {
        return this.b;
    }

    @Override // android.text.style.ClickableSpan
    public final void onClick(View view) {
        view.getClass();
        this.c.invoke();
    }

    @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        textPaint.getClass();
        Integer numValueOf = Integer.valueOf(hlg.B(this.a, R.attr.colorAccentTextNormal, -1));
        if (numValueOf.intValue() == -1) {
            numValueOf = null;
        }
        if (numValueOf != null) {
            textPaint.setColor(numValueOf.intValue());
        }
    }
}
