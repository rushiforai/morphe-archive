.class public Ll/evx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/evx$b;,
        Ll/evx$a;
    }
.end annotation


# instance fields
.field private a:Ll/wvx;

.field private volatile b:Ll/fpf0;

.field private volatile c:Ll/a320;

.field private d:I

.field private e:I

.field private f:I

.field private volatile g:Z

.field private volatile h:Landroid/os/HandlerThread;

.field private volatile i:Landroid/os/Handler;

.field private volatile j:Ll/evx$b;

.field private k:Ljava/lang/Object;

.field private l:I

.field private final m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private o:J

.field private p:J


# direct methods
.method public constructor <init>(Ll/wvx;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x1388

    .line 5
    .line 6
    iput v0, p0, Ll/evx;->d:I

    .line 7
    .line 8
    const/16 v0, 0x2710

    .line 9
    .line 10
    iput v0, p0, Ll/evx;->e:I

    .line 11
    .line 12
    const/4 v0, 0x6

    .line 13
    iput v0, p0, Ll/evx;->f:I

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/evx;->g:Z

    .line 17
    .line 18
    new-instance v0, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/evx;->k:Ljava/lang/Object;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput v0, p0, Ll/evx;->l:I

    .line 27
    .line 28
    new-instance v0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/evx;->m:Ljava/util/ArrayList;

    .line 34
    .line 35
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/evx;->n:Ljava/util/ArrayList;

    .line 41
    .line 42
    const-wide/16 v0, -0x1

    .line 43
    .line 44
    iput-wide v0, p0, Ll/evx;->p:J

    .line 45
    .line 46
    iput-object p1, p0, Ll/evx;->a:Ll/wvx;

    .line 47
    .line 48
    iget-object p1, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 49
    .line 50
    if-nez p1, :cond_0

    .line 51
    .line 52
    new-instance p1, Landroid/os/HandlerThread;

    .line 53
    .line 54
    const-string v0, "MediaLogsReporters"

    .line 55
    .line 56
    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 60
    .line 61
    iget-object p1, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 64
    .line 65
    .line 66
    new-instance p1, Landroid/os/Handler;

    .line 67
    .line 68
    iget-object v0, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-direct {p1, v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 78
    .line 79
    iget-object p1, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 80
    .line 81
    const/16 v0, 0x102

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Ll/csx;->d0()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    iput p1, p0, Ll/evx;->d:I

    .line 95
    .line 96
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Ll/csx;->e0()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    iput p1, p0, Ll/evx;->f:I

    .line 105
    .line 106
    iget-object p1, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 107
    .line 108
    iget p0, p0, Ll/evx;->e:I

    .line 109
    .line 110
    int-to-long v0, p0

    .line 111
    const/16 p0, 0x201

    .line 112
    .line 113
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 114
    .line 115
    .line 116
    :cond_0
    return-void
.end method

.method private P(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    const-string v0, " ["

    .line 2
    .line 3
    :try_start_0
    const-string v1, "MediaLogsReporters"

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 11
    .line 12
    iget-object v0, v0, Ll/wvx;->B0:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v0, "], ["

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v0, "], ["

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 31
    .line 32
    iget-wide v3, v0, Ll/wvx;->s:J

    .line 33
    .line 34
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v0, "] "

    .line 38
    .line 39
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v1, v0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    new-instance v2, Ll/evx$a;

    .line 53
    .line 54
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 55
    .line 56
    iget-object v4, v0, Ll/wvx;->B0:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 59
    .line 60
    iget-wide v0, v0, Ll/wvx;->s:J

    .line 61
    .line 62
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 67
    .line 68
    iget-wide v0, v0, Ll/wvx;->t:J

    .line 69
    .line 70
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v8

    .line 74
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 75
    .line 76
    iget-object v9, v0, Ll/wvx;->u:Ljava/lang/String;

    .line 77
    .line 78
    move-object v3, p0

    .line 79
    move-object v5, p1

    .line 80
    move-object v6, p2

    .line 81
    invoke-direct/range {v2 .. v9}, Ll/evx$a;-><init>(Ll/evx;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, v3, Ll/evx;->k:Ljava/lang/Object;

    .line 85
    .line 86
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    :try_start_1
    iget-object p1, v3, Ll/evx;->i:Landroid/os/Handler;

    .line 88
    .line 89
    if-eqz p1, :cond_0

    .line 90
    .line 91
    iget-object p1, v3, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 92
    .line 93
    if-eqz p1, :cond_0

    .line 94
    .line 95
    iget-object p1, v3, Ll/evx;->i:Landroid/os/Handler;

    .line 96
    .line 97
    const/16 p2, 0x100

    .line 98
    .line 99
    invoke-virtual {p1, p2, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :catchall_0
    move-exception v0

    .line 108
    move-object p1, v0

    .line 109
    goto :goto_1

    .line 110
    :cond_0
    :goto_0
    monitor-exit p0

    .line 111
    return-void

    .line 112
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    :try_start_2
    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 114
    :catch_0
    return-void
.end method

.method private g()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/evx;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/evx;->n:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-lez v1, :cond_2

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    :goto_0
    iget-object v3, p0, Ll/evx;->n:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-ge v2, v3, :cond_1

    .line 25
    .line 26
    iget-object v3, p0, Ll/evx;->n:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    add-int/2addr v4, v5

    .line 43
    const v5, 0x8000

    .line 44
    .line 45
    .line 46
    if-le v4, v5, :cond_0

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    add-int/lit8 v2, v2, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto :goto_3

    .line 57
    :cond_1
    :goto_1
    iget-object v2, p0, Ll/evx;->n:Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    const/4 v1, 0x0

    .line 64
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    if-eqz v1, :cond_3

    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-lez v0, :cond_3

    .line 72
    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 74
    .line 75
    .line 76
    move-result-wide v2

    .line 77
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const-string v2, "mediaLog"

    .line 82
    .line 83
    new-instance v3, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v4, "["

    .line 86
    .line 87
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const-string v4, "]"

    .line 95
    .line 96
    const-string v5, ")"

    .line 97
    .line 98
    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v1, "]"

    .line 106
    .line 107
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    filled-new-array {v0, v2, v1}, [Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-static {v0}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const-string v1, "v2.mediaLogs"

    .line 123
    .line 124
    invoke-direct {p0, v1, v0}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    return-void

    .line 128
    :goto_3
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 129
    throw p0
.end method

.method private h(ZLjava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/evx;->m:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/evx;->m:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iget v2, p0, Ll/evx;->f:I

    .line 11
    .line 12
    if-ge v1, v2, :cond_1

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    goto :goto_2

    .line 19
    :cond_1
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    :goto_1
    iget-object v2, p0, Ll/evx;->m:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 28
    .line 29
    .line 30
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    iget-object v3, p0, Ll/evx;->m:Ljava/util/ArrayList;

    .line 32
    .line 33
    if-ge v1, v2, :cond_2

    .line 34
    .line 35
    :try_start_1
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_3

    .line 49
    :cond_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 50
    .line 51
    .line 52
    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    if-eqz p1, :cond_3

    .line 54
    .line 55
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-lez v0, :cond_3

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-direct {p0, p2, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const-string p1, "v3.imWatch"

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/evx;->i()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-direct {p0, p1, p2}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    return-void

    .line 78
    :goto_3
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    throw p0
.end method


# virtual methods
.method public A(ZJJJJLjava/lang/String;JJJJJJIIIILjava/lang/String;Ljava/lang/String;)V
    .locals 20

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 2
    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static/range {p6 .. p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static/range {p8 .. p9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 3
    invoke-static/range {p11 .. p12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static/range {p13 .. p14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-static/range {p15 .. p16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-static/range {p17 .. p18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-static/range {p19 .. p20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-static/range {p21 .. p22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-static/range {p23 .. p23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-static/range {p24 .. p24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-static/range {p25 .. p25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    invoke-static/range {p26 .. p26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    move-object/from16 v7, p10

    move-object/from16 v18, p27

    move-object/from16 v19, p28

    filled-new-array/range {v2 .. v19}, [Ljava/lang/Object;

    move-result-object v0

    .line 4
    invoke-static {v0}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_0

    .line 5
    const-string v1, "v3.pushLevelChange"

    :goto_0
    move-object/from16 v2, p0

    goto :goto_1

    :cond_0
    const-string v1, "v2.pushLevelChange"

    goto :goto_0

    :goto_1
    invoke-direct {v2, v1, v0}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public B(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0, p1, p2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string p2, "v2.pushRestart"

    .line 18
    .line 19
    invoke-direct {p0, p2, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public C()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 2
    .line 3
    new-instance v1, Ll/gvx;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/gvx;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/fvx;->g(Ll/wvx;Ll/gvx;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "v2.pushStart"

    .line 13
    .line 14
    invoke-direct {p0, v1, v0}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/u6y;->i()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "fpsRange"

    .line 26
    .line 27
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/u6y;->j()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "cameraPreviewSizes"

    .line 43
    .line 44
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/u6y;->k()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "cameraSize"

    .line 60
    .line 61
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/u6y;->G()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-string v1, "selectFps"

    .line 77
    .line 78
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Ll/u6y;->C()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const-string v1, "startPrewView"

    .line 98
    .line 99
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public D()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 2
    .line 3
    new-instance v1, Ll/mvx;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/mvx;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/fvx;->m(Ll/wvx;Ll/mvx;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "v3.pushStart"

    .line 13
    .line 14
    invoke-direct {p0, v1, v0}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/u6y;->i()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "fpsRange"

    .line 26
    .line 27
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/u6y;->j()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "cameraPreviewSizes"

    .line 43
    .line 44
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/u6y;->k()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "cameraSize"

    .line 60
    .line 61
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/u6y;->C()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v1, "startPrewView"

    .line 81
    .line 82
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public E()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/evx;->g()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const-string v1, "v2.pushWatch"

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Ll/evx;->h(ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 11
    .line 12
    new-instance v1, Ll/hvx;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/hvx;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/fvx;->h(Ll/wvx;Ll/hvx;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "v2.pushStop"

    .line 22
    .line 23
    invoke-direct {p0, v1, v0}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/evx;->g()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const-string v1, "v3.pushWatch"

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Ll/evx;->h(ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 11
    .line 12
    new-instance v1, Ll/nvx;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/nvx;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/fvx;->n(Ll/wvx;Ll/nvx;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "v3.pushStop"

    .line 22
    .line 23
    invoke-direct {p0, v1, v0}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public G()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 2
    .line 3
    new-instance v1, Ll/ivx;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/ivx;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/fvx;->i(Ll/wvx;Ll/ivx;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "MediaLogsReporters"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/evx;->m:Ljava/util/ArrayList;

    .line 18
    .line 19
    monitor-enter v1

    .line 20
    :try_start_0
    iget-object v2, p0, Ll/evx;->m:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    const/4 v0, 0x0

    .line 27
    const-string v1, "v2.pushWatch"

    .line 28
    .line 29
    invoke-direct {p0, v0, v1}, Ll/evx;->h(ZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string v0, "v3.detailData"

    .line 33
    .line 34
    iget-object v1, p0, Ll/evx;->a:Ll/wvx;

    .line 35
    .line 36
    iget-object v1, v1, Ll/wvx;->r:Ljava/lang/String;

    .line 37
    .line 38
    invoke-direct {p0, v0, v1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p0
.end method

.method public H()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 2
    .line 3
    new-instance v1, Ll/ovx;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/ovx;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/fvx;->o(Ll/wvx;Ll/ovx;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "MediaLogsReporters"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/evx;->m:Ljava/util/ArrayList;

    .line 18
    .line 19
    monitor-enter v1

    .line 20
    :try_start_0
    iget-object v2, p0, Ll/evx;->m:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    const/4 v0, 0x0

    .line 27
    const-string v1, "v3.pushWatch"

    .line 28
    .line 29
    invoke-direct {p0, v0, v1}, Ll/evx;->h(ZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string v0, "v3.detailData"

    .line 33
    .line 34
    iget-object v1, p0, Ll/evx;->a:Ll/wvx;

    .line 35
    .line 36
    iget-object v1, v1, Ll/wvx;->r:Ljava/lang/String;

    .line 37
    .line 38
    invoke-direct {p0, v0, v1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p0
.end method

.method public I(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/evx;->l:I

    .line 2
    .line 3
    return-void
.end method

.method public final J(Ll/a320;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/evx;->c:Ll/a320;

    .line 2
    .line 3
    return-void
.end method

.method public K(I)V
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Ll/evx;->d:I

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public L(I)V
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Ll/evx;->f:I

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public final M(IILl/fpf0;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "int "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " cnt "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " cb "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "MediaLogsReporters"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/evx;->c:Ll/a320;

    .line 37
    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    iput p1, p0, Ll/evx;->d:I

    .line 41
    .line 42
    iput p2, p0, Ll/evx;->f:I

    .line 43
    .line 44
    :cond_0
    if-eqz p3, :cond_1

    .line 45
    .line 46
    iput-object p3, p0, Ll/evx;->b:Ll/fpf0;

    .line 47
    .line 48
    :cond_1
    if-nez p3, :cond_3

    .line 49
    .line 50
    if-nez p1, :cond_3

    .line 51
    .line 52
    if-nez p2, :cond_3

    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    iput-boolean p1, p0, Ll/evx;->g:Z

    .line 56
    .line 57
    invoke-direct {p0}, Ll/evx;->g()V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 61
    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iget-object p1, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 65
    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    iget-object p0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 69
    .line 70
    const/16 p1, 0x200

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 73
    .line 74
    .line 75
    :cond_2
    return-void

    .line 76
    :cond_3
    const/4 p1, 0x1

    .line 77
    iput-boolean p1, p0, Ll/evx;->g:Z

    .line 78
    .line 79
    return-void
.end method

.method public N(Ll/evx$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/evx;->j:Ll/evx$b;

    .line 2
    .line 3
    return-void
.end method

.method public O()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/evx;->j()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 16
    .line 17
    const/16 v1, 0x104

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 23
    .line 24
    iget v2, p0, Ll/evx;->d:I

    .line 25
    .line 26
    int-to-long v2, v2

    .line 27
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/evx;->a:Ll/wvx;

    .line 31
    .line 32
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/u6y;->l()J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    iput-wide v0, p0, Ll/wvx;->J:J

    .line 41
    .line 42
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/u6y;->T()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/HandlerThread;

    .line 10
    .line 11
    const-string v1, "MediaLogsReporters"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 17
    .line 18
    iget-object v0, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 21
    .line 22
    .line 23
    new-instance v0, Landroid/os/Handler;

    .line 24
    .line 25
    iget-object v1, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 35
    .line 36
    iget-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 37
    .line 38
    const/16 v1, 0x102

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/csx;->d0()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Ll/evx;->d:I

    .line 52
    .line 53
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/csx;->e0()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput v0, p0, Ll/evx;->f:I

    .line 62
    .line 63
    iget-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 64
    .line 65
    iget p0, p0, Ll/evx;->e:I

    .line 66
    .line 67
    int-to-long v1, p0

    .line 68
    const/16 p0, 0x201

    .line 69
    .line 70
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public b(IJJJJ)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne p1, v1, :cond_0

    .line 11
    .line 12
    const-string p1, "M"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p1, "S"

    .line 16
    .line 17
    :goto_0
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object p5

    .line 29
    invoke-static {p8, p9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object p6

    .line 33
    move-object p2, p1

    .line 34
    move-object p1, v0

    .line 35
    filled-new-array/range {p1 .. p6}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string p2, "v3.confAudioRenderStart"

    .line 44
    .line 45
    invoke-direct {p0, p2, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public c(ZIJJJJ)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne p2, v1, :cond_0

    .line 11
    .line 12
    const-string p2, "M"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p2, "S"

    .line 16
    .line 17
    :goto_0
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object p5

    .line 25
    invoke-static {p7, p8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object p6

    .line 29
    invoke-static {p9, p10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object p7

    .line 33
    move-object p3, p2

    .line 34
    move-object p2, v0

    .line 35
    filled-new-array/range {p2 .. p7}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {p2}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    const-string p1, "v3.confRenderStart"

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const-string p1, "v2.confRenderStart"

    .line 49
    .line 50
    :goto_1
    invoke-direct {p0, p1, p2}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public d(ZIJI)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne p2, v1, :cond_0

    .line 11
    .line 12
    const-string p2, "M"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p2, "S"

    .line 16
    .line 17
    :goto_0
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    filled-new-array {v0, p2, p3, p4}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-static {p2}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    const-string p1, "v3.confRenderStop"

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    const-string p1, "v2.confRenderStop"

    .line 39
    .line 40
    :goto_1
    invoke-direct {p0, p1, p2}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public e(ZIJJJ)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne p2, v1, :cond_0

    .line 11
    .line 12
    const-string p2, "M"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p2, "S"

    .line 16
    .line 17
    :goto_0
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    invoke-static {p7, p8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object p5

    .line 29
    filled-new-array {v0, p2, p3, p4, p5}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-static {p2}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    const-string p1, "v3.conferenceStart"

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const-string p1, "v2.conferenceStart"

    .line 43
    .line 44
    :goto_1
    invoke-direct {p0, p1, p2}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public f(ZIJJJI)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne p2, v1, :cond_0

    .line 11
    .line 12
    const-string p2, "M"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p2, "S"

    .line 16
    .line 17
    :goto_0
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object p5

    .line 25
    invoke-static {p9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object p6

    .line 29
    invoke-static {p7, p8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object p7

    .line 33
    move-object p3, p2

    .line 34
    move-object p2, v0

    .line 35
    filled-new-array/range {p2 .. p7}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {p2}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    const-string p1, "v3.conferenceStop"

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const-string p1, "v2.conferenceStop"

    .line 49
    .line 50
    :goto_1
    invoke-direct {p0, p1, p2}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 8

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v1, 0x100

    .line 4
    .line 5
    if-eq v0, v1, :cond_5

    .line 6
    .line 7
    const/16 p1, 0x102

    .line 8
    .line 9
    if-eq v0, p1, :cond_4

    .line 10
    .line 11
    const/16 p1, 0x104

    .line 12
    .line 13
    if-eq v0, p1, :cond_3

    .line 14
    .line 15
    const/16 p1, 0x200

    .line 16
    .line 17
    if-eq v0, p1, :cond_1

    .line 18
    .line 19
    const/16 p1, 0x201

    .line 20
    .line 21
    if-eq v0, p1, :cond_0

    .line 22
    .line 23
    goto/16 :goto_3

    .line 24
    .line 25
    :cond_0
    invoke-direct {p0}, Ll/evx;->g()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/evx;->j()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_8

    .line 33
    .line 34
    iget-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 35
    .line 36
    if-eqz v0, :cond_8

    .line 37
    .line 38
    iget-object v0, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 39
    .line 40
    if-eqz v0, :cond_8

    .line 41
    .line 42
    iget-object p0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 43
    .line 44
    const-wide/16 v0, 0x2710

    .line 45
    .line 46
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 47
    .line 48
    .line 49
    goto/16 :goto_3

    .line 50
    .line 51
    :cond_1
    iget-object v1, p0, Ll/evx;->k:Ljava/lang/Object;

    .line 52
    .line 53
    monitor-enter v1

    .line 54
    :try_start_0
    iget-object p1, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 55
    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    iget-object p1, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 59
    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    iget-object p1, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 74
    .line 75
    iput-object v0, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 76
    .line 77
    iput-object v0, p0, Ll/evx;->j:Ll/evx$b;

    .line 78
    .line 79
    iput-object v0, p0, Ll/evx;->c:Ll/a320;

    .line 80
    .line 81
    const-string p0, "MediaLogsReporters"

    .line 82
    .line 83
    const-string p1, "STOP_LOGS handlerThread.quit()"

    .line 84
    .line 85
    invoke-static {p0, p1}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :catchall_0
    move-exception v0

    .line 90
    move-object p0, v0

    .line 91
    goto :goto_1

    .line 92
    :cond_2
    :goto_0
    monitor-exit v1

    .line 93
    goto/16 :goto_3

    .line 94
    .line 95
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    throw p0

    .line 97
    :cond_3
    iget-object v0, p0, Ll/evx;->j:Ll/evx$b;

    .line 98
    .line 99
    if-eqz v0, :cond_8

    .line 100
    .line 101
    iget-object v0, p0, Ll/evx;->j:Ll/evx$b;

    .line 102
    .line 103
    invoke-interface {v0}, Ll/evx$b;->d1()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Ll/evx;->j()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_8

    .line 111
    .line 112
    iget-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 113
    .line 114
    if-eqz v0, :cond_8

    .line 115
    .line 116
    iget-object v0, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 117
    .line 118
    if-eqz v0, :cond_8

    .line 119
    .line 120
    iget v0, p0, Ll/evx;->d:I

    .line 121
    .line 122
    if-lez v0, :cond_8

    .line 123
    .line 124
    iget-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 125
    .line 126
    iget p0, p0, Ll/evx;->d:I

    .line 127
    .line 128
    int-to-long v1, p0

    .line 129
    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 130
    .line 131
    .line 132
    goto/16 :goto_3

    .line 133
    .line 134
    :cond_4
    iget-object p0, p0, Ll/evx;->a:Ll/wvx;

    .line 135
    .line 136
    invoke-static {}, Ll/fvx;->p()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iput-object p1, p0, Ll/wvx;->A0:Ljava/lang/String;

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_5
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 144
    .line 145
    check-cast p1, Ll/evx$a;

    .line 146
    .line 147
    if-eqz p1, :cond_8

    .line 148
    .line 149
    iget-object v0, p1, Ll/evx$a;->a:Ljava/lang/String;

    .line 150
    .line 151
    if-eqz v0, :cond_8

    .line 152
    .line 153
    iget-object v0, p1, Ll/evx$a;->c:Ljava/lang/String;

    .line 154
    .line 155
    if-eqz v0, :cond_8

    .line 156
    .line 157
    const-string v0, "MediaLogsReporters"

    .line 158
    .line 159
    new-instance v1, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    const-string v2, "SEND_LOGS ["

    .line 162
    .line 163
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iget-object v2, p1, Ll/evx$a;->a:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const-string v2, "], ["

    .line 172
    .line 173
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    iget-object v2, p1, Ll/evx$a;->b:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    const-string v2, "] -->"

    .line 182
    .line 183
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-static {v0, v1}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Ll/evx;->b:Ll/fpf0;

    .line 194
    .line 195
    if-eqz v0, :cond_7

    .line 196
    .line 197
    const-string v0, "v3.detailData"

    .line 198
    .line 199
    iget-object v1, p1, Ll/evx$a;->b:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    iget-object v1, p0, Ll/evx;->b:Ll/fpf0;

    .line 206
    .line 207
    if-eqz v0, :cond_6

    .line 208
    .line 209
    iget-object v0, p1, Ll/evx$a;->a:Ljava/lang/String;

    .line 210
    .line 211
    iget-object v2, p1, Ll/evx$a;->b:Ljava/lang/String;

    .line 212
    .line 213
    iget-object v3, p1, Ll/evx$a;->c:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {v1, v0, v2, v3}, Ll/fpf0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_6
    iget-object v0, p1, Ll/evx$a;->a:Ljava/lang/String;

    .line 220
    .line 221
    iget-object v2, p1, Ll/evx$a;->b:Ljava/lang/String;

    .line 222
    .line 223
    iget-object v3, p1, Ll/evx$a;->c:Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {v1, v0, v2, v3}, Ll/fpf0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    :cond_7
    :goto_2
    iget-object v0, p0, Ll/evx;->c:Ll/a320;

    .line 229
    .line 230
    if-eqz v0, :cond_8

    .line 231
    .line 232
    iget-object v1, p0, Ll/evx;->c:Ll/a320;

    .line 233
    .line 234
    iget-object v2, p1, Ll/evx$a;->a:Ljava/lang/String;

    .line 235
    .line 236
    iget-object v3, p1, Ll/evx$a;->b:Ljava/lang/String;

    .line 237
    .line 238
    iget-object v4, p1, Ll/evx$a;->c:Ljava/lang/String;

    .line 239
    .line 240
    iget-object v5, p1, Ll/evx$a;->d:Ljava/lang/String;

    .line 241
    .line 242
    iget-object v6, p1, Ll/evx$a;->e:Ljava/lang/String;

    .line 243
    .line 244
    iget-object v7, p1, Ll/evx$a;->f:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual/range {v1 .. v7}, Ll/a320;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    :cond_8
    :goto_3
    const/4 p0, 0x0

    .line 250
    return p0
.end method

.method public i()Ljava/lang/String;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/wvx;->B:J

    .line 4
    .line 5
    iget-wide v2, p0, Ll/evx;->o:J

    .line 6
    .line 7
    sub-long v2, v0, v2

    .line 8
    .line 9
    iput-wide v0, p0, Ll/evx;->o:J

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, ""

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-wide/16 v4, 0x0

    .line 19
    .line 20
    cmp-long v1, v2, v4

    .line 21
    .line 22
    if-lez v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move-wide v2, v4

    .line 26
    :goto_0
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "|"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Ll/evx;->a:Ll/wvx;

    .line 35
    .line 36
    iget-wide v3, v2, Ll/wvx;->P:J

    .line 37
    .line 38
    iget-wide v5, v2, Ll/wvx;->O:J

    .line 39
    .line 40
    add-long/2addr v3, v5

    .line 41
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/evx;->a:Ll/wvx;

    .line 48
    .line 49
    iget-wide v1, p0, Ll/wvx;->y0:J

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public j()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/evx;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/evx;->c:Ll/a320;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public k(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/evx;->l:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    filled-new-array {v0, p1, p2}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string p2, "v2.mediaLogs"

    .line 23
    .line 24
    invoke-direct {p0, p2, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public varargs l([Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/evx;->i:Landroid/os/Handler;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/evx;->h:Landroid/os/HandlerThread;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v0, p0, Ll/evx;->l:I

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 21
    .line 22
    const-string v2, "HH:mm:ss.SSS"

    .line 23
    .line 24
    sget-object v3, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 25
    .line 26
    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v3, "{"

    .line 44
    .line 45
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v1, ","

    .line 52
    .line 53
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    :goto_1
    array-length v2, p1

    .line 67
    if-ge v1, v2, :cond_3

    .line 68
    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    const-string v2, ","

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    :cond_2
    aget-object v2, p1, v1

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    add-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    const-string p1, "}"

    .line 85
    .line 86
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/evx;->n:Ljava/util/ArrayList;

    .line 90
    .line 91
    monitor-enter p1

    .line 92
    :try_start_0
    iget-object v1, p0, Ll/evx;->n:Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    const/16 v2, 0x12c

    .line 99
    .line 100
    if-ge v1, v2, :cond_4

    .line 101
    .line 102
    iget-object p0, p0, Ll/evx;->n:Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    goto :goto_2

    .line 112
    :catchall_0
    move-exception p0

    .line 113
    goto :goto_3

    .line 114
    :cond_4
    :goto_2
    monitor-exit p1

    .line 115
    return-void

    .line 116
    :goto_3
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    throw p0
.end method

.method public m(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "v3.momoRtcPullWatch"

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "v3.momoRtcPushStart"

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "v3.momoRtcPushStop"

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "v3.momoRtcPushWatch"

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "v3.momoRtcReconnect"

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 2
    .line 3
    new-instance v1, Ll/jvx;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/jvx;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/fvx;->j(Ll/wvx;Ll/jvx;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "v3.pullStart"

    .line 13
    .line 14
    invoke-direct {p0, v1, v0}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/evx;->g()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const-string v1, "v3.pullWatch"

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Ll/evx;->h(ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 11
    .line 12
    new-instance v1, Ll/kvx;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/kvx;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/fvx;->k(Ll/wvx;Ll/kvx;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "v3.pullStop"

    .line 22
    .line 23
    invoke-direct {p0, v1, v0}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public u()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/evx;->a:Ll/wvx;

    .line 2
    .line 3
    new-instance v1, Ll/lvx;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/lvx;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/fvx;->l(Ll/wvx;Ll/lvx;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "MediaLogsReporters"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/evx;->m:Ljava/util/ArrayList;

    .line 18
    .line 19
    monitor-enter v1

    .line 20
    :try_start_0
    iget-object v2, p0, Ll/evx;->m:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    const/4 v0, 0x0

    .line 27
    const-string v1, "v3.pullWatch"

    .line 28
    .line 29
    invoke-direct {p0, v0, v1}, Ll/evx;->h(ZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string v0, "v3.detailData"

    .line 33
    .line 34
    iget-object v1, p0, Ll/evx;->a:Ll/wvx;

    .line 35
    .line 36
    iget-object v1, v1, Ll/wvx;->r:Ljava/lang/String;

    .line 37
    .line 38
    invoke-direct {p0, v0, v1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p0
.end method

.method public v(JJJJ)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-static {p7, p8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    filled-new-array {v0, p1, p2, p3, p4}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "v2.pushBufferDrop"

    .line 34
    .line 35
    invoke-direct {p0, p2, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public w(J)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/evx;->p:J

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string p2, "v2.pushBufferStart"

    .line 28
    .line 29
    invoke-direct {p0, p2, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public x(J)V
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/evx;->p:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide v4, p0, Ll/evx;->p:J

    .line 14
    .line 15
    sub-long/2addr v0, v4

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    :goto_0
    iput-wide v2, p0, Ll/evx;->p:J

    .line 20
    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    filled-new-array {v2, v0, p1}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string p2, "v2.pushBufferStop"

    .line 46
    .line 47
    invoke-direct {p0, p2, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public y(JJJJ)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-static {p7, p8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    filled-new-array {v0, p1, p2, p3, p4}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "v2.pushDropStart"

    .line 34
    .line 35
    invoke-direct {p0, p2, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public z(JJJJJ)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    invoke-static {p7, p8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object p5

    .line 25
    invoke-static {p9, p10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object p6

    .line 29
    move-object p1, v0

    .line 30
    filled-new-array/range {p1 .. p6}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string p2, "v2.pushDropStop"

    .line 39
    .line 40
    invoke-direct {p0, p2, p1}, Ll/evx;->P(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
