package nx;

import android.content.pm.PackageManager;
import fz.d0;

/* loaded from: classes4.dex */
public final class j extends i {

    /* renamed from: c, reason: collision with root package name */
    public final ja.f f78642c;

    /* JADX WARN: Illegal instructions before constructor call */
    public j(ja.f fVar, PackageManager packageManager, d0 d0Var) {
        String string;
        CharSequence charSequenceA = fVar.a(packageManager);
        super((charSequenceA == null || (string = charSequenceA.toString()) == null) ? fVar.f69290a.getPackageName() : string, fVar.b(d0Var));
        this.f78642c = fVar;
    }
}
