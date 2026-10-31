package com.instabridge.ai.chat.ui;

import android.view.View;
import com.instabridge.ai.protocol.Suggestion;

/* loaded from: classes3.dex */
public final /* synthetic */ class h implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35353a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AiChatView f35354b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Suggestion f35355c;

    public /* synthetic */ h(AiChatView aiChatView, Suggestion suggestion, int i5) {
        this.f35353a = i5;
        this.f35354b = aiChatView;
        this.f35355c = suggestion;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f35353a) {
            case 0:
                this.f35354b.handleSuggestionClick(this.f35355c);
                break;
            case 1:
                AiChatView.renderClarificationChips$lambda$49$lambda$47$lambda$46(this.f35354b, this.f35355c, view);
                break;
            default:
                this.f35354b.handleSuggestionClick(this.f35355c);
                break;
        }
    }
}
