package og;

import com.google.android.gms.cloudmessaging.zzd;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class b extends ClassLoader {
    @Override // java.lang.ClassLoader
    public final Class loadClass(String str, boolean z11) {
        return Objects.equals(str, "com.google.android.gms.iid.MessengerCompat") ? zzd.class : super.loadClass(str, z11);
    }
}
