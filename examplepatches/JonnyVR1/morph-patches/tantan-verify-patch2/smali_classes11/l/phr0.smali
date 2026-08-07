.class public final Ll/phr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aer0;


# instance fields
.field public final a:Ll/ofr0;

.field public final b:I

.field public final c:Ll/jfr0;


# direct methods
.method public synthetic constructor <init>(Ll/ofr0;ILl/ohr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/phr0;->a:Ll/ofr0;

    .line 5
    .line 6
    iput p2, p0, Ll/phr0;->b:I

    .line 7
    .line 8
    new-instance p1, Ll/jfr0;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/jfr0;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/phr0;->c:Ll/jfr0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a(Ll/qer0;J)Ll/zdr0;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/phr0;->a:Ll/ofr0;

    .line 2
    .line 3
    iget v0, v0, Ll/ofr0;->c:I

    .line 4
    .line 5
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {p0, p1}, Ll/phr0;->b(Ll/qer0;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    invoke-interface {p1}, Ll/qer0;->zze()J

    .line 14
    .line 15
    .line 16
    move-result-wide v5

    .line 17
    const/4 v7, 0x6

    .line 18
    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    move-object v7, p1

    .line 23
    check-cast v7, Ll/fer0;

    .line 24
    .line 25
    const/4 v8, 0x0

    .line 26
    invoke-virtual {v7, v0, v8}, Ll/fer0;->j(IZ)Z

    .line 27
    .line 28
    .line 29
    cmp-long v0, v3, p2

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/phr0;->b(Ll/qer0;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v7

    .line 35
    invoke-interface {p1}, Ll/qer0;->zze()J

    .line 36
    .line 37
    .line 38
    move-result-wide p0

    .line 39
    if-gtz v0, :cond_1

    .line 40
    .line 41
    cmp-long v0, v7, p2

    .line 42
    .line 43
    if-gtz v0, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-static {v5, v6}, Ll/zdr0;->e(J)Ll/zdr0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    :goto_0
    cmp-long p2, v7, p2

    .line 52
    .line 53
    if-gtz p2, :cond_2

    .line 54
    .line 55
    invoke-static {v7, v8, p0, p1}, Ll/zdr0;->f(JJ)Ll/zdr0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_2
    invoke-static {v3, v4, v1, v2}, Ll/zdr0;->d(JJ)Ll/zdr0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public final b(Ll/qer0;)J
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    invoke-interface {p1}, Ll/qer0;->zze()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-interface {p1}, Ll/qer0;->zzd()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const-wide/16 v4, -0x6

    .line 10
    .line 11
    add-long/2addr v2, v4

    .line 12
    cmp-long v0, v0, v2

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-gez v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Ll/phr0;->a:Ll/ofr0;

    .line 18
    .line 19
    iget v2, p0, Ll/phr0;->b:I

    .line 20
    .line 21
    iget-object v3, p0, Ll/phr0;->c:Ll/jfr0;

    .line 22
    .line 23
    invoke-interface {p1}, Ll/qer0;->zze()J

    .line 24
    .line 25
    .line 26
    move-result-wide v6

    .line 27
    const/4 v8, 0x2

    .line 28
    new-array v9, v8, [B

    .line 29
    .line 30
    move-object v10, p1

    .line 31
    check-cast v10, Ll/fer0;

    .line 32
    .line 33
    invoke-virtual {v10, v9, v1, v8, v1}, Ll/fer0;->c([BIIZ)Z

    .line 34
    .line 35
    .line 36
    aget-byte v11, v9, v1

    .line 37
    .line 38
    and-int/lit16 v11, v11, 0xff

    .line 39
    .line 40
    const/4 v12, 0x1

    .line 41
    aget-byte v13, v9, v12

    .line 42
    .line 43
    and-int/lit16 v13, v13, 0xff

    .line 44
    .line 45
    shl-int/lit8 v11, v11, 0x8

    .line 46
    .line 47
    or-int/2addr v11, v13

    .line 48
    if-eq v11, v2, :cond_0

    .line 49
    .line 50
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 51
    .line 52
    .line 53
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 54
    .line 55
    .line 56
    move-result-wide v2

    .line 57
    sub-long/2addr v6, v2

    .line 58
    long-to-int v0, v6

    .line 59
    invoke-virtual {v10, v0, v1}, Ll/fer0;->j(IZ)Z

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_0
    new-instance v11, Ll/bgw0;

    .line 64
    .line 65
    const/16 v13, 0x10

    .line 66
    .line 67
    invoke-direct {v11, v13}, Ll/bgw0;-><init>(I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v11}, Ll/bgw0;->m()[B

    .line 71
    .line 72
    .line 73
    move-result-object v13

    .line 74
    invoke-static {v9, v1, v13, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v11}, Ll/bgw0;->m()[B

    .line 78
    .line 79
    .line 80
    move-result-object v9

    .line 81
    const/16 v13, 0xe

    .line 82
    .line 83
    invoke-static {p1, v9, v8, v13}, Ll/ter0;->a(Ll/qer0;[BII)I

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    invoke-virtual {v11, v8}, Ll/bgw0;->j(I)V

    .line 88
    .line 89
    .line 90
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 91
    .line 92
    .line 93
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 94
    .line 95
    .line 96
    move-result-wide v8

    .line 97
    sub-long/2addr v6, v8

    .line 98
    long-to-int v6, v6

    .line 99
    invoke-virtual {v10, v6, v1}, Ll/fer0;->j(IZ)Z

    .line 100
    .line 101
    .line 102
    invoke-static {v11, v0, v2, v3}, Ll/kfr0;->c(Ll/bgw0;Ll/ofr0;ILl/jfr0;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_1

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_1
    :goto_1
    invoke-virtual {v10, v12, v1}, Ll/fer0;->j(IZ)Z

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_2
    :goto_2
    invoke-interface {p1}, Ll/qer0;->zze()J

    .line 114
    .line 115
    .line 116
    move-result-wide v2

    .line 117
    invoke-interface {p1}, Ll/qer0;->zzd()J

    .line 118
    .line 119
    .line 120
    move-result-wide v6

    .line 121
    add-long/2addr v6, v4

    .line 122
    cmp-long v0, v2, v6

    .line 123
    .line 124
    if-ltz v0, :cond_3

    .line 125
    .line 126
    invoke-interface {p1}, Ll/qer0;->zzd()J

    .line 127
    .line 128
    .line 129
    move-result-wide v2

    .line 130
    invoke-interface {p1}, Ll/qer0;->zze()J

    .line 131
    .line 132
    .line 133
    move-result-wide v4

    .line 134
    sub-long/2addr v2, v4

    .line 135
    check-cast p1, Ll/fer0;

    .line 136
    .line 137
    long-to-int v0, v2

    .line 138
    invoke-virtual {p1, v0, v1}, Ll/fer0;->j(IZ)Z

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Ll/phr0;->a:Ll/ofr0;

    .line 142
    .line 143
    iget-wide p0, p0, Ll/ofr0;->j:J

    .line 144
    .line 145
    return-wide p0

    .line 146
    :cond_3
    iget-object p0, p0, Ll/phr0;->c:Ll/jfr0;

    .line 147
    .line 148
    iget-wide p0, p0, Ll/jfr0;->a:J

    .line 149
    .line 150
    return-wide p0
.end method

.method public final synthetic zzb()V
    .locals 0

    .line 1
    return-void
.end method
