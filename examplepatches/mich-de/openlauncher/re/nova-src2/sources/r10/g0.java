package r10;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ShortcutInfo;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import b.i8;
import com.android.launcher3.shortcuts.ShortcutKey;
import kotlin.coroutines.Continuation;

/* loaded from: classes4.dex */
public final class g0 implements r8.h {

    /* renamed from: a, reason: collision with root package name */
    public final Context f85140a;

    /* renamed from: b, reason: collision with root package name */
    public final fz.d0 f85141b;

    /* renamed from: c, reason: collision with root package name */
    public final Uri f85142c;

    public g0(Context context, fz.d0 d0Var, Uri uri) {
        this.f85140a = context;
        this.f85141b = d0Var;
        this.f85142c = uri;
    }

    @Override // r8.h
    public final Object a(Continuation continuation) {
        Drawable drawableW;
        int i5;
        ComponentName componentNameUnflattenFromString;
        String strA1 = r70.k.a1(this.f85142c.toString(), "deepShortcutIcon:");
        int iIndexOf = strA1.indexOf(35);
        ShortcutKey shortcutKey = null;
        if (iIndexOf >= 0 && (i5 = iIndexOf + 1) < strA1.length() && (componentNameUnflattenFromString = ComponentName.unflattenFromString(strA1.substring(0, iIndexOf))) != null) {
            try {
                shortcutKey = new ShortcutKey(componentNameUnflattenFromString, ((ja.h) ja.h.f69294h.f95127b).e(Long.parseLong(strA1.substring(i5))));
            } catch (NumberFormatException unused) {
            }
        }
        Context context = this.f85140a;
        qa.b bVarC = shortcutKey.a(context).c(11);
        if (bVarC.isEmpty() || (drawableW = i8.w(context, (ShortcutInfo) bVarC.get(0), this.f85141b.f56214w.f56360b)) == null) {
            throw new Resources.NotFoundException();
        }
        return new r8.e(3, drawableW, false);
    }
}
