package vf;

import android.net.Uri;
import com.google.android.exoplayer2.upstream.UdpDataSource$UdpDataSourceException;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.MulticastSocket;
import java.net.SocketTimeoutException;

/* loaded from: classes3.dex */
public final class h0 extends f {

    /* renamed from: e, reason: collision with root package name */
    public final int f92677e;

    /* renamed from: f, reason: collision with root package name */
    public final byte[] f92678f;

    /* renamed from: g, reason: collision with root package name */
    public final DatagramPacket f92679g;

    /* renamed from: h, reason: collision with root package name */
    public Uri f92680h;

    /* renamed from: i, reason: collision with root package name */
    public DatagramSocket f92681i;

    /* renamed from: j, reason: collision with root package name */
    public MulticastSocket f92682j;

    /* renamed from: k, reason: collision with root package name */
    public InetAddress f92683k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f92684l;

    /* renamed from: m, reason: collision with root package name */
    public int f92685m;

    public h0() {
        super(true);
        this.f92677e = 8000;
        byte[] bArr = new byte[2000];
        this.f92678f = bArr;
        this.f92679g = new DatagramPacket(bArr, 0, 2000);
    }

    @Override // vf.k
    public final void close() throws IOException {
        this.f92680h = null;
        MulticastSocket multicastSocket = this.f92682j;
        if (multicastSocket != null) {
            try {
                InetAddress inetAddress = this.f92683k;
                inetAddress.getClass();
                multicastSocket.leaveGroup(inetAddress);
            } catch (IOException unused) {
            }
            this.f92682j = null;
        }
        DatagramSocket datagramSocket = this.f92681i;
        if (datagramSocket != null) {
            datagramSocket.close();
            this.f92681i = null;
        }
        this.f92683k = null;
        this.f92685m = 0;
        if (this.f92684l) {
            this.f92684l = false;
            h();
        }
    }

    @Override // vf.k
    public final Uri getUri() {
        return this.f92680h;
    }

    @Override // vf.k
    public final long open(l lVar) throws IOException {
        Uri uri = lVar.f92691a;
        this.f92680h = uri;
        String host = uri.getHost();
        host.getClass();
        int port = this.f92680h.getPort();
        i();
        try {
            this.f92683k = InetAddress.getByName(host);
            InetSocketAddress inetSocketAddress = new InetSocketAddress(this.f92683k, port);
            if (this.f92683k.isMulticastAddress()) {
                MulticastSocket multicastSocket = new MulticastSocket(inetSocketAddress);
                this.f92682j = multicastSocket;
                multicastSocket.joinGroup(this.f92683k);
                this.f92681i = this.f92682j;
            } else {
                this.f92681i = new DatagramSocket(inetSocketAddress);
            }
            this.f92681i.setSoTimeout(this.f92677e);
            this.f92684l = true;
            j(lVar);
            return -1L;
        } catch (IOException e3) {
            throw new UdpDataSource$UdpDataSourceException(e3, 2001);
        } catch (SecurityException e11) {
            throw new UdpDataSource$UdpDataSourceException(e11, 2006);
        }
    }

    @Override // vf.h
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        int i12 = this.f92685m;
        DatagramPacket datagramPacket = this.f92679g;
        if (i12 == 0) {
            try {
                DatagramSocket datagramSocket = this.f92681i;
                datagramSocket.getClass();
                datagramSocket.receive(datagramPacket);
                int length = datagramPacket.getLength();
                this.f92685m = length;
                a(length);
            } catch (SocketTimeoutException e3) {
                throw new UdpDataSource$UdpDataSourceException(e3, 2002);
            } catch (IOException e11) {
                throw new UdpDataSource$UdpDataSourceException(e11, 2001);
            }
        }
        int length2 = datagramPacket.getLength();
        int i13 = this.f92685m;
        int iMin = Math.min(i13, i11);
        System.arraycopy(this.f92678f, length2 - i13, bArr, i5, iMin);
        this.f92685m -= iMin;
        return iMin;
    }
}
