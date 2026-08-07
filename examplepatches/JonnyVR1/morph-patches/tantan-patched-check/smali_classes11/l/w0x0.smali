.class public final Ll/w0x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/v6x0;

.field public static final b:Ll/v5x0;

.field public static final c:Ll/x5x0;

.field public static final d:Ll/yww0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Ll/t0x0;->a:Ll/t0x0;

    .line 2
    .line 3
    const-class v1, Ll/s0x0;

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
    sput-object v0, Ll/w0x0;->a:Ll/v6x0;

    .line 12
    .line 13
    sget-object v0, Ll/u0x0;->a:Ll/u0x0;

    .line 14
    .line 15
    sput-object v0, Ll/w0x0;->b:Ll/v5x0;

    .line 16
    .line 17
    sget-object v0, Ll/v0x0;->a:Ll/v0x0;

    .line 18
    .line 19
    sput-object v0, Ll/w0x0;->c:Ll/x5x0;

    .line 20
    .line 21
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgus;->zzb:Lcom/google/android/gms/internal/ads/zzgus;

    .line 22
    .line 23
    invoke-static {}, Lcom/google/android/gms/internal/ads/m4;->Q()Ll/lkx0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v3, "type.googleapis.com/google.crypto.tink.AesGcmSivKey"

    .line 28
    .line 29
    invoke-static {v3, v2, v0, v1}, Ll/o5x0;->c(Ljava/lang/String;Ljava/lang/Class;Lcom/google/android/gms/internal/ads/zzgus;Ll/lkx0;)Ll/yww0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Ll/w0x0;->d:Ll/yww0;

    .line 34
    .line 35
    return-void
.end method

.method public static a(Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object p0, Ll/k1x0;->a:Ll/wfx0;

    .line 2
    .line 3
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/k1x0;->e(Ll/j6x0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/w0x0;->b()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget-object v0, Ll/w0x0;->a:Ll/v6x0;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/g6x0;->e(Ll/v6x0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/f6x0;->b()Ll/f6x0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/y0x0;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-direct {v1, v2}, Ll/y0x0;-><init>(Ll/x0x0;)V

    .line 38
    .line 39
    .line 40
    const/16 v3, 0x10

    .line 41
    .line 42
    invoke-virtual {v1, v3}, Ll/y0x0;->a(I)Ll/y0x0;

    .line 43
    .line 44
    .line 45
    sget-object v4, Ll/z0x0;->b:Ll/z0x0;

    .line 46
    .line 47
    invoke-virtual {v1, v4}, Ll/y0x0;->b(Ll/z0x0;)Ll/y0x0;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ll/y0x0;->c()Ll/b1x0;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const-string v5, "AES128_GCM_SIV"

    .line 55
    .line 56
    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    new-instance v1, Ll/y0x0;

    .line 60
    .line 61
    invoke-direct {v1, v2}, Ll/y0x0;-><init>(Ll/x0x0;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v3}, Ll/y0x0;->a(I)Ll/y0x0;

    .line 65
    .line 66
    .line 67
    sget-object v3, Ll/z0x0;->d:Ll/z0x0;

    .line 68
    .line 69
    invoke-virtual {v1, v3}, Ll/y0x0;->b(Ll/z0x0;)Ll/y0x0;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1}, Ll/y0x0;->c()Ll/b1x0;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-string v5, "AES128_GCM_SIV_RAW"

    .line 77
    .line 78
    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    new-instance v1, Ll/y0x0;

    .line 82
    .line 83
    invoke-direct {v1, v2}, Ll/y0x0;-><init>(Ll/x0x0;)V

    .line 84
    .line 85
    .line 86
    const/16 v5, 0x20

    .line 87
    .line 88
    invoke-virtual {v1, v5}, Ll/y0x0;->a(I)Ll/y0x0;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v4}, Ll/y0x0;->b(Ll/z0x0;)Ll/y0x0;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Ll/y0x0;->c()Ll/b1x0;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    const-string v4, "AES256_GCM_SIV"

    .line 99
    .line 100
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    new-instance v1, Ll/y0x0;

    .line 104
    .line 105
    invoke-direct {v1, v2}, Ll/y0x0;-><init>(Ll/x0x0;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v5}, Ll/y0x0;->a(I)Ll/y0x0;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, v3}, Ll/y0x0;->b(Ll/z0x0;)Ll/y0x0;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Ll/y0x0;->c()Ll/b1x0;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    const-string v2, "AES256_GCM_SIV_RAW"

    .line 119
    .line 120
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p0, v0}, Ll/f6x0;->d(Ljava/util/Map;)V

    .line 128
    .line 129
    .line 130
    invoke-static {}, Ll/y5x0;->a()Ll/y5x0;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    sget-object v0, Ll/w0x0;->c:Ll/x5x0;

    .line 135
    .line 136
    const-class v1, Ll/b1x0;

    .line 137
    .line 138
    invoke-virtual {p0, v0, v1}, Ll/y5x0;->b(Ll/x5x0;Ljava/lang/Class;)V

    .line 139
    .line 140
    .line 141
    invoke-static {}, Ll/w5x0;->b()Ll/w5x0;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    sget-object v0, Ll/w0x0;->b:Ll/v5x0;

    .line 146
    .line 147
    invoke-virtual {p0, v0, v1}, Ll/w5x0;->c(Ll/v5x0;Ljava/lang/Class;)V

    .line 148
    .line 149
    .line 150
    sget-object p0, Ll/w0x0;->d:Ll/yww0;

    .line 151
    .line 152
    const/4 v0, 0x1

    .line 153
    invoke-static {p0, v0}, Ll/zxw0;->e(Ll/yww0;Z)V

    .line 154
    .line 155
    .line 156
    :cond_0
    return-void
.end method

.method public static b()Z
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "AES/GCM-SIV/NoPadding"

    .line 2
    .line 3
    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    return v0

    .line 8
    :catch_0
    const/4 v0, 0x0

    .line 9
    return v0
.end method
