package ge;

import android.os.Looper;
import android.os.SystemClock;
import android.util.SparseArray;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.PlaybackException;
import com.google.android.exoplayer2.metadata.Metadata;
import f10.o;
import fe.a0;
import fe.b2;
import fe.g1;
import fe.h1;
import fe.i1;
import fe.j1;
import fe.k1;
import fe.l1;
import fe.u;
import fe.u0;
import fe.w0;
import fe.x1;
import fe.y1;
import fe.z1;
import gf.b0;
import gf.r;
import gf.w;
import java.io.IOException;
import java.util.List;
import wf.q;
import wf.s;
import wf.v;
import xf.p;
import xk.l0;
import xk.r2;
import xk.v0;
import xk.w2;

/* loaded from: classes3.dex */
public final class f implements j1, b0, je.b {

    /* renamed from: a, reason: collision with root package name */
    public final q f57393a;

    /* renamed from: b, reason: collision with root package name */
    public final x1 f57394b;

    /* renamed from: c, reason: collision with root package name */
    public final y1 f57395c;

    /* renamed from: d, reason: collision with root package name */
    public final bn.i f57396d;

    /* renamed from: e, reason: collision with root package name */
    public final SparseArray f57397e;

    /* renamed from: f, reason: collision with root package name */
    public wf.h f57398f;

    /* renamed from: g, reason: collision with root package name */
    public l1 f57399g;

    /* renamed from: h, reason: collision with root package name */
    public s f57400h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f57401i;

    public f(q qVar) {
        qVar.getClass();
        this.f57393a = qVar;
        int i5 = v.f94376a;
        Looper looperMyLooper = Looper.myLooper();
        this.f57398f = new wf.h(looperMyLooper == null ? Looper.getMainLooper() : looperMyLooper, qVar, new c(6));
        x1 x1Var = new x1();
        this.f57394b = x1Var;
        this.f57395c = new y1();
        bn.i iVar = new bn.i();
        iVar.f18209a = x1Var;
        l0 l0Var = v0.f96030b;
        iVar.f18210b = r2.f96007e;
        iVar.f18211c = w2.f96042g;
        this.f57396d = iVar;
        this.f57397e = new SparseArray();
    }

    @Override // gf.b0
    public final void J(int i5, w wVar, gf.m mVar, r rVar) {
        g(d(i5, wVar), 1000, new c(25));
    }

    public final a a() {
        return c((w) this.f57396d.f18212d);
    }

    public final a b(z1 z1Var, int i5, w wVar) {
        w wVar2 = z1Var.p() ? null : wVar;
        this.f57393a.getClass();
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        boolean z11 = z1Var.equals(((a0) this.f57399g).O()) && i5 == ((a0) this.f57399g).L();
        long jF = 0;
        if (wVar2 == null || !wVar2.a()) {
            if (z11) {
                jF = ((a0) this.f57399g).I();
            } else if (!z1Var.p()) {
                jF = v.F(z1Var.m(i5, this.f57395c, 0L).f55109l);
            }
        } else if (z11 && ((a0) this.f57399g).J() == wVar2.f57641b && ((a0) this.f57399g).K() == wVar2.f57642c) {
            jF = ((a0) this.f57399g).M();
        }
        w wVar3 = (w) this.f57396d.f18212d;
        z1 z1VarO = ((a0) this.f57399g).O();
        int iL = ((a0) this.f57399g).L();
        long jM = ((a0) this.f57399g).M();
        a0 a0Var = (a0) this.f57399g;
        a0Var.s0();
        return new a(jElapsedRealtime, z1Var, i5, wVar2, jF, z1VarO, iL, wVar3, jM, v.F(a0Var.f54691j0.f54778q));
    }

    public final a c(w wVar) {
        this.f57399g.getClass();
        z1 z1Var = wVar == null ? null : (z1) ((w2) this.f57396d.f18211c).get(wVar);
        if (wVar != null && z1Var != null) {
            return b(z1Var, z1Var.g(wVar.f57640a, this.f57394b).f55077c, wVar);
        }
        int iL = ((a0) this.f57399g).L();
        z1 z1VarO = ((a0) this.f57399g).O();
        if (iL >= z1VarO.o()) {
            z1VarO = z1.f55127a;
        }
        return b(z1VarO, iL, null);
    }

    public final a d(int i5, w wVar) {
        this.f57399g.getClass();
        z1 z1Var = z1.f55127a;
        if (wVar != null) {
            return ((z1) ((w2) this.f57396d.f18211c).get(wVar)) != null ? c(wVar) : b(z1Var, i5, wVar);
        }
        z1 z1VarO = ((a0) this.f57399g).O();
        if (i5 < z1VarO.o()) {
            z1Var = z1VarO;
        }
        return b(z1Var, i5, null);
    }

    @Override // gf.b0
    public final void e(int i5, w wVar, gf.m mVar, r rVar) {
        g(d(i5, wVar), 1001, new c(29));
    }

    public final a f() {
        return c((w) this.f57396d.f18214f);
    }

    public final void g(a aVar, int i5, wf.e eVar) {
        this.f57397e.put(i5, aVar);
        this.f57398f.d(i5, eVar);
    }

    @Override // gf.b0
    public final void h(int i5, w wVar, gf.m mVar, r rVar) {
        g(d(i5, wVar), 1002, new c(26));
    }

    @Override // gf.b0
    public final void i(int i5, w wVar, r rVar) {
        a aVarD = d(i5, wVar);
        g(aVarD, 1004, new ae.h(14, aVarD, rVar));
    }

    public final void j(a0 a0Var, Looper looper) {
        wf.a.i(this.f57399g == null || ((v0) this.f57396d.f18210b).isEmpty());
        a0Var.getClass();
        this.f57399g = a0Var;
        this.f57400h = this.f57393a.a(looper, null);
        wf.h hVar = this.f57398f;
        this.f57398f = new wf.h(hVar.f94330d, looper, hVar.f94327a, new ae.h(13, this, a0Var));
    }

    @Override // fe.j1
    public final void onAvailableCommandsChanged(h1 h1Var) {
        g(a(), 13, new c(1));
    }

    @Override // fe.j1
    public final void onCues(List list) {
        a aVarA = a();
        g(aVarA, 27, new u(aVarA, list));
    }

    @Override // fe.j1
    public final void onDeviceInfoChanged(fe.j jVar) {
        g(a(), 29, new c(21));
    }

    @Override // fe.j1
    public final void onDeviceVolumeChanged(int i5, boolean z11) {
        g(a(), 30, new c(22));
    }

    @Override // fe.j1
    public final void onEvents(l1 l1Var, i1 i1Var) {
    }

    @Override // fe.j1
    public final void onIsLoadingChanged(boolean z11) {
        g(a(), 3, new c(19));
    }

    @Override // fe.j1
    public final void onIsPlayingChanged(boolean z11) {
        g(a(), 7, new c(28));
    }

    @Override // fe.j1
    public final void onLoadingChanged(boolean z11) {
    }

    @Override // fe.j1
    public final void onMediaItemTransition(u0 u0Var, int i5) {
        g(a(), 1, new ep.c(28));
    }

    @Override // fe.j1
    public final void onMediaMetadataChanged(w0 w0Var) {
        g(a(), 14, new d(7));
    }

    @Override // fe.j1
    public final void onMetadata(Metadata metadata) {
        g(a(), 28, new c(23));
    }

    @Override // fe.j1
    public final void onPlayWhenReadyChanged(boolean z11, int i5) {
        g(a(), 5, new c(0));
    }

    @Override // fe.j1
    public final void onPlaybackParametersChanged(g1 g1Var) {
        g(a(), 12, new ep.c(23));
    }

    @Override // fe.j1
    public final void onPlaybackStateChanged(int i5) {
        g(a(), 4, new c(4));
    }

    @Override // fe.j1
    public final void onPlaybackSuppressionReasonChanged(int i5) {
        g(a(), 6, new c(14));
    }

    @Override // fe.j1
    public final void onPlayerError(PlaybackException playbackException) {
        gf.u uVar;
        a aVarA = (!(playbackException instanceof ExoPlaybackException) || (uVar = ((ExoPlaybackException) playbackException).f31439h) == null) ? a() : c(new w(uVar));
        g(aVarA, 10, new o(aVarA, (Object) playbackException, 12));
    }

    @Override // fe.j1
    public final void onPlayerErrorChanged(PlaybackException playbackException) {
        gf.u uVar;
        g((!(playbackException instanceof ExoPlaybackException) || (uVar = ((ExoPlaybackException) playbackException).f31439h) == null) ? a() : c(new w(uVar)), 10, new c(13));
    }

    @Override // fe.j1
    public final void onPlayerStateChanged(boolean z11, int i5) {
        g(a(), -1, new ep.c(24));
    }

    @Override // fe.j1
    public final void onPositionDiscontinuity(int i5) {
    }

    @Override // fe.j1
    public final void onRenderedFirstFrame() {
    }

    @Override // fe.j1
    public final void onRepeatModeChanged(int i5) {
        g(a(), 8, new c(9));
    }

    @Override // fe.j1
    public final void onSeekProcessed() {
        g(a(), -1, new ep.c(26));
    }

    @Override // fe.j1
    public final void onShuffleModeEnabledChanged(boolean z11) {
        g(a(), 9, new d(5));
    }

    @Override // fe.j1
    public final void onSkipSilenceEnabledChanged(boolean z11) {
        g(f(), 23, new d(2));
    }

    @Override // fe.j1
    public final void onSurfaceSizeChanged(int i5, int i11) {
        g(f(), 24, new ep.c(27));
    }

    @Override // fe.j1
    public final void onTimelineChanged(z1 z1Var, int i5) {
        l1 l1Var = this.f57399g;
        l1Var.getClass();
        bn.i iVar = this.f57396d;
        iVar.f18212d = bn.i.p(l1Var, (v0) iVar.f18210b, (w) iVar.f18213e, (x1) iVar.f18209a);
        iVar.E(((a0) l1Var).O());
        g(a(), 0, new c(18));
    }

    @Override // fe.j1
    public final void onTrackSelectionParametersChanged(tf.u uVar) {
        g(a(), 19, new d(1));
    }

    @Override // fe.j1
    public final void onTracksChanged(b2 b2Var) {
        g(a(), 2, new c(11));
    }

    @Override // fe.j1
    public final void onVideoSizeChanged(p pVar) {
        a aVarF = f();
        g(aVarF, 25, new fe.w(aVarF, pVar));
    }

    @Override // fe.j1
    public final void onVolumeChanged(float f11) {
        g(f(), 22, new c(20));
    }

    @Override // gf.b0
    public final void s(int i5, w wVar, gf.m mVar, r rVar, IOException iOException, boolean z11) {
        a aVarD = d(i5, wVar);
        g(aVarD, BackupConstant.SCENE_CLOSED_WITHOUT_SHOW, new o(aVarD, mVar, rVar, iOException, z11));
    }

    @Override // fe.j1
    public final void onPositionDiscontinuity(k1 k1Var, k1 k1Var2, int i5) {
        if (i5 == 1) {
            this.f57401i = false;
        }
        l1 l1Var = this.f57399g;
        l1Var.getClass();
        bn.i iVar = this.f57396d;
        iVar.f18212d = bn.i.p(l1Var, (v0) iVar.f18210b, (w) iVar.f18213e, (x1) iVar.f18209a);
        a aVarA = a();
        g(aVarA, 11, new e30.c(aVarA, i5, k1Var, k1Var2));
    }

    @Override // fe.j1
    public final void onCues(jf.c cVar) {
        g(a(), 27, new ep.c(29));
    }
}
