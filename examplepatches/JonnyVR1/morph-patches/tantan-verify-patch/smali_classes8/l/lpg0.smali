.class public final Ll/lpg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/fhg0;

.field public final synthetic f:Ll/uyg0;


# direct methods
.method public constructor <init>(Ll/uyg0;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/fhg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lpg0;->f:Ll/uyg0;

    .line 2
    .line 3
    iput-wide p2, p0, Ll/lpg0;->a:J

    .line 4
    .line 5
    iput-object p4, p0, Ll/lpg0;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p5, p0, Ll/lpg0;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p6, p0, Ll/lpg0;->d:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p7, p0, Ll/lpg0;->e:Ll/fhg0;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    new-instance v1, Ltech/sud/gip/core/GameInfo;

    .line 2
    .line 3
    invoke-direct {v1}, Ltech/sud/gip/core/GameInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v2, Ll/ukg0;

    .line 7
    .line 8
    const-string v0, "getAuthMGInfo"

    .line 9
    .line 10
    invoke-direct {v2, v0}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-wide v3, p0, Ll/lpg0;->a:J

    .line 14
    .line 15
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, v2, Ll/ukg0;->g:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v6, Ll/bxg0;

    .line 22
    .line 23
    invoke-direct {v6}, Ll/bxg0;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v6, v2, Ll/ukg0;->n:Ll/bxg0;

    .line 27
    .line 28
    const/4 v9, 0x0

    .line 29
    const/4 v10, 0x0

    .line 30
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 31
    .line 32
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v3, "sdk_token"

    .line 36
    .line 37
    iget-object v4, p0, Ll/lpg0;->b:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    const-string v3, "authorization_secret"

    .line 43
    .line 44
    iget-object v4, p0, Ll/lpg0;->c:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    const-string v3, "mg_id"

    .line 50
    .line 51
    iget-wide v4, p0, Ll/lpg0;->a:J

    .line 52
    .line 53
    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    const-string v3, "client_version"

    .line 57
    .line 58
    invoke-virtual {v0, v3, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    const-string v3, "platform"

    .line 62
    .line 63
    sget-object v4, Ll/utg0;->a:Ljava/lang/String;

    .line 64
    .line 65
    const/4 v4, 0x2

    .line 66
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 67
    .line 68
    .line 69
    const-string v3, "uengine_version"

    .line 70
    .line 71
    const-string v4, "2022.3.62f2c1"

    .line 72
    .line 73
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    .line 75
    .line 76
    const-string v3, "user_id"

    .line 77
    .line 78
    sget-object v4, Ll/fug0;->a:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    const-string v3, "room_id"

    .line 84
    .line 85
    iget-object v4, p0, Ll/lpg0;->d:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    iget-object v0, p0, Ll/lpg0;->f:Ll/uyg0;

    .line 95
    .line 96
    iget-object v3, v0, Ll/uyg0;->g:Ljava/lang/String;

    .line 97
    .line 98
    iget-object v5, v2, Ll/ukg0;->c:Ljava/lang/String;

    .line 99
    .line 100
    const/4 v7, 0x0

    .line 101
    const/4 v8, 0x0

    .line 102
    invoke-static/range {v3 .. v8}, Ll/uyg0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    new-instance v3, Lorg/json/JSONObject;

    .line 107
    .line 108
    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    const-string v0, "ret_code"

    .line 112
    .line 113
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 117
    :try_start_1
    const-string v0, "ret_msg"

    .line 118
    .line 119
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v10

    .line 123
    iget-object v0, p0, Ll/lpg0;->f:Ll/uyg0;

    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    .line 127
    .line 128
    invoke-static {v3, v1}, Ll/uyg0;->w(Lorg/json/JSONObject;Ltech/sud/gip/core/GameInfo;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :catch_0
    move-exception v0

    .line 133
    goto :goto_0

    .line 134
    :catch_1
    move-exception v0

    .line 135
    move v4, v9

    .line 136
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    const-string v5, "authMgInfo error :"

    .line 139
    .line 140
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    sget-object v5, Ll/uyg0;->p:Ljava/lang/String;

    .line 155
    .line 156
    invoke-static {v5, v3}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    const-string v5, "HttpService"

    .line 160
    .line 161
    invoke-static {v5, v3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    if-nez v4, :cond_0

    .line 165
    .line 166
    invoke-static {v0}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v10

    .line 174
    :cond_0
    :goto_1
    iput v4, v2, Ll/ukg0;->e:I

    .line 175
    .line 176
    if-eqz v10, :cond_1

    .line 177
    .line 178
    iput-object v10, v2, Ll/ukg0;->f:Ljava/lang/String;

    .line 179
    .line 180
    :cond_1
    iget-object v0, v2, Ll/ukg0;->a:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {v2}, Ll/ukg0;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    new-instance v3, Ll/nog0;

    .line 187
    .line 188
    invoke-direct {v3, v2, v9, v0, v4}, Ll/nog0;-><init>(Ljava/lang/String;ZLjava/lang/String;I)V

    .line 189
    .line 190
    .line 191
    invoke-static {v3}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 192
    .line 193
    .line 194
    iget-object v0, p0, Ll/lpg0;->f:Ll/uyg0;

    .line 195
    .line 196
    new-instance v2, Ll/img0;

    .line 197
    .line 198
    invoke-direct {v2, p0, v4, v1, v10}, Ll/img0;-><init>(Ll/lpg0;ILtech/sud/gip/core/GameInfo;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 202
    .line 203
    .line 204
    invoke-static {v2}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 205
    .line 206
    .line 207
    return-void
.end method
