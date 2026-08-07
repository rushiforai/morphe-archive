.class public Lcom/tencent/liteav/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/k;
.implements Lcom/tencent/liteav/screencapture/b;


# instance fields
.field private final a:Lcom/tencent/liteav/screencapture/a;

.field private b:Lcom/tencent/liteav/l;

.field private c:Ljavax/microedition/khronos/egl/EGLContext;

.field private d:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field

.field private e:I

.field private f:Lcom/tencent/liteav/basic/util/d;

.field private g:I

.field private h:I

.field private i:Ljava/lang/String;

.field private j:I

.field private k:J

.field private l:J

.field private m:J

.field private n:Z

.field private final o:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tencent/liteav/g;Lcom/tencent/liteav/screencapture/a$a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/i;->c:Ljavax/microedition/khronos/egl/EGLContext;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/i;->d:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    const-string v0, ""

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/i;->i:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/tencent/liteav/i;->j:I

    .line 15
    .line 16
    new-instance v0, Ljava/util/LinkedList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/tencent/liteav/i;->o:Ljava/util/Queue;

    .line 22
    .line 23
    new-instance v0, Lcom/tencent/liteav/screencapture/a;

    .line 24
    .line 25
    iget-boolean v1, p2, Lcom/tencent/liteav/g;->V:Z

    .line 26
    .line 27
    invoke-direct {v0, p1, v1, p3}, Lcom/tencent/liteav/screencapture/a;-><init>(Landroid/content/Context;ZLcom/tencent/liteav/screencapture/a$a;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/tencent/liteav/i;->a:Lcom/tencent/liteav/screencapture/a;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/screencapture/a;->a(Lcom/tencent/liteav/screencapture/b;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/tencent/liteav/g;->a()Z

    .line 36
    .line 37
    .line 38
    iget p1, p2, Lcom/tencent/liteav/g;->a:I

    .line 39
    .line 40
    iget p3, p2, Lcom/tencent/liteav/g;->b:I

    .line 41
    .line 42
    invoke-direct {p0, p1, p3}, Lcom/tencent/liteav/i;->c(II)Lcom/tencent/liteav/basic/util/d;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/tencent/liteav/i;->f:Lcom/tencent/liteav/basic/util/d;

    .line 47
    .line 48
    iget p3, p2, Lcom/tencent/liteav/g;->h:I

    .line 49
    .line 50
    iput p3, p0, Lcom/tencent/liteav/i;->e:I

    .line 51
    .line 52
    iget p3, p2, Lcom/tencent/liteav/g;->a:I

    .line 53
    .line 54
    iput p3, p0, Lcom/tencent/liteav/i;->g:I

    .line 55
    .line 56
    iget p2, p2, Lcom/tencent/liteav/g;->b:I

    .line 57
    .line 58
    iput p2, p0, Lcom/tencent/liteav/i;->h:I

    .line 59
    .line 60
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iget p0, p0, Lcom/tencent/liteav/i;->h:I

    .line 65
    .line 66
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    filled-new-array {p1, p2, p0}, [Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string p1, "TXCScreenCaptureSource"

    .line 75
    .line 76
    const-string p2, "capture size: %s, encode size: %dx%d"

    .line 77
    .line 78
    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method private a(Ljava/util/Queue;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)Z"
        }
    .end annotation

    .line 189
    monitor-enter p1

    .line 190
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    monitor-exit p1

    return v0

    :catchall_0
    move-exception p0

    goto :goto_0

    .line 191
    :cond_0
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    .line 192
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p0, :cond_1

    return v0

    .line 193
    :cond_1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0

    .line 194
    :goto_0
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private c(II)Lcom/tencent/liteav/basic/util/d;
    .locals 2

    .line 1
    if-le p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    new-instance v0, Lcom/tencent/liteav/basic/util/d;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/tencent/liteav/basic/util/d;-><init>()V

    .line 9
    .line 10
    .line 11
    const/16 v1, 0x500

    .line 12
    .line 13
    if-gt p1, v1, :cond_4

    .line 14
    .line 15
    if-le p2, v1, :cond_1

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_1
    const/16 p1, 0x2d0

    .line 19
    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    move p2, v1

    .line 23
    goto :goto_1

    .line 24
    :cond_2
    move p2, p1

    .line 25
    :goto_1
    iput p2, v0, Lcom/tencent/liteav/basic/util/d;->a:I

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    move v1, p1

    .line 30
    :cond_3
    iput v1, v0, Lcom/tencent/liteav/basic/util/d;->b:I

    .line 31
    .line 32
    return-object v0

    .line 33
    :cond_4
    :goto_2
    if-eqz p0, :cond_5

    .line 34
    .line 35
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    goto :goto_3

    .line 40
    :cond_5
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    :goto_3
    iput v1, v0, Lcom/tencent/liteav/basic/util/d;->a:I

    .line 45
    .line 46
    if-eqz p0, :cond_6

    .line 47
    .line 48
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    goto :goto_4

    .line 53
    :cond_6
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    :goto_4
    iput p0, v0, Lcom/tencent/liteav/basic/util/d;->b:I

    .line 58
    .line 59
    return-object v0
.end method

.method private f(Z)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/i;->g:I

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget p1, p0, Lcom/tencent/liteav/i;->h:I

    .line 6
    .line 7
    if-le v0, p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/i;->b(II)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget p1, p0, Lcom/tencent/liteav/i;->h:I

    .line 14
    .line 15
    if-ge v0, p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/i;->b(II)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 174
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "VideoCapture[%d]: start screen"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-static {v3, v0, v1, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    const-wide/16 v0, 0x0

    .line 175
    iput-wide v0, p0, Lcom/tencent/liteav/i;->k:J

    .line 176
    iput-wide v0, p0, Lcom/tencent/liteav/i;->l:J

    .line 177
    iput-wide v0, p0, Lcom/tencent/liteav/i;->m:J

    const/4 v0, 0x1

    .line 178
    iput-boolean v0, p0, Lcom/tencent/liteav/i;->n:Z

    .line 179
    iget-object v0, p0, Lcom/tencent/liteav/i;->a:Lcom/tencent/liteav/screencapture/a;

    iget-object v1, p0, Lcom/tencent/liteav/i;->f:Lcom/tencent/liteav/basic/util/d;

    iget v2, v1, Lcom/tencent/liteav/basic/util/d;->a:I

    iget v1, v1, Lcom/tencent/liteav/basic/util/d;->b:I

    iget p0, p0, Lcom/tencent/liteav/i;->e:I

    invoke-virtual {v0, v2, v1, p0}, Lcom/tencent/liteav/screencapture/a;->a(III)I

    return-void
.end method

.method public a(FF)V
    .locals 0

    .line 195
    return-void
.end method

.method public a(II)V
    .locals 0

    .line 170
    return-void
.end method

.method public a(ILjavax/microedition/khronos/egl/EGLContext;IIIJ)V
    .locals 6

    .line 1
    iput-object p2, p0, Lcom/tencent/liteav/i;->c:Ljavax/microedition/khronos/egl/EGLContext;

    .line 2
    .line 3
    :goto_0
    iget-object p2, p0, Lcom/tencent/liteav/i;->o:Ljava/util/Queue;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lcom/tencent/liteav/i;->a(Ljava/util/Queue;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p2, "TXCScreenCaptureSource"

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    const-string p0, "onScreenCaptureFrame failed"

    .line 17
    .line 18
    invoke-static {p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-boolean p1, p0, Lcom/tencent/liteav/i;->n:Z

    .line 23
    .line 24
    const/4 p6, 0x0

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    iput-boolean p6, p0, Lcom/tencent/liteav/i;->n:Z

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string p7, "VideoCapture[%d]: capture first frame"

    .line 42
    .line 43
    invoke-static {p7, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p7, ""

    .line 48
    .line 49
    const/4 v0, 0x2

    .line 50
    invoke-static {v0, p1, p7, p6}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/tencent/liteav/i;->d:Ljava/lang/ref/WeakReference;

    .line 54
    .line 55
    const/16 p7, 0x3ef

    .line 56
    .line 57
    const-string v0, "First frame capture completed"

    .line 58
    .line 59
    invoke-static {p1, p7, v0}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    const-string p1, "on Got first frame"

    .line 63
    .line 64
    invoke-static {p2, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    iget-wide p1, p0, Lcom/tencent/liteav/i;->k:J

    .line 68
    .line 69
    const-wide/16 v0, 0x1

    .line 70
    .line 71
    add-long/2addr p1, v0

    .line 72
    iput-wide p1, p0, Lcom/tencent/liteav/i;->k:J

    .line 73
    .line 74
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 75
    .line 76
    .line 77
    move-result-wide p1

    .line 78
    iget-wide v0, p0, Lcom/tencent/liteav/i;->l:J

    .line 79
    .line 80
    sub-long/2addr p1, v0

    .line 81
    const-wide/16 v0, 0x3e8

    .line 82
    .line 83
    cmp-long p7, p1, v0

    .line 84
    .line 85
    if-ltz p7, :cond_3

    .line 86
    .line 87
    iget-wide v0, p0, Lcom/tencent/liteav/i;->k:J

    .line 88
    .line 89
    iget-wide v2, p0, Lcom/tencent/liteav/i;->m:J

    .line 90
    .line 91
    sub-long v2, v0, v2

    .line 92
    .line 93
    long-to-double v2, v2

    .line 94
    const-wide v4, 0x408f400000000000L    # 1000.0

    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    mul-double/2addr v2, v4

    .line 100
    long-to-double p1, p1

    .line 101
    div-double/2addr v2, p1

    .line 102
    iput-wide v0, p0, Lcom/tencent/liteav/i;->m:J

    .line 103
    .line 104
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 105
    .line 106
    .line 107
    move-result-wide p1

    .line 108
    iput-wide p1, p0, Lcom/tencent/liteav/i;->l:J

    .line 109
    .line 110
    iget-object p1, p0, Lcom/tencent/liteav/i;->i:Ljava/lang/String;

    .line 111
    .line 112
    iget p2, p0, Lcom/tencent/liteav/i;->j:I

    .line 113
    .line 114
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 115
    .line 116
    .line 117
    move-result-object p7

    .line 118
    const/16 v0, 0x3e9

    .line 119
    .line 120
    invoke-static {p1, v0, p2, p7}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    :cond_3
    iget-object p1, p0, Lcom/tencent/liteav/i;->b:Lcom/tencent/liteav/l;

    .line 124
    .line 125
    if-eqz p1, :cond_5

    .line 126
    .line 127
    if-ge p4, p5, :cond_4

    .line 128
    .line 129
    const/4 p1, 0x1

    .line 130
    goto :goto_1

    .line 131
    :cond_4
    move p1, p6

    .line 132
    :goto_1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/i;->f(Z)V

    .line 133
    .line 134
    .line 135
    new-instance p1, Lcom/tencent/liteav/basic/structs/b;

    .line 136
    .line 137
    invoke-direct {p1}, Lcom/tencent/liteav/basic/structs/b;-><init>()V

    .line 138
    .line 139
    .line 140
    iput p4, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 141
    .line 142
    iput p5, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 143
    .line 144
    iget p2, p0, Lcom/tencent/liteav/i;->g:I

    .line 145
    .line 146
    iput p2, p1, Lcom/tencent/liteav/basic/structs/b;->g:I

    .line 147
    .line 148
    iget p7, p0, Lcom/tencent/liteav/i;->h:I

    .line 149
    .line 150
    iput p7, p1, Lcom/tencent/liteav/basic/structs/b;->h:I

    .line 151
    .line 152
    iput p3, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    .line 153
    .line 154
    iput p6, p1, Lcom/tencent/liteav/basic/structs/b;->b:I

    .line 155
    .line 156
    iput p6, p1, Lcom/tencent/liteav/basic/structs/b;->j:I

    .line 157
    .line 158
    invoke-static {p4, p5, p2, p7}, Lcom/tencent/liteav/basic/util/f;->a(IIII)Lcom/tencent/liteav/basic/c/a;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    iput-object p2, p1, Lcom/tencent/liteav/basic/structs/b;->l:Lcom/tencent/liteav/basic/c/a;

    .line 163
    .line 164
    iget-object p0, p0, Lcom/tencent/liteav/i;->b:Lcom/tencent/liteav/l;

    .line 165
    .line 166
    invoke-interface {p0, p1}, Lcom/tencent/liteav/l;->b(Lcom/tencent/liteav/basic/structs/b;)V

    .line 167
    .line 168
    .line 169
    :cond_5
    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/a/c;)V
    .locals 0

    .line 171
    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/b/b;)V
    .locals 1

    .line 186
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/tencent/liteav/i;->d:Ljava/lang/ref/WeakReference;

    .line 187
    iget-object p0, p0, Lcom/tencent/liteav/i;->a:Lcom/tencent/liteav/screencapture/a;

    if-eqz p0, :cond_0

    .line 188
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/screencapture/a;->a(Lcom/tencent/liteav/basic/b/b;)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/structs/b;)V
    .locals 0

    .line 172
    return-void
.end method

.method public a(Lcom/tencent/liteav/l;)V
    .locals 0

    .line 183
    iput-object p1, p0, Lcom/tencent/liteav/i;->b:Lcom/tencent/liteav/l;

    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .locals 0

    .line 196
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/i;->o:Ljava/util/Queue;

    invoke-direct {p0, p1}, Lcom/tencent/liteav/i;->a(Ljava/util/Queue;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 197
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/i;->b:Lcom/tencent/liteav/l;

    if-eqz p0, :cond_1

    .line 198
    invoke-interface {p0}, Lcom/tencent/liteav/l;->q()V

    :cond_1
    return-void
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 0

    .line 184
    iget-object p0, p0, Lcom/tencent/liteav/i;->a:Lcom/tencent/liteav/screencapture/a;

    if-eqz p0, :cond_0

    .line 185
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/screencapture/a;->a(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .line 182
    iput-object p1, p0, Lcom/tencent/liteav/i;->i:Ljava/lang/String;

    return-void
.end method

.method public a(Z)V
    .locals 3

    .line 180
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "VideoCapture[%d]: stop screen"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, ""

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {v2, p1, v0, v1}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 181
    iget-object p0, p0, Lcom/tencent/liteav/i;->a:Lcom/tencent/liteav/screencapture/a;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/screencapture/a;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public a(I)Z
    .locals 0

    .line 173
    const/4 p0, 0x0

    return p0
.end method

.method public b()V
    .locals 1

    .line 54
    iget-object p0, p0, Lcom/tencent/liteav/i;->a:Lcom/tencent/liteav/screencapture/a;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/screencapture/a;->a(Z)V

    return-void
.end method

.method public b(I)V
    .locals 0

    .line 55
    return-void
.end method

.method public b(II)V
    .locals 0

    .line 56
    iput p1, p0, Lcom/tencent/liteav/i;->g:I

    .line 57
    iput p2, p0, Lcom/tencent/liteav/i;->h:I

    return-void
.end method

.method public b(Z)V
    .locals 2

    .line 1
    iget p1, p0, Lcom/tencent/liteav/i;->g:I

    .line 2
    .line 3
    iget v0, p0, Lcom/tencent/liteav/i;->h:I

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Lcom/tencent/liteav/i;->c(II)Lcom/tencent/liteav/basic/util/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/i;->f:Lcom/tencent/liteav/basic/util/d;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/basic/util/d;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iput-object p1, p0, Lcom/tencent/liteav/i;->f:Lcom/tencent/liteav/basic/util/d;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/tencent/liteav/i;->a:Lcom/tencent/liteav/screencapture/a;

    .line 20
    .line 21
    iget v1, p1, Lcom/tencent/liteav/basic/util/d;->a:I

    .line 22
    .line 23
    iget p1, p1, Lcom/tencent/liteav/basic/util/d;->b:I

    .line 24
    .line 25
    invoke-virtual {v0, v1, p1}, Lcom/tencent/liteav/screencapture/a;->a(II)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/tencent/liteav/i;->f:Lcom/tencent/liteav/basic/util/d;

    .line 29
    .line 30
    iget v0, p0, Lcom/tencent/liteav/i;->g:I

    .line 31
    .line 32
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget p0, p0, Lcom/tencent/liteav/i;->h:I

    .line 37
    .line 38
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    filled-new-array {p1, v0, p0}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p1, "TXCScreenCaptureSource"

    .line 47
    .line 48
    const-string v0, "capture size: %s, encode size: %dx%d"

    .line 49
    .line 50
    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 62
    iget-object p0, p0, Lcom/tencent/liteav/i;->a:Lcom/tencent/liteav/screencapture/a;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/screencapture/a;->a(Z)V

    return-void
.end method

.method public c(I)V
    .locals 0

    .line 61
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 60
    return-void
.end method

.method public d(I)V
    .locals 0

    .line 2
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public d(Z)Z
    .locals 0

    .line 3
    const/4 p0, 0x0

    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public e(I)V
    .locals 0

    .line 2
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 3
    return-void
.end method

.method public f()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/tencent/liteav/i;->c:Ljavax/microedition/khronos/egl/EGLContext;

    return-object p0
.end method

.method public f(I)V
    .locals 0

    .line 21
    iput p1, p0, Lcom/tencent/liteav/i;->e:I

    .line 22
    iget-object p0, p0, Lcom/tencent/liteav/i;->a:Lcom/tencent/liteav/screencapture/a;

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/screencapture/a;->a(I)V

    return-void
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/i;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public g(I)V
    .locals 0

    .line 4
    iput p1, p0, Lcom/tencent/liteav/i;->j:I

    return-void
.end method

.method public h()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public i()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public j()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public k()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public l()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
