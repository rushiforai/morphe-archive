.class public final Ll/m3x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/v6x0;

.field public static final b:Ll/yww0;

.field public static final c:Ll/x5x0;

.field public static final d:Ll/v5x0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Ll/j3x0;->a:Ll/j3x0;

    .line 2
    .line 3
    const-class v1, Ll/i3x0;

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
    sput-object v0, Ll/m3x0;->a:Ll/v6x0;

    .line 12
    .line 13
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgus;->zzb:Lcom/google/android/gms/internal/ads/zzgus;

    .line 14
    .line 15
    invoke-static {}, Lcom/google/android/gms/internal/ads/f5;->Q()Ll/lkx0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v3, "type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key"

    .line 20
    .line 21
    invoke-static {v3, v2, v0, v1}, Ll/o5x0;->c(Ljava/lang/String;Ljava/lang/Class;Lcom/google/android/gms/internal/ads/zzgus;Ll/lkx0;)Ll/yww0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Ll/m3x0;->b:Ll/yww0;

    .line 26
    .line 27
    sget-object v0, Ll/k3x0;->a:Ll/k3x0;

    .line 28
    .line 29
    sput-object v0, Ll/m3x0;->c:Ll/x5x0;

    .line 30
    .line 31
    sget-object v0, Ll/l3x0;->a:Ll/l3x0;

    .line 32
    .line 33
    sput-object v0, Ll/m3x0;->d:Ll/v5x0;

    .line 34
    .line 35
    return-void
.end method

.method public static a(Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object p0, Ll/p4x0;->a:Ll/wfx0;

    .line 2
    .line 3
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/p4x0;->e(Ll/j6x0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Ll/m3x0;->a:Ll/v6x0;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/g6x0;->e(Ll/v6x0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/f6x0;->b()Ll/f6x0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 26
    .line 27
    .line 28
    sget-object v1, Ll/n3x0;->b:Ll/n3x0;

    .line 29
    .line 30
    invoke-static {v1}, Ll/o3x0;->c(Ll/n3x0;)Ll/o3x0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "XCHACHA20_POLY1305"

    .line 35
    .line 36
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    sget-object v1, Ll/n3x0;->d:Ll/n3x0;

    .line 40
    .line 41
    invoke-static {v1}, Ll/o3x0;->c(Ll/n3x0;)Ll/o3x0;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "XCHACHA20_POLY1305_RAW"

    .line 46
    .line 47
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/f6x0;->d(Ljava/util/Map;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/w5x0;->b()Ll/w5x0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget-object v0, Ll/m3x0;->d:Ll/v5x0;

    .line 62
    .line 63
    const-class v1, Ll/o3x0;

    .line 64
    .line 65
    invoke-virtual {p0, v0, v1}, Ll/w5x0;->c(Ll/v5x0;Ljava/lang/Class;)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/y5x0;->a()Ll/y5x0;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    sget-object v0, Ll/m3x0;->c:Ll/x5x0;

    .line 73
    .line 74
    invoke-virtual {p0, v0, v1}, Ll/y5x0;->b(Ll/x5x0;Ljava/lang/Class;)V

    .line 75
    .line 76
    .line 77
    sget-object p0, Ll/m3x0;->b:Ll/yww0;

    .line 78
    .line 79
    const/4 v0, 0x1

    .line 80
    invoke-static {p0, v0}, Ll/zxw0;->e(Ll/yww0;Z)V

    .line 81
    .line 82
    .line 83
    return-void
.end method
