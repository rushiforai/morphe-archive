package ya;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;

/* loaded from: classes.dex */
public abstract class d0 extends SQLiteOpenHelper {

    /* renamed from: a, reason: collision with root package name */
    public static final boolean f97113a;

    static {
        f97113a = Build.VERSION.SDK_INT >= 28;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public d0(Context context, String str, int i5) {
        boolean z11 = f97113a;
        super(z11 ? context : new c0(context), str, (SQLiteDatabase.CursorFactory) null, i5);
        if (z11) {
            setOpenParams(bh.a.b().addOpenFlags(16).build());
        }
    }
}
