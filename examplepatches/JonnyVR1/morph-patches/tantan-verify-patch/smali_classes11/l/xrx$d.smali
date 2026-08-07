.class public final Ll/xrx$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xrx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xrx$d$b;
    }
.end annotation


# instance fields
.field public final a:Ll/mel0;

.field public final b:Ll/xrx;

.field public final c:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Landroid/util/Pair<",
            "Ljava/lang/Long;",
            "Lcom/google/android/exoplayer2/k;",
            ">;>;"
        }
    .end annotation
.end field

.field public e:Landroid/os/Handler;

.field public f:Ll/jel0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/ype;",
            ">;"
        }
    .end annotation
.end field

.field public h:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Ljava/lang/Long;",
            "Lcom/google/android/exoplayer2/k;",
            ">;"
        }
    .end annotation
.end field

.field public j:Landroid/util/Pair;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Landroid/view/Surface;",
            "Ll/brf0;",
            ">;"
        }
    .end annotation
.end field

.field public k:I

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:J

.field public q:Ll/zjl0;

.field public r:J

.field public s:J


# direct methods
.method public constructor <init>(Ll/mel0;Ll/xrx;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xrx$d;->a:Ll/mel0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xrx$d;->b:Ll/xrx;

    .line 7
    .line 8
    new-instance p1, Ljava/util/ArrayDeque;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/xrx$d;->c:Ljava/util/ArrayDeque;

    .line 14
    .line 15
    new-instance p1, Ljava/util/ArrayDeque;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/xrx$d;->d:Ljava/util/ArrayDeque;

    .line 21
    .line 22
    const/4 p1, -0x1

    .line 23
    iput p1, p0, Ll/xrx$d;->k:I

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Ll/xrx$d;->l:Z

    .line 27
    .line 28
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    iput-wide p1, p0, Ll/xrx$d;->p:J

    .line 34
    .line 35
    sget-object v0, Ll/zjl0;->e:Ll/zjl0;

    .line 36
    .line 37
    iput-object v0, p0, Ll/xrx$d;->q:Ll/zjl0;

    .line 38
    .line 39
    iput-wide p1, p0, Ll/xrx$d;->r:J

    .line 40
    .line 41
    iput-wide p1, p0, Ll/xrx$d;->s:J

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public a(Landroid/media/MediaFormat;)Landroid/media/MediaFormat;
    .locals 2

    .line 1
    sget v0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/xrx$d;->b:Ll/xrx;

    .line 8
    .line 9
    invoke-static {p0}, Ll/xrx;->z1(Ll/xrx;)Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 22
    .line 23
    if-lt p0, v1, :cond_0

    .line 24
    .line 25
    const-string p0, "allow-frame-drop"

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p1, p0, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-object p1
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jel0;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {v0, v1}, Ll/jel0;->a(Ll/cah0;)V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ll/xrx$d;->j:Landroid/util/Pair;

    .line 14
    .line 15
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/jel0;->flush()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/xrx$d;->c:Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/xrx$d;->e:Landroid/os/Handler;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-boolean v0, p0, Ll/xrx$d;->m:Z

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Ll/xrx$d;->m:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Ll/xrx$d;->n:Z

    .line 30
    .line 31
    iput-boolean v0, p0, Ll/xrx$d;->o:Z

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public d(JJ)J
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/xrx$d;->s:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 16
    .line 17
    .line 18
    add-long/2addr p1, p3

    .line 19
    iget-wide p3, p0, Ll/xrx$d;->s:J

    .line 20
    .line 21
    sub-long/2addr p1, p3

    .line 22
    return-wide p1
.end method

.method public e()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/jel0;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/jel0;->b()Landroid/view/Surface;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public g()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xrx$d;->j:Landroid/util/Pair;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ll/brf0;

    .line 8
    .line 9
    sget-object v0, Ll/brf0;->c:Ll/brf0;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/brf0;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public h(Lcom/google/android/exoplayer2/k;J)Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xrx$d;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    xor-int/2addr v0, v1

    .line 7
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p0, Ll/xrx$d;->l:Z

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return v2

    .line 16
    :cond_0
    iget-object v0, p0, Ll/xrx$d;->g:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iput-boolean v2, p0, Ll/xrx$d;->l:Z

    .line 21
    .line 22
    return v2

    .line 23
    :cond_1
    invoke-static {}, Ll/bmk0;->w()Landroid/os/Handler;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/xrx$d;->e:Landroid/os/Handler;

    .line 28
    .line 29
    iget-object v0, p0, Ll/xrx$d;->b:Ll/xrx;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/google/android/exoplayer2/k;->x:Ll/df5;

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Ll/xrx;->T1(Ll/df5;)Landroid/util/Pair;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :try_start_0
    invoke-static {}, Ll/xrx;->y1()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_2

    .line 42
    .line 43
    iget v3, p1, Lcom/google/android/exoplayer2/k;->t:I

    .line 44
    .line 45
    if-eqz v3, :cond_2

    .line 46
    .line 47
    iget-object v4, p0, Ll/xrx$d;->g:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 48
    .line 49
    int-to-float v3, v3

    .line 50
    invoke-static {v3}, Ll/xrx$d$b;->a(F)Ll/ype;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v4, v2, v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(ILjava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catch_0
    move-exception v0

    .line 59
    move-object p2, v0

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    :goto_0
    invoke-static {}, Ll/xrx$d$b;->b()Ll/jel0$a;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v3, p0, Ll/xrx$d;->b:Ll/xrx;

    .line 66
    .line 67
    invoke-static {v3}, Ll/xrx;->z1(Ll/xrx;)Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    iget-object v4, p0, Ll/xrx$d;->g:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 72
    .line 73
    invoke-static {v4}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    check-cast v4, Ljava/util/List;

    .line 78
    .line 79
    sget-object v5, Ll/qhd;->a:Ll/qhd;

    .line 80
    .line 81
    iget-object v6, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast v6, Ll/df5;

    .line 84
    .line 85
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 86
    .line 87
    move-object v7, v0

    .line 88
    check-cast v7, Ll/df5;

    .line 89
    .line 90
    iget-object v0, p0, Ll/xrx$d;->e:Landroid/os/Handler;

    .line 91
    .line 92
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    new-instance v9, Ll/mmd;

    .line 96
    .line 97
    invoke-direct {v9, v0}, Ll/mmd;-><init>(Landroid/os/Handler;)V

    .line 98
    .line 99
    .line 100
    new-instance v10, Ll/xrx$d$a;

    .line 101
    .line 102
    invoke-direct {v10, p0, p1}, Ll/xrx$d$a;-><init>(Ll/xrx$d;Lcom/google/android/exoplayer2/k;)V

    .line 103
    .line 104
    .line 105
    const/4 v8, 0x0

    .line 106
    invoke-interface/range {v2 .. v10}, Ll/jel0$a;->a(Landroid/content/Context;Ljava/util/List;Ll/qhd;Ll/df5;Ll/df5;ZLjava/util/concurrent/Executor;Ll/jel0$b;)Ll/jel0;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 111
    .line 112
    invoke-interface {v0, v1}, Ll/jel0;->c(I)V

    .line 113
    .line 114
    .line 115
    iput-wide p2, p0, Ll/xrx$d;->s:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    .line 117
    iget-object p2, p0, Ll/xrx$d;->j:Landroid/util/Pair;

    .line 118
    .line 119
    if-eqz p2, :cond_3

    .line 120
    .line 121
    iget-object p3, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast p3, Ll/brf0;

    .line 124
    .line 125
    iget-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 126
    .line 127
    new-instance v2, Ll/cah0;

    .line 128
    .line 129
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 130
    .line 131
    check-cast p2, Landroid/view/Surface;

    .line 132
    .line 133
    invoke-virtual {p3}, Ll/brf0;->b()I

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    invoke-virtual {p3}, Ll/brf0;->a()I

    .line 138
    .line 139
    .line 140
    move-result p3

    .line 141
    invoke-direct {v2, p2, v3, p3}, Ll/cah0;-><init>(Landroid/view/Surface;II)V

    .line 142
    .line 143
    .line 144
    invoke-interface {v0, v2}, Ll/jel0;->a(Ll/cah0;)V

    .line 145
    .line 146
    .line 147
    :cond_3
    invoke-virtual {p0, p1}, Ll/xrx$d;->o(Lcom/google/android/exoplayer2/k;)V

    .line 148
    .line 149
    .line 150
    return v1

    .line 151
    :goto_1
    iget-object p0, p0, Ll/xrx$d;->b:Ll/xrx;

    .line 152
    .line 153
    const/16 p3, 0x1b58

    .line 154
    .line 155
    invoke-static {p0, p2, p1, p3}, Ll/xrx;->A1(Ll/xrx;Ljava/lang/Throwable;Lcom/google/android/exoplayer2/k;I)Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    throw p0
.end method

.method public i(Lcom/google/android/exoplayer2/k;JZ)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/xrx$d;->k:I

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    move v0, v3

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v2

    .line 16
    :goto_0
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 20
    .line 21
    invoke-interface {v0}, Ll/jel0;->g()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget v1, p0, Ll/xrx$d;->k:I

    .line 26
    .line 27
    if-ge v0, v1, :cond_4

    .line 28
    .line 29
    iget-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 30
    .line 31
    invoke-interface {v0}, Ll/jel0;->f()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/xrx$d;->i:Landroid/util/Pair;

    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Ll/xrx$d;->i:Landroid/util/Pair;

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 50
    .line 51
    invoke-static {p1, v0}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Ll/xrx$d;->d:Ljava/util/ArrayDeque;

    .line 58
    .line 59
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v1, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_1
    if-eqz p4, :cond_3

    .line 71
    .line 72
    iput-boolean v3, p0, Ll/xrx$d;->m:Z

    .line 73
    .line 74
    iput-wide p2, p0, Ll/xrx$d;->p:J

    .line 75
    .line 76
    :cond_3
    return v3

    .line 77
    :cond_4
    return v2
.end method

.method public j(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xrx$d;->b:Ll/xrx;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xrx;->z1(Ll/xrx;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, p1, v1}, Ll/bmk0;->c0(Landroid/content/Context;Ljava/lang/String;Z)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Ll/xrx$d;->k:I

    .line 13
    .line 14
    return-void
.end method

.method public final k(JZ)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 7
    .line 8
    invoke-interface {v0, p1, p2}, Ll/jel0;->e(J)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/xrx$d;->c:Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/xrx$d;->b:Ll/xrx;

    .line 17
    .line 18
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    const-wide/16 v3, 0x3e8

    .line 23
    .line 24
    mul-long/2addr v1, v3

    .line 25
    invoke-static {v0, v1, v2}, Ll/xrx;->G1(Ll/xrx;J)J

    .line 26
    .line 27
    .line 28
    const-wide/16 v0, -0x2

    .line 29
    .line 30
    cmp-long p1, p1, v0

    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Ll/xrx$d;->b:Ll/xrx;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/xrx;->f2()V

    .line 37
    .line 38
    .line 39
    :cond_0
    if-eqz p3, :cond_1

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    iput-boolean p1, p0, Ll/xrx$d;->o:Z

    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public l(JJ)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/xrx$d;->f:Ll/jel0;

    .line 4
    .line 5
    invoke-static {v1}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    :goto_0
    iget-object v1, v0, Ll/xrx$d;->c:Ljava/util/ArrayDeque;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_8

    .line 15
    .line 16
    iget-object v1, v0, Ll/xrx$d;->b:Ll/xrx;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/d;->getState()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x2

    .line 23
    const/4 v11, 0x0

    .line 24
    const/4 v12, 0x1

    .line 25
    if-ne v1, v2, :cond_0

    .line 26
    .line 27
    move v10, v12

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    move v10, v11

    .line 30
    :goto_1
    iget-object v1, v0, Ll/xrx$d;->c:Ljava/util/ArrayDeque;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ljava/lang/Long;

    .line 37
    .line 38
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ljava/lang/Long;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 45
    .line 46
    .line 47
    move-result-wide v13

    .line 48
    iget-wide v1, v0, Ll/xrx$d;->s:J

    .line 49
    .line 50
    add-long v8, v13, v1

    .line 51
    .line 52
    iget-object v1, v0, Ll/xrx$d;->b:Ll/xrx;

    .line 53
    .line 54
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 55
    .line 56
    .line 57
    move-result-wide v2

    .line 58
    const-wide/16 v15, 0x3e8

    .line 59
    .line 60
    mul-long v6, v2, v15

    .line 61
    .line 62
    move-wide/from16 v2, p1

    .line 63
    .line 64
    move-wide/from16 v4, p3

    .line 65
    .line 66
    invoke-static/range {v1 .. v10}, Ll/xrx;->B1(Ll/xrx;JJJJZ)J

    .line 67
    .line 68
    .line 69
    move-result-wide v6

    .line 70
    move-wide/from16 v23, v8

    .line 71
    .line 72
    move-wide v8, v2

    .line 73
    move-wide/from16 v1, v23

    .line 74
    .line 75
    iget-boolean v3, v0, Ll/xrx$d;->n:Z

    .line 76
    .line 77
    if-eqz v3, :cond_1

    .line 78
    .line 79
    iget-object v3, v0, Ll/xrx$d;->c:Ljava/util/ArrayDeque;

    .line 80
    .line 81
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->size()I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-ne v3, v12, :cond_1

    .line 86
    .line 87
    move v11, v12

    .line 88
    :cond_1
    iget-object v3, v0, Ll/xrx$d;->b:Ll/xrx;

    .line 89
    .line 90
    invoke-static {v3, v8, v9, v6, v7}, Ll/xrx;->C1(Ll/xrx;JJ)Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-eqz v3, :cond_2

    .line 95
    .line 96
    const-wide/16 v1, -0x1

    .line 97
    .line 98
    invoke-virtual {v0, v1, v2, v11}, Ll/xrx$d;->k(JZ)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_2
    if-eqz v10, :cond_8

    .line 103
    .line 104
    iget-object v3, v0, Ll/xrx$d;->b:Ll/xrx;

    .line 105
    .line 106
    invoke-static {v3}, Ll/xrx;->D1(Ll/xrx;)J

    .line 107
    .line 108
    .line 109
    move-result-wide v3

    .line 110
    cmp-long v3, v8, v3

    .line 111
    .line 112
    if-nez v3, :cond_3

    .line 113
    .line 114
    goto/16 :goto_2

    .line 115
    .line 116
    :cond_3
    const-wide/32 v3, 0xc350

    .line 117
    .line 118
    .line 119
    cmp-long v3, v6, v3

    .line 120
    .line 121
    if-lez v3, :cond_4

    .line 122
    .line 123
    goto/16 :goto_2

    .line 124
    .line 125
    :cond_4
    iget-object v3, v0, Ll/xrx$d;->a:Ll/mel0;

    .line 126
    .line 127
    invoke-virtual {v3, v1, v2}, Ll/mel0;->h(J)V

    .line 128
    .line 129
    .line 130
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 131
    .line 132
    .line 133
    move-result-wide v3

    .line 134
    mul-long/2addr v6, v15

    .line 135
    add-long/2addr v3, v6

    .line 136
    iget-object v5, v0, Ll/xrx$d;->a:Ll/mel0;

    .line 137
    .line 138
    invoke-virtual {v5, v3, v4}, Ll/mel0;->b(J)J

    .line 139
    .line 140
    .line 141
    move-result-wide v5

    .line 142
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 143
    .line 144
    .line 145
    move-result-wide v3

    .line 146
    sub-long v3, v5, v3

    .line 147
    .line 148
    div-long v18, v3, v15

    .line 149
    .line 150
    iget-object v3, v0, Ll/xrx$d;->b:Ll/xrx;

    .line 151
    .line 152
    move-wide/from16 v20, p3

    .line 153
    .line 154
    move-object/from16 v17, v3

    .line 155
    .line 156
    move/from16 v22, v11

    .line 157
    .line 158
    invoke-virtual/range {v17 .. v22}, Ll/xrx;->w2(JJZ)Z

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    if-eqz v3, :cond_5

    .line 163
    .line 164
    const-wide/16 v1, -0x2

    .line 165
    .line 166
    invoke-virtual {v0, v1, v2, v11}, Ll/xrx$d;->k(JZ)V

    .line 167
    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :cond_5
    iget-object v3, v0, Ll/xrx$d;->d:Ljava/util/ArrayDeque;

    .line 172
    .line 173
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    if-nez v3, :cond_6

    .line 178
    .line 179
    iget-object v3, v0, Ll/xrx$d;->d:Ljava/util/ArrayDeque;

    .line 180
    .line 181
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    check-cast v3, Landroid/util/Pair;

    .line 186
    .line 187
    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 188
    .line 189
    check-cast v3, Ljava/lang/Long;

    .line 190
    .line 191
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 192
    .line 193
    .line 194
    move-result-wide v3

    .line 195
    cmp-long v3, v1, v3

    .line 196
    .line 197
    if-lez v3, :cond_6

    .line 198
    .line 199
    iget-object v3, v0, Ll/xrx$d;->d:Ljava/util/ArrayDeque;

    .line 200
    .line 201
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    check-cast v3, Landroid/util/Pair;

    .line 206
    .line 207
    iput-object v3, v0, Ll/xrx$d;->i:Landroid/util/Pair;

    .line 208
    .line 209
    :cond_6
    move-wide v3, v1

    .line 210
    iget-object v2, v0, Ll/xrx$d;->b:Ll/xrx;

    .line 211
    .line 212
    iget-object v1, v0, Ll/xrx$d;->i:Landroid/util/Pair;

    .line 213
    .line 214
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 215
    .line 216
    move-object v7, v1

    .line 217
    check-cast v7, Lcom/google/android/exoplayer2/k;

    .line 218
    .line 219
    move-wide/from16 v23, v13

    .line 220
    .line 221
    move-wide v13, v3

    .line 222
    move-wide/from16 v3, v23

    .line 223
    .line 224
    invoke-static/range {v2 .. v7}, Ll/xrx;->E1(Ll/xrx;JJLcom/google/android/exoplayer2/k;)V

    .line 225
    .line 226
    .line 227
    iget-wide v1, v0, Ll/xrx$d;->r:J

    .line 228
    .line 229
    cmp-long v1, v1, v13

    .line 230
    .line 231
    if-ltz v1, :cond_7

    .line 232
    .line 233
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    iput-wide v1, v0, Ll/xrx$d;->r:J

    .line 239
    .line 240
    iget-object v1, v0, Ll/xrx$d;->b:Ll/xrx;

    .line 241
    .line 242
    iget-object v2, v0, Ll/xrx$d;->q:Ll/zjl0;

    .line 243
    .line 244
    invoke-static {v1, v2}, Ll/xrx;->F1(Ll/xrx;Ll/zjl0;)V

    .line 245
    .line 246
    .line 247
    :cond_7
    invoke-virtual {v0, v5, v6, v11}, Ll/xrx$d;->k(JZ)V

    .line 248
    .line 249
    .line 250
    goto/16 :goto_0

    .line 251
    .line 252
    :cond_8
    :goto_2
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/xrx$d;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jel0;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/jel0;->release()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 14
    .line 15
    iget-object v1, p0, Ll/xrx$d;->e:Landroid/os/Handler;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/xrx$d;->g:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Ll/xrx$d;->c:Ljava/util/ArrayDeque;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    iput-boolean v0, p0, Ll/xrx$d;->l:Z

    .line 36
    .line 37
    return-void
.end method

.method public o(Lcom/google/android/exoplayer2/k;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jel0;

    .line 8
    .line 9
    new-instance v1, Ll/p6j$b;

    .line 10
    .line 11
    iget v2, p1, Lcom/google/android/exoplayer2/k;->q:I

    .line 12
    .line 13
    iget v3, p1, Lcom/google/android/exoplayer2/k;->r:I

    .line 14
    .line 15
    invoke-direct {v1, v2, v3}, Ll/p6j$b;-><init>(II)V

    .line 16
    .line 17
    .line 18
    iget v2, p1, Lcom/google/android/exoplayer2/k;->u:F

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ll/p6j$b;->b(F)Ll/p6j$b;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ll/p6j$b;->a()Ll/p6j;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v0, v1}, Ll/jel0;->d(Ll/p6j;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/xrx$d;->h:Lcom/google/android/exoplayer2/k;

    .line 32
    .line 33
    iget-boolean p1, p0, Ll/xrx$d;->m:Z

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Ll/xrx$d;->m:Z

    .line 39
    .line 40
    iput-boolean p1, p0, Ll/xrx$d;->n:Z

    .line 41
    .line 42
    iput-boolean p1, p0, Ll/xrx$d;->o:Z

    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public p(Landroid/view/Surface;Ll/brf0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xrx$d;->j:Landroid/util/Pair;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Landroid/view/Surface;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/xrx$d;->j:Landroid/util/Pair;

    .line 16
    .line 17
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Ll/brf0;

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ll/brf0;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/xrx$d;->j:Landroid/util/Pair;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xrx$d;->f()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Ll/xrx$d;->f:Ll/jel0;

    .line 41
    .line 42
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ll/jel0;

    .line 47
    .line 48
    new-instance v0, Ll/cah0;

    .line 49
    .line 50
    invoke-virtual {p2}, Ll/brf0;->b()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {p2}, Ll/brf0;->a()I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    invoke-direct {v0, p1, v1, p2}, Ll/cah0;-><init>(Landroid/view/Surface;II)V

    .line 59
    .line 60
    .line 61
    invoke-interface {p0, v0}, Ll/jel0;->a(Ll/cah0;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    :goto_0
    return-void
.end method

.method public q(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ype;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xrx$d;->g:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>(Ljava/util/Collection;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/xrx$d;->g:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/xrx$d;->g:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method
