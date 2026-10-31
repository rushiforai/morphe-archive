package com.fyber.inneractive.sdk.ui;

import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.activities.InneractiveFullscreenAdActivity;
import com.fyber.inneractive.sdk.util.o;

/* loaded from: classes3.dex */
public class CloseButtonFlowManager implements com.fyber.inneractive.sdk.flow.storepromo.observer.a, CloseButtonConfigurationChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final View f31122a;

    /* renamed from: b, reason: collision with root package name */
    public final TextView f31123b;

    /* renamed from: c, reason: collision with root package name */
    public final View f31124c;

    /* renamed from: d, reason: collision with root package name */
    public final ImageView f31125d;

    /* renamed from: e, reason: collision with root package name */
    public final FrameLayout f31126e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f31127f = false;

    /* renamed from: g, reason: collision with root package name */
    public final CloseButtonConfiguration f31128g = new CloseButtonConfiguration(this);

    public CloseButtonFlowManager(InneractiveFullscreenAdActivity inneractiveFullscreenAdActivity, com.fyber.inneractive.sdk.activities.d dVar) {
        View viewFindViewById = inneractiveFullscreenAdActivity.findViewById(R.id.ia_fl_close_button);
        this.f31122a = viewFindViewById;
        this.f31123b = (TextView) inneractiveFullscreenAdActivity.findViewById(R.id.ia_tv_close_button);
        View viewFindViewById2 = inneractiveFullscreenAdActivity.findViewById(R.id.ia_clickable_close_button);
        this.f31124c = viewFindViewById2;
        this.f31125d = (ImageView) inneractiveFullscreenAdActivity.findViewById(R.id.ia_iv_close_button);
        this.f31126e = (FrameLayout) inneractiveFullscreenAdActivity.findViewById(R.id.close_button_container);
        viewFindViewById.setVisibility(8);
        viewFindViewById2.setOnClickListener(dVar);
    }

    @Override // com.fyber.inneractive.sdk.ui.CloseButtonConfigurationChangeListener
    public final void a(CloseButtonConfiguration closeButtonConfiguration) {
        int i5;
        int i11;
        if (closeButtonConfiguration.f31120f) {
            this.f31122a.setVisibility(8);
            this.f31123b.setVisibility(8);
            this.f31125d.setVisibility(8);
            this.f31124c.setVisibility(8);
            return;
        }
        CloseButtonConfiguration closeButtonConfiguration2 = this.f31128g;
        if (closeButtonConfiguration2.f31116b) {
            if (!closeButtonConfiguration2.f31117c || this.f31127f) {
                this.f31122a.setAlpha(1.0f);
                this.f31125d.setAlpha(1.0f);
            } else {
                this.f31122a.setAlpha(0.0f);
                this.f31125d.setAlpha(0.0f);
            }
            this.f31123b.setText(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            this.f31123b.setVisibility(8);
            int i12 = closeButtonConfiguration2.f31118d;
            if (i12 >= 5) {
                int iA = o.a(i12);
                this.f31125d.getLayoutParams().width = iA;
                this.f31125d.getLayoutParams().height = iA;
            }
            int i13 = closeButtonConfiguration2.f31119e;
            if (i13 >= 5) {
                FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) this.f31125d.getLayoutParams();
                FrameLayout.LayoutParams layoutParams2 = (FrameLayout.LayoutParams) this.f31122a.getLayoutParams();
                FrameLayout.LayoutParams layoutParams3 = (FrameLayout.LayoutParams) this.f31124c.getLayoutParams();
                int iA2 = o.a(i13);
                int i14 = layoutParams.width;
                int i15 = iA2 - i14;
                if (iA2 <= i14 || i15 <= (i11 = layoutParams2.rightMargin)) {
                    layoutParams3.width = iA2;
                    layoutParams3.height = iA2;
                    i5 = layoutParams2.rightMargin;
                    if (i15 < i5) {
                        i5 -= i15 / 2;
                    }
                } else {
                    int i16 = (i14 / 2) + (iA2 / 2) + i11;
                    layoutParams3.width = i16;
                    layoutParams3.height = i16;
                    layoutParams2.gravity = 53;
                    i5 = 0;
                }
                layoutParams3.setMargins(i5, i5, i5, i5);
                layoutParams3.gravity = 17;
            }
        }
        this.f31122a.setVisibility((closeButtonConfiguration.f31115a || closeButtonConfiguration.f31116b) ? 0 : 8);
        this.f31123b.setVisibility(closeButtonConfiguration.f31115a ? 0 : 8);
        int i17 = closeButtonConfiguration.f31116b ? 0 : 8;
        this.f31125d.setVisibility(i17);
        this.f31124c.setVisibility(i17);
        this.f31124c.setEnabled(closeButtonConfiguration.f31116b);
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.observer.a
    public final void a(com.fyber.inneractive.sdk.flow.storepromo.observer.b bVar) {
        CloseButtonConfiguration closeButtonConfiguration = this.f31128g;
        closeButtonConfiguration.f31120f = bVar.f28375a;
        closeButtonConfiguration.f31121g.a(closeButtonConfiguration);
    }
}
