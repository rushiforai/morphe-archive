package fc;

import java.util.ArrayList;

/* loaded from: classes2.dex */
public abstract class i {
    public abstract String dj();

    public abstract int fby();

    public abstract long jc();

    public abstract int jw();

    public abstract boolean lt();

    public abstract long lud();

    public final String sya() {
        return "CREATE TABLE IF NOT EXISTS " + dj() + " (_id INTEGER PRIMARY KEY AUTOINCREMENT, data_id TEXT UNIQUE, data BLOB, priority INTEGER DEFAULT 0, upload_retry_count INTEGER DEFAULT 0, create_time INTEGER);";
    }

    public abstract d ul();

    public abstract long ycx();

    public abstract h ycx(String str, byte[] bArr, int i5, int i11);

    public abstract void ycx(ArrayList arrayList, f fVar);

    public abstract int zb();
}
