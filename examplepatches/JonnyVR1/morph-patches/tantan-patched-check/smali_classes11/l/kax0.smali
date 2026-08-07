.class public final Ll/kax0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kxw0;


# instance fields
.field public final a:Ll/kxw0;

.field public final b:Lcom/google/android/gms/internal/ads/zzgvz;

.field public final c:[B


# direct methods
.method public constructor <init>(Ll/kxw0;Lcom/google/android/gms/internal/ads/zzgvz;[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kax0;->a:Ll/kxw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kax0;->b:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 7
    .line 8
    iput-object p3, p0, Ll/kax0;->c:[B

    .line 9
    .line 10
    return-void
.end method

.method public static a(Ll/q5x0;)Ll/kxw0;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/www0;->a()Ll/ayw0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/q5x0;->a(Ll/ayw0;)Ll/c7x0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/google/android/gms/internal/ads/t4;->L()Ll/zcx0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0}, Ll/c7x0;->f()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ll/zcx0;->r(Ljava/lang/String;)Ll/zcx0;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/c7x0;->d()Lcom/google/android/gms/internal/ads/zzgyl;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ll/zcx0;->s(Lcom/google/android/gms/internal/ads/zzgyl;)Ll/zcx0;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ll/c7x0;->b()Lcom/google/android/gms/internal/ads/zzgus;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Ll/zcx0;->q(Lcom/google/android/gms/internal/ads/zzgus;)Ll/zcx0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/google/android/gms/internal/ads/t4;

    .line 39
    .line 40
    const-class v2, Ll/kxw0;

    .line 41
    .line 42
    invoke-static {v1, v2}, Ll/zxw0;->c(Lcom/google/android/gms/internal/ads/t4;Ljava/lang/Class;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ll/kxw0;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/c7x0;->c()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget-object v2, Lcom/google/android/gms/internal/ads/zzgvz;->zza:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    const/4 v3, 0x5

    .line 59
    const/4 v4, 0x1

    .line 60
    if-eq v2, v4, :cond_3

    .line 61
    .line 62
    const/4 v4, 0x2

    .line 63
    const/4 v5, 0x0

    .line 64
    if-eq v2, v4, :cond_2

    .line 65
    .line 66
    const/4 v4, 0x3

    .line 67
    if-eq v2, v4, :cond_1

    .line 68
    .line 69
    const/4 v4, 0x4

    .line 70
    if-ne v2, v4, :cond_0

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    const-string p0, "unknown output prefix type"

    .line 74
    .line 75
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    const/4 p0, 0x0

    .line 79
    return-object p0

    .line 80
    :cond_1
    new-array p0, v5, [B

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    :goto_0
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {p0}, Ll/q5x0;->b()Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    goto :goto_1

    .line 108
    :cond_3
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {p0}, Ll/q5x0;->b()Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    invoke-virtual {v2, p0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    :goto_1
    new-instance v2, Ll/kax0;

    .line 133
    .line 134
    invoke-direct {v2, v1, v0, p0}, Ll/kax0;-><init>(Ll/kxw0;Lcom/google/android/gms/internal/ads/zzgvz;[B)V

    .line 135
    .line 136
    .line 137
    return-object v2
.end method
