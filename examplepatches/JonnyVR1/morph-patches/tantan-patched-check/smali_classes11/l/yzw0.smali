.class public final Ll/yzw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/o0x0;

.field public b:Ll/xfx0;

.field public c:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Ll/xzw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/yzw0;->a:Ll/o0x0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/yzw0;->b:Ll/xfx0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/yzw0;->c:Ljava/lang/Integer;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Integer;)Ll/yzw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yzw0;->c:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ll/xfx0;)Ll/yzw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yzw0;->b:Ll/xfx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ll/o0x0;)Ll/yzw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yzw0;->a:Ll/o0x0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/a0x0;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/yzw0;->a:Ll/o0x0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_8

    .line 5
    .line 6
    iget-object v2, p0, Ll/yzw0;->b:Ll/xfx0;

    .line 7
    .line 8
    if-eqz v2, :cond_8

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/o0x0;->b()I

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
    if-ne v3, v2, :cond_7

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/o0x0;->a()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/yzw0;->c:Ljava/lang/Integer;

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
    iget-object v0, p0, Ll/yzw0;->a:Ll/o0x0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/o0x0;->a()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    iget-object v0, p0, Ll/yzw0;->c:Ljava/lang/Integer;

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
    iget-object v0, p0, Ll/yzw0;->a:Ll/o0x0;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/o0x0;->d()Ll/m0x0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget-object v2, Ll/m0x0;->d:Ll/m0x0;

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
    goto :goto_3

    .line 75
    :cond_4
    iget-object v0, p0, Ll/yzw0;->a:Ll/o0x0;

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/o0x0;->d()Ll/m0x0;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget-object v2, Ll/m0x0;->c:Ll/m0x0;

    .line 82
    .line 83
    const/4 v4, 0x5

    .line 84
    if-ne v0, v2, :cond_5

    .line 85
    .line 86
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v1, p0, Ll/yzw0;->c:Ljava/lang/Integer;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {v0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    goto :goto_2

    .line 113
    :cond_5
    iget-object v0, p0, Ll/yzw0;->a:Ll/o0x0;

    .line 114
    .line 115
    invoke-virtual {v0}, Ll/o0x0;->d()Ll/m0x0;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    sget-object v2, Ll/m0x0;->b:Ll/m0x0;

    .line 120
    .line 121
    if-ne v0, v2, :cond_6

    .line 122
    .line 123
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const/4 v1, 0x1

    .line 128
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object v1, p0, Ll/yzw0;->c:Ljava/lang/Integer;

    .line 133
    .line 134
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-static {v0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    goto :goto_2

    .line 151
    :goto_3
    new-instance v1, Ll/a0x0;

    .line 152
    .line 153
    iget-object v2, p0, Ll/yzw0;->a:Ll/o0x0;

    .line 154
    .line 155
    iget-object v3, p0, Ll/yzw0;->b:Ll/xfx0;

    .line 156
    .line 157
    iget-object v5, p0, Ll/yzw0;->c:Ljava/lang/Integer;

    .line 158
    .line 159
    const/4 v6, 0x0

    .line 160
    invoke-direct/range {v1 .. v6}, Ll/a0x0;-><init>(Ll/o0x0;Ll/xfx0;Ll/wfx0;Ljava/lang/Integer;Ll/zzw0;)V

    .line 161
    .line 162
    .line 163
    return-object v1

    .line 164
    :cond_6
    iget-object p0, p0, Ll/yzw0;->a:Ll/o0x0;

    .line 165
    .line 166
    invoke-virtual {p0}, Ll/o0x0;->d()Ll/m0x0;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    const-string v0, "Unknown AesGcmParameters.Variant: "

    .line 175
    .line 176
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    return-object v1

    .line 184
    :cond_7
    const-string p0, "Key size mismatch"

    .line 185
    .line 186
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    return-object v1

    .line 190
    :cond_8
    const-string p0, "Cannot build without parameters and/or key material"

    .line 191
    .line 192
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    return-object v1
.end method
