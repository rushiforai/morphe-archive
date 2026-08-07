.class public Lcom/tencent/could/huiyansdk/api/j;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/api/j$a;
    }
.end annotation


# instance fields
.field public a:Lcom/tencent/could/huiyansdk/api/g;

.field public b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

.field public c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

.field public d:Z

.field public volatile e:Z

.field public f:Lcom/tencent/could/huiyansdk/api/f;

.field public g:Lcom/tencent/could/huiyansdk/api/b;

.field public h:Lcom/tencent/could/huiyansdk/api/c;

.field public i:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/api/j;->d:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/api/j;->e:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()Landroid/content/Context;
    .locals 0

    .line 229
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->i:Ljava/lang/ref/WeakReference;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 230
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    return-object p0
.end method

.method public declared-synchronized a(ILjava/lang/String;)V
    .locals 4

    const-string v0, "huiyan failed, code: "

    monitor-enter p0

    const/4 v1, 0x1

    .line 215
    :try_start_0
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/api/j;->e:Z

    .line 216
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string v2, "HuiYanSdkImp"

    .line 217
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " msg:"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x2

    .line 218
    invoke-virtual {v1, v3, v2, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 219
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/j;->f:Lcom/tencent/could/huiyansdk/api/f;

    if-eqz v0, :cond_1

    .line 220
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/manager/e;->a()V

    .line 221
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 222
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const v1, 0x61ae7

    .line 223
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 224
    sget p1, Lcom/tencent/could/huiyansdk/R$string;->txy_yt_face_ref_angle_detect_error:I

    .line 225
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 226
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/api/j;->f:Lcom/tencent/could/huiyansdk/api/f;

    const/16 v0, 0xe5

    invoke-interface {p2, v0, p1}, Lcom/tencent/could/huiyansdk/api/f;->onFail(ILjava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 227
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/j;->f:Lcom/tencent/could/huiyansdk/api/f;

    invoke-interface {v0, p1, p2}, Lcom/tencent/could/huiyansdk/api/f;->onFail(ILjava/lang/String;)V

    .line 228
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/api/j;->f()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;Z)V
    .locals 6

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    .line 2
    .line 3
    const-string v1, "HuiYanSdkImp"

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 9
    .line 10
    const-string p1, "Auth event is none"

    .line 11
    .line 12
    invoke-virtual {p0, v2, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 17
    .line 18
    new-instance v3, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v4, "<auth event>: "

    .line 21
    .line 22
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v0, v2, v1, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/api/j;->a:Lcom/tencent/could/huiyansdk/api/g;

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-interface {v1, p1}, Lcom/tencent/could/huiyansdk/api/g;->onAuthEvent(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 43
    .line 44
    if-eqz p0, :cond_7

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseTransition()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-nez p0, :cond_2

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_2
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/n;->a()Lcom/tencent/could/huiyansdk/utils/n;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    if-eqz p2, :cond_3

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :cond_3
    sget-object p2, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 66
    .line 67
    iget-object v1, p2, Lcom/tencent/could/huiyansdk/api/j;->a:Lcom/tencent/could/huiyansdk/api/g;

    .line 68
    .line 69
    new-instance v3, Lcom/tencent/could/huiyansdk/utils/m;

    .line 70
    .line 71
    invoke-direct {v3, p0}, Lcom/tencent/could/huiyansdk/utils/m;-><init>(Lcom/tencent/could/huiyansdk/utils/n;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_7

    .line 79
    .line 80
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/utils/n;->a:Landroid/os/HandlerThread;

    .line 81
    .line 82
    if-nez p1, :cond_4

    .line 83
    .line 84
    new-instance p1, Landroid/os/HandlerThread;

    .line 85
    .line 86
    const-string v3, "transition"

    .line 87
    .line 88
    invoke-direct {p1, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/utils/n;->a:Landroid/os/HandlerThread;

    .line 92
    .line 93
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 94
    .line 95
    .line 96
    new-instance p1, Lcom/tencent/could/huiyansdk/utils/l;

    .line 97
    .line 98
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/utils/n;->a:Landroid/os/HandlerThread;

    .line 99
    .line 100
    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-direct {p1, p0, v3, v1}, Lcom/tencent/could/huiyansdk/utils/l;-><init>(Lcom/tencent/could/huiyansdk/utils/n;Landroid/os/Looper;Lcom/tencent/could/huiyansdk/api/g;)V

    .line 105
    .line 106
    .line 107
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/utils/n;->b:Landroid/os/Handler;

    .line 108
    .line 109
    :cond_4
    invoke-virtual {p2}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getTransitionTime()J

    .line 114
    .line 115
    .line 116
    move-result-wide v3

    .line 117
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/utils/n;->b:Landroid/os/Handler;

    .line 118
    .line 119
    if-nez p1, :cond_5

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_5
    invoke-static {}, Lcom/tencent/could/huiyansdk/api/a;->a()Lcom/tencent/could/huiyansdk/api/a;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 127
    .line 128
    .line 129
    const-string p1, "a"

    .line 130
    .line 131
    const-string v1, "do pause"

    .line 132
    .line 133
    invoke-virtual {v0, v2, p1, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->doPause()V

    .line 141
    .line 142
    .line 143
    sget-object p1, Lcom/tencent/could/huiyansdk/utils/k$b;->a:Lcom/tencent/could/huiyansdk/utils/k;

    .line 144
    .line 145
    const/4 v1, 0x1

    .line 146
    iput-boolean v1, p1, Lcom/tencent/could/huiyansdk/utils/k;->c:Z

    .line 147
    .line 148
    const-string p1, "TimeOutHelper"

    .line 149
    .line 150
    const-string v5, "timeout pause"

    .line 151
    .line 152
    invoke-virtual {v0, v1, p1, v5}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p2, Lcom/tencent/could/huiyansdk/api/j;->a:Lcom/tencent/could/huiyansdk/api/g;

    .line 156
    .line 157
    if-eqz p1, :cond_6

    .line 158
    .line 159
    invoke-interface {p1}, Lcom/tencent/could/huiyansdk/api/g;->onBeginTransition()V

    .line 160
    .line 161
    .line 162
    :cond_6
    :try_start_0
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/utils/n;->b:Landroid/os/Handler;

    .line 163
    .line 164
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iput v1, p1, Landroid/os/Message;->what:I

    .line 169
    .line 170
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/utils/n;->b:Landroid/os/Handler;

    .line 171
    .line 172
    invoke-virtual {p0, p1, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :catch_0
    move-exception p0

    .line 177
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 178
    .line 179
    new-instance p2, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    const-string v0, "failed to send transition event"

    .line 182
    .line 183
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    const-string p2, "n"

    .line 198
    .line 199
    invoke-virtual {p1, v2, p2, p0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    :cond_7
    :goto_0
    return-void
.end method

.method public a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;Z)V
    .locals 1

    if-eqz p1, :cond_3

    .line 210
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;->NONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_2

    .line 211
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/api/j;->j:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    if-ne p2, p1, :cond_1

    goto :goto_0

    .line 212
    :cond_1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/api/j;->j:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;

    .line 213
    :cond_2
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->a:Lcom/tencent/could/huiyansdk/api/g;

    if-eqz p0, :cond_3

    .line 214
    invoke-interface {p0, p1}, Lcom/tencent/could/huiyansdk/api/g;->onAuthTipsEvent(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 203
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/api/j;->e:Z

    .line 204
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 205
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/manager/e;->a()V

    .line 206
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->f:Lcom/tencent/could/huiyansdk/api/f;

    if-eqz p0, :cond_0

    .line 207
    invoke-interface {p0, p1, p2}, Lcom/tencent/could/huiyansdk/api/f;->onCompareSuccess(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 208
    :cond_0
    const-string p0, "HuiYan onCompareSuccess code! "

    const/4 p1, 0x2

    .line 209
    const-string p2, "HuiYanSdkImp"

    invoke-virtual {v0, p1, p2, p0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 13
    .line 14
    return-object p0
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLongCheck()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLongCheckUseBlurMode()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->getVideoSize()Lcom/tencent/could/huiyansdk/enums/VideoSize;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/VideoSize;->SIZE_720P:Lcom/tencent/could/huiyansdk/enums/VideoSize;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public e()V
    .locals 2

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->START_AUTH:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/tencent/could/huiyansdk/api/j;->a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;Z)V

    .line 7
    .line 8
    .line 9
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/AuthState;->START_CAMERA_PREVIEW:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/j;->f:Lcom/tencent/could/huiyansdk/api/f;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/api/j;->f:Lcom/tencent/could/huiyansdk/api/f;

    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 13
    .line 14
    :cond_1
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/api/j;->e:Z

    .line 16
    .line 17
    return-void
.end method
