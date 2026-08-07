.class public Ll/xdr;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/oi80;

.field public final b:Ll/wdr;

.field public final c:I

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ll/d0e;


# direct methods
.method public constructor <init>(Ll/oi80;Ll/d0e;Ll/wdr;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xdr;->a:Ll/oi80;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xdr;->f:Ll/d0e;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xdr;->b:Ll/wdr;

    .line 9
    .line 10
    iput p4, p0, Ll/xdr;->c:I

    .line 11
    .line 12
    iput-object p5, p0, Ll/xdr;->d:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p6, p0, Ll/xdr;->e:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a()Ll/wdr;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xdr;->b:Ll/wdr;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xdr;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xdr;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xdr;->b:Ll/wdr;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/wdr;->c(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xdr;->b:Ll/wdr;

    .line 2
    .line 3
    const/16 v0, 0x231

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/wdr;->b(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final f(ILl/l5d0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xdr;->a:Ll/oi80;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Ll/oi80;->a(ILl/l5d0;)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Ll/xdr;->a:Ll/oi80;

    .line 7
    .line 8
    invoke-interface {p2}, Ll/oi80;->b()Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    iget-object p0, p0, Ll/xdr;->b:Ll/wdr;

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/wdr;->a(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-interface {p0, p1}, Ll/wdr;->b(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public g(Ljava/security/PublicKey;ILjava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xdr;->e()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 v0, 0x5

    .line 8
    const/4 v1, 0x2

    .line 9
    const/4 v2, 0x1

    .line 10
    const-string v3, "LicenseValidator"

    .line 11
    .line 12
    if-eqz p2, :cond_2

    .line 13
    .line 14
    if-eq p2, v2, :cond_2

    .line 15
    .line 16
    if-ne p2, v1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p1, 0x0

    .line 20
    move-object p3, p1

    .line 21
    goto/16 :goto_1

    .line 22
    .line 23
    :cond_2
    :goto_0
    :try_start_0
    const-string v4, "SHA1withRSA"

    .line 24
    .line 25
    invoke-static {v4}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {v4, p1}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v4, p1}, Ljava/security/Signature;->update([B)V

    .line 37
    .line 38
    .line 39
    invoke-static {p4}, Ll/ne2;->a(Ljava/lang/String;)[B

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {v4, p1}, Ljava/security/Signature;->verify([B)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_3

    .line 48
    .line 49
    const-string p1, "Signature verification failed."

    .line 50
    .line 51
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xdr;->e()V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/google/android/vending/licensing/util/Base64DecoderException; {:try_start_0 .. :try_end_0} :catch_1

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    :try_start_1
    invoke-static {p3}, Ll/l5d0;->a(Ljava/lang/String;)Ll/l5d0;

    .line 59
    .line 60
    .line 61
    move-result-object p1
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 62
    iget p3, p1, Ll/l5d0;->a:I

    .line 63
    .line 64
    if-eq p3, p2, :cond_4

    .line 65
    .line 66
    const-string p1, "Response codes don\'t match."

    .line 67
    .line 68
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ll/xdr;->e()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_4
    iget p3, p1, Ll/l5d0;->b:I

    .line 76
    .line 77
    iget p4, p0, Ll/xdr;->c:I

    .line 78
    .line 79
    if-eq p3, p4, :cond_5

    .line 80
    .line 81
    const-string p1, "Nonce doesn\'t match."

    .line 82
    .line 83
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/xdr;->e()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_5
    iget-object p3, p1, Ll/l5d0;->c:Ljava/lang/String;

    .line 91
    .line 92
    iget-object p4, p0, Ll/xdr;->d:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p3

    .line 98
    if-nez p3, :cond_6

    .line 99
    .line 100
    const-string p1, "Package name doesn\'t match."

    .line 101
    .line 102
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ll/xdr;->e()V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_6
    iget-object p3, p1, Ll/l5d0;->d:Ljava/lang/String;

    .line 110
    .line 111
    iget-object p4, p0, Ll/xdr;->e:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p3

    .line 117
    if-nez p3, :cond_7

    .line 118
    .line 119
    const-string p1, "Version codes don\'t match."

    .line 120
    .line 121
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Ll/xdr;->e()V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_7
    iget-object p3, p1, Ll/l5d0;->e:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result p4

    .line 134
    if-eqz p4, :cond_8

    .line 135
    .line 136
    const-string p1, "User identifier is empty."

    .line 137
    .line 138
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Ll/xdr;->e()V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_8
    move-object v5, p3

    .line 146
    move-object p3, p1

    .line 147
    move-object p1, v5

    .line 148
    :goto_1
    if-eqz p2, :cond_d

    .line 149
    .line 150
    if-eq p2, v2, :cond_c

    .line 151
    .line 152
    if-eq p2, v1, :cond_d

    .line 153
    .line 154
    const/4 p1, 0x3

    .line 155
    if-eq p2, p1, :cond_b

    .line 156
    .line 157
    const/4 p1, 0x4

    .line 158
    const/16 p4, 0x123

    .line 159
    .line 160
    if-eq p2, p1, :cond_a

    .line 161
    .line 162
    if-eq p2, v0, :cond_9

    .line 163
    .line 164
    packed-switch p2, :pswitch_data_0

    .line 165
    .line 166
    .line 167
    const-string p1, "Unknown response code for license check."

    .line 168
    .line 169
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0}, Ll/xdr;->e()V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :pswitch_0
    invoke-virtual {p0, v1}, Ll/xdr;->d(I)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :pswitch_1
    invoke-virtual {p0, v2}, Ll/xdr;->d(I)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :pswitch_2
    invoke-virtual {p0, p4, p3}, Ll/xdr;->f(ILl/l5d0;)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_9
    invoke-virtual {p0, p4, p3}, Ll/xdr;->f(ILl/l5d0;)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :cond_a
    invoke-virtual {p0, p4, p3}, Ll/xdr;->f(ILl/l5d0;)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_b
    invoke-virtual {p0, p1}, Ll/xdr;->d(I)V

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_c
    const/16 p1, 0x231

    .line 201
    .line 202
    invoke-virtual {p0, p1, p3}, Ll/xdr;->f(ILl/l5d0;)V

    .line 203
    .line 204
    .line 205
    return-void

    .line 206
    :cond_d
    iget-object p2, p0, Ll/xdr;->f:Ll/d0e;

    .line 207
    .line 208
    invoke-interface {p2, p1}, Ll/d0e;->a(Ljava/lang/String;)I

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    invoke-virtual {p0, p1, p3}, Ll/xdr;->f(ILl/l5d0;)V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :catch_0
    const-string p1, "Could not parse response."

    .line 217
    .line 218
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0}, Ll/xdr;->e()V

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :catch_1
    const-string p1, "Could not Base64-decode signature."

    .line 226
    .line 227
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    invoke-virtual {p0}, Ll/xdr;->e()V

    .line 231
    .line 232
    .line 233
    return-void

    .line 234
    :catch_2
    move-exception p0

    .line 235
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 236
    .line 237
    .line 238
    return-void

    .line 239
    :catch_3
    invoke-virtual {p0, v0}, Ll/xdr;->d(I)V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :catch_4
    move-exception p0

    .line 244
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    nop

    .line 249
    :pswitch_data_0
    .packed-switch 0x101
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
