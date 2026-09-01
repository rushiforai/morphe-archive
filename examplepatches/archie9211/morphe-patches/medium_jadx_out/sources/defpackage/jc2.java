package defpackage;

import android.content.Context;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Locale;
import java.util.NavigableSet;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicMarkableReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class jc2 {
    public static final fc2 r = new fc2(1);
    public static final Charset s = Charset.forName("UTF-8");
    public final Context a;
    public final ft2 b;
    public final s26 c;
    public final lod d;
    public final m50 e;
    public final sv5 f;
    public final bh4 g;
    public final g40 h;
    public final s26 i;
    public final pc2 j;
    public final vj k;
    public final gc2 l;
    public final jz1 m;
    public td2 n;
    public final wfd o = new wfd();
    public final wfd p = new wfd();
    public final wfd q = new wfd();

    public jc2(Context context, sv5 sv5Var, ft2 ft2Var, bh4 bh4Var, s26 s26Var, g40 g40Var, lod lodVar, s26 s26Var2, jz1 jz1Var, pc2 pc2Var, vj vjVar, gc2 gc2Var, m50 m50Var) {
        new AtomicBoolean(false);
        this.a = context;
        this.f = sv5Var;
        this.b = ft2Var;
        this.g = bh4Var;
        this.c = s26Var;
        this.h = g40Var;
        this.d = lodVar;
        this.i = s26Var2;
        this.j = pc2Var;
        this.k = vjVar;
        this.l = gc2Var;
        this.m = jz1Var;
        this.e = m50Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:195:0x05ca  */
    /* JADX WARN: Type inference failed for: r0v7, types: [gc2] */
    /* JADX WARN: Type inference failed for: r10v2 */
    /* JADX WARN: Type inference failed for: r10v29 */
    /* JADX WARN: Type inference failed for: r10v3, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r10v30, types: [int] */
    /* JADX WARN: Type inference failed for: r10v60 */
    /* JADX WARN: Type inference failed for: r10v61 */
    /* JADX WARN: Type inference failed for: r32v0, types: [boolean] */
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
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(boolean r32, defpackage.iv2 r33, boolean r34) {
        /*
            Method dump skipped, instruction units count: 1863
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jc2.a(boolean, iv2, boolean):void");
    }

    public final boolean c(iv2 iv2Var) {
        m50.l();
        td2 td2Var = this.n;
        if (td2Var != null && td2Var.e.get()) {
            Log.w("FirebaseCrashlytics", "Skipping session finalization because a crash has already occurred.", null);
            return false;
        }
        if (Log.isLoggable("FirebaseCrashlytics", 2)) {
            Log.v("FirebaseCrashlytics", "Finalizing previously open sessions.", null);
        }
        try {
            a(true, iv2Var, true);
            if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                Log.v("FirebaseCrashlytics", "Closed all previously open sessions.", null);
            }
            return true;
        } catch (Exception e) {
            Log.e("FirebaseCrashlytics", "Unable to finalize previously open sessions.", e);
            return false;
        }
    }

    public final String d() {
        NavigableSet navigableSetC = ((sd2) this.m.c).c();
        if (navigableSetC.isEmpty()) {
            return null;
        }
        return (String) navigableSetC.first();
    }

    public final String e() throws IOException {
        InputStream resourceAsStream;
        ByteArrayOutputStream byteArrayOutputStream;
        byte[] bArr;
        Context context = this.a;
        int iK = gx1.K(context, "com.google.firebase.crashlytics.version_control_info", "string");
        String string = iK == 0 ? null : context.getResources().getString(iK);
        if (string != null) {
            if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                Log.d("FirebaseCrashlytics", "Read version control info from string resource", null);
            }
            return Base64.encodeToString(string.getBytes(s), 0);
        }
        ClassLoader classLoader = jc2.class.getClassLoader();
        if (classLoader == null) {
            Log.w("FirebaseCrashlytics", "Couldn't get Class Loader", null);
            resourceAsStream = null;
        } else {
            resourceAsStream = classLoader.getResourceAsStream("META-INF/version-control-info.textproto");
        }
        if (resourceAsStream == null) {
            if (resourceAsStream != null) {
                resourceAsStream.close();
            }
            Log.i("FirebaseCrashlytics", "No version control information found", null);
            return null;
        }
        try {
            if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                Log.d("FirebaseCrashlytics", "Read version control info from file", null);
            }
            byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                bArr = new byte[1024];
            } finally {
            }
        } catch (Throwable th) {
            try {
                resourceAsStream.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
        while (true) {
            int i = resourceAsStream.read(bArr);
            if (i == -1) {
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                byteArrayOutputStream.close();
                String strEncodeToString = Base64.encodeToString(byteArray, 0);
                resourceAsStream.close();
                return strEncodeToString;
            }
            byteArrayOutputStream.write(bArr, 0, i);
            resourceAsStream.close();
            throw th;
        }
    }

    public final jrg f() {
        jrg jrgVarJ;
        ArrayList arrayList = new ArrayList();
        for (File file : bh4.f(((File) this.g.c).listFiles(r))) {
            try {
                long j = Long.parseLong(file.getName().substring(3));
                try {
                    Class.forName("com.google.firebase.crash.FirebaseCrash");
                    Log.w("FirebaseCrashlytics", "Skipping logging Crashlytics event to Firebase, FirebaseCrash exists", null);
                    jrgVarJ = vp7.x(null);
                } catch (ClassNotFoundException unused) {
                    if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                        Log.d("FirebaseCrashlytics", "Logging app exception event to Firebase Analytics", null);
                    }
                    jrgVarJ = vp7.j(new ScheduledThreadPoolExecutor(1), new ic2(this, j));
                }
                arrayList.add(jrgVarJ);
            } catch (NumberFormatException unused2) {
                Log.w("FirebaseCrashlytics", "Could not parse app exception timestamp from file " + file.getName(), null);
            }
            file.delete();
        }
        return vp7.H(arrayList);
    }

    public final void g() {
        try {
            String strE = e();
            if (strE != null) {
                try {
                    ((zf3) this.d.e).p("com.crashlytics.version-control-info", strE);
                } catch (IllegalArgumentException e) {
                    Context context = this.a;
                    if (context != null) {
                        if ((context.getApplicationInfo().flags & 2) != 0) {
                            throw e;
                        }
                    }
                    Log.e("FirebaseCrashlytics", "Attempting to set custom attribute with null key, ignoring.", null);
                }
                Log.i("FirebaseCrashlytics", "Saved version control info", null);
            }
        } catch (IOException e2) {
            Log.w("FirebaseCrashlytics", "Unable to save version control info", e2);
        }
    }

    public final void b(String str, Boolean bool) {
        fx1 fx1Var;
        String str2;
        String str3;
        String str4;
        String str5;
        Integer num;
        long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
        String strR = ka1.r("Opening a new session with ID ", str);
        if (Log.isLoggable("FirebaseCrashlytics", 3)) {
            Log.d("FirebaseCrashlytics", strR, null);
        }
        Locale locale = Locale.US;
        sv5 sv5Var = this.f;
        g40 g40Var = this.h;
        gk0 gk0Var = new gk0(sv5Var.c, g40Var.f, g40Var.g, sv5Var.c().a, d63.determineFrom(g40Var.d).getId(), g40Var.h);
        String str6 = Build.VERSION.RELEASE;
        String str7 = Build.VERSION.CODENAME;
        ik0 ik0Var = new ik0(gx1.O());
        Context context = this.a;
        StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
        long blockCount = ((long) statFs.getBlockCount()) * ((long) statFs.getBlockSize());
        fx1 fx1Var2 = fx1.X86_32;
        String str8 = Build.CPU_ABI;
        if (TextUtils.isEmpty(str8)) {
            if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                Log.v("FirebaseCrashlytics", "Architecture#getValue()::Build.CPU_ABI returned null or empty", null);
            }
            fx1Var = fx1.UNKNOWN;
        } else {
            fx1Var = (fx1) fx1.a.get(str8.toLowerCase(locale));
            if (fx1Var == null) {
                fx1Var = fx1.UNKNOWN;
            }
        }
        int iOrdinal = fx1Var.ordinal();
        String str9 = Build.MODEL;
        int iAvailableProcessors = Runtime.getRuntime().availableProcessors();
        long jZ = gx1.z(context);
        boolean zN = gx1.N();
        int iH = gx1.H();
        String str10 = Build.MANUFACTURER;
        String str11 = Build.PRODUCT;
        this.j.d(str, jCurrentTimeMillis, new fk0(gk0Var, ik0Var, new hk0(iOrdinal, iAvailableProcessors, jZ, blockCount, zN, iH)));
        if (!bool.booleanValue() || str == null) {
            str2 = str7;
            str3 = str10;
            str4 = str9;
            str5 = str11;
        } else {
            lod lodVar = this.d;
            synchronized (((String) lodVar.c)) {
                lodVar.c = str;
                str4 = str9;
                str3 = str10;
                str2 = str7;
                str5 = str11;
                ((ud2) ((m50) lodVar.b).c).a(new q13(lodVar, str, ((cl6) ((AtomicMarkableReference) ((zf3) lodVar.d).d).getReference()).a(), ((ru) lodVar.f).g(), 4));
            }
        }
        s26 s26Var = this.i;
        ((pg4) s26Var.c).c();
        s26Var.c = s26.e;
        if (str != null) {
            s26Var.c = new cra(((bh4) s26Var.b).b(str, "userlog"));
        }
        this.l.b(str);
        jz1 jz1Var = this.m;
        qd2 qd2Var = (qd2) jz1Var.b;
        Charset charset = pd2.a;
        uh0 uh0Var = new uh0();
        uh0Var.a = "20.0.6";
        g40 g40Var2 = qd2Var.c;
        String str12 = g40Var2.a;
        if (str12 == null) {
            z72.c("Null gmpAppId");
            return;
        }
        uh0Var.b = str12;
        sv5 sv5Var2 = qd2Var.b;
        String str13 = sv5Var2.c().a;
        if (str13 == null) {
            z72.c("Null installationUuid");
            return;
        }
        uh0Var.d = str13;
        uh0Var.e = sv5Var2.c().b;
        uh0Var.f = sv5Var2.c().c;
        String str14 = g40Var2.f;
        if (str14 == null) {
            z72.c("Null buildVersion");
            return;
        }
        uh0Var.h = str14;
        String str15 = g40Var2.g;
        if (str15 == null) {
            z72.c("Null displayVersion");
            return;
        }
        uh0Var.i = str15;
        uh0Var.c = 4;
        uh0Var.m = (byte) (uh0Var.m | 1);
        di0 di0Var = new di0();
        di0Var.f = false;
        byte b = (byte) (di0Var.m | 2);
        di0Var.d = jCurrentTimeMillis;
        di0Var.m = (byte) (b | 1);
        if (str == null) {
            z72.c(KLTXZbnQvj.KyvwTxdXUofo);
            return;
        }
        di0Var.b = str;
        String str16 = qd2.g;
        if (str16 == null) {
            z72.c("Null generator");
            return;
        }
        di0Var.a = str16;
        String str17 = sv5Var2.c;
        if (str17 == null) {
            z72.c("Null identifier");
            return;
        }
        lig ligVar = g40Var2.h;
        String str18 = sv5Var2.c().a;
        ma3 ma3Var = (ma3) ligVar.c;
        if (ma3Var == null) {
            ma3Var = new ma3(ligVar);
            ligVar.c = ma3Var;
        }
        ma3 ma3Var2 = ma3Var;
        String str19 = ma3Var.b;
        if (ma3Var2 == null) {
            ma3Var2 = new ma3(ligVar);
            ligVar.c = ma3Var2;
        }
        di0Var.g = new fi0(str17, str14, str15, str18, str19, ma3Var2.c);
        cj0 cj0Var = new cj0();
        cj0Var.a = 3;
        cj0Var.e = (byte) (cj0Var.e | 1);
        if (str6 == null) {
            z72.c("Null version");
            return;
        }
        cj0Var.b = str6;
        if (str2 == null) {
            z72.c("Null buildVersion");
            return;
        }
        cj0Var.c = str2;
        cj0Var.d = gx1.O();
        cj0Var.e = (byte) (cj0Var.e | 2);
        di0Var.i = cj0Var.a();
        StatFs statFs2 = new StatFs(Environment.getDataDirectory().getPath());
        int iIntValue = 7;
        if (!TextUtils.isEmpty(str8) && (num = (Integer) qd2.f.get(str8.toLowerCase(locale))) != null) {
            iIntValue = num.intValue();
        }
        int iAvailableProcessors2 = Runtime.getRuntime().availableProcessors();
        long jZ2 = gx1.z(qd2Var.a);
        long blockCount2 = ((long) statFs2.getBlockCount()) * ((long) statFs2.getBlockSize());
        boolean zN2 = gx1.N();
        int iH2 = gx1.H();
        hi0 hi0Var = new hi0();
        hi0Var.a = iIntValue;
        byte b2 = (byte) (hi0Var.j | 1);
        hi0Var.j = b2;
        if (str4 == null) {
            z72.c("Null model");
            return;
        }
        hi0Var.b = str4;
        hi0Var.c = iAvailableProcessors2;
        hi0Var.d = jZ2;
        hi0Var.e = blockCount2;
        hi0Var.f = zN2;
        hi0Var.g = iH2;
        hi0Var.j = (byte) (((byte) (((byte) (((byte) (((byte) (b2 | 2)) | 4)) | 8)) | 16)) | 32);
        String str20 = str3;
        if (str20 == null) {
            z72.c("Null manufacturer");
            return;
        }
        hi0Var.h = str20;
        String str21 = str5;
        if (str21 == null) {
            z72.c("Null modelClass");
            return;
        }
        hi0Var.i = str21;
        di0Var.j = hi0Var.a();
        di0Var.l = 3;
        di0Var.m = (byte) (di0Var.m | 4);
        uh0Var.j = di0Var.a();
        vh0 vh0VarA = uh0Var.a();
        bh4 bh4Var = ((sd2) jz1Var.c).b;
        od2 od2Var = vh0VarA.k;
        if (od2Var == null) {
            if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                Log.d("FirebaseCrashlytics", "Could not get session for report", null);
                return;
            }
            return;
        }
        String str22 = ((ei0) od2Var).b;
        try {
            sd2.g.getClass();
            sd2.f(bh4Var.b(str22, "report"), rd2.a.I(vh0VarA));
            File fileB = bh4Var.b(str22, "start-time");
            long j = ((ei0) od2Var).d;
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(new FileOutputStream(fileB), sd2.e);
            try {
                outputStreamWriter.write("");
                fileB.setLastModified(j * 1000);
                outputStreamWriter.close();
            } finally {
            }
        } catch (IOException e) {
            String strR2 = ka1.r("Could not persist report for session ", str22);
            if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                Log.d("FirebaseCrashlytics", strR2, e);
            }
        }
    }

    public final void h(jrg jrgVar) {
        jrg jrgVar2;
        jrg jrgVarP;
        wfd wfdVar = this.o;
        bh4 bh4Var = ((sd2) this.m.c).b;
        if (bh4.f(((File) bh4Var.e).listFiles()).isEmpty() && bh4.f(((File) bh4Var.f).listFiles()).isEmpty() && bh4.f(((File) bh4Var.g).listFiles()).isEmpty()) {
            if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                Log.v("FirebaseCrashlytics", "No crash reports are available to be sent.", null);
            }
            wfdVar.d(Boolean.FALSE);
            return;
        }
        uob uobVar = uob.e;
        uobVar.p("Crash reports are available to be sent.");
        ft2 ft2Var = this.b;
        int i = 15;
        if (ft2Var.a()) {
            if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                Log.d("FirebaseCrashlytics", "Automatic data collection is enabled. Allowing upload.", null);
            }
            wfdVar.d(Boolean.FALSE);
            jrgVarP = vp7.x(Boolean.TRUE);
        } else {
            uobVar.o("Automatic data collection is disabled.");
            uobVar.p("Notifying that unsent reports are available.");
            wfdVar.d(Boolean.TRUE);
            synchronized (ft2Var.b) {
                jrgVar2 = ((wfd) ft2Var.d).a;
            }
            fa4 fa4Var = new fa4(i);
            jrgVar2.getClass();
            p7f p7fVar = yfd.a;
            jrg jrgVar3 = new jrg();
            jrgVar2.b.h(new l6g(p7fVar, fa4Var, jrgVar3));
            jrgVar2.r();
            uobVar.o(mgKMENwrbHf.wvJFQYl);
            jrgVarP = yi2.P(jrgVar3, this.p.a);
        }
        jrgVarP.l((ud2) this.e.b, new lig(this, i, jrgVar));
    }
}
