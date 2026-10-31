package sp;

import android.content.Context;
import android.content.SharedPreferences;

/* loaded from: classes4.dex */
public final class o {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f87641c = 0;

    /* renamed from: a, reason: collision with root package name */
    public h30.b f87642a;

    /* renamed from: b, reason: collision with root package name */
    public Context f87643b;

    static {
        new b50.d(o.class.getSimpleName());
    }

    public final synchronized long a() {
        long j11;
        Context context = this.f87643b;
        j11 = context.getSharedPreferences("batch_send_id", 0).getLong("sendId", 0L) + 1;
        try {
            SharedPreferences.Editor editorEdit = context.getSharedPreferences("batch_send_id", 0).edit();
            editorEdit.putLong("sendId", j11);
            editorEdit.commit();
        } catch (Throwable th2) {
            r0.c(th2);
        }
        return j11;
    }
}
