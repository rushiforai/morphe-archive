package com.medium.android.common.post.unsupported;

import android.content.Context;
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
import defpackage.f29;
import defpackage.gsa;
import defpackage.j19;
import defpackage.l09;
import defpackage.o54;
import defpackage.rxb;
import defpackage.yw1;
import defpackage.zi5;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ParagraphEditUnsupportedLayout extends FrameLayout implements j19, f29 {
    public ParagraphPb a;
    public final ComposeView b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditUnsupportedLayout(Context context) {
        super(context);
        context.getClass();
        this.a = new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_unsupported, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_unsupported_container);
        ComposeView composeView = (ComposeView) viewFindViewById;
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(gsa.e);
        viewFindViewById.getClass();
        this.b = (ComposeView) viewFindViewById;
    }

    @Override // defpackage.j19
    public final void b(l09 l09Var) {
        this.a = o54.a(l09Var.b());
    }

    @Override // defpackage.j19
    public final boolean d() {
        return false;
    }

    @Override // defpackage.j19
    public final ParagraphPb f() {
        return this.a;
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

    public ComposeView getComposeView() {
        return this.b;
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
        return this.a.name;
    }

    @Override // defpackage.f29
    public View getSectionSeparatorView() {
        return null;
    }

    @Override // defpackage.j19
    public SelectionPb getSelection() {
        SelectionPb selectionPb = rxb.a;
        return rxb.a;
    }

    @Override // defpackage.f29
    public TextView getText() {
        return null;
    }

    @Override // defpackage.j19
    public ParagraphType getType() {
        return this.a.type;
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

    @Override // defpackage.j19
    public final void g(yw1 yw1Var) {
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphEditUnsupportedLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getClass();
        this.a = new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null);
        LayoutInflater.from(getContext()).inflate(R.layout.view_edit_post_paragraph_unsupported, (ViewGroup) this, true);
        View viewFindViewById = findViewById(R.id.common_edit_post_paragraph_unsupported_container);
        ComposeView composeView = (ComposeView) viewFindViewById;
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(gsa.e);
        viewFindViewById.getClass();
        this.b = (ComposeView) viewFindViewById;
    }
}
