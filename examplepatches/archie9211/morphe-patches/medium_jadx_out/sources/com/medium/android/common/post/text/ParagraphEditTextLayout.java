package com.medium.android.common.post.text;

import android.content.Context;
import android.graphics.Rect;
import android.text.Editable;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.common.post.text.ParagraphEditTextLayout;
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
import defpackage.ev6;
import defpackage.ey3;
import defpackage.f29;
import defpackage.fi9;
import defpackage.fw3;
import defpackage.g76;
import defpackage.g98;
import defpackage.gw3;
import defpackage.hlg;
import defpackage.hw3;
import defpackage.i19;
import defpackage.in3;
import defpackage.iq7;
import defpackage.j19;
import defpackage.l09;
import defpackage.l28;
import defpackage.l29;
import defpackage.lo5;
import defpackage.m17;
import defpackage.m45;
import defpackage.mn3;
import defpackage.mo7;
import defpackage.mx5;
import defpackage.nld;
import defpackage.o09;
import defpackage.o54;
import defpackage.ode;
import defpackage.of2;
import defpackage.op1;
import defpackage.ou3;
import defpackage.p53;
import defpackage.qm7;
import defpackage.rxb;
import defpackage.v08;
import defpackage.vw1;
import defpackage.wld;
import defpackage.x2b;
import defpackage.yw1;
import defpackage.yz3;
import defpackage.z72;
import defpackage.zq;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ParagraphEditTextLayout extends FrameLayout implements j19, f29 {
    public static final long j;
    public static final /* synthetic */ int k = 0;
    public l29 a;
    public l09 b;
    public final ParagraphEditText c;
    public final TextView d;
    public i19 e;
    public d39 f;
    public fi9 g;
    public final nld h;
    public List i;

    static {
        int i = in3.d;
        j = hlg.T(5, mn3.SECONDS);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditTextLayout(Context context) {
        super(context);
        context.getClass();
        ParagraphPb paragraphPb = new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        l29 l29Var = new l29();
        l29Var.a = paragraphPb;
        l29Var.f();
        this.a = l29Var;
        this.i = ey3.a;
        final int i = 1;
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_p, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_bullet);
        viewFindViewById.getClass();
        this.d = (TextView) viewFindViewById;
        View viewFindViewById2 = findViewById(R.id.common_edit_post_paragraph_text);
        viewFindViewById2.getClass();
        ParagraphEditText paragraphEditText = (ParagraphEditText) viewFindViewById2;
        this.c = paragraphEditText;
        this.h = new nld(j, 0L, new lo5(this, null, 13), 14);
        final int i2 = 0;
        hw3 hw3Var = new hw3(new zq(9, this), new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            /* JADX WARN: Removed duplicated region for block: B:29:0x005c  */
            @Override // defpackage.m45
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final java.lang.Object invoke() {
                /*
                    r4 = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        });
        final int i3 = 2;
        fw3 fw3Var = new fw3(new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                /*
                    this = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                /*
                    this = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        }, hw3Var);
        final int i4 = 3;
        final int i5 = 4;
        final int i6 = 5;
        gw3 gw3Var = new gw3(new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                /*
                    this = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                /*
                    this = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                /*
                    this = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        });
        dw3 dw3Var = new dw3(new g98(this), new g98(paragraphEditText, 8), new g98(paragraphEditText, 9));
        paragraphEditText.setFilters(new InputFilter[]{new o09(this, i3), fw3Var});
        paragraphEditText.setOnKeyListener(gw3Var);
        paragraphEditText.setCustomSelectionActionModeCallback(dw3Var);
        paragraphEditText.addTextChangedListener(hw3Var);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final l29 getFreshModel() {
        l29 l29Var = this.a;
        ParagraphEditText paragraphEditText = this.c;
        Editable text = paragraphEditText.getText();
        l29Var.k(text != null ? text.toString() : null);
        List listD = mo7.D(paragraphEditText);
        l29 l29Var2 = this.a;
        Iterator it2 = listD.iterator();
        while (it2.hasNext()) {
            l29Var2.a((MarkupModel) it2.next());
        }
        return this.a;
    }

    private final SelectionPb getSelectionPb() {
        ParagraphEditText paragraphEditText = this.c;
        int selectionStart = paragraphEditText.getSelectionStart();
        int selectionEnd = paragraphEditText.getSelectionEnd();
        if (selectionEnd < selectionStart) {
            Editable text = paragraphEditText.getText();
            StringBuilder sbB = ev6.B(selectionEnd, selectionStart, "selection (end ", ") < (start ", ") in ");
            sbB.append((Object) text);
            wld.a.e(null, sbB.toString(), new Object[0]);
        }
        SelectionPb selectionPb = rxb.a;
        fi9 fi9Var = this.g;
        if (fi9Var == null) {
            ay0.e("PostMorpher cannot be null");
            return null;
        }
        int iD = ((EditPostBodyView) fi9Var).d(this);
        int i = selectionStart > selectionEnd ? selectionEnd : selectionStart;
        if (selectionStart < selectionEnd) {
            selectionStart = selectionEnd;
        }
        return rxb.d(iD, i, selectionStart);
    }

    private final void setSelectionSafe(int i) {
        ParagraphEditText paragraphEditText = this.c;
        Editable text = paragraphEditText.getText();
        paragraphEditText.setSelection(iq7.v(i, 0, text != null ? text.length() : 0));
    }

    @Override // defpackage.j19
    public final void b(l09 l09Var) {
        this.b = l09Var;
        ParagraphPb paragraphPbA = o54.a(l09Var.b());
        l29 l29Var = new l29();
        l29Var.a = paragraphPbA;
        l29Var.f();
        this.a = l29Var;
        x2b x2bVar = l28.a;
        if (!l28.c(l29Var.a.type)) {
            z72.e("ParagraphType expected to be text, but got <", this.a.a.type, ">");
            return;
        }
        ParagraphEditText paragraphEditText = this.c;
        int selectionStart = paragraphEditText.getSelectionStart();
        int selectionEnd = paragraphEditText.getSelectionEnd();
        getParagraphStylerFactory().a(this, l09Var).e();
        if (selectionStart == -1 || selectionEnd == -1) {
            return;
        }
        Editable text = paragraphEditText.getText();
        int length = text != null ? text.length() : 0;
        paragraphEditText.setSelection(iq7.v(selectionStart, 0, length), iq7.v(selectionEnd, 0, length));
    }

    @Override // defpackage.j19
    public final boolean d() {
        List list = this.i;
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
        if (isAttachedToWindow()) {
            getParagraphStylerFactory().a(this, l09Var).f();
        }
    }

    @Override // defpackage.j19
    public final ParagraphPb f() {
        return getFreshModel().a;
    }

    @Override // defpackage.j19
    public final void g(yw1 yw1Var) {
        ParagraphEditText paragraphEditText = this.c;
        if (!paragraphEditText.hasSelection()) {
            int selectionStart = paragraphEditText.getSelectionStart();
            if (selectionStart < 0) {
                selectionStart = paragraphEditText.length() - 1;
            }
            requestFocus();
            setSelectionSafe(selectionStart);
        }
        if (paragraphEditText.getSelectionStart() < 0 || paragraphEditText.getSelectionEnd() < 0) {
            return;
        }
        List list = this.i;
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
        return this.d;
    }

    public ComposeView getComposeView() {
        return null;
    }

    public final i19 getListener() {
        i19 i19Var = this.e;
        if (i19Var != null) {
            return i19Var;
        }
        g76.g0("listener");
        throw null;
    }

    @Override // defpackage.f29
    public ViewGroup getMediaContainer() {
        return null;
    }

    @Override // defpackage.j19
    public String getParagraphName() {
        return this.a.a.name;
    }

    public final d39 getParagraphStylerFactory() {
        d39 d39Var = this.f;
        if (d39Var != null) {
            return d39Var;
        }
        g76.g0("paragraphStylerFactory");
        throw null;
    }

    public final fi9 getPostMorpher() {
        return this.g;
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
        return this.a.a.type;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean requestFocus(int i, Rect rect) {
        return this.c.requestFocus(i, rect);
    }

    public final void setListener(i19 i19Var) {
        i19Var.getClass();
        this.e = i19Var;
    }

    public final void setParagraphStylerFactory(d39 d39Var) {
        d39Var.getClass();
        this.f = d39Var;
    }

    public final void setPostMorpher(fi9 fi9Var) {
        List listR;
        this.g = fi9Var;
        if (fi9Var != null) {
            int i = 1;
            op1 op1Var = new op1(fi9Var, i);
            of2 of2Var = new of2(fi9Var, i);
            int i2 = 2;
            op1 op1Var2 = new op1(fi9Var, i2);
            int i3 = 0;
            of2 of2Var2 = new of2(fi9Var, i3);
            of2 of2Var3 = new of2(fi9Var, i2);
            m17 m17Var = new m17(fi9Var);
            yz3 yz3Var = new yz3(fi9Var, new v08(8, this));
            p53 p53Var = new p53(fi9Var);
            e59 e59Var = new e59(fi9Var);
            ode odeVar = new ode(fi9Var, this.c);
            op1 op1Var3 = new op1(fi9Var, i3);
            Context context = getContext();
            context.getClass();
            listR = d46.R(op1Var, of2Var, op1Var2, of2Var2, of2Var3, m17Var, yz3Var, p53Var, e59Var, odeVar, op1Var3, new mx5(fi9Var, context), new qm7(fi9Var));
        } else {
            listR = ey3.a;
        }
        this.i = listR;
    }

    @Override // defpackage.f29
    public FrameLayout getCaptionContainer() {
        return null;
    }

    @Override // defpackage.f29
    public FrameLayout getContainer() {
        return this;
    }

    @Override // defpackage.f29
    public TextView getMedia() {
        return null;
    }

    @Override // defpackage.f29
    public ParagraphEditText getText() {
        return this.c;
    }

    @Override // defpackage.j19
    public final View a() {
        return this;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditTextLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getClass();
        ParagraphPb paragraphPb = new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        l29 l29Var = new l29();
        l29Var.a = paragraphPb;
        l29Var.f();
        this.a = l29Var;
        this.i = ey3.a;
        final int i = 1;
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_p, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_bullet);
        viewFindViewById.getClass();
        this.d = (TextView) viewFindViewById;
        View viewFindViewById2 = findViewById(R.id.common_edit_post_paragraph_text);
        viewFindViewById2.getClass();
        ParagraphEditText paragraphEditText = (ParagraphEditText) viewFindViewById2;
        this.c = paragraphEditText;
        this.h = new nld(j, 0L, new lo5(this, null, 13), 14);
        final int i2 = 0;
        hw3 hw3Var = new hw3(new zq(9, this), new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                /*
                    this = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        });
        final int i3 = 2;
        fw3 fw3Var = new fw3(new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                /*
                    this = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                /*
                    this = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        }, hw3Var);
        final int i4 = 3;
        final int i5 = 4;
        final int i6 = 5;
        gw3 gw3Var = new gw3(new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                /*
                    this = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                /*
                    this = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: h19
            public final /* synthetic */ ParagraphEditTextLayout b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                /*
                    this = this;
                    int r0 = r2
                    r1 = 0
                    java.lang.String r2 = "PostMorpher cannot be null"
                    r3 = 1
                    com.medium.android.common.post.text.ParagraphEditTextLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.text.ParagraphEditTextLayout.k
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.i
                    return r4
                L20:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L2f
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L32
                L2f:
                    defpackage.ay0.e(r2)
                L32:
                    return r1
                L33:
                    java.util.List r4 = r4.i
                    return r4
                L36:
                    fi9 r0 = r4.g
                    if (r0 == 0) goto L45
                    com.medium.android.common.post.body.EditPostBodyView r0 = (com.medium.android.common.post.body.EditPostBodyView) r0
                    int r4 = r0.d(r4)
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    goto L48
                L45:
                    defpackage.ay0.e(r2)
                L48:
                    return r1
                L49:
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.c
                    android.text.InputFilter[] r4 = r4.getFilters()
                    r0 = 0
                    if (r4 == 0) goto L5c
                    int r4 = r4.length
                    if (r4 != 0) goto L57
                    r4 = r3
                    goto L58
                L57:
                    r4 = r0
                L58:
                    r4 = r4 ^ r3
                    if (r4 != r3) goto L5c
                    goto L5d
                L5c:
                    r3 = r0
                L5d:
                    java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
                    return r4
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.h19.invoke():java.lang.Object");
            }
        });
        dw3 dw3Var = new dw3(new g98(this), new g98(paragraphEditText, 8), new g98(paragraphEditText, 9));
        paragraphEditText.setFilters(new InputFilter[]{new o09(this, i3), fw3Var});
        paragraphEditText.setOnKeyListener(gw3Var);
        paragraphEditText.setCustomSelectionActionModeCallback(dw3Var);
        paragraphEditText.addTextChangedListener(hw3Var);
    }
}
