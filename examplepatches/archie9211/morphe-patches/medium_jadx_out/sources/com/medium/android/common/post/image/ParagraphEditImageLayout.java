package com.medium.android.common.post.image;

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
import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.common.post.image.ParagraphEditImageLayout;
import com.medium.android.common.post.text.ParagraphEditText;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.reader.R;
import defpackage.ay0;
import defpackage.b19;
import defpackage.b75;
import defpackage.c19;
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
import defpackage.go2;
import defpackage.gw3;
import defpackage.gx5;
import defpackage.hlg;
import defpackage.ho5;
import defpackage.hw3;
import defpackage.in3;
import defpackage.j19;
import defpackage.l09;
import defpackage.l29;
import defpackage.lo5;
import defpackage.m45;
import defpackage.mn3;
import defpackage.mo7;
import defpackage.muc;
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
import defpackage.qm7;
import defpackage.r09;
import defpackage.rxb;
import defpackage.u09;
import defpackage.u60;
import defpackage.vv2;
import defpackage.vw1;
import defpackage.xpc;
import defpackage.y09;
import defpackage.yw1;
import defpackage.yz3;
import defpackage.z72;
import defpackage.zi5;
import defpackage.zq;
import gen.model.ImageMetadata;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ParagraphEditImageLayout extends FrameLayout implements j19, f29, b75 {
    public static final long o;
    public static final /* synthetic */ int p = 0;
    public u60 a;
    public final boolean b;
    public gx5 c;
    public d39 d;
    public c19 e;
    public fi9 f;
    public final ComposeView g;
    public final ViewGroup h;
    public final ViewGroup i;
    public final ParagraphEditText j;
    public final nld k;
    public l29 l;
    public List m;
    public final xpc n;

    static {
        int i = in3.d;
        o = hlg.T(5, mn3.SECONDS);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditImageLayout(Context context) {
        super(context);
        context.getClass();
        final int i = 1;
        if (!isInEditMode() && !this.b) {
            this.b = true;
            this.c = (gx5) ((go2) ((b19) c())).a.P.get();
        }
        ParagraphPb paragraphPb = new ParagraphPb(null, ParagraphType.IMG, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        l29 l29Var = new l29();
        l29Var.a = paragraphPb;
        l29Var.f();
        this.l = l29Var;
        this.m = ey3.a;
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_image, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_image_media_container);
        viewFindViewById.getClass();
        this.h = (ViewGroup) viewFindViewById;
        View viewFindViewById2 = findViewById(R.id.common_edit_post_paragraph_image_media);
        viewFindViewById2.getClass();
        ComposeView composeView = (ComposeView) viewFindViewById2;
        this.g = composeView;
        View viewFindViewById3 = findViewById(R.id.common_edit_post_paragraph_image_caption_container);
        viewFindViewById3.getClass();
        this.i = (ViewGroup) viewFindViewById3;
        View viewFindViewById4 = findViewById(R.id.common_edit_post_paragraph_image_caption);
        viewFindViewById4.getClass();
        ParagraphEditText paragraphEditText = (ParagraphEditText) viewFindViewById4;
        this.j = paragraphEditText;
        composeView.setClickable(true);
        composeView.setFocusable(true);
        composeView.setFocusableInTouchMode(true);
        composeView.setDuplicateParentStateEnabled(true);
        this.k = new nld(o, 0L, new lo5(this, null, 11), 14);
        final int i2 = 0;
        hw3 hw3Var = new hw3(new zq(8, this), new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        });
        final int i3 = 2;
        fw3 fw3Var = new fw3(new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        }, hw3Var);
        final int i4 = 3;
        final int i5 = 4;
        final int i6 = 5;
        gw3 gw3Var = new gw3(new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        });
        dw3 dw3Var = new dw3(new g98(this), new g98(paragraphEditText, 5), new g98(paragraphEditText, 6));
        paragraphEditText.setFilters(new InputFilter[]{new o09(this, i), fw3Var});
        paragraphEditText.setOnKeyListener(gw3Var);
        paragraphEditText.setCustomSelectionActionModeCallback(dw3Var);
        paragraphEditText.addTextChangedListener(hw3Var);
        composeView.setOnFocusChangeListener(new n09(this, 1));
        this.n = vv2.j(Boolean.valueOf(composeView.isFocused()));
    }

    private final l29 getFreshParagraphModel() {
        l29 l29Var = this.l;
        ParagraphEditText paragraphEditText = this.j;
        Editable text = paragraphEditText.getText();
        l29Var.k(text != null ? text.toString() : null);
        List listD = mo7.D(paragraphEditText);
        l29 l29Var2 = this.l;
        Iterator it2 = listD.iterator();
        while (it2.hasNext()) {
            l29Var2.a((MarkupModel) it2.next());
        }
        return this.l;
    }

    private final SelectionPb getSelectionPb() {
        fi9 fi9Var = this.f;
        if (fi9Var == null) {
            ay0.e("PostMorpher cannot be null");
            return null;
        }
        int iD = ((EditPostBodyView) fi9Var).d(this);
        Integer numValueOf = iD != -1 ? Integer.valueOf(iD) : null;
        if (numValueOf == null) {
            return rxb.a;
        }
        int iIntValue = numValueOf.intValue();
        if (this.g.isFocused()) {
            SelectionPb selectionPb = rxb.a;
            return rxb.b(iIntValue);
        }
        ParagraphEditText paragraphEditText = this.j;
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

    public static /* synthetic */ void getUnsplashImageLoader$annotations() {
    }

    public static final void h(ParagraphEditImageLayout paragraphEditImageLayout, boolean z) {
        xpc xpcVar = paragraphEditImageLayout.n;
        Boolean boolValueOf = Boolean.valueOf(z);
        xpcVar.getClass();
        xpcVar.m(null, boolValueOf);
        if (z) {
            Context context = paragraphEditImageLayout.getContext();
            context.getClass();
            InputMethodManager inputMethodManager = (InputMethodManager) context.getSystemService(InputMethodManager.class);
            if (inputMethodManager != null) {
                inputMethodManager.hideSoftInputFromWindow(paragraphEditImageLayout.getWindowToken(), 0);
            }
        }
    }

    @Override // defpackage.j19
    public final View a() {
        return this;
    }

    @Override // defpackage.a75
    public final Object c() {
        u60 u60Var = this.a;
        if (u60Var == null) {
            u60Var = new u60(this);
            this.a = u60Var;
        }
        return u60Var.c();
    }

    @Override // defpackage.j19
    public final boolean d() {
        List list = this.m;
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
        List list = this.m;
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
        return (View) m65getBqLine();
    }

    @Override // defpackage.f29
    public /* bridge */ /* synthetic */ TextView getBullet() {
        return (TextView) m66getBullet();
    }

    @Override // defpackage.f29
    public ViewGroup getCaptionContainer() {
        return this.i;
    }

    public ComposeView getComposeView() {
        return this.g;
    }

    public final c19 getListener() {
        c19 c19Var = this.e;
        if (c19Var != null) {
            return c19Var;
        }
        g76.g0("listener");
        throw null;
    }

    @Override // defpackage.f29
    public ViewGroup getMediaContainer() {
        return this.h;
    }

    @Override // defpackage.j19
    public String getParagraphName() {
        return this.l.a.name;
    }

    public final fi9 getPostMorpher() {
        return this.f;
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
        return ParagraphType.IMG;
    }

    public final gx5 getUnsplashImageLoader() {
        gx5 gx5Var = this.c;
        if (gx5Var != null) {
            return gx5Var;
        }
        g76.g0("unsplashImageLoader");
        throw null;
    }

    public final void i(y09 y09Var) {
        zi5 zi5Var = zi5.h;
        ComposeView composeView = this.g;
        composeView.setViewCompositionStrategy(zi5Var);
        composeView.setContent(new mz1(new ho5(this, composeView, y09Var, 22), true, -1081299163));
    }

    public final void setListener(c19 c19Var) {
        c19Var.getClass();
        this.e = c19Var;
    }

    public final void setParagraphStylerFactory(d39 d39Var) {
        d39Var.getClass();
        this.d = d39Var;
    }

    public final void setPostMorpher(fi9 fi9Var) {
        List listR;
        this.f = fi9Var;
        if (fi9Var != null) {
            of2 of2Var = new of2(fi9Var, 1);
            int i = 2;
            op1 op1Var = new op1(fi9Var, i);
            of2 of2Var2 = new of2(fi9Var, 0);
            of2 of2Var3 = new of2(fi9Var, i);
            yz3 yz3Var = new yz3(fi9Var);
            p53 p53Var = new p53(fi9Var);
            e59 e59Var = new e59(fi9Var);
            ode odeVar = new ode(fi9Var, this.j);
            Context context = getContext();
            context.getClass();
            listR = d46.R(of2Var, op1Var, of2Var2, of2Var3, yz3Var, p53Var, e59Var, odeVar, new mx5(fi9Var, context), new qm7(fi9Var));
        } else {
            listR = ey3.a;
        }
        this.m = listR;
    }

    public final void setUnsplashImageLoader(gx5 gx5Var) {
        gx5Var.getClass();
        this.c = gx5Var;
    }

    public final d39 getParagraphStylerFactory() {
        d39 d39Var = this.d;
        if (d39Var != null) {
            return d39Var;
        }
        g76.g0(fiHTiFJ.IvYIRazwgN);
        throw null;
    }

    @Override // defpackage.j19
    public final void b(l09 l09Var) {
        String string;
        y09 r09Var;
        int iIntValue;
        ParagraphPb paragraphPbA = o54.a(l09Var.b());
        l29 l29Var = new l29();
        l29Var.a = paragraphPbA;
        l29Var.f();
        this.l = l29Var;
        ParagraphEditText paragraphEditText = this.j;
        Editable text = paragraphEditText.getText();
        y09 y09Var = null;
        if (text != null) {
            string = text.toString();
        } else {
            string = null;
        }
        l29Var.k(string);
        List listD = mo7.D(paragraphEditText);
        l29 l29Var2 = this.l;
        Iterator it2 = listD.iterator();
        while (it2.hasNext()) {
            l29Var2.a((MarkupModel) it2.next());
        }
        ParagraphType paragraphType = paragraphPbA.type;
        if (paragraphType == ParagraphType.IMG) {
            getParagraphStylerFactory().a(this, l09Var).e();
            ImageMetadata imageMetadata = paragraphPbA.metadata;
            if (imageMetadata != null) {
                String str = imageMetadata.id;
                if (str != null && !muc.b0(str)) {
                    String str2 = paragraphPbA.name;
                    if (str2 != null) {
                        r09Var = new u09(str2, imageMetadata);
                    } else {
                        ay0.e("Required value was null.");
                        return;
                    }
                } else {
                    String str3 = paragraphPbA.name;
                    if (str3 != null) {
                        Integer num = imageMetadata.original_width;
                        int iIntValue2 = 0;
                        if (num != null) {
                            iIntValue = num.intValue();
                        } else {
                            iIntValue = 0;
                        }
                        Integer num2 = imageMetadata.original_height;
                        if (num2 != null) {
                            iIntValue2 = num2.intValue();
                        }
                        r09Var = new r09(str3, iIntValue, iIntValue2);
                    } else {
                        ay0.e("Required value was null.");
                        return;
                    }
                }
                y09Var = r09Var;
            }
            if (y09Var != null) {
                i(y09Var);
                return;
            }
            return;
        }
        z72.e("ParagraphType expected <IMG>, but got <", paragraphType, ZVsviyDAr.DQI);
    }

    @Override // defpackage.f29
    public ParagraphEditImageLayout getContainer() {
        return this;
    }

    @Override // defpackage.f29
    public ComposeView getMedia() {
        return this.g;
    }

    @Override // defpackage.f29
    public ParagraphEditText getText() {
        return this.j;
    }

    /* JADX INFO: renamed from: getBqLine, reason: collision with other method in class */
    public Void m65getBqLine() {
        return null;
    }

    /* JADX INFO: renamed from: getBullet, reason: collision with other method in class */
    public Void m66getBullet() {
        return null;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditImageLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getClass();
        final int i = 1;
        if (!isInEditMode() && !this.b) {
            this.b = true;
            this.c = (gx5) ((go2) ((b19) c())).a.P.get();
        }
        ParagraphPb paragraphPb = new ParagraphPb(null, ParagraphType.IMG, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        l29 l29Var = new l29();
        l29Var.a = paragraphPb;
        l29Var.f();
        this.l = l29Var;
        this.m = ey3.a;
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_image, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_image_media_container);
        viewFindViewById.getClass();
        this.h = (ViewGroup) viewFindViewById;
        View viewFindViewById2 = findViewById(R.id.common_edit_post_paragraph_image_media);
        viewFindViewById2.getClass();
        ComposeView composeView = (ComposeView) viewFindViewById2;
        this.g = composeView;
        View viewFindViewById3 = findViewById(R.id.common_edit_post_paragraph_image_caption_container);
        viewFindViewById3.getClass();
        this.i = (ViewGroup) viewFindViewById3;
        View viewFindViewById4 = findViewById(R.id.common_edit_post_paragraph_image_caption);
        viewFindViewById4.getClass();
        ParagraphEditText paragraphEditText = (ParagraphEditText) viewFindViewById4;
        this.j = paragraphEditText;
        composeView.setClickable(true);
        composeView.setFocusable(true);
        composeView.setFocusableInTouchMode(true);
        composeView.setDuplicateParentStateEnabled(true);
        this.k = new nld(o, 0L, new lo5(this, null, 11), 14);
        final int i2 = 0;
        hw3 hw3Var = new hw3(new zq(8, this), new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        });
        final int i3 = 2;
        fw3 fw3Var = new fw3(new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        }, hw3Var);
        final int i4 = 3;
        final int i5 = 4;
        final int i6 = 5;
        gw3 gw3Var = new gw3(new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        }, new m45(this) { // from class: z09
            public final /* synthetic */ ParagraphEditImageLayout b;

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
                    com.medium.android.common.post.image.ParagraphEditImageLayout r4 = r4.b
                    switch(r0) {
                        case 0: goto L49;
                        case 1: goto L36;
                        case 2: goto L33;
                        case 3: goto L20;
                        case 4: goto L1d;
                        default: goto Lb;
                    }
                Lb:
                    int r0 = com.medium.android.common.post.image.ParagraphEditImageLayout.p
                    n46 r0 = new n46
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
                    int r1 = r4.getSelectionStart()
                    int r4 = r4.getSelectionEnd()
                    r0.<init>(r1, r4, r3)
                    return r0
                L1d:
                    java.util.List r4 = r4.m
                    return r4
                L20:
                    fi9 r0 = r4.f
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
                    java.util.List r4 = r4.m
                    return r4
                L36:
                    fi9 r0 = r4.f
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
                    com.medium.android.common.post.text.ParagraphEditText r4 = r4.j
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
                throw new UnsupportedOperationException("Method not decompiled: defpackage.z09.invoke():java.lang.Object");
            }
        });
        dw3 dw3Var = new dw3(new g98(this), new g98(paragraphEditText, 5), new g98(paragraphEditText, 6));
        paragraphEditText.setFilters(new InputFilter[]{new o09(this, i), fw3Var});
        paragraphEditText.setOnKeyListener(gw3Var);
        paragraphEditText.setCustomSelectionActionModeCallback(dw3Var);
        paragraphEditText.addTextChangedListener(hw3Var);
        composeView.setOnFocusChangeListener(new n09(this, 1));
        this.n = vv2.j(Boolean.valueOf(composeView.isFocused()));
    }
}
