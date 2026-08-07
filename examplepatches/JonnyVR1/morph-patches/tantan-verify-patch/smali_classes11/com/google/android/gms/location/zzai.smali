.class public final Lcom/google/android/gms/location/zzai;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static zza(I)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const-string p0, "THROTTLE_NEVER"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_1
    const-string p0, "THROTTLE_ALWAYS"

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_2
    const-string p0, "THROTTLE_BACKGROUND"

    .line 21
    .line 22
    return-object p0
.end method
