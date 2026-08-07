.class public final Ll/hor0;
.super Ll/lor0;
.source "SourceFile"


# static fields
.field public static final o:[B

.field public static final p:[B


# instance fields
.field public n:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Ll/hor0;->o:[B

    .line 9
    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    fill-array-data v0, :array_1

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/hor0;->p:[B

    .line 16
    .line 17
    return-void

    .line 18
    nop

    :array_0
    .array-data 1
        0x4ft
        0x70t
        0x75t
        0x73t
        0x48t
        0x65t
        0x61t
        0x64t
    .end array-data

    :array_1
    .array-data 1
        0x4ft
        0x70t
        0x75t
        0x73t
        0x54t
        0x61t
        0x67t
        0x73t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lor0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j(Ll/bgw0;)Z
    .locals 1

    .line 1
    sget-object v0, Ll/hor0;->o:[B

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/hor0;->k(Ll/bgw0;[B)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static k(Ll/bgw0;[B)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/bgw0;->q()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/16 v2, 0x8

    .line 7
    .line 8
    if-ge v0, v2, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    new-array v3, v2, [B

    .line 16
    .line 17
    invoke-virtual {p0, v3, v1, v2}, Ll/bgw0;->g([BII)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/bgw0;->k(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {v3, p1}, Ljava/util/Arrays;->equals([B[B)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method


# virtual methods
.method public final a(Ll/bgw0;)J
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/xfr0;->d([B)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p0, v0, v1}, Ll/lor0;->f(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    return-wide p0
.end method

.method public final b(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/lor0;->b(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/hor0;->n:Z

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final c(Ll/bgw0;JLl/ior0;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNullIf;
        expression = {
            "#3.format"
        }
        result = false
    .end annotation

    .line 1
    sget-object p2, Ll/hor0;->o:[B

    .line 2
    .line 3
    invoke-static {p1, p2}, Ll/hor0;->k(Ll/bgw0;[B)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 p3, 0x1

    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/16 p1, 0x9

    .line 23
    .line 24
    aget-byte p1, p0, p1

    .line 25
    .line 26
    and-int/lit16 p1, p1, 0xff

    .line 27
    .line 28
    invoke-static {p0}, Ll/xfr0;->e([B)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object p2, p4, Ll/ior0;->a:Ll/sqr0;

    .line 33
    .line 34
    if-eqz p2, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance p2, Ll/znr0;

    .line 38
    .line 39
    invoke-direct {p2}, Ll/znr0;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v0, "audio/opus"

    .line 43
    .line 44
    invoke-virtual {p2, v0}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2, p1}, Ll/znr0;->k0(I)Ll/znr0;

    .line 48
    .line 49
    .line 50
    const p1, 0xbb80

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2, p1}, Ll/znr0;->x(I)Ll/znr0;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2, p0}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2}, Ll/znr0;->D()Ll/sqr0;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    iput-object p0, p4, Ll/ior0;->a:Ll/sqr0;

    .line 64
    .line 65
    return p3

    .line 66
    :cond_1
    sget-object p2, Ll/hor0;->p:[B

    .line 67
    .line 68
    invoke-static {p1, p2}, Ll/hor0;->k(Ll/bgw0;[B)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    const/4 v0, 0x0

    .line 73
    if-eqz p2, :cond_3

    .line 74
    .line 75
    iget-object p2, p4, Ll/ior0;->a:Ll/sqr0;

    .line 76
    .line 77
    invoke-static {p2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    iget-boolean p2, p0, Ll/hor0;->n:Z

    .line 81
    .line 82
    if-nez p2, :cond_2

    .line 83
    .line 84
    iput-boolean p3, p0, Ll/hor0;->n:Z

    .line 85
    .line 86
    const/16 p0, 0x8

    .line 87
    .line 88
    invoke-virtual {p1, p0}, Ll/bgw0;->l(I)V

    .line 89
    .line 90
    .line 91
    invoke-static {p1, v0, v0}, Ll/ygr0;->c(Ll/bgw0;ZZ)Ll/vgr0;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iget-object p0, p0, Ll/vgr0;->b:[Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzgaa;->zzk([Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {p0}, Ll/ygr0;->b(Ljava/util/List;)Lcom/google/android/gms/internal/ads/zzby;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    if-eqz p0, :cond_2

    .line 106
    .line 107
    iget-object p1, p4, Ll/ior0;->a:Ll/sqr0;

    .line 108
    .line 109
    invoke-virtual {p1}, Ll/sqr0;->b()Ll/znr0;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget-object p2, p4, Ll/ior0;->a:Ll/sqr0;

    .line 114
    .line 115
    iget-object p2, p2, Ll/sqr0;->j:Lcom/google/android/gms/internal/ads/zzby;

    .line 116
    .line 117
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/ads/zzby;->d(Lcom/google/android/gms/internal/ads/zzby;)Lcom/google/android/gms/internal/ads/zzby;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p1, p0}, Ll/znr0;->p(Lcom/google/android/gms/internal/ads/zzby;)Ll/znr0;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Ll/znr0;->D()Ll/sqr0;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    iput-object p0, p4, Ll/ior0;->a:Ll/sqr0;

    .line 129
    .line 130
    :cond_2
    :goto_0
    return p3

    .line 131
    :cond_3
    iget-object p0, p4, Ll/ior0;->a:Ll/sqr0;

    .line 132
    .line 133
    invoke-static {p0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    return v0
.end method
