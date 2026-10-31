package bh;

import android.app.WallpaperColors;
import android.database.sqlite.SQLiteDatabase;
import dalvik.system.DelegateLastClassLoader;
import dalvik.system.InMemoryDexClassLoader;
import java.nio.ByteBuffer;

/* loaded from: classes.dex */
public abstract /* synthetic */ class a {
    public static /* synthetic */ SQLiteDatabase.OpenParams.Builder b() {
        return new SQLiteDatabase.OpenParams.Builder();
    }

    public static /* synthetic */ DelegateLastClassLoader f(ClassLoader classLoader, String str) {
        return new DelegateLastClassLoader(str, classLoader);
    }

    public static /* synthetic */ InMemoryDexClassLoader g(ByteBuffer[] byteBufferArr, ClassLoader classLoader) {
        return new InMemoryDexClassLoader(byteBufferArr, classLoader);
    }

    public static /* bridge */ /* synthetic */ Class h() {
        return WallpaperColors.class;
    }

    public static /* synthetic */ void i() {
    }
}
