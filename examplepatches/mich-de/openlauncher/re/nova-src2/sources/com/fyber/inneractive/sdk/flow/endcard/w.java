package com.fyber.inneractive.sdk.flow.endcard;

import android.graphics.Bitmap;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.IAConfigManager;

/* loaded from: classes3.dex */
public final class w extends a {

    /* renamed from: c, reason: collision with root package name */
    public Bitmap f28137c;

    /* renamed from: d, reason: collision with root package name */
    public final ImageView f28138d;

    /* renamed from: e, reason: collision with root package name */
    public final ViewGroup f28139e;

    public w(v vVar) {
        super(vVar);
        ImageView imageView = new ImageView(IAConfigManager.Q.f27762v.a());
        imageView.setId(R.id.ia_inneractive_vast_endcard_static);
        this.f28138d = imageView;
        this.f28139e = a.a(imageView);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.n
    public final View b() {
        return this.f28139e;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.a, com.fyber.inneractive.sdk.flow.endcard.n
    public final void destroy() {
        com.fyber.inneractive.sdk.util.v.a(b());
        Bitmap bitmap = this.f28137c;
        if (bitmap != null) {
            bitmap.recycle();
        }
        this.f28137c = null;
        this.f28138d.setImageBitmap(null);
    }
}
