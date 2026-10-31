package com.fyber.inneractive.sdk.model.vast;

import com.fyber.inneractive.sdk.util.x1;
import org.w3c.dom.Node;

/* loaded from: classes3.dex */
public final class a0 extends g {

    /* renamed from: i, reason: collision with root package name */
    public String f28567i;

    public a0() {
        this.f28603f = 1;
    }

    public static a0 c(Node node) throws NumberFormatException {
        a0 a0Var = new a0();
        super.b(node);
        a0Var.f28567i = x1.a(x1.d(node, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40335i));
        return a0Var;
    }
}
