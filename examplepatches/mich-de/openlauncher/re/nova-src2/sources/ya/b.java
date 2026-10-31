package ya;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import com.teslacoilsw.launcher.util.NamedIntent;
import o9.t1;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final ContentValues f97103a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f97104b;

    /* renamed from: c, reason: collision with root package name */
    public final vk.j f97105c;

    /* renamed from: d, reason: collision with root package name */
    public BitmapInfo f97106d;

    /* renamed from: e, reason: collision with root package name */
    public UserHandle f97107e;

    public b(Context context, vk.j jVar) {
        this(context);
        this.f97105c = jVar;
    }

    public final void a() {
        vk.j jVar = this.f97105c;
        if (jVar != null) {
            Context context = this.f97104b;
            context.getContentResolver().update((Uri) jVar.f92818c, b(context), (String) jVar.f92817b, (String[]) jVar.f92819d);
        }
    }

    public final ContentValues b(Context context) {
        BitmapInfo bitmapInfo = this.f97106d;
        ContentValues contentValues = this.f97103a;
        if (bitmapInfo != null && !t1.c(context).f80135d.x(this.f97106d, this.f97107e)) {
            contentValues.put("icon", aa.p.a(this.f97106d.f21151a));
            this.f97106d = null;
        }
        return contentValues;
    }

    public final void c(Intent intent) {
        Intent intent2;
        if (intent != null) {
            intent2 = new Intent(intent);
            intent2.setSourceBounds(null);
        } else {
            intent2 = null;
        }
        this.f97103a.put("intent", intent2 != null ? intent2.toUri(0) : null);
    }

    public final void d(UserHandle userHandle) {
        this.f97103a.put("profileId", Long.valueOf(((ja.h) ja.h.f69294h.h(this.f97104b)).d(userHandle)));
    }

    public final void e(NovaIconSource novaIconSource) {
        ContentValues contentValues = this.f97103a;
        if (novaIconSource == null) {
            contentValues.putNull("customIconSource");
        } else {
            contentValues.put("customIconSource", novaIconSource.b());
        }
    }

    public final void f(iz.c cVar) {
        this.f97103a.put("novaFlags", Integer.valueOf(cVar.f68417a));
    }

    public final void g(CharSequence charSequence) {
        this.f97103a.put("title", charSequence == null ? null : charSequence.toString());
    }

    public final void h(Integer num, String str) {
        this.f97103a.put(str, num);
    }

    public final void i(String str, NamedIntent namedIntent) {
        this.f97103a.put(str, namedIntent == null ? null : namedIntent.e(this.f97104b));
    }

    public final void j(String str, Float f11) {
        this.f97103a.put(str, f11);
    }

    public final void k(String str, String str2) {
        this.f97103a.put(str, str2);
    }

    public final void l(BitmapInfo bitmapInfo, UserHandle userHandle) {
        this.f97106d = bitmapInfo;
        this.f97107e = userHandle;
    }

    public final void m(String str) {
        this.f97103a.putNull(str);
    }

    public b(Context context) {
        this(new ContentValues(), context);
    }

    public b(ContentValues contentValues, Context context) {
        this.f97103a = contentValues;
        this.f97104b = context;
    }
}
