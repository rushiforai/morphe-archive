package s90;

import android.net.http.ConnectionMigrationOptions;
import android.net.http.DnsOptions;
import android.net.http.QuicOptions;

/* loaded from: classes5.dex */
public abstract /* synthetic */ class e {
    public static /* synthetic */ ConnectionMigrationOptions.Builder a() {
        return new ConnectionMigrationOptions.Builder();
    }

    public static /* synthetic */ DnsOptions.Builder c() {
        return new DnsOptions.Builder();
    }

    public static /* synthetic */ DnsOptions.StaleDnsOptions.Builder f() {
        return new DnsOptions.StaleDnsOptions.Builder();
    }

    public static /* synthetic */ QuicOptions.Builder j() {
        return new QuicOptions.Builder();
    }
}
