package ay;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.SystemClock;
import androidx.recyclerview.widget.u1;
import com.android.launcher3.LauncherProvider;
import com.teslacoilsw.launcher.NovaShortcutHandler;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import kotlin.jvm.internal.Intrinsics;
import mx.g0;
import o9.f2;
import o9.t1;
import o9.v1;

/* loaded from: classes4.dex */
public class r implements p {

    /* renamed from: a, reason: collision with root package name */
    public final Uri f15766a;

    public r(Uri uri) {
        this.f15766a = uri;
    }

    @Override // ay.p
    public final String a(Context context) {
        return this.f15766a.getLastPathSegment().replaceAll(".novabackup$", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public void b() {
        throw new RuntimeException("Cannot delete stream");
    }

    public final void c(Context context) throws FileNotFoundException {
        try {
            InputStream inputStreamOpenInputStream = context.getContentResolver().openInputStream(this.f15766a);
            ((t1) t1.f80131h.h(context)).f80133b.p();
            synchronized (LauncherProvider.f20963e) {
                try {
                    Context context2 = g0.f77088a;
                    LauncherProvider launcherProvider = g0.f77091d;
                    if (launcherProvider == null) {
                        Intrinsics.m("launcherProvider");
                        throw null;
                    }
                    f2 f2Var = launcherProvider.f20964a;
                    if (f2Var != null) {
                        f2Var.close();
                    }
                    new File(context.getDataDir(), "shared_prefs/nova.xml").delete();
                    new File(context.getDataDir(), "shared_prefs/com.teslacoilsw.launcher_preferences.xml").delete();
                    new File(context.getFilesDir(), "datastore/cards.datastore").delete();
                    new File(context.getFilesDir(), "datastore/dismisses.datastore").delete();
                    new File(context.getFilesDir(), "datastore/conditions.datastore").delete();
                    context.getDatabasePath("nova.db").delete();
                    context.getDatabasePath("nova.db-journal").delete();
                    context.getDatabasePath("launcher.db").delete();
                    context.getDatabasePath("launcher.db-journal").delete();
                    List list = v1.f80192a;
                    context.getDatabasePath("app_icons.db").delete();
                    context.getDatabasePath("app_icons.db-journal").delete();
                    context.getDatabasePath("widgetpreviews.db").delete();
                    context.getDatabasePath("widgetpreviews.db-journal").delete();
                    new File(context.getFilesDir(), "datastore").mkdirs();
                    ZipInputStream zipInputStream = new ZipInputStream(new BufferedInputStream(inputStreamOpenInputStream));
                    try {
                        byte[] bArr = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
                        boolean zEquals = false;
                        while (true) {
                            ZipEntry nextEntry = zipInputStream.getNextEntry();
                            if (nextEntry == null) {
                                break;
                            }
                            if (!"nova.xml".equals(nextEntry.getName()) && (zEquals || !"com.teslacoilsw.launcher_preferences.xml".equals(nextEntry.getName()))) {
                                if ("nova.db".equals(nextEntry.getName()) || "launcher.db".equals(nextEntry.getName())) {
                                    String name = nextEntry.getName();
                                    context.getDatabasePath(name + "-journal").delete();
                                    File databasePath = context.getDatabasePath(name);
                                    FileOutputStream fileOutputStream = new FileOutputStream(databasePath);
                                    for (int i5 = zipInputStream.read(bArr); i5 != -1; i5 = zipInputStream.read(bArr)) {
                                        fileOutputStream.write(bArr, 0, i5);
                                    }
                                    fileOutputStream.close();
                                    SQLiteDatabase sQLiteDatabaseOpenDatabase = SQLiteDatabase.openDatabase(databasePath.getPath(), null, 0);
                                    ContentValues contentValues = new ContentValues();
                                    contentValues.put("restored", (Integer) 5);
                                    sQLiteDatabaseOpenDatabase.update("favorites", contentValues, "itemType = 0 OR itemType=1 AND restored = 0 AND intent LIKE '#Intent;action=android.intent.action.MAIN;category=android.intent.category.LAUNCHER;%'", null);
                                    contentValues.clear();
                                    contentValues.put("appWidgetId", (Integer) (-1));
                                    contentValues.put("restored", (Integer) 1);
                                    sQLiteDatabaseOpenDatabase.update("favorites", contentValues, "itemType = 4", null);
                                    sQLiteDatabaseOpenDatabase.close();
                                } else if ("cards.datastore".equals(nextEntry.getName()) || "dismmisses.datastore".equals(nextEntry.getName()) || "conditions.datastore".equals(nextEntry.getName())) {
                                    String name2 = nextEntry.getName();
                                    FileOutputStream fileOutputStream2 = new FileOutputStream(new File(context.getFilesDir(), "datastore/" + name2));
                                    for (int i11 = zipInputStream.read(bArr); i11 != -1; i11 = zipInputStream.read(bArr)) {
                                        fileOutputStream2.write(bArr, 0, i11);
                                    }
                                    fileOutputStream2.close();
                                }
                            }
                            String name3 = nextEntry.getName();
                            FileOutputStream fileOutputStream3 = new FileOutputStream(new File(context.getDataDir(), "shared_prefs/" + name3));
                            for (int i12 = zipInputStream.read(bArr); i12 != -1; i12 = zipInputStream.read(bArr)) {
                                fileOutputStream3.write(bArr, 0, i12);
                            }
                            fileOutputStream3.close();
                            zEquals |= "nova.xml".equals(nextEntry.getName());
                        }
                        zipInputStream.close();
                        if (zEquals) {
                            new File(context.getDataDir(), "shared_prefs/com.teslacoilsw.launcher_preferences.xml").delete();
                            context.getDatabasePath("launcher.db").delete();
                            context.getDatabasePath("launcher.db-journal").delete();
                        }
                        zy.c cVar = zy.c.f98823a;
                        zy.c.i("backup_restored", null);
                        Intent intent = new Intent("ACTION_FINISH");
                        intent.setComponent(NovaShortcutHandler.f45670c);
                        intent.addFlags(268451840);
                        context.startActivity(intent);
                        SystemClock.sleep(100L);
                        System.exit(0);
                    } catch (FileNotFoundException e3) {
                        e3.printStackTrace();
                    } catch (IOException e11) {
                        e11.printStackTrace();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        } catch (Exception e12) {
            throw new RuntimeException(e12);
        }
    }

    public long d() {
        return 0L;
    }

    public void e(String str) {
        throw new RuntimeException("Cannot rename stream");
    }
}
