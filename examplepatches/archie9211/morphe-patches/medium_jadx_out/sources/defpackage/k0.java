package defpackage;

import android.app.AlertDialog;
import com.medium.android.data.settings.Frequency;
import com.medium.android.digest.ui.digesthistory.DigestHistoryDialogFragment;
import com.medium.android.search.ui.main.SearchFragment;
import com.medium.proto.event.AppCustomIconSelected;
import com.medium.proto.event.AppIconName;
import com.medium.proto.event.DigestHistorySelected;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class k0 extends x55 implements x45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ k0(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Object[] objArr;
        Object[] objArr2;
        int i;
        Object next;
        int i2 = this.a;
        int i3 = 2;
        int i4 = 0;
        int i5 = 1;
        Object[] objArr3 = 0;
        Object[] objArr4 = 0;
        Object[] objArr5 = 0;
        Object[] objArr6 = 0;
        Object[] objArr7 = 0;
        Object[] objArr8 = 0;
        Object[] objArr9 = 0;
        Object[] objArr10 = 0;
        Object[] objArr11 = 0;
        Object[] objArr12 = 0;
        c1e c1eVar = c1e.a;
        switch (i2) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                r0 r0Var = (r0) this.receiver;
                p68 p68Var = r0Var.E;
                if (zBooleanValue) {
                    r0Var.T0();
                } else {
                    if (r0Var.q != null) {
                        Object[] objArr13 = p68Var.c;
                        long[] jArr = p68Var.a;
                        int length = jArr.length - 2;
                        if (length >= 0) {
                            int i6 = 0;
                            while (true) {
                                long j = jArr[i6];
                                if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                                    int i7 = 8;
                                    int i8 = 8 - ((~(i6 - length)) >>> 31);
                                    int i9 = 0;
                                    while (i9 < i8) {
                                        if ((j & 255) < 128) {
                                            i = i7;
                                            objArr2 = objArr13;
                                            vx0.c0(r0Var.u0(), null, null, new p0(r0Var, (h0a) objArr13[(i6 << 3) + i9], objArr4 == true ? 1 : 0, i4), 3);
                                        } else {
                                            objArr2 = objArr13;
                                            i = i7;
                                        }
                                        j >>= i;
                                        i9++;
                                        i7 = i;
                                        objArr13 = objArr2;
                                    }
                                    objArr = objArr13;
                                    if (i8 == i7) {
                                    }
                                } else {
                                    objArr = objArr13;
                                }
                                if (i6 != length) {
                                    i6++;
                                    objArr13 = objArr;
                                }
                            }
                        }
                        h0a h0aVar = r0Var.G;
                        if (h0aVar != null) {
                            vx0.c0(r0Var.u0(), null, null, new p0(r0Var, h0aVar, objArr3 == true ? 1 : 0, 1), 3);
                        }
                    }
                    p68Var.a();
                    r0Var.G = null;
                    r0Var.U0();
                }
                return c1eVar;
            case 1:
                aa2 aa2Var = (aa2) obj;
                aa2Var.getClass();
                wb wbVar = (wb) this.receiver;
                wbVar.getClass();
                vx0.c0(f76.F(wbVar), null, null, new j0(wbVar, aa2Var, objArr5 == true ? 1 : 0, 5), 3);
                return c1eVar;
            case 2:
                rv2 rv2Var = (rv2) obj;
                rv2Var.getClass();
                cb0 cb0Var = (cb0) this.receiver;
                cb0Var.getClass();
                lb0 lb0Var = cb0Var.a;
                vx0.c0(f76.F(lb0Var), null, null, new j0(lb0Var, rv2Var, objArr6 == true ? 1 : 0, 21), 3);
                return c1eVar;
            case 3:
                String str = (String) obj;
                str.getClass();
                ((y01) this.receiver).getClass();
                return y01.a(str);
            case 4:
                rg1 rg1Var = (rg1) obj;
                rg1Var.getClass();
                aj1 aj1Var = (aj1) this.receiver;
                aj1Var.getClass();
                fub fubVar = aj1Var.b;
                String str2 = rg1Var.a;
                String str3 = rg1Var.n;
                str2.getClass();
                SearchFragment searchFragment = ((htb) fubVar.b).a;
                ((p13) searchFragment.Z()).w0(searchFragment.S(), str2, str3);
                return c1eVar;
            case 5:
                rg1 rg1Var2 = (rg1) obj;
                rg1Var2.getClass();
                aj1 aj1Var2 = (aj1) this.receiver;
                aj1Var2.getClass();
                new AlertDialog.Builder(aj1Var2.c).setTitle(R.string.lists_catalog_detail_make_list_private_warning_title).setMessage(R.string.lists_catalog_detail_make_list_private_warning_description).setPositiveButton(R.string.lists_catalog_detail_make_list_private_warning_positive, new zi1(aj1Var2.a, i4, rg1Var2)).setNegativeButton(R.string.common_cancel, new i60(1)).show();
                return c1eVar;
            case 6:
                boolean zBooleanValue2 = ((Boolean) obj).booleanValue();
                we2 we2Var = ((xd2) this.receiver).b;
                we2Var.f = zBooleanValue2;
                vx0.c0(f76.F(we2Var), null, null, new ve2(we2Var, objArr7 == true ? 1 : 0, i5), 3);
                return c1eVar;
            case 7:
                AppIconName appIconName = (AppIconName) obj;
                appIconName.getClass();
                sl2 sl2Var = (sl2) this.receiver;
                sl2Var.getClass();
                cx2 cx2Var = sl2Var.d;
                String str4 = sl2Var.e;
                String str5 = sl2Var.f;
                String str6 = sl2Var.b;
                cx2Var.getClass();
                str4.getClass();
                str5.getClass();
                str6.getClass();
                rqd.a(cx2Var.a, new AppCustomIconSelected(null, appIconName, null, 5, null), str6, str5, false, null, str4, 24);
                return c1eVar;
            case 8:
                String str7 = (String) obj;
                str7.getClass();
                return ((w83) this.receiver).n(str7);
            case 9:
                n98 n98Var = (n98) obj;
                n98Var.getClass();
                return ((s93) this.receiver).x0(n98Var);
            case 10:
                sn6 sn6Var = (sn6) obj;
                sn6Var.getClass();
                return new q93((s93) this.receiver, sn6Var);
            case 11:
                String str8 = (String) obj;
                str8.getClass();
                nc3 nc3Var = (nc3) this.receiver;
                nc3Var.getClass();
                wc3 wc3Var = nc3Var.b;
                if (!str8.equals(wc3Var.b)) {
                    qy2 qy2Var = wc3Var.h;
                    String str9 = wc3Var.c;
                    String str10 = wc3Var.d;
                    String str11 = wc3Var.e;
                    qy2Var.getClass();
                    str9.getClass();
                    str10.getClass();
                    str11.getClass();
                    rqd.a(qy2Var.a, new DigestHistorySelected(null, str8, null, 5, null), str9, str10, false, null, str11, 24);
                    dd3 dd3Var = wc3Var.g;
                    dd3Var.getClass();
                    dd3Var.b.m(null, str8);
                }
                k40.X((DigestHistoryDialogFragment) nc3Var.a.b).f();
                return c1eVar;
            case 12:
                Frequency frequency = (Frequency) obj;
                frequency.getClass();
                ce3 ce3Var = (ce3) this.receiver;
                ce3Var.getClass();
                vx0.c0(f76.F(ce3Var), null, null, new r91(ce3Var, frequency, objArr8 == true ? 1 : 0, 25), 3);
                return c1eVar;
            case 13:
                boolean zBooleanValue3 = ((Boolean) obj).booleanValue();
                ph3 ph3Var = ((ah3) this.receiver).a;
                ph3Var.getClass();
                vx0.c0(f76.F(ph3Var), null, null, new wd0((Object) ph3Var, zBooleanValue3, (n92) (objArr9 == true ? 1 : 0), i5), 3);
                return c1eVar;
            case 14:
                ((uld) this.receiver).d((Throwable) obj);
                return c1eVar;
            case 15:
                uid uidVar = (uid) obj;
                uidVar.getClass();
                ju3 ju3Var = ((nt3) this.receiver).a;
                vx0.c0(f76.F(ju3Var), null, null, new hu3(ju3Var, uidVar, objArr10 == true ? 1 : 0, i4), 3);
                return c1eVar;
            case 16:
                uid uidVar2 = (uid) obj;
                uidVar2.getClass();
                ju3 ju3Var2 = ((nt3) this.receiver).a;
                vx0.c0(f76.F(ju3Var2), null, null, new hu3(ju3Var2, uidVar2, objArr11 == true ? 1 : 0, i5), 3);
                return c1eVar;
            case 17:
                String str12 = (String) obj;
                str12.getClass();
                hub hubVar = (hub) this.receiver;
                hubVar.getClass();
                gvb gvbVar = hubVar.b;
                gvbVar.c.a(str12);
                xpc xpcVar = gvbVar.g;
                uid uidVar3 = new uid(str12, 6, 0L);
                xpcVar.getClass();
                xpcVar.m(null, uidVar3);
                xpc xpcVar2 = gvbVar.h;
                Boolean bool = Boolean.FALSE;
                xpcVar2.getClass();
                xpcVar2.m(null, bool);
                return c1eVar;
            case 18:
                String str13 = (String) obj;
                str13.getClass();
                hub hubVar2 = (hub) this.receiver;
                hubVar2.getClass();
                bub bubVar = hubVar2.b.c;
                bubVar.getClass();
                pu7 pu7Var = bubVar.b;
                pu7Var.getClass();
                ek6 ek6Var = ek6.SEARCH_HISTORY;
                ku7 ku7Var = pu7.j;
                Collection collection = (List) p2.h(pu7Var, ek6Var, ku7Var, null, 4, null);
                if (collection == null) {
                    collection = ey3.a;
                }
                ArrayList arrayList = new ArrayList(collection);
                arrayList.remove(str13);
                pu7Var.y(ek6Var, arrayList, ku7Var);
                return c1eVar;
            case 19:
                ((x45) this.receiver).invoke((String) obj);
                return c1eVar;
            case 20:
                Set set = (Set) obj;
                set.getClass();
                v76 v76Var = (v76) this.receiver;
                ReentrantLock reentrantLock = v76Var.d;
                reentrantLock.lock();
                try {
                    List<nn8> listM1 = bu1.m1(v76Var.c.values());
                    reentrantLock.unlock();
                    for (nn8 nn8Var : listM1) {
                        nn8Var.getClass();
                        int[] iArr = nn8Var.b;
                        int length2 = iArr.length;
                        Set setK = ny3.a;
                        if (length2 != 0) {
                            if (length2 != 1) {
                                p1c p1cVar = new p1c();
                                int length3 = iArr.length;
                                int i10 = 0;
                                int i11 = 0;
                                while (i10 < length3) {
                                    int i12 = i11 + 1;
                                    if (set.contains(Integer.valueOf(iArr[i10]))) {
                                        p1cVar.add(nn8Var.c[i11]);
                                    }
                                    i10++;
                                    i11 = i12;
                                }
                                setK = qo7.k(p1cVar);
                            } else if (set.contains(Integer.valueOf(iArr[0]))) {
                                setK = nn8Var.d;
                            }
                        }
                        if (!setK.isEmpty()) {
                            nn8Var.a.a(setK);
                        }
                    }
                    return c1eVar;
                } catch (Throwable th) {
                    reentrantLock.unlock();
                    throw th;
                }
            case 21:
                ((xa6) this.receiver).m((Throwable) obj);
                return c1eVar;
            case 22:
                qn6 qn6Var = (qn6) obj;
                qn6Var.getClass();
                return ((rn6) this.receiver).a(qn6Var);
            case 23:
                n98 n98Var2 = (n98) obj;
                n98Var2.getClass();
                return ((gs6) this.receiver).N(n98Var2);
            case 24:
                n98 n98Var3 = (n98) obj;
                n98Var3.getClass();
                return ((gs6) this.receiver).O(n98Var3);
            case 25:
                long j2 = ((ip8) obj).a;
                uu6 uu6Var = (uu6) this.receiver;
                Iterator it2 = uu6Var.b.j().k.iterator();
                while (true) {
                    if (it2.hasNext()) {
                        next = it2.next();
                        dv6 dv6Var = (dv6) next;
                        int i13 = dv6Var.o;
                        int i14 = dv6Var.p + i13;
                        int iIntBitsToFloat = (int) Float.intBitsToFloat((int) (4294967295L & j2));
                        if (i13 > iIntBitsToFloat || iIntBitsToFloat > i14) {
                        }
                    } else {
                        next = null;
                    }
                }
                dv6 dv6Var2 = (dv6) next;
                if (dv6Var2 != null) {
                    Object obj2 = dv6Var2.l;
                    tu6 tu6Var = obj2 instanceof tu6 ? (tu6) obj2 : null;
                    if (tu6Var != null) {
                        uu6Var.h = dv6Var2;
                        uu6Var.e.setValue(Integer.valueOf(tu6Var.a));
                    }
                }
                return c1eVar;
            case 26:
                String str14 = (String) obj;
                str14.getClass();
                ((x87) this.receiver).a(str14);
                return c1eVar;
            case 27:
                String str15 = (String) obj;
                str15.getClass();
                ((x87) this.receiver).a(str15);
                return c1eVar;
            case 28:
                rg1 rg1Var3 = (rg1) obj;
                rg1Var3.getClass();
                i98 i98Var = (i98) this.receiver;
                i98Var.getClass();
                i98Var.b.f(rg1Var3.a, rg1Var3.n);
                return c1eVar;
            default:
                rg1 rg1Var4 = (rg1) obj;
                rg1Var4.getClass();
                i98 i98Var2 = (i98) this.receiver;
                i98Var2.getClass();
                m98 m98Var = i98Var2.a;
                vx0.c0(f76.F(m98Var), null, null, new fde(m98Var, rg1Var4, objArr12 == true ? 1 : 0, i3), 3);
                return c1eVar;
        }
    }
}
