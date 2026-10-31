package o9;

import android.content.ClipData;
import android.content.ContentValues;
import android.content.Intent;
import android.content.res.Resources;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.net.Uri;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import aosp.androidx.core.content.FileProvider;
import com.android.launcher3.CheckableFrameLayout;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/* loaded from: classes2.dex */
public final class k3 implements androidx.appcompat.view.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ LauncherWallpaperPickerActivity f79943a;

    public /* synthetic */ k3(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        this.f79943a = launcherWallpaperPickerActivity;
    }

    @Override // androidx.appcompat.view.a
    public boolean I(androidx.appcompat.view.b bVar, Menu menu) {
        LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = this.f79943a;
        int childCount = launcherWallpaperPickerActivity.f20977v.getChildCount();
        int i5 = 0;
        for (int i11 = 0; i11 < childCount; i11++) {
            if (((CheckableFrameLayout) launcherWallpaperPickerActivity.f20977v.getChildAt(i11)).f20922a) {
                i5++;
            }
        }
        if (i5 == 0) {
            bVar.b();
            return true;
        }
        bVar.o(launcherWallpaperPickerActivity.getResources().getQuantityString(2131886091, i5, Integer.valueOf(i5)));
        return true;
    }

    public void a(Bitmap.CompressFormat compressFormat, byte[] bArr) {
        LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = this.f79943a;
        Resources resources = launcherWallpaperPickerActivity.getResources();
        int i5 = LauncherWallpaperPickerActivity.H;
        Bitmap bitmapL0 = LauncherWallpaperPickerActivity.l0(new Point(resources.getDimensionPixelSize(2131166540), resources.getDimensionPixelSize(2131166539)), null, null, bArr, 0, true);
        z2 z2Var = launcherWallpaperPickerActivity.B;
        File file = z2Var.f80290c;
        int i11 = w2.f80223a[compressFormat.ordinal()];
        String str = i11 != 1 ? i11 != 2 ? (i11 == 3 || i11 == 4 || i11 == 5) ? ".webp" : ".image" : ".jpg" : ".png";
        try {
            file.mkdirs();
            File fileCreateTempFile = File.createTempFile("wallpaper", str, file);
            FileOutputStream fileOutputStream = new FileOutputStream(fileCreateTempFile);
            fileOutputStream.write(bArr);
            fileOutputStream.close();
            File fileCreateTempFile2 = File.createTempFile("wallpaperthumb", ".jpg", file);
            FileOutputStream fileOutputStream2 = new FileOutputStream(fileCreateTempFile2);
            bitmapL0.compress(Bitmap.CompressFormat.JPEG, 95, fileOutputStream2);
            fileOutputStream2.close();
            SQLiteDatabase writableDatabase = z2Var.f80288a.getWritableDatabase();
            ContentValues contentValues = new ContentValues();
            contentValues.put("image_thumbnail", fileCreateTempFile2.getName());
            contentValues.put("image", fileCreateTempFile.getName());
            writableDatabase.insert("saved_wallpaper_images", null, contentValues);
            writableDatabase.close();
        } catch (IOException e3) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("Launcher3.SavedWallpaperImages");
            bVar.f(e3, "Failed writing images to storage", new Object[0]);
        }
    }

    @Override // androidx.appcompat.view.a
    public void g(androidx.appcompat.view.b bVar) {
        LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = this.f79943a;
        int childCount = launcherWallpaperPickerActivity.f20977v.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            ((CheckableFrameLayout) launcherWallpaperPickerActivity.f20977v.getChildAt(i5)).setChecked(false);
        }
        View view = launcherWallpaperPickerActivity.f20974s;
        if (view != null) {
            view.setSelected(true);
        }
        launcherWallpaperPickerActivity.f20980y = null;
    }

    @Override // androidx.appcompat.view.a
    public boolean k(androidx.appcompat.view.b bVar, Menu menu) {
        bVar.f().inflate(2131755010, menu);
        return true;
    }

    @Override // androidx.appcompat.view.a
    public boolean u(androidx.appcompat.view.b bVar, MenuItem menuItem) throws Resources.NotFoundException, IOException {
        int itemId = menuItem.getItemId();
        int i5 = 0;
        LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = this.f79943a;
        if (itemId == 2131428350) {
            int childCount = launcherWallpaperPickerActivity.f20977v.getChildCount();
            ArrayList arrayList = new ArrayList();
            boolean z11 = false;
            while (i5 < childCount) {
                CheckableFrameLayout checkableFrameLayout = (CheckableFrameLayout) launcherWallpaperPickerActivity.f20977v.getChildAt(i5);
                if (checkableFrameLayout.f20922a) {
                    ((y3) checkableFrameLayout.getTag()).d(launcherWallpaperPickerActivity);
                    arrayList.add(checkableFrameLayout);
                    if (i5 == launcherWallpaperPickerActivity.D) {
                        z11 = true;
                    }
                }
                i5++;
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                launcherWallpaperPickerActivity.f20977v.removeView((View) it.next());
            }
            if (z11) {
                launcherWallpaperPickerActivity.D = -1;
                launcherWallpaperPickerActivity.f20974s = null;
                launcherWallpaperPickerActivity.p0(true);
            }
            launcherWallpaperPickerActivity.s0();
            bVar.b();
            return true;
        }
        if (itemId != 2131428354) {
            if (itemId != 2131428353) {
                return false;
            }
            int childCount2 = launcherWallpaperPickerActivity.f20977v.getChildCount();
            while (i5 < childCount2) {
                CheckableFrameLayout checkableFrameLayout2 = (CheckableFrameLayout) launcherWallpaperPickerActivity.f20977v.getChildAt(i5);
                if (checkableFrameLayout2.isLongClickable()) {
                    checkableFrameLayout2.setChecked(true);
                }
                i5++;
            }
            launcherWallpaperPickerActivity.f20980y.i();
            return true;
        }
        int childCount3 = launcherWallpaperPickerActivity.f20977v.getChildCount();
        ArrayList arrayList2 = new ArrayList();
        for (int i11 = 0; i11 < childCount3; i11++) {
            CheckableFrameLayout checkableFrameLayout3 = (CheckableFrameLayout) launcherWallpaperPickerActivity.f20977v.getChildAt(i11);
            if (checkableFrameLayout3.f20922a) {
                y3 y3Var = (y3) checkableFrameLayout3.getTag();
                if (y3Var instanceof y2) {
                    arrayList2.add((y2) y3Var);
                }
            }
        }
        if (arrayList2.size() == 1) {
            y2 y2Var = (y2) arrayList2.get(0);
            y2Var.getClass();
            Uri uriC = FileProvider.a(launcherWallpaperPickerActivity, "com.teslacoilsw.launcher.fileprovider").c(new File(launcherWallpaperPickerActivity.B.f80290c, (String) launcherWallpaperPickerActivity.B.a(y2Var.f80262d).second));
            Intent intent = new Intent("android.intent.action.SEND");
            intent.setType("image/*");
            intent.putExtra("android.intent.extra.STREAM", uriC);
            intent.setClipData(ClipData.newRawUri(null, uriC));
            intent.addFlags(1);
            launcherWallpaperPickerActivity.startActivity(Intent.createChooser(intent, "Export Wallpaper"), null);
            return true;
        }
        if (arrayList2.size() > 1) {
            File file = new File(launcherWallpaperPickerActivity.getCacheDir(), "fileprovider_temp/wallpapers.zip");
            file.getParentFile().mkdirs();
            try {
                ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(file));
                Iterator it2 = arrayList2.iterator();
                while (it2.hasNext()) {
                    y2 y2Var2 = (y2) it2.next();
                    y2Var2.getClass();
                    File file2 = new File(launcherWallpaperPickerActivity.B.f80290c, (String) launcherWallpaperPickerActivity.B.a(y2Var2.f80262d).second);
                    zipOutputStream.putNextEntry(new ZipEntry(file2.getName()));
                    zk.j jVar = new zk.j(zk.j.f98556d);
                    try {
                        FileInputStream fileInputStream = new FileInputStream(file2);
                        jVar.f98558b.addFirst(fileInputStream);
                        int i12 = zk.f.f98553a;
                        byte[] bArr = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
                        while (true) {
                            int i13 = fileInputStream.read(bArr);
                            if (i13 == -1) {
                                break;
                            }
                            zipOutputStream.write(bArr, 0, i13);
                        }
                        jVar.close();
                        zipOutputStream.closeEntry();
                    } finally {
                    }
                }
                zipOutputStream.close();
            } catch (IOException e3) {
                e3.printStackTrace();
            }
            Uri uriC2 = FileProvider.a(launcherWallpaperPickerActivity, "com.teslacoilsw.launcher.fileprovider").c(file);
            Intent intent2 = new Intent("android.intent.action.SEND");
            intent2.setType("application/zip");
            intent2.putExtra("android.intent.extra.STREAM", uriC2);
            intent2.setClipData(ClipData.newRawUri(null, uriC2));
            intent2.addFlags(1);
            launcherWallpaperPickerActivity.startActivity(Intent.createChooser(intent2, "Wallpapers.zip"), null);
        }
        return true;
    }
}
