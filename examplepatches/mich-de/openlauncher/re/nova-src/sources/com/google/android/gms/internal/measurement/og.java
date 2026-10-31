package com.google.android.gms.internal.measurement;

import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class og extends gg implements fg {

    /* renamed from: g, reason: collision with root package name */
    public final Exception f32938g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f32939h;

    /* JADX WARN: Multi-variable type inference failed */
    public og(String str, fg fgVar, tg tgVar, boolean z11, yg ygVar) {
        super("<missing root>:".concat(str), (dg) fgVar, tg.a(tgVar, sg.f33072f), ygVar);
        this.f32938g = fgVar.zzf();
        this.f32939h = z11;
    }

    @Override // com.google.android.gms.internal.measurement.zg
    public final zg F(String str, tg tgVar, yg ygVar) {
        AtomicReference atomicReference = jg.f32692a;
        return X(str, tgVar, true, ygVar);
    }

    @Override // com.google.android.gms.internal.measurement.fg
    public final og X(String str, tg tgVar, boolean z11, yg ygVar) {
        boolean z12 = this.f32939h;
        if (z11 && !z12) {
            AtomicReference atomicReference = jg.f32692a;
        }
        boolean z13 = true;
        if ((!z11 || z12) && !z12) {
            z13 = false;
        }
        return new og(str, this, tgVar, z13, ygVar);
    }

    @Override // com.google.android.gms.internal.measurement.fg
    public final Exception zzf() {
        return this.f32938g;
    }

    @Override // com.google.android.gms.internal.measurement.zg
    public final tg zzl() {
        return sg.f33071e;
    }

    public og(UUID uuid, String str, String str2, tg tgVar, zzvr zzvrVar, yg ygVar) {
        super("<missing root>:".concat(str2), uuid, str, tg.a(tgVar, sg.f33072f), ygVar);
        this.f32938g = zzvrVar;
        this.f32939h = false;
    }
}
