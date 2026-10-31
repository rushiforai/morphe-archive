package ay;

import android.content.Context;
import android.content.res.Resources;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Environment;
import androidx.recyclerview.widget.u1;
import com.android.launcher3.LauncherProvider;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;
import kotlin.jvm.internal.Intrinsics;
import mk.v;
import mx.g0;
import o9.v1;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes4.dex */
public abstract class i {

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f15752a = {"/storage/extSdCard/", "/sdcard-ext", "/storage/sdcard1", "/storage/external_SD"};

    public static void a(ZipOutputStream zipOutputStream, ZipEntry zipEntry, File file) throws IOException {
        if (file.exists()) {
            zipOutputStream.putNextEntry(zipEntry);
            FileInputStream fileInputStream = new FileInputStream(file);
            byte[] bArr = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
            for (int i5 = fileInputStream.read(bArr); i5 != -1; i5 = fileInputStream.read(bArr)) {
                zipOutputStream.write(bArr, 0, i5);
            }
            fileInputStream.close();
            zipOutputStream.closeEntry();
        }
    }

    public static ArrayList b(Context context, boolean z11) throws Resources.NotFoundException, IOException {
        Resources resources = context.getResources();
        ArrayList arrayList = new ArrayList();
        boolean z12 = false;
        int i5 = 0;
        while (true) {
            if (i5 >= 4) {
                break;
            }
            String str = f15752a[i5];
            File file = new File(str);
            if (file.canRead()) {
                if (z11) {
                    try {
                        File fileCreateTempFile = File.createTempFile(".test", "txt", file);
                        if (fileCreateTempFile.exists()) {
                            if (fileCreateTempFile.delete()) {
                                z12 = true;
                            }
                        }
                    } catch (IOException e3) {
                        e3.printStackTrace();
                    }
                }
                if (!z11 || z12) {
                    arrayList.add(new h(2131231431, resources.getString(2132017541), "EXTSDCARD", new File(str, "/data/com.teslacoilsw.launcher/backup")));
                }
            } else {
                i5++;
            }
        }
        arrayList.add(new h(2131231436, resources.getString(2132017542), "USB", new File(Environment.getExternalStorageDirectory() + "/data/com.teslacoilsw.launcher/backup")));
        arrayList.add(new e(2131231425, context.getString(2132017755), "DOC"));
        return arrayList;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0072, code lost:
    
        r0.close();
        r11.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0078, code lost:
    
        return r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0079, code lost:
    
        r9 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x007a, code lost:
    
        r9.printStackTrace();
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x007d, code lost:
    
        return r10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Uri c(Context context, Uri uri, InputStream inputStream) {
        ZipInputStream zipInputStream = new ZipInputStream(new BufferedInputStream(inputStream));
        File file = null;
        int i5 = 0;
        while (true) {
            try {
                try {
                    ZipEntry nextEntry = zipInputStream.getNextEntry();
                    if (nextEntry != null) {
                        String name = nextEntry.getName();
                        i5++;
                        if (!"nova.xml".equals(name) && !"com.teslacoilsw.launcher_preferences.xml".equals(name)) {
                            if (i5 == 1 && name.endsWith(".novabackup")) {
                                file = new File(context.getCacheDir(), "tempZippedNovabackup.novabackup");
                                file.delete();
                                if (file.exists()) {
                                    try {
                                        zipInputStream.close();
                                        inputStream.close();
                                        return null;
                                    } catch (Exception e3) {
                                        e3.printStackTrace();
                                        return null;
                                    }
                                }
                                FileOutputStream fileOutputStream = new FileOutputStream(file);
                                byte[] bArr = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
                                for (int i11 = zipInputStream.read(bArr); i11 != -1; i11 = zipInputStream.read(bArr)) {
                                    fileOutputStream.write(bArr, 0, i11);
                                }
                                fileOutputStream.close();
                            }
                        }
                    } else {
                        if (file != null) {
                            if (i5 == 1) {
                                Uri uriFromFile = Uri.fromFile(file);
                                try {
                                    zipInputStream.close();
                                    inputStream.close();
                                    return uriFromFile;
                                } catch (Exception e11) {
                                    e11.printStackTrace();
                                    return uriFromFile;
                                }
                            }
                            file.delete();
                        }
                        zipInputStream.close();
                    }
                } catch (Throwable unused) {
                    zipInputStream.close();
                }
            } catch (Exception e12) {
                e12.printStackTrace();
                return null;
            }
        }
        inputStream.close();
        return null;
    }

    public static void d(Context context, OutputStream outputStream) throws IOException {
        ZipOutputStream zipOutputStream = new ZipOutputStream(new BufferedOutputStream(outputStream));
        try {
            try {
                zipOutputStream.putNextEntry(new ZipEntry("nova.xml"));
                Map<String, ?> all = g0.f(context).getAll();
                all.remove("bug_report_userid");
                all.remove("analytics_installation_id");
                all.remove("home_screen_ad_widget_eligible");
                v.S(all, zipOutputStream);
                zipOutputStream.closeEntry();
                zipOutputStream.putNextEntry(new ZipEntry("supportDetails.txt"));
                StringBuilder sb2 = new StringBuilder();
                jk.b.z(context, sb2);
                zipOutputStream.write(sb2.toString().getBytes());
                zipOutputStream.closeEntry();
                if (ea.b.f52420a) {
                    File[] fileArrG = ea.b.g();
                    for (int i5 = 0; i5 < 4; i5++) {
                        File file = fileArrG[i5];
                        if (file.exists()) {
                            a(zipOutputStream, new ZipEntry(file.getName()), file);
                        }
                    }
                }
                Context context2 = g0.f77088a;
                LauncherProvider launcherProvider = g0.f77091d;
                if (launcherProvider == null) {
                    Intrinsics.m("launcherProvider");
                    throw null;
                }
                launcherProvider.a();
                synchronized (LauncherProvider.f20963e) {
                    try {
                        SQLiteDatabase writableDatabase = launcherProvider.f20964a.getWritableDatabase();
                        writableDatabase.execSQL("VACUUM");
                        writableDatabase.close();
                    } catch (IllegalStateException unused) {
                    }
                }
                synchronized (LauncherProvider.f20963e) {
                    try {
                        a(zipOutputStream, new ZipEntry("nova.db"), context.getDatabasePath("nova.db"));
                        if (ea.b.f52420a) {
                            List list = v1.f80192a;
                            a(zipOutputStream, new ZipEntry("app_icons.db"), context.getDatabasePath("app_icons.db"));
                        }
                        File databasePath = context.getDatabasePath("launcher.db");
                        if (databasePath.exists()) {
                            a(zipOutputStream, new ZipEntry("launcher.db"), databasePath);
                        }
                        File file2 = new File(context.getDataDir(), "shared_prefs/com.teslacoilsw.launcher_preferences.xml");
                        String[] strArr = {"cards", "conditions", "dismisses"};
                        for (int i11 = 0; i11 < 3; i11++) {
                            String str = strArr[i11] + ".datastore";
                            a(zipOutputStream, new ZipEntry(str), new File(context.getFilesDir(), "datastore/" + str));
                        }
                        if (file2.exists()) {
                            a(zipOutputStream, new ZipEntry("com.teslacoilsw.launcher_preferences.xml"), file2);
                        }
                    } finally {
                    }
                }
                try {
                    zipOutputStream.close();
                } catch (Exception e3) {
                    e3.printStackTrace();
                }
            } catch (Throwable th2) {
                try {
                    zipOutputStream.close();
                } catch (Exception e11) {
                    e11.printStackTrace();
                }
                throw th2;
            }
        } catch (XmlPullParserException e12) {
            throw new RuntimeException(e12);
        }
    }
}
