package com.fyber.inneractive.sdk.flow.endcard;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.util.j1;

/* loaded from: classes3.dex */
public final class f extends a {

    /* renamed from: c, reason: collision with root package name */
    public final ViewGroup f28066c;

    /* renamed from: d, reason: collision with root package name */
    public final Button f28067d;

    /* renamed from: e, reason: collision with root package name */
    public final TextView f28068e;

    public f(b bVar) {
        super(bVar);
        View viewInflate = LayoutInflater.from(IAConfigManager.Q.f27762v.a()).inflate(R.layout.ia_layout_default_video_end_card, (ViewGroup) null);
        this.f28067d = (Button) viewInflate.findViewById(R.id.ia_b_end_card_call_to_action);
        this.f28068e = (TextView) viewInflate.findViewById(R.id.ia_endcard_tv_app_info_button);
        this.f28066c = a.a(viewInflate);
    }

    public final void a(com.fyber.inneractive.sdk.player.ui.b bVar, com.fyber.inneractive.sdk.player.ui.n nVar) {
        com.fyber.inneractive.sdk.ignite.m mVar;
        Context context = this.f28067d.getContext();
        this.f28067d.setAllCaps(bVar.f30661b);
        this.f28067d.setVisibility(0);
        if (IAConfigManager.Q.F.n() && (mVar = bVar.f30668i) != null && mVar == com.fyber.inneractive.sdk.ignite.m.TRUE_SINGLE_TAP) {
            this.f28067d.setText(R.string.ia_video_instant_install_text);
            if (bVar.f30666g) {
                String str = bVar.f30667h;
                if (str != null && str.length() == 1) {
                    TextView textView = this.f28068e;
                    int dimensionPixelSize = textView.getContext().getResources().getDimensionPixelSize(R.dimen.ia_image_control_size);
                    textView.setBackgroundResource(R.drawable.ia_bg_circle_overlay);
                    ViewGroup.LayoutParams layoutParams = textView.getLayoutParams();
                    layoutParams.width = dimensionPixelSize;
                    layoutParams.height = dimensionPixelSize;
                    textView.setLayoutParams(layoutParams);
                }
                this.f28068e.setText(str);
                this.f28068e.setVisibility(0);
            }
        } else {
            this.f28068e.setVisibility(8);
            Button button = this.f28067d;
            Context context2 = this.f28066c.getContext();
            String str2 = bVar.f30662c;
            button.setText(!TextUtils.isEmpty(str2) ? j1.a(str2, 15) : context2.getString(R.string.ia_video_install_now_text));
        }
        this.f28067d.setBackgroundResource(R.drawable.ia_bg_green);
        this.f28067d.setTextSize(0, context.getResources().getDimension(R.dimen.ia_video_overlay_text_large_plus));
        TextView textView2 = this.f28068e;
        if (nVar != null) {
            textView2.setOnTouchListener(new e(10, nVar));
        } else {
            textView2.setOnTouchListener(null);
        }
        Button button2 = this.f28067d;
        if (nVar != null) {
            button2.setOnTouchListener(new e(8, nVar));
        } else {
            button2.setOnTouchListener(null);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.n
    public final View b() {
        return this.f28066c;
    }
}
