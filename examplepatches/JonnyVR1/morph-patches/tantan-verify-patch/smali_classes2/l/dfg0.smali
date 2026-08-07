.class public final Ll/dfg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/runtime/a/a$a;


# instance fields
.field public final synthetic a:Ll/pgg0;


# direct methods
.method public constructor <init>(Ll/pgg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dfg0;->a:Ll/pgg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 6

    .line 1
    sget-object p1, Ll/ysg0;->a:Ll/twg0;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x3

    .line 7
    const-string v0, "WXGame"

    .line 8
    .line 9
    const-string v1, "\u89e6\u53d1\u4e86\uff1aonGameANRDetected"

    .line 10
    .line 11
    invoke-static {p1, v0, v1}, Ltech/sud/logger/LogUtils;->file(ILjava/lang/String;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    sget-boolean p1, Ll/mzg0;->m:Z

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/dfg0;->a:Ll/pgg0;

    .line 22
    .line 23
    iget-object p0, p0, Ll/pgg0;->h:Ll/qkg0;

    .line 24
    .line 25
    if-eqz p0, :cond_5

    .line 26
    .line 27
    new-instance p1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v0, "onGameANRDetected \u8c03\u7528\u6808\u4e3a \n"

    .line 30
    .line 31
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ljava/lang/Throwable;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    array-length v2, v0

    .line 49
    const/4 v3, 0x0

    .line 50
    :goto_1
    if-ge v3, v2, :cond_2

    .line 51
    .line 52
    aget-object v4, v0, v3

    .line 53
    .line 54
    const-string v5, "at "

    .line 55
    .line 56
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v5, "."

    .line 67
    .line 68
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v5, "("

    .line 79
    .line 80
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v5, ":"

    .line 91
    .line 92
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v4, ")\n"

    .line 103
    .line 104
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    add-int/lit8 v3, v3, 0x1

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    const-string v0, "SUDRealSudFSTAPPImpl"

    .line 122
    .line 123
    invoke-static {v0, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Ll/qkg0;->a:Ll/mzg0;

    .line 127
    .line 128
    iget-object p0, p0, Ll/mzg0;->h:Ll/slg0;

    .line 129
    .line 130
    if-eqz p0, :cond_5

    .line 131
    .line 132
    check-cast p0, Ll/wyg0;

    .line 133
    .line 134
    iget-object p0, p0, Ll/wyg0;->m:Ll/bfg0;

    .line 135
    .line 136
    if-eqz p0, :cond_5

    .line 137
    .line 138
    iget-object p0, p0, Ll/bfg0;->b:Ll/dhg0;

    .line 139
    .line 140
    iget-object p1, p0, Ll/dhg0;->w:Ll/iug0;

    .line 141
    .line 142
    iget-object v0, p0, Ll/dhg0;->d:Ljava/lang/String;

    .line 143
    .line 144
    iget-wide v1, p0, Ll/dhg0;->e:J

    .line 145
    .line 146
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    .line 148
    .line 149
    new-instance p0, Ll/ukg0;

    .line 150
    .line 151
    const-string p1, "onGameANRDetected"

    .line 152
    .line 153
    invoke-direct {p0, p1}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    if-eqz v0, :cond_3

    .line 157
    .line 158
    iget-object p1, p0, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 159
    .line 160
    const-string v3, "room_id"

    .line 161
    .line 162
    invoke-virtual {p1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    :cond_3
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Ll/ukg0;->g:Ljava/lang/String;

    .line 170
    .line 171
    iget-object p1, p0, Ll/ukg0;->c:Ljava/lang/String;

    .line 172
    .line 173
    iget-object v0, p0, Ll/ukg0;->a:Ljava/lang/String;

    .line 174
    .line 175
    iget v3, p0, Ll/ukg0;->e:I

    .line 176
    .line 177
    invoke-virtual {p0}, Ll/ukg0;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    new-instance v4, Ll/nog0;

    .line 182
    .line 183
    const/4 v5, 0x1

    .line 184
    invoke-direct {v4, p0, v5, v0, v3}, Ll/nog0;-><init>(Ljava/lang/String;ZLjava/lang/String;I)V

    .line 185
    .line 186
    .line 187
    invoke-static {v4}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 188
    .line 189
    .line 190
    sget-object p0, Ll/tug0;->a:Ljava/util/concurrent/ExecutorService;

    .line 191
    .line 192
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 193
    .line 194
    .line 195
    move-result p0

    .line 196
    if-eqz p0, :cond_4

    .line 197
    .line 198
    goto :goto_3

    .line 199
    :cond_4
    :try_start_0
    new-instance p0, Lorg/json/JSONObject;

    .line 200
    .line 201
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 202
    .line 203
    .line 204
    const-string v0, "logId"

    .line 205
    .line 206
    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 207
    .line 208
    .line 209
    const-string v0, "mgId"

    .line 210
    .line 211
    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 212
    .line 213
    .line 214
    const-string v0, "TechSudMGPGlobal.sp"

    .line 215
    .line 216
    invoke-static {v0}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    const-string v3, "key_upload_anr_log_info"

    .line 221
    .line 222
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    invoke-virtual {v0, v3, p0, v5}, Ll/kjg0;->c(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    .line 228
    .line 229
    goto :goto_2

    .line 230
    :catch_0
    move-exception p0

    .line 231
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 232
    .line 233
    .line 234
    :goto_2
    invoke-static {v1, v2, v5, p1}, Ll/tug0;->b(JILjava/lang/String;)V

    .line 235
    .line 236
    .line 237
    :cond_5
    :goto_3
    return-void
.end method
