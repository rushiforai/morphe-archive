package com.medium.android.common.post.pre;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.compose.ui.platform.ComposeView;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.reader.R;
import defpackage.d39;
import defpackage.d46;
import defpackage.e19;
import defpackage.e59;
import defpackage.ei5;
import defpackage.ey3;
import defpackage.f29;
import defpackage.ff7;
import defpackage.fi9;
import defpackage.g76;
import defpackage.hlg;
import defpackage.in3;
import defpackage.j19;
import defpackage.l09;
import defpackage.l29;
import defpackage.lo5;
import defpackage.mn3;
import defpackage.mx5;
import defpackage.mz1;
import defpackage.o54;
import defpackage.o7f;
import defpackage.op1;
import defpackage.ou3;
import defpackage.p53;
import defpackage.qb8;
import defpackage.qm7;
import defpackage.r13;
import defpackage.rxb;
import defpackage.v08;
import defpackage.vv2;
import defpackage.vw1;
import defpackage.xg3;
import defpackage.xpc;
import defpackage.y5d;
import defpackage.yw1;
import defpackage.yz3;
import defpackage.z72;
import defpackage.zi5;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ParagraphEditPreLayout extends FrameLayout implements j19, f29 {
    public static final /* synthetic */ int j = 0;
    public d39 a;
    public e19 b;
    public y5d c;
    public fi9 d;
    public List e;
    public final ComposeView f;
    public final xpc g;
    public l29 h;
    public SelectionPb i;

    static {
        int i = in3.d;
        hlg.T(5, mn3.SECONDS);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditPreLayout(Context context) {
        super(context);
        context.getClass();
        this.e = ey3.a;
        this.g = vv2.j(Boolean.TRUE);
        ParagraphPb paragraphPb = new ParagraphPb(null, ParagraphType.PRE, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        l29 l29Var = new l29();
        l29Var.a = paragraphPb;
        l29Var.f();
        this.h = l29Var;
        this.i = rxb.b;
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_pre, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_pre_container);
        viewFindViewById.getClass();
        this.f = (ComposeView) viewFindViewById;
        new lo5(this, null, 12);
        r13 r13Var = xg3.a;
        ei5 ei5Var = ff7.a;
        r13Var.getClass();
        ei5Var.getClass();
        qb8.q();
        o7f.c(r13Var);
    }

    @Override // defpackage.j19
    public final void b(l09 l09Var) {
        ParagraphPb paragraphPbA = o54.a(l09Var.b());
        l29 l29Var = new l29();
        l29Var.a = paragraphPbA;
        l29Var.f();
        this.h = l29Var;
        ParagraphType paragraphType = l29Var.a.type;
        if (paragraphType != ParagraphType.PRE) {
            z72.e("ParagraphType expected <PRE>, but got <", paragraphType, ">");
            return;
        }
        getParagraphStylerFactory().a(this, l09Var).e();
        zi5 zi5Var = zi5.h;
        ComposeView composeView = this.f;
        composeView.setViewCompositionStrategy(zi5Var);
        composeView.setContent(new mz1(new v08(7, this), true, -136815846));
    }

    @Override // defpackage.j19
    public final boolean d() {
        List list = this.e;
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (obj instanceof ou3) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        for (Object obj2 : arrayList) {
            if (((ou3) obj2).b(vw1.a)) {
                arrayList2.add(obj2);
            }
        }
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            if (((ou3) it2.next()).a(this.i)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.j19
    public final void e(l09 l09Var) {
        getParagraphStylerFactory().a(this, l09Var).f();
    }

    @Override // defpackage.j19
    public final ParagraphPb f() {
        return this.h.a;
    }

    @Override // defpackage.j19
    public final void g(yw1 yw1Var) {
        List list = this.e;
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (obj instanceof ou3) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        for (Object obj2 : arrayList) {
            if (((ou3) obj2).b(yw1Var)) {
                arrayList2.add(obj2);
            }
        }
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            ((ou3) it2.next()).d(yw1Var, this.i);
        }
    }

    public View getBqLine() {
        return null;
    }

    @Override // defpackage.f29
    public TextView getBullet() {
        return null;
    }

    public ComposeView getComposeView() {
        return this.f;
    }

    public final e19 getListener() {
        e19 e19Var = this.b;
        if (e19Var != null) {
            return e19Var;
        }
        g76.g0("listener");
        throw null;
    }

    @Override // defpackage.f29
    public View getMedia() {
        return null;
    }

    @Override // defpackage.f29
    public ViewGroup getMediaContainer() {
        return null;
    }

    @Override // defpackage.j19
    public String getParagraphName() {
        return this.h.a.name;
    }

    public final d39 getParagraphStylerFactory() {
        d39 d39Var = this.a;
        if (d39Var != null) {
            return d39Var;
        }
        g76.g0("paragraphStylerFactory");
        throw null;
    }

    public final fi9 getPostMorpher() {
        return this.d;
    }

    @Override // defpackage.f29
    public View getSectionSeparatorView() {
        return null;
    }

    public final y5d getSelectedLanguage() {
        return this.c;
    }

    @Override // defpackage.j19
    public SelectionPb getSelection() {
        return this.i;
    }

    @Override // defpackage.f29
    public TextView getText() {
        return null;
    }

    @Override // defpackage.j19
    public ParagraphType getType() {
        return ParagraphType.PRE;
    }

    @Override // android.view.View
    public final void onFocusChanged(boolean z, int i, Rect rect) {
        super.onFocusChanged(z, i, rect);
        Boolean boolValueOf = Boolean.valueOf(z);
        xpc xpcVar = this.g;
        xpcVar.getClass();
        xpcVar.m(null, boolValueOf);
    }

    public final void setListener(e19 e19Var) {
        e19Var.getClass();
        this.b = e19Var;
    }

    public final void setParagraphStylerFactory(d39 d39Var) {
        d39Var.getClass();
        this.a = d39Var;
    }

    public final void setPostMorpher(fi9 fi9Var) {
        List listR;
        this.d = fi9Var;
        if (fi9Var != null) {
            op1 op1Var = new op1(fi9Var, 0);
            op1 op1Var2 = new op1(fi9Var, 2);
            yz3 yz3Var = new yz3(fi9Var);
            p53 p53Var = new p53(fi9Var);
            e59 e59Var = new e59(fi9Var);
            Context context = getContext();
            context.getClass();
            listR = d46.R(op1Var, op1Var2, yz3Var, p53Var, e59Var, new mx5(fi9Var, context), new qm7(fi9Var));
        } else {
            listR = ey3.a;
        }
        this.e = listR;
    }

    public final void setSelectedLanguage(y5d y5dVar) {
        this.c = y5dVar;
    }

    @Override // defpackage.f29
    public FrameLayout getCaptionContainer() {
        return null;
    }

    @Override // defpackage.f29
    public FrameLayout getContainer() {
        return this;
    }

    @Override // defpackage.j19
    public final View a() {
        return this;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditPreLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getClass();
        this.e = ey3.a;
        this.g = vv2.j(Boolean.TRUE);
        ParagraphPb paragraphPb = new ParagraphPb(null, ParagraphType.PRE, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        l29 l29Var = new l29();
        l29Var.a = paragraphPb;
        l29Var.f();
        this.h = l29Var;
        this.i = rxb.b;
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_pre, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_pre_container);
        viewFindViewById.getClass();
        this.f = (ComposeView) viewFindViewById;
        new lo5(this, null, 12);
        r13 r13Var = xg3.a;
        ei5 ei5Var = ff7.a;
        r13Var.getClass();
        ei5Var.getClass();
        qb8.q();
        o7f.c(r13Var);
    }
}
