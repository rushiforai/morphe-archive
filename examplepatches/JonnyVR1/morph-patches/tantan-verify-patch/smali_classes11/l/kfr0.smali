.class public final Ll/kfr0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ll/bgw0;I)I
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, -0x1

    .line 5
    return p0

    .line 6
    :pswitch_0
    add-int/lit8 p1, p1, -0x8

    .line 7
    .line 8
    const/16 p0, 0x100

    .line 9
    .line 10
    shl-int/2addr p0, p1

    .line 11
    return p0

    .line 12
    :pswitch_1
    invoke-virtual {p0}, Ll/bgw0;->F()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    add-int/lit8 p0, p0, 0x1

    .line 17
    .line 18
    return p0

    .line 19
    :pswitch_2
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    add-int/lit8 p0, p0, 0x1

    .line 24
    .line 25
    return p0

    .line 26
    :pswitch_3
    add-int/lit8 p1, p1, -0x2

    .line 27
    .line 28
    const/16 p0, 0x240

    .line 29
    .line 30
    shl-int/2addr p0, p1

    .line 31
    return p0

    .line 32
    :pswitch_4
    const/16 p0, 0xc0

    .line 33
    .line 34
    return p0

    .line 35
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static b(Ll/qer0;Ll/ofr0;)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ll/qer0;->zzj()V

    .line 2
    .line 3
    .line 4
    move-object v0, p0

    .line 5
    check-cast v0, Ll/fer0;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v0, v1, v2}, Ll/fer0;->j(IZ)Z

    .line 10
    .line 11
    .line 12
    new-array v3, v1, [B

    .line 13
    .line 14
    invoke-virtual {v0, v3, v2, v1, v2}, Ll/fer0;->c([BIIZ)Z

    .line 15
    .line 16
    .line 17
    aget-byte v3, v3, v2

    .line 18
    .line 19
    and-int/2addr v3, v1

    .line 20
    if-eq v1, v3, :cond_0

    .line 21
    .line 22
    move v4, v2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v4, v1

    .line 25
    :goto_0
    const/4 v5, 0x2

    .line 26
    invoke-virtual {v0, v5, v2}, Ll/fer0;->j(IZ)Z

    .line 27
    .line 28
    .line 29
    if-eq v1, v3, :cond_1

    .line 30
    .line 31
    const/4 v0, 0x6

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const/4 v0, 0x7

    .line 34
    :goto_1
    new-instance v1, Ll/bgw0;

    .line 35
    .line 36
    invoke-direct {v1, v0}, Ll/bgw0;-><init>(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-static {p0, v3, v2, v0}, Ll/ter0;->a(Ll/qer0;[BII)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-virtual {v1, v0}, Ll/bgw0;->j(I)V

    .line 48
    .line 49
    .line 50
    invoke-interface {p0}, Ll/qer0;->zzj()V

    .line 51
    .line 52
    .line 53
    new-instance p0, Ll/jfr0;

    .line 54
    .line 55
    invoke-direct {p0}, Ll/jfr0;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, p1, v4, p0}, Ll/kfr0;->d(Ll/bgw0;Ll/ofr0;ZLl/jfr0;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iget-wide p0, p0, Ll/jfr0;->a:J

    .line 65
    .line 66
    return-wide p0

    .line 67
    :cond_2
    const/4 p0, 0x0

    .line 68
    invoke-static {p0, p0}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    throw p0
.end method

.method public static c(Ll/bgw0;Ll/ofr0;ILl/jfr0;)Z
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bgw0;->s()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {v0}, Ll/bgw0;->J()J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    const/16 v5, 0x10

    .line 14
    .line 15
    ushr-long v5, v3, v5

    .line 16
    .line 17
    move/from16 v7, p2

    .line 18
    .line 19
    int-to-long v7, v7

    .line 20
    cmp-long v7, v5, v7

    .line 21
    .line 22
    const/4 v8, 0x0

    .line 23
    if-eqz v7, :cond_0

    .line 24
    .line 25
    return v8

    .line 26
    :cond_0
    const-wide/16 v9, 0x1

    .line 27
    .line 28
    and-long/2addr v5, v9

    .line 29
    cmp-long v5, v5, v9

    .line 30
    .line 31
    const/4 v6, 0x1

    .line 32
    if-nez v5, :cond_1

    .line 33
    .line 34
    move v5, v6

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v5, v8

    .line 37
    :goto_0
    const/16 v7, 0xc

    .line 38
    .line 39
    shr-long v11, v3, v7

    .line 40
    .line 41
    const/16 v13, 0x8

    .line 42
    .line 43
    shr-long v13, v3, v13

    .line 44
    .line 45
    const/4 v15, 0x4

    .line 46
    shr-long v15, v3, v15

    .line 47
    .line 48
    shr-long v17, v3, v6

    .line 49
    .line 50
    and-long/2addr v3, v9

    .line 51
    const-wide/16 v19, 0xf

    .line 52
    .line 53
    move-wide/from16 v21, v9

    .line 54
    .line 55
    and-long v9, v15, v19

    .line 56
    .line 57
    long-to-int v9, v9

    .line 58
    const/4 v10, 0x7

    .line 59
    const/4 v15, -0x1

    .line 60
    if-gt v9, v10, :cond_2

    .line 61
    .line 62
    iget v10, v1, Ll/ofr0;->g:I

    .line 63
    .line 64
    add-int/2addr v10, v15

    .line 65
    if-ne v9, v10, :cond_9

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    const/16 v10, 0xa

    .line 69
    .line 70
    if-gt v9, v10, :cond_9

    .line 71
    .line 72
    iget v9, v1, Ll/ofr0;->g:I

    .line 73
    .line 74
    const/4 v10, 0x2

    .line 75
    if-ne v9, v10, :cond_9

    .line 76
    .line 77
    :goto_1
    const-wide/16 v9, 0x7

    .line 78
    .line 79
    and-long v9, v17, v9

    .line 80
    .line 81
    long-to-int v9, v9

    .line 82
    if-nez v9, :cond_3

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    iget v10, v1, Ll/ofr0;->i:I

    .line 86
    .line 87
    if-ne v9, v10, :cond_9

    .line 88
    .line 89
    :goto_2
    cmp-long v3, v3, v21

    .line 90
    .line 91
    if-eqz v3, :cond_9

    .line 92
    .line 93
    move-object/from16 v3, p3

    .line 94
    .line 95
    invoke-static {v0, v1, v5, v3}, Ll/kfr0;->d(Ll/bgw0;Ll/ofr0;ZLl/jfr0;)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_9

    .line 100
    .line 101
    and-long v3, v11, v19

    .line 102
    .line 103
    long-to-int v3, v3

    .line 104
    invoke-static {v0, v3}, Ll/kfr0;->a(Ll/bgw0;I)I

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eq v3, v15, :cond_9

    .line 109
    .line 110
    iget v4, v1, Ll/ofr0;->b:I

    .line 111
    .line 112
    if-gt v3, v4, :cond_9

    .line 113
    .line 114
    and-long v3, v13, v19

    .line 115
    .line 116
    iget v5, v1, Ll/ofr0;->e:I

    .line 117
    .line 118
    long-to-int v3, v3

    .line 119
    if-nez v3, :cond_4

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_4
    const/16 v4, 0xb

    .line 123
    .line 124
    if-gt v3, v4, :cond_5

    .line 125
    .line 126
    iget v1, v1, Ll/ofr0;->f:I

    .line 127
    .line 128
    if-eq v3, v1, :cond_8

    .line 129
    .line 130
    goto :goto_4

    .line 131
    :cond_5
    if-ne v3, v7, :cond_6

    .line 132
    .line 133
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    mul-int/lit16 v1, v1, 0x3e8

    .line 138
    .line 139
    if-ne v1, v5, :cond_9

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_6
    const/16 v1, 0xe

    .line 143
    .line 144
    if-gt v3, v1, :cond_9

    .line 145
    .line 146
    invoke-virtual {v0}, Ll/bgw0;->F()I

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    if-ne v3, v1, :cond_7

    .line 151
    .line 152
    mul-int/lit8 v4, v4, 0xa

    .line 153
    .line 154
    :cond_7
    if-ne v4, v5, :cond_9

    .line 155
    .line 156
    :cond_8
    :goto_3
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    invoke-virtual {v0}, Ll/bgw0;->s()I

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    add-int/2addr v3, v15

    .line 169
    invoke-static {v0, v2, v3, v8}, Ll/mpw0;->t([BIII)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-ne v1, v0, :cond_9

    .line 174
    .line 175
    return v6

    .line 176
    :cond_9
    :goto_4
    return v8
.end method

.method public static d(Ll/bgw0;Ll/ofr0;ZLl/jfr0;)Z
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ll/bgw0;->L()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget p0, p1, Ll/ofr0;->b:I

    .line 9
    .line 10
    int-to-long p0, p0

    .line 11
    mul-long/2addr v0, p0

    .line 12
    :goto_0
    iput-wide v0, p3, Ll/jfr0;->a:J

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :catch_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method
