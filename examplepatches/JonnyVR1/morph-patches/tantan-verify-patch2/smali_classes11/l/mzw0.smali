.class public final Ll/mzw0;
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
    sget-object v0, Ll/kzw0;->a:Ll/kzw0;

    .line 2
    .line 3
    const-class v1, Ll/jzw0;

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
    sput-object v0, Ll/mzw0;->a:Ll/v6x0;

    .line 12
    .line 13
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgus;->zzb:Lcom/google/android/gms/internal/ads/zzgus;

    .line 14
    .line 15
    invoke-static {}, Lcom/google/android/gms/internal/ads/h4;->R()Ll/lkx0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v3, "type.googleapis.com/google.crypto.tink.AesEaxKey"

    .line 20
    .line 21
    invoke-static {v3, v2, v0, v1}, Ll/o5x0;->c(Ljava/lang/String;Ljava/lang/Class;Lcom/google/android/gms/internal/ads/zzgus;Ll/lkx0;)Ll/yww0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Ll/mzw0;->b:Ll/yww0;

    .line 26
    .line 27
    sget-object v0, Ll/lzw0;->a:Ll/lzw0;

    .line 28
    .line 29
    sput-object v0, Ll/mzw0;->c:Ll/v5x0;

    .line 30
    .line 31
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
    sget-object p0, Ll/wzw0;->a:Ll/wfx0;

    .line 2
    .line 3
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/wzw0;->e(Ll/j6x0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Ll/mzw0;->a:Ll/v6x0;

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
    const-string v1, "AES128_EAX"

    .line 29
    .line 30
    sget-object v2, Ll/h3x0;->c:Ll/rzw0;

    .line 31
    .line 32
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/ozw0;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-direct {v1, v2}, Ll/ozw0;-><init>(Ll/nzw0;)V

    .line 39
    .line 40
    .line 41
    const/16 v3, 0x10

    .line 42
    .line 43
    invoke-virtual {v1, v3}, Ll/ozw0;->a(I)Ll/ozw0;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v3}, Ll/ozw0;->b(I)Ll/ozw0;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v3}, Ll/ozw0;->c(I)Ll/ozw0;

    .line 50
    .line 51
    .line 52
    sget-object v4, Ll/pzw0;->d:Ll/pzw0;

    .line 53
    .line 54
    invoke-virtual {v1, v4}, Ll/ozw0;->d(Ll/pzw0;)Ll/ozw0;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ll/ozw0;->e()Ll/rzw0;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v5, "AES128_EAX_RAW"

    .line 62
    .line 63
    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    const-string v1, "AES256_EAX"

    .line 67
    .line 68
    sget-object v5, Ll/h3x0;->d:Ll/rzw0;

    .line 69
    .line 70
    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    new-instance v1, Ll/ozw0;

    .line 74
    .line 75
    invoke-direct {v1, v2}, Ll/ozw0;-><init>(Ll/nzw0;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v3}, Ll/ozw0;->a(I)Ll/ozw0;

    .line 79
    .line 80
    .line 81
    const/16 v2, 0x20

    .line 82
    .line 83
    invoke-virtual {v1, v2}, Ll/ozw0;->b(I)Ll/ozw0;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1, v3}, Ll/ozw0;->c(I)Ll/ozw0;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v4}, Ll/ozw0;->d(Ll/pzw0;)Ll/ozw0;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Ll/ozw0;->e()Ll/rzw0;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const-string v2, "AES256_EAX_RAW"

    .line 97
    .line 98
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p0, v0}, Ll/f6x0;->d(Ljava/util/Map;)V

    .line 106
    .line 107
    .line 108
    invoke-static {}, Ll/w5x0;->b()Ll/w5x0;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    sget-object v0, Ll/mzw0;->c:Ll/v5x0;

    .line 113
    .line 114
    const-class v1, Ll/rzw0;

    .line 115
    .line 116
    invoke-virtual {p0, v0, v1}, Ll/w5x0;->c(Ll/v5x0;Ljava/lang/Class;)V

    .line 117
    .line 118
    .line 119
    sget-object p0, Ll/mzw0;->b:Ll/yww0;

    .line 120
    .line 121
    const/4 v0, 0x1

    .line 122
    invoke-static {p0, v0}, Ll/zxw0;->e(Ll/yww0;Z)V

    .line 123
    .line 124
    .line 125
    return-void
.end method
