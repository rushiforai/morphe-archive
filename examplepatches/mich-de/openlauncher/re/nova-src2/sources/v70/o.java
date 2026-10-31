package v70;

import android.database.Cursor;
import android.os.Build;
import androidx.compose.ui.node.LayoutNode;
import b.c0;
import com.android.launcher3.folder.Folder;
import com.google.android.gms.internal.measurement.v6;
import com.vungle.ads.internal.protos.Sdk;
import e10.j2;
import io.branch.search.internal.Jf;
import java.io.BufferedInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.RandomAccess;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;
import org.jf.dexlib2.dexbacked.DexBackedDexFile$NotADexFile;
import org.jf.dexlib2.util.DexUtil$InvalidFile;
import org.jf.dexlib2.util.DexUtil$UnsupportedFile;
import t70.k0;
import t70.y0;
import x80.f0;
import xk.c1;
import xk.d1;
import xk.h0;
import xk.j0;
import xk.m0;
import xk.m2;
import xk.n2;
import xk.q1;
import xk.s1;
import xk.u1;
import xk.v0;
import xk.w1;
import xk.x1;
import xk.z2;

/* loaded from: classes.dex */
public abstract class o {
    public static final i a(int i5, a aVar, Jf.c cVar) {
        if (i5 == -2) {
            if (aVar != a.f92141a) {
                return new t(1, aVar, cVar);
            }
            m.f92191rp.getClass();
            return new i(l.f92190b, cVar);
        }
        if (i5 != -1) {
            return i5 != 0 ? i5 != Integer.MAX_VALUE ? aVar == a.f92141a ? new i(i5, cVar) : new t(i5, aVar, cVar) : new i(LayoutNode.NotPlacedPlaceOrder, cVar) : aVar == a.f92141a ? new i(0, cVar) : new t(1, aVar, cVar);
        }
        if (aVar == a.f92141a) {
            return new t(1, a.f92142b, cVar);
        }
        throw new IllegalArgumentException("CONFLATED capacity cannot be used with non-default onBufferOverflow");
    }

    public static /* synthetic */ i b(int i5, int i11, a aVar) {
        if ((i11 & 1) != 0) {
            i5 = 0;
        }
        if ((i11 & 2) != 0) {
            aVar = a.f92141a;
        }
        return a(i5, aVar, null);
    }

    public static y3.d c() {
        return new y3.d(1.0f, 1.0f);
    }

    public static f0 d(String str) throws IOException {
        if (str.equals("http/1.0")) {
            return f0.HTTP_1_0;
        }
        if (str.equals("http/1.1")) {
            return f0.HTTP_1_1;
        }
        if (str.equals("h2_prior_knowledge")) {
            return f0.H2_PRIOR_KNOWLEDGE;
        }
        if (str.equals("h2")) {
            return f0.HTTP_2;
        }
        if (str.equals("spdy/3.1")) {
            return f0.SPDY_3;
        }
        if (str.equals("quic")) {
            return f0.QUIC;
        }
        throw new IOException("Unexpected protocol: ".concat(str));
    }

    public static final int e(Cursor c11, String str) {
        Intrinsics.g(c11, "c");
        int columnIndex = c11.getColumnIndex(str);
        if (columnIndex >= 0) {
            return columnIndex;
        }
        int columnIndex2 = c11.getColumnIndex("`" + str + '`');
        if (columnIndex2 >= 0) {
            return columnIndex2;
        }
        return -1;
    }

    public static final int f(Cursor c11, String str) {
        String strO0;
        Intrinsics.g(c11, "c");
        int iE = e(c11, str);
        if (iE >= 0) {
            return iE;
        }
        try {
            String[] columnNames = c11.getColumnNames();
            Intrinsics.f(columnNames, "c.columnNames");
            strO0 = kotlin.collections.c.O0(columnNames, null, null, null, null, 63);
        } catch (Exception unused) {
            strO0 = "unknown";
        }
        throw new IllegalArgumentException(c0.m("column '", str, "' does not exist. Available columns: ", strO0));
    }

    /* JADX WARN: Removed duplicated region for block: B:53:0x00d6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Integer g(BufferedInputStream bufferedInputStream) throws IOException {
        Iterable cVar;
        Iterable eVar;
        ja0.g gVar;
        ja0.f fVar;
        boolean z11;
        List x1Var;
        int i5;
        Object obj;
        boolean z12;
        int i11;
        int i12 = Build.VERSION.SDK_INT;
        if (i12 > 33) {
            i12 = 33;
        }
        fa0.d dVar = new fa0.d();
        dVar.f54578c = new fa0.c[256];
        int i13 = -1;
        if (i12 >= 21) {
            dVar.f54576a = i12;
            if (i12 >= 19) {
                switch (i12) {
                    case 19:
                    case 20:
                        i11 = 7;
                        break;
                    case 21:
                        i11 = 39;
                        break;
                    case 22:
                        i11 = 45;
                        break;
                    case 23:
                        i11 = 64;
                        break;
                    case 24:
                    case 25:
                        i11 = 79;
                        break;
                    case 26:
                        i11 = Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE;
                        break;
                    case 27:
                        i11 = Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE;
                        break;
                    case 28:
                        i11 = Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE;
                        break;
                    case 29:
                        i11 = 170;
                        break;
                    default:
                        i11 = 178;
                        break;
                }
            } else {
                i11 = -1;
            }
            dVar.f54577b = i11;
        } else {
            dVar.f54576a = i12;
            dVar.f54577b = -1;
        }
        dVar.f54579d = new EnumMap(fa0.c.class);
        dVar.f54580e = new HashMap();
        int i14 = dVar.f54577b;
        if (i14 == -1) {
            i14 = dVar.f54576a;
        }
        fa0.c[] cVarArrValues = fa0.c.values();
        int length = cVarArrValues.length;
        int i15 = 0;
        while (true) {
            int i16 = 2;
            if (i15 >= length) {
                if (!bufferedInputStream.markSupported()) {
                    throw new IllegalArgumentException("InputStream must support mark");
                }
                bufferedInputStream.mark(44);
                byte[] bArr = new byte[44];
                try {
                    try {
                        zk.f.b(bufferedInputStream, bArr);
                        bufferedInputStream.reset();
                        int iA = ka0.a.a(bArr);
                        if (iA == -1) {
                            StringBuilder sb2 = new StringBuilder("Not a valid dex magic value:");
                            for (int i17 = 0; i17 < 8; i17++) {
                                sb2.append(String.format(" %02x", Byte.valueOf(bArr[i17])));
                            }
                            throw new DexBackedDexFile$NotADexFile(sb2.toString());
                        }
                        switch (iA) {
                            case 35:
                            case 37:
                            case 38:
                            case 39:
                                int i18 = (bArr[43] << 24) | (bArr[40] & 255) | ((bArr[41] & 255) << 8) | ((bArr[42] & 255) << 16);
                                if (i18 == 2018915346) {
                                    throw new DexUtil$UnsupportedFile("Big endian dex files are not supported");
                                }
                                if (i18 != 305419896) {
                                    throw new DexUtil$InvalidFile(String.format("Invalid endian tag: 0x%x", Integer.valueOf(i18)));
                                }
                                ma0.i iVar = new ma0.i(new hn.m(new ja0.m(dVar, zk.f.c(bufferedInputStream)), i16), 0);
                                while (true) {
                                    if (iVar.hasNext()) {
                                        ja0.h hVar = (ja0.h) iVar.next();
                                        if ("Landroid/view/IWindowSession$Stub;".equals(hVar.toString())) {
                                            int i19 = hVar.f69331f;
                                            bg.e eVar2 = hVar.f69330e;
                                            ja0.m mVar = hVar.f69328c;
                                            v6 v6Var = mVar.f69343b;
                                            int i21 = hVar.f69333h;
                                            if (i21 > 0) {
                                                v6Var.getClass();
                                                ma0.e eVarZ = hVar.Z();
                                                int iY = mVar.f69342a.y(hVar.f69329d + 28);
                                                if (eVar2 == null) {
                                                    fVar = null;
                                                } else {
                                                    ja0.h hVar2 = (ja0.h) eVar2.f17884c;
                                                    fVar = new ja0.f(eVar2, hVar2.f69328c.f69343b, eVar2.f17882a, hVar2.f69333h);
                                                }
                                                cVar = new ja0.c(hVar, eVarZ, iY, i19, fVar);
                                            } else {
                                                hVar.f69332g = i19;
                                                int i22 = d1.f95891c;
                                                cVar = z2.f96074j;
                                            }
                                            if (hVar.f69334i > 0) {
                                                int i23 = hVar.f69332g;
                                                if (i23 <= 0) {
                                                    v6Var.getClass();
                                                    fa.t tVar = new fa.t(v6Var, i19);
                                                    for (int i24 = 0; i24 < i21; i24++) {
                                                        tVar.p();
                                                        tVar.p();
                                                    }
                                                    i23 = tVar.f54485a;
                                                    hVar.f69332g = i23;
                                                }
                                                v6Var.getClass();
                                                ma0.e eVarZ2 = hVar.Z();
                                                if (eVar2 == null) {
                                                    gVar = null;
                                                } else {
                                                    ja0.h hVar3 = (ja0.h) eVar2.f17884c;
                                                    v6 v6Var2 = hVar3.f69328c.f69343b;
                                                    if (eVar2.f17883b == 0) {
                                                        int i25 = eVar2.f17882a;
                                                        v6Var2.getClass();
                                                        fa.t tVar2 = new fa.t(v6Var2, i25);
                                                        for (int i26 = 0; i26 < hVar3.f69333h; i26++) {
                                                            tVar2.m(false);
                                                        }
                                                        eVar2.f17883b = tVar2.f54485a;
                                                    }
                                                    gVar = new ja0.g(eVar2, v6Var2, eVar2.f17883b, hVar3.f69334i, 0);
                                                }
                                                eVar = new ja0.e(hVar, eVarZ2, i23, gVar);
                                            } else {
                                                int i27 = d1.f95891c;
                                                eVar = z2.f96074j;
                                            }
                                            Iterable[] iterableArr = {cVar, eVar};
                                            for (int i28 = 0; i28 < 2; i28++) {
                                                iterableArr[i28].getClass();
                                            }
                                            Iterator it = new m0(iterableArr).iterator();
                                            while (true) {
                                                q1 q1Var = (q1) it;
                                                if (q1Var.hasNext()) {
                                                    ja0.n nVar = (ja0.n) q1Var.next();
                                                    if (nVar.b0().equals("TRANSACTION_setWallpaperZoomOut")) {
                                                        ra0.a aVar = nVar.f69366e;
                                                        ta0.f fVar2 = aVar instanceof ta0.f ? (ta0.f) aVar : null;
                                                        if (fVar2 != null) {
                                                            return Integer.valueOf(fVar2.f88941a);
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                return null;
                            case 36:
                            default:
                                throw new DexUtil$UnsupportedFile(String.format("Dex version %03d is not supported", Integer.valueOf(iA)));
                        }
                    } catch (EOFException unused) {
                        throw new DexBackedDexFile$NotADexFile("File is too short");
                    }
                } catch (Throwable th2) {
                    bufferedInputStream.reset();
                    throw th2;
                }
            }
            fa0.c cVar2 = cVarArrValues[i15];
            c1 c1Var = dVar.f54577b != i13 ? cVar2.f54573b : cVar2.f54572a;
            Integer numValueOf = Integer.valueOf(i14);
            v0 v0Var = c1Var.f95884a;
            n2 n2Var = n2.f95978c;
            h0 h0Var = new h0(numValueOf, i16);
            m2 m2Var = m2.f95966a;
            if (v0Var != null) {
                z11 = true;
                x1Var = new w1(v0Var, m2Var);
            } else {
                z11 = true;
                x1Var = new x1(v0Var, m2Var);
            }
            if (!(x1Var instanceof RandomAccess)) {
                x1Var = new ArrayList(x1Var);
            }
            int size = x1Var.size() - 1;
            int i29 = 0;
            while (true) {
                if (i29 <= size) {
                    int i31 = (i29 + size) >>> 1;
                    Comparable comparable = (Comparable) x1Var.get(i31);
                    comparable.getClass();
                    int iA2 = h0Var.compareTo((j0) comparable);
                    if (iA2 < 0) {
                        size = i31 - 1;
                    } else if (iA2 > 0) {
                        i29 = i31 + 1;
                    } else {
                        x1Var.subList(i29, size + 1);
                        i5 = (i31 - i29) + i29;
                    }
                } else {
                    i5 = i29 - 1;
                }
            }
            if (i5 == -1) {
                obj = null;
            } else {
                n2 n2Var2 = (n2) v0Var.get(i5);
                n2Var2.getClass();
                if (n2Var2.f95979a.d(numValueOf) && !n2Var2.f95980b.d(numValueOf)) {
                    obj = c1Var.f95885b.get(i5);
                }
            }
            Short sh = (Short) obj;
            if (sh != null) {
                switch (cVar2.f54575d) {
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                    case 9:
                    case 10:
                    case 11:
                    case 12:
                    case 13:
                    case 14:
                    case 15:
                    case 16:
                    case 17:
                    case 18:
                    case 19:
                    case 20:
                    case 21:
                    case 22:
                    case 23:
                    case 24:
                    case 25:
                    case 26:
                    case 27:
                    case 28:
                    case 29:
                    case 30:
                    case 31:
                    case 32:
                    case 33:
                    case 37:
                        z12 = false;
                        break;
                    case 34:
                    case 35:
                    case 36:
                        z12 = z11;
                        break;
                    default:
                        throw null;
                }
                if (!z12) {
                    ((fa0.c[]) dVar.f54578c)[sh.shortValue()] = cVar2;
                }
                ((EnumMap) dVar.f54579d).put((EnumMap) cVar2, (fa0.c) sh);
                ((HashMap) dVar.f54580e).put(cVar2.f54574c.toLowerCase(), cVar2);
            }
            i15++;
            i13 = -1;
        }
    }

    public static final y5.f h(String name) {
        Intrinsics.g(name, "name");
        return new y5.f(name);
    }

    public static ArrayList i(Object... objArr) {
        int length = objArr.length;
        w20.e.e(length, "arraySize");
        ArrayList arrayList = new ArrayList(ul.b.a0(length + 5 + (length / 10)));
        Collections.addAll(arrayList, objArr);
        return arrayList;
    }

    public static x5.b j(String name, v6 v6Var, dm.a aVar, int i5) {
        if ((i5 & 2) != 0) {
            v6Var = null;
        }
        Function1 function1 = aVar;
        if ((i5 & 4) != 0) {
            function1 = x5.a.f95094j;
        }
        a80.e eVar = y0.f88884a;
        y70.d dVarA = k0.a(a80.d.f488c.plus(t70.m0.d()));
        Intrinsics.g(name, "name");
        return new x5.b(name, v6Var, function1, dVarA);
    }

    public static List k(List list) {
        return list instanceof v0 ? ((v0) list).u() : list instanceof u1 ? ((u1) list).c() : list instanceof RandomAccess ? new s1(list) : new u1(list);
    }

    /* JADX WARN: Type inference failed for: r3v4, types: [kotlin.coroutines.jvm.internal.RestrictedSuspendLambda, kotlin.jvm.functions.Function2] */
    public static final void l(iz.b bVar) {
        Iterable iterableD1;
        y9.i iVar = new y9.i(0);
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (Object obj : bVar) {
            if (((ga.j) obj).f57299k != -100) {
                arrayList.add(obj);
            } else {
                arrayList2.add(obj);
            }
        }
        if (arrayList2.isEmpty()) {
            return;
        }
        q70.c cVarO = u90.b.O(new SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1(new q70.g(b70.g.M0(arrayList), new j2(iVar, 14), null)).f71969a);
        while (true) {
            if (cVarO.hasNext()) {
                if (!((Boolean) cVarO.next()).booleanValue()) {
                    iterableD1 = b70.g.t1(b70.g.D1(iVar, arrayList2), arrayList);
                    break;
                }
            } else {
                iterableD1 = b70.g.D1(iVar, bVar);
                break;
            }
        }
        int i5 = 0;
        for (Object obj2 : iterableD1) {
            int i11 = i5 + 1;
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            ((ga.j) obj2).f57299k = i5;
            i5 = i11;
        }
        b70.c.y0(bVar, Folder.f21094k0);
    }

    public static final y5.f m(String name) {
        Intrinsics.g(name, "name");
        return new y5.f(name);
    }

    public static final y5.f n(String name) {
        Intrinsics.g(name, "name");
        return new y5.f(name);
    }
}
