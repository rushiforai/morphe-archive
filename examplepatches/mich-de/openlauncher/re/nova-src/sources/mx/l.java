package mx;

import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.s2;

/* loaded from: classes4.dex */
public final class l extends s2 {

    /* renamed from: b, reason: collision with root package name */
    public final TextView f77200b;

    /* renamed from: c, reason: collision with root package name */
    public final TextView f77201c;

    /* renamed from: d, reason: collision with root package name */
    public final ImageView f77202d;

    public l(View view) {
        super(view);
        this.f77200b = (TextView) view.findViewById(16908308);
        this.f77201c = (TextView) view.findViewById(16908309);
        this.f77202d = (ImageView) view.findViewById(16908294);
        view.findViewById(2131428227).setVisibility(4);
        view.findViewById(2131427776).setVisibility(8);
        view.setBackgroundColor(268435456);
    }
}
