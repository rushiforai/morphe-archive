package com.android.launcher3.views;

import aa.p;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.dragndrop.DragLayer;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.util.NamedIntent;
import cz.e;
import cz.g;
import cz.k;
import ga.f;
import kl.q0;
import kotlin.jvm.internal.Intrinsics;
import mx.j;
import o9.n1;
import za.n;

/* loaded from: classes.dex */
public class DoubleShadowBubbleTextView extends BubbleTextView {
    public boolean B;
    public e C;
    public k D;
    public final n E;
    public boolean F;

    public DoubleShadowBubbleTextView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.B = true;
        this.F = true;
        n nVar = new n(context, attributeSet);
        this.E = nVar;
        if (this.F) {
            setShadowLayer(nVar.f98463a, 0.0f, 0.0f, nVar.f98464b);
        }
    }

    public static int V(int i5, int i11) {
        return p.d(i5, Math.round((Color.alpha(i5) * i11) / 255.0f));
    }

    public final void W(k kVar) {
        this.D = kVar;
        this.C = kVar == null ? null : new e(getContext(), this);
    }

    @Override // com.android.launcher3.BubbleTextView, android.widget.TextView, android.view.View
    public void onDraw(Canvas canvas) {
        if (this.F) {
            n nVar = this.E;
            nVar.getClass();
            int iAlpha = Color.alpha(getCurrentTextColor());
            int i5 = nVar.f98468f;
            int iAlpha2 = Color.alpha(i5);
            int i11 = nVar.f98464b;
            int iAlpha3 = Color.alpha(i11);
            if (iAlpha == 0 || (iAlpha2 == 0 && iAlpha3 == 0)) {
                getPaint().clearShadowLayer();
            } else if (iAlpha3 > 0 && iAlpha2 == 0) {
                getPaint().setShadowLayer(nVar.f98463a, 0.0f, 0.0f, V(i11, iAlpha));
            } else {
                if (iAlpha2 <= 0 || iAlpha3 != 0) {
                    int iAlpha4 = Color.alpha(getCurrentTextColor());
                    getPaint().setShadowLayer(nVar.f98463a, 0.0f, 0.0f, V(nVar.f98464b, iAlpha4));
                    E(canvas);
                    canvas.save();
                    canvas.clipRect(getScrollX(), getExtendedPaddingTop() + getScrollY(), getWidth() + getScrollX(), getHeight() + getScrollY());
                    getPaint().setShadowLayer(nVar.f98465c, nVar.f98466d, nVar.f98467e, V(nVar.f98468f, iAlpha4));
                    E(canvas);
                    canvas.restore();
                    C(canvas);
                    return;
                }
                getPaint().setShadowLayer(nVar.f98465c, nVar.f98466d, nVar.f98467e, V(i5, iAlpha));
            }
        }
        super.onDraw(canvas);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:125:0x0235  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x02d2  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x02ed  */
    @Override // com.android.launcher3.BubbleTextView, android.widget.TextView, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        e eVar;
        e eVar2;
        boolean zOnDoubleTap;
        MotionEvent motionEvent2;
        boolean zP1;
        MotionEvent motionEvent3;
        boolean z11;
        boolean z12;
        if ((motionEvent.getAction() != 0 || !Q(motionEvent.getX(), motionEvent.getY())) && this.B) {
            int action = motionEvent.getAction();
            Context context = getContext();
            q0 q0Var = n1.C0;
            NovaLauncher novaLauncher = (NovaLauncher) o9.k.Y(context);
            NovaLauncher novaLauncher2 = (NovaLauncher) o9.k.Y(getContext());
            DragLayer dragLayer = novaLauncher2 != null ? novaLauncher2.P : null;
            if (dragLayer != null && !novaLauncher.isDestroyed()) {
                if (action == 1 || action == 3) {
                    dragLayer.f98445l = 0;
                    dragLayer.f21089x = 0;
                }
                e eVar3 = this.C;
                if (eVar3 == null || !(getTag() instanceof ga.e)) {
                    dragLayer.f21089x = 0;
                } else {
                    Object tag = getTag();
                    Intrinsics.e(tag, "null cannot be cast to non-null type com.android.launcher3.model.data.ItemInfoWithIcon");
                    f fVar = (f) tag;
                    if (fVar.f57308v != null || fVar.f57309w != null) {
                        int i5 = e.A;
                        int i11 = eVar3.f48588e;
                        DoubleShadowBubbleTextView doubleShadowBubbleTextView = eVar3.f48584a;
                        Handler handler = eVar3.f48591h;
                        GestureDetector.OnDoubleTapListener onDoubleTapListener = eVar3.f48592i;
                        int action2 = motionEvent.getAction();
                        g gVar = eVar3.f48605x;
                        gVar.getClass();
                        if (motionEvent.getActionMasked() == 1) {
                            eVar = eVar3;
                        } else {
                            eVar = eVar3;
                            gVar.a(motionEvent.getX(), motionEvent.getY(), motionEvent.getEventTime());
                        }
                        int i12 = action2 & 255;
                        boolean z13 = i12 == 6;
                        int actionIndex = z13 ? motionEvent.getActionIndex() : -1;
                        int pointerCount = motionEvent.getPointerCount();
                        float x11 = 0.0f;
                        float y11 = 0.0f;
                        for (int i13 = 0; i13 < pointerCount; i13++) {
                            if (actionIndex != i13) {
                                x11 = motionEvent.getX(i13) + x11;
                                y11 = motionEvent.getY(i13) + y11;
                            }
                        }
                        if (z13) {
                            pointerCount--;
                        }
                        float f11 = pointerCount;
                        float f12 = x11 / f11;
                        float f13 = y11 / f11;
                        if (i12 == 0) {
                            eVar2 = eVar;
                            if (onDoubleTapListener == null) {
                                zOnDoubleTap = false;
                                eVar2.f48599r = f12;
                                eVar2.f48600s = f13;
                                motionEvent2 = eVar2.o;
                                if (motionEvent2 != null) {
                                    motionEvent2.recycle();
                                }
                                eVar2.o = MotionEvent.obtain(motionEvent);
                                eVar2.f48596m = true;
                                eVar2.n = true;
                                eVar2.f48593j = true;
                                eVar2.f48595l = false;
                                eVar2.f48594k = false;
                                eVar2.f48601t = true;
                                if (eVar2.f48604w) {
                                    handler.removeMessages(2);
                                    MotionEvent motionEvent4 = eVar2.o;
                                    Intrinsics.d(motionEvent4);
                                    Message messageObtainMessage = handler.obtainMessage(2, motionEvent4);
                                    MotionEvent motionEvent5 = eVar2.o;
                                    Intrinsics.d(motionEvent5);
                                    handler.sendMessageAtTime(messageObtainMessage, motionEvent5.getDownTime() + e.f48583z + e.f48582y);
                                }
                                zP1 = zOnDoubleTap;
                            } else {
                                boolean zHasMessages = handler.hasMessages(3);
                                if (zHasMessages) {
                                    handler.removeMessages(3);
                                }
                                MotionEvent motionEvent6 = eVar2.o;
                                if (motionEvent6 != null && (motionEvent3 = eVar2.f48597p) != null && zHasMessages && eVar2.n) {
                                    long eventTime = motionEvent.getEventTime() - motionEvent3.getEventTime();
                                    if (eventTime >= e.B && eventTime <= i5) {
                                        int x12 = ((int) motionEvent6.getX()) - ((int) motionEvent.getX());
                                        int y12 = ((int) motionEvent6.getY()) - ((int) motionEvent.getY());
                                        if ((y12 * y12) + (x12 * x12) < eVar2.f48587d) {
                                            eVar2.f48598q = true;
                                            MotionEvent motionEvent7 = eVar2.o;
                                            Intrinsics.d(motionEvent7);
                                            zOnDoubleTap = onDoubleTapListener.onDoubleTap(motionEvent7) | onDoubleTapListener.onDoubleTapEvent(motionEvent);
                                            eVar2.f48599r = f12;
                                            eVar2.f48600s = f13;
                                            motionEvent2 = eVar2.o;
                                            if (motionEvent2 != null) {
                                            }
                                            eVar2.o = MotionEvent.obtain(motionEvent);
                                            eVar2.f48596m = true;
                                            eVar2.n = true;
                                            eVar2.f48593j = true;
                                            eVar2.f48595l = false;
                                            eVar2.f48594k = false;
                                            eVar2.f48601t = true;
                                            if (eVar2.f48604w) {
                                            }
                                            zP1 = zOnDoubleTap;
                                        }
                                    }
                                }
                                handler.sendEmptyMessageDelayed(3, i5);
                                zOnDoubleTap = false;
                                eVar2.f48599r = f12;
                                eVar2.f48600s = f13;
                                motionEvent2 = eVar2.o;
                                if (motionEvent2 != null) {
                                }
                                eVar2.o = MotionEvent.obtain(motionEvent);
                                eVar2.f48596m = true;
                                eVar2.n = true;
                                eVar2.f48593j = true;
                                eVar2.f48595l = false;
                                eVar2.f48594k = false;
                                eVar2.f48601t = true;
                                if (eVar2.f48604w) {
                                }
                                zP1 = zOnDoubleTap;
                            }
                        } else if (i12 == 1) {
                            eVar2 = eVar;
                            eVar2.f48593j = false;
                            MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
                            if (eVar2.f48598q) {
                                Intrinsics.d(onDoubleTapListener);
                                zP1 = onDoubleTapListener.onDoubleTapEvent(motionEvent);
                            } else {
                                if (eVar2.f48595l) {
                                    handler.removeMessages(3);
                                    eVar2.f48595l = false;
                                } else if (eVar2.f48596m) {
                                    if (eVar2.f48594k && onDoubleTapListener != null) {
                                        onDoubleTapListener.onSingleTapConfirmed(motionEvent);
                                    }
                                } else if (eVar2.f48601t) {
                                    gVar.c(eVar2.f48589f);
                                    float f14 = gVar.f48613b;
                                    float f15 = gVar.f48612a;
                                    float f16 = i11;
                                    if (Math.abs(f14) > f16 || Math.abs(f15) > f16) {
                                        Intrinsics.d(eVar2.o);
                                        if (doubleShadowBubbleTextView.B) {
                                            Context context2 = doubleShadowBubbleTextView.getContext();
                                            q0 q0Var2 = n1.C0;
                                            ((NovaLauncher) o9.k.Y(context2)).P.f21089x = 0;
                                            k kVar = doubleShadowBubbleTextView.D;
                                            if (kVar != null) {
                                                zP1 = f14 >= 0.0f ? f14 <= 0.0f ? false : ((NovaLauncher) kVar).p1(doubleShadowBubbleTextView, false) : ((NovaLauncher) kVar).p1(doubleShadowBubbleTextView, true);
                                            }
                                        }
                                    }
                                }
                                zP1 = false;
                            }
                            MotionEvent motionEvent8 = eVar2.f48597p;
                            if (motionEvent8 != null) {
                                motionEvent8.recycle();
                            }
                            eVar2.f48597p = motionEventObtain;
                            gVar.b();
                            eVar2.f48598q = false;
                            eVar2.f48594k = false;
                        } else if (i12 != 2) {
                            if (i12 == 3) {
                                eVar2 = eVar;
                                handler.removeMessages(2);
                                handler.removeMessages(3);
                                gVar.b();
                                eVar2.f48598q = false;
                                eVar2.f48593j = false;
                                eVar2.f48596m = false;
                                eVar2.n = false;
                                eVar2.f48594k = false;
                                if (eVar2.f48595l) {
                                    eVar2.f48595l = false;
                                }
                            } else if (i12 == 5) {
                                eVar2 = eVar;
                                eVar2.f48599r = f12;
                                eVar2.f48600s = f13;
                                handler.removeMessages(3);
                                zP1 = false;
                                eVar2.f48598q = false;
                                eVar2.f48596m = false;
                                eVar2.n = false;
                                eVar2.f48594k = false;
                                if (eVar2.f48595l) {
                                    eVar2.f48595l = false;
                                }
                            } else if (i12 != 6) {
                                eVar2 = eVar;
                            } else {
                                eVar2 = eVar;
                                eVar2.f48599r = f12;
                                eVar2.f48600s = f13;
                            }
                            zP1 = false;
                        } else {
                            eVar2 = eVar;
                            if (eVar2.f48595l) {
                                zP1 = false;
                            } else {
                                long eventTime2 = motionEvent.getEventTime() - motionEvent.getDownTime();
                                if (eVar2.f48598q) {
                                    Intrinsics.d(onDoubleTapListener);
                                    zP1 = onDoubleTapListener.onDoubleTapEvent(motionEvent);
                                } else {
                                    if (eVar2.f48596m) {
                                        float f17 = f12 - eVar2.f48599r;
                                        float f18 = f13 - eVar2.f48600s;
                                        int iSqrt = (int) Math.sqrt((f18 * f18) + (f17 * f17));
                                        if (iSqrt > eVar2.f48585b) {
                                            z12 = false;
                                            eVar2.f48596m = false;
                                            handler.removeMessages(3);
                                            handler.removeMessages(2);
                                        } else {
                                            z12 = false;
                                        }
                                        if (iSqrt > eVar2.f48586c) {
                                            eVar2.n = z12;
                                        }
                                    } else if (eVar2.f48601t) {
                                        MotionEvent motionEvent9 = eVar2.o;
                                        Intrinsics.d(motionEvent9);
                                        float x13 = f12 - motionEvent9.getX();
                                        MotionEvent motionEvent10 = eVar2.o;
                                        Intrinsics.d(motionEvent10);
                                        float y13 = f13 - motionEvent10.getY();
                                        if (((int) Math.sqrt((y13 * y13) + (x13 * x13))) > eVar2.f48590g || eventTime2 > 200) {
                                            eVar2.a();
                                        } else if (!eVar2.f48603v && y13 > 0.0f) {
                                            eVar2.a();
                                        } else if (!eVar2.f48602u && y13 < 0.0f) {
                                            eVar2.a();
                                        }
                                    }
                                    zP1 = false;
                                }
                            }
                        }
                        if (action == 0) {
                            NamedIntent namedIntent = fVar.f57308v;
                            boolean z14 = namedIntent != null;
                            NamedIntent namedIntent2 = fVar.f57309w;
                            boolean z15 = namedIntent2 != null;
                            eVar2.f48602u = z14;
                            eVar2.f48603v = z15;
                            dragLayer.f98445l = (namedIntent != null ? 1 : 0) | (namedIntent2 == null ? 0 : 2);
                        }
                        if (eVar2.f48601t) {
                            boolean z16 = eVar2.f48602u;
                            int i14 = z16;
                            if (eVar2.f48603v) {
                                i14 = (z16 ? 1 : 0) | 2;
                            }
                            dragLayer.f21089x = i14;
                            z11 = false;
                        } else {
                            z11 = false;
                            dragLayer.f21089x = 0;
                        }
                        if (zP1) {
                            return z11;
                        }
                    }
                }
                return super.onTouchEvent(motionEvent);
            }
        }
        return false;
    }

    @Override // com.android.launcher3.BubbleTextView
    public final void r(mx.f fVar) {
        int i5 = fVar.f77071d;
        j jVar = fVar.f77069b;
        this.f20875l = i5;
        aa.n nVar = this.f20869f;
        if (nVar != null) {
            t(nVar);
        }
        setCompoundDrawablePadding(this.f20873j ? fVar.f77076i : fVar.f77075h);
        setTextColor(fVar.f77077j);
        P(jVar.f77124b ? 1.0f : 0.0f);
        int i11 = fVar.f77076i;
        this.f20870g = i11 == 0 || fVar.f77070c;
        setTextSize(0, i11);
        boolean z11 = Color.luminance(fVar.f77077j) > 0.8f ? jVar.f77127e : false;
        this.F = z11;
        n nVar2 = this.E;
        if (nVar2 != null) {
            if (z11) {
                setShadowLayer(nVar2.f98463a, 0.0f, 0.0f, nVar2.f98464b);
            } else {
                getPaint().clearShadowLayer();
            }
            invalidate();
        }
        setTypeface(x7.f.u(getContext(), jVar.f77128f));
        if (jVar.f77129g) {
            if (getMaxLines() != 1) {
                setSingleLine(true);
                setLines(1);
                setMaxLines(1);
                return;
            }
            return;
        }
        if (getMaxLines() != 2) {
            setSingleLine(false);
            setLines(2);
            setMaxLines(2);
        }
    }

    @Override // android.view.View
    public final String toString() {
        Object tag = getTag();
        if (getTag() == null) {
            return super.toString();
        }
        return "BubbleTV(" + tag + ")";
    }
}
