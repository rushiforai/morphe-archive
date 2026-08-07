.class public Lcom/tantanapp/common/network/ExceptionChecker;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "ExceptionChecker"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static check(Ll/i5d0;)Ljava/lang/Exception;
    .locals 4

    .line 1
    const-string v0, "Putong-Client-Version-Expires-At"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "-1"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$ClientExpired;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$ClientExpired;-><init>(Ll/i5d0;)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    sget-boolean v0, Ll/kmk0;->b:Z

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const-string v0, "X-RateLimit-Remaining"

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    sget-object v0, Ll/kmk0;->a:Ljava/lang/String;

    .line 34
    .line 35
    :cond_1
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    div-int/lit8 v1, v0, 0x64

    .line 40
    .line 41
    const/4 v2, 0x2

    .line 42
    if-ne v1, v2, :cond_2

    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    return-object p0

    .line 46
    :cond_2
    const/16 v2, 0x190

    .line 47
    .line 48
    if-ne v0, v2, :cond_3

    .line 49
    .line 50
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$BadRequest;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Client$BadRequest;-><init>(Ll/i5d0;)V

    .line 53
    .line 54
    .line 55
    return-object v0

    .line 56
    :cond_3
    const/16 v2, 0x191

    .line 57
    .line 58
    if-ne v0, v2, :cond_4

    .line 59
    .line 60
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;-><init>(Ll/i5d0;)V

    .line 63
    .line 64
    .line 65
    return-object v0

    .line 66
    :cond_4
    const/16 v2, 0x193

    .line 67
    .line 68
    if-ne v0, v2, :cond_5

    .line 69
    .line 70
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$Forbidden;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Client$Forbidden;-><init>(Ll/i5d0;)V

    .line 73
    .line 74
    .line 75
    return-object v0

    .line 76
    :cond_5
    const/16 v2, 0x194

    .line 77
    .line 78
    if-ne v0, v2, :cond_6

    .line 79
    .line 80
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;-><init>(Ll/i5d0;)V

    .line 83
    .line 84
    .line 85
    return-object v0

    .line 86
    :cond_6
    const/16 v2, 0x195

    .line 87
    .line 88
    if-ne v0, v2, :cond_7

    .line 89
    .line 90
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$MethodNotAllowed;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Client$MethodNotAllowed;-><init>(Ll/i5d0;)V

    .line 93
    .line 94
    .line 95
    return-object v0

    .line 96
    :cond_7
    const/16 v2, 0x199

    .line 97
    .line 98
    if-ne v0, v2, :cond_8

    .line 99
    .line 100
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$Conflict;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Client$Conflict;-><init>(Ll/i5d0;)V

    .line 103
    .line 104
    .line 105
    return-object v0

    .line 106
    :cond_8
    const/16 v2, 0x19a

    .line 107
    .line 108
    if-ne v0, v2, :cond_9

    .line 109
    .line 110
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$Gone;

    .line 111
    .line 112
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Client$Gone;-><init>(Ll/i5d0;)V

    .line 113
    .line 114
    .line 115
    return-object v0

    .line 116
    :cond_9
    const/16 v2, 0x19d

    .line 117
    .line 118
    if-ne v0, v2, :cond_a

    .line 119
    .line 120
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$RequestEntityTooLarge;

    .line 121
    .line 122
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Client$RequestEntityTooLarge;-><init>(Ll/i5d0;)V

    .line 123
    .line 124
    .line 125
    return-object v0

    .line 126
    :cond_a
    const/16 v2, 0x19f

    .line 127
    .line 128
    if-ne v0, v2, :cond_b

    .line 129
    .line 130
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$UnsupportedMediaType;

    .line 131
    .line 132
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Client$UnsupportedMediaType;-><init>(Ll/i5d0;)V

    .line 133
    .line 134
    .line 135
    return-object v0

    .line 136
    :cond_b
    const/16 v2, 0x1a2

    .line 137
    .line 138
    if-ne v0, v2, :cond_c

    .line 139
    .line 140
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$ImATeapot;

    .line 141
    .line 142
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Client$ImATeapot;-><init>(Ll/i5d0;)V

    .line 143
    .line 144
    .line 145
    return-object v0

    .line 146
    :cond_c
    const/16 v2, 0x1a6

    .line 147
    .line 148
    if-ne v0, v2, :cond_d

    .line 149
    .line 150
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$UnprocessableEntity;

    .line 151
    .line 152
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Client$UnprocessableEntity;-><init>(Ll/i5d0;)V

    .line 153
    .line 154
    .line 155
    return-object v0

    .line 156
    :cond_d
    const/16 v2, 0x1ad

    .line 157
    .line 158
    const/4 v3, 0x5

    .line 159
    if-ne v0, v2, :cond_f

    .line 160
    .line 161
    const-string v0, "X-RateLimit-Reset"

    .line 162
    .line 163
    invoke-virtual {p0, v0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    if-eqz v0, :cond_e

    .line 168
    .line 169
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    const/16 v1, 0xa

    .line 174
    .line 175
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    new-instance v1, Lcom/tantanapp/common/network/ApiExcep$Client$TooManyRequests;

    .line 180
    .line 181
    invoke-direct {v1, p0, v0}, Lcom/tantanapp/common/network/ApiExcep$Client$TooManyRequests;-><init>(Ll/i5d0;I)V

    .line 182
    .line 183
    .line 184
    return-object v1

    .line 185
    :cond_e
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Client$TooManyRequests;

    .line 186
    .line 187
    invoke-direct {v0, p0, v3}, Lcom/tantanapp/common/network/ApiExcep$Client$TooManyRequests;-><init>(Ll/i5d0;I)V

    .line 188
    .line 189
    .line 190
    return-object v0

    .line 191
    :cond_f
    if-ne v1, v3, :cond_10

    .line 192
    .line 193
    new-instance v0, Lcom/tantanapp/common/network/ApiExcep$Server;

    .line 194
    .line 195
    invoke-direct {v0, p0}, Lcom/tantanapp/common/network/ApiExcep$Server;-><init>(Ll/i5d0;)V

    .line 196
    .line 197
    .line 198
    return-object v0

    .line 199
    :cond_10
    new-instance p0, Ljava/lang/Exception;

    .line 200
    .line 201
    new-instance v1, Ljava/lang/StringBuilder;

    .line 202
    .line 203
    const-string v2, "code: "

    .line 204
    .line 205
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    return-object p0
.end method

.method public static inputStreamAfterCheck(Ll/i5d0;)Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xcc

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/k5d0;->byteStream()Ljava/io/InputStream;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method
