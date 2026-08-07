.class public final Ll/z1x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/v6x0;

.field public static final b:Ll/yww0;

.field public static final c:Ll/v5x0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Ll/x1x0;->a:Ll/x1x0;

    .line 2
    .line 3
    const-class v1, Ll/e2x0;

    .line 4
    .line 5
    const-class v2, Ll/jww0;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Ll/v6x0;->b(Ll/t6x0;Ljava/lang/Class;Ljava/lang/Class;)Ll/v6x0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/z1x0;->a:Ll/v6x0;

    .line 12
    .line 13
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgus;->zze:Lcom/google/android/gms/internal/ads/zzgus;

    .line 14
    .line 15
    invoke-static {}, Lcom/google/android/gms/internal/ads/a5;->Q()Ll/lkx0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v3, "type.googleapis.com/google.crypto.tink.KmsAeadKey"

    .line 20
    .line 21
    invoke-static {v3, v2, v0, v1}, Ll/o5x0;->c(Ljava/lang/String;Ljava/lang/Class;Lcom/google/android/gms/internal/ads/zzgus;Ll/lkx0;)Ll/yww0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Ll/z1x0;->b:Ll/yww0;

    .line 26
    .line 27
    sget-object v0, Ll/y1x0;->a:Ll/y1x0;

    .line 28
    .line 29
    sput-object v0, Ll/z1x0;->c:Ll/v5x0;

    .line 30
    .line 31
    return-void
.end method

.method public static a(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object p0, Ll/k2x0;->a:Ll/wfx0;

    .line 2
    .line 3
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/k2x0;->a(Ll/j6x0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Ll/z1x0;->a:Ll/v6x0;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/g6x0;->e(Ll/v6x0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/w5x0;->b()Ll/w5x0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object v0, Ll/z1x0;->c:Ll/v5x0;

    .line 24
    .line 25
    const-class v1, Ll/f2x0;

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Ll/w5x0;->c(Ll/v5x0;Ljava/lang/Class;)V

    .line 28
    .line 29
    .line 30
    sget-object p0, Ll/z1x0;->b:Ll/yww0;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-static {p0, v0}, Ll/zxw0;->e(Ll/yww0;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
