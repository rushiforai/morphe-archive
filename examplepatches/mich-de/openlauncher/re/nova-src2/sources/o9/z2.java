package o9;

import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.util.Pair;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import java.io.File;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class z2 extends BaseAdapter implements ListAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final x2 f80288a;

    /* renamed from: b, reason: collision with root package name */
    public ArrayList f80289b;

    /* renamed from: c, reason: collision with root package name */
    public final File f80290c;

    /* renamed from: d, reason: collision with root package name */
    public final LayoutInflater f80291d;

    public z2(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        int i5 = x2.f80245b;
        File file = new File(launcherWallpaperPickerActivity.getCacheDir(), "saved_wallpaper_images.db");
        File databasePath = launcherWallpaperPickerActivity.getDatabasePath("saved_wallpaper_images.db");
        if (file.exists()) {
            file.renameTo(databasePath);
        }
        this.f80288a = new x2(launcherWallpaperPickerActivity, launcherWallpaperPickerActivity.getDatabasePath("saved_wallpaper_images.db").getPath(), null, 1, 0);
        this.f80291d = launcherWallpaperPickerActivity.getLayoutInflater();
        this.f80290c = new File(launcherWallpaperPickerActivity.getFilesDir(), "wallpapers");
    }

    public final Pair a(int i5) {
        Cursor cursorQuery = this.f80288a.getReadableDatabase().query("saved_wallpaper_images", new String[]{"image_thumbnail", "image"}, "id = ?", new String[]{Integer.toString(i5)}, null, null, null, null);
        if (cursorQuery.getCount() <= 0) {
            return null;
        }
        cursorQuery.moveToFirst();
        String string = cursorQuery.getString(0);
        String string2 = cursorQuery.getString(1);
        cursorQuery.close();
        return new Pair(string, string2);
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        return this.f80289b.size();
    }

    @Override // android.widget.Adapter
    public final Object getItem(int i5) {
        return (y2) this.f80289b.get(i5);
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        Drawable drawable = ((y2) this.f80289b.get(i5)).f80264b;
        if (drawable == null) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("Launcher3.SavedWallpaperImages");
            bVar.d("Error decoding thumbnail for wallpaper #%d", Integer.valueOf(i5));
        }
        return LauncherWallpaperPickerActivity.k0(this.f80291d, view, viewGroup, drawable);
    }
}
