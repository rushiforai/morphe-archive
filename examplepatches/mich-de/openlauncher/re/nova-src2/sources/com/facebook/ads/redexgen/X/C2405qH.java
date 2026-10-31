package com.facebook.ads.redexgen.X;

import java.util.Deque;
import java.util.LinkedList;

/* renamed from: com.facebook.ads.redexgen.X.qH, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2405qH {
    public static String[] A05 = {"YlFlQWjICGV8ywqag1b6Ay", "5zJBssfwfWeqrXRnFZsUzQPBIx8wM7U1", "dym1tHqC1dmHFSZgnmQvvBCyptXRCFyE", "ReBl50wuVZKzAeHcErw", "r5gi9DkEhDoZU86", "diW2RgJl9ou5SRwuprc", "1r89rpPGUWvit", "BXJhCJIGpStJQsMIN6w6cfyx8EdHGsbw"};
    public final int A01;
    public final int A02;
    public final Deque<String> A04 = new LinkedList();
    public final Deque<String> A03 = new LinkedList();
    public String A00 = null;

    public C2405qH(int i5, int i11) {
        this.A02 = i5;
        this.A01 = i11;
    }

    public final Iterable<String> A00() {
        return this.A03;
    }

    public final Iterable<String> A01() {
        return this.A04;
    }

    public final String A02() {
        return this.A00;
    }

    public final void A03() {
        if (this.A00 != null) {
            this.A04.addLast(this.A00);
            if (this.A04.size() > this.A02) {
                this.A04.removeFirst();
            }
        }
        if (this.A03.size() > 0) {
            this.A00 = this.A03.removeFirst();
        } else {
            if (A05[4].length() == 3) {
                throw new RuntimeException();
            }
            String[] strArr = A05;
            strArr[5] = "rBMTTnNnBAlsPJgH9pl";
            strArr[3] = "RhxgQAx1k3YbBH8x5Ji";
            this.A00 = null;
        }
    }

    public final void A04(String str) {
        this.A03.addLast(str);
        if (this.A03.size() <= this.A01) {
            return;
        }
        if (this.A00 != null) {
            this.A04.addLast(this.A00);
        }
        this.A00 = this.A03.removeFirst();
        if (this.A04.size() > this.A02) {
            this.A04.removeFirst();
        }
    }
}
