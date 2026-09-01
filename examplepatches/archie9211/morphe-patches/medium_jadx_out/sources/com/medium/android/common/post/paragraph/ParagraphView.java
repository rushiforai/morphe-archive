package com.medium.android.common.post.paragraph;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.type.ParagraphType;
import com.medium.reader.R;
import defpackage.b75;
import defpackage.f29;
import defpackage.h09;
import defpackage.l09;
import defpackage.m29;
import defpackage.o39;
import defpackage.rk6;
import defpackage.u60;
import defpackage.x45;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ParagraphView extends FrameLayout implements f29, b75 {
    public u60 a;
    public final boolean b;
    public TextView c;
    public View d;
    public TextView e;
    public FrameLayout f;
    public ViewGroup g;
    public View h;
    public View i;
    public ComposeView j;
    public l09 k;
    public rk6 l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphView(Context context) {
        super(context);
        context.getClass();
        if (isInEditMode() || this.b) {
            return;
        }
        this.b = true;
        ((o39) c()).getClass();
    }

    public final void a(x45 x45Var) {
        ViewTreeObserver viewTreeObserver;
        this.l = new rk6(1, this, new WeakReference(x45Var));
        TextView textView = this.c;
        if (textView == null || (viewTreeObserver = textView.getViewTreeObserver()) == null) {
            return;
        }
        viewTreeObserver.addOnPreDrawListener(this.l);
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

    public View getBqLine() {
        return this.d;
    }

    @Override // defpackage.f29
    public TextView getBullet() {
        return this.e;
    }

    public ComposeView getComposeView() {
        return this.j;
    }

    @Override // defpackage.f29
    public View getMedia() {
        return this.h;
    }

    @Override // defpackage.f29
    public ViewGroup getMediaContainer() {
        return this.g;
    }

    public final l09 getParagraphContext() {
        return this.k;
    }

    @Override // defpackage.f29
    public View getSectionSeparatorView() {
        return this.i;
    }

    @Override // defpackage.f29
    public TextView getText() {
        return this.c;
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.c = (TextView) findViewById(R.id.common_item_paragraph_text);
        this.d = findViewById(R.id.common_item_blockquote_line);
        this.e = (TextView) findViewById(R.id.common_item_paragraph_bullet);
        this.h = findViewById(R.id.common_item_paragraph_media);
        this.i = findViewById(R.id.common_item_section_separator);
        this.g = (ViewGroup) findViewById(R.id.common_item_paragraph_media_container);
        this.f = (FrameLayout) findViewById(R.id.common_item_paragraph_media_caption_container);
        TextView textView = this.c;
        if (textView != null) {
            m29 m29Var = m29.a;
            if (m29Var == null) {
                m29Var = new m29();
                m29.a = m29Var;
            }
            textView.setMovementMethod(m29Var);
            textView.setTextIsSelectable(true);
        }
        this.j = (ComposeView) findViewById(R.id.common_item_paragraph_compose_view);
    }

    public final void setActionHandler(h09 h09Var) {
        h09Var.getClass();
        TextView textView = this.c;
        if (textView != null) {
            textView.setCustomSelectionActionModeCallback(h09Var);
        }
    }

    public final void setParagraphContext(l09 l09Var) {
        View view;
        ParagraphData paragraphDataB;
        ParagraphData paragraphDataB2;
        this.k = l09Var;
        setTag((l09Var == null || (paragraphDataB2 = l09Var.b()) == null) ? null : paragraphDataB2.getName());
        if ((l09Var == null || l09Var.c.start_index + l09Var.d != 0) && (view = this.i) != null) {
            view.setVisibility((l09Var == null || !l09Var.h.contains(Integer.valueOf(l09Var.d))) ? 8 : 0);
        }
        ParagraphType type = (l09Var == null || (paragraphDataB = l09Var.b()) == null) ? null : paragraphDataB.getType();
        ParagraphType paragraphType = ParagraphType.MIXTAPE_EMBED;
        TextView textView = this.c;
        if (type == paragraphType) {
            if (textView != null) {
                textView.setMovementMethod(null);
            }
        } else if (textView != null) {
            m29 m29Var = m29.a;
            if (m29Var == null) {
                m29Var = new m29();
                m29.a = m29Var;
            }
            textView.setMovementMethod(m29Var);
        }
    }

    @Override // defpackage.f29
    public FrameLayout getCaptionContainer() {
        return this.f;
    }

    @Override // defpackage.f29
    public FrameLayout getContainer() {
        return this;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getClass();
        if (isInEditMode() || this.b) {
            return;
        }
        this.b = true;
        ((o39) c()).getClass();
    }
}
