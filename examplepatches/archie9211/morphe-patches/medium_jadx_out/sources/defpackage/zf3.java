package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import androidx.core.widget.nRCC.nGxjfIr;
import com.google.firebase.messaging.FirebaseMessaging;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicMarkableReference;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class zf3 {
    public final /* synthetic */ int a;
    public Object b;
    public boolean c;
    public final Object d;
    public Object e;

    public zf3(lod lodVar, boolean z) {
        this.a = 7;
        this.e = lodVar;
        this.b = new AtomicReference(null);
        this.c = z;
        this.d = new AtomicMarkableReference(new cl6(z ? 8192 : 1024), false);
    }

    public static IOException b(zf3 zf3Var, boolean z, IOException iOException, int i) {
        boolean z2 = (i & 4) == 0;
        boolean z3 = (i & 8) == 0;
        if (iOException != null) {
            zf3Var.q(iOException);
        }
        return ((cva) zf3Var.d).h(zf3Var, z3 && !z, z2 && !z, z2 && z, z3 && z, iOException);
    }

    public void a() {
        switch (this.a) {
            case 0:
                ((kg3) this.e).f(this, false);
                return;
            default:
                lg3 lg3Var = (lg3) this.e;
                synchronized (lg3Var) {
                    try {
                        if (this.c) {
                            throw new IllegalStateException("Check failed.");
                        }
                        if (g76.L(((cg3) this.d).g, this)) {
                            lg3Var.m(this, false);
                        }
                        this.c = true;
                    } catch (Throwable th) {
                        throw th;
                    }
                }
                return;
        }
    }

    public void c() {
        lg3 lg3Var = (lg3) this.e;
        synchronized (lg3Var) {
            try {
                if (this.c) {
                    throw new IllegalStateException("Check failed.");
                }
                if (g76.L(((cg3) this.d).g, this)) {
                    lg3Var.m(this, true);
                }
                this.c = true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void d(boolean z) {
        mg3 mg3Var = (mg3) this.e;
        synchronized (mg3Var.h) {
            try {
                if (this.c) {
                    throw new IllegalStateException("editor is closed");
                }
                if (g76.L(((dg3) this.d).g, this)) {
                    mg3Var.f(this, z);
                }
                this.c = true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void e() {
        cg3 cg3Var = (cg3) this.d;
        if (g76.L(cg3Var.g, this)) {
            lg3 lg3Var = (lg3) this.e;
            if (lg3Var.l) {
                lg3Var.m(this, false);
            } else {
                cg3Var.f = true;
            }
        }
    }

    public g59 f(int i) {
        g59 g59Var;
        mg3 mg3Var = (mg3) this.e;
        synchronized (mg3Var.h) {
            if (this.c) {
                throw new IllegalStateException("editor is closed");
            }
            ((boolean[]) this.b)[i] = true;
            Object obj = ((dg3) this.d).d.get(i);
            vv2.C(mg3Var.q, (g59) obj);
            g59Var = (g59) obj;
        }
        return g59Var;
    }

    public dva g() {
        a44 a44VarJ = ((b44) this.e).j();
        dva dvaVar = a44VarJ instanceof dva ? (dva) a44VarJ : null;
        if (dvaVar != null) {
            return dvaVar;
        }
        ygf.f("no connection for CONNECT tunnels");
        return null;
    }

    public synchronized void h() {
        try {
            if (this.c) {
                return;
            }
            Boolean boolM = m();
            this.b = boolM;
            if (boolM == null) {
                ((e34) ((zwc) this.d)).a(new ik4(1));
            }
            this.c = true;
        } catch (Throwable th) {
            throw th;
        }
    }

    public synchronized boolean i() {
        Boolean bool;
        try {
            h();
            bool = (Boolean) this.b;
        } catch (Throwable th) {
            throw th;
        }
        return bool != null ? bool.booleanValue() : ((FirebaseMessaging) this.e).a.j();
    }

    public boolean j() {
        boolean z;
        synchronized (this.d) {
            z = this.c;
        }
        return z;
    }

    public OutputStream k(int i) {
        FileOutputStream fileOutputStream;
        yf3 yf3Var;
        synchronized (((kg3) this.e)) {
            try {
                bg3 bg3Var = (bg3) this.d;
                if (bg3Var.d != this) {
                    throw new IllegalStateException();
                }
                if (!bg3Var.c) {
                    ((boolean[]) this.b)[i] = true;
                }
                File fileB = bg3Var.b(i);
                try {
                    fileOutputStream = new FileOutputStream(fileB);
                } catch (FileNotFoundException unused) {
                    ((kg3) this.e).a.mkdirs();
                    try {
                        fileOutputStream = new FileOutputStream(fileB);
                    } catch (FileNotFoundException unused2) {
                        return kg3.p;
                    }
                }
                yf3Var = new yf3(this, fileOutputStream);
            } catch (Throwable th) {
                throw th;
            }
        }
        return yf3Var;
    }

    public bfc l(int i) {
        lg3 lg3Var = (lg3) this.e;
        synchronized (lg3Var) {
            try {
                if (this.c) {
                    throw new IllegalStateException("Check failed.");
                }
                if (!g76.L(((cg3) this.d).g, this)) {
                    return new as0();
                }
                int i2 = 1;
                if (!((cg3) this.d).e) {
                    boolean[] zArr = (boolean[]) this.b;
                    zArr.getClass();
                    zArr[i] = true;
                }
                g59 g59Var = (g59) ((cg3) this.d).d.get(i);
                try {
                    ig3 ig3Var = lg3Var.b;
                    ig3Var.getClass();
                    g59Var.getClass();
                    return new aa4(ig3Var.U(g59Var, false), new vef(lg3Var, i2, this));
                } catch (FileNotFoundException unused) {
                    return new as0();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public Boolean m() {
        ApplicationInfo applicationInfo;
        Bundle bundle;
        xj4 xj4Var = ((FirebaseMessaging) this.e).a;
        xj4Var.a();
        Context context = xj4Var.a;
        SharedPreferences sharedPreferences = context.getSharedPreferences("com.google.firebase.messaging", 0);
        if (sharedPreferences.contains("auto_init")) {
            return Boolean.valueOf(sharedPreferences.getBoolean("auto_init", false));
        }
        try {
            PackageManager packageManager = context.getPackageManager();
            if (packageManager == null || (applicationInfo = packageManager.getApplicationInfo(context.getPackageName(), 128)) == null || (bundle = applicationInfo.metaData) == null || !bundle.containsKey("firebase_messaging_auto_init_enabled")) {
                return null;
            }
            return Boolean.valueOf(applicationInfo.metaData.getBoolean("firebase_messaging_auto_init_enabled"));
        } catch (PackageManager.NameNotFoundException unused) {
            return null;
        }
    }

    public ycb n(boolean z) throws IOException {
        try {
            ycb ycbVarG = ((b44) this.e).g(z);
            if (ycbVarG == null) {
                return ycbVarG;
            }
            ycbVarG.n = this;
            return ycbVarG;
        } catch (IOException e) {
            q(e);
            throw e;
        }
    }

    public void o() {
        b2a b2aVar = new b2a(9, this);
        AtomicReference atomicReference = (AtomicReference) this.b;
        while (!atomicReference.compareAndSet(null, b2aVar)) {
            if (atomicReference.get() != null) {
                return;
            }
        }
        ((ud2) ((m50) ((lod) this.e).b).c).a(b2aVar);
    }

    public boolean p(String str, String str2) {
        synchronized (this) {
            try {
                if (!((cl6) ((AtomicMarkableReference) this.d).getReference()).c(str, str2)) {
                    return false;
                }
                AtomicMarkableReference atomicMarkableReference = (AtomicMarkableReference) this.d;
                atomicMarkableReference.set((cl6) atomicMarkableReference.getReference(), true);
                o();
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void q(IOException iOException) {
        this.c = true;
        ((b44) this.e).j().f((cva) this.d, iOException);
    }

    public ku3 r() throws SocketException {
        cva cvaVar = (cva) this.d;
        if (cvaVar.j) {
            ygf.f("Check failed.");
            return null;
        }
        cvaVar.j = true;
        cvaVar.e.j();
        synchronized (cvaVar) {
            if (cvaVar.r == null) {
                throw new IllegalStateException("Check failed.");
            }
            if (cvaVar.n || cvaVar.o) {
                throw new IllegalStateException(nGxjfIr.tES);
            }
            if (cvaVar.l) {
                throw new IllegalStateException("Check failed.");
            }
            if (!cvaVar.m) {
                throw new IllegalStateException("Check failed.");
            }
            cvaVar.m = false;
            cvaVar.n = true;
            cvaVar.o = true;
        }
        a44 a44VarJ = ((b44) this.e).j();
        a44VarJ.getClass();
        dva dvaVar = (dva) a44VarJ;
        dvaVar.e.setSoTimeout(0);
        dvaVar.e();
        return new ku3(this);
    }

    public zf3(cva cvaVar, c44 c44Var, b44 b44Var) {
        this.a = 3;
        c44Var.getClass();
        this.d = cvaVar;
        this.b = c44Var;
        this.e = b44Var;
    }

    public zf3() {
        this.a = 5;
        this.d = new Object();
        this.b = new ArrayList();
        this.e = new ArrayList();
        this.c = true;
    }

    public zf3(ut6 ut6Var, kvc kvcVar, cz9 cz9Var) {
        this.a = 6;
        this.d = ut6Var;
        this.b = kvcVar;
        this.e = cz9Var;
        this.c = true;
    }

    public zf3(mg3 mg3Var, dg3 dg3Var) {
        this.a = 2;
        this.e = mg3Var;
        this.d = dg3Var;
        this.b = new boolean[2];
    }

    public zf3(FirebaseMessaging firebaseMessaging, zwc zwcVar) {
        this.a = 4;
        this.e = firebaseMessaging;
        this.d = zwcVar;
    }

    public zf3(kg3 kg3Var, bg3 bg3Var) {
        this.a = 0;
        this.e = kg3Var;
        this.d = bg3Var;
        this.b = bg3Var.c ? null : new boolean[kg3Var.g];
    }

    public zf3(lg3 lg3Var, cg3 cg3Var) {
        boolean[] zArr;
        this.a = 1;
        this.e = lg3Var;
        this.d = cg3Var;
        if (cg3Var.e) {
            zArr = null;
        } else {
            lg3Var.getClass();
            zArr = new boolean[2];
        }
        this.b = zArr;
    }
}
