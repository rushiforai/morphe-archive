.class public final Ll/hhg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ltech/sud/gip/core/ISudListenerGetMGInfo;

.field public final synthetic f:Ll/uyg0;


# direct methods
.method public constructor <init>(Ll/uyg0;JLjava/lang/String;JLjava/lang/String;Ltech/sud/gip/core/ISudListenerGetMGInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hhg0;->f:Ll/uyg0;

    .line 2
    .line 3
    iput-wide p2, p0, Ll/hhg0;->a:J

    .line 4
    .line 5
    iput-object p4, p0, Ll/hhg0;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-wide p5, p0, Ll/hhg0;->c:J

    .line 8
    .line 9
    iput-object p7, p0, Ll/hhg0;->d:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p8, p0, Ll/hhg0;->e:Ltech/sud/gip/core/ISudListenerGetMGInfo;

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
    const-string v0, "getMGInfo"

    .line 9
    .line 10
    invoke-direct {v2, v0}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-wide v3, p0, Ll/hhg0;->a:J

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
    iget-object v4, p0, Ll/hhg0;->b:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    const-string v3, "mg_id"

    .line 43
    .line 44
    iget-wide v4, p0, Ll/hhg0;->a:J

    .line 45
    .line 46
    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    const-string v3, "client_version"

    .line 50
    .line 51
    iget-wide v4, p0, Ll/hhg0;->c:J

    .line 52
    .line 53
    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    const-string v3, "platform"

    .line 57
    .line 58
    sget-object v4, Ll/utg0;->a:Ljava/lang/String;

    .line 59
    .line 60
    const/4 v4, 0x2

    .line 61
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    const-string v3, "uengine_version"

    .line 65
    .line 66
    const-string v4, "2022.3.62f2c1"

    .line 67
    .line 68
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    const-string v3, "user_id"

    .line 72
    .line 73
    sget-object v4, Ll/fug0;->a:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    .line 77
    .line 78
    const-string v3, "room_id"

    .line 79
    .line 80
    iget-object v4, p0, Ll/hhg0;->d:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    iget-object v0, p0, Ll/hhg0;->f:Ll/uyg0;

    .line 90
    .line 91
    iget-object v3, v0, Ll/uyg0;->e:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v5, v2, Ll/ukg0;->c:Ljava/lang/String;

    .line 94
    .line 95
    const/4 v7, 0x0

    .line 96
    const/4 v8, 0x0

    .line 97
    invoke-static/range {v3 .. v8}, Ll/uyg0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    new-instance v3, Lorg/json/JSONObject;

    .line 102
    .line 103
    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    const-string v0, "ret_code"

    .line 107
    .line 108
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 112
    :try_start_1
    const-string v0, "ret_msg"

    .line 113
    .line 114
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v10

    .line 118
    invoke-static {v3, v1}, Ll/uyg0;->w(Lorg/json/JSONObject;Ltech/sud/gip/core/GameInfo;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :catch_0
    move-exception v0

    .line 123
    goto :goto_0

    .line 124
    :catch_1
    move-exception v0

    .line 125
    move v4, v9

    .line 126
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string v5, "mgInfo error :"

    .line 129
    .line 130
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v5

    .line 137
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    sget-object v5, Ll/uyg0;->p:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v5, v3}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    const-string v5, "HttpService"

    .line 150
    .line 151
    invoke-static {v5, v3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    if-nez v4, :cond_0

    .line 155
    .line 156
    invoke-static {v0}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v10

    .line 164
    :cond_0
    :goto_1
    iput v4, v2, Ll/ukg0;->e:I

    .line 165
    .line 166
    if-eqz v10, :cond_1

    .line 167
    .line 168
    iput-object v10, v2, Ll/ukg0;->f:Ljava/lang/String;

    .line 169
    .line 170
    :cond_1
    iget-object v0, v2, Ll/ukg0;->a:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {v2}, Ll/ukg0;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    new-instance v3, Ll/nog0;

    .line 177
    .line 178
    invoke-direct {v3, v2, v9, v0, v4}, Ll/nog0;-><init>(Ljava/lang/String;ZLjava/lang/String;I)V

    .line 179
    .line 180
    .line 181
    invoke-static {v3}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 182
    .line 183
    .line 184
    new-instance v0, Ll/egg0;

    .line 185
    .line 186
    invoke-direct {v0, p0, v4, v1, v10}, Ll/egg0;-><init>(Ll/hhg0;ILtech/sud/gip/core/GameInfo;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method
