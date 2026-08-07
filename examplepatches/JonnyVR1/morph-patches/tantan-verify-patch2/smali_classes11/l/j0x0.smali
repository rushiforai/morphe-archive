.class public final Ll/j0x0;
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
    sget-object v0, Ll/g0x0;->a:Ll/g0x0;

    .line 2
    .line 3
    const-class v1, Ll/a0x0;

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
    sput-object v0, Ll/j0x0;->a:Ll/v6x0;

    .line 12
    .line 13
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgus;->zzb:Lcom/google/android/gms/internal/ads/zzgus;

    .line 14
    .line 15
    invoke-static {}, Lcom/google/android/gms/internal/ads/k4;->Q()Ll/lkx0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v3, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 20
    .line 21
    invoke-static {v3, v2, v0, v1}, Ll/o5x0;->c(Ljava/lang/String;Ljava/lang/Class;Lcom/google/android/gms/internal/ads/zzgus;Ll/lkx0;)Ll/yww0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Ll/j0x0;->b:Ll/yww0;

    .line 26
    .line 27
    sget-object v0, Ll/h0x0;->a:Ll/h0x0;

    .line 28
    .line 29
    sput-object v0, Ll/j0x0;->c:Ll/x5x0;

    .line 30
    .line 31
    sget-object v0, Ll/i0x0;->a:Ll/i0x0;

    .line 32
    .line 33
    sput-object v0, Ll/j0x0;->d:Ll/v5x0;

    .line 34
    .line 35
    return-void
.end method

.method public static a(Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object p0, Ll/a4x0;->a:Ll/wfx0;

    .line 2
    .line 3
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/a4x0;->e(Ll/j6x0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Ll/j0x0;->a:Ll/v6x0;

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
    const-string v1, "AES128_GCM"

    .line 29
    .line 30
    sget-object v2, Ll/h3x0;->a:Ll/o0x0;

    .line 31
    .line 32
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/l0x0;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-direct {v1, v2}, Ll/l0x0;-><init>(Ll/k0x0;)V

    .line 39
    .line 40
    .line 41
    const/16 v3, 0xc

    .line 42
    .line 43
    invoke-virtual {v1, v3}, Ll/l0x0;->a(I)Ll/l0x0;

    .line 44
    .line 45
    .line 46
    const/16 v4, 0x10

    .line 47
    .line 48
    invoke-virtual {v1, v4}, Ll/l0x0;->b(I)Ll/l0x0;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v4}, Ll/l0x0;->c(I)Ll/l0x0;

    .line 52
    .line 53
    .line 54
    sget-object v5, Ll/m0x0;->d:Ll/m0x0;

    .line 55
    .line 56
    invoke-virtual {v1, v5}, Ll/l0x0;->d(Ll/m0x0;)Ll/l0x0;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ll/l0x0;->e()Ll/o0x0;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v6, "AES128_GCM_RAW"

    .line 64
    .line 65
    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    const-string v1, "AES256_GCM"

    .line 69
    .line 70
    sget-object v6, Ll/h3x0;->b:Ll/o0x0;

    .line 71
    .line 72
    invoke-interface {v0, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    new-instance v1, Ll/l0x0;

    .line 76
    .line 77
    invoke-direct {v1, v2}, Ll/l0x0;-><init>(Ll/k0x0;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v3}, Ll/l0x0;->a(I)Ll/l0x0;

    .line 81
    .line 82
    .line 83
    const/16 v2, 0x20

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Ll/l0x0;->b(I)Ll/l0x0;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v4}, Ll/l0x0;->c(I)Ll/l0x0;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v5}, Ll/l0x0;->d(Ll/m0x0;)Ll/l0x0;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Ll/l0x0;->e()Ll/o0x0;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    const-string v2, "AES256_GCM_RAW"

    .line 99
    .line 100
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p0, v0}, Ll/f6x0;->d(Ljava/util/Map;)V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Ll/y5x0;->a()Ll/y5x0;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    sget-object v0, Ll/j0x0;->c:Ll/x5x0;

    .line 115
    .line 116
    const-class v1, Ll/o0x0;

    .line 117
    .line 118
    invoke-virtual {p0, v0, v1}, Ll/y5x0;->b(Ll/x5x0;Ljava/lang/Class;)V

    .line 119
    .line 120
    .line 121
    invoke-static {}, Ll/w5x0;->b()Ll/w5x0;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    sget-object v0, Ll/j0x0;->d:Ll/v5x0;

    .line 126
    .line 127
    invoke-virtual {p0, v0, v1}, Ll/w5x0;->c(Ll/v5x0;Ljava/lang/Class;)V

    .line 128
    .line 129
    .line 130
    invoke-static {}, Ll/f5x0;->c()Ll/f5x0;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    sget-object v0, Ll/j0x0;->b:Ll/yww0;

    .line 135
    .line 136
    const/4 v1, 0x2

    .line 137
    const/4 v2, 0x1

    .line 138
    invoke-virtual {p0, v0, v1, v2}, Ll/f5x0;->f(Ll/yww0;IZ)V

    .line 139
    .line 140
    .line 141
    return-void
.end method
