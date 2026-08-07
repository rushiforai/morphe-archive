.class Ll/grx$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/x264/x264sdk$listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/grx$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/grx$a;


# direct methods
.method public constructor <init>(Ll/grx$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/grx$a$a;->a:Ll/grx$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public h264data([BI)V
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    aget-byte v1, p1, v0

    .line 6
    .line 7
    and-int/lit8 v2, v1, 0x60

    .line 8
    .line 9
    and-int/lit8 v1, v1, 0x1f

    .line 10
    .line 11
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    new-instance v4, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v5, "----h264data----len:"

    .line 18
    .line 19
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v5, ";idc:"

    .line 26
    .line 27
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, ";naltype:"

    .line 34
    .line 35
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, ":date:"

    .line 42
    .line 43
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    aget-byte v5, p1, v2

    .line 48
    .line 49
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v5, ":"

    .line 53
    .line 54
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const/4 v6, 0x1

    .line 58
    aget-byte v7, p1, v6

    .line 59
    .line 60
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const/4 v7, 0x2

    .line 67
    aget-byte v7, p1, v7

    .line 68
    .line 69
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const/4 v7, 0x3

    .line 76
    aget-byte v7, p1, v7

    .line 77
    .line 78
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    aget-byte v5, p1, v0

    .line 85
    .line 86
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    const-string v5, "MediaCodecFilter"

    .line 94
    .line 95
    invoke-virtual {v3, v5, v4}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v3, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    .line 108
    iget-object v4, p0, Ll/grx$a$a;->a:Ll/grx$a;

    .line 109
    .line 110
    invoke-static {v4}, Ll/grx$a;->a(Ll/grx$a;)Z

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    if-nez v4, :cond_5

    .line 115
    .line 116
    const/4 v4, 0x7

    .line 117
    if-ne v1, v4, :cond_5

    .line 118
    .line 119
    move v1, v2

    .line 120
    :goto_0
    add-int/lit8 v4, p2, -0x4

    .line 121
    .line 122
    if-ge v1, v4, :cond_1

    .line 123
    .line 124
    aget-byte v5, p1, v1

    .line 125
    .line 126
    if-nez v5, :cond_0

    .line 127
    .line 128
    add-int/lit8 v5, v1, 0x1

    .line 129
    .line 130
    aget-byte v5, p1, v5

    .line 131
    .line 132
    if-nez v5, :cond_0

    .line 133
    .line 134
    add-int/lit8 v5, v1, 0x2

    .line 135
    .line 136
    aget-byte v5, p1, v5

    .line 137
    .line 138
    if-nez v5, :cond_0

    .line 139
    .line 140
    add-int/lit8 v5, v1, 0x3

    .line 141
    .line 142
    aget-byte v5, p1, v5

    .line 143
    .line 144
    if-ne v5, v6, :cond_0

    .line 145
    .line 146
    add-int/lit8 v5, v1, 0x4

    .line 147
    .line 148
    aget-byte v5, p1, v5

    .line 149
    .line 150
    and-int/lit8 v5, v5, 0x1f

    .line 151
    .line 152
    const/16 v7, 0x8

    .line 153
    .line 154
    if-ne v5, v7, :cond_0

    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_1
    move v1, v2

    .line 161
    :goto_1
    add-int/2addr v1, v0

    .line 162
    :goto_2
    if-ge v1, v4, :cond_3

    .line 163
    .line 164
    aget-byte p2, p1, v1

    .line 165
    .line 166
    if-nez p2, :cond_2

    .line 167
    .line 168
    add-int/lit8 p2, v1, 0x1

    .line 169
    .line 170
    aget-byte p2, p1, p2

    .line 171
    .line 172
    if-nez p2, :cond_2

    .line 173
    .line 174
    add-int/lit8 p2, v1, 0x2

    .line 175
    .line 176
    aget-byte p2, p1, p2

    .line 177
    .line 178
    if-ne p2, v6, :cond_2

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_3
    move v1, v2

    .line 185
    :goto_3
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    invoke-virtual {p2, p1, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/grx$a$a;->a:Ll/grx$a;

    .line 193
    .line 194
    iget-object p1, p1, Ll/grx$a;->f:Ll/grx;

    .line 195
    .line 196
    invoke-static {p1}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    if-eqz p1, :cond_4

    .line 201
    .line 202
    iget-object p1, p0, Ll/grx$a$a;->a:Ll/grx$a;

    .line 203
    .line 204
    iget-object p1, p1, Ll/grx$a;->f:Ll/grx;

    .line 205
    .line 206
    invoke-static {p1}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    int-to-long v0, v1

    .line 211
    invoke-interface {p1, p2, v0, v1}, Ll/g220;->f0(Ljava/nio/ByteBuffer;J)V

    .line 212
    .line 213
    .line 214
    :cond_4
    iget-object p1, p0, Ll/grx$a$a;->a:Ll/grx$a;

    .line 215
    .line 216
    invoke-static {p1, v6}, Ll/grx$a;->b(Ll/grx$a;Z)Z

    .line 217
    .line 218
    .line 219
    :cond_5
    iget-object p1, p0, Ll/grx$a$a;->a:Ll/grx$a;

    .line 220
    .line 221
    iget-object p1, p1, Ll/grx$a;->f:Ll/grx;

    .line 222
    .line 223
    invoke-static {p1}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    if-eqz p1, :cond_6

    .line 228
    .line 229
    iget-object p1, p0, Ll/grx$a$a;->a:Ll/grx$a;

    .line 230
    .line 231
    invoke-static {p1}, Ll/grx$a;->a(Ll/grx$a;)Z

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    if-ne p1, v6, :cond_6

    .line 236
    .line 237
    iget-object p0, p0, Ll/grx$a$a;->a:Ll/grx$a;

    .line 238
    .line 239
    iget-object p0, p0, Ll/grx$a;->f:Ll/grx;

    .line 240
    .line 241
    invoke-static {p0}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    invoke-interface {p0, v3}, Ll/g220;->W(Ljava/nio/ByteBuffer;)V

    .line 246
    .line 247
    .line 248
    :cond_6
    return-void
.end method
