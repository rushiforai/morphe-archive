package com.fyber.inneractive.sdk.web;

import com.fyber.inneractive.sdk.config.enums.Orientation;
import com.fyber.inneractive.sdk.ui.IAmraidWebViewController;

/* loaded from: classes3.dex */
public interface b0 extends j1 {
    void a(IAmraidWebViewController.MraidVideoFailedToDisplayError mraidVideoFailedToDisplayError);

    void a(boolean z11, Orientation orientation);

    boolean a(String str);

    void b(boolean z11);

    void c();

    void d();

    void e();

    void onClose();
}
