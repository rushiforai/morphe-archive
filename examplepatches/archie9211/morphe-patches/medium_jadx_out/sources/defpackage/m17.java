package defpackage;

import android.text.Spanned;
import android.text.TextUtils;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.ParagraphType;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m17 implements rv3 {
    public static final Pattern b = Pattern.compile("^(?:1[.)]|[*\\-+•])");
    public final fi9 a;

    public m17(fi9 fi9Var) {
        this.a = fi9Var;
    }

    @Override // defpackage.rv3
    public final nu3 e(final int i, CharSequence charSequence, int i2, int i3, Spanned spanned, int i4, int i5) {
        final ParagraphPb paragraphPbR;
        if (!TextUtils.equals(charSequence.subSequence(i2, i3), " ") || i4 <= 0 || i4 > 2 || (paragraphPbR = ((EditPostBodyView) this.a).r(i)) == null || paragraphPbR.type != ParagraphType.P) {
            return null;
        }
        String str = paragraphPbR.text;
        if (str == null) {
            str = "";
        }
        final Matcher matcher = b.matcher(str);
        if (matcher.find()) {
            return new nu3() { // from class: l17
                @Override // java.lang.Runnable
                public final void run() {
                    fi9 fi9Var = this.a;
                    String strGroup = matcher.group();
                    l29 l29Var = new l29();
                    l29Var.a = paragraphPbR;
                    l29Var.f();
                    l29Var.l(strGroup.charAt(0) == '1' ? ParagraphType.OLI : ParagraphType.ULI);
                    l29Var.i(0, strGroup.length());
                    ParagraphPb paragraphPb = l29Var.a;
                    d73 d73Var = d73.COMMAND;
                    int i6 = i;
                    ((EditPostBodyView) fi9Var).s(i6, paragraphPb, d73Var);
                    SelectionPb selectionPb = rxb.a;
                    fi9Var.setSelection(rxb.a(i6, 0));
                }
            };
        }
        return null;
    }
}
