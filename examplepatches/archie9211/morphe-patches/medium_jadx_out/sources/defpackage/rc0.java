package defpackage;

import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.navigation.NotificationFilterType;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.proto.event.DigestViewed;
import com.medium.proto.event.SignUpSignInRememberMeAccountHintViewed;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicReference;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rc0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rc0(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = obj;
        this.d = obj2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                return new rc0((wc0) this.c, (ld0) obj2, n92Var, 0);
            case 1:
                return new rc0((gc1) this.c, (l78) obj2, n92Var, 1);
            case 2:
                return new rc0((id1) this.c, (String) obj2, n92Var, 2);
            case 3:
                return new rc0((si1) this.c, (upc) obj2, n92Var, 3);
            case 4:
                return new rc0((hu1) this.c, (upc) obj2, n92Var, 4);
            case 5:
                rc0 rc0Var = new rc0((il2) obj2, n92Var, 5);
                rc0Var.c = obj;
                return rc0Var;
            case 6:
                return new rc0((sl2) this.c, (l78) obj2, n92Var, 6);
            case 7:
                rc0 rc0Var2 = new rc0((rpc) obj2, n92Var, 7);
                rc0Var2.c = obj;
                return rc0Var2;
            case 8:
                return new rc0((ld3) this.c, (ie3) obj2, n92Var, 8);
            case 9:
                return new rc0((EditPostFragment) this.c, (l78) obj2, n92Var, 9);
            case 10:
                return new rc0((ht3) this.c, (String) obj2, n92Var, 10);
            case 11:
                return new rc0((ht3) this.c, (rg1) obj2, n92Var, 11);
            case 12:
                return new rc0((hub) this.c, (upc) obj2, n92Var, 12);
            case 13:
                return new rc0((x64) this.c, (l64) obj2, n92Var, 13);
            case 14:
                rc0 rc0Var3 = new rc0((fj4) obj2, n92Var, 14);
                rc0Var3.c = obj;
                return rc0Var3;
            case 15:
                return new rc0((dm4) this.c, (Map) obj2, n92Var, 15);
            case 16:
                return new rc0((no5) this.c, (upc) obj2, n92Var, 16);
            case 17:
                rc0 rc0Var4 = new rc0((ap5) obj2, n92Var, 17);
                rc0Var4.c = obj;
                return rc0Var4;
            case 18:
                return new rc0((jp5) this.c, (upc) obj2, n92Var, 18);
            case 19:
                rc0 rc0Var5 = new rc0((bq5) obj2, n92Var, 19);
                rc0Var5.c = obj;
                return rc0Var5;
            case 20:
                rc0 rc0Var6 = new rc0((m45) obj2, n92Var, 20);
                rc0Var6.c = obj;
                return rc0Var6;
            case 21:
                rc0 rc0Var7 = new rc0((xx6) obj2, n92Var, 21);
                rc0Var7.c = obj;
                return rc0Var7;
            case 22:
                return new rc0((l78) this.c, (li5) obj2, n92Var, 22);
            case 23:
                return new rc0((x47) this.c, (String) obj2, n92Var, 23);
            case 24:
                return new rc0((md5) this.c, (oh8) obj2, n92Var, 24);
            case 25:
                return new rc0((fl8) this.c, (vk8) obj2, n92Var, 25);
            case 26:
                return new rc0((vk8) this.c, (NotificationFilterType) obj2, n92Var, 26);
            case 27:
                return new rc0((nl8) this.c, (NotificationFilterType) obj2, n92Var, 27);
            case 28:
                return new rc0((vn8) this.c, (xn8) obj2, n92Var, 28);
            default:
                return new rc0((go8) this.c, (String) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws Throwable {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 1:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 2:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 3:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 4:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 5:
                return ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 7:
                return ((rc0) create((rpc) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 9:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 10:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 11:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 12:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 13:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 14:
                ((rc0) create((qz8) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 15:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 16:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 17:
                ((rc0) create((qz8) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 18:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 19:
                ((rc0) create((qz8) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 20:
                return ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 21:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 22:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 23:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 24:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 25:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 26:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 27:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 28:
                ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            default:
                return ((rc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        String str;
        Object value;
        Collection collection;
        String str2;
        Throwable th;
        Bitmap bitmapDecodeStream;
        boolean z = false;
        int i = 2;
        int i2 = 1;
        Object obj2 = null;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        switch (this.b) {
            case 0:
                br7.v(obj);
                wc0 wc0Var = (wc0) this.c;
                l3d l3dVar = ((ld0) this.d).g;
                l3dVar.getClass();
                yd0 yd0Var = wc0Var.a;
                String str3 = yd0Var.c;
                a13 a13Var = yd0Var.h;
                if (!yd0Var.o) {
                    yd0Var.o = true;
                    SusiOperation susiOperation = yd0Var.e;
                    String strG = yd0Var.g();
                    String strI = yd0Var.i();
                    a13Var.getClass();
                    susiOperation.getClass();
                    str3.getClass();
                    rqd.a(a13Var.a, new SignUpSignInRememberMeAccountHintViewed(null, "app", susiOperation.getValue(), a13Var.b.p(), l3dVar.getValue(), null, 33, null), str3, strI, false, null, strG, 24);
                    a13Var.f(yd0Var.e, yd0Var.g(), yd0Var.i(), str3);
                }
                return c1e.a;
            case 1:
                br7.v(obj);
                ((l78) this.d).setValue(((gc1) this.c).k);
                return c1e.a;
            case 2:
                c1e c1eVar = c1e.a;
                br7.v(obj);
                id1 id1Var = (id1) this.c;
                Object value2 = id1Var.U.a.getValue();
                gc1 gc1Var = value2 instanceof gc1 ? (gc1) value2 : null;
                if (gc1Var != null) {
                    az5 az5Var = gc1Var.k;
                    ArrayList arrayList = new ArrayList();
                    for (Object obj3 : az5Var) {
                        if (obj3 instanceof dc1) {
                            arrayList.add(obj3);
                        }
                    }
                    String str4 = (String) this.d;
                    Iterator it2 = arrayList.iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            Object next = it2.next();
                            if (((dc1) next).c.a.equals(str4)) {
                                obj2 = next;
                            }
                        }
                    }
                    dc1 dc1Var = (dc1) obj2;
                    if (dc1Var != null && (str = dc1Var.b) != null) {
                        id1Var.l(str);
                    }
                }
                return c1eVar;
            case 3:
                br7.v(obj);
                if (((Boolean) ((upc) this.d).getValue()).booleanValue()) {
                    ((si1) this.c).b();
                }
                return c1e.a;
            case 4:
                br7.v(obj);
                if (((Boolean) ((upc) this.d).getValue()).booleanValue()) {
                    ((hu1) this.c).b.a.e();
                }
                return c1e.a;
            case 5:
                br7.v(obj);
                sb2 sb2Var = (sb2) this.c;
                il2 il2Var = (il2) this.d;
                va6 va6Var = (va6) il2Var.b.getAndSet(null);
                AtomicReference atomicReference = il2Var.b;
                enc encVarC0 = vx0.c0(sb2Var, null, null, new r91(va6Var, il2Var, objArr == true ? 1 : 0, 17), 3);
                while (true) {
                    if (atomicReference.compareAndSet(null, encVarC0)) {
                        z = true;
                    } else if (atomicReference.get() != null) {
                    }
                }
                return Boolean.valueOf(z);
            case 6:
                br7.v(obj);
                if (((pl2) ((l78) this.d).getValue()) instanceof ol2) {
                    sl2 sl2Var = (sl2) this.c;
                    if (!sl2Var.g) {
                        sl2Var.g = true;
                        sl2Var.c.j(sl2Var.b, sl2Var.f, sl2Var.e);
                    }
                }
                return c1e.a;
            case 7:
                br7.v(obj);
                rpc rpcVar = (rpc) this.c;
                if ((rpcVar instanceof et2) && rpcVar.a <= ((rpc) this.d).a) {
                    z = true;
                }
                return Boolean.valueOf(z);
            case 8:
                br7.v(obj);
                ld3 ld3Var = (ld3) this.c;
                String str5 = ((ie3) this.d).a;
                str5.getClass();
                qe3 qe3Var = ld3Var.b;
                qy2 qy2Var = qe3Var.h;
                String str6 = qe3Var.b;
                String strU = gp7.u(qe3Var.o);
                String str7 = qe3Var.n;
                qy2Var.getClass();
                str6.getClass();
                str7.getClass();
                rqd.a(qy2Var.a, new DigestViewed(null, str5, null, 5, null), str6, strU, false, null, str7, 24);
                if (!qe3Var.p) {
                    qe3Var.p = true;
                    qe3Var.j.j(str6, gp7.u(qe3Var.o), str7);
                }
                return c1e.a;
            case 9:
                br7.v(obj);
                l78 l78Var = (l78) this.d;
                int i3 = EditPostFragment.Q0;
                if (((ps3) l78Var.getValue()) instanceof ns3) {
                    ht3 ht3VarJ1 = ((EditPostFragment) this.c).j1();
                    if (!ht3VarJ1.w) {
                        ht3VarJ1.w = true;
                        ht3VarJ1.n.j(ht3VarJ1.b, gp7.u(ht3VarJ1.v), ht3VarJ1.u);
                    }
                }
                return c1e.a;
            case 10:
                br7.v(obj);
                xpc xpcVar = ((ht3) this.c).A;
                wr3 wr3Var = new wr3((String) this.d);
                xpcVar.getClass();
                xpcVar.m(null, wr3Var);
                return c1e.a;
            case 11:
                br7.v(obj);
                xpc xpcVar2 = ((ht3) this.c).A;
                yr3 yr3Var = new yr3((rg1) this.d);
                xpcVar2.getClass();
                xpcVar2.m(null, yr3Var);
                return c1e.a;
            case 12:
                br7.v(obj);
                if (((Boolean) ((upc) this.d).getValue()).booleanValue()) {
                    ((hub) this.c).b.e();
                }
                return c1e.a;
            case 13:
                br7.v(obj);
                if (((x64) this.c) instanceof u64) {
                    f74 f74Var = ((l64) this.d).a;
                    if (!f74Var.u) {
                        f74Var.u = true;
                        f74Var.k.j(f74Var.b, f74Var.q, f74Var.o);
                    }
                }
                return c1e.a;
            case 14:
                fj4 fj4Var = (fj4) this.d;
                qz8 qz8Var = (qz8) this.c;
                br7.v(obj);
                boolean z2 = qz8Var instanceof oz8;
                if (z2) {
                    fj4Var.e();
                }
                if (z2 || (qz8Var instanceof nz8)) {
                    xpc xpcVar3 = fj4Var.n;
                    Boolean bool = Boolean.FALSE;
                    xpcVar3.getClass();
                    xpcVar3.m(null, bool);
                }
                return c1e.a;
            case 15:
                br7.v(obj);
                dm4 dm4Var = (dm4) this.c;
                Object obj4 = dm4Var.h;
                Map map = (Map) this.d;
                synchronized (obj4) {
                    try {
                        SharedPreferences.Editor editorEdit = dm4Var.a.edit();
                        for (Map.Entry entry : map.entrySet()) {
                            String str8 = (String) entry.getKey();
                            Object value3 = entry.getValue();
                            nl4 nl4Var = (nl4) dm4Var.c.get(str8);
                            String sharedPreferencesKey = nl4Var != null ? nl4Var.getSharedPreferencesKey() : null;
                            if (sharedPreferencesKey != null && (value3 instanceof Boolean)) {
                                editorEdit.putBoolean(sharedPreferencesKey, ((Boolean) value3).booleanValue());
                            } else if (sharedPreferencesKey != null && (value3 instanceof String)) {
                                editorEdit.putString(sharedPreferencesKey, (String) value3);
                            } else if (sharedPreferencesKey != null && (value3 instanceof Number)) {
                                editorEdit.putInt(sharedPreferencesKey, ((Number) value3).intValue());
                            }
                        }
                        editorEdit.apply();
                        dm4Var.d();
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return c1e.a;
            case 16:
                br7.v(obj);
                if (((Boolean) ((upc) this.d).getValue()).booleanValue()) {
                    ((no5) this.c).b.invoke();
                }
                return c1e.a;
            case 17:
                qz8 qz8Var2 = (qz8) this.c;
                br7.v(obj);
                if (qz8Var2 instanceof oz8) {
                    vr7 vr7Var = ((ap5) this.d).f;
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    vr7Var.getClass();
                    vr7Var.B(ek6.LAST_HOME_FETCH_TIME_FEATURED, jCurrentTimeMillis);
                }
                return c1e.a;
            case 18:
                br7.v(obj);
                if (((Boolean) ((upc) this.d).getValue()).booleanValue()) {
                    ((jp5) this.c).b.invoke();
                }
                return c1e.a;
            case 19:
                qz8 qz8Var3 = (qz8) this.c;
                br7.v(obj);
                if (qz8Var3 instanceof oz8) {
                    vr7 vr7Var2 = ((bq5) this.d).f;
                    long jCurrentTimeMillis2 = System.currentTimeMillis();
                    vr7Var2.getClass();
                    vr7Var2.B(ek6.LAST_HOME_FETCH_TIME_RECOMMENDED, jCurrentTimeMillis2);
                }
                return c1e.a;
            case 20:
                sb2 sb2Var2 = (sb2) this.c;
                br7.v(obj);
                ib2 ib2VarQ = sb2Var2.Q();
                m45 m45Var = (m45) this.d;
                try {
                    gld gldVar = new gld();
                    gldVar.f = bo.U(bo.S(ib2VarQ), true, gldVar);
                    while (true) {
                        Unsafe unsafe = m80.a;
                        long j = gld.g;
                        int intVolatile = unsafe.getIntVolatile(gldVar, j);
                        if (intVolatile != 0) {
                            if (intVolatile != 2 && intVolatile != 3) {
                                gld.o(intVolatile);
                                throw null;
                            }
                        } else if (!unsafe.compareAndSwapInt(gldVar, j, intVolatile, 0)) {
                        }
                    }
                    try {
                        return m45Var.invoke();
                    } finally {
                        gldVar.n();
                    }
                } catch (InterruptedException e) {
                    throw new CancellationException("Blocking call was interrupted due to parent cancellation").initCause(e);
                }
            case 21:
                br7.v(obj);
                sb2 sb2Var3 = (sb2) this.c;
                xx6 xx6Var = (xx6) this.d;
                wx6 wx6Var = xx6Var.a;
                if (((ky6) wx6Var).d.compareTo(vx6.INITIALIZED) >= 0) {
                    wx6Var.a(xx6Var);
                } else {
                    bo.D(sb2Var3.Q(), null);
                }
                return c1e.a;
            case 22:
                br7.v(obj);
                if (((Integer) ((l78) this.c).getValue()) != null) {
                    ((ha9) ((li5) this.d)).a(9);
                }
                return c1e.a;
            case 23:
                br7.v(obj);
                x47 x47Var = (x47) this.c;
                xpc xpcVar4 = x47Var.t;
                String str9 = (String) this.d;
                do {
                    value = xpcVar4.getValue();
                    collection = (List) value;
                    if (collection == null) {
                        collection = ey3.a;
                    }
                } while (!xpcVar4.k(value, bu1.Q0(d46.Q(str9), collection)));
                vx0.c0(f76.F(x47Var), null, null, new e47(x47Var, objArr2 == true ? 1 : 0, i), 3);
                return c1e.a;
            case 24:
                br7.v(obj);
                md5 md5Var = (md5) this.c;
                oh8 oh8Var = (oh8) this.d;
                sw9 sw9Var = (sw9) md5Var.b;
                if (!sw9Var.u0) {
                    sw9Var.u0 = true;
                    sw9Var.p.f(oh8Var.f, sw9Var.D0, gp7.u(oh8Var.e), sw9Var.d);
                }
                return c1e.a;
            case 25:
                br7.v(obj);
                if (((fl8) this.c) instanceof dl8) {
                    nl8 nl8Var = ((vk8) this.d).b;
                    vx0.c0(f76.F(nl8Var), null, null, new hl8(nl8Var, objArr3 == true ? 1 : 0, i), 3);
                }
                return c1e.a;
            case 26:
                br7.v(obj);
                ((vk8) this.c).a((NotificationFilterType) this.d);
                return c1e.a;
            case 27:
                br7.v(obj);
                nl8 nl8Var2 = (nl8) this.c;
                ax2 ax2Var = nl8Var2.f;
                String str10 = nl8Var2.b;
                SourceParameter sourceParameter = nl8Var2.i;
                NotificationFilterType notificationFilterType = (NotificationFilterType) this.d;
                notificationFilterType.getClass();
                int i4 = aj8.a[notificationFilterType.ordinal()];
                if (i4 == 1) {
                    str2 = "default";
                } else {
                    if (i4 != 2) {
                        ygf.a();
                        return null;
                    }
                    str2 = "responses";
                }
                ax2Var.j(str10, gp7.u(sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : str2, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : null, ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null)), nl8Var2.h);
                return c1e.a;
            case 28:
                br7.v(obj);
                vn8 vn8Var = (vn8) this.c;
                xn8 xn8Var = (xn8) this.d;
                vn8Var.b(xn8Var.e, xn8Var.f);
                return c1e.a;
            default:
                br7.v(obj);
                go8 go8Var = (go8) this.c;
                gva gvaVarA = go8Var.a();
                String str11 = (String) this.d;
                mg3 mg3Var = gvaVarA.c;
                h21 h21Var = h21.d;
                gg3 gg3VarP = mg3Var.p(dq1.o(str11).d("SHA-256").f());
                fva fvaVar = gg3VarP != null ? new fva(gg3VarP) : null;
                if (fvaVar == null) {
                    return null;
                }
                try {
                    ch4 ch4Var = go8Var.a().b;
                    gg3 gg3Var = fvaVar.a;
                    if (gg3Var.b) {
                        throw new IllegalStateException("snapshot is closed");
                    }
                    yua yuaVarI = wo7.i(ch4Var.g0((g59) gg3Var.a.c.get(1)));
                    try {
                        iz0 iz0Var = new iz0(yuaVarI, i2);
                        try {
                            bitmapDecodeStream = BitmapFactory.decodeStream(iz0Var);
                            iz0Var.close();
                            try {
                                yuaVarI.close();
                                th = null;
                            } catch (Throwable th3) {
                                th = th3;
                            }
                        } finally {
                        }
                    } catch (Throwable th4) {
                        try {
                            yuaVarI.close();
                        } catch (Throwable th5) {
                            kyd.D(th4, th5);
                        }
                        th = th4;
                        bitmapDecodeStream = null;
                        break;
                    }
                    if (th != null) {
                        throw th;
                    }
                    xz5.F(fvaVar, null);
                    return bitmapDecodeStream;
                } finally {
                    try {
                        throw th;
                    } catch (Throwable th6) {
                        xz5.F(fvaVar, th);
                    }
                }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rc0(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
    }
}
