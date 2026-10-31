package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.MulticastSocket;
import java.net.SocketTimeoutException;

/* renamed from: com.facebook.ads.redexgen.X.4I, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C4I extends C9J {
    public static String[] A09 = {"CN17V", "lvI4HNIzNw9ZxUQ", "KgrsSfXXcMTStuPh5XP5197CdqVIF7JF", "SoW2AbKUcZgIY5NQfheNhM7hbEILNMeg", "PQqz", "7uExNrAG6O8snQ5", "6WrnadJ7cgwT8WKJRtugctbFj35atbfV", "JjtLt7ec"};
    public int A00;
    public Uri A01;
    public DatagramSocket A02;
    public InetAddress A03;
    public MulticastSocket A04;
    public boolean A05;
    public final int A06;
    public final DatagramPacket A07;
    public final byte[] A08;

    public C4I() {
        this(2000);
    }

    public C4I(int i5) {
        this(i5, 8000);
    }

    public C4I(int i5, int i11) {
        super(true);
        this.A06 = i11;
        this.A08 = new byte[i5];
        this.A07 = new DatagramPacket(this.A08, 0, i5);
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final Uri AA2() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final long AHv(NX nx2) throws IOException {
        this.A01 = nx2.A06;
        String str = (String) AbstractC1062Ln.A01(this.A01.getHost());
        int port = this.A01.getPort();
        A0G(nx2);
        try {
            this.A03 = InetAddress.getByName(str);
            InetSocketAddress inetSocketAddress = new InetSocketAddress(this.A03, port);
            if (this.A03.isMulticastAddress()) {
                this.A04 = new MulticastSocket(inetSocketAddress);
                this.A04.joinGroup(this.A03);
                this.A02 = this.A04;
            } else {
                this.A02 = new DatagramSocket(inetSocketAddress);
            }
            this.A02.setSoTimeout(this.A06);
            this.A05 = true;
            A0H(nx2);
            return -1L;
        } catch (IOException e3) {
            throw new T3(e3, 2001);
        } catch (SecurityException e11) {
            throw new T3(e11, 2006);
        }
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final void close() throws IOException {
        this.A01 = null;
        if (this.A04 != null) {
            try {
                this.A04.leaveGroup((InetAddress) AbstractC1062Ln.A01(this.A03));
            } catch (IOException unused) {
            }
            this.A04 = null;
        }
        if (this.A02 != null) {
            this.A02.close();
            this.A02 = null;
        }
        this.A03 = null;
        this.A00 = 0;
        if (this.A05) {
            this.A05 = false;
            if (A09[0].length() == 12) {
                throw new RuntimeException();
            }
            String[] strArr = A09;
            strArr[3] = "7OW2UHI4X8QIyIdt0fQTr7Zr625oc0Pz";
            strArr[6] = "F9DjBJwjomQHAZVqi4v49t3ICFKVnxcZ";
            A0E();
        }
    }

    @Override // com.facebook.ads.redexgen.X.KR
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        if (this.A00 == 0) {
            try {
                ((DatagramSocket) AbstractC1062Ln.A01(this.A02)).receive(this.A07);
                this.A00 = this.A07.getLength();
                A0F(this.A00);
            } catch (SocketTimeoutException e3) {
                throw new T3(e3, 2002);
            } catch (IOException e11) {
                throw new T3(e11, 2001);
            }
        }
        int length = this.A07.getLength() - this.A00;
        int packetOffset = this.A00;
        int bytesToRead = Math.min(packetOffset, i11);
        System.arraycopy(this.A08, length, bArr, i5, bytesToRead);
        int packetOffset2 = this.A00;
        this.A00 = packetOffset2 - bytesToRead;
        return bytesToRead;
    }
}
