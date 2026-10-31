package uf;

import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.s2;

/* loaded from: classes3.dex */
public final class i extends s2 {

    /* renamed from: b, reason: collision with root package name */
    public final TextView f91134b;

    /* renamed from: c, reason: collision with root package name */
    public final TextView f91135c;

    /* renamed from: d, reason: collision with root package name */
    public final ImageView f91136d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ m f91137e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(m mVar, View view) {
        super(view);
        this.f91137e = mVar;
        if (wf.v.f94376a < 26) {
            view.setFocusable(true);
        }
        this.f91134b = (TextView) view.findViewById(2131428001);
        this.f91135c = (TextView) view.findViewById(2131428023);
        this.f91136d = (ImageView) view.findViewById(2131428000);
        view.setOnClickListener(new fk.t(this, 28));
    }
}
