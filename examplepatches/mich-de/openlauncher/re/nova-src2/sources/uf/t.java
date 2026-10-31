package uf;

import android.view.TextureView;
import android.view.View;
import android.widget.TextView;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.ui.SubtitleView;
import fe.a0;
import fe.b2;
import fe.f1;
import fe.j1;
import fe.k1;
import fe.l1;
import fe.x1;
import fe.z1;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class t implements j1, View.OnLayoutChangeListener, View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final x1 f91220a = new x1();

    /* renamed from: b, reason: collision with root package name */
    public Object f91221b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ u f91222c;

    public t(u uVar) {
        this.f91222c = uVar;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        this.f91222c.e();
    }

    @Override // fe.j1
    public final void onCues(jf.c cVar) {
        SubtitleView subtitleView = this.f91222c.f91229g;
        if (subtitleView != null) {
            List list = cVar.f69522a;
            if (list == null) {
                list = Collections.EMPTY_LIST;
            }
            subtitleView.f31582a = list;
            subtitleView.a();
        }
    }

    @Override // android.view.View.OnLayoutChangeListener
    public final void onLayoutChange(View view, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
        u.a((TextureView) view, this.f91222c.f91239s);
    }

    @Override // fe.j1
    public final void onPlayWhenReadyChanged(boolean z11, int i5) {
        u uVar = this.f91222c;
        uVar.g();
        if (!uVar.b() || !uVar.f91237q) {
            uVar.c(false);
            return;
        }
        m mVar = uVar.f91232j;
        if (mVar != null) {
            mVar.d();
        }
    }

    @Override // fe.j1
    public final void onPlaybackStateChanged(int i5) {
        u uVar = this.f91222c;
        uVar.g();
        TextView textView = uVar.f91231i;
        if (textView != null) {
            l1 l1Var = uVar.f91233k;
            if (l1Var != null) {
                a0 a0Var = (a0) l1Var;
                a0Var.s0();
                ExoPlaybackException exoPlaybackException = a0Var.f54691j0.f54769f;
            }
            textView.setVisibility(8);
        }
        if (!uVar.b() || !uVar.f91237q) {
            uVar.c(false);
            return;
        }
        m mVar = uVar.f91232j;
        if (mVar != null) {
            mVar.d();
        }
    }

    @Override // fe.j1
    public final void onPositionDiscontinuity(k1 k1Var, k1 k1Var2, int i5) {
        m mVar;
        u uVar = this.f91222c;
        if (uVar.b() && uVar.f91237q && (mVar = uVar.f91232j) != null) {
            mVar.d();
        }
    }

    @Override // fe.j1
    public final void onRenderedFirstFrame() {
        View view = this.f91222c.f91225c;
        if (view != null) {
            view.setVisibility(4);
        }
    }

    @Override // fe.j1
    public final void onTracksChanged(b2 b2Var) {
        int iB;
        u uVar = this.f91222c;
        l1 l1Var = uVar.f91233k;
        l1Var.getClass();
        a0 a0Var = (a0) l1Var;
        z1 z1VarO = a0Var.O();
        if (z1VarO.p()) {
            this.f91221b = null;
        } else {
            boolean zIsEmpty = a0Var.P().f54719a.isEmpty();
            x1 x1Var = this.f91220a;
            if (zIsEmpty) {
                Object obj = this.f91221b;
                if (obj != null) {
                    int iB2 = z1VarO.b(obj);
                    if (iB2 != -1) {
                        if (a0Var.L() == z1VarO.f(iB2, x1Var, false).f55077c) {
                            return;
                        }
                    }
                    this.f91221b = null;
                }
            } else {
                a0Var.s0();
                if (a0Var.f54691j0.f54764a.p()) {
                    iB = 0;
                } else {
                    f1 f1Var = a0Var.f54691j0;
                    iB = f1Var.f54764a.b(f1Var.f54765b.f57640a);
                }
                this.f91221b = z1VarO.f(iB, x1Var, true).f55076b;
            }
        }
        uVar.i(false);
    }

    @Override // fe.j1
    public final void onVideoSizeChanged(xf.p pVar) {
        this.f91222c.f();
    }
}
