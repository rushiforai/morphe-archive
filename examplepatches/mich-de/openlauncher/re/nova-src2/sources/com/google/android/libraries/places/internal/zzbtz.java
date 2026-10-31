package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.u1;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbtz implements zzbtr {
    final zzbtu zza;
    private final zzbwd zzb;
    private final zzbtx zzc;

    public zzbtz(zzbwd zzbwdVar, int i5, boolean z11) {
        this.zzb = zzbwdVar;
        zzbtx zzbtxVar = new zzbtx(zzbwdVar);
        this.zzc = zzbtxVar;
        this.zza = new zzbtu(u1.FLAG_APPEARED_IN_PRE_LAYOUT, u1.FLAG_APPEARED_IN_PRE_LAYOUT, zzbtxVar);
    }

    private final List zzb(int i5, short s11, byte b11, int i11) throws IOException {
        zzbtx zzbtxVar = this.zzc;
        zzbtxVar.zzd = i5;
        zzbtxVar.zza = i5;
        zzbtxVar.zze = s11;
        zzbtxVar.zzb = b11;
        zzbtxVar.zzc = i11;
        this.zza.zze();
        return this.zza.zzb();
    }

    private final void zzc(zzbtq zzbtqVar, int i5) throws IOException {
        this.zzb.zze();
        this.zzb.zzc();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.zzb.close();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.android.libraries.places.internal.zzbtr
    public final boolean zza(zzbtq zzbtqVar) throws IOException {
        try {
            this.zzb.zzD(9L);
            int iZzb = zzbub.zzb(this.zzb);
            if (iZzb > 16384) {
                throw zzbub.zzi("FRAME_SIZE_ERROR: %s", Integer.valueOf(iZzb));
            }
            byte bZzc = (byte) (this.zzb.zzc() & 255);
            byte bZzc2 = (byte) (this.zzb.zzc() & 255);
            int iZze = this.zzb.zze() & LayoutNode.NotPlacedPlaceOrder;
            Logger logger = zzbub.zza;
            Level level = Level.FINE;
            if (logger.isLoggable(level)) {
                zzbub.zza.logp(level, "io.grpc.okhttp.internal.framed.Http2$Reader", "nextFrame", zzbty.zza(true, iZze, iZzb, bZzc, bZzc2));
            }
            switch (bZzc) {
                case 0:
                    boolean z11 = bZzc2 & 1;
                    if ((bZzc2 & 32) != 0) {
                        throw zzbub.zzi("PROTOCOL_ERROR: FLAG_COMPRESSED without SETTINGS_COMPRESS_DATA", new Object[0]);
                    }
                    int iZzc = (bZzc2 & 8) != 0 ? this.zzb.zzc() & 255 : 0;
                    zzbtqVar.zza(1 == z11, iZze, this.zzb, zzbub.zza(iZzb, bZzc2, (short) iZzc), iZzb);
                    this.zzb.zzF(iZzc);
                    return true;
                case 1:
                    if (iZze == 0) {
                        throw zzbub.zzi("PROTOCOL_ERROR: TYPE_HEADERS streamId == 0", new Object[0]);
                    }
                    boolean z12 = bZzc2 & 32;
                    boolean z13 = bZzc2 & 1;
                    int iZzc2 = (bZzc2 & 8) != 0 ? this.zzb.zzc() & 255 : 0;
                    if (z12 != 0) {
                        zzc(zzbtqVar, iZze);
                        iZzb -= 5;
                    }
                    short s11 = (short) iZzc2;
                    zzbtqVar.zzh(false, 1 == z13, iZze, -1, zzb(zzbub.zza(iZzb, bZzc2, s11), s11, bZzc2, iZze), 4);
                    return true;
                case 2:
                    if (iZzb != 5) {
                        throw zzbub.zzi("TYPE_PRIORITY length: %d != 5", Integer.valueOf(iZzb));
                    }
                    if (iZze == 0) {
                        throw zzbub.zzi("TYPE_PRIORITY streamId == 0", new Object[0]);
                    }
                    zzc(zzbtqVar, iZze);
                    return true;
                case 3:
                    if (iZzb != 4) {
                        throw zzbub.zzi("TYPE_RST_STREAM length: %d != 4", Integer.valueOf(iZzb));
                    }
                    if (iZze == 0) {
                        throw zzbub.zzi("TYPE_RST_STREAM streamId == 0", new Object[0]);
                    }
                    int iZze2 = this.zzb.zze();
                    zzbtp zzbtpVarZza = zzbtp.zza(iZze2);
                    if (zzbtpVarZza == null) {
                        throw zzbub.zzi("TYPE_RST_STREAM unexpected error code: %d", Integer.valueOf(iZze2));
                    }
                    zzbtqVar.zze(iZze, zzbtpVarZza);
                    return true;
                case 4:
                    if (iZze != 0) {
                        throw zzbub.zzi("TYPE_SETTINGS streamId != 0", new Object[0]);
                    }
                    if ((bZzc2 & 1) == 0) {
                        if (iZzb % 6 != 0) {
                            throw zzbub.zzi("TYPE_SETTINGS length %% 6 != 0: %s", Integer.valueOf(iZzb));
                        }
                        zzbue zzbueVar = new zzbue();
                        for (int i5 = 0; i5 < iZzb; i5 += 6) {
                            zzbwd zzbwdVar = this.zzb;
                            zzbwl zzbwlVar = (zzbwl) zzbwdVar;
                            zzbwlVar.zzD(2L);
                            short sZzC = zzbwlVar.zzb.zzC();
                            int iZze3 = zzbwdVar.zze();
                            switch (sZzC) {
                                case 1:
                                case 6:
                                    zzbueVar.zze(sZzC, 0, iZze3);
                                case 2:
                                    if (iZze3 != 0 && iZze3 != 1) {
                                        throw zzbub.zzi("PROTOCOL_ERROR SETTINGS_ENABLE_PUSH != 0 or 1", new Object[0]);
                                    }
                                    zzbueVar.zze(sZzC, 0, iZze3);
                                case 3:
                                    sZzC = 4;
                                    zzbueVar.zze(sZzC, 0, iZze3);
                                case 4:
                                    if (iZze3 < 0) {
                                        throw zzbub.zzi("PROTOCOL_ERROR SETTINGS_INITIAL_WINDOW_SIZE > 2^31 - 1", new Object[0]);
                                    }
                                    sZzC = 7;
                                    zzbueVar.zze(sZzC, 0, iZze3);
                                case 5:
                                    if (iZze3 < 16384 || iZze3 > 16777215) {
                                        throw zzbub.zzi("PROTOCOL_ERROR SETTINGS_MAX_FRAME_SIZE: %s", Integer.valueOf(iZze3));
                                    }
                                    zzbueVar.zze(sZzC, 0, iZze3);
                                    break;
                                default:
                            }
                        }
                        zzbtqVar.zzf(false, zzbueVar);
                        if (zzbueVar.zzb() >= 0) {
                            this.zza.zzd(zzbueVar.zzb());
                        }
                    } else if (iZzb != 0) {
                        throw zzbub.zzi("FRAME_SIZE_ERROR ack frame should be empty!", new Object[0]);
                    }
                    return true;
                case 5:
                    if (iZze == 0) {
                        throw zzbub.zzi("PROTOCOL_ERROR: TYPE_PUSH_PROMISE streamId == 0", new Object[0]);
                    }
                    short sZzc = (short) ((bZzc2 & 8) != 0 ? this.zzb.zzc() & 255 : 0);
                    zzbtqVar.zzd(iZze, this.zzb.zze() & LayoutNode.NotPlacedPlaceOrder, zzb(zzbub.zza(iZzb - 4, bZzc2, sZzc), sZzc, bZzc2, iZze));
                    return true;
                case 6:
                    if (iZzb != 8) {
                        throw zzbub.zzi("TYPE_PING length != 8: %s", Integer.valueOf(iZzb));
                    }
                    if (iZze != 0) {
                        throw zzbub.zzi("TYPE_PING streamId != 0", new Object[0]);
                    }
                    boolean z14 = 1 == (bZzc2 & 1);
                    zzbwd zzbwdVar2 = this.zzb;
                    zzbtqVar.zzc(z14, zzbwdVar2.zze(), zzbwdVar2.zze());
                    return true;
                case 7:
                    if (iZzb < 8) {
                        throw zzbub.zzi("TYPE_GOAWAY length < 8: %s", Integer.valueOf(iZzb));
                    }
                    if (iZze != 0) {
                        throw zzbub.zzi("TYPE_GOAWAY streamId != 0", new Object[0]);
                    }
                    zzbwd zzbwdVar3 = this.zzb;
                    int i11 = iZzb - 8;
                    int iZze4 = zzbwdVar3.zze();
                    int iZze5 = zzbwdVar3.zze();
                    zzbtp zzbtpVarZza2 = zzbtp.zza(iZze5);
                    if (zzbtpVarZza2 == null) {
                        throw zzbub.zzi("TYPE_GOAWAY unexpected error code: %d", Integer.valueOf(iZze5));
                    }
                    zzbwf zzbwfVarZzy = zzbwf.zzb;
                    if (i11 > 0) {
                        zzbwfVarZzy = this.zzb.zzy(i11);
                    }
                    zzbtqVar.zzb(iZze4, zzbtpVarZza2, zzbwfVarZzy);
                    return true;
                case 8:
                    if (iZzb != 4) {
                        throw zzbub.zzi("TYPE_WINDOW_UPDATE length !=4: %s", Integer.valueOf(iZzb));
                    }
                    long jZze = this.zzb.zze() & 2147483647L;
                    if (jZze == 0) {
                        throw zzbub.zzi("windowSizeIncrement was 0", new Object[0]);
                    }
                    zzbtqVar.zzg(iZze, jZze);
                    return true;
                default:
                    this.zzb.zzF(iZzb);
                    return true;
            }
        } catch (IOException unused) {
            return false;
        }
    }
}
