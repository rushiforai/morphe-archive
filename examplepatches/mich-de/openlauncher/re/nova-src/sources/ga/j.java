package ga;

import aa.a0;
import android.app.Person;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.os.Build;
import android.text.TextUtils;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import com.teslacoilsw.launcher.launcher3.PersonUtils;
import java.util.Arrays;
import o9.g3;

/* loaded from: classes.dex */
public final class j extends f {
    public int A;
    public String[] B;
    public int C;

    /* renamed from: x, reason: collision with root package name */
    public Intent f57322x;

    /* renamed from: y, reason: collision with root package name */
    public Intent.ShortcutIconResource f57323y;

    /* renamed from: z, reason: collision with root package name */
    public CharSequence f57324z;

    public j() {
        this.B = g3.f79849d;
        this.f57290b = 1;
    }

    @Override // ga.e
    public final void C(ya.b bVar) {
        super.C(bVar);
        bVar.g(this.f57300l);
        bVar.c(this.f57322x);
        bVar.h(Integer.valueOf(this.C), "options");
        bVar.h(Integer.valueOf(this.A), "restored");
        if (!L0()) {
            bVar.l(this.f57304r, this.o);
        }
        Intent.ShortcutIconResource shortcutIconResource = this.f57323y;
        if (shortcutIconResource != null) {
            bVar.k("iconPackage", shortcutIconResource.packageName);
            bVar.k("iconResource", this.f57323y.resourceName);
        }
        NovaIconSource novaIconSource = this.f57307u;
        if (novaIconSource != null) {
            bVar.e(novaIconSource);
        } else {
            bVar.m("customIconSource");
        }
    }

    public final String M0() {
        if (this.f57290b == 6) {
            return this.f57322x.getStringExtra("shortcut_id");
        }
        return null;
    }

    public final boolean N0() {
        return O0(3) && !O0(8);
    }

    public final boolean O0(int i5) {
        return (i5 & this.A) != 0;
    }

    public final void P0(Context context, ShortcutInfo shortcutInfo) {
        this.f57322x = ShortcutKey.e(shortcutInfo);
        if (!this.f57303q.b()) {
            this.f57300l = shortcutInfo.getShortLabel();
        }
        CharSequence longLabel = shortcutInfo.getLongLabel();
        if (TextUtils.isEmpty(longLabel)) {
            longLabel = shortcutInfo.getShortLabel();
        }
        this.f57301m = context.getPackageManager().getUserBadgedLabel(longLabel, this.o);
        if (shortcutInfo.isEnabled()) {
            this.f57305s &= -17;
        } else {
            this.f57305s |= 16;
        }
        this.f57324z = shortcutInfo.getDisabledMessage();
        if (Build.VERSION.SDK_INT < 28) {
            this.B = g3.f79849d;
        } else {
            Person[] personArr = PersonUtils.EMPTY_PERSON_ARRAY;
            this.B = personArr.length == 0 ? g3.f79849d : (String[]) Arrays.stream(personArr).map(new i(0)).sorted().toArray(new a0(1));
        }
    }

    public final Object clone() {
        return new j(this);
    }

    @Override // ga.e
    public final Intent d() {
        return this.f57322x;
    }

    @Override // ga.e
    public final ComponentName i() {
        ComponentName componentNameI = super.i();
        if (componentNameI != null || (this.f57290b != 1 && !O0(11))) {
            return componentNameI;
        }
        String str = this.f57322x.getPackage();
        if (str == null) {
            return null;
        }
        return new ComponentName(str, ".");
    }

    public j(j jVar) {
        super(jVar);
        this.B = g3.f79849d;
        this.f57300l = jVar.f57300l;
        this.f57322x = new Intent(jVar.f57322x);
        this.f57323y = jVar.f57323y;
        this.A = jVar.A;
        this.B = (String[]) jVar.B.clone();
        this.f57303q = jVar.f57303q;
    }

    public j(a aVar) {
        super(aVar);
        this.B = g3.f79849d;
        this.f57289a = -1;
        this.f57300l = g3.w(aVar.f57300l);
        this.f57322x = new Intent(aVar.f57278x);
    }

    public j(Context context, ShortcutInfo shortcutInfo) {
        this.B = g3.f79849d;
        this.o = shortcutInfo.getUserHandle();
        this.f57290b = 6;
        P0(context, shortcutInfo);
    }
}
