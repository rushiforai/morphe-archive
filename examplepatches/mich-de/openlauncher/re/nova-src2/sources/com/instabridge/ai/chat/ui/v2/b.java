package com.instabridge.ai.chat.ui.v2;

import android.view.View;
import android.widget.EditText;
import android.widget.Spinner;
import kotlin.jvm.functions.Function0;

/* loaded from: classes3.dex */
public final /* synthetic */ class b implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35442a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f35443b;

    public /* synthetic */ b(View view, int i5) {
        this.f35442a = i5;
        this.f35443b = view;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35442a) {
            case 0:
                return AiChatViewV2._init_$lambda$3((AiChatViewV2) this.f35443b);
            case 1:
                return ToolCallCardViewHolderV2.bindInputForm$lambda$12((Spinner) this.f35443b);
            default:
                return ToolCallCardViewHolderV2.bindInputForm$lambda$14((EditText) this.f35443b);
        }
    }
}
