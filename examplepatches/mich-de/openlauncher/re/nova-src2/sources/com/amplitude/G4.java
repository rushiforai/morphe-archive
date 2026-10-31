package com.amplitude;

import android.webkit.WebView;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class G4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public I4 f20249a;

    /* renamed from: b, reason: collision with root package name */
    public WebView f20250b;

    /* renamed from: c, reason: collision with root package name */
    public String f20251c;

    /* renamed from: d, reason: collision with root package name */
    public I4 f20252d;

    /* renamed from: e, reason: collision with root package name */
    public I4 f20253e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f20254f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ I4 f20255g;

    /* renamed from: h, reason: collision with root package name */
    public int f20256h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public G4(I4 i42, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f20255g = i42;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f20254f = obj;
        this.f20256h |= Integer.MIN_VALUE;
        return this.f20255g.a(null, this);
    }
}
