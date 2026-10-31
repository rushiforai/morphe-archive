package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class o {

    /* renamed from: d, reason: collision with root package name */
    public static final int f41330d = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Function0<Unit> f41331a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Function0<Unit> f41332b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Function0<Unit> f41333c;

    public o() {
        this(null, null, null, 7, null);
    }

    @Nullable
    public final Function0<Unit> a() {
        return this.f41332b;
    }

    @Nullable
    public final Function0<Unit> b() {
        return this.f41333c;
    }

    @Nullable
    public final Function0<Unit> c() {
        return this.f41331a;
    }

    public o(@Nullable Function0<Unit> function0, @Nullable Function0<Unit> function02, @Nullable Function0<Unit> function03) {
        this.f41331a = function0;
        this.f41332b = function02;
        this.f41333c = function03;
    }

    public /* synthetic */ o(Function0 function0, Function0 function02, Function0 function03, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : function0, (i5 & 2) != 0 ? null : function02, (i5 & 4) != 0 ? null : function03);
    }
}
