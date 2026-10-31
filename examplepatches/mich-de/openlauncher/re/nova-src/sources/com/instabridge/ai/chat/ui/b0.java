package com.instabridge.ai.chat.ui;

import android.animation.ValueAnimator;
import android.graphics.LinearGradient;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.instabridge.ai.chat.ui.ChatAdapter;

/* loaded from: classes3.dex */
public final /* synthetic */ class b0 implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35328a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35329b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ View f35330c;

    public /* synthetic */ b0(View view, int i5, Object obj) {
        this.f35328a = i5;
        this.f35329b = obj;
        this.f35330c = view;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        switch (this.f35328a) {
            case 0:
                ChatAdapter.AiMessageViewHolder.startSuggestionShimmer$lambda$37$lambda$36$lambda$35((LinearGradient) this.f35329b, (TextView) this.f35330c, valueAnimator);
                break;
            case 1:
                ChatAdapter.AiMessageViewHolder.startShimmerAnimation$lambda$5$lambda$4$lambda$3((LinearGradient) this.f35329b, (TextView) this.f35330c, valueAnimator);
                break;
            default:
                ChatInputBar.updateInputHeight$lambda$16$lambda$15((ViewGroup.LayoutParams) this.f35329b, (ChatInputBar) this.f35330c, valueAnimator);
                break;
        }
    }
}
