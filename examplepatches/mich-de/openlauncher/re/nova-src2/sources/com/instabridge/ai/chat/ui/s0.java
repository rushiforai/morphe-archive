package com.instabridge.ai.chat.ui;

import android.view.View;

/* loaded from: classes3.dex */
public final /* synthetic */ class s0 implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35410a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ModelSelectorSheet f35411b;

    public /* synthetic */ s0(ModelSelectorSheet modelSelectorSheet, int i5) {
        this.f35410a = i5;
        this.f35411b = modelSelectorSheet;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f35410a) {
            case 0:
                ModelSelectorSheet.addAutoRow$lambda$1(this.f35411b, view);
                break;
            default:
                ModelSelectorSheet.onViewCreated$lambda$0(this.f35411b, view);
                break;
        }
    }
}
