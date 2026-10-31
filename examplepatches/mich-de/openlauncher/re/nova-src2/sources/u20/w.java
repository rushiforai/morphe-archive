package u20;

import android.content.Intent;
import android.text.TextUtils;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public class w {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ w[] f90517b;

    /* renamed from: a, reason: collision with root package name */
    public final String f90518a;

    static {
        w[] wVarArr = {new w("NOVA", 0, "com.novalauncher.THEME"), new w("GO", 1, "com.gau.go.launcherex.theme"), new v("APEX", 2, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)};
        f90517b = wVarArr;
        EnumEntriesKt.a(wVarArr);
    }

    public w(String str, int i5, String str2) {
        this.f90518a = str2;
    }

    public static w valueOf(String str) {
        return (w) Enum.valueOf(w.class, str);
    }

    public static w[] values() {
        return (w[]) f90517b.clone();
    }

    public Intent a() {
        String str = this.f90518a;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return new Intent(str);
    }
}
