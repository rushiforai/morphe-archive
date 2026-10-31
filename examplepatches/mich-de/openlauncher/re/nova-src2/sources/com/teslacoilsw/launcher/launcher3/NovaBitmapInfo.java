package com.teslacoilsw.launcher.launcher3;

import a80.m;
import android.graphics.Bitmap;
import b.c0;
import com.android.launcher3.icons.BitmapInfo;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/launcher3/NovaBitmapInfo;", "Lcom/android/launcher3/icons/BitmapInfo;", "jz/h", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class NovaBitmapInfo extends BitmapInfo {

    /* renamed from: e, reason: collision with root package name */
    public final boolean f45811e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f45812f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f45813g;

    public NovaBitmapInfo(Bitmap bitmap, int i5, boolean z11, boolean z12, boolean z13) {
        super(bitmap, i5);
        this.f45811e = z11;
        this.f45812f = z12;
        this.f45813g = z13;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v1, types: [int] */
    /* JADX WARN: Type inference failed for: r1v4 */
    /* JADX WARN: Type inference failed for: r1v5 */
    @Override // com.android.launcher3.icons.BitmapInfo
    public final int d() {
        boolean z11 = this.f45812f;
        boolean z12 = this.f45811e;
        ?? r12 = z12;
        if (z11) {
            r12 = (z12 ? 1 : 0) | 2;
        }
        return this.f45813g ? r12 | 4 : r12;
    }

    @Override // com.android.launcher3.icons.BitmapInfo
    public final String toString() {
        Bitmap bitmap = this.f21151a;
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        String hexString = Integer.toHexString(this.f21152b);
        StringBuilder sbT = c0.t(width, "NovaBitmapInfo(", "×", height, ", ");
        m.q(hexString, " isNovaThemed=", " isAdaptive=", sbT, this.f45811e);
        return m.k(sbT, this.f45812f, ")");
    }
}
