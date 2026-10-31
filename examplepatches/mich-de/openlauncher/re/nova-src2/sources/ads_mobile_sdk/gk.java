package ads_mobile_sdk;

import android.content.Context;
import android.os.Build;
import android.text.TextUtils;
import b.c0;
import fi.t;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.HashSet;
import java.util.regex.Pattern;

/* loaded from: classes2.dex */
public final class gk {

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f3878c = Pattern.compile(".*\\.so$", 2);

    /* renamed from: a, reason: collision with root package name */
    public final Context f3879a;

    /* renamed from: b, reason: collision with root package name */
    public final v6 f3880b;

    public gk(Context context, v6 v6Var) {
        this.f3879a = context;
        this.f3880b = v6Var;
    }

    public final void a(String str, byte[] bArr) {
        v6 v6Var = this.f3880b;
        if (v6Var == null) {
            return;
        }
        StringBuilder sb2 = new StringBuilder("os.arch:");
        sb2.append(System.getProperty("os.arch"));
        sb2.append(";");
        try {
            String[] strArr = (String[]) Build.class.getField("SUPPORTED_ABIS").get(null);
            if (strArr != null) {
                sb2.append("supported_abis:");
                sb2.append(Arrays.toString(strArr));
                sb2.append(";");
            }
        } catch (IllegalAccessException | NoSuchFieldException unused) {
        }
        sb2.append("CPU_ABI:");
        sb2.append(Build.CPU_ABI);
        sb2.append(";CPU_ABI2:");
        sb2.append(Build.CPU_ABI2);
        sb2.append(";");
        if (bArr != null) {
            sb2.append("ELF:");
            sb2.append(Arrays.toString(bArr));
            sb2.append(";");
        }
        if (str != null) {
            c0.C(sb2, "dbg:", str, ";");
        }
        ((qm1) v6Var.f10600a).a(4007, -1L, sb2.toString(), null);
        new t().t(Boolean.TRUE);
    }

    /* JADX WARN: Removed duplicated region for block: B:110:0x01a8  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x01ab  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0105  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final fk a() throws Throwable {
        char c11;
        fk fkVar;
        FileInputStream fileInputStream;
        byte[] bArr;
        String[] strArr;
        File file = new File(new File(this.f3879a.getApplicationInfo().dataDir), "lib");
        boolean zExists = file.exists();
        fk fkVar2 = fk.X86;
        fk fkVar3 = fk.ARM7;
        fk fkVar4 = fk.X86_64;
        fk fkVar5 = fk.ARM64;
        fk fkVar6 = fk.RISCV64;
        fk fkVar7 = fk.UNKNOWN;
        fk fkVar8 = fk.UNSUPPORTED;
        v6 v6Var = this.f3880b;
        if (zExists) {
            File[] fileArrListFiles = file.listFiles(new o80.j(f3878c));
            if (fileArrListFiles == null || fileArrListFiles.length == 0) {
                c11 = 0;
                if (v6Var != null) {
                    ((qm1) v6Var.f10600a).a(5017, -1L, "No .so", null);
                    new t().t(Boolean.TRUE);
                }
                fkVar = fkVar7;
            } else {
                try {
                    fileInputStream = new FileInputStream(fileArrListFiles[0]);
                } catch (IOException e3) {
                    e = e3;
                    c11 = 0;
                }
                try {
                    try {
                        bArr = new byte[20];
                    } catch (Throwable th2) {
                        th = th2;
                        c11 = 0;
                    }
                } catch (IOException e11) {
                    e = e11;
                    a(e.toString(), null);
                    fkVar = fkVar8;
                    if (fkVar != fkVar7) {
                    }
                    if (v6Var != null) {
                    }
                    return fkVar2;
                }
                if (fileInputStream.read(bArr) == 20) {
                    byte[] bArr2 = {0, 0};
                    c11 = 0;
                    try {
                        if (bArr[5] == 2) {
                            a(null, bArr);
                        } else {
                            bArr2[0] = bArr[19];
                            bArr2[1] = bArr[18];
                            short s11 = ByteBuffer.wrap(bArr2).getShort();
                            if (s11 == 3) {
                                fkVar = fkVar2;
                            } else if (s11 == 40) {
                                fkVar = fkVar3;
                            } else if (s11 == 62) {
                                fkVar = fkVar4;
                            } else if (s11 == 183) {
                                fkVar = fkVar5;
                            } else if (s11 != 243) {
                                a(null, bArr);
                            } else {
                                fkVar = fkVar6;
                            }
                            fileInputStream.close();
                        }
                        fkVar = fkVar8;
                        fileInputStream.close();
                    } catch (Throwable th3) {
                        th = th3;
                        Throwable th4 = th;
                        try {
                            fileInputStream.close();
                            throw th4;
                        } catch (Throwable th5) {
                            th4.addSuppressed(th5);
                            throw th4;
                        }
                    }
                } else {
                    c11 = 0;
                    fileInputStream.close();
                    fkVar = fkVar8;
                }
            }
        } else {
            if (v6Var != null) {
                ((qm1) v6Var.f10600a).a(5017, -1L, "No lib/", null);
                new t().t(Boolean.TRUE);
            }
            fkVar = fkVar7;
            c11 = 0;
        }
        if (fkVar != fkVar7) {
            HashSet hashSet = new HashSet(Arrays.asList("i686", "armv71"));
            String property = System.getProperty("os.arch");
            if (TextUtils.isEmpty(property) || !hashSet.contains(property)) {
                try {
                    strArr = (String[]) Build.class.getField("SUPPORTED_ABIS").get(null);
                } catch (IllegalAccessException e12) {
                    if (v6Var != null) {
                        v6Var.a(2024, 0L, e12);
                    }
                } catch (NoSuchFieldException e13) {
                    if (v6Var != null) {
                        v6Var.a(2024, 0L, e13);
                    }
                }
                if (strArr != null && strArr.length > 0) {
                    property = strArr[c11];
                } else {
                    property = Build.CPU_ABI;
                    if (property == null) {
                        property = Build.CPU_ABI2;
                    }
                }
            }
            if (TextUtils.isEmpty(property)) {
                a("Empty dev arch", null);
            } else if (!property.equalsIgnoreCase("i686") && !property.equalsIgnoreCase("x86")) {
                if (property.equalsIgnoreCase("x86_64")) {
                    fkVar2 = fkVar4;
                } else if (property.equalsIgnoreCase("arm64-v8a")) {
                    fkVar2 = fkVar5;
                } else if (property.equalsIgnoreCase("armeabi-v7a") || property.equalsIgnoreCase("armv71")) {
                    fkVar2 = fkVar3;
                } else if (property.equalsIgnoreCase("riscv64")) {
                    fkVar2 = fkVar6;
                } else {
                    a(property, null);
                }
            }
            fkVar2 = fkVar8;
        } else {
            fkVar2 = fkVar;
        }
        if (v6Var != null) {
            ((qm1) v6Var.f10600a).a(5018, -1L, fkVar2.name(), null);
            new t().t(Boolean.TRUE);
        }
        return fkVar2;
    }
}
