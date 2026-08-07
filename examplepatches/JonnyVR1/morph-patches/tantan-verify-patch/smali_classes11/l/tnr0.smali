.class public final Ll/tnr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:J

.field public c:I

.field public d:I

.field public e:I

.field public final f:[I

.field public final g:Ll/bgw0;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xff

    .line 5
    .line 6
    new-array v1, v0, [I

    .line 7
    .line 8
    iput-object v1, p0, Ll/tnr0;->f:[I

    .line 9
    .line 10
    new-instance v1, Ll/bgw0;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Ll/bgw0;-><init>(I)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/tnr0;->a:I

    .line 3
    .line 4
    const-wide/16 v1, 0x0

    .line 5
    .line 6
    iput-wide v1, p0, Ll/tnr0;->b:J

    .line 7
    .line 8
    iput v0, p0, Ll/tnr0;->c:I

    .line 9
    .line 10
    iput v0, p0, Ll/tnr0;->d:I

    .line 11
    .line 12
    iput v0, p0, Ll/tnr0;->e:I

    .line 13
    .line 14
    return-void
.end method

.method public final b(Ll/qer0;Z)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/tnr0;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 5
    .line 6
    const/16 v1, 0x1b

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/bgw0;->h(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-static {p1, v0, v2, v1, p2}, Ll/ter0;->c(Ll/qer0;[BIIZ)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_4

    .line 23
    .line 24
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/bgw0;->J()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    const-wide/32 v3, 0x4f676753

    .line 31
    .line 32
    .line 33
    cmp-long v0, v0, v3

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    if-eqz p2, :cond_1

    .line 47
    .line 48
    return v2

    .line 49
    :cond_1
    const-string p0, "unsupported bit stream revision"

    .line 50
    .line 51
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    throw p0

    .line 56
    :cond_2
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Ll/tnr0;->a:I

    .line 63
    .line 64
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/bgw0;->G()J

    .line 67
    .line 68
    .line 69
    move-result-wide v0

    .line 70
    iput-wide v0, p0, Ll/tnr0;->b:J

    .line 71
    .line 72
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/bgw0;->H()J

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/bgw0;->H()J

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/bgw0;->H()J

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p0, Ll/tnr0;->c:I

    .line 94
    .line 95
    add-int/lit8 v1, v0, 0x1b

    .line 96
    .line 97
    iput v1, p0, Ll/tnr0;->d:I

    .line 98
    .line 99
    iget-object v1, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 100
    .line 101
    invoke-virtual {v1, v0}, Ll/bgw0;->h(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 105
    .line 106
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget v1, p0, Ll/tnr0;->c:I

    .line 111
    .line 112
    invoke-static {p1, v0, v2, v1, p2}, Ll/ter0;->c(Ll/qer0;[BIIZ)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_4

    .line 117
    .line 118
    :goto_0
    iget p1, p0, Ll/tnr0;->c:I

    .line 119
    .line 120
    if-ge v2, p1, :cond_3

    .line 121
    .line 122
    iget-object p1, p0, Ll/tnr0;->f:[I

    .line 123
    .line 124
    iget-object p2, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 125
    .line 126
    invoke-virtual {p2}, Ll/bgw0;->B()I

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    aput p2, p1, v2

    .line 131
    .line 132
    iget p1, p0, Ll/tnr0;->e:I

    .line 133
    .line 134
    iget-object p2, p0, Ll/tnr0;->f:[I

    .line 135
    .line 136
    aget p2, p2, v2

    .line 137
    .line 138
    add-int/2addr p1, p2

    .line 139
    iput p1, p0, Ll/tnr0;->e:I

    .line 140
    .line 141
    add-int/lit8 v2, v2, 0x1

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_3
    const/4 p0, 0x1

    .line 145
    return p0

    .line 146
    :cond_4
    :goto_1
    return v2
.end method

.method public final c(Ll/qer0;J)Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-interface {p1}, Ll/qer0;->zze()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    cmp-long v0, v0, v2

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    move v0, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 22
    .line 23
    const/4 v3, 0x4

    .line 24
    invoke-virtual {v0, v3}, Ll/bgw0;->h(I)V

    .line 25
    .line 26
    .line 27
    :goto_1
    const-wide/16 v4, -0x1

    .line 28
    .line 29
    cmp-long v0, p2, v4

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 34
    .line 35
    .line 36
    move-result-wide v4

    .line 37
    const-wide/16 v6, 0x4

    .line 38
    .line 39
    add-long/2addr v4, v6

    .line 40
    cmp-long v4, v4, p2

    .line 41
    .line 42
    if-ltz v4, :cond_1

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_1
    iget-object v4, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 46
    .line 47
    invoke-virtual {v4}, Ll/bgw0;->m()[B

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-static {p1, v4, v1, v3, v2}, Ll/ter0;->c(Ll/qer0;[BIIZ)Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v4, :cond_3

    .line 56
    .line 57
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ll/bgw0;->k(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/tnr0;->g:Ll/bgw0;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/bgw0;->J()J

    .line 65
    .line 66
    .line 67
    move-result-wide v4

    .line 68
    const-wide/32 v6, 0x4f676753

    .line 69
    .line 70
    .line 71
    cmp-long v0, v4, v6

    .line 72
    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    move-object v0, p1

    .line 76
    check-cast v0, Ll/fer0;

    .line 77
    .line 78
    invoke-virtual {v0, v2, v1}, Ll/fer0;->k(IZ)Z

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 83
    .line 84
    .line 85
    return v2

    .line 86
    :cond_3
    :goto_2
    if-eqz v0, :cond_4

    .line 87
    .line 88
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 89
    .line 90
    .line 91
    move-result-wide v3

    .line 92
    cmp-long p0, v3, p2

    .line 93
    .line 94
    if-gez p0, :cond_5

    .line 95
    .line 96
    :cond_4
    invoke-interface {p1, v2}, Ll/qer0;->zzc(I)I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    const/4 v3, -0x1

    .line 101
    if-ne p0, v3, :cond_3

    .line 102
    .line 103
    :cond_5
    return v1
.end method
