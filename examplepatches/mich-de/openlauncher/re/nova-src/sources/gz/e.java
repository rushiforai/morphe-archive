package gz;

import android.content.Intent;
import android.text.TextUtils;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public class e {

    /* renamed from: b, reason: collision with root package name */
    public static final e f58644b;

    /* renamed from: c, reason: collision with root package name */
    public static final e f58645c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ e[] f58646d;

    /* renamed from: a, reason: collision with root package name */
    public final String f58647a;

    static {
        e eVar = new e("GO", 0, "com.gau.go.launcherex.theme");
        e eVar2 = new e("NOVA", 1, "com.novalauncher.THEME");
        d dVar = new d("APEX", 2, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        e eVar3 = new e("ADW", 3, "org.adw.launcher.icons.ACTION_PICK_ICON");
        f58644b = eVar3;
        e eVar4 = new e("BUILTIN", 4, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        f58645c = eVar4;
        e[] eVarArr = {eVar, eVar2, dVar, eVar3, eVar4};
        f58646d = eVarArr;
        EnumEntriesKt.a(eVarArr);
    }

    public e(String str, int i5, String str2) {
        this.f58647a = str2;
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) f58646d.clone();
    }

    public Intent a() {
        String str = this.f58647a;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return new Intent(str);
    }
}
