package b20;

import android.content.Intent;
import android.os.UserHandle;
import com.android.launcher3.util.ComponentKey;
import java.util.List;
import nova.branch.engage.sesame_lite.internal.IdHash;
import r10.o1;

/* loaded from: classes.dex */
public interface e {
    void a(String str, String str2, UserHandle userHandle, pp.u uVar, IdHash idHash);

    ga.a b(ComponentKey componentKey);

    long c(UserHandle userHandle);

    boolean d();

    void e(Intent intent, pp.u uVar, IdHash idHash);

    void f(ga.a aVar);

    void g(o1 o1Var);

    String getString(int i5);

    UserHandle getUserHandle(long j11);

    ga.a h(long j11, String str, String str2);

    void i(Intent intent, pp.u uVar, IdHash idHash);

    List j(String str, String str2, long j11, List list, int i5);
}
