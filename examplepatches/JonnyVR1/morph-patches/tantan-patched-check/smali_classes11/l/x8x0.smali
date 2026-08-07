.class public final Ll/x8x0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/k9x0;

.field public b:Ll/xfx0;

.field public c:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Ll/w8x0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/x8x0;->a:Ll/k9x0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/x8x0;->b:Ll/xfx0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/x8x0;->c:Ljava/lang/Integer;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Integer;)Ll/x8x0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x8x0;->c:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ll/xfx0;)Ll/x8x0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x8x0;->b:Ll/xfx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ll/k9x0;)Ll/x8x0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x8x0;->a:Ll/k9x0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/z8x0;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x8x0;->a:Ll/k9x0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_9

    .line 5
    .line 6
    iget-object v2, p0, Ll/x8x0;->b:Ll/xfx0;

    .line 7
    .line 8
    if-eqz v2, :cond_9

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/k9x0;->c()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    invoke-virtual {v2}, Ll/xfx0;->a()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ne v3, v2, :cond_8

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/k9x0;->a()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/x8x0;->c:Ljava/lang/Integer;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string p0, "Cannot create key without ID requirement with parameters with ID requirement"

    .line 32
    .line 33
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object v1

    .line 37
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/x8x0;->a:Ll/k9x0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/k9x0;->a()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    iget-object v0, p0, Ll/x8x0;->c:Ljava/lang/Integer;

    .line 46
    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    const-string p0, "Cannot create key with ID requirement with parameters without ID requirement"

    .line 51
    .line 52
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-object v1

    .line 56
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/x8x0;->a:Ll/k9x0;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/k9x0;->g()Ll/i9x0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget-object v2, Ll/i9x0;->e:Ll/i9x0;

    .line 63
    .line 64
    const/4 v3, 0x0

    .line 65
    if-ne v0, v2, :cond_4

    .line 66
    .line 67
    new-array v0, v3, [B

    .line 68
    .line 69
    invoke-static {v0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    :goto_2
    move-object v4, v0

    .line 74
    goto :goto_4

    .line 75
    :cond_4
    iget-object v0, p0, Ll/x8x0;->a:Ll/k9x0;

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/k9x0;->g()Ll/i9x0;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget-object v2, Ll/i9x0;->d:Ll/i9x0;

    .line 82
    .line 83
    const/4 v4, 0x5

    .line 84
    if-eq v0, v2, :cond_7

    .line 85
    .line 86
    iget-object v0, p0, Ll/x8x0;->a:Ll/k9x0;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/k9x0;->g()Ll/i9x0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    sget-object v2, Ll/i9x0;->c:Ll/i9x0;

    .line 93
    .line 94
    if-ne v0, v2, :cond_5

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_5
    iget-object v0, p0, Ll/x8x0;->a:Ll/k9x0;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/k9x0;->g()Ll/i9x0;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sget-object v2, Ll/i9x0;->b:Ll/i9x0;

    .line 104
    .line 105
    if-ne v0, v2, :cond_6

    .line 106
    .line 107
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const/4 v1, 0x1

    .line 112
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v1, p0, Ll/x8x0;->c:Ljava/lang/Integer;

    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-static {v0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    goto :goto_2

    .line 135
    :cond_6
    iget-object p0, p0, Ll/x8x0;->a:Ll/k9x0;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/k9x0;->g()Ll/i9x0;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    const-string v0, "Unknown HmacParameters.Variant: "

    .line 146
    .line 147
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    return-object v1

    .line 155
    :cond_7
    :goto_3
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iget-object v1, p0, Ll/x8x0;->c:Ljava/lang/Integer;

    .line 164
    .line 165
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-static {v0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    goto :goto_2

    .line 182
    :goto_4
    new-instance v1, Ll/z8x0;

    .line 183
    .line 184
    iget-object v2, p0, Ll/x8x0;->a:Ll/k9x0;

    .line 185
    .line 186
    iget-object v3, p0, Ll/x8x0;->b:Ll/xfx0;

    .line 187
    .line 188
    iget-object v5, p0, Ll/x8x0;->c:Ljava/lang/Integer;

    .line 189
    .line 190
    const/4 v6, 0x0

    .line 191
    invoke-direct/range {v1 .. v6}, Ll/z8x0;-><init>(Ll/k9x0;Ll/xfx0;Ll/wfx0;Ljava/lang/Integer;Ll/y8x0;)V

    .line 192
    .line 193
    .line 194
    return-object v1

    .line 195
    :cond_8
    const-string p0, "Key size mismatch"

    .line 196
    .line 197
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    return-object v1

    .line 201
    :cond_9
    const-string p0, "Cannot build without parameters and/or key material"

    .line 202
    .line 203
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    return-object v1
.end method
