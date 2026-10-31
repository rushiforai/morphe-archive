package com.google.android.libraries.places.internal;

import java.io.IOException;

/* loaded from: classes3.dex */
public class zzauf extends IOException {
    private zzavf zza;
    private boolean zzb;

    public zzauf(IOException iOException) {
        super(iOException.getMessage(), iOException);
        this.zza = null;
    }

    public static zzaue zza() {
        return new zzaue("Protocol message tag had invalid wire type.");
    }

    public static zzauf zzb() {
        return new zzauf("Protocol message end-group tag did not match expected tag.");
    }

    public static zzauf zzc() {
        return new zzauf("Protocol message contained an invalid tag (zero).");
    }

    public static zzauf zzd() {
        return new zzauf("Protocol message had invalid UTF-8.");
    }

    public static zzauf zze() {
        return new zzauf("CodedInputStream encountered a malformed varint.");
    }

    public static zzauf zzf() {
        return new zzauf("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
    }

    public static zzauf zzg() {
        return new zzauf("Failed to parse the message.");
    }

    public static zzauf zzi() {
        return new zzauf("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit.");
    }

    public static zzauf zzj() {
        return new zzauf("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    public final zzauf zzh(zzavf zzavfVar) {
        this.zza = zzavfVar;
        return this;
    }

    public final void zzk() {
        this.zzb = true;
    }

    public final boolean zzl() {
        return this.zzb;
    }

    public zzauf(String str) {
        super(str);
        this.zza = null;
    }
}
