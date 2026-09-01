package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.widget.TextView;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.reader.R;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.exceptions.OnErrorNotImplementedException;
import io.reactivex.exceptions.UndeliverableException;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.concurrent.Callable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class ok7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static volatile f70 e;
    public static final /* synthetic */ int f = 0;

    public static final void A(mn6 mn6Var, hec hecVar, LinkedHashSet linkedHashSet, Set set) {
        co1 co1VarA = mn6Var.j0().a();
        if (co1VarA instanceof swd) {
            if (!g76.L(mn6Var.j0(), hecVar.j0())) {
                linkedHashSet.add(co1VarA);
                return;
            }
            for (mn6 mn6Var2 : ((swd) co1VarA).getUpperBounds()) {
                mn6Var2.getClass();
                A(mn6Var2, hecVar, linkedHashSet, set);
            }
            return;
        }
        co1 co1VarA2 = mn6Var.j0().a();
        do1 do1Var = co1VarA2 instanceof do1 ? (do1) co1VarA2 : null;
        List listG0 = do1Var != null ? do1Var.g0() : null;
        int i = 0;
        for (xwd xwdVar : mn6Var.h0()) {
            int i2 = i + 1;
            swd swdVar = listG0 != null ? (swd) bu1.A0(i, listG0) : null;
            if ((swdVar == null || set == null || !set.contains(swdVar)) && !xwdVar.c() && !bu1.p0(linkedHashSet, xwdVar.b().j0().a()) && !g76.L(xwdVar.b().j0(), hecVar.j0())) {
                mn6 mn6VarB = xwdVar.b();
                mn6VarB.getClass();
                A(mn6VarB, hecVar, linkedHashSet, set);
            }
            i = i2;
        }
    }

    public static final vm6 B(mn6 mn6Var) {
        mn6Var.getClass();
        vm6 vm6VarE = mn6Var.j0().e();
        vm6VarE.getClass();
        return vm6VarE;
    }

    public static final mn6 C(swd swdVar) {
        Object obj;
        swdVar.getClass();
        List upperBounds = swdVar.getUpperBounds();
        upperBounds.getClass();
        upperBounds.isEmpty();
        List upperBounds2 = swdVar.getUpperBounds();
        upperBounds2.getClass();
        Iterator it2 = upperBounds2.iterator();
        while (true) {
            obj = null;
            if (!it2.hasNext()) {
                break;
            }
            Object next = it2.next();
            co1 co1VarA = ((mn6) next).j0().a();
            y28 y28Var = co1VarA instanceof y28 ? (y28) co1VarA : null;
            if (y28Var != null && y28Var.b0() != qn1.INTERFACE && y28Var.b0() != qn1.ANNOTATION_CLASS) {
                obj = next;
                break;
            }
        }
        mn6 mn6Var = (mn6) obj;
        if (mn6Var != null) {
            return mn6Var;
        }
        List upperBounds3 = swdVar.getUpperBounds();
        upperBounds3.getClass();
        Object objX0 = bu1.x0(upperBounds3);
        objX0.getClass();
        return (mn6) objX0;
    }

    public static final qxb D(TextView textView) {
        String string = textView.getText().toString();
        int iV = iq7.v(textView.getSelectionStart(), 0, string.length());
        int iV2 = iq7.v(textView.getSelectionEnd(), 0, string.length());
        if (iV2 < iV) {
            return null;
        }
        return new qxb(iV, iV2);
    }

    public static final boolean E(swd swdVar, zvd zvdVar, Set set) {
        swdVar.getClass();
        List<mn6> upperBounds = swdVar.getUpperBounds();
        upperBounds.getClass();
        if (upperBounds.isEmpty()) {
            return false;
        }
        for (mn6 mn6Var : upperBounds) {
            mn6Var.getClass();
            if (x(mn6Var, swdVar.T().j0(), set) && (zvdVar == null || g76.L(mn6Var.j0(), zvdVar))) {
                return true;
            }
        }
        return false;
    }

    public static final boolean F(mn6 mn6Var, mn6 mn6Var2) {
        mn6Var.getClass();
        mn6Var2.getClass();
        return on6.a.b(mn6Var, mn6Var2);
    }

    public static final void G(Context context) {
        Map mapSingletonMap;
        context.getClass();
        File databasePath = context.getDatabasePath("androidx.work.workdb");
        databasePath.getClass();
        if (databasePath.exists()) {
            d87.h().d(c7f.a, "Migrating WorkDatabase to the no-backup directory");
            File databasePath2 = context.getDatabasePath("androidx.work.workdb");
            databasePath2.getClass();
            File noBackupFilesDir = context.getNoBackupFilesDir();
            noBackupFilesDir.getClass();
            String[] strArr = c7f.b;
            int iP = ei7.P(strArr.length);
            if (iP < 16) {
                iP = 16;
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
            for (String str : strArr) {
                linkedHashMap.put(new File(databasePath2.getPath() + str), new File(noBackupFilesDir.getPath() + str));
            }
            if (linkedHashMap.isEmpty()) {
                mapSingletonMap = Collections.singletonMap(databasePath2, noBackupFilesDir);
                mapSingletonMap.getClass();
            } else {
                LinkedHashMap linkedHashMap2 = new LinkedHashMap(linkedHashMap);
                linkedHashMap2.put(databasePath2, noBackupFilesDir);
                mapSingletonMap = linkedHashMap2;
            }
            for (Map.Entry entry : mapSingletonMap.entrySet()) {
                File file = (File) entry.getKey();
                File file2 = (File) entry.getValue();
                if (file.exists()) {
                    if (file2.exists()) {
                        d87.h().l(c7f.a, "Over-writing contents of " + file2);
                    }
                    d87.h().d(c7f.a, file.renameTo(file2) ? "Migrated " + file + "to " + file2 : "Renaming " + file + " to " + file2 + " failed");
                }
            }
        }
    }

    public static void H(Throwable th) {
        f70 f70Var = e;
        if (th == null) {
            th = new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        } else if (!(th instanceof OnErrorNotImplementedException) && !(th instanceof MissingBackpressureException) && !(th instanceof IllegalStateException) && !(th instanceof NullPointerException) && !(th instanceof IllegalArgumentException) && !(th instanceof CompositeException)) {
            th = new UndeliverableException("The exception could not be delivered to the consumer because it has already canceled/disposed the flow or the exception has nowhere to go to begin with. Further reading: https://github.com/ReactiveX/RxJava/wiki/What's-different-in-2.0#error-handling | " + th, th);
        }
        if (f70Var != null) {
            try {
                f70Var.accept(th);
                return;
            } catch (Throwable th2) {
                th2.printStackTrace();
                Thread threadCurrentThread = Thread.currentThread();
                threadCurrentThread.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread, th2);
            }
        }
        th.printStackTrace();
        Thread threadCurrentThread2 = Thread.currentThread();
        threadCurrentThread2.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread2, th);
    }

    public static final mn6 I(mn6 mn6Var, ly lyVar) {
        return (mn6Var.getAnnotations().isEmpty() && lyVar.isEmpty()) ? mn6Var : mn6Var.m0().p0(pr7.n(mn6Var.i0(), lyVar));
    }

    public static final o3e J(mn6 mn6Var) {
        o3e o3eVarD;
        mn6Var.getClass();
        o3e o3eVarM0 = mn6Var.m0();
        if (o3eVarM0 instanceof zm4) {
            zm4 zm4Var = (zm4) o3eVarM0;
            hec hecVarD = zm4Var.b;
            if (!hecVarD.j0().getParameters().isEmpty() && hecVarD.j0().a() != null) {
                List parameters = hecVarD.j0().getParameters();
                parameters.getClass();
                ArrayList arrayList = new ArrayList(cu1.k0(parameters, 10));
                Iterator it2 = parameters.iterator();
                while (it2.hasNext()) {
                    arrayList.add(new onc((swd) it2.next()));
                }
                hecVarD = lk7.D(hecVarD, arrayList, null, 2);
            }
            hec hecVarD2 = zm4Var.c;
            if (!hecVarD2.j0().getParameters().isEmpty() && hecVarD2.j0().a() != null) {
                List parameters2 = hecVarD2.j0().getParameters();
                parameters2.getClass();
                ArrayList arrayList2 = new ArrayList(cu1.k0(parameters2, 10));
                Iterator it3 = parameters2.iterator();
                while (it3.hasNext()) {
                    arrayList2.add(new onc((swd) it3.next()));
                }
                hecVarD2 = lk7.D(hecVarD2, arrayList2, null, 2);
            }
            o3eVarD = pwd.K(hecVarD, hecVarD2);
        } else {
            if (!(o3eVarM0 instanceof hec)) {
                ygf.a();
                return null;
            }
            hec hecVar = (hec) o3eVarM0;
            boolean zIsEmpty = hecVar.j0().getParameters().isEmpty();
            o3eVarD = hecVar;
            if (!zIsEmpty) {
                co1 co1VarA = hecVar.j0().a();
                o3eVarD = hecVar;
                if (co1VarA != null) {
                    List parameters3 = hecVar.j0().getParameters();
                    parameters3.getClass();
                    ArrayList arrayList3 = new ArrayList(cu1.k0(parameters3, 10));
                    Iterator it4 = parameters3.iterator();
                    while (it4.hasNext()) {
                        arrayList3.add(new onc((swd) it4.next()));
                    }
                    o3eVarD = lk7.D(hecVar, arrayList3, null, 2);
                }
            }
        }
        return qk7.t(o3eVarD, o3eVarM0);
    }

    public static String K() {
        Locale locale = Locale.getDefault();
        StringBuilder sb = new StringBuilder();
        String language = locale.getLanguage();
        if (language != null) {
            sb.append(language);
            String country = locale.getCountry();
            if (country != null) {
                sb.append("-");
                sb.append(country);
            }
        }
        Locale locale2 = Locale.US;
        if (!locale.equals(locale2)) {
            if (sb.length() > 0) {
                sb.append(", ");
            }
            String language2 = locale2.getLanguage();
            if (language2 != null) {
                sb.append(language2);
                String country2 = locale2.getCountry();
                if (country2 != null) {
                    sb.append("-");
                    sb.append(country2);
                }
            }
        }
        return sb.toString();
    }

    public static void L(int i, int i2) {
        String strL;
        if (i < 0 || i >= i2) {
            if (i < 0) {
                strL = hk7.L("%s (%s) must not be negative", "index", Integer.valueOf(i));
            } else {
                if (i2 < 0) {
                    ay0.e(b09.w(i2, "negative size: "));
                    return;
                }
                strL = hk7.L("%s (%s) must be less than size (%s)", "index", Integer.valueOf(i), Integer.valueOf(i2));
            }
            throw new IndexOutOfBoundsException(strL);
        }
    }

    public static void M(int i, int i2, int i3) {
        if (i < 0 || i2 < i || i2 > i3) {
            throw new IndexOutOfBoundsException((i < 0 || i > i3) ? O(i, i3, "start index") : (i2 < 0 || i2 > i3) ? O(i2, i3, "end index") : hk7.L("end index (%s) must not be less than start index (%s)", Integer.valueOf(i2), Integer.valueOf(i)));
        }
    }

    public static boolean N(Comparator comparator, Collection collection) {
        Object objComparator;
        comparator.getClass();
        collection.getClass();
        if (collection instanceof SortedSet) {
            objComparator = ((SortedSet) collection).comparator();
            if (objComparator == null) {
                objComparator = czf.b;
            }
        } else {
            if (!(collection instanceof ryf)) {
                return false;
            }
            objComparator = ((ryf) collection).h;
        }
        return comparator.equals(objComparator);
    }

    public static String O(int i, int i2, String str) {
        if (i < 0) {
            return hk7.L("%s (%s) must not be negative", str, Integer.valueOf(i));
        }
        if (i2 >= 0) {
            return hk7.L("%s (%s) must not be greater than size (%s)", str, Integer.valueOf(i), Integer.valueOf(i2));
        }
        ay0.e(b09.w(i2, "negative size: "));
        return null;
    }

    public static void P(int i, int i2) {
        if (i < 0 || i > i2) {
            z10.i(O(i, i2, "index"));
        }
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public static final void a(ihc ihcVar, r28 r28Var, c55 c55Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-977568115);
        int i2 = (i & 6) == 0 ? (p65Var.f(ihcVar) ? 4 : 2) | i : i;
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(c55Var) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            String strV = ep7.v(p65Var, R.string.m3c_snackbar_pane_title);
            Object objM = p65Var.M();
            Object obj = objM;
            if (objM == w12.a) {
                l94 l94Var = new l94();
                l94Var.a = new Object();
                l94Var.b = new ArrayList();
                p65Var.j0(l94Var);
                obj = l94Var;
            }
            l94 l94Var2 = (l94) obj;
            Object obj2 = l94Var2.a;
            ArrayList arrayList = l94Var2.b;
            if (g76.L(ihcVar, obj2)) {
                p65Var.Y(1443908949);
                p65Var.p(false);
            } else {
                p65Var.Y(1154891761);
                l94Var2.a = ihcVar;
                ArrayList arrayList2 = new ArrayList(arrayList.size());
                int size = arrayList.size();
                for (int i3 = 0; i3 < size; i3++) {
                    arrayList2.add((ihc) ((j94) arrayList.get(i3)).a);
                }
                ArrayList arrayList3 = new ArrayList(arrayList2);
                if (!arrayList3.contains(ihcVar)) {
                    arrayList3.add(ihcVar);
                }
                arrayList.clear();
                ArrayList arrayListA = z27.a(arrayList3);
                int size2 = arrayListA.size();
                for (int i4 = 0; i4 < size2; i4++) {
                    ihc ihcVar2 = (ihc) arrayListA.get(i4);
                    arrayList.add(new j94(ihcVar2, pxf.E(-1952400805, new fhc(ihcVar2, ihcVar, l94Var2, strV), p65Var)));
                }
                p65Var.p(false);
            }
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            l94Var2.c = w2g.t(p65Var);
            p65Var.Y(-1888182177);
            int size3 = arrayList.size();
            for (int i5 = 0; i5 < size3; i5++) {
                j94 j94Var = (j94) arrayList.get(i5);
                ihc ihcVar3 = (ihc) j94Var.a;
                mz1 mz1Var = j94Var.b;
                p65Var.W(1325010085, ihcVar3);
                mz1Var.f(pxf.E(-1893791890, new kd(c55Var, 11, ihcVar3), p65Var), p65Var, 6);
                p65Var.p(false);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i, 3, ihcVar, r28Var, c55Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x01cd  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01de  */
    /* JADX WARN: Removed duplicated region for block: B:92:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(final boolean r20, defpackage.r28 r21, defpackage.m45 r22, defpackage.hd9 r23, float r24, defpackage.hy8 r25, final defpackage.mz1 r26, final defpackage.mz1 r27, defpackage.x12 r28, final int r29, final int r30) {
        /*
            Method dump skipped, instruction units count: 490
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ok7.b(boolean, r28, m45, hd9, float, hy8, mz1, mz1, x12, int, int):void");
    }

    public static final void c(boolean z, xn7 xn7Var, m45 m45Var, m45 m45Var2, r28 r28Var, boolean z2, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        boolean z3;
        xn7Var.getClass();
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1641456400);
        if ((i & 6) == 0) {
            i2 = (p65Var2.g(z) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.d(xn7Var.ordinal()) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(m45Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.h(m45Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        int i3 = i2 | 196608;
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            if (z) {
                p65Var2.Y(1870225791);
                p65Var = p65Var2;
                fo7.j(m45Var2, vo7.R(p65Var2, R.string.common_muted), xn7Var, bgf.N(r28Var, "unmute_button"), true, null, p65Var, ((i3 >> 9) & 14) | ((i3 << 3) & 896) | ((i3 >> 3) & 57344), 32);
                p65Var.p(false);
            } else {
                p65Var2.Y(1870504326);
                fo7.i(m45Var, vo7.R(p65Var2, R.string.common_mute), xn7Var, bgf.N(r28Var, "mute_button"), true, p65Var2, ((i3 >> 3) & 57344) | ((i3 >> 6) & 14) | ((i3 << 3) & 896), 0);
                p65Var = p65Var2;
                p65Var.p(false);
            }
            z3 = true;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            z3 = z2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b88(z, xn7Var, m45Var, m45Var2, r28Var, z3, i);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v3, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r1v8 */
    public static final void d(uid uidVar, x45 x45Var, boolean z, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        int i2;
        o28 o28Var;
        ?? r1;
        p65 p65Var2;
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(605039373);
        int i3 = i | (p65Var3.f(uidVar) ? 4 : 2) | (p65Var3.h(x45Var) ? 32 : 16) | (p65Var3.g(z) ? 256 : 128) | (p65Var3.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var3.P(i3 & 1, (i3 & 1171) != 1170)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var3.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var3.l();
            r28 r28VarR = gx1.R(p65Var3, r28Var);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(m45Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, q12.f, zk7VarC);
            tp7.B(p65Var3, q12.e, i89VarL);
            tp7.B(p65Var3, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var3, q12.h);
            tp7.B(p65Var3, q12.d, r28VarR);
            int length = uidVar.a.b.length();
            o28 o28Var2 = o28.b;
            if (length == 0) {
                p65Var3.Y(685294728);
                i2 = i3;
                r1 = 0;
                o28Var = o28Var2;
                jjd.b(vo7.R(p65Var3, R.string.repost_note_add_note_placeholder), bgf.N(o28Var2, "note_placeholder"), ((zo7) p65Var3.j(kt7.b)).o, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var3.j(jt7.c)).m, p65Var3, 48, 0, 131064);
                p65Var2 = p65Var3;
            } else {
                i2 = i3;
                o28Var = o28Var2;
                r1 = 0;
                p65Var3.Y(671258703);
                p65Var2 = p65Var3;
            }
            p65Var2.p(r1);
            r28 r28VarN = bgf.N(jfc.d(o28Var, 1.0f), "note_text_field");
            mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).m;
            sk6 sk6Var = sk6.f;
            yo0.a(uidVar, x45Var, r28VarN, z, mkdVar, sk6.a(3, r1, 1, 118), null, false, 0, 0, null, null, new dkc(((zo7) p65Var2.j(kt7.b)).n), null, p65Var2, (i2 & 14) | 384 | (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i2 << 3) & 7168), 0, 49040);
            p65Var2.p(true);
            p65Var = p65Var2;
        } else {
            p65Var3.S();
            p65Var = p65Var3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ov0(uidVar, x45Var, z, r28Var, i, 6);
        }
    }

    public static final void e(final kl9 kl9Var, final ek8 ek8Var, x12 x12Var, int i) {
        String str = kl9Var.e;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2013844860);
        int i2 = (p65Var.f(kl9Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            String str2 = kl9Var.g;
            boolean z = kl9Var.a;
            kx kxVarW = ho2.w(p65Var, -1725328300);
            int i3 = kl9Var.c;
            String strD = vo7.D(R.plurals.notification_type_post_recommended_milestone, i3, new Object[]{str, Integer.valueOf(i3)}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strD);
                kxVarW.f(iH);
                int iZ = muc.Z(strD, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ);
                p65Var.p(false);
                long j = kl9Var.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_clap);
                int i4 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i5 = i2 & 14;
                boolean z2 = (i4 == 32) | (i5 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: ll9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i6 = i;
                            c1e c1eVar = c1e.a;
                            kl9 kl9Var2 = kl9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i6) {
                                case 0:
                                    ek8Var2.j(kl9Var2.d, kl9Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(kl9Var2.f, kl9Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i6 = (i4 == 32 ? 1 : 0) | (i5 == 4 ? 1 : 0);
                Object objM2 = p65Var.M();
                if (i6 != 0 || objM2 == uobVar) {
                    final int i7 = 1;
                    objM2 = new m45() { // from class: ll9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i62 = i7;
                            c1e c1eVar = c1e.a;
                            kl9 kl9Var2 = kl9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i62) {
                                case 0:
                                    ek8Var2.j(kl9Var2.d, kl9Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(kl9Var2.f, kl9Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str2, numValueOf, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(kl9Var, ek8Var, i, 8);
        }
    }

    public static final void f(final int i, final boolean z, final boolean z2, final m45 m45Var, final r28 r28Var, x12 x12Var, final int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(2019228891);
        int i3 = i2 | (p65Var2.d(i) ? 4 : 2) | (p65Var2.g(z) ? 32 : 16) | (p65Var2.g(z2) ? 256 : 128) | (p65Var2.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            r28 r28VarD = w2g.D(jfc.d(r28Var, 1.0f), 24.0f, 12.0f);
            zq0 zq0Var = z46.n;
            omb ombVarA = nmb.a(qb8.f, zq0Var, p65Var2, 54);
            long j = p65Var2.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            String strQ = vo7.Q(R.string.repost_note_character_count_cd, new Object[]{Integer.valueOf(i), 280}, p65Var2);
            h70 h70Var = new h70(8.0f, true, new z10(21));
            boolean zF = p65Var2.f(strQ);
            Object objM = p65Var2.M();
            if (zF || objM == w12.a) {
                objM = new ov5(strQ, 23);
                p65Var2.j0(objM);
            }
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(wxb.a(o28Var, false, (x45) objM), "character_counter");
            omb ombVarA2 = nmb.a(h70Var, zq0Var, p65Var2, 54);
            long j2 = p65Var2.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarN);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, ombVarA2);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            xz5.o(jfc.l(o28Var, 16.0f), Float.valueOf(iq7.u(i / 280.0f, 0.0f, 1.0f)), 1.0f, 0L, 0L, 0, p65Var2, 390, 120);
            kx kxVarW = ho2.w(p65Var2, 1281590193);
            kxVarW.d(String.valueOf(i));
            int iH = kxVarW.h(new skc(((zo7) p65Var2.j(kt7.b)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d("/280");
                kxVarW.f(iH);
                mx mxVarI = kxVarW.i();
                p65Var2.p(false);
                jjd.c(mxVarI, null, 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var2.j(jt7.c)).n, p65Var2, 0, 0, 262142);
                p65Var = p65Var2;
                p65Var.p(true);
                fo7.i(m45Var, vo7.R(p65Var, z2 ? R.string.common_save : R.string.repost_note_repost_action), xn7.M, bgf.N(o28Var, z2 ? "save_button" : "repost_button"), z, p65Var, ((i3 >> 9) & 14) | 384 | (57344 & (i3 << 9)), 0);
                p65Var.p(true);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(i, z, z2, m45Var, r28Var, i2) { // from class: f9b
                public final /* synthetic */ int a;
                public final /* synthetic */ boolean b;
                public final /* synthetic */ boolean c;
                public final /* synthetic */ m45 d;
                public final /* synthetic */ r28 e;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1);
                    ok7.f(this.a, this.b, this.c, this.d, this.e, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x024f  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0255  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0274  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x027d  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x02e2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void g(defpackage.u9b r42, defpackage.i9b r43, defpackage.sh9 r44, defpackage.r28 r45, defpackage.x12 r46, int r47) {
        /*
            Method dump skipped, instruction units count: 784
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ok7.g(u9b, i9b, sh9, r28, x12, int):void");
    }

    public static final void h(v9b v9bVar, i9b i9bVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1284277124);
        int i2 = i | (p65Var.f(v9bVar) ? 4 : 2) | (p65Var.f(i9bVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            r28 r28VarN = bgf.N(w2g.E(jfc.d(r28Var, 1.0f), 0.0f, 48.0f, 1), "error_state");
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            b24 b24Var = v9bVar.a;
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                uta utaVar = new uta(0, i9bVar, i9b.class, "onRetry", "onRetry()V", 0, 16);
                p65Var.j0(utaVar);
                objM = utaVar;
            }
            iq7.a(b24Var, null, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 0, 190);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 5, v9bVar, i9bVar, r28Var);
        }
    }

    public static final void i(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-516523122);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarN = bgf.N(w2g.E(jfc.d(r28Var, 1.0f), 0.0f, 48.0f, 1), "loading_state");
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            xz5.o(null, null, 0.0f, 0L, 0L, 0, p65Var, 0, 127);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 21);
        }
    }

    public static final void j(x9b x9bVar, nhc nhcVar, i9b i9bVar, sh9 sh9Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        x9bVar.getClass();
        nhcVar.getClass();
        i9bVar.getClass();
        sh9Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-24363908);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(x9bVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(i9bVar) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(sh9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        int i3 = 0;
        if (p65Var2.P(i2 & 1, (i2 & 9363) != 9362)) {
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new qna(15);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(wxb.a(r28VarD, false, (x45) objM), "repost_note_screen"), pxf.E(693264120, new h9b(i3, i9bVar), p65Var2), pxf.E(265994391, new pma(x9bVar, 14, i9bVar), p65Var2), pxf.E(-161275338, new w87(nhcVar, 22), p65Var2), null, 0, 0L, 0L, null, pxf.E(-2091465715, new gx4(x9bVar, i9bVar, sh9Var, 29), p65Var2), p65Var, 805309872, 496);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(x9bVar, nhcVar, i9bVar, sh9Var, r28Var, i, 14);
        }
    }

    public static final void k(String str, g08 g08Var, zm7 zm7Var, r28 r28Var, String str2, boolean z, z9b z9bVar, x12 x12Var, int i) {
        p65 p65Var;
        r28 r28Var2;
        z9b z9bVar2;
        z9b z9bVar3;
        int i2;
        r28 r28Var3;
        z9b z9bVar4;
        str.getClass();
        g08Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1656101604);
        int i3 = i | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(g08Var) ? 32 : 16) | (p65Var2.f(zm7Var) ? 256 : 128) | 3072 | (p65Var2.f(str2) ? 16384 : 8192) | (p65Var2.g(z) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | 524288;
        if (p65Var2.P(i3 & 1, (599187 & i3) != 599186)) {
            p65Var2.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var2.z()) {
                boolean z2 = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((57344 & i3) == 16384) | ((458752 & i3) == 131072);
                Object objM = p65Var2.M();
                if (z2 || objM == uobVar) {
                    objM = new bs(str, g08Var, str2, z);
                    p65Var2.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var2);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    z9bVar3 = (z9b) to7.z(n1b.a.b(z9b.class), wueVarA, t40.E(wueVarA, p65Var2), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var2);
                    i2 = i3 & (-3670017);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var2.S();
                i2 = i3 & (-3670017);
                r28Var3 = r28Var;
                z9bVar3 = z9bVar;
            }
            p65Var2.q();
            l78 l78VarZ = guc.z(z9bVar3.q, p65Var2, 0);
            nhc nhcVarF = mk7.F(p65Var2);
            int i5 = i2 & 896;
            boolean zF = (i5 == 256) | p65Var2.f(z9bVar3);
            Object objM2 = p65Var2.M();
            if (zF || objM2 == uobVar) {
                objM2 = new i9b(zm7Var, z9bVar3);
                p65Var2.j0(objM2);
            }
            i9b i9bVar = (i9b) objM2;
            boolean zF2 = p65Var2.f(z9bVar3);
            Object objM3 = p65Var2.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new j9b();
                p65Var2.j0(objM3);
            }
            r28 r28Var4 = r28Var3;
            j((x9b) l78VarZ.getValue(), nhcVarF, i9bVar, (j9b) objM3, r28Var4, p65Var2, 24576);
            p65Var = p65Var2;
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = kyd.M(p65Var);
                p65Var.j0(objM4);
            }
            sb2 sb2Var = (sb2) objM4;
            boolean zH = p65Var.h(z9bVar3) | p65Var.f(nhcVarF) | (i5 == 256) | p65Var.h(sb2Var) | p65Var.h(resources);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar) {
                z9bVar4 = z9bVar3;
                uk8 uk8Var = new uk8(z9bVar4, nhcVarF, zm7Var, sb2Var, resources, (n92) null);
                p65Var.j0(uk8Var);
                objM5 = uk8Var;
            } else {
                z9bVar4 = z9bVar3;
            }
            kyd.k(p65Var, (b55) objM5, c1e.a);
            z9bVar2 = z9bVar4;
            r28Var2 = r28Var4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
            z9bVar2 = z9bVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new me0(str, g08Var, zm7Var, r28Var2, str2, z, z9bVar2, i);
        }
    }

    public static final void l(nhc nhcVar, r28 r28Var, c55 c55Var, x12 x12Var, int i, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1077081618);
        if ((i & 6) == 0) {
            i3 = (p65Var.f(nhcVar) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        int i4 = i2 & 2;
        if (i4 != 0) {
            i3 |= 48;
        } else if ((i & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        int i5 = i2 & 4;
        if (i5 != 0) {
            i3 |= 384;
        } else if ((i & 384) == 0) {
            i3 |= p65Var.h(c55Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            if (i4 != 0) {
                r28Var = o28.b;
            }
            if (i5 != 0) {
                c55Var = q02.a;
            }
            ihc ihcVarA = nhcVar.a();
            s4 s4Var = (s4) p65Var.j(z22.a);
            boolean zF = p65Var.f(ihcVarA) | p65Var.h(s4Var);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new eub(ihcVarA, s4Var, null, 17);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, ihcVarA);
            a(nhcVar.a(), r28Var, c55Var, p65Var, i3 & PhotoshopDirectory.TAG_CAPTION);
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        c55 c55Var2 = c55Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oc0(nhcVar, r28Var2, c55Var2, i, i2, 12);
        }
    }

    public static final void n(ksc kscVar, isc iscVar, r28 r28Var, x12 x12Var, int i) {
        ar0 ar0Var;
        Object jocVar;
        float f2;
        ksc kscVar2 = kscVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-206287180);
        int i2 = i | (p65Var.f(kscVar2) ? 4 : 2) | (p65Var.f(iscVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "stories_error_state"), 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            kscVar2 = kscVar;
            b24 b24Var = kscVar2.a;
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                f2 = 1.0f;
                jocVar = new joc(0, iscVar, isc.class, "refresh", "refresh()V", 0, 6);
                p65Var.j0(jocVar);
            } else {
                jocVar = objM;
                ar0Var = ar0Var2;
                f2 = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f2), ar0Var), null, null, null, null, (m45) ((qh6) jocVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 25, kscVar2, iscVar, r28Var);
        }
    }

    public static final void o(r28 r28Var, x12 x12Var, int i) {
        ar0 ar0Var = z46.d;
        ar0 ar0Var2 = z46.h;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1723339892);
        int i2 = i | (p65Var.f(r28Var) ? 4 : 2);
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarN = bgf.N(m40.V(r28Var, p65Var, i2 & 14), "stories_loading_state");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            long j2 = ((zo7) p65Var.j(kt7.b)).c;
            sn3 sn3Var = kt7.a;
            jp7 jp7Var = (jp7) p65Var.j(sn3Var);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarO = jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11);
            o28 o28Var2 = o28Var;
            r28 r28VarD = jfc.d(r28VarO, 1.0f);
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            pr7.c(6, j2, p65Var, null, true);
            p65Var.p(true);
            p65Var.p(true);
            r28 r28VarJ2 = ka1.j((jp7) p65Var.j(sn3Var), o28Var2, 3, 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var2, false);
            ar0 ar0Var3 = ar0Var2;
            long j5 = p65Var.T;
            int i6 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarJ2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var4 = ar0Var;
            zk7 zk7VarC4 = dy0.c(ar0Var4, false);
            long j6 = p65Var.T;
            int i7 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC4);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            wy6.b(0, j2, p65Var, null);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.Y(847562642);
            int iR = 0;
            while (iR < 5) {
                r28 r28VarJ3 = ka1.j((jp7) p65Var.j(kt7.a), o28Var2, 3, 1.0f);
                ar0 ar0Var5 = ar0Var3;
                zk7 zk7VarC5 = dy0.c(ar0Var5, false);
                long j7 = p65Var.T;
                int i8 = (int) (j7 ^ (j7 >>> 32));
                i89 i89VarL6 = p65Var.l();
                r28 r28VarR6 = gx1.R(p65Var, r28VarJ3);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar5 = q12.f;
                tp7.B(p65Var, cuVar5, zk7VarC5);
                cu cuVar6 = q12.e;
                tp7.B(p65Var, cuVar6, i89VarL6);
                Integer numValueOf2 = Integer.valueOf(i8);
                cu cuVar7 = q12.g;
                tp7.B(p65Var, cuVar7, numValueOf2);
                fn fnVar2 = q12.h;
                tp7.y(p65Var, fnVar2);
                cu cuVar8 = q12.d;
                tp7.B(p65Var, cuVar8, r28VarR6);
                o28 o28Var3 = o28Var2;
                r28 r28VarD3 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC6 = dy0.c(ar0Var4, false);
                long j8 = p65Var.T;
                int i9 = (int) (j8 ^ (j8 >>> 32));
                i89 i89VarL7 = p65Var.l();
                r28 r28VarR7 = gx1.R(p65Var, r28VarD3);
                p65Var.c0();
                ar0 ar0Var6 = ar0Var4;
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar5, zk7VarC6);
                tp7.B(p65Var, cuVar6, i89VarL7);
                ka1.z(i9, p65Var, cuVar7, p65Var, fnVar2);
                tp7.B(p65Var, cuVar8, r28VarR7);
                kk7.p(384, j2, p65Var, null, false);
                iR = wgd.r(p65Var, true, true, iR, 1);
                ar0Var3 = ar0Var5;
                o28Var2 = o28Var3;
                ar0Var4 = ar0Var6;
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 26);
        }
    }

    public static final void p(usc uscVar, kv6 kv6Var, isc iscVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        uscVar.getClass();
        kv6Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-157416465);
        int i3 = 4;
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(uscVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(kv6Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= (i & 512) == 0 ? p65Var2.f(iscVar) : p65Var2.h(iscVar) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new dsb(21);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "stories_screen"), null, null, null, null, 0, 0L, 0L, qb8.p, pxf.E(-665288514, new gab(uscVar, kv6Var, iscVar, i3), p65Var2), p65Var, 805306368, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 20, uscVar, kv6Var, iscVar, r28Var);
        }
    }

    public static final void q(String str, String str2, hsc hscVar, r28 r28Var, zsc zscVar, x12 x12Var, int i) {
        zsc zscVar2;
        zsc zscVar3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-284072650);
        int i2 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(hscVar) ? 256 : 128) | 8192;
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            p65Var.U();
            int i3 = i & 1;
            uob uobVar = w12.a;
            if (i3 == 0 || p65Var.z()) {
                boolean z = ((i2 & 14) == 4) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 18);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                zscVar3 = (zsc) to7.z(n1b.a.b(zsc.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
            } else {
                p65Var.S();
                zscVar3 = zscVar;
            }
            p65Var.q();
            p((usc) guc.z(zscVar3.m, p65Var, 0).getValue(), pv6.a(p65Var), new isc(zscVar3, hscVar), r28Var, p65Var, 3072);
            boolean zH = p65Var.h(zscVar3);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new obb(zscVar3, null, 10);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            zscVar2 = zscVar3;
        } else {
            p65Var.S();
            zscVar2 = zscVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) str2, (Object) hscVar, r28Var, (que) zscVar2, i, 28);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0136  */
    /* JADX WARN: Removed duplicated region for block: B:67:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void r(float r18, int r19, int r20, long r21, defpackage.x12 r23, defpackage.r28 r24, defpackage.mkd r25) {
        /*
            Method dump skipped, instruction units count: 320
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ok7.r(float, int, int, long, x12, r28, mkd):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0135  */
    /* JADX WARN: Removed duplicated region for block: B:67:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void s(float r18, int r19, int r20, long r21, defpackage.x12 r23, defpackage.r28 r24, defpackage.mkd r25) {
        /*
            Method dump skipped, instruction units count: 319
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ok7.s(float, int, int, long, x12, r28, mkd):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00c9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void t(defpackage.ot7 r40, float r41, defpackage.hy8 r42, defpackage.mz1 r43, defpackage.x12 r44, int r45) {
        /*
            Method dump skipped, instruction units count: 536
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ok7.t(ot7, float, hy8, mz1, x12, int):void");
    }

    public static final long u(float f2, float f3) {
        return (((long) Float.floatToRawIntBits(f3)) & 4294967295L) | (Float.floatToRawIntBits(f2) << 32);
    }

    public static oqb v(Callable callable) {
        try {
            Object objCall = callable.call();
            il7.B("Scheduler Callable result can't be null", objCall);
            return (oqb) objCall;
        } catch (Throwable th) {
            throw w34.a(th);
        }
    }

    public static int w(int i, int i2, int i3) {
        return i < i2 ? i2 : i > i3 ? i3 : i;
    }

    public static final boolean x(mn6 mn6Var, zvd zvdVar, Set set) {
        boolean zX;
        if (g76.L(mn6Var.j0(), zvdVar)) {
            return true;
        }
        co1 co1VarA = mn6Var.j0().a();
        do1 do1Var = co1VarA instanceof do1 ? (do1) co1VarA : null;
        List listG0 = do1Var != null ? do1Var.g0() : null;
        Iterable iterableS1 = bu1.s1(mn6Var.h0());
        if (!(iterableS1 instanceof Collection) || !((Collection) iterableS1).isEmpty()) {
            Iterator it2 = iterableS1.iterator();
            do {
                zm3 zm3Var = (zm3) it2;
                if (zm3Var.b.hasNext()) {
                    r06 r06Var = (r06) zm3Var.next();
                    int i = r06Var.a;
                    xwd xwdVar = (xwd) r06Var.b;
                    swd swdVar = listG0 != null ? (swd) bu1.A0(i, listG0) : null;
                    if ((swdVar == null || set == null || !set.contains(swdVar)) && !xwdVar.c()) {
                        mn6 mn6VarB = xwdVar.b();
                        mn6VarB.getClass();
                        zX = x(mn6VarB, zvdVar, set);
                    } else {
                        zX = false;
                    }
                }
            } while (!zX);
            return true;
        }
        return false;
    }

    public static final onc y(mn6 mn6Var, pqe pqeVar, swd swdVar) {
        mn6Var.getClass();
        pqeVar.getClass();
        if ((swdVar != null ? swdVar.z() : null) == pqeVar) {
            pqeVar = pqe.INVARIANT;
        }
        return new onc(mn6Var, pqeVar);
    }

    public static final long z(gz8 gz8Var) {
        return nk7.x0(gz8Var.l() * gz8Var.q()) + (((long) gz8Var.k()) * ((long) gz8Var.q()));
    }

    public static final void m(jsc jscVar, kv6 kv6Var, isc iscVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        msc mscVar;
        int i2;
        uob uobVar;
        isc iscVar2 = iscVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1700645121);
        int i3 = i | (p65Var2.f(jscVar) ? 4 : 2) | (p65Var2.f(kv6Var) ? 32 : 16) | (p65Var2.f(iscVar2) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            ssc sscVar = jscVar.a;
            msc mscVar2 = jscVar.b;
            boolean z = sscVar.c || mscVar2.e;
            int i4 = i3 & 896;
            boolean z2 = i4 == 256;
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (z2 || objM == uobVar2) {
                mscVar = mscVar2;
                i2 = i4;
                uobVar = uobVar2;
                joc jocVar = new joc(0, iscVar, isc.class, MaAxRJinch.XmbUNNNhIptTE, "refresh()V", 0, 4);
                p65Var2.j0(jocVar);
                objM = jocVar;
            } else {
                mscVar = mscVar2;
                i2 = i4;
                uobVar = uobVar2;
            }
            iscVar2 = iscVar;
            er7.d(z, (m45) ((qh6) objM), bgf.N(r28Var, "stories_content_state"), null, 0L, 0L, false, 0.0f, null, null, pxf.E(-1705924815, new g91(kv6Var, (Object) sscVar, (Object) iscVar, (Object) mscVar, (Object) jscVar, 5), p65Var2), p65Var2, 0, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            p65Var = p65Var2;
            boolean z3 = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | (i2 == 256);
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                objM2 = new eub(kv6Var, iscVar2, null, 20);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 8, jscVar, kv6Var, iscVar2, r28Var);
        }
    }
}
