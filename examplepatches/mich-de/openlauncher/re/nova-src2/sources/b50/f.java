package b50;

import android.content.Context;
import android.content.Intent;
import android.os.UserHandle;

/* loaded from: classes4.dex */
public interface f {
    boolean getOnlyDoReporting();

    boolean openIntent(Context context, Intent intent, UserHandle userHandle);
}
