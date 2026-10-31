package ya;

import android.app.WallpaperColors;
import android.app.WallpaperManager;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.FileUtils;
import android.text.TextUtils;
import androidx.recyclerview.widget.u1;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import o9.g3;

/* loaded from: classes.dex */
public abstract class l0 {

    /* renamed from: a, reason: collision with root package name */
    public static final x7.c f97155a = new x7.c(new c(3));

    public static void a(Closeable closeable) throws IOException {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Exception unused) {
            }
        }
    }

    public static void b(InputStream inputStream, OutputStream outputStream) throws IOException {
        if (g3.f79851f) {
            FileUtils.copy(inputStream, outputStream);
            return;
        }
        byte[] bArr = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
        while (true) {
            int i5 = inputStream.read(bArr);
            if (i5 == -1) {
                return;
            } else {
                outputStream.write(bArr, 0, i5);
            }
        }
    }

    public static int c(o9.l lVar) {
        WallpaperColors wallpaperColors;
        int colorHints = (!g3.f79850e || (wallpaperColors = ((WallpaperManager) lVar.getSystemService(WallpaperManager.class)).getWallpaperColors(1)) == null) ? 0 : wallpaperColors.getColorHints();
        boolean z11 = (colorHints & 1) != 0;
        boolean z12 = (colorHints & 2) != 0;
        if ((lVar.getResources().getConfiguration().uiMode & 48) == 32) {
            if (z11) {
                return 2132082710;
            }
            return z12 ? 2132082709 : 2132082708;
        }
        if (z11) {
            return 2132082712;
        }
        return z12 ? 2132082711 : 2132082707;
    }

    public static boolean d(Context context, int i5) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(new int[]{i5});
        boolean z11 = typedArrayObtainStyledAttributes.getBoolean(0, false);
        typedArrayObtainStyledAttributes.recycle();
        return z11;
    }

    public static h0 e(Class cls, Context context, int i5) {
        String string = context.getString(i5);
        if (TextUtils.isEmpty(string)) {
            try {
                return (h0) cls.newInstance();
            } catch (IllegalAccessException | InstantiationException e3) {
                throw new RuntimeException(e3);
            }
        }
        try {
            return (h0) Class.forName(string).getDeclaredConstructor(Context.class).newInstance(context);
        } catch (ClassCastException | ClassNotFoundException | IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e11) {
            throw new RuntimeException("Bad overriden class ", e11);
        }
    }

    public static boolean f(ga.e eVar) {
        return (((eVar instanceof ga.j) && ((ga.j) eVar).N0()) || eVar.m()) ? false : true;
    }

    public static boolean g(ga.e eVar) {
        return eVar.f57290b == 6 && eVar.f57291c != -1 && (eVar instanceof ga.j);
    }

    public static boolean h(ga.e eVar) {
        if (f(eVar)) {
            return eVar.f57290b == 0 || g(eVar);
        }
        return false;
    }
}
