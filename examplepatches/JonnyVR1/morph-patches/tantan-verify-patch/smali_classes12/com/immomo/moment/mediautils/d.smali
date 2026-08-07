.class public Lcom/immomo/moment/mediautils/d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/d$c;,
        Lcom/immomo/moment/mediautils/d$a;,
        Lcom/immomo/moment/mediautils/d$b;,
        Lcom/immomo/moment/mediautils/d$d;
    }
.end annotation


# static fields
.field private static v:I = 0x1

.field private static w:I = 0x2


# instance fields
.field private a:Landroid/media/AudioTrack;

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:[B

.field private g:I

.field private h:Z

.field private i:Ljava/lang/Object;

.field private j:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/ad60;",
            ">;"
        }
    .end annotation
.end field

.field private volatile k:Z

.field private l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/bc1;",
            ">;"
        }
    .end annotation
.end field

.field private m:I

.field private n:I

.field private o:J

.field private p:Z

.field q:Lcom/immomo/moment/mediautils/d$c;

.field r:Lcom/immomo/moment/mediautils/d$d;

.field s:Lcom/immomo/moment/mediautils/d$b;

.field t:Lcom/immomo/moment/mediautils/d$a;

.field private u:Ll/spw;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/immomo/moment/mediautils/d;->a:Landroid/media/AudioTrack;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->b:I

    .line 9
    .line 10
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->c:I

    .line 11
    .line 12
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->d:I

    .line 13
    .line 14
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->e:I

    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/moment/mediautils/d;->f:[B

    .line 17
    .line 18
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->g:I

    .line 19
    .line 20
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/d;->h:Z

    .line 21
    .line 22
    new-instance v2, Ljava/lang/Object;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v2, p0, Lcom/immomo/moment/mediautils/d;->i:Ljava/lang/Object;

    .line 28
    .line 29
    new-instance v2, Ljava/util/LinkedList;

    .line 30
    .line 31
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v2, p0, Lcom/immomo/moment/mediautils/d;->j:Ljava/util/LinkedList;

    .line 35
    .line 36
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/d;->k:Z

    .line 37
    .line 38
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->m:I

    .line 39
    .line 40
    const/4 v1, 0x3

    .line 41
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->n:I

    .line 42
    .line 43
    const-wide/16 v1, -0x1

    .line 44
    .line 45
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/d;->o:J

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/d;->p:Z

    .line 49
    .line 50
    iput-object v0, p0, Lcom/immomo/moment/mediautils/d;->u:Ll/spw;

    .line 51
    .line 52
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 3

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 54
    iput-object v0, p0, Lcom/immomo/moment/mediautils/d;->a:Landroid/media/AudioTrack;

    const/4 v1, 0x0

    .line 55
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->b:I

    .line 56
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->c:I

    .line 57
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->d:I

    .line 58
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->e:I

    .line 59
    iput-object v0, p0, Lcom/immomo/moment/mediautils/d;->f:[B

    .line 60
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->g:I

    .line 61
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/d;->h:Z

    .line 62
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/d;->i:Ljava/lang/Object;

    .line 63
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/d;->j:Ljava/util/LinkedList;

    .line 64
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/d;->k:Z

    .line 65
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->m:I

    const/4 v1, 0x3

    .line 66
    iput v1, p0, Lcom/immomo/moment/mediautils/d;->n:I

    const-wide/16 v1, -0x1

    .line 67
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/d;->o:J

    .line 68
    iput-object v0, p0, Lcom/immomo/moment/mediautils/d;->u:Ll/spw;

    .line 69
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/d;->p:Z

    return-void
.end method

.method public static synthetic a(Lcom/immomo/moment/mediautils/d;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/d;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/immomo/moment/mediautils/d;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/d;->j:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/immomo/moment/mediautils/d;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/d;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d()I
    .locals 1

    .line 1
    sget v0, Lcom/immomo/moment/mediautils/d;->v:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic e(Lcom/immomo/moment/mediautils/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/d;->i:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/immomo/moment/mediautils/d;Ll/ad60;)Ll/ad60;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/d;->k(Ll/ad60;)Ll/ad60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g(Lcom/immomo/moment/mediautils/d;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/d;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Lcom/immomo/moment/mediautils/d;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/d;->w(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/immomo/moment/mediautils/d;)Ll/spw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/d;->u:Ll/spw;

    .line 2
    .line 3
    return-object p0
.end method

.method private declared-synchronized k(Ll/ad60;)Ll/ad60;
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->l:Ljava/util/List;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/bc1;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget v2, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget-wide v3, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 38
    .line 39
    invoke-virtual {v1, p1, v2, v3, v4}, Ll/bc1;->b(Ll/ad60;IJ)Ll/ad60;

    .line 40
    .line 41
    .line 42
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    monitor-exit p0

    .line 46
    return-object p1

    .line 47
    :catchall_0
    move-exception p1

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    monitor-exit p0

    .line 50
    return-object p1

    .line 51
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    throw p1
.end method

.method private w(J)V
    .locals 10

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "start audioPts:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " videoPts:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/d;->o:J

    .line 17
    .line 18
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, " avdiff:"

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/d;->o:J

    .line 27
    .line 28
    sub-long v3, p1, v3

    .line 29
    .line 30
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v3, "AudioPlayer"

    .line 38
    .line 39
    invoke-static {v3, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 43
    .line 44
    .line 45
    move-result-wide v4

    .line 46
    :cond_0
    iget-wide v6, p0, Lcom/immomo/moment/mediautils/d;->o:J

    .line 47
    .line 48
    const-wide/16 v8, -0x1

    .line 49
    .line 50
    cmp-long v0, v6, v8

    .line 51
    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    sub-long v6, p1, v6

    .line 55
    .line 56
    const-wide/16 v8, 0x32

    .line 57
    .line 58
    cmp-long v0, v6, v8

    .line 59
    .line 60
    if-lez v0, :cond_2

    .line 61
    .line 62
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/d;->k:Z

    .line 63
    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    :cond_1
    const-wide/16 v6, 0xa

    .line 67
    .line 68
    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catch_0
    move-exception v0

    .line 73
    invoke-static {v3, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 77
    .line 78
    .line 79
    move-result-wide v6

    .line 80
    sub-long/2addr v6, v4

    .line 81
    const-wide/16 v8, 0x1388

    .line 82
    .line 83
    cmp-long v0, v6, v8

    .line 84
    .line 85
    if-lez v0, :cond_0

    .line 86
    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v6, "timeout:"

    .line 90
    .line 91
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 95
    .line 96
    .line 97
    move-result-wide v6

    .line 98
    sub-long/2addr v6, v4

    .line 99
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v3, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v6, "end costTime:"

    .line 112
    .line 113
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 117
    .line 118
    .line 119
    move-result-wide v6

    .line 120
    sub-long/2addr v6, v4

    .line 121
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v4, " audioPts:"

    .line 125
    .line 126
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    iget-wide v4, p0, Lcom/immomo/moment/mediautils/d;->o:J

    .line 136
    .line 137
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    iget-wide v1, p0, Lcom/immomo/moment/mediautils/d;->o:J

    .line 144
    .line 145
    sub-long/2addr p1, v1

    .line 146
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-static {v3, p0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method


# virtual methods
.method public declared-synchronized j(Ll/bc1;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "AudioPlayer"

    .line 3
    .line 4
    const-string v1, "AudioPlayer addAudioProcessor !!!"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->l:Ljava/util/List;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/immomo/moment/mediautils/d;->l:Ljava/util/List;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->l:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    throw p1
.end method

.method public declared-synchronized l()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "AudioPlayer"

    .line 3
    .line 4
    const-string v1, "AudioPlayer clearAudioProcessor !!!"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->l:Ljava/util/List;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v0
.end method

.method public m()V
    .locals 2

    .line 1
    const-string v0, "AudioPlayer"

    .line 2
    .line 3
    const-string v1, "AudioPlayer pause !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v0, Lcom/immomo/moment/mediautils/d;->w:I

    .line 9
    .line 10
    iput v0, p0, Lcom/immomo/moment/mediautils/d;->m:I

    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->a:Landroid/media/AudioTrack;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/d;->h:Z

    .line 21
    .line 22
    const-wide/16 v0, -0x1

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/d;->o:J

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public n(III)Z
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioPlayer prepare sampleRate = "

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
    const-string v1, " bits = "

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
    const-string v1, " channels = "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "AudioPlayer"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    const/16 v3, 0x1771

    .line 38
    .line 39
    if-eqz p1, :cond_4

    .line 40
    .line 41
    if-eqz p2, :cond_4

    .line 42
    .line 43
    if-nez p3, :cond_0

    .line 44
    .line 45
    goto/16 :goto_4

    .line 46
    .line 47
    :cond_0
    iput p1, p0, Lcom/immomo/moment/mediautils/d;->b:I

    .line 48
    .line 49
    iput p2, p0, Lcom/immomo/moment/mediautils/d;->d:I

    .line 50
    .line 51
    iput p3, p0, Lcom/immomo/moment/mediautils/d;->c:I

    .line 52
    .line 53
    const/4 v0, 0x2

    .line 54
    if-ne p3, v0, :cond_1

    .line 55
    .line 56
    const/16 p3, 0xc

    .line 57
    .line 58
    :goto_0
    move v7, p3

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    const/4 p3, 0x4

    .line 61
    goto :goto_0

    .line 62
    :goto_1
    const/16 p3, 0x10

    .line 63
    .line 64
    if-ne p2, p3, :cond_2

    .line 65
    .line 66
    :goto_2
    move v8, v0

    .line 67
    goto :goto_3

    .line 68
    :cond_2
    const/4 v0, 0x3

    .line 69
    goto :goto_2

    .line 70
    :goto_3
    :try_start_0
    invoke-static {p1, v7, v8}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iput p1, p0, Lcom/immomo/moment/mediautils/d;->e:I

    .line 75
    .line 76
    new-instance v4, Landroid/media/AudioTrack;

    .line 77
    .line 78
    iget v5, p0, Lcom/immomo/moment/mediautils/d;->n:I

    .line 79
    .line 80
    iget v6, p0, Lcom/immomo/moment/mediautils/d;->b:I

    .line 81
    .line 82
    iget v9, p0, Lcom/immomo/moment/mediautils/d;->e:I

    .line 83
    .line 84
    const/4 v10, 0x1

    .line 85
    invoke-direct/range {v4 .. v10}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 86
    .line 87
    .line 88
    iput-object v4, p0, Lcom/immomo/moment/mediautils/d;->a:Landroid/media/AudioTrack;

    .line 89
    .line 90
    invoke-virtual {v4}, Landroid/media/AudioTrack;->play()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .line 92
    .line 93
    iget p1, p0, Lcom/immomo/moment/mediautils/d;->e:I

    .line 94
    .line 95
    new-array p1, p1, [B

    .line 96
    .line 97
    iput-object p1, p0, Lcom/immomo/moment/mediautils/d;->f:[B

    .line 98
    .line 99
    new-instance p1, Lcom/immomo/moment/mediautils/d$c;

    .line 100
    .line 101
    invoke-direct {p1, p0}, Lcom/immomo/moment/mediautils/d$c;-><init>(Lcom/immomo/moment/mediautils/d;)V

    .line 102
    .line 103
    .line 104
    iput-object p1, p0, Lcom/immomo/moment/mediautils/d;->q:Lcom/immomo/moment/mediautils/d$c;

    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 107
    .line 108
    .line 109
    sget p1, Lcom/immomo/moment/mediautils/d;->v:I

    .line 110
    .line 111
    iput p1, p0, Lcom/immomo/moment/mediautils/d;->m:I

    .line 112
    .line 113
    const/4 p0, 0x1

    .line 114
    return p0

    .line 115
    :catch_0
    move-exception v0

    .line 116
    move-object p1, v0

    .line 117
    const/4 p2, 0x0

    .line 118
    iput-object p2, p0, Lcom/immomo/moment/mediautils/d;->a:Landroid/media/AudioTrack;

    .line 119
    .line 120
    new-instance p2, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string p3, "Audio Player Initialize error + audioSampleRate = "

    .line 123
    .line 124
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget p3, p0, Lcom/immomo/moment/mediautils/d;->b:I

    .line 128
    .line 129
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-static {v1, p2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Lcom/immomo/moment/mediautils/d;->u:Ll/spw;

    .line 140
    .line 141
    if-eqz p0, :cond_3

    .line 142
    .line 143
    new-instance p2, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string p3, "Audio Player Initialize error !!!"

    .line 146
    .line 147
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-interface {p0, v3, p1}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_3
    return v2

    .line 165
    :cond_4
    :goto_4
    iget-object p0, p0, Lcom/immomo/moment/mediautils/d;->u:Ll/spw;

    .line 166
    .line 167
    if-eqz p0, :cond_5

    .line 168
    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    const-string v1, "Audio Player sampleRate:"

    .line 172
    .line 173
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    const-string p1, " bits:"

    .line 180
    .line 181
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string p1, " channels:"

    .line 188
    .line 189
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-interface {p0, v3, p1}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 200
    .line 201
    .line 202
    :cond_5
    return v2
.end method

.method public o()V
    .locals 4

    .line 1
    const-string v0, "AudioPlayer"

    .line 2
    .line 3
    const-string v1, "AudioPlayer release !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/d;->k:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->q:Lcom/immomo/moment/mediautils/d$c;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->i:Ljava/lang/Object;

    .line 16
    .line 17
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    :try_start_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/d;->i:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 21
    .line 22
    .line 23
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    :try_start_2
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->q:Lcom/immomo/moment/mediautils/d$c;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->q:Lcom/immomo/moment/mediautils/d$c;

    .line 30
    .line 31
    const-wide/16 v1, 0x3e8

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Ljava/lang/Thread;->join(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :catch_0
    move-exception v0

    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception v1

    .line 40
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 41
    :try_start_4
    throw v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 42
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/d;->u:Ll/spw;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    new-instance v2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v3, "Audio Player release failed !!!"

    .line 49
    .line 50
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const/16 v3, 0x1773

    .line 65
    .line 66
    invoke-interface {v1, v3, v2}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    const-string v1, "AudioPlayer"

    .line 70
    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v3, "Audio Player release failed !!!"

    .line 74
    .line 75
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->a:Landroid/media/AudioTrack;

    .line 93
    .line 94
    if-eqz v0, :cond_2

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    .line 97
    .line 98
    .line 99
    :cond_2
    iget-object p0, p0, Lcom/immomo/moment/mediautils/d;->j:Ljava/util/LinkedList;

    .line 100
    .line 101
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public p()V
    .locals 3

    .line 1
    const-string v0, "AudioPlayer"

    .line 2
    .line 3
    const-string v1, "AudioPlayer reset !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->i:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/d;->j:Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/immomo/moment/mediautils/d;->a:Landroid/media/AudioTrack;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/media/AudioTrack;->flush()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/d;->r:Lcom/immomo/moment/mediautils/d$d;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const-wide/16 v1, 0x0

    .line 31
    .line 32
    invoke-interface {p0, v1, v2}, Lcom/immomo/moment/mediautils/d$d;->onAudioPlayingPosition(J)V

    .line 33
    .line 34
    .line 35
    :cond_1
    monitor-exit v0

    .line 36
    return-void

    .line 37
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p0
.end method

.method public q()V
    .locals 4

    .line 1
    const-string v0, "AudioPlayer resume !!!"

    .line 2
    .line 3
    const-string v1, "AudioPlayer"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->a:Landroid/media/AudioTrack;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-boolean v2, p0, Lcom/immomo/moment/mediautils/d;->h:Z

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/d;->h:Z

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-exception v0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    sget v0, Lcom/immomo/moment/mediautils/d;->v:I

    .line 26
    .line 27
    iput v0, p0, Lcom/immomo/moment/mediautils/d;->m:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    :cond_1
    return-void

    .line 30
    :goto_1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/d;->u:Ll/spw;

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v3, "Audio Player resume failed !!!"

    .line 37
    .line 38
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const/16 v3, 0x1772

    .line 53
    .line 54
    invoke-interface {p0, v3, v2}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v2, "AudioPlayer resume failed !!! "

    .line 60
    .line 61
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public r(Lcom/immomo/moment/mediautils/d$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/d;->s:Lcom/immomo/moment/mediautils/d$b;

    .line 2
    .line 3
    return-void
.end method

.method public s(Lcom/immomo/moment/mediautils/d$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/d;->r:Lcom/immomo/moment/mediautils/d$d;

    .line 2
    .line 3
    return-void
.end method

.method public t(Lcom/immomo/moment/mediautils/d$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/d;->t:Lcom/immomo/moment/mediautils/d$a;

    .line 2
    .line 3
    return-void
.end method

.method public u(Ll/spw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/d;->u:Ll/spw;

    .line 2
    .line 3
    return-void
.end method

.method public v(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/d;->o:J

    .line 2
    .line 3
    return-void
.end method

.method public x(Ll/ad60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->i:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/d;->j:Ljava/util/LinkedList;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/immomo/moment/mediautils/d;->i:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public y([BI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/d;->a:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :cond_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/d;->a:Landroid/media/AudioTrack;

    .line 9
    .line 10
    invoke-virtual {v1, p1, v0, p2}, Landroid/media/AudioTrack;->write([BII)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-ltz v1, :cond_1

    .line 15
    .line 16
    add-int/2addr v0, v1

    .line 17
    sub-int/2addr p2, v1

    .line 18
    :cond_1
    if-ltz v1, :cond_2

    .line 19
    .line 20
    if-lez p2, :cond_2

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/immomo/moment/mediautils/d;->h:Z

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    :cond_2
    return-void
.end method
