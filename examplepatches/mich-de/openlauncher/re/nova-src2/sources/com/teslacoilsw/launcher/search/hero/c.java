package com.teslacoilsw.launcher.search.hero;

import h50.q;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlinx.serialization.Serializable;
import nova.branch.engage.sesame_lite.internal.IdHash;
import org.jetbrains.annotations.NotNull;
import u10.t;

@Serializable
/* loaded from: classes.dex */
public abstract class c {

    @NotNull
    public static final t Companion = new t();

    /* renamed from: a, reason: collision with root package name */
    public static final Object f46249a = LazyKt.b(LazyThreadSafetyMode.f71680b, new q(26));

    public abstract IdHash b();
}
