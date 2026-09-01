package com.medium.android.common.post.mixtape;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.reader.R;
import defpackage.d19;
import defpackage.d39;
import defpackage.d46;
import defpackage.ey3;
import defpackage.f29;
import defpackage.fi9;
import defpackage.g76;
import defpackage.j19;
import defpackage.l09;
import defpackage.mx5;
import defpackage.mz1;
import defpackage.o54;
import defpackage.op1;
import defpackage.ou3;
import defpackage.qm7;
import defpackage.rxb;
import defpackage.tg1;
import defpackage.v08;
import defpackage.vv2;
import defpackage.vw1;
import defpackage.xpc;
import defpackage.yw1;
import defpackage.z72;
import defpackage.zi5;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ParagraphEditMixtapeLayout extends FrameLayout implements j19, f29 {
    public static final /* synthetic */ int i = 0;
    public tg1 a;
    public d39 b;
    public d19 c;
    public fi9 d;
    public final ComposeView e;
    public ParagraphPb f;
    public final xpc g;
    public List h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditMixtapeLayout(Context context) {
        super(context);
        context.getClass();
        this.f = new ParagraphPb(null, getType(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        this.g = vv2.j(Boolean.valueOf(isFocused()));
        this.h = ey3.a;
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_mixtape, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_mixtape_container);
        viewFindViewById.getClass();
        this.e = (ComposeView) viewFindViewById;
        setClickable(true);
        setFocusable(true);
        setFocusableInTouchMode(true);
        setDuplicateParentStateEnabled(true);
    }

    private final SelectionPb getSelectionPb() {
        fi9 fi9Var = this.d;
        if (fi9Var != null) {
            int iD = ((EditPostBodyView) fi9Var).d(this);
            Integer numValueOf = Integer.valueOf(iD);
            if (iD == -1) {
                numValueOf = null;
            }
            if (numValueOf != null) {
                int iIntValue = numValueOf.intValue();
                SelectionPb selectionPb = rxb.a;
                return rxb.b(iIntValue);
            }
        }
        return rxb.a;
    }

    @Override // defpackage.j19
    public final void b(l09 l09Var) {
        ParagraphPb paragraphPbA = o54.a(l09Var.b());
        this.f = paragraphPbA;
        ParagraphType paragraphType = paragraphPbA.type;
        if (paragraphType != ParagraphType.MIXTAPE_EMBED) {
            z72.e("ParagraphType expected <MIXTAPE_EMBED>, but got <", paragraphType, ">");
            return;
        }
        getParagraphStylerFactory().a(this, l09Var).e();
        zi5 zi5Var = zi5.h;
        ComposeView composeView = this.e;
        composeView.setViewCompositionStrategy(zi5Var);
        composeView.setContent(new mz1(new v08(6, this), true, -1243485761));
    }

    @Override // defpackage.j19
    public final boolean d() {
        List list = this.h;
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
            if (((ou3) it2.next()).a(getSelectionPb())) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.j19
    public final ParagraphPb f() {
        return this.f;
    }

    @Override // defpackage.j19
    public final void g(yw1 yw1Var) {
        List list = this.h;
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
            ((ou3) it2.next()).d(yw1Var, getSelectionPb());
        }
    }

    public View getBqLine() {
        return null;
    }

    @Override // defpackage.f29
    public TextView getBullet() {
        return null;
    }

    @Override // defpackage.f29
    public ViewGroup getCaptionContainer() {
        return null;
    }

    public final tg1 getCatalogUiModelMapper() {
        tg1 tg1Var = this.a;
        if (tg1Var != null) {
            return tg1Var;
        }
        g76.g0("catalogUiModelMapper");
        throw null;
    }

    public ComposeView getComposeView() {
        return this.e;
    }

    public final d19 getListener() {
        d19 d19Var = this.c;
        if (d19Var != null) {
            return d19Var;
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
        return this.f.name;
    }

    public final d39 getParagraphStylerFactory() {
        d39 d39Var = this.b;
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

    @Override // defpackage.j19
    public SelectionPb getSelection() {
        SelectionPb selectionPb = rxb.a;
        return rxb.b;
    }

    @Override // defpackage.f29
    public TextView getText() {
        return null;
    }

    @Override // defpackage.j19
    public ParagraphType getType() {
        return ParagraphType.MIXTAPE_EMBED;
    }

    @Override // android.view.View
    public final void onFocusChanged(boolean z, int i2, Rect rect) {
        super.onFocusChanged(z, i2, rect);
        Boolean boolValueOf = Boolean.valueOf(z);
        xpc xpcVar = this.g;
        xpcVar.getClass();
        xpcVar.m(null, boolValueOf);
        if (z) {
            Context context = getContext();
            context.getClass();
            InputMethodManager inputMethodManager = (InputMethodManager) context.getSystemService(InputMethodManager.class);
            if (inputMethodManager != null) {
                inputMethodManager.hideSoftInputFromWindow(getWindowToken(), 0);
            }
        }
    }

    public final void setCatalogUiModelMapper(tg1 tg1Var) {
        tg1Var.getClass();
        this.a = tg1Var;
    }

    public final void setListener(d19 d19Var) {
        d19Var.getClass();
        this.c = d19Var;
    }

    public final void setParagraphStylerFactory(d39 d39Var) {
        d39Var.getClass();
        this.b = d39Var;
    }

    public final void setPostMorpher(fi9 fi9Var) {
        List listR;
        this.d = fi9Var;
        if (fi9Var != null) {
            op1 op1Var = new op1(fi9Var, 2);
            op1 op1Var2 = new op1(fi9Var, 0);
            Context context = getContext();
            context.getClass();
            listR = d46.R(op1Var, op1Var2, new mx5(fi9Var, context), new qm7(fi9Var));
        } else {
            listR = ey3.a;
        }
        this.h = listR;
    }

    @Override // defpackage.j19
    public final View a() {
        return this;
    }

    @Override // defpackage.f29
    public ViewGroup getContainer() {
        return this;
    }

    @Override // defpackage.j19
    public final void e(l09 l09Var) {
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditMixtapeLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getClass();
        this.f = new ParagraphPb(null, getType(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        this.g = vv2.j(Boolean.valueOf(isFocused()));
        this.h = ey3.a;
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_mixtape, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_mixtape_container);
        viewFindViewById.getClass();
        this.e = (ComposeView) viewFindViewById;
        setClickable(true);
        setFocusable(true);
        setFocusableInTouchMode(true);
        setDuplicateParentStateEnabled(true);
    }
}
