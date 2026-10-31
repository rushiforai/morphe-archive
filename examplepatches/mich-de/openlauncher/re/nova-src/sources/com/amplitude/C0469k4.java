package com.amplitude;

import java.util.ArrayList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.k4, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0469k4 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ArrayList f20651a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f20652b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0469k4(ArrayList arrayList, String str) {
        super(0);
        this.f20651a = arrayList;
        this.f20652b = str;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return "Preparing data blocks for upload uris=" + this.f20651a + " activeUri=" + this.f20652b;
    }
}
