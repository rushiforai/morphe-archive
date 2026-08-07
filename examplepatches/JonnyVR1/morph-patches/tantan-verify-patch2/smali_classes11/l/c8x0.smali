.class public final Ll/c8x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/v5x0;

.field public static final b:Ll/v6x0;

.field public static final c:Ll/v6x0;

.field public static final d:Ll/yww0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Ll/z7x0;->a:Ll/z7x0;

    .line 2
    .line 3
    sput-object v0, Ll/c8x0;->a:Ll/v5x0;

    .line 4
    .line 5
    sget-object v0, Ll/a8x0;->a:Ll/a8x0;

    .line 6
    .line 7
    const-class v1, Ll/s8x0;

    .line 8
    .line 9
    const-class v2, Ll/y7x0;

    .line 10
    .line 11
    invoke-static {v0, v2, v1}, Ll/v6x0;->b(Ll/t6x0;Ljava/lang/Class;Ljava/lang/Class;)Ll/v6x0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/c8x0;->b:Ll/v6x0;

    .line 16
    .line 17
    sget-object v0, Ll/b8x0;->a:Ll/b8x0;

    .line 18
    .line 19
    const-class v1, Ll/kxw0;

    .line 20
    .line 21
    invoke-static {v0, v2, v1}, Ll/v6x0;->b(Ll/t6x0;Ljava/lang/Class;Ljava/lang/Class;)Ll/v6x0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Ll/c8x0;->c:Ll/v6x0;

    .line 26
    .line 27
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgus;->zzb:Lcom/google/android/gms/internal/ads/zzgus;

    .line 28
    .line 29
    invoke-static {}, Lcom/google/android/gms/internal/ads/z3;->R()Ll/lkx0;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "type.googleapis.com/google.crypto.tink.AesCmacKey"

    .line 34
    .line 35
    invoke-static {v3, v1, v0, v2}, Ll/o5x0;->c(Ljava/lang/String;Ljava/lang/Class;Lcom/google/android/gms/internal/ads/zzgus;Ll/lkx0;)Ll/yww0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Ll/c8x0;->d:Ll/yww0;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Ll/y7x0;)Ll/kxw0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/y7x0;->c()Ll/h8x0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/c8x0;->e(Ll/h8x0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ll/tfx0;->a(Ll/y7x0;)Ll/kxw0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic b(Ll/h8x0;Ljava/lang/Integer;)Ll/y7x0;
    .locals 1

    .line 1
    invoke-static {p0}, Ll/c8x0;->e(Ll/h8x0;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/w7x0;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p1, v0}, Ll/w7x0;-><init>(Ll/v7x0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ll/w7x0;->c(Ll/h8x0;)Ll/w7x0;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/h8x0;->c()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ll/xfx0;->c(I)Ll/xfx0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Ll/w7x0;->a(Ll/xfx0;)Ll/w7x0;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ll/w7x0;->b(Ljava/lang/Integer;)Ll/w7x0;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ll/w7x0;->d()Ll/y7x0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static synthetic c(Ll/y7x0;)Ll/s8x0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/y7x0;->c()Ll/h8x0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/c8x0;->e(Ll/h8x0;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/dax0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/dax0;-><init>(Ll/y7x0;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public static d(Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object p0, Ll/r8x0;->a:Ll/wfx0;

    .line 2
    .line 3
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/r8x0;->e(Ll/j6x0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/w5x0;->b()Ll/w5x0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Ll/c8x0;->a:Ll/v5x0;

    .line 15
    .line 16
    const-class v1, Ll/h8x0;

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
    sget-object v0, Ll/c8x0;->b:Ll/v6x0;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/g6x0;->e(Ll/v6x0;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget-object v0, Ll/c8x0;->c:Ll/v6x0;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/g6x0;->e(Ll/v6x0;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/f6x0;->b()Ll/f6x0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance v0, Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 46
    .line 47
    .line 48
    sget-object v1, Ll/bax0;->e:Ll/h8x0;

    .line 49
    .line 50
    const-string v2, "AES_CMAC"

    .line 51
    .line 52
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    const-string v2, "AES256_CMAC"

    .line 56
    .line 57
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    new-instance v1, Ll/e8x0;

    .line 61
    .line 62
    const/4 v2, 0x0

    .line 63
    invoke-direct {v1, v2}, Ll/e8x0;-><init>(Ll/d8x0;)V

    .line 64
    .line 65
    .line 66
    const/16 v2, 0x20

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ll/e8x0;->a(I)Ll/e8x0;

    .line 69
    .line 70
    .line 71
    const/16 v2, 0x10

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ll/e8x0;->b(I)Ll/e8x0;

    .line 74
    .line 75
    .line 76
    sget-object v2, Ll/f8x0;->e:Ll/f8x0;

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ll/e8x0;->c(Ll/f8x0;)Ll/e8x0;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ll/e8x0;->d()Ll/h8x0;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const-string v2, "AES256_CMAC_RAW"

    .line 86
    .line 87
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p0, v0}, Ll/f6x0;->d(Ljava/util/Map;)V

    .line 95
    .line 96
    .line 97
    sget-object p0, Ll/c8x0;->d:Ll/yww0;

    .line 98
    .line 99
    const/4 v0, 0x1

    .line 100
    invoke-static {p0, v0}, Ll/zxw0;->e(Ll/yww0;Z)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public static e(Ll/h8x0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/h8x0;->c()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x20

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string p0, "AesCmacKey size wrong, must be 32 bytes"

    .line 11
    .line 12
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
