.class public Lcom/tencent/could/huiyansdk/turing/e;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/turing/f;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/turing/f;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/turing/e;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/turing/e;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/tencent/could/huiyansdk/turing/f;->c:Z

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    const-string v2, "TuringSdkHelper"

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 11
    .line 12
    const-string p1, "isEndPreView is true do not need set camera data"

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    .line 19
    .line 20
    const/4 v0, 0x3

    .line 21
    if-eq p1, v0, :cond_8

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    const/4 v3, 0x4

    .line 25
    const/4 v4, 0x1

    .line 26
    if-eq p1, v3, :cond_5

    .line 27
    .line 28
    const/4 v3, 0x5

    .line 29
    if-eq p1, v3, :cond_1

    .line 30
    .line 31
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 32
    .line 33
    const-string p1, "error event"

    .line 34
    .line 35
    invoke-virtual {p0, v1, v2, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v3, "turing face timeout "

    .line 44
    .line 45
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/turing/e;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 49
    .line 50
    iget-wide v5, v3, Lcom/tencent/could/huiyansdk/turing/f;->a:J

    .line 51
    .line 52
    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {p1, v4, v2, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/turing/e;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/turing/f;->f:Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;

    .line 65
    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v2, "EnvRiskData timeout with: "

    .line 71
    .line 72
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/turing/e;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 76
    .line 77
    iget-wide v2, v2, Lcom/tencent/could/huiyansdk/turing/f;->a:J

    .line 78
    .line 79
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v2, " ms"

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {p1, v1}, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->setTuringEnvErrorStr(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/turing/e;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 95
    .line 96
    invoke-static {p1, v4}, Lcom/tencent/could/huiyansdk/turing/f;->b(Lcom/tencent/could/huiyansdk/turing/f;Z)Z

    .line 97
    .line 98
    .line 99
    sget-object p1, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 100
    .line 101
    iget-boolean p1, p1, Lcom/tencent/could/huiyansdk/common/a;->d:Z

    .line 102
    .line 103
    if-eqz p1, :cond_4

    .line 104
    .line 105
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 108
    .line 109
    if-eqz p1, :cond_3

    .line 110
    .line 111
    const-string v1, ""

    .line 112
    .line 113
    invoke-interface {p1, v1}, Lcom/tencent/could/huiyansdk/api/b;->onTuringFaceDataSuccess(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 117
    .line 118
    sget-object v1, Lcom/tencent/could/huiyansdk/enums/AuthState;->START_GET_LIVE_TYPE:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 119
    .line 120
    invoke-virtual {p1, v1, v0}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    :cond_4
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/turing/e;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 124
    .line 125
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/turing/f;->a(Lcom/tencent/could/huiyansdk/turing/f;)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/turing/e;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 129
    .line 130
    invoke-static {p0, v4}, Lcom/tencent/could/huiyansdk/turing/f;->a(Lcom/tencent/could/huiyansdk/turing/f;Z)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_5
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 135
    .line 136
    const-string v1, "wait frame image check is time out"

    .line 137
    .line 138
    invoke-virtual {p1, v4, v2, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/turing/e;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 142
    .line 143
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    const-string v1, "remove compare check all listener"

    .line 147
    .line 148
    invoke-virtual {p1, v4, v2, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/turing/f;->i:Lcom/tencent/could/huiyansdk/callback/d;

    .line 152
    .line 153
    if-nez v1, :cond_6

    .line 154
    .line 155
    const-string p0, "do not need waiting turing!"

    .line 156
    .line 157
    invoke-virtual {p1, v4, v2, p0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_6
    check-cast v1, Lcom/tencent/could/huiyansdk/manager/b$a;

    .line 162
    .line 163
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/manager/b$a;->a()V

    .line 164
    .line 165
    .line 166
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->i:Lcom/tencent/could/huiyansdk/callback/d;

    .line 167
    .line 168
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 169
    .line 170
    if-eqz p1, :cond_7

    .line 171
    .line 172
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 173
    .line 174
    invoke-virtual {p0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 175
    .line 176
    .line 177
    :cond_7
    return-void

    .line 178
    :cond_8
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/turing/e;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 179
    .line 180
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 181
    .line 182
    .line 183
    new-instance p0, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 184
    .line 185
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;-><init>()V

    .line 186
    .line 187
    .line 188
    const/16 p1, 0xd5

    .line 189
    .line 190
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 191
    .line 192
    .line 193
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->getContext()Landroid/content/Context;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    if-nez p1, :cond_9

    .line 198
    .line 199
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    sget v0, Lcom/tencent/could/huiyansdk/R$string;->txy_check_get_frame_error:I

    .line 204
    .line 205
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    goto :goto_0

    .line 210
    :cond_9
    const-string p1, "Failed to get data from camera, pleas back to the previous step and try again"

    .line 211
    .line 212
    :goto_0
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 216
    .line 217
    const-string v0, "event call for first frame time out!!!"

    .line 218
    .line 219
    invoke-virtual {p1, v1, v2, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 223
    .line 224
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/AuthState;->AUTH_ERROR_DIALOG:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 225
    .line 226
    invoke-virtual {p1, v0, p0}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 227
    .line 228
    .line 229
    return-void
.end method
