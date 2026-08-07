.class public final Ll/axw0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final a(Ll/lxw0;)Ll/lxw0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    const/4 p0, 0x0

    .line 5
    invoke-static {p0}, Ll/axw0;->b(Ll/lxw0;)Lcom/google/android/gms/internal/ads/u4;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h5;->h()[B

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/cyw0;->a([B)Ll/lxw0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static final b(Ll/lxw0;)Lcom/google/android/gms/internal/ads/u4;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class v0, Ll/d7x0;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v1, v0}, Ll/j6x0;->f(Ll/lxw0;Ljava/lang/Class;)Ll/l7x0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/d7x0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/d7x0;->c()Lcom/google/android/gms/internal/ads/u4;

    .line 15
    .line 16
    .line 17
    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    return-object p0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    new-instance v0, Lcom/google/android/gms/internal/ads/zzgpl;

    .line 21
    .line 22
    const-string v1, "Parsing parameters failed in getProto(). You probably want to call some Tink register function for "

    .line 23
    .line 24
    const-string v2, "null"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/internal/ads/zzgpl;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    throw v0
.end method
