package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.p;
import f1.c3;
import f1.d3;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.protobuf.schema.ProtoBufSchemaGenerator;

/* loaded from: classes4.dex */
public final /* synthetic */ class j0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f41224a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f41225b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f41226c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f41227d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f41228e;

    public /* synthetic */ j0(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.i iVar, Function0 function0, Function1 function1, boolean z11) {
        this.f41227d = iVar;
        this.f41228e = function0;
        this.f41225b = function1;
        this.f41226c = z11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f41224a) {
            case 0:
                return p.a.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.i) this.f41227d, (Function0) this.f41228e, (Function1) this.f41225b, this.f41226c);
            case 1:
                return new c3(d3.f53456a, (y3.c) this.f41227d, (Function1) this.f41225b, (c0.m) this.f41228e, this.f41226c);
            default:
                return ProtoBufSchemaGenerator.generateMessageField$lambda$14((String) this.f41227d, this.f41226c, (String) this.f41228e, (SerialDescriptor) this.f41225b);
        }
    }

    public /* synthetic */ j0(String str, boolean z11, String str2, SerialDescriptor serialDescriptor) {
        this.f41227d = str;
        this.f41226c = z11;
        this.f41228e = str2;
        this.f41225b = serialDescriptor;
    }

    public /* synthetic */ j0(y3.c cVar, Function1 function1, c0.m mVar, boolean z11) {
        d3 d3Var = d3.f53456a;
        this.f41227d = cVar;
        this.f41225b = function1;
        this.f41228e = mVar;
        this.f41226c = z11;
    }
}
