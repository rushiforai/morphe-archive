.class public abstract Ll/u1r0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/u1r0$a;
    }
.end annotation


# static fields
.field private static final r:Ljava/util/concurrent/atomic/AtomicInteger;

.field public static s:Z


# instance fields
.field protected a:I

.field protected b:J

.field protected volatile c:J

.field protected volatile d:J

.field private e:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field private final f:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ll/x1r0;",
            ">;"
        }
    .end annotation
.end field

.field protected final g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ll/z1r0;",
            "Ll/u1r0$a;",
            ">;"
        }
    .end annotation
.end field

.field protected final h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ll/z1r0;",
            "Ll/u1r0$a;",
            ">;"
        }
    .end annotation
.end field

.field protected i:Ll/c2r0;

.field protected j:Ljava/lang/String;

.field protected k:Ljava/lang/String;

.field private l:I

.field protected final m:I

.field protected n:Ll/v1r0;

.field protected o:Lcom/xiaomi/push/service/XMPushService;

.field private p:J

.field protected q:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/u1r0;->r:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    sput-boolean v1, Ll/u1r0;->s:Z

    .line 10
    .line 11
    :try_start_0
    const-string v0, "smack.debugEnabled"

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sput-boolean v0, Ll/u1r0;->s:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    :catch_0
    invoke-static {}, Ll/a2r0;->c()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;Ll/v1r0;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/u1r0;->a:I

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Ll/u1r0;->b:J

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Ll/u1r0;->c:J

    .line 14
    .line 15
    iput-wide v0, p0, Ll/u1r0;->d:J

    .line 16
    .line 17
    new-instance v2, Ljava/util/LinkedList;

    .line 18
    .line 19
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Ll/u1r0;->e:Ljava/util/LinkedList;

    .line 23
    .line 24
    new-instance v2, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v2, p0, Ll/u1r0;->f:Ljava/util/Collection;

    .line 30
    .line 31
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 32
    .line 33
    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v2, p0, Ll/u1r0;->g:Ljava/util/Map;

    .line 37
    .line 38
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 39
    .line 40
    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v2, p0, Ll/u1r0;->h:Ljava/util/Map;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    iput-object v2, p0, Ll/u1r0;->i:Ll/c2r0;

    .line 47
    .line 48
    const-string v2, ""

    .line 49
    .line 50
    iput-object v2, p0, Ll/u1r0;->j:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v2, p0, Ll/u1r0;->k:Ljava/lang/String;

    .line 53
    .line 54
    const/4 v2, 0x2

    .line 55
    iput v2, p0, Ll/u1r0;->l:I

    .line 56
    .line 57
    sget-object v2, Ll/u1r0;->r:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    iput v2, p0, Ll/u1r0;->m:I

    .line 64
    .line 65
    iput-wide v0, p0, Ll/u1r0;->p:J

    .line 66
    .line 67
    iput-wide v0, p0, Ll/u1r0;->q:J

    .line 68
    .line 69
    iput-object p2, p0, Ll/u1r0;->n:Ll/v1r0;

    .line 70
    .line 71
    iput-object p1, p0, Ll/u1r0;->o:Lcom/xiaomi/push/service/XMPushService;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/u1r0;->u()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method private d(I)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    const-string p0, "connected"

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    if-nez p1, :cond_1

    .line 8
    .line 9
    const-string p0, "connecting"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_1
    const/4 p0, 0x2

    .line 13
    if-ne p1, p0, :cond_2

    .line 14
    .line 15
    const-string p0, "disconnected"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_2
    const-string p0, "unknown"

    .line 19
    .line 20
    return-object p0
.end method

.method private g(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/u1r0;->e:Ljava/util/LinkedList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    iget-object v1, p0, Ll/u1r0;->e:Ljava/util/LinkedList;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne p1, v2, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    new-instance v2, Landroid/util/Pair;

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-direct {v2, p1, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/u1r0;->e:Ljava/util/LinkedList;

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/util/LinkedList;->size()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/4 v1, 0x6

    .line 42
    if-le p1, v1, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Ll/u1r0;->e:Ljava/util/LinkedList;

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    monitor-exit v0

    .line 51
    return-void

    .line 52
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw p0
.end method


# virtual methods
.method public abstract A(Z)V
.end method

.method public B()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/u1r0;->l:I

    .line 2
    .line 3
    if-nez p0, :cond_0

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

.method public declared-synchronized C()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 3
    .line 4
    .line 5
    move-result-wide v0

    .line 6
    iput-wide v0, p0, Ll/u1r0;->p:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v0
.end method

.method public D()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/u1r0;->l:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public E()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1r0;->e:Ljava/util/LinkedList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/u1r0;->e:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/u1r0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/u1r0;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1r0;->n:Ll/v1r0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/v1r0;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ll/z1r0;",
            "Ll/u1r0$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/u1r0;->g:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ll/v1r0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1r0;->n:Ll/v1r0;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(IILjava/lang/Exception;)V
    .locals 3

    .line 1
    iget v0, p0, Ll/u1r0;->l:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ll/u1r0;->d(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, p1}, Ll/u1r0;->d(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {p2}, Lcom/xiaomi/push/service/an;->a(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "update the connection status. %1$s -> %2$s : %3$s "

    .line 22
    .line 23
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Ll/u1r0;->o:Lcom/xiaomi/push/service/XMPushService;

    .line 31
    .line 32
    invoke-static {v0}, Ll/mtq0;->t(Landroid/content/Context;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-direct {p0, p1}, Ll/u1r0;->g(I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    const/16 v0, 0xa

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    if-ne p1, v1, :cond_3

    .line 45
    .line 46
    iget-object p2, p0, Ll/u1r0;->o:Lcom/xiaomi/push/service/XMPushService;

    .line 47
    .line 48
    invoke-virtual {p2, v0}, Lcom/xiaomi/push/service/XMPushService;->a(I)V

    .line 49
    .line 50
    .line 51
    iget p2, p0, Ll/u1r0;->l:I

    .line 52
    .line 53
    if-eqz p2, :cond_2

    .line 54
    .line 55
    const-string p2, "try set connected while not connecting."

    .line 56
    .line 57
    invoke-static {p2}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    iput p1, p0, Ll/u1r0;->l:I

    .line 61
    .line 62
    iget-object p1, p0, Ll/u1r0;->f:Ljava/util/Collection;

    .line 63
    .line 64
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-eqz p2, :cond_9

    .line 73
    .line 74
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    check-cast p2, Ll/x1r0;

    .line 79
    .line 80
    invoke-interface {p2, p0}, Ll/x1r0;->b(Ll/u1r0;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    const/4 v2, 0x2

    .line 85
    if-nez p1, :cond_5

    .line 86
    .line 87
    iget p2, p0, Ll/u1r0;->l:I

    .line 88
    .line 89
    if-eq p2, v2, :cond_4

    .line 90
    .line 91
    const-string p2, "try set connecting while not disconnected."

    .line 92
    .line 93
    invoke-static {p2}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_4
    iput p1, p0, Ll/u1r0;->l:I

    .line 97
    .line 98
    iget-object p1, p0, Ll/u1r0;->f:Ljava/util/Collection;

    .line 99
    .line 100
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    if-eqz p2, :cond_9

    .line 109
    .line 110
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    check-cast p2, Ll/x1r0;

    .line 115
    .line 116
    invoke-interface {p2, p0}, Ll/x1r0;->a(Ll/u1r0;)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_5
    if-ne p1, v2, :cond_9

    .line 121
    .line 122
    iget-object v2, p0, Ll/u1r0;->o:Lcom/xiaomi/push/service/XMPushService;

    .line 123
    .line 124
    invoke-virtual {v2, v0}, Lcom/xiaomi/push/service/XMPushService;->a(I)V

    .line 125
    .line 126
    .line 127
    iget v0, p0, Ll/u1r0;->l:I

    .line 128
    .line 129
    if-nez v0, :cond_7

    .line 130
    .line 131
    iget-object p2, p0, Ll/u1r0;->f:Ljava/util/Collection;

    .line 132
    .line 133
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_8

    .line 142
    .line 143
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Ll/x1r0;

    .line 148
    .line 149
    if-nez p3, :cond_6

    .line 150
    .line 151
    new-instance v1, Ljava/util/concurrent/CancellationException;

    .line 152
    .line 153
    const-string v2, "disconnect while connecting"

    .line 154
    .line 155
    invoke-direct {v1, v2}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_6
    move-object v1, p3

    .line 160
    :goto_3
    invoke-interface {v0, p0, v1}, Ll/x1r0;->a(Ll/u1r0;Ljava/lang/Exception;)V

    .line 161
    .line 162
    .line 163
    goto :goto_2

    .line 164
    :cond_7
    if-ne v0, v1, :cond_8

    .line 165
    .line 166
    iget-object v0, p0, Ll/u1r0;->f:Ljava/util/Collection;

    .line 167
    .line 168
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-eqz v1, :cond_8

    .line 177
    .line 178
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    check-cast v1, Ll/x1r0;

    .line 183
    .line 184
    invoke-interface {v1, p0, p2, p3}, Ll/x1r0;->a(Ll/u1r0;ILjava/lang/Exception;)V

    .line 185
    .line 186
    .line 187
    goto :goto_4

    .line 188
    :cond_8
    iput p1, p0, Ll/u1r0;->l:I

    .line 189
    .line 190
    :cond_9
    return-void
.end method

.method public abstract i(Lcom/xiaomi/push/service/am$b;)V
.end method

.method public declared-synchronized j(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "setChallenge hash = "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget v1, p0, Ll/u1r0;->l:I

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Ll/zuq0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/16 v2, 0x8

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/u1r0;->j:Ljava/lang/String;

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, p1, v3, v0}, Ll/u1r0;->h(IILjava/lang/Exception;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    const-string p1, "ignore setChallenge because connection was disconnected"

    .line 37
    .line 38
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    .line 41
    :goto_0
    monitor-exit p0

    .line 42
    return-void

    .line 43
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p1
.end method

.method public abstract k(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public l(Ll/x1r0;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Ll/u1r0;->f:Ljava/util/Collection;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Ll/u1r0;->f:Ljava/util/Collection;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public m(Ll/z1r0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1r0;->g:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Ll/z1r0;Ll/d2r0;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/u1r0$a;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/u1r0$a;-><init>(Ll/z1r0;Ll/d2r0;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/u1r0;->g:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "Packet listener is null."

    .line 15
    .line 16
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public abstract o(Ll/g2r0;)V
.end method

.method public abstract p([Ll/w0r0;)V
.end method

.method public q()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public declared-synchronized r(J)Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Ll/u1r0;->p:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    cmp-long p1, v0, p1

    .line 5
    .line 6
    if-ltz p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    monitor-exit p0

    .line 12
    return p1

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public s()I
    .locals 0

    .line 1
    iget p0, p0, Ll/u1r0;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public t()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1r0;->n:Ll/v1r0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/v1r0;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public u()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/u1r0;->n:Ll/v1r0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v1r0;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/u1r0;->i:Ll/c2r0;

    .line 10
    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    :try_start_0
    const-string v1, "smack.debuggerClass"

    .line 15
    .line 16
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-object v1, v0

    .line 22
    :goto_0
    if-eqz v1, :cond_0

    .line 23
    .line 24
    :try_start_1
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 28
    goto :goto_1

    .line 29
    :catch_0
    move-exception v1

    .line 30
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 31
    .line 32
    .line 33
    :cond_0
    :goto_1
    if-nez v0, :cond_1

    .line 34
    .line 35
    new-instance v0, Ll/e1r0;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/e1r0;-><init>(Ll/u1r0;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/u1r0;->i:Ll/c2r0;

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_1
    :try_start_2
    const-class v1, Ll/u1r0;

    .line 44
    .line 45
    const-class v2, Ljava/io/Writer;

    .line 46
    .line 47
    const-class v3, Ljava/io/Reader;

    .line 48
    .line 49
    filled-new-array {v1, v2, v3}, [Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ll/c2r0;

    .line 66
    .line 67
    iput-object v0, p0, Ll/u1r0;->i:Ll/c2r0;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :catch_1
    move-exception p0

    .line 71
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 72
    .line 73
    const-string v1, "Can\'t initialize the configured debugger!"

    .line 74
    .line 75
    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    throw v0

    .line 79
    :cond_2
    :goto_2
    return-void
.end method

.method public abstract v(ILjava/lang/Exception;)V
.end method

.method public abstract w(Ll/w0r0;)V
.end method

.method public x(Ll/x1r0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1r0;->f:Ljava/util/Collection;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y(Ll/z1r0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1r0;->h:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z(Ll/z1r0;Ll/d2r0;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/u1r0$a;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/u1r0$a;-><init>(Ll/z1r0;Ll/d2r0;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/u1r0;->h:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "Packet listener is null."

    .line 15
    .line 16
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
