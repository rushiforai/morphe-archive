package ads_mobile_sdk;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import b.k9;
import java.io.File;
import java.util.HashSet;

/* loaded from: classes.dex */
public final class gm2 {

    /* renamed from: a, reason: collision with root package name */
    public final File f4001a;

    /* renamed from: b, reason: collision with root package name */
    public final File f4002b;

    /* renamed from: c, reason: collision with root package name */
    public final SharedPreferences f4003c;

    /* renamed from: d, reason: collision with root package name */
    public final b.w4 f4004d;

    /* renamed from: e, reason: collision with root package name */
    public final vi3 f4005e;

    public gm2(Context context, SharedPreferences sharedPreferences, b.w4 w4Var, vi3 vi3Var) {
        this.f4003c = sharedPreferences;
        File dir = context.getDir("pccache2", 0);
        k9.z(dir, false);
        this.f4001a = dir;
        File dir2 = context.getDir("tmppccache2", 0);
        k9.z(dir2, true);
        this.f4002b = dir2;
        this.f4004d = w4Var;
        this.f4005e = vi3Var;
    }

    public final rm2 a(int i5) {
        String string;
        b.w4 w4Var = this.f4004d;
        SharedPreferences sharedPreferences = this.f4003c;
        if (i5 == 1) {
            string = sharedPreferences.getString("LATMTD" + ((fk) w4Var.get()).f3374a, null);
        } else if (i5 == 2) {
            string = sharedPreferences.getString("FBAMTD" + ((fk) w4Var.get()).f3374a, null);
        } else {
            string = null;
        }
        if (!TextUtils.isEmpty(string)) {
            try {
                int length = string.length();
                if (length % 2 != 0) {
                    throw new IllegalArgumentException("Hex string has odd number of characters");
                }
                int i11 = length / 2;
                byte[] bArr = new byte[i11];
                int i12 = 0;
                while (i12 < length) {
                    int i13 = i12 + 2;
                    bArr[i12 / 2] = (byte) Integer.parseInt(string.substring(i12, i13), 16);
                    i12 = i13;
                }
                rm2 rm2VarA = rm2.a(sq.a(0, i11, bArr));
                if (a(rm2VarA.r().r())) {
                    return rm2VarA;
                }
            } catch (yi1 unused) {
                this.f4005e.b(yk0.EVENT_ID_DG_STORAGE_PROGRAM_CACHE_PARSE_METADATA_EXCEPTION);
                return null;
            }
        }
        return null;
    }

    public final boolean a(String str) {
        File fileP = k9.p(str, a(), "pcam.jar");
        fileP.getClass();
        if (!fileP.exists()) {
            fileP = k9.p(str, a(), "pcam");
            fileP.getClass();
        }
        File fileP2 = k9.p(str, a(), "pcbc");
        fileP2.getClass();
        return fileP.exists() && fileP2.exists();
    }

    public final void a(rm2 rm2Var, byte[] bArr, byte[] bArr2) {
        File file;
        File file2;
        String strR = rm2Var.r().r();
        boolean zIsEmpty = TextUtils.isEmpty(strR);
        vi3 vi3Var = this.f4005e;
        if (!zIsEmpty && bArr2.length != 0) {
            File file3 = this.f4002b;
            k9.E(file3);
            file3.mkdirs();
            if (TextUtils.isEmpty(strR)) {
                file = null;
            } else {
                file = new File(file3, strR);
                k9.z(file, false);
            }
            file.getClass();
            file.mkdirs();
            File fileP = k9.p(strR, file3, "pcam.jar");
            fileP.getClass();
            if (bArr == null || bArr.length <= 0 || k9.F(fileP, bArr)) {
                File fileP2 = k9.p(strR, file3, "pcbc");
                fileP2.getClass();
                if (k9.F(fileP2, bArr2)) {
                    String strR2 = rm2Var.r().r();
                    if (!TextUtils.isEmpty(strR2)) {
                        File fileP3 = k9.p(strR2, file3, "pcam.jar");
                        fileP3.getClass();
                        File fileP4 = k9.p(strR2, file3, "pcbc");
                        fileP4.getClass();
                        File fileP5 = k9.p(strR2, a(), "pcam.jar");
                        fileP5.getClass();
                        File fileP6 = k9.p(strR2, a(), "pcbc");
                        fileP6.getClass();
                        if (fileP3.exists() && !fileP3.renameTo(fileP5)) {
                            vi3Var.b(yk0.EVENT_ID_DG_STORAGE_PROGRAM_CACHE_VM_RENAME_FAILED);
                        } else if (fileP4.exists() && fileP4.renameTo(fileP6)) {
                            rm2 rm2VarA = a(1);
                            SharedPreferences.Editor editorEdit = this.f4003c.edit();
                            b.w4 w4Var = this.f4004d;
                            if (rm2VarA != null && !rm2Var.r().r().equals(rm2VarA.r().r())) {
                                editorEdit.putString("FBAMTD" + ((fk) w4Var.get()).f3374a, xg.b.a(rm2VarA.a()));
                            }
                            editorEdit.putString("LATMTD" + ((fk) w4Var.get()).f3374a, xg.b.a(rm2Var.a()));
                            if (!editorEdit.commit()) {
                                vi3Var.b(yk0.EVENT_ID_DG_STORAGE_PROGRAM_CACHE_PUSH_METADATA_FAILURE);
                            }
                        } else {
                            vi3Var.b(yk0.EVENT_ID_DG_STORAGE_PROGRAM_CACHE_PROGRAM_BYTECODE_RENAME_FAILED);
                        }
                    }
                    HashSet hashSet = new HashSet();
                    rm2 rm2VarA2 = a(1);
                    if (rm2VarA2 != null) {
                        hashSet.add(rm2VarA2.r().r());
                    }
                    rm2 rm2VarA3 = a(2);
                    if (rm2VarA3 != null) {
                        hashSet.add(rm2VarA3.r().r());
                    }
                    File[] fileArrListFiles = a().listFiles();
                    if (fileArrListFiles == null) {
                        return;
                    }
                    for (File file4 : fileArrListFiles) {
                        String name = file4.getName();
                        if (!hashSet.contains(name)) {
                            File fileA = a();
                            if (TextUtils.isEmpty(name)) {
                                file2 = null;
                            } else {
                                file2 = new File(fileA, name);
                                k9.z(file2, false);
                            }
                            file2.getClass();
                            k9.E(file2);
                        }
                    }
                    return;
                }
            }
        }
        vi3Var.b(yk0.EVENT_ID_DG_STORAGE_PROGRAM_CACHE_SAVE_TEMP_PROGRAM_FAILURE);
    }

    public final File a() {
        File file = new File(this.f4001a, Integer.toString(((fk) this.f4004d.get()).f3374a));
        if (!file.exists()) {
            file.mkdir();
        }
        return file;
    }
}
