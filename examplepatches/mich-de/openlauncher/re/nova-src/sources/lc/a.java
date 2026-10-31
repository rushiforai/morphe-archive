package lc;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI;

/* loaded from: classes2.dex */
public interface a extends ServiceConnection, pc.b {
    void a(String str);

    void a(c cVar);

    boolean a();

    void b();

    void b(String str);

    void b(c cVar);

    void c(ComponentName componentName, IBinder iBinder);

    void c(String str);

    boolean c();

    String d();

    void destroy();

    String e();

    boolean f();

    Context g();

    boolean h();

    String i();

    boolean j();

    IIgniteServiceAPI k();
}
