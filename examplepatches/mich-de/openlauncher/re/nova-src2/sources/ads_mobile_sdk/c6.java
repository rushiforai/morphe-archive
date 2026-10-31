package ads_mobile_sdk;

import android.content.Context;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.List;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.io.FilesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.text.Charsets;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes2.dex */
public final class c6 {

    /* renamed from: a, reason: collision with root package name */
    public final File f1666a;

    /* renamed from: b, reason: collision with root package name */
    public volatile boolean f1667b;

    public c6(Context context) {
        Intrinsics.g(context, "context");
        this.f1666a = new File(context.getCacheDir(), "gma_ad_responses");
    }

    public static String a(String content) throws NoSuchAlgorithmException {
        Intrinsics.g(content, "content");
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            byte[] bytes = content.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            messageDigest.update(bytes);
            byte[] bArrDigest = messageDigest.digest();
            StringBuilder sb2 = new StringBuilder(bArrDigest.length * 2);
            for (byte b11 : bArrDigest) {
                StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
                sb2.append(String.format("%02x", Arrays.copyOf(new Object[]{Byte.valueOf(b11)}, 1)));
            }
            String string = sb2.toString();
            Intrinsics.f(string, "toString(...)");
            return string;
        } catch (Exception e3) {
            zi3.a(4, "Failed to calculate checksum", e3);
            return null;
        }
    }

    public final b.a1 b(String str, String content) {
        b.a1 tu0Var;
        File fileB;
        b.a1 qu0Var;
        Intrinsics.g(content, "content");
        wv0 wv0Var = wv0.CUI_NAME_PERSISTENT_CACHE_FILE_WRITE;
        WeakHashMap weakHashMap = ji3.f5253a;
        th3 th3VarA = ji3.a(wv0Var, EmptyList.f71733a, true);
        try {
            if (this.f1667b) {
                tu0Var = new xu0(Unit.f71706a);
            } else {
                if (!this.f1667b) {
                    this.f1667b = this.f1666a.exists();
                    if (!this.f1667b && !this.f1666a.mkdirs()) {
                        tu0Var = new tu0("Failed to create cache directory");
                    }
                }
                this.f1667b = true;
                tu0Var = new xu0(Unit.f71706a);
            }
            if (tu0Var instanceof pu0) {
                qu0Var = (pu0) tu0Var;
            } else {
                String strA = a(content);
                if (strA == null) {
                    qu0Var = new tu0("Failed to calculate checksum");
                } else {
                    File fileB2 = b(str.concat(".tmp"));
                    if (fileB2 == null || (fileB = b(str)) == null) {
                        qu0Var = new tu0("Invalid filename");
                    } else {
                        try {
                            FileOutputStream fileOutputStream = new FileOutputStream(fileB2);
                            try {
                                byte[] bytes = content.getBytes(Charsets.f72000b);
                                Intrinsics.f(bytes, "getBytes(...)");
                                fileOutputStream.write(bytes);
                                Unit unit = Unit.f71706a;
                                fileOutputStream.close();
                                if (fileB2.renameTo(fileB)) {
                                    qu0Var = new xu0(strA);
                                } else {
                                    fileB2.delete();
                                    qu0Var = new tu0("Failed to rename temp file");
                                }
                            } finally {
                            }
                        } catch (IOException e3) {
                            fileB2.delete();
                            qu0Var = new qu0(e3, null, "Failed to write to temp file", 2);
                        }
                    }
                }
            }
            if (qu0Var instanceof pu0) {
                zi3.a((pu0) qu0Var, false);
            }
            th3VarA.close();
            return qu0Var;
        } catch (Throwable th2) {
            try {
                th3VarA.b(th2);
                if (th2 instanceof b.a4) {
                    throw th2;
                }
                if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                    th3VarA.a(th2);
                }
                if (th2 instanceof TimeoutCancellationException) {
                    throw new lw0(th2);
                }
                if (th2 instanceof CancellationException) {
                    throw new du0(th2);
                }
                if (th2 instanceof dv0) {
                    throw th2;
                }
                throw new iu0(th2);
            } finally {
            }
        }
    }

    public final List a() {
        List listB1;
        if (!this.f1667b) {
            this.f1667b = this.f1666a.exists();
            if (!this.f1667b) {
                return EmptyList.f71733a;
            }
        }
        File[] fileArrListFiles = this.f1666a.listFiles();
        return (fileArrListFiles == null || (listB1 = kotlin.collections.c.b1(fileArrListFiles)) == null) ? EmptyList.f71733a : listB1;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x007b A[Catch: all -> 0x0026, TRY_LEAVE, TryCatch #1 {all -> 0x0026, blocks: (B:3:0x000b, B:11:0x0028, B:13:0x002e, B:28:0x0077, B:30:0x007b, B:14:0x0038, B:16:0x003e, B:18:0x0048, B:20:0x0050, B:22:0x005a, B:25:0x0066, B:27:0x006d, B:6:0x0010, B:8:0x001c), top: B:62:0x000b, inners: #3 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final b.a1 a(String str, String str2) {
        b.a1 tu0Var;
        b.a1 qu0Var;
        String strT0;
        wv0 wv0Var = wv0.CUI_NAME_PERSISTENT_CACHE_FILE_READ;
        WeakHashMap weakHashMap = ji3.f5253a;
        th3 th3VarA = ji3.a(wv0Var, EmptyList.f71733a, true);
        try {
            if (!this.f1667b) {
                this.f1667b = this.f1666a.exists();
                if (!this.f1667b) {
                    tu0Var = new tu0("Cache directory not found", wd1.f11213a);
                }
                if (tu0Var instanceof pu0) {
                    zi3.a((pu0) tu0Var, false);
                }
                th3VarA.close();
                return tu0Var;
            }
            File fileB = b(str);
            if (fileB == null) {
                tu0Var = new tu0("Invalid filename", wd1.f11213a);
            } else if (!fileB.exists()) {
                tu0Var = new tu0("File not found", wd1.f11213a);
            } else {
                try {
                    strT0 = FilesKt.t0(fileB, Charsets.f72000b);
                } catch (Exception e3) {
                    qu0Var = new qu0(e3, null, "Failed to read file", 2);
                }
                if (str2 != null && !Intrinsics.b(a(strT0), str2)) {
                    tu0Var = new tu0("Checksum mismatch for file", wd1.f11213a);
                } else {
                    qu0Var = new xu0(strT0);
                    tu0Var = qu0Var;
                }
            }
            if (tu0Var instanceof pu0) {
            }
            th3VarA.close();
            return tu0Var;
        } catch (Throwable th2) {
            try {
                th3VarA.b(th2);
                if (!(th2 instanceof b.a4)) {
                    if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                        th3VarA.a(th2);
                    }
                    if (!(th2 instanceof TimeoutCancellationException)) {
                        if (!(th2 instanceof CancellationException)) {
                            if (th2 instanceof dv0) {
                                throw th2;
                            }
                            throw new iu0(th2);
                        }
                        throw new du0(th2);
                    }
                    throw new lw0(th2);
                }
                throw th2;
            } finally {
            }
        }
    }

    public final File b(String str) throws IOException {
        File file = this.f1666a;
        File file2 = new File(file, str);
        try {
            String canonicalPath = file2.getCanonicalPath();
            Intrinsics.f(canonicalPath, "getCanonicalPath(...)");
            String canonicalPath2 = file.getCanonicalPath();
            Intrinsics.f(canonicalPath2, "getCanonicalPath(...)");
            if (r70.j.I0(canonicalPath, canonicalPath2, false)) {
                return file2;
            }
            zi3.a(6, "Path traversal detected: " + str, null);
            return null;
        } catch (IOException e3) {
            zi3.a(4, "Failed to resolve canonical path for " + str, e3);
            return null;
        }
    }
}
