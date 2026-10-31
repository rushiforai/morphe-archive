package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;

/* loaded from: assets/audience_network/classes.dex */
public final class MS<T> {
    public static byte[] A09;
    public boolean A00;
    public boolean A01;
    public final InterfaceC1069Lu A02;
    public final MM A03;
    public final MQ<T> A04;
    public final Object A05;
    public final ArrayDeque<Runnable> A06;
    public final ArrayDeque<Runnable> A07;
    public final CopyOnWriteArraySet<MR<T>> A08;

    static {
        A03();
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public MS(CopyOnWriteArraySet<MR<T>> copyOnWriteArraySet, Looper looper, InterfaceC1069Lu interfaceC1069Lu, MQ<T> mq2) {
        this.A02 = interfaceC1069Lu;
        this.A08 = copyOnWriteArraySet;
        this.A04 = mq2;
        this.A05 = new Object();
        this.A06 = new ArrayDeque<>();
        this.A07 = new ArrayDeque<>();
        this.A03 = interfaceC1069Lu.A5y(looper, new Handler.Callback() { // from class: com.facebook.ads.redexgen.X.MO
            @Override // android.os.Handler.Callback
            public final boolean handleMessage(Message message) {
                return this.A00.A05(message);
            }
        });
        this.A01 = true;
        this.A00 = XL.A03(XQ.A0E);
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 52);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A09 = new byte[]{-91, -86, -78, -85, -89, -95, 2, 13, -2, 11, -6, 13, 2, 8, 7, -33, 2, 7, 2, 12, 1, -2, -3};
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MQ != com.facebook.ads.androidx.media3.common.util.ListenerSet$IterationFinishedEvent<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MS != com.facebook.ads.androidx.media3.common.util.ListenerSet<T> */
    public MS(Looper looper, InterfaceC1069Lu interfaceC1069Lu, MQ<T> mq2) {
        this(new CopyOnWriteArraySet(), looper, interfaceC1069Lu, mq2);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MQ != com.facebook.ads.androidx.media3.common.util.ListenerSet$IterationFinishedEvent<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MS != com.facebook.ads.androidx.media3.common.util.ListenerSet<T> */
    private final MS<T> A00(Looper looper, InterfaceC1069Lu interfaceC1069Lu, MQ<T> mq2) {
        return new MS<>(this.A08, looper, interfaceC1069Lu, mq2);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MS != com.facebook.ads.androidx.media3.common.util.ListenerSet<T> */
    private void A02() {
        if (!this.A01) {
            return;
        }
        AbstractC1062Ln.A08(Thread.currentThread() == this.A03.A93().getThread());
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MR != com.facebook.ads.androidx.media3.common.util.ListenerSet$ListenerHolder<T> */
    public static /* synthetic */ void A04(CopyOnWriteArraySet copyOnWriteArraySet, int i5, MP mp2) {
        Iterator it = copyOnWriteArraySet.iterator();
        if (it.hasNext()) {
            it.next();
            throw new NullPointerException(A01(0, 6, 8));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MR != com.facebook.ads.androidx.media3.common.util.ListenerSet$ListenerHolder<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MS != com.facebook.ads.androidx.media3.common.util.ListenerSet<T> */
    public boolean A05(Message message) {
        Iterator<MR<T>> it = this.A08.iterator();
        if (it.hasNext()) {
            it.next();
            throw new NullPointerException(A01(6, 17, 101));
        }
        return true;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MQ != com.facebook.ads.androidx.media3.common.util.ListenerSet$IterationFinishedEvent<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MS != com.facebook.ads.androidx.media3.common.util.ListenerSet<T> */
    public final MS<T> A07(Looper looper, MQ<T> mq2) {
        return A00(looper, this.A02, mq2);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MS != com.facebook.ads.androidx.media3.common.util.ListenerSet<T> */
    /* JADX WARN: Incorrect condition in loop: B:12:0x003d */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A08() {
        A02();
        if (this.A07.isEmpty()) {
            return;
        }
        if (!this.A03.AAR(0)) {
            this.A03.AKV(this.A03.ADX(0));
        }
        boolean z11 = !this.A06.isEmpty();
        this.A06.addAll(this.A07);
        this.A07.clear();
        if (z11) {
            return;
        }
        while (!recursiveFlushInProgress) {
            this.A06.peekFirst().run();
            this.A06.removeFirst();
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MP != com.facebook.ads.androidx.media3.common.util.ListenerSet$Event<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MR != com.facebook.ads.androidx.media3.common.util.ListenerSet$ListenerHolder<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MS != com.facebook.ads.androidx.media3.common.util.ListenerSet<T> */
    public final void A09(final int i5, final MP<T> mp2) {
        A02();
        final CopyOnWriteArraySet copyOnWriteArraySet = new CopyOnWriteArraySet(this.A08);
        if (this.A00) {
            Iterator it = copyOnWriteArraySet.iterator();
            if (it.hasNext()) {
                it.next();
                throw new NullPointerException(A01(0, 6, 8));
            }
            return;
        }
        this.A07.add(new Runnable() { // from class: com.facebook.ads.redexgen.X.MN
            @Override // java.lang.Runnable
            public final void run() {
                MS.A04(copyOnWriteArraySet, i5, mp2);
            }
        });
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MP != com.facebook.ads.androidx.media3.common.util.ListenerSet$Event<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.MS != com.facebook.ads.androidx.media3.common.util.ListenerSet<T> */
    public final void A0A(int i5, MP<T> mp2) {
        A09(i5, mp2);
        A08();
    }
}
