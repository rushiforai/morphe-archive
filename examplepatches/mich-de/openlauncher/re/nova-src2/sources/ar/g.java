package ar;

import b.c0;
import com.bytedance.sdk.openadsdk.oty.sya;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import p6.p0;

/* loaded from: classes4.dex */
public final class g implements sb.b {

    /* renamed from: a, reason: collision with root package name */
    public String f15564a = null;

    /* renamed from: b, reason: collision with root package name */
    public String f15565b = null;

    /* renamed from: c, reason: collision with root package name */
    public String f15566c = null;

    /* renamed from: d, reason: collision with root package name */
    public String f15567d = null;

    /* renamed from: e, reason: collision with root package name */
    public String f15568e = null;

    public static HashSet d() {
        com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar;
        com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar2;
        HashSet hashSet = new HashSet();
        for (xb.a aVar3 : xb.a.f95748e.values()) {
            if (aVar3 != null && (aVar2 = aVar3.f95752d) != null) {
                hashSet.add(ps.f.x(aVar2.lud(), aVar2.wie()).getAbsolutePath());
                hashSet.add(ps.f.t(aVar2.lud(), aVar2.wie()).getAbsolutePath());
            }
        }
        for (zb.c cVar : zb.a.f98506a.values()) {
            if (cVar != null && (aVar = cVar.f98508b) != null) {
                hashSet.add(ps.f.x(aVar.lud(), aVar.wie()).getAbsolutePath());
                hashSet.add(ps.f.t(aVar.lud(), aVar.wie()).getAbsolutePath());
            }
        }
        return hashSet;
    }

    public static void g(File[] fileArr, int i5, HashSet hashSet) {
        if (i5 >= 0 && fileArr != null) {
            try {
                if (fileArr.length > i5) {
                    List listAsList = Arrays.asList(fileArr);
                    Collections.sort(listAsList, new yb.a(0));
                    while (i5 < listAsList.size()) {
                        if (!hashSet.contains(((File) listAsList.get(i5)).getAbsolutePath())) {
                            ((File) listAsList.get(i5)).delete();
                        }
                        i5++;
                    }
                }
            } catch (Throwable th2) {
                sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKfaMSIT/NUnjitOFc=", "WOIolBGfaMSITw==", 187);
            }
        }
    }

    public synchronized void a() {
        try {
            Iterator it = b().iterator();
            HashSet hashSetD = null;
            while (it.hasNext()) {
                sb.a aVar = (sb.a) it.next();
                File[] fileArr = aVar.f87100a;
                if (fileArr != null && fileArr.length >= aVar.f87101b) {
                    if (hashSetD == null) {
                        hashSetD = d();
                    }
                    int i5 = aVar.f87101b - 2;
                    if (i5 < 0) {
                        i5 = 0;
                    }
                    g(aVar.f87100a, i5, hashSetD);
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public ArrayList b() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new sb.a(new File(e()).listFiles(), p0.f82230b));
        arrayList.add(new sb.a(new File(h()).listFiles(), p0.f82229a));
        if (this.f15566c == null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(this.f15564a);
            this.f15566c = c0.q(sb2, File.separator, "video_brand");
            File file = new File(this.f15566c);
            if (!file.exists()) {
                file.mkdirs();
            }
        }
        arrayList.add(new sb.a(new File(this.f15566c).listFiles(), p0.f82231c));
        arrayList.add(new sb.a(new File(c()).listFiles(), p0.f82232d));
        return arrayList;
    }

    public String c() {
        if (this.f15568e == null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(this.f15564a);
            this.f15568e = c0.q(sb2, File.separator, "video_default");
            File file = new File(this.f15568e);
            if (!file.exists()) {
                file.mkdirs();
            }
        }
        return this.f15568e;
    }

    public String e() {
        if (this.f15565b == null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(this.f15564a);
            this.f15565b = c0.q(sb2, File.separator, "video_reward_full");
            File file = new File(this.f15565b);
            if (!file.exists()) {
                file.mkdirs();
            }
        }
        return this.f15565b;
    }

    public void f(String str) {
        this.f15564a = str;
    }

    public String h() {
        if (this.f15567d == null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(this.f15564a);
            this.f15567d = c0.q(sb2, File.separator, "video_splash");
            File file = new File(this.f15567d);
            if (!file.exists()) {
                file.mkdirs();
            }
        }
        return this.f15567d;
    }
}
