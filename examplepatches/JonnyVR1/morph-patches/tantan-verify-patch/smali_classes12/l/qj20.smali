.class public Ll/qj20;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile r:Ll/qj20;


# instance fields
.field private a:Ljava/util/concurrent/atomic/AtomicInteger;

.field private b:Ljava/util/concurrent/atomic/AtomicLong;

.field private c:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private d:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private e:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final f:Z

.field private g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private h:Ljava/util/concurrent/atomic/AtomicLong;

.field private i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private j:Ljava/util/concurrent/atomic/AtomicInteger;

.field private k:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final l:I

.field private final m:I

.field private n:Ljava/util/concurrent/atomic/AtomicInteger;

.field private o:Landroid/os/Handler;

.field private p:J

.field private q:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/qj20;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/qj20;->b:Ljava/util/concurrent/atomic/AtomicLong;

    .line 20
    .line 21
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/qj20;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 27
    .line 28
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 29
    .line 30
    const/4 v4, 0x1

    .line 31
    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/qj20;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 35
    .line 36
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 37
    .line 38
    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/qj20;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 42
    .line 43
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/qj20;->g:Ljava/util/Map;

    .line 49
    .line 50
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 51
    .line 52
    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Ll/qj20;->h:Ljava/util/concurrent/atomic/AtomicLong;

    .line 56
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/qj20;->i:Ljava/util/List;

    .line 63
    .line 64
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 65
    .line 66
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Ll/qj20;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 70
    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 72
    .line 73
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Ll/qj20;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 77
    .line 78
    const/4 v0, 0x3

    .line 79
    iput v0, p0, Ll/qj20;->l:I

    .line 80
    .line 81
    const/16 v0, 0xbb8

    .line 82
    .line 83
    iput v0, p0, Ll/qj20;->m:I

    .line 84
    .line 85
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 86
    .line 87
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 88
    .line 89
    .line 90
    iput-object v0, p0, Ll/qj20;->n:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 91
    .line 92
    new-instance v0, Landroid/os/Handler;

    .line 93
    .line 94
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 99
    .line 100
    .line 101
    iput-object v0, p0, Ll/qj20;->o:Landroid/os/Handler;

    .line 102
    .line 103
    iput-wide v2, p0, Ll/qj20;->p:J

    .line 104
    .line 105
    iput-wide v2, p0, Ll/qj20;->q:J

    .line 106
    .line 107
    invoke-static {}, Ll/mmd0;->a()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iput-boolean v0, p0, Ll/qj20;->f:Z

    .line 112
    .line 113
    return-void
.end method

.method public static synthetic a(Ll/qj20;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qj20;->y(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b(Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/qj20;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/qj20;->g:Ljava/util/Map;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Ll/qj20;->g:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ljava/lang/Integer;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-direct {p0}, Ll/qj20;->k()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-ge p1, p0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return v2

    .line 43
    :cond_1
    :goto_0
    return v1

    .line 44
    :cond_2
    iget-object p1, p0, Ll/qj20;->g:Ljava/util/Map;

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    invoke-direct {p0}, Ll/qj20;->l()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-ge p1, p0, :cond_3

    .line 55
    .line 56
    return v1

    .line 57
    :cond_3
    return v2
.end method

.method private c()I
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qj20;->f:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/csx;->j0()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/csx;->w()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method private d(Lcom/immomo/network/bean/PlayerType;)I
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/network/bean/PlayerType;->LivePlayer:Lcom/immomo/network/bean/PlayerType;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/csx;->B()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/csx;->E0()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method private e()I
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qj20;->f:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/csx;->k0()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/csx;->H()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public static f()Ll/qj20;
    .locals 2

    .line 1
    sget-object v0, Ll/qj20;->r:Ll/qj20;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/qj20;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/qj20;->r:Ll/qj20;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/qj20;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/qj20;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/qj20;->r:Ll/qj20;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/qj20;->r:Ll/qj20;

    .line 27
    .line 28
    return-object v0
.end method

.method private h(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/network/bean/PlayerType;)Ll/p4k0;
    .locals 14

    .line 1
    move-object/from16 v1, p2

    .line 2
    .line 3
    iget-object v0, p0, Ll/qj20;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 7
    .line 8
    .line 9
    move-object/from16 v3, p3

    .line 10
    .line 11
    invoke-direct {p0, v3}, Ll/qj20;->d(Lcom/immomo/network/bean/PlayerType;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v12, Ll/p4k0;

    .line 18
    .line 19
    sget-object v0, Lcom/immomo/network/bean/CheckerStatus;->DISABLED:Lcom/immomo/network/bean/CheckerStatus;

    .line 20
    .line 21
    invoke-direct {v12, v1, v0}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v12}, Ll/p4k0;->a()I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    const-wide/16 v9, 0x0

    .line 29
    .line 30
    const/4 v11, 0x0

    .line 31
    const-string v4, "v4"

    .line 32
    .line 33
    const/4 v6, 0x0

    .line 34
    const/4 v7, 0x0

    .line 35
    const-string v8, "v4\uff1a\u603b\u5f00\u5173\u5173\u95ed"

    .line 36
    .line 37
    move-object v0, p0

    .line 38
    move-object v2, p1

    .line 39
    invoke-direct/range {v0 .. v11}, Ll/qj20;->q(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/network/bean/PlayerType;Ljava/lang/String;IZZLjava/lang/String;JZ)V

    .line 40
    .line 41
    .line 42
    return-object v12

    .line 43
    :cond_0
    move v0, v2

    .line 44
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_1

    .line 49
    .line 50
    invoke-static {p1}, Ll/rl20;->f(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    :cond_1
    move-object/from16 v1, p2

    .line 57
    .line 58
    goto/16 :goto_2

    .line 59
    .line 60
    :cond_2
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    invoke-static {p1}, Ll/rl20;->f(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    new-instance v12, Ll/p4k0;

    .line 73
    .line 74
    sget-object v0, Lcom/immomo/network/bean/CheckerStatus;->PARAMS_ILLEGAL:Lcom/immomo/network/bean/CheckerStatus;

    .line 75
    .line 76
    invoke-direct {v12, p1, v0}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v12}, Ll/p4k0;->a()I

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    const-wide/16 v9, 0x0

    .line 84
    .line 85
    const/4 v11, 0x0

    .line 86
    const-string v4, "v6"

    .line 87
    .line 88
    const/4 v6, 0x0

    .line 89
    const/4 v7, 0x0

    .line 90
    const-string v8, "\u4ec5v6Url\u5408\u6cd5"

    .line 91
    .line 92
    move-object v0, p0

    .line 93
    move-object v2, p1

    .line 94
    move-object/from16 v1, p2

    .line 95
    .line 96
    move-object/from16 v3, p3

    .line 97
    .line 98
    invoke-direct/range {v0 .. v11}, Ll/qj20;->q(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/network/bean/PlayerType;Ljava/lang/String;IZZLjava/lang/String;JZ)V

    .line 99
    .line 100
    .line 101
    return-object v12

    .line 102
    :cond_3
    move v1, v0

    .line 103
    invoke-direct {p0}, Ll/qj20;->p()Z

    .line 104
    .line 105
    .line 106
    move-result v11

    .line 107
    if-eqz v11, :cond_4

    .line 108
    .line 109
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v2}, Ll/e4m;->d()V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v2}, Ll/e4m;->e()V

    .line 121
    .line 122
    .line 123
    :cond_4
    invoke-direct {p0}, Ll/qj20;->e()I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    const/4 v3, 0x0

    .line 128
    if-eqz v2, :cond_5

    .line 129
    .line 130
    iget-object v2, p0, Ll/qj20;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 131
    .line 132
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-eqz v2, :cond_5

    .line 137
    .line 138
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-virtual {v2}, Ll/e4m;->a()Lcom/immomo/network/bean/CheckerStatus;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    sget-object v4, Lcom/immomo/network/bean/CheckerStatus;->UNAVAILABLE:Lcom/immomo/network/bean/CheckerStatus;

    .line 147
    .line 148
    if-eq v2, v4, :cond_5

    .line 149
    .line 150
    iget-object v1, p0, Ll/qj20;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 151
    .line 152
    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 153
    .line 154
    .line 155
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v1}, Ll/e4m;->a()Lcom/immomo/network/bean/CheckerStatus;

    .line 160
    .line 161
    .line 162
    move-result-object v12

    .line 163
    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    .line 164
    .line 165
    .line 166
    move-result v5

    .line 167
    const-string v8, "v6\uff1a\u9996\u6b21\u5c1d\u8bd5"

    .line 168
    .line 169
    iget-wide v9, p0, Ll/qj20;->q:J

    .line 170
    .line 171
    const-string v4, "v6"

    .line 172
    .line 173
    const/4 v6, 0x0

    .line 174
    const/4 v7, 0x0

    .line 175
    move-object v0, p0

    .line 176
    move-object v2, p1

    .line 177
    move-object/from16 v1, p2

    .line 178
    .line 179
    move-object/from16 v3, p3

    .line 180
    .line 181
    invoke-direct/range {v0 .. v11}, Ll/qj20;->q(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/network/bean/PlayerType;Ljava/lang/String;IZZLjava/lang/String;JZ)V

    .line 182
    .line 183
    .line 184
    new-instance p0, Ll/p4k0;

    .line 185
    .line 186
    invoke-direct {p0, p1, v12}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 187
    .line 188
    .line 189
    return-object p0

    .line 190
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 191
    .line 192
    .line 193
    move-result-wide v4

    .line 194
    iget-object v6, p0, Ll/qj20;->h:Ljava/util/concurrent/atomic/AtomicLong;

    .line 195
    .line 196
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 197
    .line 198
    .line 199
    move-result-wide v6

    .line 200
    sub-long/2addr v4, v6

    .line 201
    invoke-direct {p0}, Ll/qj20;->m()J

    .line 202
    .line 203
    .line 204
    move-result-wide v6

    .line 205
    const-wide/16 v8, 0x3e8

    .line 206
    .line 207
    mul-long/2addr v6, v8

    .line 208
    cmp-long v4, v4, v6

    .line 209
    .line 210
    if-lez v4, :cond_6

    .line 211
    .line 212
    invoke-direct/range {p0 .. p1}, Ll/qj20;->b(Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    if-nez v4, :cond_6

    .line 217
    .line 218
    iget-object v4, p0, Ll/qj20;->g:Ljava/util/Map;

    .line 219
    .line 220
    invoke-interface {v4}, Ljava/util/Map;->clear()V

    .line 221
    .line 222
    .line 223
    move v6, v1

    .line 224
    goto :goto_0

    .line 225
    :cond_6
    move v6, v3

    .line 226
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 227
    .line 228
    .line 229
    move-result-wide v4

    .line 230
    iget-object v7, p0, Ll/qj20;->b:Ljava/util/concurrent/atomic/AtomicLong;

    .line 231
    .line 232
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 233
    .line 234
    .line 235
    move-result-wide v12

    .line 236
    sub-long/2addr v4, v12

    .line 237
    invoke-direct {p0}, Ll/qj20;->m()J

    .line 238
    .line 239
    .line 240
    move-result-wide v12

    .line 241
    mul-long/2addr v12, v8

    .line 242
    cmp-long v4, v4, v12

    .line 243
    .line 244
    if-lez v4, :cond_7

    .line 245
    .line 246
    iget-object v4, p0, Ll/qj20;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 247
    .line 248
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 249
    .line 250
    .line 251
    move-result v4

    .line 252
    if-eqz v4, :cond_7

    .line 253
    .line 254
    iget-object v4, p0, Ll/qj20;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 255
    .line 256
    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 257
    .line 258
    .line 259
    iget-object v4, p0, Ll/qj20;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 260
    .line 261
    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 262
    .line 263
    .line 264
    move v7, v1

    .line 265
    goto :goto_1

    .line 266
    :cond_7
    move v7, v3

    .line 267
    :goto_1
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    invoke-virtual {v3}, Ll/e4m;->a()Lcom/immomo/network/bean/CheckerStatus;

    .line 272
    .line 273
    .line 274
    move-result-object v12

    .line 275
    iget-object v3, p0, Ll/qj20;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 276
    .line 277
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 278
    .line 279
    .line 280
    move-result v3

    .line 281
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 282
    .line 283
    .line 284
    move-result-object v4

    .line 285
    invoke-virtual {v4}, Ll/csx;->W()I

    .line 286
    .line 287
    .line 288
    move-result v4

    .line 289
    if-le v3, v4, :cond_9

    .line 290
    .line 291
    iget-object v3, p0, Ll/qj20;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 292
    .line 293
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 294
    .line 295
    .line 296
    move-result v3

    .line 297
    if-nez v3, :cond_8

    .line 298
    .line 299
    iget-object v3, p0, Ll/qj20;->b:Ljava/util/concurrent/atomic/AtomicLong;

    .line 300
    .line 301
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 302
    .line 303
    .line 304
    move-result-wide v4

    .line 305
    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 306
    .line 307
    .line 308
    iget-object v3, p0, Ll/qj20;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 309
    .line 310
    invoke-virtual {v3, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 311
    .line 312
    .line 313
    :cond_8
    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    const-string v8, "v4\uff1a\u6f0f\u62a5\u6b21\u6570\u8d85\u9608\u503c"

    .line 318
    .line 319
    iget-wide v9, p0, Ll/qj20;->q:J

    .line 320
    .line 321
    const-string v4, "v4"

    .line 322
    .line 323
    move-object v0, p0

    .line 324
    move-object v2, p1

    .line 325
    move-object/from16 v1, p2

    .line 326
    .line 327
    move-object/from16 v3, p3

    .line 328
    .line 329
    invoke-direct/range {v0 .. v11}, Ll/qj20;->q(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/network/bean/PlayerType;Ljava/lang/String;IZZLjava/lang/String;JZ)V

    .line 330
    .line 331
    .line 332
    new-instance p0, Ll/p4k0;

    .line 333
    .line 334
    invoke-direct {p0, v1, v12}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 335
    .line 336
    .line 337
    return-object p0

    .line 338
    :cond_9
    move-object/from16 v1, p2

    .line 339
    .line 340
    invoke-direct {p0}, Ll/qj20;->c()I

    .line 341
    .line 342
    .line 343
    move-result v2

    .line 344
    if-nez v2, :cond_a

    .line 345
    .line 346
    invoke-direct/range {p0 .. p1}, Ll/qj20;->b(Ljava/lang/String;)Z

    .line 347
    .line 348
    .line 349
    move-result v2

    .line 350
    if-eqz v2, :cond_a

    .line 351
    .line 352
    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    .line 353
    .line 354
    .line 355
    move-result v5

    .line 356
    const-string v8, "v6\uff1a\u6ee1\u8db3\u5c1d\u8bd5\u6761\u4ef6"

    .line 357
    .line 358
    iget-wide v9, p0, Ll/qj20;->q:J

    .line 359
    .line 360
    const-string v4, "v6"

    .line 361
    .line 362
    move-object v0, p0

    .line 363
    move-object v2, p1

    .line 364
    move-object/from16 v3, p3

    .line 365
    .line 366
    invoke-direct/range {v0 .. v11}, Ll/qj20;->q(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/network/bean/PlayerType;Ljava/lang/String;IZZLjava/lang/String;JZ)V

    .line 367
    .line 368
    .line 369
    new-instance p0, Ll/p4k0;

    .line 370
    .line 371
    invoke-direct {p0, p1, v12}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 372
    .line 373
    .line 374
    return-object p0

    .line 375
    :cond_a
    invoke-direct {p0}, Ll/qj20;->c()I

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    if-eqz v1, :cond_b

    .line 380
    .line 381
    sget-object v1, Lcom/immomo/network/bean/CheckerStatus;->AVAILABLE:Lcom/immomo/network/bean/CheckerStatus;

    .line 382
    .line 383
    if-ne v12, v1, :cond_b

    .line 384
    .line 385
    invoke-direct/range {p0 .. p1}, Ll/qj20;->b(Ljava/lang/String;)Z

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    if-eqz v1, :cond_b

    .line 390
    .line 391
    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    .line 392
    .line 393
    .line 394
    move-result v5

    .line 395
    const-string v8, "v6\uff1a\u6ee1\u8db3\u5c1d\u8bd5\u6761\u4ef6"

    .line 396
    .line 397
    iget-wide v9, p0, Ll/qj20;->q:J

    .line 398
    .line 399
    const-string v4, "v6"

    .line 400
    .line 401
    move-object v0, p0

    .line 402
    move-object v2, p1

    .line 403
    move-object/from16 v1, p2

    .line 404
    .line 405
    move-object/from16 v3, p3

    .line 406
    .line 407
    invoke-direct/range {v0 .. v11}, Ll/qj20;->q(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/network/bean/PlayerType;Ljava/lang/String;IZZLjava/lang/String;JZ)V

    .line 408
    .line 409
    .line 410
    new-instance p0, Ll/p4k0;

    .line 411
    .line 412
    invoke-direct {p0, p1, v12}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 413
    .line 414
    .line 415
    return-object p0

    .line 416
    :cond_b
    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    .line 417
    .line 418
    .line 419
    move-result v5

    .line 420
    const-string v8, "v4\uff1a\u9ed8\u8ba4"

    .line 421
    .line 422
    iget-wide v9, p0, Ll/qj20;->q:J

    .line 423
    .line 424
    const-string v4, "v4"

    .line 425
    .line 426
    move-object v0, p0

    .line 427
    move-object v2, p1

    .line 428
    move-object/from16 v1, p2

    .line 429
    .line 430
    move-object/from16 v3, p3

    .line 431
    .line 432
    invoke-direct/range {v0 .. v11}, Ll/qj20;->q(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/network/bean/PlayerType;Ljava/lang/String;IZZLjava/lang/String;JZ)V

    .line 433
    .line 434
    .line 435
    new-instance p0, Ll/p4k0;

    .line 436
    .line 437
    invoke-direct {p0, v1, v12}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 438
    .line 439
    .line 440
    return-object p0

    .line 441
    :goto_2
    new-instance v12, Ll/p4k0;

    .line 442
    .line 443
    sget-object v0, Lcom/immomo/network/bean/CheckerStatus;->PARAMS_ILLEGAL:Lcom/immomo/network/bean/CheckerStatus;

    .line 444
    .line 445
    invoke-direct {v12, v1, v0}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 446
    .line 447
    .line 448
    invoke-virtual {v12}, Ll/p4k0;->a()I

    .line 449
    .line 450
    .line 451
    move-result v5

    .line 452
    const-wide/16 v9, 0x0

    .line 453
    .line 454
    const/4 v11, 0x0

    .line 455
    const-string v4, "v4"

    .line 456
    .line 457
    const/4 v6, 0x0

    .line 458
    const/4 v7, 0x0

    .line 459
    const-string v8, "v4\uff1a\u5165\u53c2v6url\u4e0d\u5408\u6cd5"

    .line 460
    .line 461
    move-object v0, p0

    .line 462
    move-object v2, p1

    .line 463
    move-object/from16 v3, p3

    .line 464
    .line 465
    invoke-direct/range {v0 .. v11}, Ll/qj20;->q(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/network/bean/PlayerType;Ljava/lang/String;IZZLjava/lang/String;JZ)V

    .line 466
    .line 467
    .line 468
    return-object v12
.end method

.method private j()I
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qj20;->f:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/csx;->m0()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/csx;->O()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method private k()I
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qj20;->f:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/csx;->l0()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/csx;->N()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method private l()I
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qj20;->f:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/csx;->n0()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/csx;->P()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method private m()J
    .locals 2

    .line 1
    iget-boolean p0, p0, Ll/qj20;->f:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/csx;->o0()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0

    .line 14
    :cond_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/csx;->i0()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    return-wide v0
.end method

.method private n(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    const-string p0, "\\?"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    aget-object p0, p0, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    return-object p0

    .line 11
    :catch_0
    return-object p1
.end method

.method private o()J
    .locals 2

    .line 1
    iget-boolean p0, p0, Ll/qj20;->f:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/csx;->p0()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0

    .line 14
    :cond_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/csx;->t0()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    return-wide v0
.end method

.method private p()Z
    .locals 7

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/qj20;->p:J

    .line 6
    .line 7
    const-wide/16 v4, 0x0

    .line 8
    .line 9
    cmp-long v6, v2, v4

    .line 10
    .line 11
    if-nez v6, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sub-long v4, v0, v2

    .line 15
    .line 16
    :goto_0
    iput-wide v4, p0, Ll/qj20;->q:J

    .line 17
    .line 18
    iput-wide v0, p0, Ll/qj20;->p:J

    .line 19
    .line 20
    invoke-direct {p0}, Ll/qj20;->o()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    const-wide/16 v2, 0x3e8

    .line 25
    .line 26
    mul-long/2addr v0, v2

    .line 27
    cmp-long p0, v4, v0

    .line 28
    .line 29
    if-ltz p0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method private q(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/network/bean/PlayerType;Ljava/lang/String;IZZLjava/lang/String;JZ)V
    .locals 2

    .line 1
    new-instance v0, Ll/yyv;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/yyv;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p4, v0, Ll/yyv;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "v4"

    .line 9
    .line 10
    invoke-static {v1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    if-eqz p4, :cond_0

    .line 15
    .line 16
    move-object p4, p1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move-object p4, p2

    .line 19
    :goto_0
    iput-object p4, v0, Ll/yyv;->b:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p1, v0, Ll/yyv;->c:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p2, v0, Ll/yyv;->d:Ljava/lang/String;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    invoke-direct {p0, p2}, Ll/qj20;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iget-object p4, p0, Ll/qj20;->g:Ljava/util/Map;

    .line 41
    .line 42
    invoke-interface {p4, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    move-object p4, p2

    .line 47
    check-cast p4, Ljava/lang/Integer;

    .line 48
    .line 49
    :cond_1
    if-nez p4, :cond_2

    .line 50
    .line 51
    move p2, p1

    .line 52
    goto :goto_1

    .line 53
    :cond_2
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    :goto_1
    iput p2, v0, Ll/yyv;->e:I

    .line 58
    .line 59
    iget-object p2, p0, Ll/qj20;->g:Ljava/util/Map;

    .line 60
    .line 61
    invoke-interface {p2}, Ljava/util/Map;->size()I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    iput p2, v0, Ll/yyv;->f:I

    .line 66
    .line 67
    iget-object p2, p0, Ll/qj20;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 68
    .line 69
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    iput p2, v0, Ll/yyv;->g:I

    .line 74
    .line 75
    iput p5, v0, Ll/yyv;->h:I

    .line 76
    .line 77
    iget-object p2, p0, Ll/qj20;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 78
    .line 79
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    iput-boolean p2, v0, Ll/yyv;->i:Z

    .line 84
    .line 85
    invoke-direct {p0, p3}, Ll/qj20;->d(Lcom/immomo/network/bean/PlayerType;)I

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    const/4 p3, 0x1

    .line 90
    if-eqz p2, :cond_3

    .line 91
    .line 92
    move p2, p3

    .line 93
    goto :goto_2

    .line 94
    :cond_3
    move p2, p1

    .line 95
    :goto_2
    iput-boolean p2, v0, Ll/yyv;->j:Z

    .line 96
    .line 97
    invoke-direct {p0}, Ll/qj20;->e()I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    if-ne p2, p3, :cond_4

    .line 102
    .line 103
    move p2, p3

    .line 104
    goto :goto_3

    .line 105
    :cond_4
    move p2, p1

    .line 106
    :goto_3
    iput-boolean p2, v0, Ll/yyv;->k:Z

    .line 107
    .line 108
    iget-boolean p2, p0, Ll/qj20;->f:Z

    .line 109
    .line 110
    iput-boolean p2, v0, Ll/yyv;->l:Z

    .line 111
    .line 112
    invoke-direct {p0}, Ll/qj20;->c()I

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-ne p2, p3, :cond_5

    .line 117
    .line 118
    move p1, p3

    .line 119
    :cond_5
    iput-boolean p1, v0, Ll/yyv;->m:Z

    .line 120
    .line 121
    invoke-direct {p0}, Ll/qj20;->k()I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    iput p1, v0, Ll/yyv;->n:I

    .line 126
    .line 127
    invoke-direct {p0}, Ll/qj20;->l()I

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    iput p1, v0, Ll/yyv;->o:I

    .line 132
    .line 133
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p1}, Ll/csx;->W()I

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    iput p1, v0, Ll/yyv;->p:I

    .line 142
    .line 143
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1}, Ll/csx;->i0()J

    .line 148
    .line 149
    .line 150
    move-result-wide p1

    .line 151
    iput-wide p1, v0, Ll/yyv;->q:J

    .line 152
    .line 153
    iput-boolean p6, v0, Ll/yyv;->r:Z

    .line 154
    .line 155
    iput-boolean p7, v0, Ll/yyv;->s:Z

    .line 156
    .line 157
    iput-object p8, v0, Ll/yyv;->t:Ljava/lang/String;

    .line 158
    .line 159
    invoke-direct {p0}, Ll/qj20;->o()J

    .line 160
    .line 161
    .line 162
    move-result-wide p0

    .line 163
    iput-wide p0, v0, Ll/yyv;->u:J

    .line 164
    .line 165
    iput-wide p9, v0, Ll/yyv;->v:J

    .line 166
    .line 167
    iput-boolean p11, v0, Ll/yyv;->w:Z

    .line 168
    .line 169
    invoke-static {v0}, Ll/rj20;->c(Ll/yyv;)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method private declared-synchronized s(Ll/p4k0;ZZLcom/immomo/network/bean/PlayerType;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0, p4}, Ll/qj20;->d(Lcom/immomo/network/bean/PlayerType;)I

    .line 3
    .line 4
    .line 5
    move-result p4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    if-nez p4, :cond_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :cond_0
    if-eqz p1, :cond_6

    .line 11
    .line 12
    :try_start_1
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    if-nez p4, :cond_6

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/p4k0;->b()Lcom/immomo/network/bean/UrlType;

    .line 23
    .line 24
    .line 25
    move-result-object p4

    .line 26
    sget-object v0, Lcom/immomo/network/bean/UrlType;->IPV6:Lcom/immomo/network/bean/UrlType;

    .line 27
    .line 28
    if-eq p4, v0, :cond_1

    .line 29
    .line 30
    goto :goto_3

    .line 31
    :cond_1
    iget-object p4, p0, Ll/qj20;->i:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {p4, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p4

    .line 41
    if-eqz p4, :cond_2

    .line 42
    .line 43
    iget-object p4, p0, Ll/qj20;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 44
    .line 45
    invoke-virtual {p4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 46
    .line 47
    .line 48
    iget-object p4, p0, Ll/qj20;->i:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {p4, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception p1

    .line 59
    goto :goto_4

    .line 60
    :cond_2
    :goto_0
    if-nez p3, :cond_5

    .line 61
    .line 62
    if-eqz p2, :cond_3

    .line 63
    .line 64
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 65
    .line 66
    .line 67
    move-result-object p4

    .line 68
    invoke-virtual {p4}, Ll/e4m;->f()V

    .line 69
    .line 70
    .line 71
    iget-object p4, p0, Ll/qj20;->g:Ljava/util/Map;

    .line 72
    .line 73
    invoke-interface {p4}, Ljava/util/Map;->clear()V

    .line 74
    .line 75
    .line 76
    iget-object p4, p0, Ll/qj20;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 77
    .line 78
    const/4 v0, 0x0

    .line 79
    invoke-virtual {p4, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 80
    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_3
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 84
    .line 85
    .line 86
    move-result-object p4

    .line 87
    invoke-virtual {p4}, Ll/e4m;->e()V

    .line 88
    .line 89
    .line 90
    iget-object p4, p0, Ll/qj20;->h:Ljava/util/concurrent/atomic/AtomicLong;

    .line 91
    .line 92
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 93
    .line 94
    .line 95
    move-result-wide v0

    .line 96
    invoke-virtual {p4, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p4

    .line 103
    invoke-direct {p0, p4}, Ll/qj20;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p4

    .line 107
    iget-object v0, p0, Ll/qj20;->g:Ljava/util/Map;

    .line 108
    .line 109
    invoke-interface {v0, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Ljava/lang/Integer;

    .line 114
    .line 115
    iget-object v1, p0, Ll/qj20;->g:Ljava/util/Map;

    .line 116
    .line 117
    const/4 v2, 0x1

    .line 118
    if-nez v0, :cond_4

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    add-int/2addr v2, v0

    .line 126
    :goto_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-interface {v1, p4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    :cond_5
    :goto_2
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-static {p2, p1, p3}, Ll/rj20;->e(ZLjava/lang/String;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    .line 139
    .line 140
    monitor-exit p0

    .line 141
    return-void

    .line 142
    :cond_6
    :goto_3
    monitor-exit p0

    .line 143
    return-void

    .line 144
    :goto_4
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 145
    throw p1
.end method

.method private u(Ll/p4k0;Lcom/immomo/network/bean/PlayerType;)V
    .locals 1

    .line 1
    invoke-direct {p0, p2}, Ll/qj20;->d(Lcom/immomo/network/bean/PlayerType;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/p4k0;->b()Lcom/immomo/network/bean/UrlType;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    sget-object v0, Lcom/immomo/network/bean/UrlType;->IPV6:Lcom/immomo/network/bean/UrlType;

    .line 25
    .line 26
    if-ne p2, v0, :cond_1

    .line 27
    .line 28
    iget-object p2, p0, Ll/qj20;->i:Ljava/util/List;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {p2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-nez p2, :cond_1

    .line 39
    .line 40
    iget-object p2, p0, Ll/qj20;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 41
    .line 42
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/qj20;->i:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    return-void
.end method

.method private v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;JZ)V
    .locals 2

    .line 1
    new-instance v0, Ll/yyv;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/yyv;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p3, v0, Ll/yyv;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "v4"

    .line 9
    .line 10
    invoke-static {v1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    if-eqz p3, :cond_0

    .line 15
    .line 16
    move-object p3, p1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move-object p3, p2

    .line 19
    :goto_0
    iput-object p3, v0, Ll/yyv;->b:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p1, v0, Ll/yyv;->c:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p2, v0, Ll/yyv;->d:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p1, p0, Ll/qj20;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, v0, Ll/yyv;->f:I

    .line 32
    .line 33
    iget-object p1, p0, Ll/qj20;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput p1, v0, Ll/yyv;->g:I

    .line 40
    .line 41
    iput p4, v0, Ll/yyv;->h:I

    .line 42
    .line 43
    iget-object p1, p0, Ll/qj20;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iput-boolean p1, v0, Ll/yyv;->i:Z

    .line 50
    .line 51
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Ll/csx;->B()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    const/4 p2, 0x0

    .line 60
    const/4 p3, 0x1

    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    move p1, p3

    .line 64
    goto :goto_1

    .line 65
    :cond_1
    move p1, p2

    .line 66
    :goto_1
    iput-boolean p1, v0, Ll/yyv;->j:Z

    .line 67
    .line 68
    invoke-direct {p0}, Ll/qj20;->e()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    move p2, p3

    .line 75
    :cond_2
    iput-boolean p2, v0, Ll/yyv;->k:Z

    .line 76
    .line 77
    iget-boolean p1, p0, Ll/qj20;->f:Z

    .line 78
    .line 79
    iput-boolean p1, v0, Ll/yyv;->l:Z

    .line 80
    .line 81
    invoke-direct {p0}, Ll/qj20;->j()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, v0, Ll/yyv;->o:I

    .line 86
    .line 87
    iput-object p5, v0, Ll/yyv;->t:Ljava/lang/String;

    .line 88
    .line 89
    invoke-direct {p0}, Ll/qj20;->o()J

    .line 90
    .line 91
    .line 92
    move-result-wide p0

    .line 93
    iput-wide p0, v0, Ll/yyv;->u:J

    .line 94
    .line 95
    iput-wide p6, v0, Ll/yyv;->v:J

    .line 96
    .line 97
    iput-boolean p8, v0, Ll/yyv;->w:Z

    .line 98
    .line 99
    invoke-static {v0}, Ll/rj20;->d(Ll/yyv;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method private y(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/csx;->B()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    move v0, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    iget-object v3, p0, Ll/qj20;->n:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    add-int/2addr v3, v2

    .line 23
    invoke-static {p1}, Ll/rl20;->g(Landroid/content/Context;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-static {v0, v3, v2}, Ll/rj20;->g(ZIZ)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Ll/rl20;->g(Landroid/content/Context;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Ll/qj20;->n:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/4 v2, 0x3

    .line 43
    if-lt v0, v2, :cond_1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    iget-object v0, p0, Ll/qj20;->o:Landroid/os/Handler;

    .line 47
    .line 48
    new-instance v1, Ll/qj20$a;

    .line 49
    .line 50
    invoke-direct {v1, p0, p1}, Ll/qj20$a;-><init>(Ll/qj20;Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    const-wide/16 v2, 0xbb8

    .line 54
    .line 55
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/qj20;->n:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    :goto_1
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Ll/e4m;->e()V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/qj20;->n:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 72
    .line 73
    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 74
    .line 75
    .line 76
    return-void
.end method


# virtual methods
.method public g(Ljava/lang/String;Ljava/lang/String;)Ll/p4k0;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/network/bean/PlayerType;->LivePlayer:Lcom/immomo/network/bean/PlayerType;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, v0}, Ll/qj20;->h(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/network/bean/PlayerType;)Ll/p4k0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i(Ljava/lang/String;Ljava/lang/String;)Ll/p4k0;
    .locals 10

    .line 1
    iget-object v2, p0, Ll/qj20;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v3, 0x1

    .line 4
    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/csx;->B()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    new-instance v9, Ll/p4k0;

    .line 18
    .line 19
    sget-object v2, Lcom/immomo/network/bean/CheckerStatus;->DISABLED:Lcom/immomo/network/bean/CheckerStatus;

    .line 20
    .line 21
    invoke-direct {v9, p2, v2}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v9}, Ll/p4k0;->a()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    const-wide/16 v6, 0x0

    .line 29
    .line 30
    const/4 v8, 0x0

    .line 31
    const-string v3, "v4"

    .line 32
    .line 33
    const-string v5, "v4\uff1a\u603b\u5f00\u5173\u5173\u95ed"

    .line 34
    .line 35
    move-object v0, p0

    .line 36
    move-object v2, p1

    .line 37
    move-object v1, p2

    .line 38
    invoke-direct/range {v0 .. v8}, Ll/qj20;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;JZ)V

    .line 39
    .line 40
    .line 41
    return-object v9

    .line 42
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_6

    .line 47
    .line 48
    invoke-static {p1}, Ll/rl20;->f(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    invoke-static {p1}, Ll/rl20;->f(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    new-instance v9, Ll/p4k0;

    .line 69
    .line 70
    sget-object v0, Lcom/immomo/network/bean/CheckerStatus;->PARAMS_ILLEGAL:Lcom/immomo/network/bean/CheckerStatus;

    .line 71
    .line 72
    invoke-direct {v9, p1, v0}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v9}, Ll/p4k0;->a()I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    const-wide/16 v6, 0x0

    .line 80
    .line 81
    const/4 v8, 0x0

    .line 82
    const-string v3, "v6"

    .line 83
    .line 84
    const-string v5, "v6\uff1a\u4ec5v6Url\u5408\u6cd5"

    .line 85
    .line 86
    move-object v0, p0

    .line 87
    move-object v2, p1

    .line 88
    move-object v1, p2

    .line 89
    invoke-direct/range {v0 .. v8}, Ll/qj20;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;JZ)V

    .line 90
    .line 91
    .line 92
    return-object v9

    .line 93
    :cond_2
    invoke-direct {p0}, Ll/qj20;->p()Z

    .line 94
    .line 95
    .line 96
    move-result v8

    .line 97
    if-eqz v8, :cond_3

    .line 98
    .line 99
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1}, Ll/e4m;->d()V

    .line 104
    .line 105
    .line 106
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v1}, Ll/e4m;->e()V

    .line 111
    .line 112
    .line 113
    :cond_3
    invoke-direct {p0}, Ll/qj20;->e()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_4

    .line 118
    .line 119
    iget-object v1, p0, Ll/qj20;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_4

    .line 126
    .line 127
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v1}, Ll/e4m;->a()Lcom/immomo/network/bean/CheckerStatus;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    sget-object v2, Lcom/immomo/network/bean/CheckerStatus;->UNAVAILABLE:Lcom/immomo/network/bean/CheckerStatus;

    .line 136
    .line 137
    if-eq v1, v2, :cond_4

    .line 138
    .line 139
    iget-object v1, p0, Ll/qj20;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 140
    .line 141
    const/4 v2, 0x0

    .line 142
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 143
    .line 144
    .line 145
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v1}, Ll/e4m;->a()Lcom/immomo/network/bean/CheckerStatus;

    .line 150
    .line 151
    .line 152
    move-result-object v9

    .line 153
    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    const-string v5, "v6\uff1a\u9996\u6b21\u5c1d\u8bd5"

    .line 158
    .line 159
    iget-wide v6, p0, Ll/qj20;->q:J

    .line 160
    .line 161
    const-string v3, "v6"

    .line 162
    .line 163
    move-object v0, p0

    .line 164
    move-object v2, p1

    .line 165
    move-object v1, p2

    .line 166
    invoke-direct/range {v0 .. v8}, Ll/qj20;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;JZ)V

    .line 167
    .line 168
    .line 169
    new-instance v0, Ll/p4k0;

    .line 170
    .line 171
    invoke-direct {v0, p1, v9}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 172
    .line 173
    .line 174
    return-object v0

    .line 175
    :cond_4
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-virtual {v1}, Ll/e4m;->a()Lcom/immomo/network/bean/CheckerStatus;

    .line 180
    .line 181
    .line 182
    move-result-object v9

    .line 183
    iget-object v1, p0, Ll/qj20;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    invoke-direct {p0}, Ll/qj20;->j()I

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    if-ge v1, v3, :cond_5

    .line 194
    .line 195
    sget-object v1, Lcom/immomo/network/bean/CheckerStatus;->AVAILABLE:Lcom/immomo/network/bean/CheckerStatus;

    .line 196
    .line 197
    if-ne v9, v1, :cond_5

    .line 198
    .line 199
    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    .line 200
    .line 201
    .line 202
    move-result v4

    .line 203
    const-string v5, "v6\uff1a\u6ee1\u8db3\u5c1d\u8bd5\u6761\u4ef6"

    .line 204
    .line 205
    iget-wide v6, p0, Ll/qj20;->q:J

    .line 206
    .line 207
    const-string v3, "v6"

    .line 208
    .line 209
    move-object v0, p0

    .line 210
    move-object v2, p1

    .line 211
    move-object v1, p2

    .line 212
    invoke-direct/range {v0 .. v8}, Ll/qj20;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;JZ)V

    .line 213
    .line 214
    .line 215
    new-instance v0, Ll/p4k0;

    .line 216
    .line 217
    invoke-direct {v0, p1, v9}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 218
    .line 219
    .line 220
    return-object v0

    .line 221
    :cond_5
    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    .line 222
    .line 223
    .line 224
    move-result v4

    .line 225
    const-string v5, "v4\uff1a\u9ed8\u8ba4"

    .line 226
    .line 227
    iget-wide v6, p0, Ll/qj20;->q:J

    .line 228
    .line 229
    const-string v3, "v4"

    .line 230
    .line 231
    move-object v0, p0

    .line 232
    move-object v2, p1

    .line 233
    move-object v1, p2

    .line 234
    invoke-direct/range {v0 .. v8}, Ll/qj20;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;JZ)V

    .line 235
    .line 236
    .line 237
    new-instance v0, Ll/p4k0;

    .line 238
    .line 239
    invoke-direct {v0, p2, v9}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 240
    .line 241
    .line 242
    return-object v0

    .line 243
    :cond_6
    :goto_0
    new-instance v9, Ll/p4k0;

    .line 244
    .line 245
    sget-object v0, Lcom/immomo/network/bean/CheckerStatus;->PARAMS_ILLEGAL:Lcom/immomo/network/bean/CheckerStatus;

    .line 246
    .line 247
    invoke-direct {v9, p2, v0}, Ll/p4k0;-><init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v9}, Ll/p4k0;->a()I

    .line 251
    .line 252
    .line 253
    move-result v4

    .line 254
    const-wide/16 v6, 0x0

    .line 255
    .line 256
    const/4 v8, 0x0

    .line 257
    const-string v3, "v4"

    .line 258
    .line 259
    const-string v5, "v4\uff1a\u5165\u53c2v6url\u4e0d\u5408\u6cd5"

    .line 260
    .line 261
    move-object v0, p0

    .line 262
    move-object v2, p1

    .line 263
    move-object v1, p2

    .line 264
    invoke-direct/range {v0 .. v8}, Ll/qj20;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;JZ)V

    .line 265
    .line 266
    .line 267
    return-object v9
.end method

.method public r(Ll/p4k0;ZZ)V
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/network/bean/PlayerType;->LivePlayer:Lcom/immomo/network/bean/PlayerType;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3, v0}, Ll/qj20;->s(Ll/p4k0;ZZLcom/immomo/network/bean/PlayerType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Ll/p4k0;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/network/bean/PlayerType;->LivePlayer:Lcom/immomo/network/bean/PlayerType;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/qj20;->u(Ll/p4k0;Lcom/immomo/network/bean/PlayerType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w(Ll/p4k0;Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/csx;->B()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    if-eqz p1, :cond_3

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_3

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/p4k0;->b()Lcom/immomo/network/bean/UrlType;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/immomo/network/bean/UrlType;->IPV6:Lcom/immomo/network/bean/UrlType;

    .line 29
    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    if-eqz p2, :cond_2

    .line 34
    .line 35
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/e4m;->f()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/qj20;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/e4m;->e()V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/qj20;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 59
    .line 60
    .line 61
    :goto_0
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p2, p0}, Ll/rj20;->f(ZLjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    :goto_1
    return-void
.end method

.method public x(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/csx;->B()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/qj20;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/qj20;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/qj20;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/qj20;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/qj20;->g:Ljava/util/Map;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/qj20;->i:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/qj20;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/qj20;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/qj20;->b:Ljava/util/concurrent/atomic/AtomicLong;

    .line 58
    .line 59
    const-wide/16 v2, 0x0

    .line 60
    .line 61
    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/qj20;->h:Ljava/util/concurrent/atomic/AtomicLong;

    .line 65
    .line 66
    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/qj20;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 72
    .line 73
    .line 74
    iput-wide v2, p0, Ll/qj20;->p:J

    .line 75
    .line 76
    iput-wide v2, p0, Ll/qj20;->q:J

    .line 77
    .line 78
    invoke-static {}, Ll/e4m;->c()Ll/e4m;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Ll/e4m;->d()V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/qj20;->o:Landroid/os/Handler;

    .line 86
    .line 87
    const/4 v2, 0x0

    .line 88
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/qj20;->n:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 94
    .line 95
    .line 96
    invoke-direct {p0, p1}, Ll/qj20;->y(Landroid/content/Context;)V

    .line 97
    .line 98
    .line 99
    :cond_1
    :goto_0
    return-void
.end method
