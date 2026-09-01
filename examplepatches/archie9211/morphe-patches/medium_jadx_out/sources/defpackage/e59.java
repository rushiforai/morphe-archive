package defpackage;

import android.text.Spannable;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.URLSpan;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.obv.post.ParagraphType;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e59 implements rv3 {
    public final fi9 a;

    public e59(fi9 fi9Var) {
        this.a = fi9Var;
    }

    public static l29 f(CharSequence charSequence) {
        MarkupModel markupModelB;
        Integer num;
        ParagraphPb paragraphPb = new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        l29 l29Var = new l29();
        l29Var.a = paragraphPb;
        l29Var.f();
        l29Var.k(charSequence.toString());
        if (charSequence instanceof Spannable) {
            Spannable spannable = (Spannable) charSequence;
            Object[] spans = spannable.getSpans(0, charSequence.length(), Object.class);
            spans.getClass();
            for (Object obj : spans) {
                if (obj instanceof ni7) {
                    ni7 ni7Var = (ni7) obj;
                    int spanStart = spannable.getSpanStart(ni7Var);
                    int spanEnd = spannable.getSpanEnd(ni7Var);
                    markupModelB = ni7Var.b();
                    Integer num2 = markupModelB.start;
                    if (num2 == null || num2.intValue() != spanStart || (num = markupModelB.end) == null || num.intValue() != spanEnd) {
                        markupModelB = MarkupModel.copy$default(markupModelB, null, Integer.valueOf(spanStart), Integer.valueOf(spanEnd), null, null, null, null, null, null, null, null, null, 4089, null);
                    }
                } else if (obj instanceof URLSpan) {
                    Map map = si7.a;
                    markupModelB = si7.b(spannable.getSpanStart(obj), spannable.getSpanEnd(obj), ((URLSpan) obj).getURL());
                } else {
                    markupModelB = null;
                }
                if (markupModelB != null) {
                    l29Var.a(markupModelB);
                }
            }
        }
        return l29Var;
    }

    @Override // defpackage.rv3
    public final nu3 e(int i, CharSequence charSequence, int i2, int i3, Spanned spanned, int i4, int i5) {
        CharSequence charSequenceSubSequence = charSequence.subSequence(i2, i3);
        if (charSequenceSubSequence.length() <= 1 || TextUtils.indexOf(charSequenceSubSequence, "\n\n") == -1) {
            return null;
        }
        return new mde(this, i, charSequence.subSequence(i2, i3), i4, i5);
    }
}
