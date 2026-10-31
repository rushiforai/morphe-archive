package com.amplitude;

import android.webkit.WebView;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;

/* loaded from: classes2.dex */
public abstract class r4 {
    public static Object a(WebView webView, String str, G4 g42) {
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(g42));
        mVar.t();
        webView.evaluateJavascript(str, new q4(mVar));
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }
}
