package com.facebook.ads.redexgen.X;

import android.os.Handler;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.IOException;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* renamed from: com.facebook.ads.redexgen.X.Uu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1287Uu {
    public static String[] A04 = {"0vX", "6NY9hrINV0Z5FlYuF4FI3UvdvbDoQp5r", "EDbrjiPnPeOJCpHUSCdz4kDKdyaM7EAX", "SRvChzoAelcCw1", "1EOpazjw38zi", "4Y8ngmqa57FSPe", "1cMpp1AjuI7QRMLTBGOGdi01Kt1oNo6X", "RzlHtD1JWpQymBpZHQSfPfdlRM"};
    public final int A00;
    public final C1202Rk A01;
    public final long A02;
    public final CopyOnWriteArrayList<C1286Ut> A03;

    public C1287Uu() {
        this(new CopyOnWriteArrayList(), 0, null, 0L);
    }

    public C1287Uu(CopyOnWriteArrayList<C1286Ut> copyOnWriteArrayList, int i5, C1202Rk c1202Rk, long j11) {
        this.A03 = copyOnWriteArrayList;
        this.A00 = i5;
        this.A01 = c1202Rk;
        this.A02 = j11;
    }

    private long A00(long j11) {
        long jA0P = N1.A0P(j11);
        if (jA0P == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        long mediaTimeMs = this.A02;
        return mediaTimeMs + jA0P;
    }

    @MetaExoPlayerCustomization
    private final void A01(final Uc uc2, final C1271Ue c1271Ue, final int i5) {
        Iterator<C1286Ut> it = this.A03.iterator();
        while (it.hasNext()) {
            C1286Ut next = it.next();
            final InterfaceC1288Uv interfaceC1288Uv = next.A01;
            N1.A1B(next.A00, new Runnable() { // from class: com.facebook.ads.redexgen.X.Uq
                @Override // java.lang.Runnable
                public final void run() {
                }
            });
        }
    }

    public final C1287Uu A02(int i5, C1202Rk c1202Rk, long j11) {
        return new C1287Uu(this.A03, i5, c1202Rk, j11);
    }

    public final void A03(int i5, VC vc, int i11, Object obj, long j11) {
        A0C(new C1271Ue(1, i5, vc, i11, obj, A00(j11), -9223372036854775807L));
    }

    public final void A04(Handler handler, InterfaceC1288Uv interfaceC1288Uv) {
        AbstractC1062Ln.A01(handler);
        AbstractC1062Ln.A01(interfaceC1288Uv);
        this.A03.add(new C1286Ut(handler, interfaceC1288Uv));
    }

    public final void A05(Uc uc2, int i5, int i11, VC vc, int i12, Object obj, long j11, long j12) {
        A09(uc2, new C1271Ue(i5, i11, vc, i12, obj, A00(j11), A00(j12)));
    }

    @MetaExoPlayerCustomization
    public final void A06(Uc uc2, int i5, int i11, VC vc, int i12, Object obj, long j11, long j12, int i13) {
        A01(uc2, new C1271Ue(i5, i11, vc, i12, obj, A00(j11), A00(j12)), i13);
    }

    public final void A07(Uc uc2, int i5, int i11, VC vc, int i12, Object obj, long j11, long j12, IOException iOException, boolean z11) {
        A0A(uc2, new C1271Ue(i5, i11, vc, i12, obj, A00(j11), A00(j12)), iOException, z11);
    }

    public final void A08(@MetaExoPlayerCustomization Uc uc2, @MetaExoPlayerCustomization int i5, int i11, VC vc, int i12, Object obj, long j11, long j12, Object obj2, Object obj3) {
        A0B(uc2, new C1271Ue(i5, i11, vc, i12, obj, A00(j11), A00(j12)), obj2, obj3);
    }

    public final void A09(final Uc uc2, final C1271Ue c1271Ue) {
        Iterator<C1286Ut> it = this.A03.iterator();
        while (it.hasNext()) {
            C1286Ut next = it.next();
            final InterfaceC1288Uv listener = next.A01;
            N1.A1B(next.A00, new Runnable() { // from class: com.facebook.ads.redexgen.X.Ur
                @Override // java.lang.Runnable
                public final void run() {
                    this.A02.A0E(listener, uc2, c1271Ue);
                }
            });
        }
    }

    public final void A0A(final Uc uc2, final C1271Ue c1271Ue, final IOException iOException, final boolean z11) {
        Iterator<C1286Ut> it = this.A03.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            if (A04[7].length() == 31) {
                throw new RuntimeException();
            }
            A04[2] = "oz6jN72mrVEJ84jwVsa80JdmUq2TtNhX";
            if (zHasNext) {
                C1286Ut next = it.next();
                final InterfaceC1288Uv interfaceC1288Uv = next.A01;
                N1.A1B(next.A00, new Runnable() { // from class: com.facebook.ads.redexgen.X.Um
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.A02.A0F(interfaceC1288Uv, uc2, c1271Ue, iOException, z11);
                    }
                });
            } else {
                return;
            }
        }
    }

    public final void A0B(@MetaExoPlayerCustomization final Uc uc2, @MetaExoPlayerCustomization final C1271Ue c1271Ue, final Object obj, final Object obj2) {
        Iterator<C1286Ut> it = this.A03.iterator();
        while (it.hasNext()) {
            C1286Ut next = it.next();
            final InterfaceC1288Uv interfaceC1288Uv = next.A01;
            N1.A1B(next.A00, new Runnable() { // from class: com.facebook.ads.redexgen.X.Un
                @Override // java.lang.Runnable
                public final void run() {
                    this.A02.A0G(interfaceC1288Uv, uc2, c1271Ue, obj, obj2);
                }
            });
        }
    }

    public final void A0C(final C1271Ue c1271Ue) {
        Iterator<C1286Ut> it = this.A03.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            if (A04[4].length() == 10) {
                throw new RuntimeException();
            }
            String[] strArr = A04;
            strArr[5] = "BPCliZ27Ak36vG";
            strArr[3] = "8XLyG4rB5BmC3z";
            if (zHasNext) {
                C1286Ut next = it.next();
                final InterfaceC1288Uv listener = next.A01;
                N1.A1B(next.A00, new Runnable() { // from class: com.facebook.ads.redexgen.X.Uo
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.A01.A0H(listener, c1271Ue);
                    }
                });
            } else {
                return;
            }
        }
    }

    public final void A0D(InterfaceC1288Uv interfaceC1288Uv) {
        Iterator<C1286Ut> it = this.A03.iterator();
        while (it.hasNext()) {
            C1286Ut listenerAndHandler = it.next();
            if (listenerAndHandler.A01 == interfaceC1288Uv) {
                this.A03.remove(listenerAndHandler);
            }
        }
    }

    public final /* synthetic */ void A0E(InterfaceC1288Uv interfaceC1288Uv, Uc uc2, C1271Ue c1271Ue) {
        interfaceC1288Uv.AFe(this.A00, this.A01, uc2, c1271Ue);
    }

    public final /* synthetic */ void A0F(InterfaceC1288Uv interfaceC1288Uv, Uc uc2, C1271Ue c1271Ue, IOException iOException, boolean z11) {
        interfaceC1288Uv.AFj(this.A00, this.A01, uc2, c1271Ue, iOException, z11);
    }

    public final /* synthetic */ void A0G(InterfaceC1288Uv interfaceC1288Uv, Uc uc2, C1271Ue c1271Ue, Object obj, Object obj2) {
        interfaceC1288Uv.AFg(this.A00, this.A01, uc2, c1271Ue, obj, obj2);
    }

    public final /* synthetic */ void A0H(InterfaceC1288Uv interfaceC1288Uv, C1271Ue c1271Ue) {
        interfaceC1288Uv.AEm(this.A00, this.A01, c1271Ue);
    }
}
