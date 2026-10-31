package com.moloco.sdk.internal.utils;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class c implements CoroutineContext.Element {

    /* renamed from: b, reason: collision with root package name */
    public static final int f38211b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final d f38212a;

    public c(@NotNull d key) {
        Intrinsics.g(key, "key");
        this.f38212a = key;
    }

    @Override // kotlin.coroutines.CoroutineContext.Element
    @NotNull
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public d getKey() {
        return this.f38212a;
    }

    @Override // kotlin.coroutines.CoroutineContext
    public <R> R fold(R r11, @NotNull Function2<? super R, ? super CoroutineContext.Element, ? extends R> function2) {
        return (R) CoroutineContext.Element.DefaultImpls.a(this, r11, function2);
    }

    @Override // kotlin.coroutines.CoroutineContext
    @Nullable
    public <E extends CoroutineContext.Element> E get(@NotNull CoroutineContext.Key<E> key) {
        return (E) CoroutineContext.Element.DefaultImpls.b(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    @NotNull
    public CoroutineContext minusKey(@NotNull CoroutineContext.Key<?> key) {
        return CoroutineContext.Element.DefaultImpls.c(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    @NotNull
    public CoroutineContext plus(@NotNull CoroutineContext coroutineContext) {
        return CoroutineContext.Element.DefaultImpls.d(this, coroutineContext);
    }
}
