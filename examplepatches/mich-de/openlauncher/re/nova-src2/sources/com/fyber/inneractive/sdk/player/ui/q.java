package com.fyber.inneractive.sdk.player.ui;

import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import com.fyber.inneractive.sdk.player.controller.z;
import com.fyber.inneractive.sdk.util.g1;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class q extends GestureDetector.SimpleOnGestureListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f30695a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int[] f30696b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f30697c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ s f30698d;

    public q(s sVar, View view, int[] iArr, int i5) {
        this.f30698d = sVar;
        this.f30695a = view;
        this.f30696b = iArr;
        this.f30697c = i5;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
    public final boolean onDoubleTap(MotionEvent motionEvent) throws JSONException {
        onSingleTapConfirmed(motionEvent);
        return true;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final boolean onDown(MotionEvent motionEvent) {
        return true;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final void onLongPress(MotionEvent motionEvent) throws JSONException {
        onSingleTapConfirmed(motionEvent);
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
    public final boolean onSingleTapConfirmed(MotionEvent motionEvent) throws JSONException {
        if (motionEvent.getAction() == 0) {
            this.f30695a.getRootView().getLocationOnScreen(this.f30696b);
            float rawX = motionEvent.getRawX() - this.f30696b[0];
            float rawY = motionEvent.getRawY() - this.f30696b[1];
            g1 g1Var = this.f30698d.f30680a;
            g1Var.f31187a = rawX;
            g1Var.f31188b = rawY;
        }
        s sVar = this.f30698d;
        n nVar = sVar.f30686g;
        if (nVar != null) {
            ((z) nVar).a(this.f30697c, sVar.f30680a);
        }
        return true;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final boolean onSingleTapUp(MotionEvent motionEvent) {
        return true;
    }
}
