package com.fyber.inneractive.sdk.flow.endcard;

import android.view.MotionEvent;
import android.view.View;
import com.fyber.inneractive.sdk.player.controller.z;
import com.fyber.inneractive.sdk.util.g1;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class e implements View.OnTouchListener {

    /* renamed from: a, reason: collision with root package name */
    public final int f28062a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.ui.n f28063b;

    /* renamed from: c, reason: collision with root package name */
    public final int[] f28064c = new int[2];

    /* renamed from: d, reason: collision with root package name */
    public final g1 f28065d = new g1();

    public e(int i5, com.fyber.inneractive.sdk.player.ui.n nVar) {
        this.f28062a = i5;
        this.f28063b = nVar;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) throws JSONException {
        if (motionEvent.getActionMasked() != 0) {
            return false;
        }
        view.getRootView().getLocationOnScreen(this.f28064c);
        float rawX = motionEvent.getRawX() - this.f28064c[0];
        float rawY = motionEvent.getRawY() - this.f28064c[1];
        g1 g1Var = this.f28065d;
        g1Var.f31187a = rawX;
        g1Var.f31188b = rawY;
        ((z) this.f28063b).a(this.f28062a, g1Var);
        return true;
    }
}
