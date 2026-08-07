.class Lcom/tencent/liteav/d$12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->a(IIIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;IIII)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/d$12;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/d$12;->b:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/d$12;->c:I

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/liteav/d$12;->d:I

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget v0, p0, Lcom/tencent/liteav/d$12;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget v0, p0, Lcom/tencent/liteav/d$12;->b:I

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 22
    .line 23
    if-ne v0, v1, :cond_1

    .line 24
    .line 25
    iget v0, p0, Lcom/tencent/liteav/d$12;->c:I

    .line 26
    .line 27
    iget-object v1, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    .line 34
    .line 35
    if-le v0, v1, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void

    .line 39
    :cond_1
    :goto_0
    iget v0, p0, Lcom/tencent/liteav/d$12;->a:I

    .line 40
    .line 41
    iget v1, p0, Lcom/tencent/liteav/d$12;->b:I

    .line 42
    .line 43
    if-le v0, v1, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const/4 v1, 0x0

    .line 52
    iput v1, v0, Lcom/tencent/liteav/g;->l:I

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    if-ge v0, v1, :cond_3

    .line 56
    .line 57
    iget-object v0, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v1, 0x1

    .line 64
    iput v1, v0, Lcom/tencent/liteav/g;->l:I

    .line 65
    .line 66
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 67
    .line 68
    invoke-static {v0}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget v1, p0, Lcom/tencent/liteav/d$12;->a:I

    .line 73
    .line 74
    iget v2, p0, Lcom/tencent/liteav/d$12;->b:I

    .line 75
    .line 76
    if-le v1, v2, :cond_4

    .line 77
    .line 78
    move v1, v2

    .line 79
    :cond_4
    iput v1, v0, Lcom/tencent/liteav/g;->a:I

    .line 80
    .line 81
    iget-object v0, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget v1, p0, Lcom/tencent/liteav/d$12;->a:I

    .line 88
    .line 89
    iget v2, p0, Lcom/tencent/liteav/d$12;->b:I

    .line 90
    .line 91
    if-le v1, v2, :cond_5

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_5
    move v1, v2

    .line 95
    :goto_2
    iput v1, v0, Lcom/tencent/liteav/g;->b:I

    .line 96
    .line 97
    iget-object v0, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/tencent/liteav/d;->e(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/k;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    if-eqz v0, :cond_6

    .line 104
    .line 105
    sget-object v1, Lcom/tencent/liteav/basic/a/c;->a:Lcom/tencent/liteav/basic/a/c;

    .line 106
    .line 107
    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->a(Lcom/tencent/liteav/basic/a/c;)V

    .line 108
    .line 109
    .line 110
    iget-object v1, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 111
    .line 112
    invoke-static {v1}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iget v1, v1, Lcom/tencent/liteav/g;->a:I

    .line 117
    .line 118
    iget-object v2, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 119
    .line 120
    invoke-static {v2}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    iget v2, v2, Lcom/tencent/liteav/g;->b:I

    .line 125
    .line 126
    invoke-interface {v0, v1, v2}, Lcom/tencent/liteav/k;->b(II)V

    .line 127
    .line 128
    .line 129
    iget-object v1, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 130
    .line 131
    invoke-static {v1}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iget v1, v1, Lcom/tencent/liteav/g;->l:I

    .line 136
    .line 137
    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->e(I)V

    .line 138
    .line 139
    .line 140
    :cond_6
    iget-object v0, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 141
    .line 142
    invoke-static {v0}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget v1, p0, Lcom/tencent/liteav/d$12;->d:I

    .line 147
    .line 148
    iput v1, v0, Lcom/tencent/liteav/g;->c:I

    .line 149
    .line 150
    iget-object v0, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 151
    .line 152
    invoke-static {v0}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iget v1, p0, Lcom/tencent/liteav/d$12;->c:I

    .line 157
    .line 158
    iput v1, v0, Lcom/tencent/liteav/g;->h:I

    .line 159
    .line 160
    iget-object v0, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 161
    .line 162
    invoke-static {v0}, Lcom/tencent/liteav/d;->f(Lcom/tencent/liteav/d;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 166
    .line 167
    invoke-static {v0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 172
    .line 173
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    iget-object v0, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 178
    .line 179
    invoke-static {v0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 184
    .line 185
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    iget-object v0, p0, Lcom/tencent/liteav/d$12;->e:Lcom/tencent/liteav/d;

    .line 190
    .line 191
    invoke-static {v0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    .line 196
    .line 197
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    iget v0, p0, Lcom/tencent/liteav/d$12;->a:I

    .line 202
    .line 203
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object v4

    .line 207
    iget v0, p0, Lcom/tencent/liteav/d$12;->b:I

    .line 208
    .line 209
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 210
    .line 211
    .line 212
    move-result-object v5

    .line 213
    iget p0, p0, Lcom/tencent/liteav/d$12;->c:I

    .line 214
    .line 215
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 216
    .line 217
    .line 218
    move-result-object v6

    .line 219
    filled-new-array/range {v1 .. v6}, [Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    const-string v0, "QOS restart big encoder old resolution %dx%d fps %d, new resolution %dx%d fps %d"

    .line 224
    .line 225
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    const-string v0, "TXCCaptureAndEnc"

    .line 230
    .line 231
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    return-void
.end method
