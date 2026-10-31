package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class cd {

    /* renamed from: a, reason: collision with root package name */
    public final pc f32436a;

    /* renamed from: b, reason: collision with root package name */
    public final ke f32437b;

    public cd(pc pcVar, ke keVar) {
        this.f32436a = pcVar;
        this.f32437b = keVar;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof cd) {
            cd cdVar = (cd) obj;
            pc pcVar = cdVar.f32436a;
            pc pcVar2 = this.f32436a;
            if (pcVar2 != null ? pcVar2.equals(pcVar) : pcVar == null) {
                if (this.f32437b.equals(cdVar.f32437b)) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        pc pcVar = this.f32436a;
        return (((pcVar == null ? 0 : pcVar.hashCode()) ^ 1000003) * 1000003) ^ this.f32437b.hashCode();
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.f32436a);
        String string = this.f32437b.toString();
        StringBuilder sb2 = new StringBuilder(strValueOf.length() + 52 + string.length() + 1);
        b.c0.D(sb2, "SnapshotBlobAndResult{snapshotBlob=", strValueOf, ", snapshotResult=", string);
        sb2.append("}");
        return sb2.toString();
    }
}
