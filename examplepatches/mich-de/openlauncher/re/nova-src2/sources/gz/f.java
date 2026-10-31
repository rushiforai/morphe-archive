package gz;

import android.content.ComponentName;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import fz.h0;
import java.util.List;

/* loaded from: classes.dex */
public interface f {
    boolean a();

    boolean b();

    Bitmap c(Context context, h0 h0Var, ComponentName componentName);

    long d();

    Drawable e(Context context, ComponentName componentName, Drawable drawable);

    Drawable f(Context context, h0 h0Var, ComponentName componentName);

    List g();

    String getPackageName();

    int h();

    Bitmap i(Context context, ComponentName componentName, Drawable drawable);

    boolean isEmpty();

    boolean j(ComponentName componentName);
}
