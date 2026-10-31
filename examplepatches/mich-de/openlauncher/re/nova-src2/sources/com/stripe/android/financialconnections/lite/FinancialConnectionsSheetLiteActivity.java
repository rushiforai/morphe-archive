package com.stripe.android.financialconnections.lite;

import a5.a1;
import a5.s0;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebView;
import android.widget.ProgressBar;
import bz.b;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs;
import d00.c;
import g.o;
import h6.g1;
import h6.h1;
import java.util.WeakHashMap;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import mk.v;
import mx.e0;
import o00.d;
import rl.g;
import rr.a;
import sr.l;
import sr.m;
import t70.m0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/financialconnections/lite/FinancialConnectionsSheetLiteActivity;", "Lg/o;", "<init>", "()V", "financial-connections-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class FinancialConnectionsSheetLiteActivity extends o {

    /* renamed from: r, reason: collision with root package name */
    public static final /* synthetic */ int f42693r = 0;
    public WebView o;

    /* renamed from: p, reason: collision with root package name */
    public ProgressBar f42694p;

    /* renamed from: q, reason: collision with root package name */
    public final h1 f42695q;

    public FinancialConnectionsSheetLiteActivity() {
        super(2131624388);
        this.f42695q = new h1(Reflection.f71864a.getOrCreateKotlinClass(l.class), new sr.o(this, 0), new d(29), new sr.o(this, 1));
    }

    @Override // g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        Bundle extras;
        int i5;
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (intent != null && (extras = intent.getExtras()) != null) {
            int i11 = 1;
            if (extras.containsKey("FinancialConnectionsSheetActivityArgs")) {
                setContentView(2131624388);
                this.o = (WebView) findViewById(2131429190);
                this.f42694p = (ProgressBar) findViewById(2131428652);
                if (Build.VERSION.SDK_INT >= 30) {
                    v.P(getWindow(), false);
                    View viewFindViewById = findViewById(16908290);
                    g gVar = new g(7);
                    WeakHashMap weakHashMap = a1.f250a;
                    s0.l(viewFindViewById, gVar);
                }
                Intent intent2 = getIntent();
                Intrinsics.f(intent2, "getIntent(...)");
                FinancialConnectionsSheetActivityArgs financialConnectionsSheetActivityArgs = (FinancialConnectionsSheetActivityArgs) intent2.getParcelableExtra("FinancialConnectionsSheetActivityArgs");
                Continuation continuation = null;
                a aVarF = financialConnectionsSheetActivityArgs != null ? p6.a1.f(financialConnectionsSheetActivityArgs) : null;
                int i12 = aVarF == null ? -1 : m.f87730a[aVarF.ordinal()];
                int i13 = 3;
                if (i12 == -1 || i12 == 1 || i12 == 2) {
                    i5 = 2131101153;
                } else {
                    if (i12 != 3) {
                        throw new NoWhenBranchMatchedException();
                    }
                    i5 = 2131101155;
                }
                int color = getColor(i5);
                ProgressBar progressBar = this.f42694p;
                if (progressBar == null) {
                    Intrinsics.m("progressBar");
                    throw null;
                }
                progressBar.getProgressDrawable().setTint(color);
                ProgressBar progressBar2 = this.f42694p;
                if (progressBar2 == null) {
                    Intrinsics.m("progressBar");
                    throw null;
                }
                progressBar2.getIndeterminateDrawable().setTint(color);
                ProgressBar progressBar3 = this.f42694p;
                if (progressBar3 == null) {
                    Intrinsics.m("progressBar");
                    throw null;
                }
                progressBar3.setVisibility(0);
                WebView webView = this.o;
                if (webView == null) {
                    Intrinsics.m("webView");
                    throw null;
                }
                webView.getSettings().setJavaScriptEnabled(true);
                webView.getSettings().setUseWideViewPort(true);
                webView.getSettings().setLoadWithOverviewMode(true);
                webView.setWebChromeClient(new b(this, i11));
                webView.setWebViewClient(new bz.a(this, 4));
                getOnBackPressedDispatcher().a(this, new c(this, i13));
                m0.t(g1.e(this), null, null, new e0(this, continuation, 20), 3);
                return;
            }
        }
        finish();
    }
}
