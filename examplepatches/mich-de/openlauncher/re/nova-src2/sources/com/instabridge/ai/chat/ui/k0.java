package com.instabridge.ai.chat.ui;

import android.view.KeyEvent;
import android.widget.TextView;
import com.instabridge.ai.chat.ui.ChatAdapter;

/* loaded from: classes3.dex */
public final /* synthetic */ class k0 implements TextView.OnEditorActionListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35375a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35376b;

    public /* synthetic */ k0(Object obj, int i5) {
        this.f35375a = i5;
        this.f35376b = obj;
    }

    @Override // android.widget.TextView.OnEditorActionListener
    public final boolean onEditorAction(TextView textView, int i5, KeyEvent keyEvent) {
        switch (this.f35375a) {
            case 0:
                return ChatAdapter.ToolCallCardViewHolder.bindAskClarification$lambda$5((j0) this.f35376b, textView, i5, keyEvent);
            default:
                return ChatInputBar._init_$lambda$9((ChatInputBar) this.f35376b, textView, i5, keyEvent);
        }
    }
}
