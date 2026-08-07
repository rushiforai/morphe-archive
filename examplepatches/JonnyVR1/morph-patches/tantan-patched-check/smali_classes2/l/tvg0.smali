.class public final Ll/tvg0;
.super Ll/uxg0;
.source "SourceFile"


# instance fields
.field public final a:Ll/nxg0;

.field public final b:Ll/zyg0;


# direct methods
.method public constructor <init>(Ll/nxg0;Ll/zyg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/uxg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tvg0;->a:Ll/nxg0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/tvg0;->b:Ll/zyg0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public final b(Ll/lxg0;I)Ll/aig0;
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eqz p2, :cond_3

    .line 3
    .line 4
    and-int/lit8 v1, p2, 0x4

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    sget-object p2, Ll/yx3;->o:Ll/yx3;

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    new-instance v1, Ll/yx3$a;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/yx3$a;-><init>()V

    .line 14
    .line 15
    .line 16
    and-int/lit8 v2, p2, 0x1

    .line 17
    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {v1}, Ll/yx3$a;->c()Ll/yx3$a;

    .line 22
    .line 23
    .line 24
    :goto_0
    and-int/2addr p2, v0

    .line 25
    if-nez p2, :cond_2

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    invoke-virtual {v1}, Ll/yx3$a;->d()Ll/yx3$a;

    .line 29
    .line 30
    .line 31
    :goto_1
    invoke-virtual {v1}, Ll/yx3$a;->a()Ll/yx3;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    goto :goto_2

    .line 36
    :cond_3
    const/4 p2, 0x0

    .line 37
    :goto_2
    new-instance v1, Ll/x1d0$a;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/x1d0$a;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v2}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v2}, Ll/lwg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    const-string v3, "Referer"

    .line 59
    .line 60
    invoke-virtual {v1, v3, v2}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {}, Ll/pqg0;->a()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-static {v2}, Ll/opg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    const-string v3, "sud-device-brand"

    .line 73
    .line 74
    invoke-virtual {v1, v3, v2}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-static {}, Ll/pqg0;->d()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    const-string v3, "sud-os-version"

    .line 83
    .line 84
    invoke-virtual {v1, v3, v2}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {}, Ll/pqg0;->c()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    const-string v3, "sud-device-id"

    .line 93
    .line 94
    invoke-virtual {v1, v3, v2}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget-object p1, p1, Ll/lxg0;->a:Landroid/net/Uri;

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {v1, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    if-eqz p2, :cond_4

    .line 109
    .line 110
    invoke-virtual {p1, p2}, Ll/x1d0$a;->c(Ll/yx3;)Ll/x1d0$a;

    .line 111
    .line 112
    .line 113
    :cond_4
    invoke-virtual {p1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iget-object p2, p0, Ll/tvg0;->a:Ll/nxg0;

    .line 118
    .line 119
    iget-object p2, p2, Ll/nxg0;->a:Ll/rg50;

    .line 120
    .line 121
    invoke-interface {p2, p1}, Ll/ry3$a;->a(Ll/x1d0;)Ll/ry3;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-interface {p1}, Ll/ry3;->execute()Ll/i5d0;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Ll/i5d0;->k()Ll/k5d0;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-virtual {p1}, Ll/i5d0;->I()Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_9

    .line 138
    .line 139
    invoke-virtual {p1}, Ll/i5d0;->n()Ll/i5d0;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    const/4 v1, 0x3

    .line 144
    if-nez p1, :cond_5

    .line 145
    .line 146
    move p1, v1

    .line 147
    goto :goto_3

    .line 148
    :cond_5
    move p1, v0

    .line 149
    :goto_3
    const-wide/16 v2, 0x0

    .line 150
    .line 151
    if-ne p1, v0, :cond_7

    .line 152
    .line 153
    invoke-virtual {p2}, Ll/k5d0;->contentLength()J

    .line 154
    .line 155
    .line 156
    move-result-wide v4

    .line 157
    cmp-long v0, v4, v2

    .line 158
    .line 159
    if-eqz v0, :cond_6

    .line 160
    .line 161
    goto :goto_4

    .line 162
    :cond_6
    invoke-virtual {p2}, Ll/k5d0;->close()V

    .line 163
    .line 164
    .line 165
    new-instance p0, LSuddo/Sudwhile;

    .line 166
    .line 167
    invoke-direct {p0}, LSuddo/Sudwhile;-><init>()V

    .line 168
    .line 169
    .line 170
    throw p0

    .line 171
    :cond_7
    :goto_4
    if-ne p1, v1, :cond_8

    .line 172
    .line 173
    invoke-virtual {p2}, Ll/k5d0;->contentLength()J

    .line 174
    .line 175
    .line 176
    move-result-wide v0

    .line 177
    cmp-long v0, v0, v2

    .line 178
    .line 179
    if-lez v0, :cond_8

    .line 180
    .line 181
    iget-object p0, p0, Ll/tvg0;->b:Ll/zyg0;

    .line 182
    .line 183
    invoke-virtual {p2}, Ll/k5d0;->contentLength()J

    .line 184
    .line 185
    .line 186
    move-result-wide v0

    .line 187
    iget-object p0, p0, Ll/zyg0;->b:Ll/mxg0;

    .line 188
    .line 189
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    const/4 v1, 0x4

    .line 194
    invoke-virtual {p0, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 199
    .line 200
    .line 201
    :cond_8
    new-instance p0, Ll/aig0;

    .line 202
    .line 203
    invoke-virtual {p2}, Ll/k5d0;->source()Lokio/BufferedSource;

    .line 204
    .line 205
    .line 206
    move-result-object p2

    .line 207
    invoke-direct {p0, p2, p1}, Ll/aig0;-><init>(Lokio/Source;I)V

    .line 208
    .line 209
    .line 210
    return-object p0

    .line 211
    :cond_9
    invoke-virtual {p2}, Ll/k5d0;->close()V

    .line 212
    .line 213
    .line 214
    new-instance p0, LSuddo/Sudimport;

    .line 215
    .line 216
    invoke-virtual {p1}, Ll/i5d0;->q()I

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    invoke-direct {p0, p1}, LSuddo/Sudimport;-><init>(I)V

    .line 221
    .line 222
    .line 223
    throw p0
.end method

.method public final c(Landroid/net/NetworkInfo;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public final d(Ll/lxg0;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/lxg0;->a:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "http"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    const-string p1, "https"

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method
