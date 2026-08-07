.class public final Ll/g9x0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Integer;

.field public b:Ljava/lang/Integer;

.field public c:Ll/h9x0;

.field public d:Ll/i9x0;


# direct methods
.method public synthetic constructor <init>(Ll/f9x0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/g9x0;->a:Ljava/lang/Integer;

    .line 6
    .line 7
    iput-object p1, p0, Ll/g9x0;->b:Ljava/lang/Integer;

    .line 8
    .line 9
    iput-object p1, p0, Ll/g9x0;->c:Ll/h9x0;

    .line 10
    .line 11
    sget-object p1, Ll/i9x0;->e:Ll/i9x0;

    .line 12
    .line 13
    iput-object p1, p0, Ll/g9x0;->d:Ll/i9x0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a(Ll/h9x0;)Ll/g9x0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g9x0;->c:Ll/h9x0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(I)Ll/g9x0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/g9x0;->a:Ljava/lang/Integer;

    .line 6
    .line 7
    return-object p0
.end method

.method public final c(I)Ll/g9x0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/g9x0;->b:Ljava/lang/Integer;

    .line 6
    .line 7
    return-object p0
.end method

.method public final d(Ll/i9x0;)Ll/g9x0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g9x0;->d:Ll/i9x0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ll/k9x0;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/g9x0;->a:Ljava/lang/Integer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_f

    .line 5
    .line 6
    iget-object v2, p0, Ll/g9x0;->b:Ljava/lang/Integer;

    .line 7
    .line 8
    if-eqz v2, :cond_e

    .line 9
    .line 10
    iget-object v2, p0, Ll/g9x0;->c:Ll/h9x0;

    .line 11
    .line 12
    if-eqz v2, :cond_d

    .line 13
    .line 14
    iget-object v2, p0, Ll/g9x0;->d:Ll/i9x0;

    .line 15
    .line 16
    if-eqz v2, :cond_c

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/16 v2, 0x10

    .line 23
    .line 24
    if-lt v0, v2, :cond_b

    .line 25
    .line 26
    iget-object v0, p0, Ll/g9x0;->b:Ljava/lang/Integer;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    iget-object v3, p0, Ll/g9x0;->c:Ll/h9x0;

    .line 33
    .line 34
    const/16 v4, 0xa

    .line 35
    .line 36
    if-lt v2, v4, :cond_a

    .line 37
    .line 38
    sget-object v4, Ll/h9x0;->b:Ll/h9x0;

    .line 39
    .line 40
    if-ne v3, v4, :cond_1

    .line 41
    .line 42
    const/16 v1, 0x14

    .line 43
    .line 44
    if-gt v2, v1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 48
    .line 49
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "Invalid tag size in bytes %d; can be at most 20 bytes for SHA1"

    .line 54
    .line 55
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw p0

    .line 63
    :cond_1
    sget-object v4, Ll/h9x0;->c:Ll/h9x0;

    .line 64
    .line 65
    if-ne v3, v4, :cond_3

    .line 66
    .line 67
    const/16 v1, 0x1c

    .line 68
    .line 69
    if-gt v2, v1, :cond_2

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 73
    .line 74
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const-string v1, "Invalid tag size in bytes %d; can be at most 28 bytes for SHA224"

    .line 79
    .line 80
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw p0

    .line 88
    :cond_3
    sget-object v4, Ll/h9x0;->d:Ll/h9x0;

    .line 89
    .line 90
    if-ne v3, v4, :cond_5

    .line 91
    .line 92
    const/16 v1, 0x20

    .line 93
    .line 94
    if-gt v2, v1, :cond_4

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 98
    .line 99
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-string v1, "Invalid tag size in bytes %d; can be at most 32 bytes for SHA256"

    .line 104
    .line 105
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    throw p0

    .line 113
    :cond_5
    sget-object v4, Ll/h9x0;->e:Ll/h9x0;

    .line 114
    .line 115
    if-ne v3, v4, :cond_7

    .line 116
    .line 117
    const/16 v1, 0x30

    .line 118
    .line 119
    if-gt v2, v1, :cond_6

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_6
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 123
    .line 124
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    const-string v1, "Invalid tag size in bytes %d; can be at most 48 bytes for SHA384"

    .line 129
    .line 130
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    throw p0

    .line 138
    :cond_7
    sget-object v4, Ll/h9x0;->f:Ll/h9x0;

    .line 139
    .line 140
    if-ne v3, v4, :cond_9

    .line 141
    .line 142
    const/16 v1, 0x40

    .line 143
    .line 144
    if-gt v2, v1, :cond_8

    .line 145
    .line 146
    :goto_0
    new-instance v3, Ll/k9x0;

    .line 147
    .line 148
    iget-object v0, p0, Ll/g9x0;->a:Ljava/lang/Integer;

    .line 149
    .line 150
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 151
    .line 152
    .line 153
    move-result v4

    .line 154
    iget-object v0, p0, Ll/g9x0;->b:Ljava/lang/Integer;

    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    iget-object v6, p0, Ll/g9x0;->d:Ll/i9x0;

    .line 161
    .line 162
    iget-object v7, p0, Ll/g9x0;->c:Ll/h9x0;

    .line 163
    .line 164
    const/4 v8, 0x0

    .line 165
    invoke-direct/range {v3 .. v8}, Ll/k9x0;-><init>(IILl/i9x0;Ll/h9x0;Ll/j9x0;)V

    .line 166
    .line 167
    .line 168
    return-object v3

    .line 169
    :cond_8
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 170
    .line 171
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    const-string v1, "Invalid tag size in bytes %d; can be at most 64 bytes for SHA512"

    .line 176
    .line 177
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    throw p0

    .line 185
    :cond_9
    const-string p0, "unknown hash type; must be SHA256, SHA384 or SHA512"

    .line 186
    .line 187
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    return-object v1

    .line 191
    :cond_a
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 192
    .line 193
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    const-string v1, "Invalid tag size in bytes %d; must be at least 10 bytes"

    .line 198
    .line 199
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-direct {p0, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    throw p0

    .line 207
    :cond_b
    new-instance v0, Ljava/security/InvalidAlgorithmParameterException;

    .line 208
    .line 209
    iget-object p0, p0, Ll/g9x0;->a:Ljava/lang/Integer;

    .line 210
    .line 211
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    const-string v1, "Invalid key size in bytes %d; must be at least 16 bytes"

    .line 216
    .line 217
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-direct {v0, p0}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    throw v0

    .line 225
    :cond_c
    const-string p0, "variant is not set"

    .line 226
    .line 227
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    return-object v1

    .line 231
    :cond_d
    const-string p0, "hash type is not set"

    .line 232
    .line 233
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    return-object v1

    .line 237
    :cond_e
    const-string p0, "tag size is not set"

    .line 238
    .line 239
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    return-object v1

    .line 243
    :cond_f
    const-string p0, "key size is not set"

    .line 244
    .line 245
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    return-object v1
.end method
