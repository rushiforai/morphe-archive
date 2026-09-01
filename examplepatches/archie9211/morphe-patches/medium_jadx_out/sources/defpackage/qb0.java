package defpackage;

import com.medium.android.donkey.audio.AudioService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qb0 extends p92 {
    public ytd b;
    public mb0 c;
    public /* synthetic */ Object d;
    public final /* synthetic */ AudioService e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qb0(AudioService audioService, n92 n92Var) {
        super(n92Var);
        this.e = audioService;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        int i = AudioService.j;
        return this.e.e(null, this);
    }
}
