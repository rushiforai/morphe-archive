.class public Ll/bsj0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/regex/Pattern;

.field public static b:Z

.field public static c:I

.field public static final d:Ljava/util/regex/Pattern;

.field public static final e:Ljava/util/regex/Pattern;

.field public static final f:Ljava/util/regex/Pattern;

.field public static final g:Ljava/util/regex/Pattern;

.field public static final h:Ljava/util/regex/Pattern;

.field public static final i:Ljava/util/regex/Pattern;

.field public static j:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/text/Spannable;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static k:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/text/Spannable;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static l:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/text/Spannable;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static m:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "(?=[a-zA-Z0-9]+[0-9_-])[a-zA-Z0-9_-]{6,20}"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/bsj0;->a:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    invoke-static {}, Ll/bsj0;->O()Ljava/util/regex/Pattern;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/bsj0;->d:Ljava/util/regex/Pattern;

    .line 14
    .line 15
    const-string v0, "[^a-zA-Z0-9_-]"

    .line 16
    .line 17
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Ll/bsj0;->e:Ljava/util/regex/Pattern;

    .line 22
    .line 23
    const-string v0, "[^\\u4e00-\\u9fa5]"

    .line 24
    .line 25
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/bsj0;->f:Ljava/util/regex/Pattern;

    .line 30
    .line 31
    invoke-static {}, Ll/bsj0;->P()Ljava/util/regex/Pattern;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Ll/bsj0;->g:Ljava/util/regex/Pattern;

    .line 36
    .line 37
    const-string v0, "^(([1-9]\\d*)(\\.\\d{1,2})?|0\\.\\d{1,2})"

    .line 38
    .line 39
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, Ll/bsj0;->h:Ljava/util/regex/Pattern;

    .line 44
    .line 45
    const-string v0, "^[1-9]\\d{5}(18|19|20)\\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$"

    .line 46
    .line 47
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, Ll/bsj0;->i:Ljava/util/regex/Pattern;

    .line 52
    .line 53
    new-instance v0, Ll/mrj0;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/mrj0;-><init>()V

    .line 56
    .line 57
    .line 58
    sput-object v0, Ll/bsj0;->j:Ll/qcj;

    .line 59
    .line 60
    new-instance v0, Ll/prj0;

    .line 61
    .line 62
    invoke-direct {v0}, Ll/prj0;-><init>()V

    .line 63
    .line 64
    .line 65
    sput-object v0, Ll/bsj0;->k:Ll/qcj;

    .line 66
    .line 67
    new-instance v0, Ll/rrj0;

    .line 68
    .line 69
    invoke-direct {v0}, Ll/rrj0;-><init>()V

    .line 70
    .line 71
    .line 72
    sput-object v0, Ll/bsj0;->l:Ll/qcj;

    .line 73
    .line 74
    const/4 v0, -0x1

    .line 75
    sput v0, Ll/bsj0;->m:I

    .line 76
    .line 77
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A()Ljava/util/Date;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    return-object v0
.end method

.method public static B(ILjava/lang/Throwable;)V
    .locals 1

    .line 1
    const v0, 0x9c6a

    .line 2
    .line 3
    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/common/R$string;->X1:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const v0, 0x9c6d

    .line 13
    .line 14
    .line 15
    if-ne p0, v0, :cond_1

    .line 16
    .line 17
    const-string p0, "\u5bf9\u65b9\u5df2\u6ce8\u9500"

    .line 18
    .line 19
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const v0, 0x9c6c

    .line 24
    .line 25
    .line 26
    if-ne p0, v0, :cond_2

    .line 27
    .line 28
    const-string p0, "\u6ce8\u610f\uff1a\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38\uff0c\u6682\u65f6\u4e0d\u80fd\u56de\u590d\u4f60\u7684\u6d88\u606f"

    .line 29
    .line 30
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    const v0, 0x9c69

    .line 35
    .line 36
    .line 37
    if-ne p0, v0, :cond_3

    .line 38
    .line 39
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 40
    .line 41
    invoke-interface {p0, p1}, Ll/bn5;->R3(Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_3
    const v0, 0x9ca3

    .line 46
    .line 47
    .line 48
    if-ne p0, v0, :cond_4

    .line 49
    .line 50
    const-string p0, "\u60a8\u8f93\u5165\u7684\u5185\u5bb9\u8fdd\u89c4\uff0c\u8bf7\u4fee\u6539"

    .line 51
    .line 52
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    if-nez p0, :cond_5

    .line 61
    .line 62
    invoke-static {p1}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_5
    sget p0, Lcom/p1/mobile/putong/common/R$string;->G:I

    .line 67
    .line 68
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 69
    .line 70
    .line 71
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static C(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    instance-of v1, p0, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v1, :cond_2

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;

    .line 8
    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;->code:I

    .line 10
    .line 11
    const/16 v3, 0x1f7

    .line 12
    .line 13
    if-ne v1, v3, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Meta;->errors:Ljava/util/List;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-lez v1, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Meta;->errors:Ljava/util/List;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/data/MetaError;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MetaError;->message:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    sget v1, Ll/bsj0;->m:I

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->sessionCount()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-eq v1, v4, :cond_0

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->sessionCount()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    sput v1, Ll/bsj0;->m:I

    .line 67
    .line 68
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Meta;->errors:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Lcom/p1/mobile/putong/data/MetaError;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MetaError;->message:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v1, v2, p0}, Lcom/p1/mobile/putong/ui/DialogAct;->P0(Landroid/content/Context;ILjava/io/Serializable;)Landroid/content/Intent;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 87
    .line 88
    .line 89
    const-string p0, "server error with message"

    .line 90
    .line 91
    return-object p0

    .line 92
    :catch_0
    move-exception p0

    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :cond_0
    return-object v0

    .line 96
    :cond_1
    sget p0, Lcom/p1/mobile/putong/common/R$string;->G:I

    .line 97
    .line 98
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 99
    .line 100
    .line 101
    const-string p0, "server else"

    .line 102
    .line 103
    return-object p0

    .line 104
    :cond_2
    const-class v1, Lcom/tantanapp/common/network/ApiExcep$ClientExpired;

    .line 105
    .line 106
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 107
    .line 108
    .line 109
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    const-string v3, "logout_type"

    .line 111
    .line 112
    const-string v4, "e_auto_logout"

    .line 113
    .line 114
    const-string v5, ""

    .line 115
    .line 116
    if-eqz v1, :cond_3

    .line 117
    .line 118
    :try_start_1
    const-string p0, "forced_update"

    .line 119
    .line 120
    invoke-static {v3, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    filled-new-array {p0}, [Ll/pf60;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-static {v4, v5, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Ll/bsj0;->v()V

    .line 132
    .line 133
    .line 134
    const-string p0, "client expired"

    .line 135
    .line 136
    return-object p0

    .line 137
    :cond_3
    const-class v1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 138
    .line 139
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_4

    .line 144
    .line 145
    sget p0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 146
    .line 147
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 148
    .line 149
    .line 150
    invoke-static {}, Ll/bsj0;->Q()V

    .line 151
    .line 152
    .line 153
    const-string p0, "ssl peer unverified"

    .line 154
    .line 155
    return-object p0

    .line 156
    :cond_4
    const-class v1, Ljava/io/EOFException;

    .line 157
    .line 158
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-eqz v1, :cond_5

    .line 163
    .line 164
    sget p0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 165
    .line 166
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 167
    .line 168
    .line 169
    const-string p0, "eof"

    .line 170
    .line 171
    return-object p0

    .line 172
    :cond_5
    const-class v1, Ljavax/net/ssl/SSLHandshakeException;

    .line 173
    .line 174
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-eqz v1, :cond_6

    .line 179
    .line 180
    sget p0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 181
    .line 182
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 183
    .line 184
    .line 185
    const-string p0, "ssl handshake"

    .line 186
    .line 187
    return-object p0

    .line 188
    :cond_6
    const-class v1, Ljavax/net/ssl/SSLException;

    .line 189
    .line 190
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    if-eqz v1, :cond_7

    .line 195
    .line 196
    sget p0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 197
    .line 198
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 199
    .line 200
    .line 201
    const-string p0, "ssl"

    .line 202
    .line 203
    return-object p0

    .line 204
    :cond_7
    const-class v1, Ljava/net/SocketTimeoutException;

    .line 205
    .line 206
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-eqz v1, :cond_8

    .line 211
    .line 212
    sget p0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 213
    .line 214
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 215
    .line 216
    .line 217
    const-string p0, "socket timeout"

    .line 218
    .line 219
    return-object p0

    .line 220
    :cond_8
    const-class v1, Ljava/net/UnknownHostException;

    .line 221
    .line 222
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    if-eqz v1, :cond_9

    .line 227
    .line 228
    sget p0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 229
    .line 230
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 231
    .line 232
    .line 233
    const-string p0, "unknown host"

    .line 234
    .line 235
    return-object p0

    .line 236
    :cond_9
    const-class v1, Lcom/tantanapp/common/network/ApiExcep$Client$UnprocessableEntity;

    .line 237
    .line 238
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    if-eqz v1, :cond_a

    .line 243
    .line 244
    sget p0, Lcom/p1/mobile/putong/common/R$string;->H:I

    .line 245
    .line 246
    invoke-static {p0, v2}, Ll/o1j0;->i(IZ)V

    .line 247
    .line 248
    .line 249
    const-string p0, "unprocessable entity"

    .line 250
    .line 251
    return-object p0

    .line 252
    :cond_a
    const-class v1, Ljava/net/ConnectException;

    .line 253
    .line 254
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    if-eqz v1, :cond_b

    .line 259
    .line 260
    sget p0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 261
    .line 262
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 263
    .line 264
    .line 265
    const-string p0, "connect"

    .line 266
    .line 267
    return-object p0

    .line 268
    :cond_b
    const-class v1, Ljava/net/ProtocolException;

    .line 269
    .line 270
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    if-eqz v1, :cond_c

    .line 275
    .line 276
    sget p0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 277
    .line 278
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 279
    .line 280
    .line 281
    const-string p0, "protocol exception"

    .line 282
    .line 283
    return-object p0

    .line 284
    :cond_c
    const-class v1, Ljava/net/SocketException;

    .line 285
    .line 286
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    if-eqz v1, :cond_d

    .line 291
    .line 292
    sget p0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 293
    .line 294
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 295
    .line 296
    .line 297
    const-string p0, "socket exception"

    .line 298
    .line 299
    return-object p0

    .line 300
    :cond_d
    const-class v1, Ljava/io/IOException;

    .line 301
    .line 302
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    if-eqz v1, :cond_e

    .line 307
    .line 308
    return-object v0

    .line 309
    :cond_e
    const-class v1, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 310
    .line 311
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 312
    .line 313
    .line 314
    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 315
    const-string v2, "401_exception"

    .line 316
    .line 317
    if-eqz v1, :cond_f

    .line 318
    .line 319
    :try_start_2
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    filled-new-array {p0}, [Ll/pf60;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    invoke-static {v4, v5, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 328
    .line 329
    .line 330
    invoke-static {}, Ll/bsj0;->K()V

    .line 331
    .line 332
    .line 333
    const-string p0, "network unauthorized"

    .line 334
    .line 335
    return-object p0

    .line 336
    :cond_f
    const-class v1, Lcom/tantanapp/common/network/ApiExcep$Client$TooManyRequests;

    .line 337
    .line 338
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    if-eqz v1, :cond_10

    .line 343
    .line 344
    sget p0, Lcom/p1/mobile/putong/common/R$string;->G:I

    .line 345
    .line 346
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 347
    .line 348
    .line 349
    const-string p0, "too many requests"

    .line 350
    .line 351
    return-object p0

    .line 352
    :cond_10
    const-class v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 353
    .line 354
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 355
    .line 356
    .line 357
    move-result v1

    .line 358
    if-eqz v1, :cond_12

    .line 359
    .line 360
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 361
    .line 362
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 363
    .line 364
    const v1, 0x9c5a

    .line 365
    .line 366
    .line 367
    if-ne p0, v1, :cond_11

    .line 368
    .line 369
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 370
    .line 371
    .line 372
    move-result-object p0

    .line 373
    filled-new-array {p0}, [Ll/pf60;

    .line 374
    .line 375
    .line 376
    move-result-object p0

    .line 377
    invoke-static {v4, v5, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 378
    .line 379
    .line 380
    invoke-static {}, Ll/bsj0;->K()V

    .line 381
    .line 382
    .line 383
    const-string p0, "invalid access token"

    .line 384
    .line 385
    return-object p0

    .line 386
    :cond_11
    return-object v5

    .line 387
    :cond_12
    const-class v1, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 388
    .line 389
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 390
    .line 391
    .line 392
    move-result v1

    .line 393
    if-eqz v1, :cond_13

    .line 394
    .line 395
    return-object v5

    .line 396
    :cond_13
    const-class v1, Lcom/p1/mobile/putong/ui/share/ShareHelper$PlatformNotFoundException;

    .line 397
    .line 398
    invoke-static {p0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 399
    .line 400
    .line 401
    move-result p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 402
    if-eqz p0, :cond_14

    .line 403
    .line 404
    return-object v5

    .line 405
    :cond_14
    return-object v0

    .line 406
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 407
    .line 408
    .line 409
    return-object v0
.end method

.method public static D(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->F(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static E(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/bsj0;->C(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/App$HandledGlobally;-><init>(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    if-nez v0, :cond_1

    .line 18
    .line 19
    const-class v0, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 20
    .line 21
    invoke-static {p0, v0}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 22
    .line 23
    .line 24
    :cond_1
    return-object p0
.end method

.method public static F(Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    :try_start_0
    instance-of v0, p0, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-class v0, Lcom/tantanapp/common/network/ApiExcep$ClientExpired;

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-string v0, "e_auto_logout"

    .line 15
    .line 16
    const-string v1, ""

    .line 17
    .line 18
    const-string v2, "logout_type"

    .line 19
    .line 20
    const-string v3, "forced_update"

    .line 21
    .line 22
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    filled-new-array {v2}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {v0, v1, v2}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/bsj0;->v()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    instance-of v0, p0, Ljava/io/IOException;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    sget v0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 42
    .line 43
    invoke-static {v0}, Ll/o1j0;->n(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 48
    .line 49
    if-eqz v0, :cond_6

    .line 50
    .line 51
    move-object v0, p0

    .line 52
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 53
    .line 54
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 55
    .line 56
    const v1, 0x9c40

    .line 57
    .line 58
    .line 59
    if-ne v0, v1, :cond_3

    .line 60
    .line 61
    invoke-static {p0}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    const v1, 0x9c80

    .line 66
    .line 67
    .line 68
    if-ne v0, v1, :cond_4

    .line 69
    .line 70
    sget v0, Lcom/p1/mobile/putong/common/R$string;->X:I

    .line 71
    .line 72
    invoke-static {v0}, Ll/r1j0;->f(I)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_4
    invoke-static {v0}, Ll/bsj0;->l(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    if-nez v0, :cond_5

    .line 81
    .line 82
    invoke-static {p0}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_5
    const/4 v1, 0x1

    .line 87
    invoke-static {v0, v1}, Ll/o1j0;->k(Ljava/lang/String;Z)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_6
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 92
    .line 93
    if-eqz v0, :cond_7

    .line 94
    .line 95
    move-object v0, p0

    .line 96
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 97
    .line 98
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 99
    .line 100
    invoke-static {v0, p0}, Ll/bsj0;->B(ILjava/lang/Throwable;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_7
    instance-of v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$PlatformNotFoundException;

    .line 105
    .line 106
    if-eqz v0, :cond_8

    .line 107
    .line 108
    sget v0, Lcom/p1/mobile/putong/common/R$string;->a2:I

    .line 109
    .line 110
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_8
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 115
    .line 116
    if-eqz v0, :cond_9

    .line 117
    .line 118
    move-object v0, p0

    .line 119
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isBlocked()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_9

    .line 126
    .line 127
    sget v0, Lcom/p1/mobile/putong/common/R$string;->V0:I

    .line 128
    .line 129
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_9
    invoke-static {p0}, Ll/bsj0;->G(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :catch_0
    invoke-static {p0}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public static G(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget v0, Lcom/p1/mobile/putong/common/R$string;->R:I

    .line 9
    .line 10
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static H(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static I(Landroid/widget/TextView;)I
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jyb;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    return p0

    .line 18
    :catch_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public static J(Lcom/p1/mobile/putong/data/QualificationType;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const-string v1, "BACHELOR"

    .line 6
    .line 7
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_2

    .line 12
    .line 13
    const-string v1, "MASTER"

    .line 14
    .line 15
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    const-string v1, "DOCTOR"

    .line 22
    .line 23
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return v0

    .line 31
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public static K()V
    .locals 1

    .line 1
    new-instance v0, Ll/urj0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/urj0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static L(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 8
    .line 9
    sget v0, Lcom/p1/mobile/putong/common/R$string;->f2:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->ILLEGAL_NAME_PATTERN()Ljava/util/regex/Pattern;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 31
    .line 32
    sget v0, Lcom/p1/mobile/putong/common/R$string;->h2:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->NAME_PATTERN()Ljava/util/regex/Pattern;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/4 v1, 0x0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const-string v0, "\u3164"

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    return-object v1

    .line 64
    :cond_3
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->ThAI_NAME_PATTERN()Ljava/util/regex/Pattern;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_4

    .line 77
    .line 78
    return-object v1

    .line 79
    :cond_4
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 80
    .line 81
    sget v0, Lcom/p1/mobile/putong/common/R$string;->g2:I

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method

.method public static M(Landroid/widget/TextView;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jyb;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static N()Ljava/util/Date;
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "ko"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget v0, Lcom/p1/mobile/putong/data/User;->AGE_MAX_KOREAN:I

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bsj0;->n(IZ)Ljava/util/Date;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    return-object v0

    .line 25
    :cond_0
    sget v0, Lcom/p1/mobile/putong/data/User;->AGE_MAX:I

    .line 26
    .line 27
    invoke-static {v0}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    return-object v0
.end method

.method public static final O()Ljava/util/regex/Pattern;
    .locals 10

    .line 1
    const-string v8, "w\\W*\u4fe1"

    .line 2
    .line 3
    const-string v9, "v\\W*\u4fe1"

    .line 4
    .line 5
    const-string v0, "V\\W*X"

    .line 6
    .line 7
    const-string v1, "w\\W*e\\W*c\\W*h\\W*a\\W*t"

    .line 8
    .line 9
    const-string v2, "w\\W*e\\W*i\\W*x\\W*i\\W*n"

    .line 10
    .line 11
    const-string v3, "w\\W*x"

    .line 12
    .line 13
    const-string v4, "q\\W*q"

    .line 14
    .line 15
    const-string v5, "\u5fae\\W*\u4fe1"

    .line 16
    .line 17
    const-string v6, "w\\W*x\\W*i\\W*n"

    .line 18
    .line 19
    const-string v7, "v\\W*x\\W*i\\W*n"

    .line 20
    .line 21
    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "|"

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->V([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x2

    .line 32
    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    return-object v0
.end method

.method public static final P()Ljava/util/regex/Pattern;
    .locals 67

    .line 1
    const-string v65, "\u9910\u5385"

    .line 2
    .line 3
    const-string v66, "\u5a18\u5a18"

    .line 4
    .line 5
    const-string v1, "\u5357\u5bab"

    .line 6
    .line 7
    const-string v2, "\u738b\u4e45"

    .line 8
    .line 9
    const-string v3, "jiafen"

    .line 10
    .line 11
    const-string v4, "\u52a0\u7c89"

    .line 12
    .line 13
    const-string v5, "\u8d5a\u6cd5"

    .line 14
    .line 15
    const-string v6, "\u4e3b\u4efb"

    .line 16
    .line 17
    const-string v7, "\u59d4\u5458"

    .line 18
    .line 19
    const-string v8, "\u7a7a\u8c03"

    .line 20
    .line 21
    const-string v9, "\u4e2d\u4ecb"

    .line 22
    .line 23
    const-string v10, "\u6c99\u53bf"

    .line 24
    .line 25
    const-string v11, "\u5997\u5b50"

    .line 26
    .line 27
    const-string v12, "\u5351\u9119"

    .line 28
    .line 29
    const-string v13, "\u4e13\u7ebf"

    .line 30
    .line 31
    const-string v14, "\u7caa"

    .line 32
    .line 33
    const-string v15, "\u5e08\u5085"

    .line 34
    .line 35
    const-string v16, "\u8001\u5e08"

    .line 36
    .line 37
    const-string v17, "\u4fdd\u59c6"

    .line 38
    .line 39
    const-string v18, "\u963f\u59e8"

    .line 40
    .line 41
    const-string v19, "\u535a\u58eb"

    .line 42
    .line 43
    const-string v20, "\u5f8b\u5e08"

    .line 44
    .line 45
    const-string v21, "\u533b\u751f"

    .line 46
    .line 47
    const-string v22, "\u5927\u54e5"

    .line 48
    .line 49
    const-string v23, "\u5927\u59d0"

    .line 50
    .line 51
    const-string v24, "\u7238"

    .line 52
    .line 53
    const-string v25, "\u7239"

    .line 54
    .line 55
    const-string v26, "\u5988"

    .line 56
    .line 57
    const-string v27, "\u5abd"

    .line 58
    .line 59
    const-string v28, "\u7236"

    .line 60
    .line 61
    const-string v29, "\u6bcd"

    .line 62
    .line 63
    const-string v30, "\u9ebb\u9ebb"

    .line 64
    .line 65
    const-string v31, "\u59d1"

    .line 66
    .line 67
    const-string v32, "\u59e8"

    .line 68
    .line 69
    const-string v33, "\u53d4"

    .line 70
    .line 71
    const-string v34, "\u4f2f"

    .line 72
    .line 73
    const-string v35, "\u8205"

    .line 74
    .line 75
    const-string v36, "\u7237"

    .line 76
    .line 77
    const-string v37, "\u5976"

    .line 78
    .line 79
    const-string v38, "\u5a76"

    .line 80
    .line 81
    const-string v39, "\u5ac2"

    .line 82
    .line 83
    const-string v40, "\u59e5"

    .line 84
    .line 85
    const-string v41, "\u59bb"

    .line 86
    .line 87
    const-string v42, "\u516c\u516c"

    .line 88
    .line 89
    const-string v43, "\u5a46"

    .line 90
    .line 91
    const-string v44, "\u5ab3"

    .line 92
    .line 93
    const-string v45, "\u514d\u8d39"

    .line 94
    .line 95
    const-string v46, "\u529e"

    .line 96
    .line 97
    const-string v47, "\u8089"

    .line 98
    .line 99
    const-string v48, "\u5305\u5b50"

    .line 100
    .line 101
    const-string v49, "\u997a"

    .line 102
    .line 103
    const-string v50, "\u996d"

    .line 104
    .line 105
    const-string v51, "\u8b66"

    .line 106
    .line 107
    const-string v52, "\u90e8\u957f"

    .line 108
    .line 109
    const-string v53, "\u5e02\u957f"

    .line 110
    .line 111
    const-string v54, "\u7701\u957f"

    .line 112
    .line 113
    const-string v55, "\u533a\u957f"

    .line 114
    .line 115
    const-string v56, "\u53bf\u957f"

    .line 116
    .line 117
    const-string v57, "\u4e66\u8bb0"

    .line 118
    .line 119
    const-string v58, "\u5904\u957f"

    .line 120
    .line 121
    const-string v59, "\u79d1\u957f"

    .line 122
    .line 123
    const-string v60, "\u961f\u957f"

    .line 124
    .line 125
    const-string v61, "\u9662\u957f"

    .line 126
    .line 127
    const-string v62, "\u5e02\u653f"

    .line 128
    .line 129
    const-string v63, "\u5c40\u957f"

    .line 130
    .line 131
    const-string v64, "\u6821\u957f"

    .line 132
    .line 133
    filled-new-array/range {v1 .. v66}, [Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    const-string v1, "|"

    .line 138
    .line 139
    invoke-static {v0, v1}, Ll/jyb;->V([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    const/4 v1, 0x2

    .line 144
    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    return-object v0
.end method

.method public static Q()V
    .locals 3

    .line 1
    sget v0, Ll/bsj0;->c:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    sput v0, Ll/bsj0;->c:I

    .line 6
    .line 7
    const/16 v2, 0xa

    .line 8
    .line 9
    if-ge v0, v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/vrj0;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/vrj0;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ll/wrj0;

    .line 34
    .line 35
    invoke-direct {v2}, Ll/wrj0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static R(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget v0, Ll/w7c0;->f:I

    .line 2
    .line 3
    sget v1, Ll/w7c0;->g:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static S(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget v0, Ll/w7c0;->h:I

    .line 2
    .line 3
    sget v1, Ll/w7c0;->i:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static T(Landroid/view/ViewGroup;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    instance-of v3, v2, Landroid/widget/Checkable;

    .line 14
    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    check-cast v2, Landroid/widget/Checkable;

    .line 18
    .line 19
    invoke-interface {v2}, Landroid/widget/Checkable;->toggle()V

    .line 20
    .line 21
    .line 22
    invoke-interface {v2}, Landroid/widget/Checkable;->isChecked()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const-string p0, "must have a checkable child"

    .line 31
    .line 32
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return v0
.end method

.method public static U(Ll/kcg0;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kcg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static V()Ljava/util/Date;
    .locals 3

    .line 1
    sget v0, Lcom/p1/mobile/putong/data/User;->AGE_MIN_GOOGLEPLAY:I

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "ko"

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    sget v0, Lcom/p1/mobile/putong/data/User;->AGE_MIN_KOREAN:I

    .line 20
    .line 21
    :cond_0
    invoke-static {v0}, Ll/bsj0;->m(I)Ljava/util/Date;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic a(Landroid/app/Activity;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "showMaybeNeedsUpdateDialog"

    .line 2
    .line 3
    const-string v0, "click to app market"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-static {p0}, Ll/uxw;->d(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic b(Landroid/text/Spannable;)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/bsj0;->w(Ljava/lang/String;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const-class v2, Landroid/text/style/BackgroundColorSpan;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-interface {p0, v3, v1, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, [Landroid/text/style/BackgroundColorSpan;

    .line 21
    .line 22
    move v2, v3

    .line 23
    :goto_0
    array-length v4, v1

    .line 24
    if-ge v2, v4, :cond_0

    .line 25
    .line 26
    aget-object v4, v1, v2

    .line 27
    .line 28
    invoke-interface {p0, v4}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return-object p0

    .line 42
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Landroid/graphics/Point;

    .line 57
    .line 58
    new-instance v2, Landroid/text/style/BackgroundColorSpan;

    .line 59
    .line 60
    const/16 v4, -0x6634

    .line 61
    .line 62
    invoke-direct {v2, v4}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    .line 63
    .line 64
    .line 65
    iget v4, v1, Landroid/graphics/Point;->x:I

    .line 66
    .line 67
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 68
    .line 69
    invoke-interface {p0, v2, v4, v1, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 74
    .line 75
    sget v0, Lcom/p1/mobile/putong/common/R$string;->M1:I

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method

.method public static synthetic c(Landroid/text/Spannable;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Ll/bsj0;->e:Ljava/util/regex/Pattern;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 21
    .line 22
    sget v0, Lcom/p1/mobile/putong/common/R$string;->N1:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "*"

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Lv/VScroll;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sub-int/2addr p0, v0

    .line 18
    if-lez p0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p1, v0, p0}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic f(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    sput p0, Ll/bsj0;->c:I

    .line 3
    .line 4
    sput-boolean p0, Ll/bsj0;->b:Z

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 2

    .line 1
    sget-boolean v0, Ll/bsj0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-nez p0, :cond_1

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/app/Activity;

    .line 16
    .line 17
    if-nez p0, :cond_2

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_2
    const/4 v0, 0x1

    .line 21
    sput-boolean v0, Ll/bsj0;->b:Z

    .line 22
    .line 23
    new-instance v1, Ll/th0$a;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget v1, Lcom/p1/mobile/putong/common/R$string;->D2:I

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget v1, Lcom/p1/mobile/putong/common/R$string;->k2:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/common/R$string;->l2:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sget v1, Lcom/p1/mobile/putong/common/R$string;->a:I

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/xrj0;

    .line 61
    .line 62
    invoke-direct {v1}, Ll/xrj0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/yrj0;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/yrj0;-><init>(Landroid/app/Activity;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public static synthetic h(Landroid/text/Spannable;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Ll/bsj0;->h:Ljava/util/regex/Pattern;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    :goto_0
    const/4 p0, 0x0

    .line 21
    return-object p0

    .line 22
    :cond_1
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 23
    .line 24
    sget v0, Lcom/p1/mobile/putong/common/R$string;->c3:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic i()V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Lcom/p1/mobile/putong/common/R$string;->B:I

    .line 10
    .line 11
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {v0, v0}, Ll/uqb0;->Z0(ZZ)Lrx/c;

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic j(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "*"

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static l(I)Ljava/lang/String;
    .locals 1

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    packed-switch p0, :pswitch_data_1

    .line 5
    .line 6
    .line 7
    sparse-switch p0, :sswitch_data_0

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    goto :goto_0

    .line 12
    :sswitch_0
    sget p0, Lcom/p1/mobile/putong/common/R$string;->d3:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_1
    sget p0, Lcom/p1/mobile/putong/common/R$string;->y:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :sswitch_2
    sget p0, Lcom/p1/mobile/putong/common/R$string;->d3:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :pswitch_0
    sget p0, Lcom/p1/mobile/putong/common/R$string;->J:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :pswitch_1
    :sswitch_3
    sget p0, Lcom/p1/mobile/putong/common/R$string;->A:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :pswitch_2
    sget p0, Lcom/p1/mobile/putong/common/R$string;->z:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :pswitch_3
    sget p0, Lcom/p1/mobile/putong/common/R$string;->O:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :pswitch_4
    sget p0, Lcom/p1/mobile/putong/common/R$string;->K:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :pswitch_5
    sget p0, Lcom/p1/mobile/putong/common/R$string;->N:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :pswitch_6
    sget p0, Lcom/p1/mobile/putong/common/R$string;->L:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :pswitch_7
    sget p0, Lcom/p1/mobile/putong/common/R$string;->E0:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :pswitch_8
    sget p0, Lcom/p1/mobile/putong/common/R$string;->P:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :pswitch_9
    sget p0, Lcom/p1/mobile/putong/common/R$string;->M:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :pswitch_a
    sget p0, Lcom/p1/mobile/putong/common/R$string;->C:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :pswitch_b
    sget p0, Lcom/p1/mobile/putong/common/R$string;->I:I

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :pswitch_c
    sget p0, Lcom/p1/mobile/putong/common/R$string;->g2:I

    .line 58
    .line 59
    :goto_0
    if-nez p0, :cond_0

    .line 60
    .line 61
    const/4 p0, 0x0

    .line 62
    return-object p0

    .line 63
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 64
    .line 65
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    nop

    .line 75
    :pswitch_data_0
    .packed-switch 0x9c47
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    :pswitch_data_1
    .packed-switch 0x9c52
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0x9c7c -> :sswitch_2
        0x9c7f -> :sswitch_1
        0x9c9b -> :sswitch_3
        0x9c9f -> :sswitch_0
    .end sparse-switch
.end method

.method public static m(I)Ljava/util/Date;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Converter;->CALENDAR:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/Calendar;

    .line 8
    .line 9
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    sub-int/2addr v2, p0

    .line 24
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 25
    .line 26
    .line 27
    const/16 p0, 0xa

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 31
    .line 32
    .line 33
    const/16 p0, 0xc

    .line 34
    .line 35
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 36
    .line 37
    .line 38
    const/16 p0, 0xd

    .line 39
    .line 40
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 41
    .line 42
    .line 43
    const/16 p0, 0xe

    .line 44
    .line 45
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 46
    .line 47
    .line 48
    new-instance p0, Ljava/util/Date;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    invoke-direct {p0, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 55
    .line 56
    .line 57
    return-object p0
.end method

.method public static n(IZ)Ljava/util/Date;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Converter;->CALENDAR:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/Calendar;

    .line 8
    .line 9
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    sub-int/2addr v2, p0

    .line 24
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 25
    .line 26
    .line 27
    const/16 p0, 0xc

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    move v3, p0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v3, v2

    .line 35
    :goto_0
    const/4 v4, 0x2

    .line 36
    invoke-virtual {v0, v4, v3}, Ljava/util/Calendar;->set(II)V

    .line 37
    .line 38
    .line 39
    const/4 v3, 0x5

    .line 40
    xor-int/2addr p1, v1

    .line 41
    invoke-virtual {v0, v3, p1}, Ljava/util/Calendar;->set(II)V

    .line 42
    .line 43
    .line 44
    const/16 p1, 0xa

    .line 45
    .line 46
    invoke-virtual {v0, p1, v2}, Ljava/util/Calendar;->set(II)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p0, v2}, Ljava/util/Calendar;->set(II)V

    .line 50
    .line 51
    .line 52
    const/16 p0, 0xd

    .line 53
    .line 54
    invoke-virtual {v0, p0, v2}, Ljava/util/Calendar;->set(II)V

    .line 55
    .line 56
    .line 57
    const/16 p0, 0xe

    .line 58
    .line 59
    invoke-virtual {v0, p0, v2}, Ljava/util/Calendar;->set(II)V

    .line 60
    .line 61
    .line 62
    new-instance p0, Ljava/util/Date;

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    invoke-direct {p0, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 69
    .line 70
    .line 71
    return-object p0
.end method

.method public static o(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p2, v0}, Ll/t43;->a(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    new-instance p2, Landroid/graphics/Canvas;

    .line 7
    .line 8
    invoke-direct {p2, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p1}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public static p(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    const/high16 v0, 0x41400000    # 12.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p0, p1, p2, p3, v0}, Ll/bsj0;->q(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static q(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;
    .locals 15
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    move/from16 v0, p4

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x4

    .line 16
    if-lt v1, v2, :cond_8

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-ge v1, v2, :cond_1

    .line 23
    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :cond_1
    move/from16 v1, p2

    .line 27
    .line 28
    int-to-float v1, v1

    .line 29
    const/high16 v3, 0x3f800000    # 1.0f

    .line 30
    .line 31
    mul-float v4, v1, v3

    .line 32
    .line 33
    move/from16 v5, p1

    .line 34
    .line 35
    int-to-float v5, v5

    .line 36
    div-float/2addr v4, v5

    .line 37
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    int-to-float v6, v6

    .line 42
    mul-float/2addr v6, v3

    .line 43
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    int-to-float v7, v7

    .line 48
    div-float/2addr v6, v7

    .line 49
    cmpl-float v4, v4, v6

    .line 50
    .line 51
    const/4 v6, 0x1

    .line 52
    if-lez v4, :cond_2

    .line 53
    .line 54
    move v4, v6

    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const/4 v4, 0x0

    .line 57
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    int-to-float v7, v7

    .line 62
    mul-float/2addr v7, v3

    .line 63
    div-float/2addr v7, v5

    .line 64
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 65
    .line 66
    .line 67
    move-result v8

    .line 68
    int-to-float v8, v8

    .line 69
    mul-float/2addr v8, v3

    .line 70
    div-float/2addr v8, v1

    .line 71
    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    const/4 v7, 0x2

    .line 80
    invoke-static {v0, v7}, Ljava/lang/Math;->max(II)I

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    int-to-float v7, v7

    .line 85
    const/high16 v8, 0x3e800000    # 0.25f

    .line 86
    .line 87
    div-float/2addr v8, v7

    .line 88
    const/high16 v7, 0x40000000    # 2.0f

    .line 89
    .line 90
    mul-float/2addr v8, v7

    .line 91
    const/high16 v9, 0x3f000000    # 0.5f

    .line 92
    .line 93
    invoke-static {v1, v9}, Ljava/lang/Math;->min(FF)F

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-static {v1, v8}, Ljava/lang/Math;->max(FF)F

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-nez v4, :cond_5

    .line 102
    .line 103
    mul-float/2addr v1, v5

    .line 104
    float-to-int v1, v1

    .line 105
    div-int/lit8 v4, v1, 0x4

    .line 106
    .line 107
    mul-int/2addr v4, v2

    .line 108
    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    int-to-float v2, v1

    .line 113
    mul-float/2addr v2, v3

    .line 114
    div-float/2addr v2, v5

    .line 115
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    int-to-float v3, v3

    .line 120
    mul-float/2addr v3, v2

    .line 121
    const/high16 v4, 0x40800000    # 4.0f

    .line 122
    .line 123
    cmpg-float v3, v3, v4

    .line 124
    .line 125
    if-ltz v3, :cond_4

    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    int-to-float v3, v3

    .line 132
    mul-float/2addr v3, v2

    .line 133
    cmpg-float v3, v3, v4

    .line 134
    .line 135
    if-gez v3, :cond_3

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_3
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    if-eq v1, v3, :cond_4

    .line 143
    .line 144
    new-instance v13, Landroid/graphics/Matrix;

    .line 145
    .line 146
    invoke-direct {v13}, Landroid/graphics/Matrix;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v13, v2, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 153
    .line 154
    .line 155
    move-result v11

    .line 156
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 157
    .line 158
    .line 159
    move-result v12

    .line 160
    const/4 v14, 0x0

    .line 161
    const/4 v9, 0x0

    .line 162
    const/4 v10, 0x0

    .line 163
    move-object v8, p0

    .line 164
    invoke-static/range {v8 .. v14}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    :cond_4
    :goto_1
    move v1, v2

    .line 169
    :cond_5
    int-to-float v0, v0

    .line 170
    mul-float/2addr v0, v1

    .line 171
    invoke-static {v0, v7}, Ljava/lang/Math;->max(FF)F

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    const/high16 v1, 0x41c80000    # 25.0f

    .line 176
    .line 177
    cmpl-float v2, v0, v1

    .line 178
    .line 179
    if-lez v2, :cond_6

    .line 180
    .line 181
    move v0, v1

    .line 182
    :cond_6
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    invoke-static {p0, v0, v6}, Ll/t43;->a(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isMutable()Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-nez v0, :cond_7

    .line 195
    .line 196
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {p0, v0, v6}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    :cond_7
    new-instance v0, Landroid/graphics/Canvas;

    .line 205
    .line 206
    invoke-direct {v0, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 207
    .line 208
    .line 209
    move/from16 v1, p3

    .line 210
    .line 211
    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 212
    .line 213
    .line 214
    :cond_8
    :goto_2
    return-object p0
.end method

.method public static r(Landroid/view/View;)Landroid/animation/Animator;
    .locals 11

    .line 1
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 2
    .line 3
    new-instance v6, Landroid/view/animation/DecelerateInterpolator;

    .line 4
    .line 5
    invoke-direct {v6}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    new-array v7, v0, [F

    .line 10
    .line 11
    fill-array-data v7, :array_0

    .line 12
    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    const-wide/16 v4, 0xc8

    .line 17
    .line 18
    move-object v0, p0

    .line 19
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 24
    .line 25
    new-instance v6, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 26
    .line 27
    invoke-direct {v6}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 28
    .line 29
    .line 30
    const/4 v8, 0x1

    .line 31
    new-array v7, v8, [F

    .line 32
    .line 33
    const/4 v9, 0x0

    .line 34
    const v2, 0x3f570a3d    # 0.84f

    .line 35
    .line 36
    .line 37
    aput v2, v7, v9

    .line 38
    .line 39
    const-wide/16 v2, 0x0

    .line 40
    .line 41
    const-wide/16 v4, 0x12c

    .line 42
    .line 43
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object v10

    .line 47
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 48
    .line 49
    new-instance v6, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 50
    .line 51
    invoke-direct {v6}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 52
    .line 53
    .line 54
    new-array v7, v8, [F

    .line 55
    .line 56
    const/high16 v2, 0x3f800000    # 1.0f

    .line 57
    .line 58
    aput v2, v7, v9

    .line 59
    .line 60
    const-wide/16 v2, 0x0

    .line 61
    .line 62
    const-wide/16 v4, 0xc8

    .line 63
    .line 64
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    filled-new-array {p0, v10, v0}, [Landroid/animation/Animator;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f99999a    # 1.2f
    .end array-data
.end method

.method public static s(Lcom/p1/mobile/android/app/Act;Lv/VScroll;)V
    .locals 3

    .line 1
    new-instance v0, Ll/trj0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/trj0;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VScroll;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x96

    .line 7
    .line 8
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static t(Landroid/view/ViewGroup;Z)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    instance-of v3, v2, Landroid/widget/Checkable;

    .line 14
    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    check-cast v2, Landroid/widget/Checkable;

    .line 18
    .line 19
    invoke-interface {v2, p1}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v2}, Landroid/widget/Checkable;->isChecked()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const-string p0, "must have a checkable child"

    .line 31
    .line 32
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return v0
.end method

.method public static u(Landroid/view/ViewGroup;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    instance-of v3, v2, Landroid/widget/Checkable;

    .line 14
    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    check-cast v2, Landroid/widget/Checkable;

    .line 18
    .line 19
    invoke-interface {v2}, Landroid/widget/Checkable;->isChecked()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string p0, "must have a checkable child"

    .line 28
    .line 29
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return v0
.end method

.method public static v()V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->clientNeedsForceUpdate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static w(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroid/graphics/Point;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/bsj0;->a:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->b0(Ljava/util/regex/Matcher;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ll/bsj0;->d:Ljava/util/regex/Pattern;

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/jyb;->b0(Ljava/util/regex/Matcher;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x2

    .line 22
    new-array v1, v1, [Ljava/util/List;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    aput-object v0, v1, v2

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    aput-object p0, v1, v0

    .line 29
    .line 30
    invoke-static {v1}, Ll/jyb;->x([Ljava/util/List;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public static x(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroid/graphics/Point;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/bsj0;->d:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/jyb;->b0(Ljava/util/regex/Matcher;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x1

    .line 12
    new-array v0, v0, [Ljava/util/List;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    aput-object p0, v0, v1

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->x([Ljava/util/List;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static y(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    const-string v0, " "

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    array-length v0, p0

    .line 8
    add-int/lit8 v0, v0, -0x1

    .line 9
    .line 10
    aget-object p0, p0, v0

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const-string v1, ""

    .line 17
    .line 18
    const/4 v2, 0x5

    .line 19
    if-gt v0, v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {p0}, Ll/jyb;->a0(I)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Ll/zrj0;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/zrj0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0, v1}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    const/4 v4, 0x3

    .line 50
    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    sub-int/2addr v3, v2

    .line 62
    invoke-static {v3}, Ll/jyb;->a0(I)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    new-instance v3, Ll/orj0;

    .line 67
    .line 68
    invoke-direct {v3}, Ll/orj0;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-static {v2, v3}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v2, v1}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    add-int/lit8 v1, v1, -0x2

    .line 87
    .line 88
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0
.end method

.method public static z(Ljava/lang/Throwable;)I
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/tantanapp/common/network/ApiExcep;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/tantanapp/common/network/ApiExcep;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/network/ApiExcep;->response:Ll/i5d0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method
