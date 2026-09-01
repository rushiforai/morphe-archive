package com.medium.android.common.post.iframe;

import android.content.Context;
import android.text.Editable;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.common.post.text.ParagraphEditText;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.reader.R;
import defpackage.ay0;
import defpackage.d39;
import defpackage.d46;
import defpackage.dw3;
import defpackage.e59;
import defpackage.ey3;
import defpackage.f29;
import defpackage.fi9;
import defpackage.fw3;
import defpackage.g76;
import defpackage.g98;
import defpackage.gw3;
import defpackage.hlg;
import defpackage.ho5;
import defpackage.hu7;
import defpackage.hw3;
import defpackage.in3;
import defpackage.j19;
import defpackage.l09;
import defpackage.l29;
import defpackage.lo5;
import defpackage.m09;
import defpackage.mn3;
import defpackage.mo7;
import defpackage.mx5;
import defpackage.mz1;
import defpackage.n09;
import defpackage.nld;
import defpackage.o09;
import defpackage.o54;
import defpackage.ode;
import defpackage.of2;
import defpackage.op1;
import defpackage.ou3;
import defpackage.p53;
import defpackage.q09;
import defpackage.qm7;
import defpackage.rxb;
import defpackage.vv2;
import defpackage.vw1;
import defpackage.xpc;
import defpackage.yw1;
import defpackage.yz3;
import defpackage.z72;
import defpackage.zi5;
import defpackage.zq;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ParagraphEditIframeLayout extends FrameLayout implements j19, f29 {
    public static final long m;
    public static final /* synthetic */ int n = 0;
    public hu7 a;
    public d39 b;
    public q09 c;
    public fi9 d;
    public final ComposeView e;
    public final ViewGroup f;
    public final ViewGroup g;
    public final ParagraphEditText h;
    public final nld i;
    public l29 j;
    public List k;
    public final xpc l;

    static {
        int i = in3.d;
        m = hlg.T(5, mn3.SECONDS);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditIframeLayout(Context context) {
        super(context);
        context.getClass();
        ParagraphPb paragraphPb = new ParagraphPb(null, ParagraphType.IFRAME, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        l29 l29Var = new l29();
        l29Var.a = paragraphPb;
        l29Var.f();
        this.j = l29Var;
        this.k = ey3.a;
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_iframe, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_iframe_media_container);
        viewFindViewById.getClass();
        this.f = (ViewGroup) viewFindViewById;
        View viewFindViewById2 = findViewById(R.id.common_edit_post_paragraph_iframe_media);
        viewFindViewById2.getClass();
        ComposeView composeView = (ComposeView) viewFindViewById2;
        this.e = composeView;
        View viewFindViewById3 = findViewById(R.id.common_edit_post_paragraph_iframe_caption_container);
        viewFindViewById3.getClass();
        this.g = (ViewGroup) viewFindViewById3;
        View viewFindViewById4 = findViewById(R.id.common_edit_post_paragraph_iframe_caption);
        viewFindViewById4.getClass();
        ParagraphEditText paragraphEditText = (ParagraphEditText) viewFindViewById4;
        this.h = paragraphEditText;
        composeView.setClickable(true);
        composeView.setFocusable(true);
        composeView.setFocusableInTouchMode(true);
        composeView.setDuplicateParentStateEnabled(true);
        this.i = new nld(m, 0L, new lo5(this, null, 10), 14);
        hw3 hw3Var = new hw3(new zq(7, this), new m09(this, 1));
        fw3 fw3Var = new fw3(new m09(this, 2), new m09(this, 3), hw3Var);
        gw3 gw3Var = new gw3(new m09(this, 4), new m09(this, 5), new m09(this, 6));
        dw3 dw3Var = new dw3(new g98(this), new g98(paragraphEditText, 2), new g98(paragraphEditText, 3));
        paragraphEditText.setFilters(new InputFilter[]{new o09(this, 0), fw3Var});
        paragraphEditText.setOnKeyListener(gw3Var);
        paragraphEditText.setCustomSelectionActionModeCallback(dw3Var);
        paragraphEditText.addTextChangedListener(hw3Var);
        composeView.setOnFocusChangeListener(new n09(this, 0));
        this.l = vv2.j(Boolean.valueOf(composeView.isFocused()));
    }

    public static final void c(ParagraphEditIframeLayout paragraphEditIframeLayout, boolean z) {
        xpc xpcVar = paragraphEditIframeLayout.l;
        Boolean boolValueOf = Boolean.valueOf(z);
        xpcVar.getClass();
        xpcVar.m(null, boolValueOf);
        if (z) {
            Context context = paragraphEditIframeLayout.getContext();
            context.getClass();
            InputMethodManager inputMethodManager = (InputMethodManager) context.getSystemService(InputMethodManager.class);
            if (inputMethodManager != null) {
                inputMethodManager.hideSoftInputFromWindow(paragraphEditIframeLayout.getWindowToken(), 0);
            }
        }
    }

    private final l29 getFreshParagraphModel() {
        l29 l29Var = this.j;
        ParagraphEditText paragraphEditText = this.h;
        Editable text = paragraphEditText.getText();
        l29Var.k(text != null ? text.toString() : null);
        List listD = mo7.D(paragraphEditText);
        l29 l29Var2 = this.j;
        Iterator it2 = listD.iterator();
        while (it2.hasNext()) {
            l29Var2.a((MarkupModel) it2.next());
        }
        return this.j;
    }

    private final SelectionPb getSelectionPb() {
        fi9 fi9Var = this.d;
        if (fi9Var == null) {
            ay0.e("PostMorpher cannot be null");
            return null;
        }
        int iD = ((EditPostBodyView) fi9Var).d(this);
        Integer numValueOf = iD != -1 ? Integer.valueOf(iD) : null;
        if (numValueOf == null) {
            return rxb.b;
        }
        int iIntValue = numValueOf.intValue();
        if (this.e.isFocused()) {
            SelectionPb selectionPb = rxb.a;
            return rxb.b(iIntValue);
        }
        ParagraphEditText paragraphEditText = this.h;
        if (!paragraphEditText.isFocused()) {
            return rxb.b;
        }
        int selectionStart = paragraphEditText.getSelectionStart();
        int selectionEnd = paragraphEditText.getSelectionEnd();
        SelectionPb selectionPb2 = rxb.a;
        int i = selectionStart > selectionEnd ? selectionEnd : selectionStart;
        if (selectionStart < selectionEnd) {
            selectionStart = selectionEnd;
        }
        return rxb.d(iIntValue, i, selectionStart);
    }

    @Override // defpackage.j19
    public final void b(l09 l09Var) {
        ParagraphPb paragraphPbA = o54.a(l09Var.b());
        l29 l29Var = new l29();
        l29Var.a = paragraphPbA;
        l29Var.f();
        this.j = l29Var;
        ParagraphType paragraphType = l29Var.a.type;
        if (paragraphType != ParagraphType.IFRAME) {
            z72.e("ParagraphType expected <IFRAME>, but got <", paragraphType, ">");
            return;
        }
        getParagraphStylerFactory().a(this, l09Var).e();
        zi5 zi5Var = zi5.h;
        ComposeView composeView = this.e;
        composeView.setViewCompositionStrategy(zi5Var);
        composeView.setContent(new mz1(new ho5(this, composeView, l09Var, 21), true, -20631647));
    }

    @Override // defpackage.j19
    public final boolean d() {
        List list = this.k;
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
    public final void e(l09 l09Var) {
        getParagraphStylerFactory().a(this, l09Var).f();
    }

    @Override // defpackage.j19
    public final ParagraphPb f() {
        return getFreshParagraphModel().a;
    }

    @Override // defpackage.j19
    public final void g(yw1 yw1Var) {
        List list = this.k;
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

    public /* bridge */ /* synthetic */ View getBqLine() {
        return (View) m63getBqLine();
    }

    @Override // defpackage.f29
    public /* bridge */ /* synthetic */ TextView getBullet() {
        return (TextView) m64getBullet();
    }

    @Override // defpackage.f29
    public ViewGroup getCaptionContainer() {
        return this.g;
    }

    public ComposeView getComposeView() {
        return this.e;
    }

    public final q09 getListener() {
        q09 q09Var = this.c;
        if (q09Var != null) {
            return q09Var;
        }
        g76.g0("listener");
        throw null;
    }

    @Override // defpackage.f29
    public ViewGroup getMediaContainer() {
        return this.f;
    }

    public final hu7 getMediumUris() {
        hu7 hu7Var = this.a;
        if (hu7Var != null) {
            return hu7Var;
        }
        g76.g0("mediumUris");
        throw null;
    }

    @Override // defpackage.j19
    public String getParagraphName() {
        return this.j.a.name;
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
        return getSelectionPb();
    }

    @Override // defpackage.j19
    public ParagraphType getType() {
        return ParagraphType.IFRAME;
    }

    public final void setListener(q09 q09Var) {
        q09Var.getClass();
        this.c = q09Var;
    }

    public final void setMediumUris(hu7 hu7Var) {
        hu7Var.getClass();
        this.a = hu7Var;
    }

    public final void setParagraphStylerFactory(d39 d39Var) {
        d39Var.getClass();
        this.b = d39Var;
    }

    public final void setPostMorpher(fi9 fi9Var) {
        List listR;
        this.d = fi9Var;
        if (fi9Var != null) {
            of2 of2Var = new of2(fi9Var, 1);
            int i = 2;
            op1 op1Var = new op1(fi9Var, i);
            of2 of2Var2 = new of2(fi9Var, 0);
            of2 of2Var3 = new of2(fi9Var, i);
            yz3 yz3Var = new yz3(fi9Var);
            p53 p53Var = new p53(fi9Var);
            e59 e59Var = new e59(fi9Var);
            ode odeVar = new ode(fi9Var, this.h);
            Context context = getContext();
            context.getClass();
            listR = d46.R(of2Var, op1Var, of2Var2, of2Var3, yz3Var, p53Var, e59Var, odeVar, new mx5(fi9Var, context), new qm7(fi9Var));
        } else {
            listR = ey3.a;
        }
        this.k = listR;
    }

    @Override // defpackage.f29
    public ParagraphEditIframeLayout getContainer() {
        return this;
    }

    @Override // defpackage.f29
    public ComposeView getMedia() {
        return this.e;
    }

    @Override // defpackage.f29
    public ParagraphEditText getText() {
        return this.h;
    }

    /* JADX INFO: renamed from: getBqLine, reason: collision with other method in class */
    public Void m63getBqLine() {
        return null;
    }

    /* JADX INFO: renamed from: getBullet, reason: collision with other method in class */
    public Void m64getBullet() {
        return null;
    }

    @Override // defpackage.j19
    public final View a() {
        return this;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditIframeLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getClass();
        ParagraphPb paragraphPb = new ParagraphPb(null, ParagraphType.IFRAME, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        l29 l29Var = new l29();
        l29Var.a = paragraphPb;
        l29Var.f();
        this.j = l29Var;
        this.k = ey3.a;
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_iframe, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_iframe_media_container);
        viewFindViewById.getClass();
        this.f = (ViewGroup) viewFindViewById;
        View viewFindViewById2 = findViewById(R.id.common_edit_post_paragraph_iframe_media);
        viewFindViewById2.getClass();
        ComposeView composeView = (ComposeView) viewFindViewById2;
        this.e = composeView;
        View viewFindViewById3 = findViewById(R.id.common_edit_post_paragraph_iframe_caption_container);
        viewFindViewById3.getClass();
        this.g = (ViewGroup) viewFindViewById3;
        View viewFindViewById4 = findViewById(R.id.common_edit_post_paragraph_iframe_caption);
        viewFindViewById4.getClass();
        ParagraphEditText paragraphEditText = (ParagraphEditText) viewFindViewById4;
        this.h = paragraphEditText;
        composeView.setClickable(true);
        composeView.setFocusable(true);
        composeView.setFocusableInTouchMode(true);
        composeView.setDuplicateParentStateEnabled(true);
        this.i = new nld(m, 0L, new lo5(this, null, 10), 14);
        hw3 hw3Var = new hw3(new zq(7, this), new m09(this, 1));
        fw3 fw3Var = new fw3(new m09(this, 2), new m09(this, 3), hw3Var);
        gw3 gw3Var = new gw3(new m09(this, 4), new m09(this, 5), new m09(this, 6));
        dw3 dw3Var = new dw3(new g98(this), new g98(paragraphEditText, 2), new g98(paragraphEditText, 3));
        paragraphEditText.setFilters(new InputFilter[]{new o09(this, 0), fw3Var});
        paragraphEditText.setOnKeyListener(gw3Var);
        paragraphEditText.setCustomSelectionActionModeCallback(dw3Var);
        paragraphEditText.addTextChangedListener(hw3Var);
        composeView.setOnFocusChangeListener(new n09(this, 0));
        this.l = vv2.j(Boolean.valueOf(composeView.isFocused()));
    }
}
