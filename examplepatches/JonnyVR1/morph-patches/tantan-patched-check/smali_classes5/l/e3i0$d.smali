.class public Ll/e3i0$d;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/e3i0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# static fields
.field public static final d:Ll/e3i0$d;


# instance fields
.field public a:Z

.field public b:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue<",
            "Ll/e3i0$c;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/rj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rj80<",
            "Ll/e3i0$c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/e3i0$d;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/e3i0$d;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/e3i0$d;->d:Ll/e3i0$d;

    .line 7
    .line 8
    const/16 v1, 0xa

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 5
    .line 6
    const/16 v1, 0x2d

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/e3i0$d;->b:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 12
    .line 13
    new-instance v0, Ll/rj80;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/rj80;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/e3i0$d;->c:Ll/rj80;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Ll/e3i0$d;Ll/e3i0$c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e3i0$d;->g(Ll/e3i0$c;)V

    return-void
.end method

.method public static f()Ll/e3i0$d;
    .locals 1

    .line 1
    sget-object v0, Ll/e3i0$d;->d:Ll/e3i0$d;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final b()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/e3i0$d;->b:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ArrayBlockingQueue;->peek()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/e3i0$c;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    iget-boolean p0, p0, Ll/e3i0$c;->e:Z

    .line 13
    .line 14
    if-nez p0, :cond_1

    .line 15
    .line 16
    sget-boolean p0, Ll/uqi;->m:Z

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    return v0
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e3i0$d;->b:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ll/e3i0$c;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Ll/l51;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/e3i0$d;->b:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x2d

    .line 14
    .line 15
    if-lt v0, v1, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/f3i0;

    .line 18
    .line 19
    invoke-direct {v0, p0, p1}, Ll/f3i0;-><init>(Ll/e3i0$d;Ll/e3i0$c;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/l51;->s(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0, p1}, Ll/e3i0$d;->e(Ll/e3i0$c;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_0
    move-exception p0

    .line 31
    new-instance p1, Ljava/lang/RuntimeException;

    .line 32
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v1, "\u5f02\u6b65\u521d\u59cb\u5316\u5e03\u5c40\u68c0\u67e5\u7ebf\u7a0b\u5f02\u5e38\uff1a"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public e(Ll/e3i0$c;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/e3i0$d;->b:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ArrayBlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    new-instance p1, Ljava/lang/RuntimeException;

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "\u5f02\u6b65\u521d\u59cb\u5316\u5e03\u5c40\u5165\u961f\u5f02\u5e38\uff1a"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic g(Ll/e3i0$c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e3i0$d;->e(Ll/e3i0$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h()Ll/e3i0$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e3i0$d;->c:Ll/rj80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/e3i0$c;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Ll/e3i0$c;

    .line 12
    .line 13
    invoke-direct {p0}, Ll/e3i0$c;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public i(Ll/e3i0$c;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p1, Ll/e3i0$c;->f:Ll/e3i0$e;

    .line 3
    .line 4
    iput-object v0, p1, Ll/e3i0$c;->a:Ll/e3i0;

    .line 5
    .line 6
    iput-object v0, p1, Ll/e3i0$c;->b:Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p1, Ll/e3i0$c;->c:I

    .line 10
    .line 11
    iput-object v0, p1, Ll/e3i0$c;->d:Landroid/view/View;

    .line 12
    .line 13
    iget-object p0, p0, Ll/e3i0$d;->c:Ll/rj80;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/rj80;->release(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public j()V
    .locals 7

    .line 1
    const-string v0, "AsyncLayout inflate: "

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/e3i0$d;->a:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/e3i0$d;->b()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    const-wide/16 v0, 0x3e8

    .line 14
    .line 15
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    :catch_0
    return-void

    .line 19
    :cond_0
    :try_start_1
    iget-object v1, p0, Ll/e3i0$d;->b:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/util/concurrent/ArrayBlockingQueue;->take()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/e3i0$c;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    :try_start_2
    iget-boolean p0, p0, Ll/e3i0$d;->a:Z

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    iget-boolean p0, v1, Ll/e3i0$c;->e:Z

    .line 33
    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    invoke-static {v2}, Landroid/os/Process;->setThreadPriority(I)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catch_1
    move-exception p0

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    new-instance p0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget v0, v1, Ll/e3i0$c;->c:I

    .line 52
    .line 53
    invoke-static {v0}, Ll/e3i0;->a(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Ll/yhi0;->a(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, v1, Ll/e3i0$c;->a:Ll/e3i0;

    .line 68
    .line 69
    iget-object p0, p0, Ll/e3i0;->a:Landroid/view/LayoutInflater;

    .line 70
    .line 71
    iget v0, v1, Ll/e3i0$c;->c:I

    .line 72
    .line 73
    iget-object v5, v1, Ll/e3i0$c;->b:Landroid/view/ViewGroup;

    .line 74
    .line 75
    invoke-virtual {p0, v0, v5, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    iput-object p0, v1, Ll/e3i0$c;->d:Landroid/view/View;

    .line 80
    .line 81
    invoke-static {}, Ll/yhi0;->b()V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Ll/imq0;->a()Ll/imq0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Ll/imq0;->b()Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-eqz p0, :cond_2

    .line 93
    .line 94
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 95
    .line 96
    .line 97
    move-result-wide v5

    .line 98
    sub-long/2addr v5, v3

    .line 99
    invoke-static {}, Ll/imq0;->a()Ll/imq0;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ll/imq0;->c()I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    int-to-long v3, p0

    .line 108
    cmp-long p0, v5, v3

    .line 109
    .line 110
    if-lez p0, :cond_2

    .line 111
    .line 112
    iget p0, v1, Ll/e3i0$c;->c:I

    .line 113
    .line 114
    invoke-static {p0}, Ll/e3i0;->a(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    const-string v0, "e_xml_inflate"

    .line 119
    .line 120
    const-string v3, ""

    .line 121
    .line 122
    const-string v4, "xml_name"

    .line 123
    .line 124
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const-string v4, "time_consume"

    .line 129
    .line 130
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    filled-new-array {p0, v4}, [Ll/pf60;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-static {v0, v3, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    .line 143
    .line 144
    .line 145
    goto :goto_2

    .line 146
    :goto_1
    iget v0, v1, Ll/e3i0$c;->c:I

    .line 147
    .line 148
    invoke-static {v0}, Ll/e3i0;->a(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    new-instance v3, Ljava/lang/RuntimeException;

    .line 153
    .line 154
    new-instance v4, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    const-string v5, "\u5f02\u6b65\u521d\u59cb\u5316\u5e03\u5c40inflate\u5f02\u5e38 layout:"

    .line 157
    .line 158
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string v0, " , detail: "

    .line 165
    .line 166
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-direct {v3, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-static {v3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 184
    .line 185
    .line 186
    :cond_2
    :goto_2
    iget-object p0, v1, Ll/e3i0$c;->a:Ll/e3i0;

    .line 187
    .line 188
    iget-object p0, p0, Ll/e3i0;->b:Landroid/os/Handler;

    .line 189
    .line 190
    invoke-static {p0, v2, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    iget-boolean v0, v1, Ll/e3i0$c;->e:Z

    .line 195
    .line 196
    if-eqz v0, :cond_3

    .line 197
    .line 198
    invoke-virtual {p0}, Landroid/os/Message;->getTarget()Landroid/os/Handler;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendMessageAtFrontOfQueue(Landroid/os/Message;)Z

    .line 203
    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_3
    invoke-virtual {p0}, Landroid/os/Message;->getTarget()Landroid/os/Handler;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 211
    .line 212
    .line 213
    :goto_3
    return-void

    .line 214
    :catch_2
    move-exception p0

    .line 215
    new-instance v0, Ljava/lang/RuntimeException;

    .line 216
    .line 217
    new-instance v1, Ljava/lang/StringBuilder;

    .line 218
    .line 219
    const-string v2, "TanTanAsyncLayoutInflate\uff1a\u5f02\u6b65\u52a0\u8f7d\uff0c\u83b7\u53d6\u4efb\u52a1\u5f02\u5e38\uff1a"

    .line 220
    .line 221
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 239
    .line 240
    .line 241
    return-void
.end method

.method public run()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Ll/e3i0$d;->a:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/16 v0, -0x13

    .line 10
    .line 11
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ll/e3i0$d;->j()V

    .line 15
    .line 16
    .line 17
    goto :goto_0
.end method
