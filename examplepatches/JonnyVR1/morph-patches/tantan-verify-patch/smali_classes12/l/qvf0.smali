.class public Ll/qvf0;
.super Ll/xjm;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qvf0$a;
    }
.end annotation


# static fields
.field public static k:I = 0x1046a

.field public static l:I = 0x8235


# instance fields
.field private d:J

.field private e:J

.field private f:I

.field private g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;",
            ">;"
        }
    .end annotation
.end field

.field private h:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/qvf0$a;",
            ">;"
        }
    .end annotation
.end field

.field private i:Ljava/lang/Object;

.field private j:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/xjm;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/qvf0;->d:J

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Ll/qvf0;->e:J

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Ll/qvf0;->f:I

    .line 14
    .line 15
    new-instance v0, Ljava/util/LinkedList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/qvf0;->h:Ljava/util/LinkedList;

    .line 21
    .line 22
    new-instance v0, Ljava/lang/Object;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/qvf0;->i:Ljava/lang/Object;

    .line 28
    .line 29
    new-instance v0, Ljava/lang/Object;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/qvf0;->j:Ljava/lang/Object;

    .line 35
    .line 36
    return-void
.end method

.method private h(J)I
    .locals 9

    .line 1
    iget-wide v0, p0, Ll/qvf0;->d:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-gez v0, :cond_0

    .line 9
    .line 10
    iput-wide p1, p0, Ll/qvf0;->d:J

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v0, v1

    .line 15
    :goto_0
    iget-wide v2, p0, Ll/qvf0;->d:J

    .line 16
    .line 17
    sub-long v2, p1, v2

    .line 18
    .line 19
    iget-object v4, p0, Ll/qvf0;->g:Ljava/util/List;

    .line 20
    .line 21
    if-eqz v4, :cond_7

    .line 22
    .line 23
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-nez v4, :cond_1

    .line 28
    .line 29
    goto/16 :goto_3

    .line 30
    .line 31
    :cond_1
    :goto_1
    iget-object v4, p0, Ll/qvf0;->g:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-lez v4, :cond_3

    .line 38
    .line 39
    iget-object v4, p0, Ll/qvf0;->g:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-ge v1, v4, :cond_3

    .line 46
    .line 47
    iget-object v4, p0, Ll/qvf0;->g:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;

    .line 54
    .line 55
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->getStart()J

    .line 56
    .line 57
    .line 58
    move-result-wide v5

    .line 59
    const-wide/16 v7, 0x3e8

    .line 60
    .line 61
    mul-long/2addr v5, v7

    .line 62
    cmp-long v5, p1, v5

    .line 63
    .line 64
    if-ltz v5, :cond_2

    .line 65
    .line 66
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->getEnd()J

    .line 67
    .line 68
    .line 69
    move-result-wide v5

    .line 70
    mul-long/2addr v5, v7

    .line 71
    cmp-long v5, p1, v5

    .line 72
    .line 73
    if-gtz v5, :cond_2

    .line 74
    .line 75
    long-to-float v1, v2

    .line 76
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->getSpeed()F

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    mul-float/2addr v1, v2

    .line 81
    float-to-long v2, v1

    .line 82
    goto :goto_2

    .line 83
    :cond_2
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;->getEnd()J

    .line 84
    .line 85
    .line 86
    add-int/lit8 v1, v1, 0x1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    :goto_2
    if-nez v0, :cond_4

    .line 90
    .line 91
    sget v0, Ll/qvf0;->l:I

    .line 92
    .line 93
    int-to-long v0, v0

    .line 94
    cmp-long v0, v2, v0

    .line 95
    .line 96
    if-gez v0, :cond_4

    .line 97
    .line 98
    const/4 p0, -0x1

    .line 99
    return p0

    .line 100
    :cond_4
    long-to-int v0, v2

    .line 101
    sget v1, Ll/qvf0;->k:I

    .line 102
    .line 103
    div-int/2addr v0, v1

    .line 104
    iget-wide v4, p0, Ll/qvf0;->e:J

    .line 105
    .line 106
    add-long/2addr v4, v2

    .line 107
    iput-wide v4, p0, Ll/qvf0;->e:J

    .line 108
    .line 109
    iput-wide p1, p0, Ll/qvf0;->d:J

    .line 110
    .line 111
    move p1, v0

    .line 112
    :cond_5
    if-lez p1, :cond_6

    .line 113
    .line 114
    add-int/lit8 p1, p1, -0x1

    .line 115
    .line 116
    :cond_6
    iget-object v4, p0, Ll/qvf0;->i:Ljava/lang/Object;

    .line 117
    .line 118
    monitor-enter v4

    .line 119
    :try_start_0
    iget-object p2, p0, Ll/qvf0;->h:Ljava/util/LinkedList;

    .line 120
    .line 121
    new-instance v1, Ll/qvf0$a;

    .line 122
    .line 123
    iget-wide v2, p0, Ll/qvf0;->e:J

    .line 124
    .line 125
    sget v5, Ll/qvf0;->k:I

    .line 126
    .line 127
    mul-int/2addr v5, p1

    .line 128
    int-to-long v5, v5

    .line 129
    sub-long/2addr v2, v5

    .line 130
    invoke-direct {v1, p0, v2, v3}, Ll/qvf0$a;-><init>(Ll/qvf0;J)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p2, v1}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    monitor-exit v4

    .line 137
    if-gtz p1, :cond_5

    .line 138
    .line 139
    return v0

    .line 140
    :catchall_0
    move-exception p0

    .line 141
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    throw p0

    .line 143
    :cond_7
    :goto_3
    iget-wide v4, p0, Ll/qvf0;->e:J

    .line 144
    .line 145
    add-long/2addr v4, v2

    .line 146
    iput-wide v4, p0, Ll/qvf0;->e:J

    .line 147
    .line 148
    iput-wide p1, p0, Ll/qvf0;->d:J

    .line 149
    .line 150
    iget-object p1, p0, Ll/qvf0;->i:Ljava/lang/Object;

    .line 151
    .line 152
    monitor-enter p1

    .line 153
    :try_start_1
    iget-object p2, p0, Ll/qvf0;->h:Ljava/util/LinkedList;

    .line 154
    .line 155
    new-instance v0, Ll/qvf0$a;

    .line 156
    .line 157
    iget-wide v2, p0, Ll/qvf0;->e:J

    .line 158
    .line 159
    invoke-direct {v0, p0, v2, v3}, Ll/qvf0$a;-><init>(Ll/qvf0;J)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p2, v0}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    monitor-exit p1

    .line 166
    return v1

    .line 167
    :catchall_1
    move-exception p0

    .line 168
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 169
    throw p0
.end method


# virtual methods
.method public a()Z
    .locals 3

    .line 1
    const-string v0, "EditProcess"

    .line 2
    .line 3
    const-string v1, "SpeedControlProcesser reset!!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/qvf0;->j:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    const-wide/16 v1, -0x1

    .line 12
    .line 13
    :try_start_0
    iput-wide v1, p0, Ll/qvf0;->d:J

    .line 14
    .line 15
    const-wide/16 v1, 0x0

    .line 16
    .line 17
    iput-wide v1, p0, Ll/qvf0;->e:J

    .line 18
    .line 19
    iget-object v1, p0, Ll/qvf0;->h:Ljava/util/LinkedList;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 22
    .line 23
    .line 24
    invoke-super {p0}, Ll/xjm;->a()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    monitor-exit v0

    .line 29
    return p0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/qvf0;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()J
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qvf0;->i:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/qvf0;->h:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-lez v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/qvf0;->h:Ljava/util/LinkedList;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ll/qvf0$a;

    .line 19
    .line 20
    iget-wide v1, p0, Ll/qvf0$a;->a:J

    .line 21
    .line 22
    monitor-exit v0

    .line 23
    return-wide v1

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-wide/16 v1, -0x1

    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-wide v1

    .line 30
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/qvf0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public e(Ljava/nio/Buffer;IJ)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/qvf0;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    invoke-direct {p0, p3, p4}, Ll/qvf0;->h(J)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iput p2, p0, Ll/qvf0;->f:I

    .line 9
    .line 10
    monitor-exit p1

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    throw p0
.end method

.method public f()V
    .locals 1

    .line 1
    const-string p0, "EditProcess"

    .line 2
    .line 3
    const-string v0, "SpeedControlProcesser release!!!"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public g(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qvf0;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const-wide/16 v1, -0x1

    .line 5
    .line 6
    :try_start_0
    iput-wide v1, p0, Ll/qvf0;->d:J

    .line 7
    .line 8
    const-wide/16 v1, 0x0

    .line 9
    .line 10
    iput-wide v1, p0, Ll/qvf0;->e:J

    .line 11
    .line 12
    iget-object v1, p0, Ll/qvf0;->h:Ljava/util/LinkedList;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/qvf0;->g:Ljava/util/List;

    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method
