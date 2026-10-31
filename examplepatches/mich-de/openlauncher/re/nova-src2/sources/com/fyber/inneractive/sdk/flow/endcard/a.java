package com.fyber.inneractive.sdk.flow.endcard;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public abstract class a implements n {

    /* renamed from: a, reason: collision with root package name */
    public final String f28053a = IAlog.a(this);

    /* renamed from: b, reason: collision with root package name */
    public final b f28054b;

    public a(b bVar) {
        this.f28054b = bVar;
    }

    public static ViewGroup a(View view) {
        ViewGroup viewGroup = (ViewGroup) LayoutInflater.from(view.getContext()).inflate(R.layout.ia_endcard_container, (ViewGroup) null);
        viewGroup.addView(view);
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        layoutParams.width = -1;
        layoutParams.height = -1;
        view.setLayoutParams(layoutParams);
        return viewGroup;
    }

    public void c() {
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.n
    public void destroy() {
        a();
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.n
    public void a() {
        com.fyber.inneractive.sdk.util.v.a(b());
    }
}
