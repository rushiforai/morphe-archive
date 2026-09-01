package defpackage;

import android.text.Spanned;
import android.view.KeyEvent;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.ParagraphType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p53 implements hv3, rv3 {
    public final fi9 a;

    public p53(fi9 fi9Var) {
        this.a = fi9Var;
    }

    @Override // defpackage.hv3
    public final boolean c(int i, int i2, int i3, KeyEvent keyEvent) {
        if (keyEvent.getAction() != 0 || keyEvent.getKeyCode() != 67 || i2 != 0 || i3 != 0) {
            return false;
        }
        new o53(i, i2, i3, this).run();
        return true;
    }

    @Override // defpackage.rv3
    public final nu3 e(int i, CharSequence charSequence, int i2, int i3, Spanned spanned, int i4, int i5) {
        if (charSequence.subSequence(i2, i3).length() == 0 && i4 == 0 && i5 == 0) {
            return new o53(i, i4, i5, this);
        }
        return null;
    }

    public final void f(int i, ParagraphPb paragraphPb) {
        ParagraphType paragraphType;
        String str = paragraphPb.text;
        if (str == null || str.length() <= 0) {
            str = null;
        }
        boolean zB = l28.b(paragraphPb.type);
        fi9 fi9Var = this.a;
        if (zB && str != null) {
            SelectionPb selectionPb = rxb.a;
            fi9Var.setSelection(rxb.a(i, str.length()));
            return;
        }
        if (l28.b(paragraphPb.type) || (paragraphType = paragraphPb.type) == ParagraphType.MIXTAPE_EMBED) {
            SelectionPb selectionPb2 = rxb.a;
            fi9Var.setSelection(rxb.b(i));
            return;
        }
        if (l28.c(paragraphType)) {
            SelectionPb selectionPb3 = rxb.a;
            fi9Var.setSelection(rxb.a(i, str != null ? str.length() : 0));
        } else {
            SelectionPb selectionPb4 = rxb.a;
            fi9Var.setSelection(rxb.a(i, 0));
        }
    }
}
