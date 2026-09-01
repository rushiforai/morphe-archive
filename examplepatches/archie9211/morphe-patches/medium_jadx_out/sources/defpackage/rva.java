package defpackage;

import java.io.IOException;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.net.UnknownServiceException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rva {
    public final cgd a;
    public final eva b;
    public final int c;
    public final int d;
    public final int e;
    public final int f;
    public final boolean g;
    public final boolean h;
    public final cb i;
    public final zm7 j;
    public final cva k;
    public final boolean l;
    public hz2 m;
    public kmb n;
    public hmb o;
    public final m70 p;

    public rva(cgd cgdVar, eva evaVar, int i, int i2, int i3, int i4, boolean z, boolean z2, cb cbVar, zm7 zm7Var, cva cvaVar, kbb kbbVar) {
        cgdVar.getClass();
        zm7Var.getClass();
        this.a = cgdVar;
        this.b = evaVar;
        this.c = i;
        this.d = i2;
        this.e = i3;
        this.f = i4;
        this.g = z;
        this.h = z2;
        this.i = cbVar;
        this.j = zm7Var;
        this.k = cvaVar;
        this.l = !g76.L(kbbVar.b, "GET");
        this.p = new m70();
    }

    public final boolean a(dva dvaVar) {
        kmb kmbVar;
        hmb hmbVar;
        if (this.p.isEmpty() && this.o == null) {
            if (dvaVar != null) {
                synchronized (dvaVar) {
                    hmbVar = null;
                    if (dvaVar.l == 0 && dvaVar.j && ggf.a(dvaVar.c.a.h, this.i.h)) {
                        hmbVar = dvaVar.c;
                    }
                }
                if (hmbVar != null) {
                    this.o = hmbVar;
                    return true;
                }
            }
            hz2 hz2Var = this.m;
            if ((hz2Var == null || hz2Var.b >= hz2Var.a.size()) && (kmbVar = this.n) != null) {
                return kmbVar.a();
            }
        }
        return true;
    }

    public final jmb b() {
        Socket socketJ;
        ujb ujbVar;
        dva dvaVar = this.k.i;
        if (dvaVar == null) {
            ujbVar = null;
        } else {
            boolean zI = dvaVar.i(this.l);
            synchronized (dvaVar) {
                boolean z = dvaVar.j;
                boolean z2 = true;
                try {
                    if (!zI) {
                        dvaVar.j = true;
                        socketJ = this.k.j();
                    } else if (!z) {
                        qt5 qt5Var = dvaVar.c.a.h;
                        qt5 qt5Var2 = this.i.h;
                        if (qt5Var.e != qt5Var2.e || !g76.L(qt5Var.d, qt5Var2.d)) {
                            z2 = false;
                        }
                        socketJ = !z2 ? this.k.j() : null;
                    }
                } finally {
                }
            }
            if (this.k.i == null) {
                if (socketJ != null) {
                    ggf.c(socketJ);
                }
                ujbVar = null;
            } else {
                if (socketJ != null) {
                    ygf.f("Check failed.");
                    return null;
                }
                ujbVar = new ujb(dvaVar);
            }
        }
        if (ujbVar != null) {
            return ujbVar;
        }
        ujb ujbVarE = e(null, null);
        if (ujbVarE != null) {
            return ujbVarE;
        }
        if (!this.p.isEmpty()) {
            return (jmb) this.p.removeFirst();
        }
        x32 x32VarC = c();
        ujb ujbVarE2 = e(x32VarC, x32VarC.k);
        return ujbVarE2 != null ? ujbVarE2 : x32VarC;
    }

    public final x32 d(hmb hmbVar, ArrayList arrayList) throws UnknownServiceException {
        hmbVar.getClass();
        cb cbVar = hmbVar.a;
        if (cbVar.c == null) {
            if (!cbVar.j.contains(j42.g)) {
                throw new UnknownServiceException("CLEARTEXT communication not enabled for client");
            }
            String str = hmbVar.a.h.d;
            ea9 ea9Var = ea9.a;
            if (!ea9.a.h(str)) {
                throw new UnknownServiceException(ev6.x("CLEARTEXT communication to ", str, " not permitted by network security policy"));
            }
        } else if (cbVar.i.contains(c8a.H2_PRIOR_KNOWLEDGE)) {
            throw new UnknownServiceException("H2_PRIOR_KNOWLEDGE cannot be used with HTTPS");
        }
        kbb kbbVar = null;
        if (hmbVar.b.type() == Proxy.Type.HTTP) {
            cb cbVar2 = hmbVar.a;
            if (cbVar2.c != null || cbVar2.i.contains(c8a.H2_PRIOR_KNOWLEDGE)) {
                iq1 iq1Var = new iq1(14);
                iq1Var.b = hmbVar.a.h;
                iq1Var.J("CONNECT", null);
                cb cbVar3 = hmbVar.a;
                iq1Var.G("Host", ggf.i(cbVar3.h, true));
                iq1Var.G("Proxy-Connection", "Keep-Alive");
                iq1Var.G("User-Agent", "okhttp/5.3.2");
                kbbVar = new kbb(iq1Var);
                edb edbVar = fdb.b;
                ru ruVar = new ru(3);
                c8a.HTTP_1_1.getClass();
                iq7.J("Proxy-Authenticate");
                iq7.K("OkHttp-Preemptive", "Proxy-Authenticate");
                ruVar.i("Proxy-Authenticate");
                iq7.B(ruVar, "Proxy-Authenticate", "OkHttp-Preemptive");
                iq7.C(ruVar);
                edbVar.getClass();
                cbVar3.f.getClass();
            }
        }
        return new x32(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.k, this, hmbVar, arrayList, kbbVar, -1, false);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x003e A[Catch: all -> 0x003c, TryCatch #1 {all -> 0x003c, blocks: (B:14:0x0031, B:22:0x003e, B:25:0x0045), top: B:53:0x0031 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.ujb e(defpackage.x32 r11, java.util.List r12) {
        /*
            r10 = this;
            eva r0 = r10.b
            boolean r1 = r10.l
            cb r2 = r10.i
            cva r3 = r10.k
            r4 = 0
            r5 = 1
            if (r11 == 0) goto L14
            boolean r6 = r11.c()
            if (r6 == 0) goto L14
            r6 = r5
            goto L15
        L14:
            r6 = r4
        L15:
            java.util.concurrent.ConcurrentLinkedQueue r0 = r0.d
            java.util.Iterator r0 = r0.iterator()
            r0.getClass()
        L1e:
            boolean r7 = r0.hasNext()
            r8 = 0
            if (r7 == 0) goto L66
            java.lang.Object r7 = r0.next()
            dva r7 = (defpackage.dva) r7
            r7.getClass()
            monitor-enter(r7)
            if (r6 == 0) goto L3e
            qs5 r9 = r7.i     // Catch: java.lang.Throwable -> L3c
            if (r9 == 0) goto L37
            r9 = r5
            goto L38
        L37:
            r9 = r4
        L38:
            if (r9 != 0) goto L3e
        L3a:
            r9 = r4
            goto L49
        L3c:
            r10 = move-exception
            goto L64
        L3e:
            boolean r9 = r7.g(r2, r12)     // Catch: java.lang.Throwable -> L3c
            if (r9 != 0) goto L45
            goto L3a
        L45:
            r3.a(r7)     // Catch: java.lang.Throwable -> L3c
            r9 = r5
        L49:
            monitor-exit(r7)
            if (r9 == 0) goto L1e
            boolean r9 = r7.i(r1)
            if (r9 == 0) goto L53
            goto L67
        L53:
            monitor-enter(r7)
            r7.j = r5     // Catch: java.lang.Throwable -> L61
            java.net.Socket r8 = r3.j()     // Catch: java.lang.Throwable -> L61
            monitor-exit(r7)
            if (r8 == 0) goto L1e
            defpackage.ggf.c(r8)
            goto L1e
        L61:
            r10 = move-exception
            monitor-exit(r7)
            throw r10
        L64:
            monitor-exit(r7)
            throw r10
        L66:
            r7 = r8
        L67:
            if (r7 != 0) goto L6a
            return r8
        L6a:
            if (r11 == 0) goto L77
            hmb r12 = r11.j
            r10.o = r12
            java.net.Socket r10 = r11.q
            if (r10 == 0) goto L77
            defpackage.ggf.c(r10)
        L77:
            ujb r10 = new ujb
            r10.<init>(r7)
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rva.e(x32, java.util.List):ujb");
    }

    public final x32 c() throws IOException {
        String hostAddress;
        int port;
        List listW;
        boolean zContains;
        hmb hmbVar = this.o;
        if (hmbVar != null) {
            this.o = null;
            return d(hmbVar, null);
        }
        hz2 hz2Var = this.m;
        if (hz2Var != null && hz2Var.b < hz2Var.a.size()) {
            int i = hz2Var.b;
            ArrayList arrayList = hz2Var.a;
            if (i >= arrayList.size()) {
                ywb.n();
                return null;
            }
            int i2 = hz2Var.b;
            hz2Var.b = i2 + 1;
            return d((hmb) arrayList.get(i2), null);
        }
        kmb kmbVar = this.n;
        if (kmbVar == null) {
            kmbVar = new kmb(this.i, this.j, this.k, this.h);
            this.n = kmbVar;
        }
        if (!kmbVar.a()) {
            ik4.g("exhausted all routes");
            return null;
        }
        if (!kmbVar.a()) {
            ywb.n();
            return null;
        }
        ArrayList arrayList2 = new ArrayList();
        while (kmbVar.e < kmbVar.d.size()) {
            cb cbVar = kmbVar.a;
            if (kmbVar.e >= kmbVar.d.size()) {
                throw new SocketException("No route to " + cbVar.h.d + "; exhausted proxy configurations: " + kmbVar.d);
            }
            List list = kmbVar.d;
            int i3 = kmbVar.e;
            kmbVar.e = i3 + 1;
            Proxy proxy = (Proxy) list.get(i3);
            ArrayList arrayList3 = new ArrayList();
            kmbVar.f = arrayList3;
            if (proxy.type() == Proxy.Type.DIRECT || proxy.type() == Proxy.Type.SOCKS) {
                qt5 qt5Var = cbVar.h;
                hostAddress = qt5Var.d;
                port = qt5Var.e;
            } else {
                SocketAddress socketAddressAddress = proxy.address();
                if (!(socketAddressAddress instanceof InetSocketAddress)) {
                    lg8.t("Proxy.address() is not an InetSocketAddress: ", socketAddressAddress.getClass());
                    return null;
                }
                InetSocketAddress inetSocketAddress = (InetSocketAddress) socketAddressAddress;
                InetAddress address = inetSocketAddress.getAddress();
                if (address == null) {
                    hostAddress = inetSocketAddress.getHostName();
                    hostAddress.getClass();
                } else {
                    hostAddress = address.getHostAddress();
                    hostAddress.getClass();
                }
                port = inetSocketAddress.getPort();
            }
            if (1 > port || port >= 65536) {
                throw new SocketException("No route to " + hostAddress + ':' + port + fiHTiFJ.LWGhiYpKiFMgvlZ);
            }
            if (proxy.type() == Proxy.Type.SOCKS) {
                arrayList3.add(InetSocketAddress.createUnresolved(hostAddress, port));
            } else {
                x2b x2bVar = cgf.a;
                hostAddress.getClass();
                if (cgf.a.c(hostAddress)) {
                    listW = d46.Q(InetAddress.getByName(hostAddress));
                } else {
                    List listB = cbVar.a.b(hostAddress);
                    if (listB.isEmpty()) {
                        throw new UnknownHostException(cbVar.a + " returned no addresses for " + hostAddress);
                    }
                    listW = listB;
                }
                if (kmbVar.c && listW.size() >= 2) {
                    ArrayList arrayList4 = new ArrayList();
                    ArrayList arrayList5 = new ArrayList();
                    for (Object obj : listW) {
                        if (((InetAddress) obj) instanceof Inet6Address) {
                            arrayList4.add(obj);
                        } else {
                            arrayList5.add(obj);
                        }
                    }
                    if (!arrayList4.isEmpty() && !arrayList5.isEmpty()) {
                        byte[] bArr = egf.a;
                        Iterator it2 = arrayList4.iterator();
                        Iterator it3 = arrayList5.iterator();
                        f17 f17VarB = d46.B();
                        while (true) {
                            if (!it2.hasNext() && !it3.hasNext()) {
                                break;
                            }
                            if (it2.hasNext()) {
                                f17VarB.add(it2.next());
                            }
                            if (it3.hasNext()) {
                                f17VarB.add(it3.next());
                            }
                        }
                        listW = d46.w(f17VarB);
                    }
                }
                Iterator it4 = listW.iterator();
                while (it4.hasNext()) {
                    arrayList3.add(new InetSocketAddress((InetAddress) it4.next(), port));
                }
            }
            Iterator it5 = kmbVar.f.iterator();
            while (it5.hasNext()) {
                hmb hmbVar2 = new hmb(kmbVar.a, proxy, (InetSocketAddress) it5.next());
                zm7 zm7Var = kmbVar.b;
                synchronized (zm7Var) {
                    zContains = ((LinkedHashSet) zm7Var.b).contains(hmbVar2);
                }
                if (zContains) {
                    kmbVar.g.add(hmbVar2);
                } else {
                    arrayList2.add(hmbVar2);
                }
            }
            if (!arrayList2.isEmpty()) {
                break;
            }
        }
        if (arrayList2.isEmpty()) {
            bu1.n0(kmbVar.g, arrayList2);
            kmbVar.g.clear();
        }
        hz2 hz2Var2 = new hz2(arrayList2);
        this.m = hz2Var2;
        if (this.k.q) {
            ik4.g("Canceled");
            return null;
        }
        if (hz2Var2.b >= arrayList2.size()) {
            ywb.n();
            return null;
        }
        int i4 = hz2Var2.b;
        hz2Var2.b = i4 + 1;
        return d((hmb) arrayList2.get(i4), arrayList2);
    }
}
