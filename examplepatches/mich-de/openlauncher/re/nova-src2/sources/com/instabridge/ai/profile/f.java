package com.instabridge.ai.profile;

import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.u;
import kotlin.jvm.functions.Function0;

/* loaded from: classes3.dex */
public final /* synthetic */ class f implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35550a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f35551b;

    public /* synthetic */ f(Function0 function0, int i5) {
        this.f35550a = i5;
        this.f35551b = function0;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f35550a) {
            case 0:
                this.f35551b.invoke();
                break;
            case 1:
                com.moloco.sdk.internal.publisher.nativead.ui.c.a(this.f35551b, view);
                break;
            case 2:
                u.a(this.f35551b, view);
                break;
            case 3:
                this.f35551b.invoke();
                break;
            default:
                this.f35551b.invoke();
                break;
        }
    }
}
