package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class q implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f42056a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f42057b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e1 f42058c;

    public /* synthetic */ q(Function0 function0, e1 e1Var) {
        this.f42056a = 0;
        this.f42058c = e1Var;
        this.f42057b = function0;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f42056a) {
            case 0:
                break;
            case 1:
                e1 e1Var = this.f42058c;
                if (((Boolean) e1Var.getValue()).booleanValue()) {
                    e1Var.setValue(Boolean.FALSE);
                } else {
                    this.f42057b.invoke();
                }
                break;
            default:
                this.f42058c.setValue(Boolean.TRUE);
                this.f42057b.invoke();
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ q(Function0 function0, e1 e1Var, int i5) {
        this.f42056a = i5;
        this.f42057b = function0;
        this.f42058c = e1Var;
    }
}
