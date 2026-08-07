.class public Ll/jxq0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Landroid/content/Context;I)I
    .locals 1

    .line 1
    invoke-static {p0}, Ll/p2r0;->a(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, -0x1

    .line 6
    if-ne v0, p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    if-nez p0, :cond_1

    .line 10
    .line 11
    const/16 p0, 0xd

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/16 p0, 0xb

    .line 15
    .line 16
    :goto_0
    mul-int/2addr p1, p0

    .line 17
    div-int/lit8 p1, p1, 0xa

    .line 18
    .line 19
    return p1
.end method

.method public static b(Lcom/xiaomi/push/gf;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/gf;->a()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ll/szq0;->a(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static c(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)I
    .locals 2

    .line 1
    sget-object v0, Ll/jxq0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    return v1

    .line 14
    :pswitch_0
    invoke-virtual {p1}, Lcom/xiaomi/push/gf;->a()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-static {p1}, Ll/szq0;->a(I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    :try_start_0
    instance-of v0, p0, Lcom/xiaomi/push/ha;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    check-cast p0, Lcom/xiaomi/push/ha;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/xiaomi/push/ha;->b()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    invoke-static {p0}, Lcom/xiaomi/push/ed;->a(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eq v0, v1, :cond_1

    .line 45
    .line 46
    invoke-static {p0}, Lcom/xiaomi/push/ed;->a(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_0
    instance-of v0, p0, Lcom/xiaomi/push/gz;

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    check-cast p0, Lcom/xiaomi/push/gz;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/xiaomi/push/gz;->a()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_1

    .line 66
    .line 67
    invoke-static {p0}, Lcom/xiaomi/push/ed;->a(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eq v0, v1, :cond_1

    .line 72
    .line 73
    invoke-static {p0}, Lcom/xiaomi/push/ed;->a(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    return p0

    .line 78
    :catch_0
    const-string p0, "PERF_ERROR : parse Command type error"

    .line 79
    .line 80
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    return p1

    .line 85
    :pswitch_1
    invoke-virtual {p1}, Lcom/xiaomi/push/gf;->a()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-static {p1}, Ll/szq0;->a(I)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p0, :cond_5

    .line 94
    .line 95
    :try_start_1
    instance-of v0, p0, Lcom/xiaomi/push/gw;

    .line 96
    .line 97
    if-eqz v0, :cond_2

    .line 98
    .line 99
    check-cast p0, Lcom/xiaomi/push/gw;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/xiaomi/push/gw;->d:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_5

    .line 108
    .line 109
    invoke-static {p0}, Ll/szq0;->d(Ljava/lang/String;)Lcom/xiaomi/push/gp;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0}, Ll/szq0;->b(Ljava/lang/Enum;)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eq v0, v1, :cond_5

    .line 118
    .line 119
    invoke-static {p0}, Ll/szq0;->d(Ljava/lang/String;)Lcom/xiaomi/push/gp;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0}, Ll/szq0;->b(Ljava/lang/Enum;)I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    return p0

    .line 128
    :cond_2
    instance-of v0, p0, Lcom/xiaomi/push/he;

    .line 129
    .line 130
    if-eqz v0, :cond_5

    .line 131
    .line 132
    check-cast p0, Lcom/xiaomi/push/he;

    .line 133
    .line 134
    iget-object p0, p0, Lcom/xiaomi/push/he;->d:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-nez v0, :cond_5

    .line 141
    .line 142
    invoke-static {p0}, Ll/szq0;->d(Ljava/lang/String;)Lcom/xiaomi/push/gp;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-static {v0}, Ll/szq0;->b(Ljava/lang/Enum;)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eq v0, v1, :cond_3

    .line 151
    .line 152
    invoke-static {p0}, Ll/szq0;->d(Ljava/lang/String;)Lcom/xiaomi/push/gp;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-static {v0}, Ll/szq0;->b(Ljava/lang/Enum;)I

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    :cond_3
    sget-object v0, Lcom/xiaomi/push/gp;->B:Lcom/xiaomi/push/gp;

    .line 161
    .line 162
    invoke-static {p0}, Ll/szq0;->d(Ljava/lang/String;)Lcom/xiaomi/push/gp;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 170
    if-eqz p0, :cond_4

    .line 171
    .line 172
    return v1

    .line 173
    :cond_4
    return p1

    .line 174
    :catch_1
    const-string p0, "PERF_ERROR : parse Notification type error"

    .line 175
    .line 176
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    :cond_5
    :goto_0
    return p1

    .line 180
    :pswitch_2
    invoke-virtual {p1}, Lcom/xiaomi/push/gf;->a()I

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    invoke-static {p0}, Ll/szq0;->a(I)I

    .line 185
    .line 186
    .line 187
    move-result p0

    .line 188
    return p0

    .line 189
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static d(Ljava/lang/String;Landroid/content/Context;II)V
    .locals 7

    .line 1
    if-lez p2, :cond_0

    .line 2
    .line 3
    if-lez p3, :cond_0

    .line 4
    .line 5
    invoke-static {p1, p3}, Ll/jxq0;->a(Landroid/content/Context;I)I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    sget-object v0, Lcom/xiaomi/push/gp;->B:Lcom/xiaomi/push/gp;

    .line 10
    .line 11
    invoke-static {v0}, Ll/szq0;->b(Ljava/lang/Enum;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eq p2, v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Ll/tzq0;->a(Landroid/content/Context;)Ll/tzq0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-wide/16 v3, 0x1

    .line 26
    .line 27
    int-to-long v5, p3

    .line 28
    move-object v1, p0

    .line 29
    move v2, p2

    .line 30
    invoke-virtual/range {v0 .. v6}, Ll/tzq0;->b(Ljava/lang/String;IJJ)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Landroid/content/Context;Lcom/xiaomi/push/hb;I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    invoke-virtual {p2}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    invoke-static {v0}, Ll/jxq0;->b(Lcom/xiaomi/push/gf;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-gtz p3, :cond_2

    .line 17
    .line 18
    invoke-static {p2}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    array-length p2, p2

    .line 25
    :goto_0
    move p3, p2

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    const/4 p2, 0x0

    .line 28
    goto :goto_0

    .line 29
    :cond_2
    :goto_1
    invoke-static {p0, p1, v0, p3}, Ll/jxq0;->d(Ljava/lang/String;Landroid/content/Context;II)V

    .line 30
    .line 31
    .line 32
    :cond_3
    :goto_2
    return-void
.end method

.method public static f(Ljava/lang/String;Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;I)V
    .locals 0

    .line 1
    invoke-static {p2, p3}, Ll/jxq0;->c(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-static {p0, p1, p2, p4}, Ll/jxq0;->d(Ljava/lang/String;Landroid/content/Context;II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static g(Ljava/lang/String;Landroid/content/Context;[B)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    array-length v0, p2

    .line 6
    if-gtz v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    new-instance v0, Lcom/xiaomi/push/hb;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/xiaomi/push/hb;-><init>()V

    .line 12
    .line 13
    .line 14
    :try_start_0
    invoke-static {v0, p2}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V

    .line 15
    .line 16
    .line 17
    array-length p2, p2

    .line 18
    invoke-static {p0, p1, v0, p2}, Ll/jxq0;->e(Ljava/lang/String;Landroid/content/Context;Lcom/xiaomi/push/hb;I)V
    :try_end_0
    .catch Lcom/xiaomi/push/hu; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    const-string p0, "fail to convert bytes to container"

    .line 23
    .line 24
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method
