package defpackage;

import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.text.style.UpdateAppearance;
import android.view.View;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.obv.post.ParagraphType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dk extends ClickableSpan implements ni7, UpdateAppearance {
    public final ParagraphType a;
    public final MarkupModel b;
    public final ps5 c;

    public dk(ParagraphType paragraphType, MarkupModel markupModel, ps5 ps5Var) {
        paragraphType.getClass();
        this.a = paragraphType;
        this.b = markupModel;
        this.c = ps5Var;
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
        if ((this.a == ParagraphType.MIXTAPE_EMBED ? ck.NONE : ck.SIMPLE) == ck.SIMPLE) {
            textPaint.setUnderlineText(true);
        }
    }
}
