package com.amplitude;

import java.util.List;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.y1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0541y1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f20820a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f20821b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ List f20822c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0541y1(String str, String str2, List list) {
        super(0);
        this.f20820a = str;
        this.f20821b = str2;
        this.f20822c = list;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        String str = this.f20820a;
        String str2 = this.f20821b;
        int size = this.f20822c.size();
        StringBuilder sbW = b.c0.w("Writing data to file: ", str, ", currentFileUri=", str2, ", dataSize=");
        sbW.append(size);
        return sbW.toString();
    }
}
