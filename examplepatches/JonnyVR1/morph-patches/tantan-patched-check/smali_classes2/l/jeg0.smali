.class public final Ll/jeg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/ang0;

.field public final c:Ll/nxg0;

.field public final d:Ljava/util/LinkedHashMap;

.field public final e:Ljava/util/WeakHashMap;

.field public final f:Ljava/util/WeakHashMap;

.field public final g:Ljava/util/LinkedHashSet;

.field public final h:Ll/nvg0;

.field public final i:Landroid/os/Handler;

.field public final j:Ll/cng0;

.field public final k:Ll/zyg0;

.field public final l:Ljava/util/ArrayList;

.field public final m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/ang0;Landroid/os/Handler;Ll/nxg0;Ll/cng0;Ll/zyg0;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qyg0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/qyg0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Ll/yuq0;->a:Ljava/lang/StringBuilder;

    .line 17
    .line 18
    new-instance v2, Ll/ftg0;

    .line 19
    .line 20
    invoke-direct {v2, v1}, Ll/ftg0;-><init>(Landroid/os/Looper;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-wide/16 v3, 0x3e8

    .line 28
    .line 29
    invoke-virtual {v2, v1, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/jeg0;->a:Landroid/content/Context;

    .line 33
    .line 34
    iput-object p2, p0, Ll/jeg0;->b:Ll/ang0;

    .line 35
    .line 36
    new-instance p2, Ljava/util/LinkedHashMap;

    .line 37
    .line 38
    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p2, p0, Ll/jeg0;->d:Ljava/util/LinkedHashMap;

    .line 42
    .line 43
    new-instance p2, Ljava/util/WeakHashMap;

    .line 44
    .line 45
    invoke-direct {p2}, Ljava/util/WeakHashMap;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p2, p0, Ll/jeg0;->e:Ljava/util/WeakHashMap;

    .line 49
    .line 50
    new-instance p2, Ljava/util/WeakHashMap;

    .line 51
    .line 52
    invoke-direct {p2}, Ljava/util/WeakHashMap;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p2, p0, Ll/jeg0;->f:Ljava/util/WeakHashMap;

    .line 56
    .line 57
    new-instance p2, Ljava/util/LinkedHashSet;

    .line 58
    .line 59
    invoke-direct {p2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object p2, p0, Ll/jeg0;->g:Ljava/util/LinkedHashSet;

    .line 63
    .line 64
    new-instance p2, Ll/nvg0;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-direct {p2, v0, p0}, Ll/nvg0;-><init>(Landroid/os/Looper;Ll/jeg0;)V

    .line 71
    .line 72
    .line 73
    iput-object p2, p0, Ll/jeg0;->h:Ll/nvg0;

    .line 74
    .line 75
    iput-object p4, p0, Ll/jeg0;->c:Ll/nxg0;

    .line 76
    .line 77
    iput-object p3, p0, Ll/jeg0;->i:Landroid/os/Handler;

    .line 78
    .line 79
    iput-object p5, p0, Ll/jeg0;->j:Ll/cng0;

    .line 80
    .line 81
    iput-object p6, p0, Ll/jeg0;->k:Ll/zyg0;

    .line 82
    .line 83
    new-instance p2, Ljava/util/ArrayList;

    .line 84
    .line 85
    const/4 p3, 0x4

    .line 86
    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(I)V

    .line 87
    .line 88
    .line 89
    iput-object p2, p0, Ll/jeg0;->l:Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-static {p1}, Ll/yuq0;->e(Landroid/content/Context;)Z

    .line 92
    .line 93
    .line 94
    const-string p2, "android.permission.ACCESS_NETWORK_STATE"

    .line 95
    .line 96
    invoke-virtual {p1, p2}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-nez p1, :cond_0

    .line 101
    .line 102
    const/4 p1, 0x1

    .line 103
    goto :goto_0

    .line 104
    :cond_0
    const/4 p1, 0x0

    .line 105
    :goto_0
    iput-boolean p1, p0, Ll/jeg0;->m:Z

    .line 106
    .line 107
    new-instance p1, LSuddo/Sudvoid;

    .line 108
    .line 109
    invoke-direct {p1, p0}, LSuddo/Sudvoid;-><init>(Ll/jeg0;)V

    .line 110
    .line 111
    .line 112
    new-instance p0, Landroid/content/IntentFilter;

    .line 113
    .line 114
    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    .line 115
    .line 116
    .line 117
    const-string p2, "android.intent.action.AIRPLANE_MODE"

    .line 118
    .line 119
    invoke-virtual {p0, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object p2, p1, LSuddo/Sudvoid;->Suddo:Ll/jeg0;

    .line 123
    .line 124
    iget-boolean p2, p2, Ll/jeg0;->m:Z

    .line 125
    .line 126
    if-eqz p2, :cond_1

    .line 127
    .line 128
    const-string p2, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 129
    .line 130
    invoke-virtual {p0, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_1
    iget-object p2, p1, LSuddo/Sudvoid;->Suddo:Ll/jeg0;

    .line 134
    .line 135
    iget-object p2, p2, Ll/jeg0;->a:Landroid/content/Context;

    .line 136
    .line 137
    invoke-static {p2, p1, p0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 138
    .line 139
    .line 140
    return-void
.end method


# virtual methods
.method public final a(Ll/teg0;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/teg0;->n:Ljava/util/concurrent/Future;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p1, Ll/teg0;->m:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->prepareToDraw()V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Ll/jeg0;->l:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/jeg0;->h:Ll/nvg0;

    .line 25
    .line 26
    const/4 v0, 0x7

    .line 27
    invoke-virtual {p1, v0}, Landroid/os/Handler;->hasMessages(I)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Ll/jeg0;->h:Ll/nvg0;

    .line 34
    .line 35
    const-wide/16 v1, 0xc8

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_0
    return-void
.end method

.method public final b(Ll/wqg0;Z)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/jeg0;->g:Ljava/util/LinkedHashSet;

    .line 2
    .line 3
    iget-object v1, p1, Ll/wqg0;->f:Ll/wqg0;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/jeg0;->f:Ljava/util/WeakHashMap;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p0, p2, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Ll/jeg0;->d:Ljava/util/LinkedHashMap;

    .line 22
    .line 23
    iget-object v1, p1, Ll/wqg0;->e:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/teg0;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    iget-object p0, v0, Ll/teg0;->b:Ll/feg0;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    iget-object p0, v0, Ll/teg0;->k:Ll/wqg0;

    .line 39
    .line 40
    if-nez p0, :cond_1

    .line 41
    .line 42
    iput-object p1, v0, Ll/teg0;->k:Ll/wqg0;

    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object p0, v0, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 46
    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    new-instance p0, Ljava/util/ArrayList;

    .line 50
    .line 51
    const/4 p2, 0x3

    .line 52
    invoke-direct {p0, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 53
    .line 54
    .line 55
    iput-object p0, v0, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 56
    .line 57
    :cond_2
    iget-object p0, v0, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    iget-object p0, p1, Ll/wqg0;->b:Ll/lxg0;

    .line 63
    .line 64
    iget p0, p0, Ll/lxg0;->c:I

    .line 65
    .line 66
    invoke-static {p0}, Ll/pxg0;->a(I)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iget p2, v0, Ll/teg0;->s:I

    .line 71
    .line 72
    invoke-static {p2}, Ll/pxg0;->a(I)I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-le p1, p2, :cond_7

    .line 77
    .line 78
    iput p0, v0, Ll/teg0;->s:I

    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    iget-object v0, p0, Ll/jeg0;->b:Ll/ang0;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->isShutdown()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_4

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_4
    iget-object v2, p1, Ll/wqg0;->a:Ll/feg0;

    .line 91
    .line 92
    iget-object v4, p0, Ll/jeg0;->j:Ll/cng0;

    .line 93
    .line 94
    iget-object v5, p0, Ll/jeg0;->k:Ll/zyg0;

    .line 95
    .line 96
    sget-object v0, Ll/teg0;->t:Ljava/lang/Object;

    .line 97
    .line 98
    iget-object v0, p1, Ll/wqg0;->b:Ll/lxg0;

    .line 99
    .line 100
    iget-object v1, v2, Ll/feg0;->a:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    const/4 v6, 0x0

    .line 107
    :goto_0
    if-ge v6, v3, :cond_6

    .line 108
    .line 109
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    check-cast v7, Ll/uxg0;

    .line 114
    .line 115
    invoke-virtual {v7, v0}, Ll/uxg0;->d(Ll/lxg0;)Z

    .line 116
    .line 117
    .line 118
    move-result v8

    .line 119
    if-eqz v8, :cond_5

    .line 120
    .line 121
    new-instance v1, Ll/teg0;

    .line 122
    .line 123
    move-object v3, p0

    .line 124
    move-object v6, p1

    .line 125
    invoke-direct/range {v1 .. v7}, Ll/teg0;-><init>(Ll/feg0;Ll/jeg0;Ll/cng0;Ll/zyg0;Ll/wqg0;Ll/uxg0;)V

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_5
    add-int/lit8 v6, v6, 0x1

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_6
    new-instance v1, Ll/teg0;

    .line 133
    .line 134
    sget-object v7, Ll/teg0;->w:Ll/dwg0;

    .line 135
    .line 136
    move-object v3, p0

    .line 137
    move-object v6, p1

    .line 138
    invoke-direct/range {v1 .. v7}, Ll/teg0;-><init>(Ll/feg0;Ll/jeg0;Ll/cng0;Ll/zyg0;Ll/wqg0;Ll/uxg0;)V

    .line 139
    .line 140
    .line 141
    :goto_1
    iget-object p0, v3, Ll/jeg0;->b:Ll/ang0;

    .line 142
    .line 143
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    new-instance p1, Ll/tmg0;

    .line 147
    .line 148
    invoke-direct {p1, v1}, Ll/tmg0;-><init>(Ll/teg0;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 152
    .line 153
    .line 154
    iput-object p1, v1, Ll/teg0;->n:Ljava/util/concurrent/Future;

    .line 155
    .line 156
    iget-object p0, v3, Ll/jeg0;->d:Ljava/util/LinkedHashMap;

    .line 157
    .line 158
    iget-object p1, v6, Ll/wqg0;->e:Ljava/lang/String;

    .line 159
    .line 160
    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    if-eqz p2, :cond_7

    .line 164
    .line 165
    iget-object p0, v3, Ll/jeg0;->e:Ljava/util/WeakHashMap;

    .line 166
    .line 167
    invoke-virtual {v6}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    :cond_7
    :goto_2
    return-void
.end method

.method public final c(Ll/teg0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jeg0;->h:Ll/nvg0;

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    invoke-virtual {p0, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final d(Ll/teg0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jeg0;->h:Ll/nvg0;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-virtual {p0, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
