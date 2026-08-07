.class public final Ll/d2x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/yww0;

.field public static final b:Ll/v5x0;

.field public static final c:Ll/v6x0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgus;->zzb:Lcom/google/android/gms/internal/ads/zzgus;

    .line 2
    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/ads/c5;->Q()Ll/lkx0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 8
    .line 9
    const-class v3, Ll/jww0;

    .line 10
    .line 11
    invoke-static {v2, v3, v0, v1}, Ll/o5x0;->c(Ljava/lang/String;Ljava/lang/Class;Lcom/google/android/gms/internal/ads/zzgus;Ll/lkx0;)Ll/yww0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/d2x0;->a:Ll/yww0;

    .line 16
    .line 17
    sget-object v0, Ll/b2x0;->a:Ll/b2x0;

    .line 18
    .line 19
    sput-object v0, Ll/d2x0;->b:Ll/v5x0;

    .line 20
    .line 21
    sget-object v0, Ll/c2x0;->a:Ll/c2x0;

    .line 22
    .line 23
    const-class v1, Ll/q2x0;

    .line 24
    .line 25
    invoke-static {v0, v1, v3}, Ll/v6x0;->b(Ll/t6x0;Ljava/lang/Class;Ljava/lang/Class;)Ll/v6x0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/d2x0;->c:Ll/v6x0;

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
    sget-object p0, Ll/a3x0;->a:Ll/wfx0;

    .line 2
    .line 3
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/a3x0;->e(Ll/j6x0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/w5x0;->b()Ll/w5x0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Ll/d2x0;->b:Ll/v5x0;

    .line 15
    .line 16
    const-class v1, Ll/v2x0;

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Ll/w5x0;->c(Ll/v5x0;Ljava/lang/Class;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, Ll/d2x0;->c:Ll/v6x0;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/g6x0;->e(Ll/v6x0;)V

    .line 28
    .line 29
    .line 30
    sget-object p0, Ll/d2x0;->a:Ll/yww0;

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
