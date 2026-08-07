.class public final Ll/alr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/bgw0;

.field public b:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    const/16 v1, 0x8

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/alr0;->a:Ll/bgw0;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Ll/qer0;)Z
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/qer0;->zzd()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    cmp-long v2, v0, v2

    .line 8
    .line 9
    const-wide/16 v3, 0x400

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    cmp-long v5, v0, v3

    .line 14
    .line 15
    if-lez v5, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move-wide v3, v0

    .line 19
    :cond_1
    :goto_0
    iget-object v5, p0, Ll/alr0;->a:Ll/bgw0;

    .line 20
    .line 21
    invoke-virtual {v5}, Ll/bgw0;->m()[B

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    move-object v6, p1

    .line 26
    check-cast v6, Ll/fer0;

    .line 27
    .line 28
    const/4 v7, 0x0

    .line 29
    const/4 v8, 0x4

    .line 30
    invoke-virtual {v6, v5, v7, v8, v7}, Ll/fer0;->c([BIIZ)Z

    .line 31
    .line 32
    .line 33
    iget-object v5, p0, Ll/alr0;->a:Ll/bgw0;

    .line 34
    .line 35
    invoke-virtual {v5}, Ll/bgw0;->J()J

    .line 36
    .line 37
    .line 38
    move-result-wide v9

    .line 39
    iput v8, p0, Ll/alr0;->b:I

    .line 40
    .line 41
    :goto_1
    const-wide/32 v11, 0x1a45dfa3

    .line 42
    .line 43
    .line 44
    cmp-long v5, v9, v11

    .line 45
    .line 46
    const/4 v8, 0x1

    .line 47
    if-eqz v5, :cond_3

    .line 48
    .line 49
    long-to-int v5, v3

    .line 50
    iget v11, p0, Ll/alr0;->b:I

    .line 51
    .line 52
    add-int/2addr v11, v8

    .line 53
    iput v11, p0, Ll/alr0;->b:I

    .line 54
    .line 55
    if-ne v11, v5, :cond_2

    .line 56
    .line 57
    return v7

    .line 58
    :cond_2
    iget-object v5, p0, Ll/alr0;->a:Ll/bgw0;

    .line 59
    .line 60
    invoke-virtual {v5}, Ll/bgw0;->m()[B

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-virtual {v6, v5, v7, v8, v7}, Ll/fer0;->c([BIIZ)Z

    .line 65
    .line 66
    .line 67
    const/16 v5, 0x8

    .line 68
    .line 69
    shl-long v8, v9, v5

    .line 70
    .line 71
    iget-object v5, p0, Ll/alr0;->a:Ll/bgw0;

    .line 72
    .line 73
    invoke-virtual {v5}, Ll/bgw0;->m()[B

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    aget-byte v5, v5, v7

    .line 78
    .line 79
    and-int/lit16 v5, v5, 0xff

    .line 80
    .line 81
    const-wide/16 v10, -0x100

    .line 82
    .line 83
    and-long/2addr v8, v10

    .line 84
    int-to-long v10, v5

    .line 85
    or-long v9, v8, v10

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    invoke-virtual {p0, p1}, Ll/alr0;->b(Ll/qer0;)J

    .line 89
    .line 90
    .line 91
    move-result-wide v3

    .line 92
    iget v5, p0, Ll/alr0;->b:I

    .line 93
    .line 94
    int-to-long v9, v5

    .line 95
    const-wide/high16 v11, -0x8000000000000000L

    .line 96
    .line 97
    cmp-long v5, v3, v11

    .line 98
    .line 99
    if-eqz v5, :cond_9

    .line 100
    .line 101
    add-long/2addr v9, v3

    .line 102
    if-nez v2, :cond_4

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_4
    cmp-long v0, v9, v0

    .line 106
    .line 107
    if-ltz v0, :cond_5

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_5
    :goto_2
    iget v0, p0, Ll/alr0;->b:I

    .line 111
    .line 112
    int-to-long v0, v0

    .line 113
    cmp-long v0, v0, v9

    .line 114
    .line 115
    if-gez v0, :cond_8

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Ll/alr0;->b(Ll/qer0;)J

    .line 118
    .line 119
    .line 120
    move-result-wide v0

    .line 121
    cmp-long v0, v0, v11

    .line 122
    .line 123
    if-nez v0, :cond_6

    .line 124
    .line 125
    return v7

    .line 126
    :cond_6
    invoke-virtual {p0, p1}, Ll/alr0;->b(Ll/qer0;)J

    .line 127
    .line 128
    .line 129
    move-result-wide v0

    .line 130
    const-wide/16 v2, 0x0

    .line 131
    .line 132
    cmp-long v2, v0, v2

    .line 133
    .line 134
    if-ltz v2, :cond_7

    .line 135
    .line 136
    if-eqz v2, :cond_5

    .line 137
    .line 138
    long-to-int v0, v0

    .line 139
    invoke-virtual {v6, v0, v7}, Ll/fer0;->j(IZ)Z

    .line 140
    .line 141
    .line 142
    iget v1, p0, Ll/alr0;->b:I

    .line 143
    .line 144
    add-int/2addr v1, v0

    .line 145
    iput v1, p0, Ll/alr0;->b:I

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_7
    return v7

    .line 149
    :cond_8
    if-nez v0, :cond_9

    .line 150
    .line 151
    return v8

    .line 152
    :cond_9
    :goto_3
    return v7
.end method

.method public final b(Ll/qer0;)J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/alr0;->a:Ll/bgw0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast p1, Ll/fer0;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-virtual {p1, v0, v1, v2, v1}, Ll/fer0;->c([BIIZ)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/alr0;->a:Ll/bgw0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    aget-byte v0, v0, v1

    .line 21
    .line 22
    and-int/lit16 v0, v0, 0xff

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/16 v3, 0x80

    .line 27
    .line 28
    move v4, v1

    .line 29
    :goto_0
    add-int/lit8 v5, v4, 0x1

    .line 30
    .line 31
    and-int v6, v0, v3

    .line 32
    .line 33
    if-nez v6, :cond_0

    .line 34
    .line 35
    shr-int/lit8 v3, v3, 0x1

    .line 36
    .line 37
    move v4, v5

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    not-int v3, v3

    .line 40
    and-int/2addr v0, v3

    .line 41
    iget-object v3, p0, Ll/alr0;->a:Ll/bgw0;

    .line 42
    .line 43
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {p1, v3, v2, v4, v1}, Ll/fer0;->c([BIIZ)Z

    .line 48
    .line 49
    .line 50
    :goto_1
    if-ge v1, v4, :cond_1

    .line 51
    .line 52
    shl-int/lit8 p1, v0, 0x8

    .line 53
    .line 54
    iget-object v0, p0, Ll/alr0;->a:Ll/bgw0;

    .line 55
    .line 56
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    aget-byte v0, v0, v1

    .line 63
    .line 64
    and-int/lit16 v0, v0, 0xff

    .line 65
    .line 66
    add-int/2addr v0, p1

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    iget p1, p0, Ll/alr0;->b:I

    .line 69
    .line 70
    add-int/2addr p1, v5

    .line 71
    iput p1, p0, Ll/alr0;->b:I

    .line 72
    .line 73
    int-to-long p0, v0

    .line 74
    return-wide p0

    .line 75
    :cond_2
    const-wide/high16 p0, -0x8000000000000000L

    .line 76
    .line 77
    return-wide p0
.end method
