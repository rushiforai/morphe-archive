package defpackage;

import android.widget.TextView;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.common.post.paragraph.ParagraphView;
import com.medium.android.domain.post.models.Highlight;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.type.ParagraphType;
import java.util.ArrayList;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q29 implements i09 {
    public final d39 a;
    public final String b;
    public final z19 c;
    public final h09 d;
    public final boolean e;
    public qxb f;

    public q29(d39 d39Var, String str, z19 z19Var, h09 h09Var, boolean z) {
        z19Var.getClass();
        h09Var.getClass();
        this.a = d39Var;
        this.b = str;
        this.c = z19Var;
        this.d = h09Var;
        this.e = z;
        this.f = qxb.c;
    }

    @Override // defpackage.i09
    public final void a(l09 l09Var, ParagraphView paragraphView) {
        String lowerCase;
        String lang;
        if (l09Var.b().getType() != ParagraphType.PRE) {
            ygf.f("Check failed.");
            return;
        }
        paragraphView.setParagraphContext(l09Var);
        this.a.b(paragraphView, l09Var).e();
        ArrayList<Highlight> arrayListC = l09Var.c();
        ArrayList arrayList = new ArrayList(cu1.k0(arrayListC, 10));
        for (Highlight highlight : arrayListC) {
            arrayList.add(new d6d(highlight.getStartOffset(), highlight.getEndOffset(), g76.L(highlight.getUserId(), this.b)));
        }
        az5 az5VarF0 = bo.f0(arrayList);
        ParagraphData.CodeBlockMetadata codeBlockMetadata = l09Var.b().getCodeBlockMetadata();
        if (codeBlockMetadata == null || (lang = codeBlockMetadata.getLang()) == null) {
            lowerCase = null;
        } else {
            lowerCase = lang.toLowerCase(Locale.ROOT);
            lowerCase.getClass();
        }
        String str = lowerCase;
        if (str == null) {
            ay0.e("Missing language for code block");
            return;
        }
        ComposeView composeView = paragraphView.getComposeView();
        if (composeView == null) {
            ay0.e("Required value was null.");
            return;
        }
        composeView.setVisibility(0);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new d98(this, az5VarF0, arrayListC, l09Var, str, 4), true, -1596122273));
        TextView text = paragraphView.getText();
        if (text != null) {
            text.setVisibility(8);
        }
    }

    @Override // defpackage.i09
    public final qxb b() {
        return this.f;
    }
}
