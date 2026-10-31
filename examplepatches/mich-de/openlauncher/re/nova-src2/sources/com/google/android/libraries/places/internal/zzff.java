package com.google.android.libraries.places.internal;

import android.graphics.Bitmap;
import android.widget.ImageView;
import com.android.volley.toolbox.f;
import java.util.Map;
import jb.k;
import jb.l;

/* loaded from: classes3.dex */
final class zzff extends f {
    final /* synthetic */ Map zza;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzff(zzfg zzfgVar, String str, l lVar, int i5, int i11, ImageView.ScaleType scaleType, Bitmap.Config config, k kVar, Map map) {
        super(str, lVar, scaleType, config, kVar);
        this.zza = map;
    }

    @Override // jb.i
    public final Map getHeaders() {
        return this.zza;
    }
}
