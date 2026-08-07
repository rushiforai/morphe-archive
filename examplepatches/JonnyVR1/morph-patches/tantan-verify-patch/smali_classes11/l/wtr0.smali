.class public final Ll/wtr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aer0;


# instance fields
.field public final a:Ll/nnw0;

.field public final b:Ll/bgw0;

.field public final c:I


# direct methods
.method public constructor <init>(ILl/nnw0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/wtr0;->c:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/wtr0;->a:Ll/nnw0;

    .line 7
    .line 8
    new-instance p1, Ll/bgw0;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/wtr0;->b:Ll/bgw0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a(Ll/qer0;J)Ll/zdr0;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-interface/range {p1 .. p1}, Ll/qer0;->zzf()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-interface/range {p1 .. p1}, Ll/qer0;->zzd()J

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    sub-long/2addr v3, v1

    .line 12
    const-wide/32 v5, 0x1b8a0

    .line 13
    .line 14
    .line 15
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->min(JJ)J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    long-to-int v3, v3

    .line 20
    iget-object v4, v0, Ll/wtr0;->b:Ll/bgw0;

    .line 21
    .line 22
    invoke-virtual {v4, v3}, Ll/bgw0;->h(I)V

    .line 23
    .line 24
    .line 25
    iget-object v4, v0, Ll/wtr0;->b:Ll/bgw0;

    .line 26
    .line 27
    invoke-virtual {v4}, Ll/bgw0;->m()[B

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    move-object/from16 v5, p1

    .line 32
    .line 33
    check-cast v5, Ll/fer0;

    .line 34
    .line 35
    const/4 v6, 0x0

    .line 36
    invoke-virtual {v5, v4, v6, v3, v6}, Ll/fer0;->c([BIIZ)Z

    .line 37
    .line 38
    .line 39
    iget-object v3, v0, Ll/wtr0;->b:Ll/bgw0;

    .line 40
    .line 41
    invoke-virtual {v3}, Ll/bgw0;->t()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    const-wide/16 v7, -0x1

    .line 51
    .line 52
    move-wide v11, v5

    .line 53
    move-wide v9, v7

    .line 54
    :goto_0
    invoke-virtual {v3}, Ll/bgw0;->q()I

    .line 55
    .line 56
    .line 57
    move-result v13

    .line 58
    const/16 v14, 0xbc

    .line 59
    .line 60
    if-lt v13, v14, :cond_5

    .line 61
    .line 62
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 63
    .line 64
    .line 65
    move-result-object v13

    .line 66
    invoke-virtual {v3}, Ll/bgw0;->s()I

    .line 67
    .line 68
    .line 69
    move-result v14

    .line 70
    invoke-static {v13, v14, v4}, Ll/iur0;->a([BII)I

    .line 71
    .line 72
    .line 73
    move-result v13

    .line 74
    add-int/lit16 v14, v13, 0xbc

    .line 75
    .line 76
    if-le v14, v4, :cond_0

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_0
    iget v7, v0, Ll/wtr0;->c:I

    .line 80
    .line 81
    invoke-static {v3, v13, v7}, Ll/iur0;->b(Ll/bgw0;II)J

    .line 82
    .line 83
    .line 84
    move-result-wide v7

    .line 85
    cmp-long v15, v7, v5

    .line 86
    .line 87
    if-eqz v15, :cond_4

    .line 88
    .line 89
    iget-object v15, v0, Ll/wtr0;->a:Ll/nnw0;

    .line 90
    .line 91
    invoke-virtual {v15, v7, v8}, Ll/nnw0;->b(J)J

    .line 92
    .line 93
    .line 94
    move-result-wide v7

    .line 95
    cmp-long v15, v7, p2

    .line 96
    .line 97
    if-lez v15, :cond_2

    .line 98
    .line 99
    cmp-long v0, v11, v5

    .line 100
    .line 101
    if-nez v0, :cond_1

    .line 102
    .line 103
    invoke-static {v7, v8, v1, v2}, Ll/zdr0;->d(JJ)Ll/zdr0;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    return-object v0

    .line 108
    :cond_1
    add-long/2addr v1, v9

    .line 109
    invoke-static {v1, v2}, Ll/zdr0;->e(J)Ll/zdr0;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    return-object v0

    .line 114
    :cond_2
    int-to-long v9, v13

    .line 115
    const-wide/32 v11, 0x186a0

    .line 116
    .line 117
    .line 118
    add-long/2addr v11, v7

    .line 119
    cmp-long v11, v11, p2

    .line 120
    .line 121
    if-lez v11, :cond_3

    .line 122
    .line 123
    add-long/2addr v1, v9

    .line 124
    invoke-static {v1, v2}, Ll/zdr0;->e(J)Ll/zdr0;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    return-object v0

    .line 129
    :cond_3
    move-wide v11, v7

    .line 130
    :cond_4
    invoke-virtual {v3, v14}, Ll/bgw0;->k(I)V

    .line 131
    .line 132
    .line 133
    int-to-long v7, v14

    .line 134
    goto :goto_0

    .line 135
    :cond_5
    :goto_1
    cmp-long v0, v11, v5

    .line 136
    .line 137
    if-eqz v0, :cond_6

    .line 138
    .line 139
    add-long/2addr v1, v7

    .line 140
    invoke-static {v11, v12, v1, v2}, Ll/zdr0;->f(JJ)Ll/zdr0;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    return-object v0

    .line 145
    :cond_6
    sget-object v0, Ll/zdr0;->d:Ll/zdr0;

    .line 146
    .line 147
    return-object v0
.end method

.method public final zzb()V
    .locals 2

    .line 1
    sget-object v0, Ll/mpw0;->f:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    iget-object p0, p0, Ll/wtr0;->b:Ll/bgw0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/bgw0;->i([BI)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
