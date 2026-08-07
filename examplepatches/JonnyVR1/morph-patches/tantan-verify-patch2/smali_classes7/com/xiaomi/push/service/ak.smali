.class public Lcom/xiaomi/push/service/ak;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 5
    .line 6
    return-void
.end method

.method private a(Ll/e2r0;)V
    .locals 3

    .line 232
    invoke-virtual {p1}, Ll/e2r0;->k()Ljava/lang/String;

    move-result-object p1

    .line 233
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 234
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 235
    invoke-static {}, Ll/xwq0;->a()Ll/xwq0;

    move-result-object v0

    invoke-static {}, Ll/v1r0;->a()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ll/xwq0;->a(Ljava/lang/String;Z)Ll/swq0;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 236
    array-length v1, p1

    if-lez v1, :cond_0

    .line 237
    invoke-virtual {v0, p1}, Ll/swq0;->o([Ljava/lang/String;)V

    .line 238
    iget-object p1, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    const/16 v0, 0x14

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/service/XMPushService;->a(ILjava/lang/Exception;)V

    .line 239
    iget-object p0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->a(Z)V

    :cond_0
    return-void
.end method

.method private b(Ll/g2r0;)V
    .locals 9

    .line 811
    invoke-virtual {p1}, Ll/g2r0;->o()Ljava/lang/String;

    move-result-object v0

    .line 812
    invoke-virtual {p1}, Ll/g2r0;->m()Ljava/lang/String;

    move-result-object v1

    .line 813
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 814
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 815
    iget-object v1, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    iget-object v2, v0, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    invoke-virtual {p1}, Ll/g2r0;->d()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/p2r0;->b(Ljava/lang/String;)I

    move-result p0

    int-to-long v3, p0

    const/4 v6, 0x1

    .line 816
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const/4 v5, 0x1

    .line 817
    invoke-static/range {v1 .. v8}, Ll/p2r0;->j(Landroid/content/Context;Ljava/lang/String;JZZJ)V

    :cond_0
    return-void
.end method

.method private c(Ll/w0r0;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Ll/w0r0;->F()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/w0r0;->a()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2, v1, v0}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v1, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 36
    .line 37
    iget-object v2, v0, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/w0r0;->x()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    int-to-long v3, p0

    .line 44
    const/4 v6, 0x1

    .line 45
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 46
    .line 47
    .line 48
    move-result-wide v7

    .line 49
    const/4 v5, 0x1

    .line 50
    invoke-static/range {v1 .. v8}, Ll/p2r0;->j(Landroid/content/Context;Ljava/lang/String;JZZJ)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ll/g2r0;)V
    .locals 10

    .line 1
    const-string v0, "5"

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/g2r0;->m()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/ak;->b(Ll/g2r0;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p1}, Ll/g2r0;->m()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    const-string v0, "1"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/g2r0;->p(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    move-object v2, v0

    .line 32
    const-string v0, "0"

    .line 33
    .line 34
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v1, "Received wrong packet with chid = 0 : "

    .line 43
    .line 44
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ll/g2r0;->d()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    instance-of v0, p1, Lcom/xiaomi/push/j;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    const-string v0, "kick"

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ll/g2r0;->f(Ljava/lang/String;)Ll/e2r0;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    if-eqz v0, :cond_6

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/g2r0;->o()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    const-string p1, "type"

    .line 78
    .line 79
    invoke-virtual {v0, p1}, Ll/e2r0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    const-string p1, "reason"

    .line 84
    .line 85
    invoke-virtual {v0, p1}, Ll/e2r0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    new-instance p1, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string v0, "kicked by server, chid="

    .line 92
    .line 93
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v0, " res="

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-static {v3}, Lcom/xiaomi/push/service/am$b;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v0, " type="

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v0, " reason="

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    const-string p1, "wait"

    .line 135
    .line 136
    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-eqz p1, :cond_3

    .line 141
    .line 142
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p1, v2, v3}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    if-eqz v4, :cond_5

    .line 151
    .line 152
    iget-object p0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 153
    .line 154
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/am$b;)V

    .line 155
    .line 156
    .line 157
    move-object v8, v5

    .line 158
    sget-object v5, Lcom/xiaomi/push/service/am$c;->a:Lcom/xiaomi/push/service/am$c;

    .line 159
    .line 160
    move-object v9, v6

    .line 161
    const/4 v6, 0x3

    .line 162
    const/4 v7, 0x0

    .line 163
    invoke-virtual/range {v4 .. v9}, Lcom/xiaomi/push/service/am$b;->a(Lcom/xiaomi/push/service/am$c;IILjava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_3
    move-object v8, v5

    .line 168
    move-object v9, v6

    .line 169
    iget-object v1, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 170
    .line 171
    const/4 v4, 0x3

    .line 172
    invoke-virtual/range {v1 .. v6}, Lcom/xiaomi/push/service/XMPushService;->a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-virtual {p0, v2, v3}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_4
    instance-of v0, p1, Ll/f2r0;

    .line 184
    .line 185
    if-eqz v0, :cond_6

    .line 186
    .line 187
    move-object v0, p1

    .line 188
    check-cast v0, Ll/f2r0;

    .line 189
    .line 190
    const-string v1, "redir"

    .line 191
    .line 192
    invoke-virtual {v0}, Ll/f2r0;->B()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    if-eqz v1, :cond_6

    .line 201
    .line 202
    const-string p1, "hosts"

    .line 203
    .line 204
    invoke-virtual {v0, p1}, Ll/g2r0;->f(Ljava/lang/String;)Ll/e2r0;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    if-eqz p1, :cond_5

    .line 209
    .line 210
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/ak;->a(Ll/e2r0;)V

    .line 211
    .line 212
    .line 213
    :cond_5
    return-void

    .line 214
    :cond_6
    iget-object v0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 215
    .line 216
    invoke-virtual {v0}, Lcom/xiaomi/push/service/XMPushService;->b()Lcom/xiaomi/push/service/h;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    iget-object p0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 221
    .line 222
    invoke-virtual {v0, p0, v2, p1}, Lcom/xiaomi/push/service/h;->a(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;Ll/g2r0;)V

    .line 223
    .line 224
    .line 225
    return-void
.end method

.method public a(Ll/w0r0;)V
    .locals 2

    const/4 v0, 0x5

    .line 226
    invoke-virtual {p1}, Ll/w0r0;->a()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 227
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/ak;->c(Ll/w0r0;)V

    .line 228
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/ak;->b(Ll/w0r0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "handle Blob chid = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ll/w0r0;->a()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " cmd = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ll/w0r0;->c()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " packetid = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    invoke-virtual {p1}, Ll/w0r0;->D()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " failure "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 231
    invoke-static {p1, p0}, Ll/ouq0;->o(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public b(Ll/w0r0;)V
    .locals 14

    .line 1
    invoke-virtual {p1}, Ll/w0r0;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/w0r0;->a()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    if-eqz v1, :cond_a

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/w0r0;->a()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    const-string v1, "SECMSG"

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/w0r0;->c()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/w0r0;->o()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/xiaomi/push/service/XMPushService;->b()Lcom/xiaomi/push/service/h;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 46
    .line 47
    invoke-virtual {v0, p0, v5, p1}, Lcom/xiaomi/push/service/h;->a(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;Ll/w0r0;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v0, "Recv SECMSG errCode = "

    .line 54
    .line 55
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ll/w0r0;->r()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v0, " errStr = "

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ll/w0r0;->z()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    const-string v1, "BIND"

    .line 86
    .line 87
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    const-string v4, " reason="

    .line 92
    .line 93
    const-string v6, "wait"

    .line 94
    .line 95
    if-eqz v1, :cond_8

    .line 96
    .line 97
    invoke-virtual {p1}, Ll/w0r0;->p()[B

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {v0}, Ll/izq0;->n([B)Ll/izq0;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p1}, Ll/w0r0;->F()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    invoke-virtual {v7, v5, v1}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;

    .line 114
    .line 115
    .line 116
    move-result-object v8

    .line 117
    if-nez v8, :cond_2

    .line 118
    .line 119
    goto/16 :goto_2

    .line 120
    .line 121
    :cond_2
    invoke-virtual {v0}, Ll/izq0;->o()Z

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    if-eqz v7, :cond_3

    .line 126
    .line 127
    new-instance p0, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    const-string v0, "SMACK: channel bind succeeded, chid="

    .line 130
    .line 131
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1}, Ll/w0r0;->a()I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    sget-object v9, Lcom/xiaomi/push/service/am$c;->c:Lcom/xiaomi/push/service/am$c;

    .line 149
    .line 150
    const/4 v12, 0x0

    .line 151
    const/4 v13, 0x0

    .line 152
    const/4 v10, 0x1

    .line 153
    const/4 v11, 0x0

    .line 154
    invoke-virtual/range {v8 .. v13}, Lcom/xiaomi/push/service/am$b;->a(Lcom/xiaomi/push/service/am$c;IILjava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_3
    invoke-virtual {v0}, Ll/izq0;->j()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v13

    .line 162
    const-string p1, "auth"

    .line 163
    .line 164
    invoke-virtual {p1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-eqz p1, :cond_5

    .line 169
    .line 170
    const-string p0, "invalid-sig"

    .line 171
    .line 172
    invoke-virtual {v0}, Ll/izq0;->p()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    if-eqz p0, :cond_4

    .line 181
    .line 182
    new-instance p0, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    const-string p1, "SMACK: bind error invalid-sig token = "

    .line 185
    .line 186
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    iget-object p1, v8, Lcom/xiaomi/push/service/am$b;->c:Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    const-string p1, " sec = "

    .line 195
    .line 196
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    iget-object p1, v8, Lcom/xiaomi/push/service/am$b;->h:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    sget-object p0, Lcom/xiaomi/push/ei;->T:Lcom/xiaomi/push/ei;

    .line 212
    .line 213
    invoke-virtual {p0}, Lcom/xiaomi/push/ei;->a()I

    .line 214
    .line 215
    .line 216
    move-result p0

    .line 217
    const/4 p1, 0x1

    .line 218
    invoke-static {v3, p0, p1, v2, v3}, Lcom/xiaomi/push/i;->d(IIILjava/lang/String;I)V

    .line 219
    .line 220
    .line 221
    :cond_4
    sget-object v9, Lcom/xiaomi/push/service/am$c;->a:Lcom/xiaomi/push/service/am$c;

    .line 222
    .line 223
    const/4 v11, 0x5

    .line 224
    invoke-virtual {v0}, Ll/izq0;->p()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v12

    .line 228
    const/4 v10, 0x1

    .line 229
    invoke-virtual/range {v8 .. v13}, Lcom/xiaomi/push/service/am$b;->a(Lcom/xiaomi/push/service/am$c;IILjava/lang/String;Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    invoke-virtual {p0, v5, v1}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    goto :goto_0

    .line 240
    :cond_5
    const-string p1, "cancel"

    .line 241
    .line 242
    invoke-virtual {p1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result p1

    .line 246
    if-eqz p1, :cond_6

    .line 247
    .line 248
    sget-object v9, Lcom/xiaomi/push/service/am$c;->a:Lcom/xiaomi/push/service/am$c;

    .line 249
    .line 250
    const/4 v11, 0x7

    .line 251
    invoke-virtual {v0}, Ll/izq0;->p()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v12

    .line 255
    const/4 v10, 0x1

    .line 256
    invoke-virtual/range {v8 .. v13}, Lcom/xiaomi/push/service/am$b;->a(Lcom/xiaomi/push/service/am$c;IILjava/lang/String;Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    invoke-virtual {p0, v5, v1}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    goto :goto_0

    .line 267
    :cond_6
    invoke-virtual {v6, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    if-eqz p1, :cond_7

    .line 272
    .line 273
    iget-object p0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 274
    .line 275
    invoke-virtual {p0, v8}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/am$b;)V

    .line 276
    .line 277
    .line 278
    sget-object v9, Lcom/xiaomi/push/service/am$c;->a:Lcom/xiaomi/push/service/am$c;

    .line 279
    .line 280
    const/4 v11, 0x7

    .line 281
    invoke-virtual {v0}, Ll/izq0;->p()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v12

    .line 285
    const/4 v10, 0x1

    .line 286
    invoke-virtual/range {v8 .. v13}, Lcom/xiaomi/push/service/am$b;->a(Lcom/xiaomi/push/service/am$c;IILjava/lang/String;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    :cond_7
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 290
    .line 291
    const-string p1, "SMACK: channel bind failed, chid="

    .line 292
    .line 293
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v0}, Ll/izq0;->p()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    return-void

    .line 317
    :cond_8
    const-string v1, "KICK"

    .line 318
    .line 319
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    if-eqz v0, :cond_13

    .line 324
    .line 325
    invoke-virtual {p1}, Ll/w0r0;->p()[B

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    invoke-static {v0}, Ll/lzq0;->m([B)Ll/lzq0;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    move-object v1, v6

    .line 334
    invoke-virtual {p1}, Ll/w0r0;->F()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v6

    .line 338
    invoke-virtual {v0}, Ll/lzq0;->j()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v9

    .line 342
    invoke-virtual {v0}, Ll/lzq0;->o()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v8

    .line 346
    new-instance p1, Ljava/lang/StringBuilder;

    .line 347
    .line 348
    const-string v0, "kicked by server, chid="

    .line 349
    .line 350
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    const-string v0, " res= "

    .line 357
    .line 358
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    invoke-static {v6}, Lcom/xiaomi/push/service/am$b;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v0

    .line 365
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    const-string v0, " type="

    .line 369
    .line 370
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {p1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 374
    .line 375
    .line 376
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object p1

    .line 386
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 387
    .line 388
    .line 389
    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result p1

    .line 393
    if-eqz p1, :cond_9

    .line 394
    .line 395
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 396
    .line 397
    .line 398
    move-result-object p1

    .line 399
    invoke-virtual {p1, v5, v6}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;

    .line 400
    .line 401
    .line 402
    move-result-object v6

    .line 403
    if-eqz v6, :cond_13

    .line 404
    .line 405
    iget-object p0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 406
    .line 407
    invoke-virtual {p0, v6}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/am$b;)V

    .line 408
    .line 409
    .line 410
    sget-object v7, Lcom/xiaomi/push/service/am$c;->a:Lcom/xiaomi/push/service/am$c;

    .line 411
    .line 412
    move-object v10, v8

    .line 413
    const/4 v8, 0x3

    .line 414
    move-object v11, v9

    .line 415
    const/4 v9, 0x0

    .line 416
    invoke-virtual/range {v6 .. v11}, Lcom/xiaomi/push/service/am$b;->a(Lcom/xiaomi/push/service/am$c;IILjava/lang/String;Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    return-void

    .line 420
    :cond_9
    move-object v10, v8

    .line 421
    move-object v11, v9

    .line 422
    iget-object v4, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 423
    .line 424
    const/4 v7, 0x3

    .line 425
    invoke-virtual/range {v4 .. v9}, Lcom/xiaomi/push/service/XMPushService;->a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 426
    .line 427
    .line 428
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 429
    .line 430
    .line 431
    move-result-object p0

    .line 432
    invoke-virtual {p0, v5, v6}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    .line 434
    .line 435
    return-void

    .line 436
    :cond_a
    const-string v1, "PING"

    .line 437
    .line 438
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 439
    .line 440
    .line 441
    move-result v1

    .line 442
    if-eqz v1, :cond_e

    .line 443
    .line 444
    invoke-virtual {p1}, Ll/w0r0;->p()[B

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    if-eqz v0, :cond_b

    .line 449
    .line 450
    array-length v1, v0

    .line 451
    if-lez v1, :cond_b

    .line 452
    .line 453
    invoke-static {v0}, Ll/ozq0;->o([B)Ll/ozq0;

    .line 454
    .line 455
    .line 456
    move-result-object v0

    .line 457
    invoke-virtual {v0}, Ll/ozq0;->q()Z

    .line 458
    .line 459
    .line 460
    move-result v1

    .line 461
    if-eqz v1, :cond_b

    .line 462
    .line 463
    invoke-static {}, Lcom/xiaomi/push/service/ax;->a()Lcom/xiaomi/push/service/ax;

    .line 464
    .line 465
    .line 466
    move-result-object v1

    .line 467
    invoke-virtual {v0}, Ll/ozq0;->k()Ll/gzq0;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    invoke-virtual {v1, v0}, Lcom/xiaomi/push/service/ax;->a(Ll/gzq0;)V

    .line 472
    .line 473
    .line 474
    :cond_b
    iget-object v0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 475
    .line 476
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v0

    .line 480
    const-string v1, "com.xiaomi.xmsf"

    .line 481
    .line 482
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 483
    .line 484
    .line 485
    move-result v0

    .line 486
    if-nez v0, :cond_c

    .line 487
    .line 488
    iget-object v0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 489
    .line 490
    invoke-virtual {v0}, Lcom/xiaomi/push/service/XMPushService;->a()V

    .line 491
    .line 492
    .line 493
    :cond_c
    const-string v0, "1"

    .line 494
    .line 495
    invoke-virtual {p1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    move-result-object p1

    .line 499
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 500
    .line 501
    .line 502
    move-result p1

    .line 503
    if-eqz p1, :cond_d

    .line 504
    .line 505
    const-string p1, "received a server ping"

    .line 506
    .line 507
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 508
    .line 509
    .line 510
    goto :goto_1

    .line 511
    :cond_d
    invoke-static {}, Lcom/xiaomi/push/i;->j()V

    .line 512
    .line 513
    .line 514
    :goto_1
    iget-object p0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 515
    .line 516
    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->b()V

    .line 517
    .line 518
    .line 519
    return-void

    .line 520
    :cond_e
    const-string v1, "SYNC"

    .line 521
    .line 522
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 523
    .line 524
    .line 525
    move-result v0

    .line 526
    if-eqz v0, :cond_12

    .line 527
    .line 528
    const-string v0, "CONF"

    .line 529
    .line 530
    invoke-virtual {p1}, Ll/w0r0;->t()Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object v1

    .line 534
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 535
    .line 536
    .line 537
    move-result v0

    .line 538
    if-eqz v0, :cond_f

    .line 539
    .line 540
    invoke-virtual {p1}, Ll/w0r0;->p()[B

    .line 541
    .line 542
    .line 543
    move-result-object p0

    .line 544
    invoke-static {p0}, Ll/gzq0;->m([B)Ll/gzq0;

    .line 545
    .line 546
    .line 547
    move-result-object p0

    .line 548
    invoke-static {}, Lcom/xiaomi/push/service/ax;->a()Lcom/xiaomi/push/service/ax;

    .line 549
    .line 550
    .line 551
    move-result-object p1

    .line 552
    invoke-virtual {p1, p0}, Lcom/xiaomi/push/service/ax;->a(Ll/gzq0;)V

    .line 553
    .line 554
    .line 555
    return-void

    .line 556
    :cond_f
    const-string v0, "U"

    .line 557
    .line 558
    invoke-virtual {p1}, Ll/w0r0;->t()Ljava/lang/String;

    .line 559
    .line 560
    .line 561
    move-result-object v1

    .line 562
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 563
    .line 564
    .line 565
    move-result v0

    .line 566
    if-eqz v0, :cond_10

    .line 567
    .line 568
    invoke-virtual {p1}, Ll/w0r0;->p()[B

    .line 569
    .line 570
    .line 571
    move-result-object v0

    .line 572
    invoke-static {v0}, Ll/pzq0;->q([B)Ll/pzq0;

    .line 573
    .line 574
    .line 575
    move-result-object v0

    .line 576
    iget-object v1, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 577
    .line 578
    invoke-static {v1}, Ll/eyq0;->c(Landroid/content/Context;)Ll/eyq0;

    .line 579
    .line 580
    .line 581
    move-result-object v4

    .line 582
    invoke-virtual {v0}, Ll/pzq0;->k()Ljava/lang/String;

    .line 583
    .line 584
    .line 585
    move-result-object v5

    .line 586
    invoke-virtual {v0}, Ll/pzq0;->t()Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v6

    .line 590
    new-instance v7, Ljava/util/Date;

    .line 591
    .line 592
    invoke-virtual {v0}, Ll/pzq0;->j()J

    .line 593
    .line 594
    .line 595
    move-result-wide v1

    .line 596
    invoke-direct {v7, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 597
    .line 598
    .line 599
    new-instance v8, Ljava/util/Date;

    .line 600
    .line 601
    invoke-virtual {v0}, Ll/pzq0;->s()J

    .line 602
    .line 603
    .line 604
    move-result-wide v1

    .line 605
    invoke-direct {v8, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 606
    .line 607
    .line 608
    invoke-virtual {v0}, Ll/pzq0;->x()I

    .line 609
    .line 610
    .line 611
    move-result v1

    .line 612
    mul-int/lit16 v9, v1, 0x400

    .line 613
    .line 614
    invoke-virtual {v0}, Ll/pzq0;->A()Z

    .line 615
    .line 616
    .line 617
    move-result v10

    .line 618
    invoke-virtual/range {v4 .. v10}, Ll/eyq0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;IZ)V

    .line 619
    .line 620
    .line 621
    new-instance v0, Ll/w0r0;

    .line 622
    .line 623
    invoke-direct {v0}, Ll/w0r0;-><init>()V

    .line 624
    .line 625
    .line 626
    invoke-virtual {v0, v3}, Ll/w0r0;->h(I)V

    .line 627
    .line 628
    .line 629
    invoke-virtual {p1}, Ll/w0r0;->c()Ljava/lang/String;

    .line 630
    .line 631
    .line 632
    move-result-object v1

    .line 633
    const-string v2, "UCA"

    .line 634
    .line 635
    invoke-virtual {v0, v1, v2}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 636
    .line 637
    .line 638
    invoke-virtual {p1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 639
    .line 640
    .line 641
    move-result-object p1

    .line 642
    invoke-virtual {v0, p1}, Ll/w0r0;->k(Ljava/lang/String;)V

    .line 643
    .line 644
    .line 645
    iget-object p0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 646
    .line 647
    new-instance p1, Lcom/xiaomi/push/service/aw;

    .line 648
    .line 649
    invoke-direct {p1, p0, v0}, Lcom/xiaomi/push/service/aw;-><init>(Lcom/xiaomi/push/service/XMPushService;Ll/w0r0;)V

    .line 650
    .line 651
    .line 652
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    .line 653
    .line 654
    .line 655
    return-void

    .line 656
    :cond_10
    const-string v0, "P"

    .line 657
    .line 658
    invoke-virtual {p1}, Ll/w0r0;->t()Ljava/lang/String;

    .line 659
    .line 660
    .line 661
    move-result-object v1

    .line 662
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 663
    .line 664
    .line 665
    move-result v0

    .line 666
    if-eqz v0, :cond_13

    .line 667
    .line 668
    invoke-virtual {p1}, Ll/w0r0;->p()[B

    .line 669
    .line 670
    .line 671
    move-result-object v0

    .line 672
    invoke-static {v0}, Ll/nzq0;->m([B)Ll/nzq0;

    .line 673
    .line 674
    .line 675
    move-result-object v0

    .line 676
    new-instance v1, Ll/w0r0;

    .line 677
    .line 678
    invoke-direct {v1}, Ll/w0r0;-><init>()V

    .line 679
    .line 680
    .line 681
    invoke-virtual {v1, v3}, Ll/w0r0;->h(I)V

    .line 682
    .line 683
    .line 684
    invoke-virtual {p1}, Ll/w0r0;->c()Ljava/lang/String;

    .line 685
    .line 686
    .line 687
    move-result-object v3

    .line 688
    const-string v4, "PCA"

    .line 689
    .line 690
    invoke-virtual {v1, v3, v4}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 691
    .line 692
    .line 693
    invoke-virtual {p1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 694
    .line 695
    .line 696
    move-result-object v3

    .line 697
    invoke-virtual {v1, v3}, Ll/w0r0;->k(Ljava/lang/String;)V

    .line 698
    .line 699
    .line 700
    new-instance v3, Ll/nzq0;

    .line 701
    .line 702
    invoke-direct {v3}, Ll/nzq0;-><init>()V

    .line 703
    .line 704
    .line 705
    invoke-virtual {v0}, Ll/nzq0;->n()Z

    .line 706
    .line 707
    .line 708
    move-result v4

    .line 709
    if-eqz v4, :cond_11

    .line 710
    .line 711
    invoke-virtual {v0}, Ll/nzq0;->j()Ll/asq0;

    .line 712
    .line 713
    .line 714
    move-result-object v0

    .line 715
    invoke-virtual {v3, v0}, Ll/nzq0;->k(Ll/asq0;)Ll/nzq0;

    .line 716
    .line 717
    .line 718
    :cond_11
    invoke-virtual {v3}, Ll/e0r0;->h()[B

    .line 719
    .line 720
    .line 721
    move-result-object v0

    .line 722
    invoke-virtual {v1, v0, v2}, Ll/w0r0;->n([BLjava/lang/String;)V

    .line 723
    .line 724
    .line 725
    iget-object p0, p0, Lcom/xiaomi/push/service/ak;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 726
    .line 727
    new-instance v0, Lcom/xiaomi/push/service/aw;

    .line 728
    .line 729
    invoke-direct {v0, p0, v1}, Lcom/xiaomi/push/service/aw;-><init>(Lcom/xiaomi/push/service/XMPushService;Ll/w0r0;)V

    .line 730
    .line 731
    .line 732
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    .line 733
    .line 734
    .line 735
    new-instance p0, Ljava/lang/StringBuilder;

    .line 736
    .line 737
    const-string v0, "ACK msgP: id = "

    .line 738
    .line 739
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 740
    .line 741
    .line 742
    invoke-virtual {p1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 743
    .line 744
    .line 745
    move-result-object p1

    .line 746
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 747
    .line 748
    .line 749
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 750
    .line 751
    .line 752
    move-result-object p0

    .line 753
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 754
    .line 755
    .line 756
    return-void

    .line 757
    :cond_12
    const-string p0, "NOTIFY"

    .line 758
    .line 759
    invoke-virtual {p1}, Ll/w0r0;->c()Ljava/lang/String;

    .line 760
    .line 761
    .line 762
    move-result-object v0

    .line 763
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 764
    .line 765
    .line 766
    move-result p0

    .line 767
    if-eqz p0, :cond_13

    .line 768
    .line 769
    invoke-virtual {p1}, Ll/w0r0;->p()[B

    .line 770
    .line 771
    .line 772
    move-result-object p0

    .line 773
    invoke-static {p0}, Ll/mzq0;->n([B)Ll/mzq0;

    .line 774
    .line 775
    .line 776
    move-result-object p0

    .line 777
    new-instance p1, Ljava/lang/StringBuilder;

    .line 778
    .line 779
    const-string v0, "notify by server err = "

    .line 780
    .line 781
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 782
    .line 783
    .line 784
    invoke-virtual {p0}, Ll/mzq0;->q()I

    .line 785
    .line 786
    .line 787
    move-result v0

    .line 788
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 789
    .line 790
    .line 791
    const-string v0, " desc = "

    .line 792
    .line 793
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 794
    .line 795
    .line 796
    invoke-virtual {p0}, Ll/mzq0;->j()Ljava/lang/String;

    .line 797
    .line 798
    .line 799
    move-result-object p0

    .line 800
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 801
    .line 802
    .line 803
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 804
    .line 805
    .line 806
    move-result-object p0

    .line 807
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 808
    .line 809
    .line 810
    :cond_13
    :goto_2
    return-void
.end method
