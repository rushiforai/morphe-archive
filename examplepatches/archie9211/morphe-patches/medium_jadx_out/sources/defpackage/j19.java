package defpackage;

import android.view.View;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.ParagraphType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public interface j19 {
    View a();

    void b(l09 l09Var);

    boolean d();

    void e(l09 l09Var);

    ParagraphPb f();

    void g(yw1 yw1Var);

    String getParagraphName();

    SelectionPb getSelection();

    ParagraphType getType();

    boolean isAttachedToWindow();
}
