package ep;

import android.net.Uri;
import android.os.Bundle;
import b.c0;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.ExoTimeoutException;
import com.google.android.exoplayer2.drm.DrmInitData;
import com.google.android.exoplayer2.metadata.Metadata;
import fe.a2;
import fe.e1;
import fe.j0;
import fe.j1;
import fe.k0;
import fe.l0;
import fe.m0;
import fe.n0;
import fe.o0;
import fe.q0;
import fe.q1;
import fe.s0;
import fe.t1;
import fe.u0;
import fe.v0;
import fe.v1;
import fe.w0;
import fe.x1;
import fe.y1;
import gf.x0;
import java.util.ArrayList;
import java.util.TreeSet;
import o9.z1;
import vk.b0;
import wf.v;
import xk.r2;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements p, z1, wf.e, fe.d, w60.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52857a;

    public /* synthetic */ c(int i5) {
        this.f52857a = i5;
    }

    @Override // ep.p
    public Object a() {
        return new TreeSet();
    }

    @Override // fe.d
    public fe.e b(Bundle bundle) {
        Bundle bundle2;
        Bundle bundle3;
        r2 r2VarS;
        boolean z11 = true;
        switch (this.f52857a) {
            case 6:
                k0 k0Var = k0.G;
                j0 j0Var = new j0();
                if (bundle != null) {
                    ClassLoader classLoader = wf.a.class.getClassLoader();
                    int i5 = v.f94376a;
                    bundle.setClassLoader(classLoader);
                }
                String string = bundle.getString(Integer.toString(0, 36));
                String str = k0Var.f54872a;
                if (string == null) {
                    string = str;
                }
                j0Var.f54846a = string;
                String string2 = bundle.getString(Integer.toString(1, 36));
                String str2 = k0Var.f54873b;
                if (string2 == null) {
                    string2 = str2;
                }
                j0Var.f54847b = string2;
                String string3 = bundle.getString(Integer.toString(2, 36));
                String str3 = k0Var.f54874c;
                if (string3 == null) {
                    string3 = str3;
                }
                j0Var.f54848c = string3;
                j0Var.f54849d = bundle.getInt(Integer.toString(3, 36), k0Var.f54875d);
                j0Var.f54850e = bundle.getInt(Integer.toString(4, 36), k0Var.f54876e);
                j0Var.f54851f = bundle.getInt(Integer.toString(5, 36), k0Var.f54877f);
                j0Var.f54852g = bundle.getInt(Integer.toString(6, 36), k0Var.f54878g);
                String string4 = bundle.getString(Integer.toString(7, 36));
                String str4 = k0Var.f54880i;
                if (string4 == null) {
                    string4 = str4;
                }
                j0Var.f54853h = string4;
                Metadata metadata = (Metadata) bundle.getParcelable(Integer.toString(8, 36));
                Metadata metadata2 = k0Var.f54881j;
                if (metadata == null) {
                    metadata = metadata2;
                }
                j0Var.f54854i = metadata;
                String string5 = bundle.getString(Integer.toString(9, 36));
                String str5 = k0Var.f54882k;
                if (string5 == null) {
                    string5 = str5;
                }
                j0Var.f54855j = string5;
                String string6 = bundle.getString(Integer.toString(10, 36));
                String str6 = k0Var.f54883l;
                if (string6 == null) {
                    string6 = str6;
                }
                j0Var.f54856k = string6;
                j0Var.f54857l = bundle.getInt(Integer.toString(11, 36), k0Var.f54884m);
                ArrayList arrayList = new ArrayList();
                int i11 = 0;
                while (true) {
                    byte[] byteArray = bundle.getByteArray(Integer.toString(12, 36) + "_" + Integer.toString(i11, 36));
                    if (byteArray == null) {
                        j0Var.f54858m = arrayList;
                        j0Var.n = (DrmInitData) bundle.getParcelable(Integer.toString(13, 36));
                        j0Var.o = bundle.getLong(Integer.toString(14, 36), k0Var.f54885p);
                        j0Var.f54859p = bundle.getInt(Integer.toString(15, 36), k0Var.f54886q);
                        j0Var.f54860q = bundle.getInt(Integer.toString(16, 36), k0Var.f54887r);
                        j0Var.f54861r = bundle.getFloat(Integer.toString(17, 36), k0Var.f54888s);
                        j0Var.f54862s = bundle.getInt(Integer.toString(18, 36), k0Var.f54889t);
                        j0Var.f54863t = bundle.getFloat(Integer.toString(19, 36), k0Var.f54890u);
                        j0Var.f54864u = bundle.getByteArray(Integer.toString(20, 36));
                        j0Var.f54865v = bundle.getInt(Integer.toString(21, 36), k0Var.f54892w);
                        Bundle bundle4 = bundle.getBundle(Integer.toString(22, 36));
                        if (bundle4 != null) {
                            j0Var.f54866w = new xf.a(bundle4.getInt(Integer.toString(0, 36), -1), bundle4.getInt(Integer.toString(1, 36), -1), bundle4.getInt(Integer.toString(2, 36), -1), bundle4.getByteArray(Integer.toString(3, 36)));
                        }
                        j0Var.f54867x = bundle.getInt(Integer.toString(23, 36), k0Var.f54894y);
                        j0Var.f54868y = bundle.getInt(Integer.toString(24, 36), k0Var.f54895z);
                        j0Var.f54869z = bundle.getInt(Integer.toString(25, 36), k0Var.A);
                        j0Var.A = bundle.getInt(Integer.toString(26, 36), k0Var.B);
                        j0Var.B = bundle.getInt(Integer.toString(27, 36), k0Var.C);
                        j0Var.C = bundle.getInt(Integer.toString(28, 36), k0Var.D);
                        j0Var.D = bundle.getInt(Integer.toString(29, 36), k0Var.E);
                        return new k0(j0Var);
                    }
                    arrayList.add(byteArray);
                    i11++;
                }
            case 7:
                wf.a.e(bundle.getInt(Integer.toString(0, 36), -1) == 0);
                return bundle.getBoolean(Integer.toString(1, 36), false) ? new l0(bundle.getBoolean(Integer.toString(2, 36), false)) : new l0();
            case 8:
                String string7 = bundle.getString(Integer.toString(0, 36), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                string7.getClass();
                Bundle bundle5 = bundle.getBundle(Integer.toString(1, 36));
                q0 q0Var = bundle5 == null ? q0.f54964f : new q0(bundle5.getLong(Integer.toString(0, 36), -9223372036854775807L), bundle5.getLong(Integer.toString(1, 36), -9223372036854775807L), bundle5.getLong(Integer.toString(2, 36), -9223372036854775807L), bundle5.getFloat(Integer.toString(3, 36), -3.4028235E38f), bundle5.getFloat(Integer.toString(4, 36), -3.4028235E38f));
                Bundle bundle6 = bundle.getBundle(Integer.toString(2, 36));
                w0 w0Var = bundle6 == null ? w0.G : (w0) w0.H.b(bundle6);
                Bundle bundle7 = bundle.getBundle(Integer.toString(3, 36));
                o0 o0Var = bundle7 == null ? o0.f54938g : (o0) n0.f54930f.b(bundle7);
                Bundle bundle8 = bundle.getBundle(Integer.toString(4, 36));
                return new u0(string7, o0Var, null, q0Var, w0Var, bundle8 == null ? s0.f54981c : (s0) s0.f54982d.b(bundle8));
            case 9:
                m0 m0Var = new m0();
                long j11 = bundle.getLong(Integer.toString(0, 36), 0L);
                wf.a.e(j11 >= 0);
                m0Var.f54925a = j11;
                long j12 = bundle.getLong(Integer.toString(1, 36), Long.MIN_VALUE);
                if (j12 != Long.MIN_VALUE && j12 < 0) {
                    z11 = false;
                }
                wf.a.e(z11);
                m0Var.f54926b = j12;
                m0Var.f54927c = bundle.getBoolean(Integer.toString(2, 36), false);
                m0Var.f54928d = bundle.getBoolean(Integer.toString(3, 36), false);
                m0Var.f54929e = bundle.getBoolean(Integer.toString(4, 36), false);
                return new o0(m0Var);
            case 10:
                return new q0(bundle.getLong(Integer.toString(0, 36), -9223372036854775807L), bundle.getLong(Integer.toString(1, 36), -9223372036854775807L), bundle.getLong(Integer.toString(2, 36), -9223372036854775807L), bundle.getFloat(Integer.toString(3, 36), -3.4028235E38f), bundle.getFloat(Integer.toString(4, 36), -3.4028235E38f));
            case 11:
                mg.l lVar = new mg.l(29, z);
                lVar.f76309b = (Uri) bundle.getParcelable(Integer.toString(0, 36));
                lVar.f76310c = bundle.getString(Integer.toString(1, 36));
                lVar.f76311d = bundle.getBundle(Integer.toString(2, 36));
                return new s0(lVar);
            case 12:
                v0 v0Var = new v0();
                v0Var.f55009a = bundle.getCharSequence(Integer.toString(0, 36));
                v0Var.f55010b = bundle.getCharSequence(Integer.toString(1, 36));
                v0Var.f55011c = bundle.getCharSequence(Integer.toString(2, 36));
                v0Var.f55012d = bundle.getCharSequence(Integer.toString(3, 36));
                v0Var.f55013e = bundle.getCharSequence(Integer.toString(4, 36));
                v0Var.f55014f = bundle.getCharSequence(Integer.toString(5, 36));
                v0Var.f55015g = bundle.getCharSequence(Integer.toString(6, 36));
                byte[] byteArray2 = bundle.getByteArray(Integer.toString(10, 36));
                Integer numValueOf = bundle.containsKey(Integer.toString(29, 36)) ? Integer.valueOf(bundle.getInt(Integer.toString(29, 36))) : null;
                v0Var.f55018j = byteArray2 == null ? null : (byte[]) byteArray2.clone();
                v0Var.f55019k = numValueOf;
                v0Var.f55020l = (Uri) bundle.getParcelable(Integer.toString(11, 36));
                v0Var.f55029w = bundle.getCharSequence(Integer.toString(22, 36));
                v0Var.f55030x = bundle.getCharSequence(Integer.toString(23, 36));
                v0Var.f55031y = bundle.getCharSequence(Integer.toString(24, 36));
                v0Var.B = bundle.getCharSequence(Integer.toString(27, 36));
                v0Var.C = bundle.getCharSequence(Integer.toString(28, 36));
                v0Var.D = bundle.getCharSequence(Integer.toString(30, 36));
                v0Var.E = bundle.getBundle(Integer.toString(1000, 36));
                boolean zContainsKey = bundle.containsKey(Integer.toString(8, 36));
                c cVar = q1.f54970a;
                if (zContainsKey && (bundle3 = bundle.getBundle(Integer.toString(8, 36))) != null) {
                    v0Var.f55016h = (q1) cVar.b(bundle3);
                }
                if (bundle.containsKey(Integer.toString(9, 36)) && (bundle2 = bundle.getBundle(Integer.toString(9, 36))) != null) {
                    v0Var.f55017i = (q1) cVar.b(bundle2);
                }
                if (bundle.containsKey(Integer.toString(12, 36))) {
                    v0Var.f55021m = Integer.valueOf(bundle.getInt(Integer.toString(12, 36)));
                }
                if (bundle.containsKey(Integer.toString(13, 36))) {
                    v0Var.n = Integer.valueOf(bundle.getInt(Integer.toString(13, 36)));
                }
                if (bundle.containsKey(Integer.toString(14, 36))) {
                    v0Var.o = Integer.valueOf(bundle.getInt(Integer.toString(14, 36)));
                }
                if (bundle.containsKey(Integer.toString(15, 36))) {
                    v0Var.f55022p = Boolean.valueOf(bundle.getBoolean(Integer.toString(15, 36)));
                }
                if (bundle.containsKey(Integer.toString(16, 36))) {
                    v0Var.f55023q = Integer.valueOf(bundle.getInt(Integer.toString(16, 36)));
                }
                if (bundle.containsKey(Integer.toString(17, 36))) {
                    v0Var.f55024r = Integer.valueOf(bundle.getInt(Integer.toString(17, 36)));
                }
                if (bundle.containsKey(Integer.toString(18, 36))) {
                    v0Var.f55025s = Integer.valueOf(bundle.getInt(Integer.toString(18, 36)));
                }
                if (bundle.containsKey(Integer.toString(19, 36))) {
                    v0Var.f55026t = Integer.valueOf(bundle.getInt(Integer.toString(19, 36)));
                }
                if (bundle.containsKey(Integer.toString(20, 36))) {
                    v0Var.f55027u = Integer.valueOf(bundle.getInt(Integer.toString(20, 36)));
                }
                if (bundle.containsKey(Integer.toString(21, 36))) {
                    v0Var.f55028v = Integer.valueOf(bundle.getInt(Integer.toString(21, 36)));
                }
                if (bundle.containsKey(Integer.toString(25, 36))) {
                    v0Var.f55032z = Integer.valueOf(bundle.getInt(Integer.toString(25, 36)));
                }
                if (bundle.containsKey(Integer.toString(26, 36))) {
                    v0Var.A = Integer.valueOf(bundle.getInt(Integer.toString(26, 36)));
                }
                return new w0(v0Var);
            case 13:
                wf.a.e(bundle.getInt(Integer.toString(0, 36), -1) == 1);
                float f11 = bundle.getFloat(Integer.toString(1, 36), -1.0f);
                return f11 == -1.0f ? new e1() : new e1(f11);
            case 14:
                int i12 = bundle.getInt(Integer.toString(0, 36), -1);
                if (i12 == 0) {
                    wf.a.e(bundle.getInt(Integer.toString(0, 36), -1) == 0);
                    return bundle.getBoolean(Integer.toString(1, 36), false) ? new l0(bundle.getBoolean(Integer.toString(2, 36), false)) : new l0();
                }
                if (i12 == 1) {
                    wf.a.e(bundle.getInt(Integer.toString(0, 36), -1) == 1);
                    float f12 = bundle.getFloat(Integer.toString(1, 36), -1.0f);
                    return f12 == -1.0f ? new e1() : new e1(f12);
                }
                if (i12 != 2) {
                    if (i12 != 3) {
                        throw new IllegalArgumentException(c0.h(i12, "Unknown RatingType: "));
                    }
                    wf.a.e(bundle.getInt(Integer.toString(0, 36), -1) == 3);
                    return bundle.getBoolean(Integer.toString(1, 36), false) ? new v1(bundle.getBoolean(Integer.toString(2, 36), false)) : new v1();
                }
                wf.a.e(bundle.getInt(Integer.toString(0, 36), -1) == 2);
                int i13 = bundle.getInt(Integer.toString(1, 36), 5);
                float f13 = bundle.getFloat(Integer.toString(2, 36), -1.0f);
                return f13 == -1.0f ? new t1(i13) : new t1(i13, f13);
            case 15:
                wf.a.e(bundle.getInt(Integer.toString(0, 36), -1) == 2);
                int i14 = bundle.getInt(Integer.toString(1, 36), 5);
                float f14 = bundle.getFloat(Integer.toString(2, 36), -1.0f);
                return f14 == -1.0f ? new t1(i14) : new t1(i14, f14);
            case 16:
                wf.a.e(bundle.getInt(Integer.toString(0, 36), -1) == 3);
                return bundle.getBoolean(Integer.toString(1, 36), false) ? new v1(bundle.getBoolean(Integer.toString(2, 36), false)) : new v1();
            case 17:
                int i15 = bundle.getInt(Integer.toString(0, 36), 0);
                long j13 = bundle.getLong(Integer.toString(1, 36), -9223372036854775807L);
                long j14 = bundle.getLong(Integer.toString(2, 36), 0L);
                boolean z12 = bundle.getBoolean(Integer.toString(3, 36));
                Bundle bundle9 = bundle.getBundle(Integer.toString(4, 36));
                hf.b bVar = bundle9 != null ? (hf.b) hf.b.f59847h.b(bundle9) : hf.b.f59845f;
                x1 x1Var = new x1();
                x1Var.h(null, null, i15, j13, j14, bVar, z12);
                return x1Var;
            case 18:
                Bundle bundle10 = bundle.getBundle(Integer.toString(1, 36));
                u0 u0Var = bundle10 != null ? (u0) u0.f54992g.b(bundle10) : null;
                long j15 = bundle.getLong(Integer.toString(2, 36), -9223372036854775807L);
                long j16 = bundle.getLong(Integer.toString(3, 36), -9223372036854775807L);
                long j17 = bundle.getLong(Integer.toString(4, 36), -9223372036854775807L);
                boolean z13 = bundle.getBoolean(Integer.toString(5, 36), false);
                boolean z14 = bundle.getBoolean(Integer.toString(6, 36), false);
                Bundle bundle11 = bundle.getBundle(Integer.toString(7, 36));
                q0 q0Var2 = bundle11 != null ? new q0(bundle11.getLong(Integer.toString(0, 36), -9223372036854775807L), bundle11.getLong(Integer.toString(1, 36), -9223372036854775807L), bundle11.getLong(Integer.toString(2, 36), -9223372036854775807L), bundle11.getFloat(Integer.toString(3, 36), -3.4028235E38f), bundle11.getFloat(Integer.toString(4, 36), -3.4028235E38f)) : null;
                boolean z15 = bundle.getBoolean(Integer.toString(8, 36), false);
                long j18 = bundle.getLong(Integer.toString(9, 36), 0L);
                long j19 = bundle.getLong(Integer.toString(10, 36), -9223372036854775807L);
                int i16 = bundle.getInt(Integer.toString(11, 36), 0);
                int i17 = bundle.getInt(Integer.toString(12, 36), 0);
                long j21 = bundle.getLong(Integer.toString(13, 36), 0L);
                y1 y1Var = new y1();
                y1Var.b(y1.f55096r, u0Var, j15, j16, j17, z13, z14, q0Var2, j18, j19, i16, i17, j21);
                y1Var.f55108k = z15;
                return y1Var;
            default:
                Bundle bundle12 = bundle.getBundle(Integer.toString(0, 36));
                bundle12.getClass();
                ArrayList parcelableArrayList = bundle12.getParcelableArrayList(Integer.toString(0, 36));
                if (parcelableArrayList == null) {
                    xk.l0 l0Var = xk.v0.f96030b;
                    r2VarS = r2.f96007e;
                } else {
                    r2VarS = wf.a.s(k0.H, parcelableArrayList);
                }
                x0 x0Var = new x0(bundle12.getString(Integer.toString(1, 36), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), (k0[]) r2VarS.toArray(new k0[0]));
                int[] intArray = bundle.getIntArray(Integer.toString(1, 36));
                int i18 = x0Var.f57655a;
                return new a2(x0Var, bundle.getBoolean(Integer.toString(4, 36), false), (int[]) b0.n(intArray, new int[i18]), (boolean[]) b0.n(bundle.getBooleanArray(Integer.toString(3, 36)), new boolean[i18]));
        }
    }

    @Override // o9.z1
    public void c(fa.p pVar) {
        switch (this.f52857a) {
            case 1:
                pVar.getClass();
                break;
            default:
                pVar.getClass();
                break;
        }
    }

    @Override // w60.a
    public Object get() {
        return ir.h.f68013a;
    }

    @Override // wf.e
    public void invoke(Object obj) {
        switch (this.f52857a) {
            case 3:
                ((j1) obj).onPlayerError(new ExoPlaybackException(2, new ExoTimeoutException("Player release timed out."), BackupConstant.SCENE_CLOSED_WITHOUT_SHOW));
                break;
            case 4:
                ((j1) obj).onSeekProcessed();
                break;
            case 5:
                ((j1) obj).onRenderedFirstFrame();
                break;
            case 22:
                ((ge.b) obj).getClass();
                break;
            case 23:
                ((ge.b) obj).getClass();
                break;
            case 24:
                ((ge.b) obj).getClass();
                break;
            case 25:
                ((ge.b) obj).getClass();
                break;
            case 26:
                ((ge.b) obj).getClass();
                break;
            case 27:
                ((ge.b) obj).getClass();
                break;
            case 28:
                ((ge.b) obj).getClass();
                break;
            default:
                ((ge.b) obj).getClass();
                break;
        }
    }

    public /* synthetic */ c(ArrayList arrayList) {
        this.f52857a = 2;
    }
}
