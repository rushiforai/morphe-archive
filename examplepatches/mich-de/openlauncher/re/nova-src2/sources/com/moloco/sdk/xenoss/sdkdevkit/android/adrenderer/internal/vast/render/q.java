package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import android.annotation.SuppressLint;
import android.content.Context;
import android.webkit.WebSettings;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.C2977d;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.C2978e;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.y;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class q {

    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f41878a;

        static {
            int[] iArr = new int[com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.i.values().length];
            try {
                iArr[com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.i.f40755a.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.i.f40756b.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            f41878a = iArr;
        }
    }

    @SuppressLint({"SetJavaScriptEnabled"})
    @NotNull
    public static final C2977d a(@NotNull Context context) {
        Intrinsics.g(context, "context");
        C2977d c2977d = new C2977d(context);
        c2977d.setScrollBarStyle(0);
        c2977d.setHorizontalScrollBarEnabled(false);
        c2977d.setVerticalScrollBarEnabled(false);
        WebSettings settings = c2977d.getSettings();
        settings.setSupportZoom(false);
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        c2977d.setBackgroundColor(0);
        return c2977d;
    }

    public static final void a(@NotNull C2977d c2977d, @NotNull y vastResource) {
        String strA;
        Intrinsics.g(c2977d, "<this>");
        Intrinsics.g(vastResource, "vastResource");
        if (vastResource instanceof y.c) {
            y.c cVar = (y.c) vastResource;
            int i5 = a.f41878a[cVar.a().a().ordinal()];
            if (i5 == 1) {
                strA = "<html><head></head><body style=\"margin:0;padding:0\"><img src=\"" + cVar.a().b() + "\" width=\"100%\" style=\"max-width:100%;max-height:100%;\" /></body></html>";
            } else if (i5 == 2) {
                strA = "<script src=\"" + cVar.a().b() + "\"></script>";
            } else {
                throw new NoWhenBranchMatchedException();
            }
        } else if (vastResource instanceof y.a) {
            strA = ((y.a) vastResource).a().a();
        } else if (vastResource instanceof y.b) {
            strA = "<iframe frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" style=\"border: 0px; margin: 0px;\" width=100% height=100% src=\"" + ((y.b) vastResource).a().a() + "\"></iframe>";
        } else {
            throw new NoWhenBranchMatchedException();
        }
        try {
            C2978e.a(c2977d, c2977d.getHtmlCssFixer().a(strA));
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, "BaseWebView", e3.toString(), e3, false, 8, null);
        }
    }
}
