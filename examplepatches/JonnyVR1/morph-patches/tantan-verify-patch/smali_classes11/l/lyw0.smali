.class public final Ll/lyw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/xyw0;

.field public b:Ll/xfx0;

.field public c:Ll/xfx0;

.field public d:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Ll/kyw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/lyw0;->a:Ll/xyw0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/lyw0;->b:Ll/xfx0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/lyw0;->c:Ll/xfx0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/lyw0;->d:Ljava/lang/Integer;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Ll/xfx0;)Ll/lyw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lyw0;->b:Ll/xfx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ll/xfx0;)Ll/lyw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lyw0;->c:Ll/xfx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ljava/lang/Integer;)Ll/lyw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lyw0;->d:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Ll/xyw0;)Ll/lyw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lyw0;->a:Ll/xyw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ll/nyw0;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/lyw0;->a:Ll/xyw0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_a

    .line 5
    .line 6
    iget-object v2, p0, Ll/lyw0;->b:Ll/xfx0;

    .line 7
    .line 8
    if-eqz v2, :cond_9

    .line 9
    .line 10
    iget-object v3, p0, Ll/lyw0;->c:Ll/xfx0;

    .line 11
    .line 12
    if-eqz v3, :cond_9

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/xyw0;->b()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-virtual {v2}, Ll/xfx0;->a()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ne v3, v2, :cond_8

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/xyw0;->c()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v2, p0, Ll/lyw0;->c:Ll/xfx0;

    .line 29
    .line 30
    invoke-virtual {v2}, Ll/xfx0;->a()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-ne v0, v2, :cond_7

    .line 35
    .line 36
    iget-object v0, p0, Ll/lyw0;->a:Ll/xyw0;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/xyw0;->a()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Ll/lyw0;->d:Ljava/lang/Integer;

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-string p0, "Cannot create key without ID requirement with parameters with ID requirement"

    .line 50
    .line 51
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-object v1

    .line 55
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/lyw0;->a:Ll/xyw0;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/xyw0;->a()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    iget-object v0, p0, Ll/lyw0;->d:Ljava/lang/Integer;

    .line 64
    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    const-string p0, "Cannot create key with ID requirement with parameters without ID requirement"

    .line 69
    .line 70
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-object v1

    .line 74
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/lyw0;->a:Ll/xyw0;

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/xyw0;->g()Ll/vyw0;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget-object v2, Ll/vyw0;->d:Ll/vyw0;

    .line 81
    .line 82
    const/4 v3, 0x0

    .line 83
    if-ne v0, v2, :cond_4

    .line 84
    .line 85
    new-array v0, v3, [B

    .line 86
    .line 87
    invoke-static {v0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    :goto_2
    move-object v5, v0

    .line 92
    goto :goto_3

    .line 93
    :cond_4
    iget-object v0, p0, Ll/lyw0;->a:Ll/xyw0;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/xyw0;->g()Ll/vyw0;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    sget-object v2, Ll/vyw0;->c:Ll/vyw0;

    .line 100
    .line 101
    const/4 v4, 0x5

    .line 102
    if-ne v0, v2, :cond_5

    .line 103
    .line 104
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object v1, p0, Ll/lyw0;->d:Ljava/lang/Integer;

    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {v0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    goto :goto_2

    .line 131
    :cond_5
    iget-object v0, p0, Ll/lyw0;->a:Ll/xyw0;

    .line 132
    .line 133
    invoke-virtual {v0}, Ll/xyw0;->g()Ll/vyw0;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    sget-object v2, Ll/vyw0;->b:Ll/vyw0;

    .line 138
    .line 139
    if-ne v0, v2, :cond_6

    .line 140
    .line 141
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const/4 v1, 0x1

    .line 146
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iget-object v1, p0, Ll/lyw0;->d:Ljava/lang/Integer;

    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {v0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    goto :goto_2

    .line 169
    :goto_3
    new-instance v1, Ll/nyw0;

    .line 170
    .line 171
    iget-object v2, p0, Ll/lyw0;->a:Ll/xyw0;

    .line 172
    .line 173
    iget-object v3, p0, Ll/lyw0;->b:Ll/xfx0;

    .line 174
    .line 175
    iget-object v4, p0, Ll/lyw0;->c:Ll/xfx0;

    .line 176
    .line 177
    iget-object v6, p0, Ll/lyw0;->d:Ljava/lang/Integer;

    .line 178
    .line 179
    const/4 v7, 0x0

    .line 180
    invoke-direct/range {v1 .. v7}, Ll/nyw0;-><init>(Ll/xyw0;Ll/xfx0;Ll/xfx0;Ll/wfx0;Ljava/lang/Integer;Ll/myw0;)V

    .line 181
    .line 182
    .line 183
    return-object v1

    .line 184
    :cond_6
    iget-object p0, p0, Ll/lyw0;->a:Ll/xyw0;

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/xyw0;->g()Ll/vyw0;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    const-string v0, "Unknown AesCtrHmacAeadParameters.Variant: "

    .line 195
    .line 196
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    return-object v1

    .line 204
    :cond_7
    const-string p0, "HMAC key size mismatch"

    .line 205
    .line 206
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    return-object v1

    .line 210
    :cond_8
    const-string p0, "AES key size mismatch"

    .line 211
    .line 212
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    return-object v1

    .line 216
    :cond_9
    const-string p0, "Cannot build without key material"

    .line 217
    .line 218
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    return-object v1

    .line 222
    :cond_a
    const-string p0, "Cannot build without parameters"

    .line 223
    .line 224
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    return-object v1
.end method
