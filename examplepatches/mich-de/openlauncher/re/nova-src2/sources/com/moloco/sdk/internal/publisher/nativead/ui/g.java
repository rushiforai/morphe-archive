package com.moloco.sdk.internal.publisher.nativead.ui;

import android.content.Context;
import com.moloco.sdk.R;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.q;
import k0.t;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function5;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import p1.o;
import w70.m;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Function5<t, Boolean, Function0<Unit>, o, Integer, Unit> f37428a = a.f37397a.a();

    @NotNull
    public static final Function5<t, Boolean, Function0<Unit>, o, Integer, Unit> a() {
        return f37428a;
    }

    @NotNull
    public static final Function3<Context, m, m, q> b() {
        return new i(1);
    }

    public static final q a(Context context, m isPlaying, m progress) {
        Intrinsics.g(context, "context");
        Intrinsics.g(isPlaying, "isPlaying");
        Intrinsics.g(progress, "progress");
        return new q(context, isPlaying, progress, -1, 0, Integer.valueOf(R.drawable.moloco_twotone_play_arrow_24), Integer.valueOf(R.drawable.moloco_twotone_pause_24), context.getString(R.string.moloco_playback_control_icon_content_description), context.getString(R.string.moloco_playback_control_parent_content_description), 16, null);
    }
}
