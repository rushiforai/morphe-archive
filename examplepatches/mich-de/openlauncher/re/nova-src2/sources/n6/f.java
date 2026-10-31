package n6;

import h6.a0;
import h6.n1;
import java.io.PrintWriter;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import x7.n;
import z.d1;

/* loaded from: classes2.dex */
public final class f extends a {

    /* renamed from: a, reason: collision with root package name */
    public final Object f77903a;

    /* renamed from: b, reason: collision with root package name */
    public final e f77904b;

    public f(a0 a0Var, n1 store) {
        this.f77903a = a0Var;
        Intrinsics.g(store, "store");
        k6.a defaultCreationExtras = k6.a.f71149b;
        Intrinsics.g(defaultCreationExtras, "defaultCreationExtras");
        n nVar = new n(store, e.f77900c, defaultCreationExtras);
        KClass modelClass = JvmClassMappingKt.e(e.class);
        Intrinsics.g(modelClass, "modelClass");
        String qualifiedName = modelClass.getQualifiedName();
        if (qualifiedName == null) {
            throw new IllegalArgumentException("Local and anonymous classes can not be ViewModels");
        }
        this.f77904b = (e) nVar.m(modelClass, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(qualifiedName));
    }

    public final void b(String str, PrintWriter printWriter) {
        e eVar = this.f77904b;
        if (eVar.f77901a.f() > 0) {
            printWriter.print(str);
            printWriter.println("Loaders:");
            String str2 = str + "    ";
            for (int i5 = 0; i5 < eVar.f77901a.f(); i5++) {
                b bVar = (b) eVar.f77901a.g(i5);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(eVar.f77901a.d(i5));
                printWriter.print(": ");
                printWriter.println(bVar.toString());
                printWriter.print(str2);
                printWriter.print("mId=");
                printWriter.print(0);
                printWriter.print(" mArgs=");
                printWriter.println((Object) null);
                printWriter.print(str2);
                printWriter.print("mLoader=");
                printWriter.println(bVar.f77895l);
                mg.d dVar = bVar.f77895l;
                String str3 = str2 + "  ";
                dVar.getClass();
                printWriter.print(str3);
                printWriter.print("mId=");
                printWriter.print(0);
                printWriter.print(" mListener=");
                printWriter.println(dVar.f76284a);
                if (dVar.f76286c || dVar.f76289f) {
                    printWriter.print(str3);
                    printWriter.print("mStarted=");
                    printWriter.print(dVar.f76286c);
                    printWriter.print(" mContentChanged=");
                    printWriter.print(dVar.f76289f);
                    printWriter.print(" mProcessingChange=");
                    printWriter.println(false);
                }
                if (dVar.f76287d || dVar.f76288e) {
                    printWriter.print(str3);
                    printWriter.print("mAbandoned=");
                    printWriter.print(dVar.f76287d);
                    printWriter.print(" mReset=");
                    printWriter.println(dVar.f76288e);
                }
                if (dVar.f76291h != null) {
                    printWriter.print(str3);
                    printWriter.print("mTask=");
                    printWriter.print(dVar.f76291h);
                    printWriter.print(" waiting=");
                    dVar.f76291h.getClass();
                    printWriter.println(false);
                }
                if (dVar.f76292i != null) {
                    printWriter.print(str3);
                    printWriter.print("mCancellingTask=");
                    printWriter.print(dVar.f76292i);
                    printWriter.print(" waiting=");
                    dVar.f76292i.getClass();
                    printWriter.println(false);
                }
                if (bVar.n != null) {
                    printWriter.print(str2);
                    printWriter.print("mCallbacks=");
                    printWriter.println(bVar.n);
                    c cVar = bVar.n;
                    cVar.getClass();
                    printWriter.print(str2 + "  ");
                    printWriter.print("mDeliveredData=");
                    printWriter.println(cVar.f77898b);
                }
                printWriter.print(str2);
                printWriter.print("mData=");
                mg.d dVar2 = bVar.f77895l;
                Object objD = bVar.d();
                dVar2.getClass();
                StringBuilder sb2 = new StringBuilder(64);
                if (objD == null) {
                    sb2.append(AbstractJsonLexerKt.NULL);
                } else {
                    Class<?> cls = objD.getClass();
                    sb2.append(cls.getSimpleName());
                    sb2.append("{");
                    sb2.append(Integer.toHexString(System.identityHashCode(cls)));
                    sb2.append("}");
                }
                printWriter.println(sb2.toString());
                printWriter.print(str2);
                printWriter.print("mStarted=");
                printWriter.println(bVar.f59389c > 0);
            }
        }
    }

    public final void c() {
        d1 d1Var = this.f77904b.f77901a;
        int iF = d1Var.f();
        for (int i5 = 0; i5 < iF; i5++) {
            ((b) d1Var.g(i5)).l();
        }
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder(128);
        sb2.append("LoaderManager{");
        sb2.append(Integer.toHexString(System.identityHashCode(this)));
        sb2.append(" in ");
        Class<?> cls = this.f77903a.getClass();
        sb2.append(cls.getSimpleName());
        sb2.append("{");
        sb2.append(Integer.toHexString(System.identityHashCode(cls)));
        sb2.append("}}");
        return sb2.toString();
    }
}
