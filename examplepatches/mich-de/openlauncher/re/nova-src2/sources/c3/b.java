package c3;

import ai.r4;
import android.content.Context;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.DragEvent;
import android.view.MenuItem;
import android.view.MotionEvent;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public Object f19222a;

    /* renamed from: b, reason: collision with root package name */
    public Object f19223b;

    public b(t70.j0 scope, Map listeners) {
        Intrinsics.g(scope, "scope");
        Intrinsics.g(listeners, "listeners");
        this.f19222a = scope;
        this.f19223b = listeners;
    }

    public static b i(x9.t tVar, x9.i iVar, aa.w wVar) {
        if (iVar.f95650c == null) {
            return new x9.d(tVar, wVar);
        }
        if (iVar.f95648a) {
            return null;
        }
        return new x9.e(tVar, wVar);
    }

    public static float m(int i5, int i11, int i12) {
        return (i5 - i11) / i12;
    }

    public static byte[] s(byte[] bArr, ByteBuffer byteBuffer) {
        int length = bArr.length % 16 == 0 ? bArr.length : (bArr.length + 16) - (bArr.length % 16);
        int iRemaining = byteBuffer.remaining();
        int i5 = iRemaining % 16;
        int i11 = (i5 == 0 ? iRemaining : (iRemaining + 16) - i5) + length;
        ByteBuffer byteBufferOrder = ByteBuffer.allocate(i11 + 16).order(ByteOrder.LITTLE_ENDIAN);
        byteBufferOrder.put(bArr);
        byteBufferOrder.position(length);
        byteBufferOrder.put(byteBuffer);
        byteBufferOrder.position(i11);
        byteBufferOrder.putLong(bArr.length);
        byteBufferOrder.putLong(iRemaining);
        return byteBufferOrder.array();
    }

    public abstract void A();

    public void B() {
        h();
        IntentFilter intentFilterJ = j();
        if (intentFilterJ.countActions() == 0) {
            return;
        }
        if (((r4) this.f19222a) == null) {
            this.f19222a = new r4(this, 4);
        }
        ((m.f0) this.f19223b).f75230k.registerReceiver((r4) this.f19222a, intentFilterJ);
    }

    public abstract void C();

    public abstract void D();

    public abstract void g();

    public void h() {
        r4 r4Var = (r4) this.f19222a;
        if (r4Var != null) {
            try {
                ((m.f0) this.f19223b).f75230k.unregisterReceiver(r4Var);
            } catch (IllegalArgumentException unused) {
            }
            this.f19222a = null;
        }
    }

    public abstract IntentFilter j();

    public abstract int[] k(int i5);

    public abstract int l();

    public MenuItem n(MenuItem menuItem) {
        if (!(menuItem instanceof t4.a)) {
            return menuItem;
        }
        t4.a aVar = (t4.a) menuItem;
        if (((z.c1) this.f19223b) == null) {
            this.f19223b = new z.c1(0);
        }
        MenuItem menuItem2 = (MenuItem) ((z.c1) this.f19223b).get(aVar);
        if (menuItem2 != null) {
            return menuItem2;
        }
        q.r rVar = new q.r((Context) this.f19222a, aVar);
        ((z.c1) this.f19223b).put(aVar, rVar);
        return rVar;
    }

    public int[] o(int i5, int i11) {
        if (i5 < 0 || i11 < 0 || i5 == i11) {
            return null;
        }
        int[] iArr = (int[]) this.f19223b;
        iArr[0] = i5;
        iArr[1] = i11;
        return iArr;
    }

    public String p() {
        String str = (String) this.f19222a;
        if (str != null) {
            return str;
        }
        Intrinsics.m("text");
        throw null;
    }

    public void q(String str) {
        this.f19222a = str;
    }

    public abstract void r();

    public abstract com.google.android.gms.internal.measurement.a0 t(int i5, byte[] bArr);

    public abstract void u();

    public boolean v(DragEvent dragEvent) {
        return false;
    }

    public abstract boolean w(MotionEvent motionEvent);

    public boolean x(MotionEvent motionEvent) {
        return false;
    }

    public abstract int[] y(int i5);

    public abstract void z(wj.b bVar);

    public b(String str, Bundle data) {
        Intrinsics.g(data, "data");
        this.f19222a = str;
        this.f19223b = data;
    }

    public b(Context context) {
        this.f19222a = context;
    }

    public b(int i5) {
        this.f19223b = new ArrayList();
        for (int i11 = 0; i11 < i5; i11++) {
            ((ArrayList) this.f19223b).add(new wj.m());
        }
    }

    public b(x9.t tVar, aa.w wVar) {
        this.f19222a = tVar;
        this.f19223b = wVar;
    }

    public b() {
        this.f19223b = new int[2];
    }

    public b(Set set) {
        this.f19223b = new a5.d(0);
        Objects.requireNonNull(set);
        this.f19222a = Collections.unmodifiableSet(set);
    }

    public b(m.f0 f0Var) {
        this.f19223b = f0Var;
    }
}
