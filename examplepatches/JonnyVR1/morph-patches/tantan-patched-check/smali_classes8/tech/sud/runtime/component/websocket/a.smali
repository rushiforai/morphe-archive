.class public Ltech/sud/runtime/component/websocket/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltech/sud/runtime/component/websocket/a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Ltech/sud/runtime/component/websocket/a;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Ltech/sud/runtime/component/websocket/a;->e:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Ltech/sud/runtime/component/websocket/a;->f:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v1, -0x1

    .line 16
    iput v1, p0, Ltech/sud/runtime/component/websocket/a;->g:I

    .line 17
    .line 18
    :try_start_0
    iput-object p1, p0, Ltech/sud/runtime/component/websocket/a;->a:Ljava/lang/String;

    .line 19
    .line 20
    const/16 v2, 0x3a

    .line 21
    .line 22
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const/4 v4, 0x0

    .line 27
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    iput-object v5, p0, Ltech/sud/runtime/component/websocket/a;->b:Ljava/lang/String;

    .line 32
    .line 33
    add-int/lit8 v3, v3, 0x1

    .line 34
    .line 35
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 40
    .line 41
    const-string v3, "//"

    .line 42
    .line 43
    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    const/4 v3, 0x2

    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    iget-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 57
    .line 58
    :cond_0
    iget-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 59
    .line 60
    const/16 v5, 0x23

    .line 61
    .line 62
    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eq p1, v1, :cond_1

    .line 67
    .line 68
    iget-object v5, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v5, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 75
    .line 76
    :cond_1
    iget-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 77
    .line 78
    const/16 v5, 0x3f

    .line 79
    .line 80
    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eq p1, v1, :cond_2

    .line 85
    .line 86
    iget-object v5, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 87
    .line 88
    add-int/lit8 v6, p1, 0x1

    .line 89
    .line 90
    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    iput-object v5, p0, Ltech/sud/runtime/component/websocket/a;->f:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v5, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v5, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 103
    .line 104
    :cond_2
    iget-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 105
    .line 106
    const/16 v5, 0x2f

    .line 107
    .line 108
    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eq p1, v1, :cond_3

    .line 113
    .line 114
    iget-object v5, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v5, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    iput-object v5, p0, Ltech/sud/runtime/component/websocket/a;->e:Ljava/lang/String;

    .line 121
    .line 122
    iget-object v5, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v5, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iput-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 129
    .line 130
    :cond_3
    iget-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 131
    .line 132
    const/16 v5, 0x40

    .line 133
    .line 134
    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eq p1, v1, :cond_4

    .line 139
    .line 140
    iget-object v5, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v5, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    iput-object v5, p0, Ltech/sud/runtime/component/websocket/a;->c:Ljava/lang/String;

    .line 147
    .line 148
    iget-object v5, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 149
    .line 150
    add-int/lit8 p1, p1, 0x1

    .line 151
    .line 152
    invoke-virtual {v5, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 157
    .line 158
    :cond_4
    iget-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 159
    .line 160
    const/16 v5, 0x5b

    .line 161
    .line 162
    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    .line 163
    .line 164
    .line 165
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    iget-object v5, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 167
    .line 168
    if-nez p1, :cond_5

    .line 169
    .line 170
    const/16 p1, 0x5d

    .line 171
    .line 172
    :try_start_1
    invoke-virtual {v5, p1}, Ljava/lang/String;->indexOf(I)I

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eq p1, v1, :cond_6

    .line 177
    .line 178
    iget-object v1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 179
    .line 180
    add-int/lit8 v5, p1, 0x1

    .line 181
    .line 182
    invoke-virtual {v1, v2, v5}, Ljava/lang/String;->indexOf(II)I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    if-ne v1, v5, :cond_6

    .line 187
    .line 188
    iget-object v0, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 189
    .line 190
    add-int/2addr p1, v3

    .line 191
    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iget-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    iput-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 202
    .line 203
    goto :goto_0

    .line 204
    :cond_5
    invoke-virtual {v5, v2}, Ljava/lang/String;->indexOf(I)I

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    if-eq p1, v1, :cond_6

    .line 209
    .line 210
    iget-object v1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    if-ne p1, v1, :cond_6

    .line 217
    .line 218
    iget-object v0, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 219
    .line 220
    add-int/lit8 v1, p1, 0x1

    .line 221
    .line 222
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    iget-object v1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {v1, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 233
    .line 234
    :cond_6
    :goto_0
    if-eqz v0, :cond_7

    .line 235
    .line 236
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    iput p1, p0, Ltech/sud/runtime/component/websocket/a;->g:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 241
    .line 242
    :cond_7
    return-void

    .line 243
    :catch_0
    move-exception p0

    .line 244
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 245
    .line 246
    .line 247
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/websocket/a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/websocket/a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/websocket/a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/websocket/a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/component/websocket/a;->g:I

    .line 2
    .line 3
    return p0
.end method
