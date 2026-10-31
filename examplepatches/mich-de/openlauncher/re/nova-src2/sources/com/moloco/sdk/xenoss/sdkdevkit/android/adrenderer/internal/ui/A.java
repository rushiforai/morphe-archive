package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import com.moloco.sdk.internal.y;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w70.l1;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class A extends View {

    /* renamed from: a, reason: collision with root package name */
    public static final int f39705a = 0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public A(@NotNull Context context) {
        super(context);
        Intrinsics.g(context, "context");
        setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        setBackgroundColor(0);
    }

    @Nullable
    public final Object a(@NotNull MotionEvent motionEvent, @NotNull com.moloco.sdk.internal.services.s sVar, @Nullable String str, @Nullable String str2, @NotNull h hVar, @Nullable l1 l1Var, @NotNull com.moloco.sdk.internal.y yVar, @NotNull Continuation<? super Unit> continuation) {
        Object objA;
        if (motionEvent.getAction() == 0) {
            int[] iArr = new int[2];
            getLocationOnScreen(iArr);
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.model.a aVar = new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.model.a(kotlin.collections.c.w0(iArr), kotlin.collections.c.P0(iArr), getHeight(), getWidth(), (int) (motionEvent.getX() + kotlin.collections.c.w0(iArr)), (int) (motionEvent.getY() + kotlin.collections.c.P0(iArr)));
            if (str != null) {
                y.a.a(yVar, str, System.currentTimeMillis(), null, 4, null);
            }
            if (str2 != null && (objA = sVar.a(str2, aVar, hVar, l1Var, continuation)) == CoroutineSingletons.f71806a) {
                return objA;
            }
        }
        return Unit.f71706a;
    }
}
