package q10;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Build;
import android.provider.Settings;
import android.widget.Toast;
import com.teslacoilsw.launcher.screenoff.TimeOutActivity;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.coroutines.Continuation;
import w20.m;

/* loaded from: classes.dex */
public final class k extends l {
    @Override // q10.l
    public final boolean g(Context context) {
        return Settings.System.canWrite(context);
    }

    @Override // q10.l
    public final boolean h() {
        boolean z11 = m.f93691a;
        int i5 = Build.VERSION.SDK_INT;
        if (i5 <= 27) {
            return i5 != 27 || Build.VERSION.PREVIEW_SDK_INT < 1;
        }
        return false;
    }

    @Override // q10.l
    public final Object i(Context context, Continuation continuation) {
        context.startActivity(new Intent(context, (Class<?>) TimeOutActivity.class));
        return Boolean.TRUE;
    }

    @Override // q10.l
    public final void j(Context context) throws Resources.NotFoundException {
        Intent intent = new Intent("android.settings.action.MANAGE_WRITE_SETTINGS");
        intent.addFlags(SQLiteDatabase.OPEN_NOMUTEX);
        context.startActivity(intent);
        Toast toastMakeText = Toast.makeText(context.getApplicationContext(), 2132019452, 1);
        toastMakeText.setGravity(17, 0, 0);
        toastMakeText.show();
    }
}
