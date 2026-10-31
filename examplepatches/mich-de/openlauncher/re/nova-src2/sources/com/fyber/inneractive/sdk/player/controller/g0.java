package com.fyber.inneractive.sdk.player.controller;

import android.view.View;
import com.fyber.inneractive.sdk.config.enums.Orientation;
import com.fyber.inneractive.sdk.util.g1;

/* loaded from: classes3.dex */
public interface g0 extends com.fyber.inneractive.sdk.ui.controller.c {
    com.fyber.inneractive.sdk.util.d0 a(g1 g1Var, com.fyber.inneractive.sdk.util.g gVar);

    com.fyber.inneractive.sdk.util.d0 a(String str, g1 g1Var, boolean z11);

    void a(int i5, boolean z11);

    void a(View view);

    void a(View view, String str);

    void a(String str, String str2);

    void a(boolean z11);

    void a(boolean z11, Orientation orientation);

    void c();

    void e();

    void f();

    void g();

    void h();

    void i();

    void j();

    com.fyber.inneractive.sdk.ignite.m o();

    void onPlayerError();

    void onProgress(int i5, int i11);
}
