package defpackage;

import android.text.Spanned;
import android.widget.AutoCompleteTextView;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SelectionPb;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ode implements rv3, ou3 {
    public final fi9 a;
    public final AutoCompleteTextView b;

    public ode(fi9 fi9Var, AutoCompleteTextView autoCompleteTextView) {
        autoCompleteTextView.getClass();
        this.a = fi9Var;
        this.b = autoCompleteTextView;
    }

    @Override // defpackage.ou3
    public final boolean a(SelectionPb selectionPb) {
        selectionPb.getClass();
        return false;
    }

    @Override // defpackage.ou3
    public final boolean b(yw1 yw1Var) {
        return yw1Var.equals(xw1.a);
    }

    @Override // defpackage.ou3
    public final void d(yw1 yw1Var, SelectionPb selectionPb) {
        selectionPb.getClass();
        int i = selectionPb.start.paragraph_index;
        fi9 fi9Var = this.a;
        EditPostBodyView editPostBodyView = (EditPostBodyView) fi9Var;
        ParagraphPb paragraphPbR = editPostBodyView.r(i);
        if (paragraphPbR == null) {
            return;
        }
        l29 l29Var = new l29();
        l29Var.a = paragraphPbR;
        l29Var.f();
        int i2 = selectionPb.start.offset;
        String str = l29Var.a.text;
        if (str == null) {
            str = "";
        }
        String strConcat = (i2 <= 0 || str.charAt(i2 + (-1)) == ' ') ? "@" : " @";
        if (i2 < str.length() && str.charAt(i2) != ' ') {
            strConcat = strConcat.concat(" ");
        }
        l29Var.e(i2, strConcat);
        editPostBodyView.s(i, l29Var.a, d73.COMMAND);
        SelectionPb selectionPb2 = rxb.a;
        fi9Var.setSelection(rxb.a(i, muc.Z(strConcat, "@", 0, false, 6) + i2 + 1));
        this.b.showDropDown();
    }

    @Override // defpackage.rv3
    public final nu3 e(int i, CharSequence charSequence, int i2, int i3, Spanned spanned, int i4, int i5) {
        String str;
        int i6;
        Integer num;
        lde[] ldeVarArr = (lde[]) spanned.getSpans(i4, i5, lde.class);
        ldeVarArr.getClass();
        if (ldeVarArr.length == 0) {
            return null;
        }
        int length = ldeVarArr.length;
        fi9 fi9Var = this.a;
        int i7 = 0;
        if (length == 1) {
            if ((i4 < i5 && (i5 - i4) - 1 == i3 - i2) ? charSequence.toString().substring(i2, i3).equals(spanned.toString().substring(i4, i5 - 1)) : false) {
                ParagraphPb paragraphPbR = ((EditPostBodyView) fi9Var).r(i);
                if (paragraphPbR == null) {
                    return null;
                }
                l29 l29Var = new l29();
                l29Var.a = paragraphPbR;
                l29Var.f();
                MarkupModel markupModelC = l29Var.c(i4, true);
                if (markupModelC == null || (num = markupModelC.start) == null) {
                    return null;
                }
                int iIntValue = num.intValue();
                Integer num2 = markupModelC.end;
                if (num2 == null) {
                    return null;
                }
                int iIntValue2 = num2.intValue();
                int i8 = iIntValue2 - 1;
                String str2 = paragraphPbR.text;
                str = str2 != null ? str2 : "";
                while (str.charAt(i8) == ' ') {
                    i8--;
                }
                int iD0 = muc.d0(str, ' ', i8, 4);
                if (iD0 > iIntValue && i4 >= iD0) {
                    return new mde(l29Var, iD0, iIntValue2, this, i, 0);
                }
                if (i4 < iIntValue || i5 > iIntValue2) {
                    return null;
                }
                return new mde(l29Var, iIntValue, iIntValue2, this, i, 1);
            }
        }
        for (lde ldeVar : ldeVarArr) {
            if (i4 > spanned.getSpanStart(ldeVar) || i3 < spanned.getSpanEnd(ldeVar)) {
                String strSubstring = charSequence.toString().substring(i2, i3);
                ParagraphPb paragraphPbR2 = ((EditPostBodyView) fi9Var).r(i);
                if (paragraphPbR2 == null) {
                    return null;
                }
                l29 l29Var2 = new l29();
                l29Var2.a = paragraphPbR2;
                l29Var2.f();
                String str3 = l29Var2.a.text;
                str = str3 != null ? str3 : "";
                while (true) {
                    i6 = i4 + i7;
                    if (i6 >= i5 || i7 >= strSubstring.length() || str.charAt(i6) != strSubstring.charAt(i7)) {
                        break;
                    }
                    i7++;
                }
                String strSubstring2 = strSubstring.substring(i7);
                if (strSubstring2.length() == 0 && i6 == i5) {
                    return null;
                }
                return new nde(l29Var2, i6, i5, strSubstring2, this, i);
            }
        }
        return null;
    }
}
