package vf;

import android.system.ErrnoException;
import android.system.OsConstants;

/* loaded from: classes3.dex */
public abstract class v {
    /* JADX INFO: Access modifiers changed from: private */
    public static boolean b(Throwable th2) {
        return (th2 instanceof ErrnoException) && ((ErrnoException) th2).errno == OsConstants.EACCES;
    }
}
