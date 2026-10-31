package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;
import com.amplitude.core.Configuration;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.EOFException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetSocketAddress;
import java.net.ProtocolException;
import java.net.Socket;
import java.net.URI;
import java.util.Collections;
import java.util.Deque;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.logging.Logger;
import javax.net.SocketFactory;
import javax.net.ssl.SSLSocketFactory;

/* loaded from: classes3.dex */
final class zzbsf implements zzbgf, zzbrj, zzbsr {
    private static final Map zzc;
    private static final Logger zzd;
    private boolean zzA;
    private zzbjh zzB;
    private boolean zzC;
    private boolean zzD;
    private final SocketFactory zzE;
    private SSLSocketFactory zzF;
    private Socket zzG;
    private int zzH;
    private final Deque zzI;
    private final zzbsz zzJ;
    private zzbkh zzK;
    private final Runnable zzL;
    private final int zzM;
    private final zzbqz zzN;
    private final zzbji zzO;
    private zzbaf zzP;
    final zzbaa zza;
    int zzb;
    private final InetSocketAddress zze;
    private final String zzf;
    private final String zzg;
    private final Random zzh;
    private final zznc zzi;
    private final int zzj;
    private final zzbuf zzk;
    private zzbmk zzl;
    private zzbrk zzm;
    private zzbsu zzn;
    private final Object zzo;
    private final zzbap zzp;
    private int zzq;
    private final Map zzr;
    private final Executor zzs;
    private final zzbqe zzt;
    private final ScheduledExecutorService zzu;
    private final int zzv;
    private int zzw;
    private zzbse zzx;
    private zzaye zzy;
    private zzbdo zzz;

    static {
        EnumMap enumMap = new EnumMap(zzbtp.class);
        zzbtp zzbtpVar = zzbtp.NO_ERROR;
        zzbdo zzbdoVar = zzbdo.zzo;
        enumMap.put((EnumMap) zzbtpVar, (zzbtp) zzbdoVar.zzg("No error: A GRPC status of OK should have been sent"));
        enumMap.put((EnumMap) zzbtp.PROTOCOL_ERROR, (zzbtp) zzbdoVar.zzg("Protocol error"));
        enumMap.put((EnumMap) zzbtp.INTERNAL_ERROR, (zzbtp) zzbdoVar.zzg("Internal error"));
        enumMap.put((EnumMap) zzbtp.FLOW_CONTROL_ERROR, (zzbtp) zzbdoVar.zzg("Flow control error"));
        enumMap.put((EnumMap) zzbtp.STREAM_CLOSED, (zzbtp) zzbdoVar.zzg("Stream closed"));
        enumMap.put((EnumMap) zzbtp.FRAME_TOO_LARGE, (zzbtp) zzbdoVar.zzg("Frame too large"));
        enumMap.put((EnumMap) zzbtp.REFUSED_STREAM, (zzbtp) zzbdo.zzp.zzg("Refused stream"));
        enumMap.put((EnumMap) zzbtp.CANCEL, (zzbtp) zzbdo.zzb.zzg("Cancelled"));
        enumMap.put((EnumMap) zzbtp.COMPRESSION_ERROR, (zzbtp) zzbdoVar.zzg("Compression error"));
        enumMap.put((EnumMap) zzbtp.CONNECT_ERROR, (zzbtp) zzbdoVar.zzg("Connect error"));
        enumMap.put((EnumMap) zzbtp.ENHANCE_YOUR_CALM, (zzbtp) zzbdo.zzj.zzg("Enhance your calm"));
        enumMap.put((EnumMap) zzbtp.INADEQUATE_SECURITY, (zzbtp) zzbdo.zzh.zzg("Inadequate security"));
        zzc = Collections.unmodifiableMap(enumMap);
        zzd = Logger.getLogger(zzbsf.class.getName());
    }

    public zzbsf(zzbru zzbruVar, InetSocketAddress inetSocketAddress, String str, String str2, zzaye zzayeVar, zzbaa zzbaaVar, Runnable runnable) {
        zznc zzncVar = zzbjd.zzr;
        zzbub zzbubVar = new zzbub();
        this.zzh = new Random();
        Object obj = new Object();
        this.zzo = obj;
        this.zzr = new HashMap();
        this.zzH = 0;
        this.zzI = new LinkedList();
        this.zzO = new zzbrz(this);
        this.zzb = Configuration.FLUSH_INTERVAL_MILLIS;
        zzmt.zzc(inetSocketAddress, PlaceTypes.ADDRESS);
        this.zze = inetSocketAddress;
        this.zzf = str;
        this.zzv = 4194304;
        this.zzj = 65535;
        Executor executor = zzbruVar.zza;
        zzmt.zzc(executor, "executor");
        this.zzs = executor;
        this.zzt = new zzbqe(zzbruVar.zza);
        ScheduledExecutorService scheduledExecutorService = zzbruVar.zzb;
        zzmt.zzc(scheduledExecutorService, "scheduledExecutorService");
        this.zzu = scheduledExecutorService;
        this.zzq = 3;
        this.zzE = SocketFactory.getDefault();
        this.zzF = zzbruVar.zzd;
        zzbsz zzbszVar = zzbruVar.zze;
        zzmt.zzc(zzbszVar, "connectionSpec");
        this.zzJ = zzbszVar;
        zzmt.zzc(zzncVar, "stopwatchFactory");
        this.zzi = zzncVar;
        this.zzk = zzbubVar;
        this.zzg = "grpc-java-okhttp/1.64.0-SNAPSHOT";
        this.zza = zzbaaVar;
        this.zzL = runnable;
        this.zzM = LayoutNode.NotPlacedPlaceOrder;
        zzbqz zzbqzVarZza = zzbruVar.zzc.zza();
        this.zzN = zzbqzVarZza;
        this.zzp = zzbap.zzb(zzbsf.class, inetSocketAddress.toString());
        zzayb zzaybVarZza = zzaye.zza();
        zzaybVarZza.zzb(zzbit.zzb, zzayeVar);
        this.zzy = zzaybVarZza.zzc();
        synchronized (obj) {
            zzbqzVarZza.zzf(new zzbsa(this));
        }
    }

    public static /* bridge */ /* synthetic */ Socket zzA(zzbsf zzbsfVar, InetSocketAddress inetSocketAddress, InetSocketAddress inetSocketAddress2, String str, String str2) throws NumberFormatException, IOException, zzbdp {
        Socket socketCreateSocket;
        int i5;
        String strSubstring;
        try {
            socketCreateSocket = inetSocketAddress2.getAddress() != null ? zzbsfVar.zzE.createSocket(inetSocketAddress2.getAddress(), inetSocketAddress2.getPort()) : zzbsfVar.zzE.createSocket(inetSocketAddress2.getHostName(), inetSocketAddress2.getPort());
            try {
                socketCreateSocket.setTcpNoDelay(true);
                socketCreateSocket.setSoTimeout(zzbsfVar.zzb);
                zzbws zzbwsVarZzd = zzbwh.zzd(socketCreateSocket);
                zzbwc zzbwcVarZza = zzbwh.zza(zzbwh.zzc(socketCreateSocket));
                zzbug zzbugVar = new zzbug();
                zzbugVar.zzd("https");
                zzbugVar.zzb(inetSocketAddress.getHostName());
                zzbugVar.zzc(inetSocketAddress.getPort());
                zzbui zzbuiVarZze = zzbugVar.zze();
                zzbuj zzbujVar = new zzbuj();
                zzbujVar.zzd(zzbuiVarZze);
                zzbujVar.zzc("Host", zzbuiVarZze.zzd() + ":" + zzbuiVarZze.zzc());
                zzbujVar.zzc("User-Agent", zzbsfVar.zzg);
                if (str != null && str2 != null) {
                    try {
                        byte[] bytes = (str + ":" + str2).getBytes("ISO-8859-1");
                        zzbwe zzbweVar = zzbwf.zza;
                        zzbujVar.zzc("Proxy-Authorization", "Basic " + zzbwe.zzb(bytes).zzd());
                    } catch (UnsupportedEncodingException unused) {
                        throw new AssertionError();
                    }
                }
                zzbul zzbulVarZze = zzbujVar.zze();
                zzbui zzbuiVarZzb = zzbulVarZze.zzb();
                Locale locale = Locale.US;
                zzbwcVarZza.zzx("CONNECT " + zzbuiVarZzb.zzd() + ":" + zzbuiVarZzb.zzc() + " HTTP/1.1");
                zzbwcVarZza.zzx("\r\n");
                int iZza = zzbulVarZze.zza().zza();
                for (int i11 = 0; i11 < iZza; i11++) {
                    zzbwcVarZza.zzx(zzbulVarZze.zza().zzb(i11));
                    zzbwcVarZza.zzx(": ");
                    zzbwcVarZza.zzx(zzbulVarZze.zza().zzc(i11));
                    zzbwcVarZza.zzx("\r\n");
                }
                zzbwcVarZza.zzx("\r\n");
                zzbwcVarZza.flush();
                String strZzW = zzW(zzbwsVarZzd);
                if (strZzW.startsWith("HTTP/1.")) {
                    i5 = 9;
                    if (strZzW.length() < 9 || strZzW.charAt(8) != ' ') {
                        throw new ProtocolException("Unexpected status line: ".concat(strZzW));
                    }
                    int iCharAt = strZzW.charAt(7) - '0';
                    if (iCharAt != 0 && iCharAt != 1) {
                        throw new ProtocolException("Unexpected status line: ".concat(strZzW));
                    }
                    zzbtm zzbtmVar = zzbtm.HTTP_1_0;
                } else {
                    if (!strZzW.startsWith("ICY ")) {
                        throw new ProtocolException("Unexpected status line: ".concat(strZzW));
                    }
                    zzbtm zzbtmVar2 = zzbtm.HTTP_1_0;
                    i5 = 4;
                }
                int i12 = i5 + 3;
                if (strZzW.length() < i12) {
                    throw new ProtocolException("Unexpected status line: ".concat(strZzW));
                }
                try {
                    int i13 = Integer.parseInt(strZzW.substring(i5, i12));
                    if (strZzW.length() <= i12) {
                        strSubstring = b.f42142b;
                    } else {
                        if (strZzW.charAt(i12) != ' ') {
                            throw new ProtocolException("Unexpected status line: ".concat(strZzW));
                        }
                        strSubstring = strZzW.substring(i5 + 4);
                    }
                    while (!zzW(zzbwsVarZzd).equals(b.f42142b)) {
                    }
                    if (i13 >= 200 && i13 < 300) {
                        socketCreateSocket.setSoTimeout(0);
                        return socketCreateSocket;
                    }
                    zzbwb zzbwbVar = new zzbwb();
                    try {
                        socketCreateSocket.shutdownOutput();
                        zzbwsVarZzd.zza(zzbwbVar, 1024L);
                    } catch (IOException e3) {
                        zzbwbVar.zzs("Unable to read body: " + e3.toString());
                    }
                    try {
                        socketCreateSocket.close();
                    } catch (IOException unused2) {
                    }
                    Locale locale2 = Locale.US;
                    throw new zzbdp(zzbdo.zzp.zzg("Response returned from proxy was not successful (expected 2xx, got " + i13 + " " + strSubstring + "). Response body:\n" + zzbwbVar.zzi()), null);
                } catch (NumberFormatException unused3) {
                    throw new ProtocolException("Unexpected status line: ".concat(strZzW));
                }
            } catch (IOException e11) {
                e = e11;
                if (socketCreateSocket != null) {
                    zzbjd.zzi(socketCreateSocket);
                }
                throw new zzbdp(zzbdo.zzp.zzg("Failed trying to connect with proxy").zzf(e), null);
            }
        } catch (IOException e12) {
            e = e12;
            socketCreateSocket = null;
        }
    }

    private static String zzW(zzbws zzbwsVar) throws IOException {
        zzbwb zzbwbVar = new zzbwb();
        while (zzbwsVar.zza(zzbwbVar, 1L) != -1) {
            if (zzbwbVar.zzb(zzbwbVar.zzg() - 1) == 10) {
                return zzbwbVar.zzj(Long.MAX_VALUE);
            }
        }
        throw new EOFException("\\n not found: ".concat(String.valueOf(zzbwbVar.zzy(zzbwbVar.zzg()).zze())));
    }

    private final Throwable zzX() {
        synchronized (this.zzo) {
            try {
                zzbdo zzbdoVar = this.zzz;
                if (zzbdoVar != null) {
                    return new zzbdp(zzbdoVar, null);
                }
                return new zzbdp(zzbdo.zzp.zzg("Connection closed"), null);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private final void zzY(zzbry zzbryVar) {
        if (this.zzD && this.zzI.isEmpty() && this.zzr.isEmpty()) {
            this.zzD = false;
            zzbkh zzbkhVar = this.zzK;
            if (zzbkhVar != null) {
                zzbkhVar.zzc();
            }
        }
        if (zzbryVar.zzq()) {
            this.zzO.zzc(zzbryVar, false);
        }
    }

    private final void zzZ(zzbry zzbryVar) {
        if (!this.zzD) {
            this.zzD = true;
            zzbkh zzbkhVar = this.zzK;
            if (zzbkhVar != null) {
                zzbkhVar.zzb();
            }
        }
        if (zzbryVar.zzq()) {
            this.zzO.zzc(zzbryVar, true);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaa(int i5, zzbtp zzbtpVar, zzbdo zzbdoVar) {
        synchronized (this.zzo) {
            try {
                if (this.zzz == null) {
                    this.zzz = zzbdoVar;
                    this.zzl.zzd(zzbdoVar);
                }
                if (zzbtpVar != null && !this.zzA) {
                    this.zzA = true;
                    this.zzm.zzh(0, zzbtpVar, new byte[0]);
                }
                Iterator it = this.zzr.entrySet().iterator();
                while (it.hasNext()) {
                    Map.Entry entry = (Map.Entry) it.next();
                    if (((Integer) entry.getKey()).intValue() > i5) {
                        it.remove();
                        ((zzbry) entry.getValue()).zzD().zzj(zzbdoVar, zzbfs.REFUSED, false, new zzbcf());
                        zzY((zzbry) entry.getValue());
                    }
                }
                for (zzbry zzbryVar : this.zzI) {
                    zzbryVar.zzD().zzj(zzbdoVar, zzbfs.MISCARRIED, true, new zzbcf());
                    zzY(zzbryVar);
                }
                this.zzI.clear();
                zzac();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private final void zzab(zzbry zzbryVar) {
        zzmt.zzp(zzbryVar.zzD().zzG() == -1, "StreamId already assigned");
        this.zzr.put(Integer.valueOf(this.zzq), zzbryVar);
        zzZ(zzbryVar);
        zzbryVar.zzD().zzN(this.zzq);
        if (zzbryVar.zzx() == zzbcj.UNARY || zzbryVar.zzx() == zzbcj.SERVER_STREAMING) {
            zzbryVar.zzI();
        } else {
            this.zzm.zzg();
        }
        int i5 = this.zzq;
        if (i5 < 2147483645) {
            this.zzq = i5 + 2;
        } else {
            this.zzq = LayoutNode.NotPlacedPlaceOrder;
            zzaa(LayoutNode.NotPlacedPlaceOrder, zzbtp.NO_ERROR, zzbdo.zzp.zzg("Stream ids exhausted"));
        }
    }

    private final void zzac() {
        if (this.zzz == null || !this.zzr.isEmpty() || !this.zzI.isEmpty() || this.zzC) {
            return;
        }
        this.zzC = true;
        zzbkh zzbkhVar = this.zzK;
        if (zzbkhVar != null) {
            zzbkhVar.zzd();
        }
        zzbjh zzbjhVar = this.zzB;
        if (zzbjhVar != null) {
            zzbjhVar.zzb(zzX());
            this.zzB = null;
        }
        if (!this.zzA) {
            this.zzA = true;
            this.zzm.zzh(0, zzbtp.NO_ERROR, new byte[0]);
        }
        this.zzm.close();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean zzad() {
        boolean z11 = false;
        while (!this.zzI.isEmpty() && this.zzr.size() < this.zzH) {
            zzab((zzbry) this.zzI.poll());
            z11 = true;
        }
        return z11;
    }

    public static zzbdo zzm(zzbtp zzbtpVar) {
        zzbdo zzbdoVar = (zzbdo) zzc.get(zzbtpVar);
        if (zzbdoVar != null) {
            return zzbdoVar;
        }
        return zzbdo.zzc.zzg("Unknown http2 error code: " + zzbtpVar.zzs);
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzc("logId", this.zzp.zza());
        zzmmVarZzb.zzd(PlaceTypes.ADDRESS, this.zze);
        return zzmmVarZzb.toString();
    }

    public final void zzP(int i5, zzbdo zzbdoVar, zzbfs zzbfsVar, boolean z11, zzbtp zzbtpVar, zzbcf zzbcfVar) {
        synchronized (this.zzo) {
            try {
                zzbry zzbryVar = (zzbry) this.zzr.remove(Integer.valueOf(i5));
                if (zzbryVar != null) {
                    if (zzbtpVar != null) {
                        this.zzm.zzc(i5, zzbtp.CANCEL);
                    }
                    if (zzbdoVar != null) {
                        zzbrx zzbrxVarZzD = zzbryVar.zzD();
                        if (zzbcfVar == null) {
                            zzbcfVar = new zzbcf();
                        }
                        zzbrxVarZzD.zzj(zzbdoVar, zzbfsVar, z11, zzbcfVar);
                    }
                    if (!zzad()) {
                        zzac();
                    }
                    zzY(zzbryVar);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void zzQ(zzbry zzbryVar) {
        this.zzI.remove(zzbryVar);
        zzY(zzbryVar);
    }

    public final void zzR(zzbry zzbryVar) {
        zzbdo zzbdoVar = this.zzz;
        if (zzbdoVar != null) {
            zzbryVar.zzD().zzj(zzbdoVar, zzbfs.MISCARRIED, true, new zzbcf());
        } else if (this.zzr.size() < this.zzH) {
            zzab(zzbryVar);
        } else {
            this.zzI.add(zzbryVar);
            zzZ(zzbryVar);
        }
    }

    public final boolean zzT() {
        return this.zzF == null;
    }

    public final boolean zzU(int i5) {
        boolean z11;
        synchronized (this.zzo) {
            z11 = false;
            if (i5 < this.zzq && (i5 & 1) == 1) {
                z11 = true;
            }
        }
        return z11;
    }

    @Override // com.google.android.libraries.places.internal.zzbsr
    public final zzbsq[] zzV() {
        zzbsq[] zzbsqVarArr;
        synchronized (this.zzo) {
            try {
                zzbsqVarArr = new zzbsq[this.zzr.size()];
                Iterator it = this.zzr.values().iterator();
                int i5 = 0;
                while (it.hasNext()) {
                    zzbsqVarArr[i5] = ((zzbry) it.next()).zzD().zzH();
                    i5++;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return zzbsqVarArr;
    }

    @Override // com.google.android.libraries.places.internal.zzbfu
    public final /* synthetic */ zzbfr zza(zzbcl zzbclVar, zzbcf zzbcfVar, zzayj zzayjVar, zzayx[] zzayxVarArr) {
        zzbry zzbryVar;
        zzmt.zzc(zzbclVar, "method");
        zzbqo zzbqoVarZza = zzbqo.zza(zzayxVarArr, this.zzy, zzbcfVar);
        synchronized (this.zzo) {
            zzbryVar = new zzbry(zzbclVar, zzbcfVar, this.zzm, this, this.zzn, this.zzo, this.zzv, this.zzj, this.zzf, this.zzg, zzbqoVarZza, this.zzN, zzayjVar, false);
        }
        return zzbryVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbrj
    public final void zzb(Throwable th2) {
        zzaa(0, zzbtp.INTERNAL_ERROR, zzbdo.zzp.zzf(th2));
    }

    @Override // com.google.android.libraries.places.internal.zzbau
    public final zzbap zzc() {
        return this.zzp;
    }

    @Override // com.google.android.libraries.places.internal.zzbml
    public final void zzd(zzbdo zzbdoVar) {
        synchronized (this.zzo) {
            try {
                if (this.zzz != null) {
                    return;
                }
                this.zzz = zzbdoVar;
                this.zzl.zzd(zzbdoVar);
                zzac();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbgf
    public final zzaye zze() {
        return this.zzy;
    }

    public final int zzi() {
        URI uriZzf = zzbjd.zzf(this.zzf);
        return uriZzf.getPort() != -1 ? uriZzf.getPort() : this.zze.getPort();
    }

    @Override // com.google.android.libraries.places.internal.zzbml
    public final Runnable zzj(zzbmk zzbmkVar) {
        this.zzl = zzbmkVar;
        zzbri zzbriVarZzc = zzbri.zzc(this.zzt, this, 10000);
        zzbrf zzbrfVar = new zzbrf(zzbriVarZzc, this.zzk.zzd(zzbwh.zza(zzbriVarZzc), true));
        synchronized (this.zzo) {
            zzbrk zzbrkVar = new zzbrk(this, zzbrfVar);
            this.zzm = zzbrkVar;
            this.zzn = new zzbsu(this, zzbrkVar);
        }
        CountDownLatch countDownLatch = new CountDownLatch(1);
        this.zzt.execute(new zzbsc(this, countDownLatch, zzbriVarZzc));
        try {
            synchronized (this.zzo) {
                this.zzm.zze();
                zzbue zzbueVar = new zzbue();
                zzbueVar.zze(7, 0, this.zzj);
                this.zzm.zzi(zzbueVar);
            }
            countDownLatch.countDown();
            this.zzt.execute(new zzbsd(this));
            return null;
        } catch (Throwable th2) {
            countDownLatch.countDown();
            throw th2;
        }
    }

    public final zzbry zzr(int i5) {
        zzbry zzbryVar;
        synchronized (this.zzo) {
            zzbryVar = (zzbry) this.zzr.get(Integer.valueOf(i5));
        }
        return zzbryVar;
    }

    public final String zzy() {
        URI uriZzf = zzbjd.zzf(this.zzf);
        return uriZzf.getHost() != null ? uriZzf.getHost() : this.zzf;
    }
}
