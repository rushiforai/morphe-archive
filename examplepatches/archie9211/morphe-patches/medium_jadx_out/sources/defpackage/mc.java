package defpackage;

import android.content.Context;
import androidx.work.impl.yX.VrhD;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class mc extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ oc d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mc(oc ocVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ocVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        oc ocVar = this.d;
        switch (i) {
            case 0:
                return new mc(ocVar, n92Var, 0);
            case 1:
                return new mc(ocVar, n92Var, 1);
            case 2:
                return new mc(ocVar, n92Var, 2);
            case 3:
                return new mc(ocVar, n92Var, 3);
            case 4:
                return new mc(ocVar, n92Var, 4);
            case 5:
                return new mc(ocVar, n92Var, 5);
            case 6:
                return new mc(ocVar, n92Var, 6);
            default:
                return new mc(ocVar, n92Var, 7);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((mc) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        int i = this.b;
        c1e c1eVar = c1e.a;
        oc ocVar = this.d;
        File file = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1 || i2 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                zw2 zw2Var = (zw2) gr7.m(ocVar.h);
                zw2Var.g.N(new nh2(2, zw2Var));
                r6c r6cVar = ocVar.p;
                hc hcVar = new hc("Apollo cache cleared");
                this.c = 1;
                return r6cVar.a(hcVar, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    kb2 kb2Var = ocVar.l;
                    nc ncVar = new nc(ocVar, null, 0);
                    this.c = 1;
                    if (vx0.m0(kb2Var, ncVar, this) != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    if (i3 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar2 = ocVar.p;
                hc hcVar2 = new hc("Images disk cache cleared");
                this.c = 2;
                if (r6cVar2.a(hcVar2, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    kb2 kb2Var2 = ocVar.l;
                    nc ncVar2 = new nc(ocVar, null, 1);
                    this.c = 1;
                    if (vx0.m0(kb2Var2, ncVar2, this) != tb2Var3) {
                    }
                    return tb2Var3;
                }
                if (i4 != 1) {
                    if (i4 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar3 = ocVar.p;
                hc hcVar3 = new hc("Images memory cache cleared");
                this.c = 2;
                if (r6cVar3.a(hcVar3, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 != 0) {
                    if (i5 == 1 || i5 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                zw2 zw2Var2 = (zw2) gr7.m(ocVar.h);
                ReentrantReadWriteLock.ReadLock lock = ((ReentrantReadWriteLock) zw2Var2.g.a).readLock();
                lock.lock();
                try {
                    LinkedHashMap linkedHashMapC = zw2Var2.a().c();
                    lock.unlock();
                    Context context = ocVar.d;
                    StringBuilder sb = new StringBuilder();
                    for (Map.Entry entry : linkedHashMapC.entrySet()) {
                        wg6 wg6Var = (wg6) entry.getKey();
                        Map map = (Map) entry.getValue();
                        sb.append(wg6Var.j());
                        sb.append(" {");
                        for (Map.Entry entry2 : map.entrySet()) {
                            String str = (String) entry2.getKey();
                            twa twaVar = (twa) entry2.getValue();
                            sb.append("\n  \"");
                            sb.append(str);
                            sb.append("\" : {");
                            for (Map.Entry entry3 : twaVar.b.entrySet()) {
                                String str2 = (String) entry3.getKey();
                                Object value = entry3.getValue();
                                sb.append("\n    \"");
                                sb.append(str2);
                                sb.append("\" : ");
                                if (value instanceof i31) {
                                    sb.append(value);
                                } else if (value instanceof List) {
                                    sb.append("[");
                                    for (Object obj2 : (List) value) {
                                        sb.append("\n      ");
                                        sb.append(obj2);
                                    }
                                    sb.append("\n    ]");
                                } else {
                                    sb.append(value);
                                }
                            }
                            sb.append("\n  }\n");
                        }
                        sb.append("}\n");
                    }
                    String string = sb.toString();
                    String str3 = "apollo_dump_" + System.currentTimeMillis() + ".txt";
                    context.getClass();
                    try {
                        File file2 = new File(context.getFilesDir(), str3);
                        FileOutputStream fileOutputStream = new FileOutputStream(file2);
                        byte[] bytes = string.getBytes(wk1.a);
                        bytes.getClass();
                        fileOutputStream.write(bytes);
                        fileOutputStream.close();
                        file = file2;
                    } catch (IOException e) {
                        wld.a.c("File write failed: %s", e.toString());
                    }
                    r6c r6cVar4 = ocVar.p;
                    if (file != null) {
                        hc hcVar4 = new hc(ka1.r("Cache dumped to ", file.getAbsolutePath()), bhc.Long);
                        this.c = 1;
                        if (r6cVar4.a(hcVar4, this) != tb2Var4) {
                            return c1eVar;
                        }
                    } else {
                        hc hcVar5 = new hc("Unable to dump Apollo cache", bhc.Long);
                        this.c = 2;
                        if (r6cVar4.a(hcVar5, this) != tb2Var4) {
                            return c1eVar;
                        }
                    }
                    return tb2Var4;
                } catch (Throwable th) {
                    lock.unlock();
                    throw th;
                }
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    kb2 kb2Var3 = ocVar.l;
                    nc ncVar3 = new nc(ocVar, null, 2);
                    this.c = 1;
                    obj = vx0.m0(kb2Var3, ncVar3, this);
                    if (obj != tb2Var5) {
                    }
                    return tb2Var5;
                }
                if (i6 != 1) {
                    if (i6 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar5 = ocVar.p;
                hc hcVar6 = new hc(ka1.r("File saved into ", ((File) obj).getAbsolutePath()), bhc.Long);
                this.c = 2;
                if (r6cVar5.a(hcVar6, this) != tb2Var5) {
                    return c1eVar;
                }
                return tb2Var5;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 != 0) {
                    if (i7 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ocVar.f.z(ek6.HAS_DISMISSED_FIND_YOUR_FRIENDS_DIALOG, false);
                r6c r6cVar6 = ocVar.p;
                hc hcVar7 = new hc("Find your friends dialog reset");
                this.c = 1;
                return r6cVar6.a(hcVar7, this) == tb2Var6 ? tb2Var6 : c1eVar;
            case 6:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 != 0) {
                    if (i8 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                my6 my6Var = ocVar.j;
                my6Var.getClass();
                km4.I(wld.a, null, "Reset push notification permission request timer", new Object[0], "Reset push notification permission request timer");
                vr7 vr7Var = ((zpa) my6Var.a).b;
                vr7Var.getClass();
                vr7Var.B(ek6.NOTIFICATIONS_PERMISSION_RATIONALE_TIMESTAMP, 0L);
                r6c r6cVar7 = ocVar.p;
                hc hcVar8 = new hc("Push notification permission request timer reset");
                this.c = 1;
                return r6cVar7.a(hcVar8, this) == tb2Var7 ? tb2Var7 : c1eVar;
            default:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 != 0) {
                    if (i9 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                qn7 qn7Var = ocVar.e;
                qn7Var.getClass();
                qn7Var.A(ek6.LAST_SHOWN_WHATS_NEW_DIALOG_VERSION, 0);
                r6c r6cVar8 = ocVar.p;
                hc hcVar9 = new hc(VrhD.DQGQZ);
                this.c = 1;
                return r6cVar8.a(hcVar9, this) == tb2Var8 ? tb2Var8 : c1eVar;
        }
    }
}
