package com.instabridge.ai.chat.ui;

import android.widget.TextView;
import com.instabridge.ai.chat.ui.ChatAdapter;

/* loaded from: classes3.dex */
public final /* synthetic */ class d0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35340a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ TextView f35341b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ChatAdapter.AiMessageViewHolder f35342c;

    public /* synthetic */ d0(TextView textView, ChatAdapter.AiMessageViewHolder aiMessageViewHolder, int i5) {
        this.f35340a = i5;
        this.f35341b = textView;
        this.f35342c = aiMessageViewHolder;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f35340a) {
            case 0:
                ChatAdapter.AiMessageViewHolder.applyBrandGradientToText$lambda$26(this.f35341b, this.f35342c);
                break;
            default:
                ChatAdapter.AiMessageViewHolder.startShimmerAnimation$lambda$5(this.f35341b, this.f35342c);
                break;
        }
    }
}
