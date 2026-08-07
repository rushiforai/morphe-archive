.class public Lcom/tantanapp/media/proxy/api/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/proxy/api/a$e;
    }
.end annotation


# static fields
.field public static i:I = 0x2

.field public static j:J = 0x0L

.field public static k:J = 0x1f4L

.field public static l:J = 0x96000L

.field public static m:Z = true

.field public static n:Ljava/lang/String;

.field public static volatile o:Lcom/tantanapp/media/proxy/api/a;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:J

.field public d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

.field public e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/net/Uri;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/media/proxy/api/a$e;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "TTMediaPreLoader"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->e:Ljava/util/Map;

    .line 14
    .line 15
    new-instance v0, Ljava/util/LinkedList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->f:Ljava/util/LinkedList;

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->g:Ljava/util/List;

    .line 28
    .line 29
    new-instance v0, Lcom/tantanapp/media/proxy/api/a$d;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Lcom/tantanapp/media/proxy/api/a$d;-><init>(Lcom/tantanapp/media/proxy/api/a;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->h:Ljava/lang/Runnable;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/tantanapp/media/proxy/api/a;->r()V

    .line 37
    .line 38
    .line 39
    sget-boolean v0, Lcom/tantanapp/media/proxy/api/a;->m:Z

    .line 40
    .line 41
    iput-boolean v0, p0, Lcom/tantanapp/media/proxy/api/a;->b:Z

    .line 42
    .line 43
    sget-wide v0, Lcom/tantanapp/media/proxy/api/a;->j:J

    .line 44
    .line 45
    iput-wide v0, p0, Lcom/tantanapp/media/proxy/api/a;->c:J

    .line 46
    .line 47
    const-wide/16 v2, 0x1388

    .line 48
    .line 49
    cmp-long v0, v0, v2

    .line 50
    .line 51
    if-lez v0, :cond_0

    .line 52
    .line 53
    iput-wide v2, p0, Lcom/tantanapp/media/proxy/api/a;->c:J

    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/media/proxy/api/a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/tantanapp/media/proxy/api/a;->k:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic c(Lcom/tantanapp/media/proxy/api/a;)Lcom/tantanapp/media/proxy/api/TTMediaProxy;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/tantanapp/media/proxy/api/a;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->e:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/tantanapp/media/proxy/api/a;Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/proxy/api/a;->y(Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/tantanapp/media/proxy/api/a;ILjava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/tantanapp/media/proxy/api/a;->u(ILjava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/tantanapp/media/proxy/api/a;ILjava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/tantanapp/media/proxy/api/a;->v(ILjava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/tantanapp/media/proxy/api/a;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->f:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i()I
    .locals 1

    .line 1
    sget v0, Lcom/tantanapp/media/proxy/api/a;->i:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic j(Lcom/tantanapp/media/proxy/api/a;Landroid/net/Uri;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/media/proxy/api/a;->A(Landroid/net/Uri;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static n(IJJJZ)V
    .locals 2

    .line 1
    if-ltz p0, :cond_0

    .line 2
    .line 3
    sput p0, Lcom/tantanapp/media/proxy/api/a;->i:I

    .line 4
    .line 5
    :cond_0
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long p0, p1, v0

    .line 8
    .line 9
    if-ltz p0, :cond_1

    .line 10
    .line 11
    sput-wide p1, Lcom/tantanapp/media/proxy/api/a;->j:J

    .line 12
    .line 13
    :cond_1
    cmp-long p0, p3, v0

    .line 14
    .line 15
    if-ltz p0, :cond_2

    .line 16
    .line 17
    sput-wide p3, Lcom/tantanapp/media/proxy/api/a;->l:J

    .line 18
    .line 19
    :cond_2
    cmp-long p0, p5, v0

    .line 20
    .line 21
    if-ltz p0, :cond_3

    .line 22
    .line 23
    sput-wide p5, Lcom/tantanapp/media/proxy/api/a;->k:J

    .line 24
    .line 25
    :cond_3
    sput-boolean p7, Lcom/tantanapp/media/proxy/api/a;->m:Z

    .line 26
    .line 27
    return-void
.end method

.method public static p()Lcom/tantanapp/media/proxy/api/a;
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/media/proxy/api/a;->o:Lcom/tantanapp/media/proxy/api/a;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/tantanapp/media/proxy/api/a;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/tantanapp/media/proxy/api/a;->o:Lcom/tantanapp/media/proxy/api/a;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/tantanapp/media/proxy/api/a;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/tantanapp/media/proxy/api/a;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/tantanapp/media/proxy/api/a;->o:Lcom/tantanapp/media/proxy/api/a;

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
    sget-object v0, Lcom/tantanapp/media/proxy/api/a;->o:Lcom/tantanapp/media/proxy/api/a;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final declared-synchronized A(Landroid/net/Uri;J)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    invoke-virtual/range {p0 .. p1}, Lcom/tantanapp/media/proxy/api/a;->s(Landroid/net/Uri;)I

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :cond_0
    :try_start_1
    iget-object v0, v1, Lcom/tantanapp/media/proxy/api/a;->e:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_5

    .line 21
    .line 22
    iget-object v0, v1, Lcom/tantanapp/media/proxy/api/a;->f:Ljava/util/LinkedList;

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    goto :goto_3

    .line 31
    :cond_1
    iget-object v0, v1, Lcom/tantanapp/media/proxy/api/a;->e:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    sget v3, Lcom/tantanapp/media/proxy/api/a;->i:I

    .line 38
    .line 39
    if-lt v0, v3, :cond_2

    .line 40
    .line 41
    iget-object v3, v1, Lcom/tantanapp/media/proxy/api/a;->f:Ljava/util/LinkedList;

    .line 42
    .line 43
    monitor-enter v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    :try_start_2
    iget-object v0, v1, Lcom/tantanapp/media/proxy/api/a;->f:Ljava/util/LinkedList;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 50
    :try_start_3
    iget-object v0, v1, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v2, v1, Lcom/tantanapp/media/proxy/api/a;->h:Ljava/lang/Runnable;

    .line 53
    .line 54
    const-wide/16 v3, 0x1f4

    .line 55
    .line 56
    invoke-static {v0, v2, v3, v4}, Ll/l7b0;->c(Ljava/lang/Object;Ljava/lang/Runnable;J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 57
    .line 58
    .line 59
    monitor-exit p0

    .line 60
    return-void

    .line 61
    :catchall_0
    move-exception v0

    .line 62
    goto :goto_4

    .line 63
    :catchall_1
    move-exception v0

    .line 64
    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 65
    :try_start_5
    throw v0

    .line 66
    :cond_2
    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 70
    if-nez v0, :cond_3

    .line 71
    .line 72
    :try_start_6
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    :cond_3
    move-object v5, v0

    .line 77
    goto :goto_0

    .line 78
    :catchall_2
    move-exception v0

    .line 79
    goto :goto_1

    .line 80
    :goto_0
    iget-object v0, v1, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxyGenerateSession()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v16

    .line 86
    iget-object v3, v1, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 87
    .line 88
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    iget-wide v10, v1, Lcom/tantanapp/media/proxy/api/a;->c:J

    .line 93
    .line 94
    const/4 v13, 0x2

    .line 95
    const-wide/32 v14, 0x4c4b40

    .line 96
    .line 97
    .line 98
    const-wide/16 v6, 0x0

    .line 99
    .line 100
    const/4 v12, 0x0

    .line 101
    move-wide/from16 v8, p2

    .line 102
    .line 103
    invoke-virtual/range {v3 .. v16}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxyAddPreloadTaskWithPreloadDuration(Ljava/lang/String;Ljava/lang/String;JJJLjava/lang/String;IJLjava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 107
    goto :goto_2

    .line 108
    :goto_1
    :try_start_7
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 109
    .line 110
    .line 111
    const/4 v0, 0x0

    .line 112
    :goto_2
    if-lez v0, :cond_4

    .line 113
    .line 114
    iget-object v3, v1, Lcom/tantanapp/media/proxy/api/a;->e:Ljava/util/Map;

    .line 115
    .line 116
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-interface {v3, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 121
    .line 122
    .line 123
    :cond_4
    monitor-exit p0

    .line 124
    return-void

    .line 125
    :cond_5
    :goto_3
    monitor-exit p0

    .line 126
    return-void

    .line 127
    :goto_4
    :try_start_8
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 128
    throw v0
.end method

.method public k(Lcom/tantanapp/media/proxy/api/a$e;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->g:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public declared-synchronized l()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tantanapp/media/proxy/api/a;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->e:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxyClearAllPreloadTask()I

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_1

    .line 28
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->f:Ljava/util/LinkedList;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 31
    .line 32
    .line 33
    monitor-exit p0

    .line 34
    return-void

    .line 35
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 36
    throw v0
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantanapp/media/proxy/api/a;->t()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxyClearAllCache()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public o(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantanapp/media/proxy/api/a;->t()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxyClearCacheWithKey(Ljava/lang/String;)J

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public q(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0, v1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxySwitchPlayURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final declared-synchronized r()V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 3
    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    sget-object v0, Lcom/tantanapp/media/proxy/api/a;->n:Ljava/lang/String;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    new-instance v1, Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 17
    .line 18
    sget-object v2, Lcom/tantanapp/media/proxy/api/a;->n:Ljava/lang/String;

    .line 19
    .line 20
    const-string v3, "0.0.0.0"

    .line 21
    .line 22
    const/4 v5, 0x5

    .line 23
    const/4 v6, 0x5

    .line 24
    const/16 v4, 0x2329

    .line 25
    .line 26
    invoke-virtual/range {v1 .. v6}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxyInit(Ljava/lang/String;Ljava/lang/String;III)J

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 30
    .line 31
    const-wide/32 v1, 0x200000

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxyUpdatePlayerPreloadSize(J)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxyHttpServerStart()V

    .line 40
    .line 41
    .line 42
    new-instance v0, Lorg/json/JSONObject;

    .line 43
    .line 44
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    :try_start_1
    const-string v1, "cache_max_limit_size"

    .line 48
    .line 49
    sget-wide v2, Lcom/tantanapp/media/proxy/api/a;->k:J

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v1, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxySetConfig(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception v0

    .line 65
    goto :goto_3

    .line 66
    :catch_0
    move-exception v0

    .line 67
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 68
    .line 69
    .line 70
    :goto_0
    new-instance v0, Lcom/tantanapp/media/proxy/api/a$a;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Lcom/tantanapp/media/proxy/api/a$a;-><init>(Lcom/tantanapp/media/proxy/api/a;)V

    .line 73
    .line 74
    .line 75
    const/4 v1, 0x2

    .line 76
    invoke-static {v1, v0}, Ll/oyi0;->b(ILjava/lang/Runnable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 77
    .line 78
    .line 79
    :try_start_3
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 80
    .line 81
    new-instance v1, Lcom/tantanapp/media/proxy/api/a$b;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Lcom/tantanapp/media/proxy/api/a$b;-><init>(Lcom/tantanapp/media/proxy/api/a;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->setOnPreloadTaskCompleteListener(Lcom/tantanapp/media/proxy/api/TTMediaProxy$a;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 90
    .line 91
    new-instance v1, Lcom/tantanapp/media/proxy/api/a$c;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Lcom/tantanapp/media/proxy/api/a$c;-><init>(Lcom/tantanapp/media/proxy/api/a;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->setProxyServerResultListener(Lcom/tantanapp/media/proxy/api/TTMediaProxy$b;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :catchall_1
    move-exception v0

    .line 101
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 102
    .line 103
    .line 104
    :goto_1
    monitor-exit p0

    .line 105
    return-void

    .line 106
    :cond_1
    :goto_2
    monitor-exit p0

    .line 107
    return-void

    .line 108
    :goto_3
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 109
    throw v0
.end method

.method public s(Landroid/net/Uri;)I
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->d:Lcom/tantanapp/media/proxy/api/TTMediaProxy;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->proxyCheckCacheExist(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    return p0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 14
    .line 15
    .line 16
    const/4 p0, -0x1

    .line 17
    return p0
.end method

.method public declared-synchronized t()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tantanapp/media/proxy/api/a;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->e:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/util/Map$Entry;

    .line 29
    .line 30
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Landroid/net/Uri;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ljava/lang/Integer;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    monitor-exit p0

    .line 49
    return-void

    .line 50
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    throw v0
.end method

.method public final u(ILjava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/tantanapp/media/proxy/api/a$e;

    .line 18
    .line 19
    invoke-interface {p1, p2, p4, p5, p6}, Lcom/tantanapp/media/proxy/api/a$e;->b(Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final v(ILjava/lang/String;Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/tantanapp/media/proxy/api/a$e;

    .line 18
    .line 19
    invoke-interface {p1, p2, p4, p5, p6}, Lcom/tantanapp/media/proxy/api/a$e;->a(Ljava/lang/String;JLcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public w(Landroid/net/Uri;J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->f:Ljava/util/LinkedList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/tantanapp/media/proxy/api/a;->f:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    :try_start_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/media/proxy/api/a;->A(Landroid/net/Uri;J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    throw p0
.end method

.method public x(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->f:Ljava/util/LinkedList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/tantanapp/media/proxy/api/a;->f:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    :try_start_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget-wide v1, Lcom/tantanapp/media/proxy/api/a;->l:J

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1, v2}, Lcom/tantanapp/media/proxy/api/a;->A(Landroid/net/Uri;J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 44
    throw p0
.end method

.method public final y(Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->toJsonString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "Session = "

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mSessionID:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v2, "TaskEndReasonCode = "

    .line 36
    .line 37
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEndReasonCode:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v2, "TaskEndReason = "

    .line 57
    .line 58
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEndReasonStr:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 74
    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string v2, "TaskId = "

    .line 78
    .line 79
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTaskId:I

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 95
    .line 96
    new-instance v1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v2, "URL = "

    .line 99
    .line 100
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUrl:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 116
    .line 117
    new-instance v1, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    const-string v2, "Key = "

    .line 120
    .line 121
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    iget-object v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mKey:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 137
    .line 138
    new-instance v1, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string v2, "Header = "

    .line 141
    .line 142
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpHeader:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 158
    .line 159
    new-instance v1, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    const-string v2, "DNS Cost = "

    .line 162
    .line 163
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iget-wide v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDnsUsedTime:J

    .line 167
    .line 168
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 179
    .line 180
    new-instance v1, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    const-string v2, "Tcp connect Cost = "

    .line 183
    .line 184
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    iget-wide v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTcpConnectTime:J

    .line 188
    .line 189
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 200
    .line 201
    new-instance v1, Ljava/lang/StringBuilder;

    .line 202
    .line 203
    const-string v2, "Http header Cost = "

    .line 204
    .line 205
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    iget-wide v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpHeaderTime:J

    .line 209
    .line 210
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 221
    .line 222
    new-instance v1, Ljava/lang/StringBuilder;

    .line 223
    .line 224
    const-string v2, "First Packet Cost = "

    .line 225
    .line 226
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    iget-wide v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpBodyTime:J

    .line 230
    .line 231
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 242
    .line 243
    new-instance v1, Ljava/lang/StringBuilder;

    .line 244
    .line 245
    const-string v2, "Http Code = "

    .line 246
    .line 247
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    iget v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpCode:I

    .line 251
    .line 252
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 263
    .line 264
    new-instance v1, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    const-string v2, "CDN IP = "

    .line 267
    .line 268
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    iget-object v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mCdnIp:Ljava/lang/String;

    .line 272
    .line 273
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 284
    .line 285
    new-instance v1, Ljava/lang/StringBuilder;

    .line 286
    .line 287
    const-string v2, "DNS Servers = "

    .line 288
    .line 289
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    iget-object v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDNSServers:Ljava/lang/String;

    .line 293
    .line 294
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 305
    .line 306
    new-instance v1, Ljava/lang/StringBuilder;

    .line 307
    .line 308
    const-string v2, "Range size = "

    .line 309
    .line 310
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    iget-wide v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDnsUsedTime:J

    .line 314
    .line 315
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 326
    .line 327
    new-instance v1, Ljava/lang/StringBuilder;

    .line 328
    .line 329
    const-string v2, "Downloaded Size = "

    .line 330
    .line 331
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    iget-wide v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedSize:J

    .line 335
    .line 336
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 347
    .line 348
    new-instance v1, Ljava/lang/StringBuilder;

    .line 349
    .line 350
    const-string v2, "Downloaded Duration = "

    .line 351
    .line 352
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    iget-wide v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedDuration:J

    .line 356
    .line 357
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 368
    .line 369
    new-instance v1, Ljava/lang/StringBuilder;

    .line 370
    .line 371
    const-string v2, "Task add timestamp = "

    .line 372
    .line 373
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    iget-wide v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAddTimestamp:J

    .line 377
    .line 378
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 389
    .line 390
    new-instance v1, Ljava/lang/StringBuilder;

    .line 391
    .line 392
    const-string v2, "Task wait time = "

    .line 393
    .line 394
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    iget-wide v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mWaitTime:J

    .line 398
    .line 399
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object v1

    .line 406
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 410
    .line 411
    new-instance v1, Ljava/lang/StringBuilder;

    .line 412
    .line 413
    const-string v2, "Task use cost = "

    .line 414
    .line 415
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    iget-wide v2, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUsedTime:J

    .line 419
    .line 420
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object v1

    .line 427
    invoke-static {v0, v1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    iget-object p0, p0, Lcom/tantanapp/media/proxy/api/a;->a:Ljava/lang/String;

    .line 431
    .line 432
    new-instance v0, Ljava/lang/StringBuilder;

    .line 433
    .line 434
    const-string v1, "Download ByteRate = "

    .line 435
    .line 436
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    iget-wide v1, p1, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAverageRate:J

    .line 440
    .line 441
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object p1

    .line 448
    invoke-static {p0, p1}, Ll/dtd0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    .line 450
    .line 451
    return-void
.end method

.method public z(Ljava/lang/String;J)V
    .locals 0

    .line 1
    sput-wide p2, Lcom/tantanapp/media/proxy/api/a;->k:J

    .line 2
    .line 3
    sput-object p1, Lcom/tantanapp/media/proxy/api/a;->n:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantanapp/media/proxy/api/a;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
