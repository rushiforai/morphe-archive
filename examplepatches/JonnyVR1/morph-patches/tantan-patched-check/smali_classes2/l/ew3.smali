.class public Ll/ew3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# instance fields
.field private final a:Ll/h1c;

.field private b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/ow3;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Ljava/lang/Object;

.field private final d:Ljava/lang/String;

.field private final e:Z

.field private final f:Ll/nw3;

.field private final g:Ll/ch2;

.field private final h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private final i:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

.field private final j:Ll/oa5;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ljava/lang/String;Ll/h1c;Ll/nw3;Ll/ch2;ZLcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;)V
    .locals 9
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 34
    sget-object v8, Ll/oa5;->a:Ll/oa5;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Ll/ew3;-><init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ljava/lang/String;Ll/h1c;Ll/nw3;Ll/ch2;ZLcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;Ll/oa5;)V

    return-void
.end method

.method public constructor <init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ljava/lang/String;Ll/h1c;Ll/nw3;Ll/ch2;ZLcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;Ll/oa5;)V
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ew3;->c:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p2, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p3, p0, Ll/ew3;->a:Ll/h1c;

    .line 14
    .line 15
    invoke-virtual {p3, p2}, Ll/h1c;->y(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iput-object p2, p0, Ll/ew3;->b:Ljava/util/ArrayList;

    .line 20
    .line 21
    iput-boolean p6, p0, Ll/ew3;->e:Z

    .line 22
    .line 23
    iput-object p4, p0, Ll/ew3;->f:Ll/nw3;

    .line 24
    .line 25
    iput-object p5, p0, Ll/ew3;->g:Ll/ch2;

    .line 26
    .line 27
    iput-object p1, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 28
    .line 29
    iput-object p7, p0, Ll/ew3;->i:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    .line 30
    .line 31
    iput-object p8, p0, Ll/ew3;->j:Ll/oa5;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic a(Ll/ew3;Ljava/lang/Void;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ew3;->g:Ll/ch2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ch2;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Failed to update message read state for id:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0, p1}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic e(Ll/ew3;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/ew3;)Ll/h1c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ew3;->a:Ll/h1c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ll/ew3;)Ll/nw3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ew3;->f:Ll/nw3;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ll/ew3;)Ll/ch2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ew3;->g:Ll/ch2;

    .line 2
    .line 3
    return-object p0
.end method

.method private j(Ljava/lang/String;)Ll/ow3;
    .locals 3
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ew3;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ew3;->b:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/ow3;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/ow3;->e()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    monitor-exit v0

    .line 33
    return-object v1

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    new-instance p0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v0, "Inbox Message for message id - "

    .line 40
    .line 41
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string p1, " not found"

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    return-object p0

    .line 61
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    throw p0
.end method

.method private static q(Ll/ow3;J)J
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    move-wide v2, v0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/ow3;->d()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    :goto_0
    cmp-long p0, v2, v0

    .line 12
    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return-wide v0

    .line 16
    :cond_1
    if-lez p0, :cond_2

    .line 17
    .line 18
    return-wide v2

    .line 19
    :cond_2
    const-wide/32 v0, 0x15180

    .line 20
    .line 21
    .line 22
    add-long/2addr p1, v0

    .line 23
    return-wide p1
.end method

.method private r()V
    .locals 8
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 1
    const-string v0, "CTInboxController:trimMessages() called"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/ew3;->c:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v1

    .line 14
    :try_start_0
    iget-object v2, p0, Ll/ew3;->b:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_2

    .line 25
    .line 26
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ll/ow3;

    .line 31
    .line 32
    iget-boolean v4, p0, Ll/ew3;->e:Z

    .line 33
    .line 34
    if-nez v4, :cond_1

    .line 35
    .line 36
    invoke-virtual {v3}, Ll/ow3;->a()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    const-string v4, "Removing inbox message containing video/audio as app does not support video. For more information checkout CleverTap documentation."

    .line 43
    .line 44
    invoke-static {v4}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_2

    .line 53
    :cond_1
    invoke-virtual {v3}, Ll/ow3;->d()J

    .line 54
    .line 55
    .line 56
    move-result-wide v4

    .line 57
    const-wide/16 v6, 0x0

    .line 58
    .line 59
    cmp-long v6, v4, v6

    .line 60
    .line 61
    if-lez v6, :cond_0

    .line 62
    .line 63
    iget-object v6, p0, Ll/ew3;->j:Ll/oa5;

    .line 64
    .line 65
    invoke-interface {v6}, Ll/oa5;->c()J

    .line 66
    .line 67
    .line 68
    move-result-wide v6

    .line 69
    cmp-long v4, v6, v4

    .line 70
    .line 71
    if-lez v4, :cond_0

    .line 72
    .line 73
    new-instance v4, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v5, "Inbox Message: "

    .line 79
    .line 80
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3}, Ll/ow3;->e()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v5, " is expired - removing"

    .line 91
    .line 92
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-static {v4}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-gtz v2, :cond_3

    .line 111
    .line 112
    monitor-exit v1

    .line 113
    return-void

    .line 114
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_4

    .line 123
    .line 124
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    check-cast v2, Ll/ow3;

    .line 129
    .line 130
    invoke-virtual {v2}, Ll/ow3;->e()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {p0, v2}, Ll/ew3;->c(Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_4
    monitor-exit v1

    .line 139
    return-void

    .line 140
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    throw p0
.end method


# virtual methods
.method public c(Ljava/lang/String;)Z
    .locals 3
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ew3;->j(Ljava/lang/String;)Ll/ow3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object v1, p0, Ll/ew3;->c:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v1

    .line 12
    :try_start_0
    iget-object v2, p0, Ll/ew3;->b:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    iget-object v0, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 19
    .line 20
    invoke-static {v0}, Ll/ru3;->c(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Ll/su3;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "RunDeleteMessage"

    .line 29
    .line 30
    new-instance v2, Ll/ew3$b;

    .line 31
    .line 32
    invoke-direct {v2, p0, p1}, Ll/ew3$b;-><init>(Ll/ew3;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    throw p0
.end method

.method public d(Ljava/lang/String;)Z
    .locals 11
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ew3;->j(Ljava/lang/String;)Ll/ow3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {v0}, Ll/ow3;->h()Lcom/clevertap/android/sdk/inbox/InboxMessageSource;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    sget-object v3, Lcom/clevertap/android/sdk/inbox/InboxMessageSource;->V2:Lcom/clevertap/android/sdk/inbox/InboxMessageSource;

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    if-ne v2, v3, :cond_1

    .line 17
    .line 18
    move v8, v4

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    move v8, v1

    .line 21
    :goto_0
    if-eqz v8, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Ll/ew3;->j:Ll/oa5;

    .line 24
    .line 25
    invoke-interface {v1}, Ll/oa5;->c()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    invoke-static {v0, v1, v2}, Ll/ew3;->q(Ll/ow3;J)J

    .line 30
    .line 31
    .line 32
    move-result-wide v1

    .line 33
    :goto_1
    move-wide v9, v1

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    const-wide/16 v1, 0x0

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :goto_2
    iget-object v1, p0, Ll/ew3;->c:Ljava/lang/Object;

    .line 39
    .line 40
    monitor-enter v1

    .line 41
    :try_start_0
    invoke-virtual {v0, v4}, Ll/ow3;->u(I)V

    .line 42
    .line 43
    .line 44
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    iget-object v0, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 46
    .line 47
    invoke-static {v0}, Ll/ru3;->c(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Ll/su3;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/cw3;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/cw3;-><init>(Ll/ew3;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/clevertap/android/sdk/task/Task;->f(Ll/vo50;)Lcom/clevertap/android/sdk/task/Task;

    .line 61
    .line 62
    .line 63
    new-instance v1, Ll/dw3;

    .line 64
    .line 65
    invoke-direct {v1, p1}, Ll/dw3;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/clevertap/android/sdk/task/Task;->d(Ll/hm50;)Lcom/clevertap/android/sdk/task/Task;

    .line 69
    .line 70
    .line 71
    const-string v1, "RunMarkMessageRead"

    .line 72
    .line 73
    new-instance v5, Ll/ew3$c;

    .line 74
    .line 75
    move-object v6, p0

    .line 76
    move-object v7, p1

    .line 77
    invoke-direct/range {v5 .. v10}, Ll/ew3$c;-><init>(Ll/ew3;Ljava/lang/String;ZJ)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1, v5}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 81
    .line 82
    .line 83
    return v4

    .line 84
    :catchall_0
    move-exception v0

    .line 85
    move-object p0, v0

    .line 86
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    throw p0
.end method

.method public i()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ew3;->l()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public k(Ljava/lang/String;)Ll/ow3;
    .locals 0
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ew3;->j(Ljava/lang/String;)Ll/ow3;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()Ljava/util/ArrayList;
    .locals 1
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/ow3;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ew3;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-direct {p0}, Ll/ew3;->r()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/ew3;->b:Ljava/util/ArrayList;

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-object p0

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

.method public m()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ljava/lang/String;)Z
    .locals 4
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Ll/ew3;->c:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object p0, p0, Ll/ew3;->b:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_3

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ll/ow3;

    .line 25
    .line 26
    invoke-virtual {v2}, Ll/ow3;->e()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    invoke-virtual {v2}, Ll/ow3;->h()Lcom/clevertap/android/sdk/inbox/InboxMessageSource;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    sget-object p1, Lcom/clevertap/android/sdk/inbox/InboxMessageSource;->V2:Lcom/clevertap/android/sdk/inbox/InboxMessageSource;

    .line 41
    .line 42
    if-ne p0, p1, :cond_2

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    :cond_2
    monitor-exit v1

    .line 46
    return v0

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_0

    .line 49
    :cond_3
    monitor-exit v1

    .line 50
    return v0

    .line 51
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p0
.end method

.method public o(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;)V
    .locals 2
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ru3;->c(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Ll/su3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/su3;->d()Lcom/clevertap/android/sdk/task/Task;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/ew3$a;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/ew3$a;-><init>(Ll/ew3;Lcom/clevertap/android/sdk/inbox/CTInboxMessage;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "markReadInboxMessage"

    .line 17
    .line 18
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public p(Ljava/util/List;Lcom/clevertap/android/sdk/response/InboxV2DeliverySource;)Z
    .locals 11
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ow3;",
            ">;",
            "Lcom/clevertap/android/sdk/response/InboxV2DeliverySource;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ew3;->j:Ll/oa5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/oa5;->c()J

    .line 4
    .line 5
    .line 6
    move-result-wide v6

    .line 7
    sget-object v0, Lcom/clevertap/android/sdk/response/InboxV2DeliverySource;->FETCH:Lcom/clevertap/android/sdk/response/InboxV2DeliverySource;

    .line 8
    .line 9
    const/4 v8, 0x1

    .line 10
    const/4 v9, 0x0

    .line 11
    if-ne p2, v0, :cond_3

    .line 12
    .line 13
    new-instance v0, Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Ll/ow3;

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/ow3;->e()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    iget-object v1, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object v2, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    new-instance v3, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v4, "InboxV2: markIndexed "

    .line 67
    .line 68
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v4, " msg(s)"

    .line 79
    .line 80
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v1, v2, v3}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Ll/ew3;->a:Ll/h1c;

    .line 91
    .line 92
    new-instance v2, Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 95
    .line 96
    .line 97
    iget-object v3, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v1, v2, v3}, Ll/h1c;->F(Ljava/util/List;Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    :cond_1
    const-wide/16 v1, 0x5460

    .line 103
    .line 104
    sub-long v1, v6, v1

    .line 105
    .line 106
    iget-object v3, p0, Ll/ew3;->a:Ll/h1c;

    .line 107
    .line 108
    iget-object v4, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v3, v4, v1, v2}, Ll/h1c;->t(Ljava/lang/String;J)Ljava/util/Set;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-interface {v1, v0}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 115
    .line 116
    .line 117
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iget-object v2, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 122
    .line 123
    if-nez v0, :cond_2

    .line 124
    .line 125
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v2, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 130
    .line 131
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    new-instance v3, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    const-string v4, "InboxV2: cross-device sweep \u2014 removing "

    .line 138
    .line 139
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-interface {v1}, Ljava/util/Set;->size()I

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v4, " msg(s): "

    .line 150
    .line 151
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v0, v2, v3}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ll/ew3;->a:Ll/h1c;

    .line 165
    .line 166
    new-instance v2, Ljava/util/ArrayList;

    .line 167
    .line 168
    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 169
    .line 170
    .line 171
    iget-object v1, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {v0, v2, v1}, Ll/h1c;->m(Ljava/util/List;Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move v0, v8

    .line 177
    goto :goto_1

    .line 178
    :cond_2
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iget-object v1, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 183
    .line 184
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    const-string v2, "InboxV2: cross-device sweep \u2014 nothing to remove"

    .line 189
    .line 190
    invoke-virtual {v0, v1, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    :cond_3
    move v0, v9

    .line 194
    :goto_1
    iget-object v1, p0, Ll/ew3;->a:Ll/h1c;

    .line 195
    .line 196
    iget-object v2, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v1, v2, v6, v7}, Ll/h1c;->K(Ljava/lang/String;J)I

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    if-lez v1, :cond_4

    .line 203
    .line 204
    iget-object v2, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 205
    .line 206
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    iget-object v3, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 211
    .line 212
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    new-instance v4, Ljava/lang/StringBuilder;

    .line 217
    .line 218
    const-string v5, "InboxV2: removed "

    .line 219
    .line 220
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    const-string v1, " expired AWAITING_CONFIRM row(s)"

    .line 227
    .line 228
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-virtual {v2, v3, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    :cond_4
    iget-object v1, p0, Ll/ew3;->a:Ll/h1c;

    .line 239
    .line 240
    iget-object v2, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 241
    .line 242
    invoke-virtual {v1, v2, v6, v7}, Ll/h1c;->L(Ljava/lang/String;J)I

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    if-lez v1, :cond_5

    .line 247
    .line 248
    iget-object v2, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 249
    .line 250
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    iget-object v3, p0, Ll/ew3;->h:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 255
    .line 256
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    new-instance v4, Ljava/lang/StringBuilder;

    .line 261
    .line 262
    const-string v5, "InboxV2: removed "

    .line 263
    .line 264
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    const-string v1, " expired pending-read row(s)"

    .line 271
    .line 272
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {v2, v3, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    :cond_5
    iget-object v1, p0, Ll/ew3;->a:Ll/h1c;

    .line 283
    .line 284
    iget-object v2, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 285
    .line 286
    invoke-virtual {v1, v2}, Ll/h1c;->z(Ljava/lang/String;)Ljava/util/Set;

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    iget-object v1, p0, Ll/ew3;->a:Ll/h1c;

    .line 291
    .line 292
    iget-object v2, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 293
    .line 294
    invoke-virtual {v1, v2}, Ll/h1c;->B(Ljava/lang/String;)Ljava/util/Set;

    .line 295
    .line 296
    .line 297
    move-result-object v4

    .line 298
    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    .line 299
    .line 300
    .line 301
    move-result v1

    .line 302
    if-nez v1, :cond_8

    .line 303
    .line 304
    new-instance v1, Ljava/util/ArrayList;

    .line 305
    .line 306
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 307
    .line 308
    .line 309
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 310
    .line 311
    .line 312
    move-result-object v2

    .line 313
    :cond_6
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    if-eqz v5, :cond_7

    .line 318
    .line 319
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v5

    .line 323
    check-cast v5, Ll/ow3;

    .line 324
    .line 325
    invoke-virtual {v5}, Ll/ow3;->n()I

    .line 326
    .line 327
    .line 328
    move-result v10

    .line 329
    if-ne v10, v8, :cond_6

    .line 330
    .line 331
    invoke-virtual {v5}, Ll/ow3;->e()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v10

    .line 335
    invoke-interface {v4, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result v10

    .line 339
    if-eqz v10, :cond_6

    .line 340
    .line 341
    invoke-virtual {v5}, Ll/ow3;->e()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v5

    .line 345
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    goto :goto_2

    .line 349
    :cond_7
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 350
    .line 351
    .line 352
    move-result v2

    .line 353
    if-nez v2, :cond_8

    .line 354
    .line 355
    iget-object v2, p0, Ll/ew3;->a:Ll/h1c;

    .line 356
    .line 357
    iget-object v5, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 358
    .line 359
    invoke-virtual {v2, v1, v5}, Ll/h1c;->M(Ljava/util/List;Ljava/lang/String;)Z

    .line 360
    .line 361
    .line 362
    :cond_8
    sget-object v1, Ll/etm;->INSTANCE:Ll/etm;

    .line 363
    .line 364
    iget-boolean v5, p0, Ll/ew3;->e:Z

    .line 365
    .line 366
    move-object v2, p1

    .line 367
    invoke-virtual/range {v1 .. v7}, Ll/etm;->c(Ljava/util/List;Ljava/util/Set;Ljava/util/Set;ZJ)Ljava/util/List;

    .line 368
    .line 369
    .line 370
    move-result-object p1

    .line 371
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 372
    .line 373
    .line 374
    move-result v1

    .line 375
    if-nez v1, :cond_a

    .line 376
    .line 377
    sget-object v1, Lcom/clevertap/android/sdk/response/InboxV2DeliverySource;->FETCH:Lcom/clevertap/android/sdk/response/InboxV2DeliverySource;

    .line 378
    .line 379
    if-ne p2, v1, :cond_9

    .line 380
    .line 381
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 382
    .line 383
    .line 384
    move-result-object p2

    .line 385
    :goto_3
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    if-eqz v1, :cond_9

    .line 390
    .line 391
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    check-cast v1, Ll/ow3;

    .line 396
    .line 397
    const-string v2, "INDEXED"

    .line 398
    .line 399
    invoke-virtual {v1, v2}, Ll/ow3;->s(Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    goto :goto_3

    .line 403
    :cond_9
    iget-object p2, p0, Ll/ew3;->a:Ll/h1c;

    .line 404
    .line 405
    invoke-virtual {p2, p1}, Ll/h1c;->S(Ljava/util/List;)V

    .line 406
    .line 407
    .line 408
    :cond_a
    if-nez v0, :cond_b

    .line 409
    .line 410
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 411
    .line 412
    .line 413
    move-result p1

    .line 414
    if-nez p1, :cond_c

    .line 415
    .line 416
    :cond_b
    move v9, v8

    .line 417
    :cond_c
    iget-object p1, p0, Ll/ew3;->c:Ljava/lang/Object;

    .line 418
    .line 419
    monitor-enter p1

    .line 420
    :try_start_0
    iget-object p2, p0, Ll/ew3;->a:Ll/h1c;

    .line 421
    .line 422
    iget-object v0, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 423
    .line 424
    invoke-virtual {p2, v0}, Ll/h1c;->y(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 425
    .line 426
    .line 427
    move-result-object v2

    .line 428
    sget-object v1, Ll/etm;->INSTANCE:Ll/etm;

    .line 429
    .line 430
    iget-boolean v5, p0, Ll/ew3;->e:Z

    .line 431
    .line 432
    invoke-virtual/range {v1 .. v7}, Ll/etm;->b(Ljava/util/List;Ljava/util/Set;Ljava/util/Set;ZJ)Ll/p85;

    .line 433
    .line 434
    .line 435
    move-result-object p2

    .line 436
    invoke-virtual {p2}, Ll/p85;->b()Ljava/util/List;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 441
    .line 442
    .line 443
    move-result v0

    .line 444
    if-nez v0, :cond_d

    .line 445
    .line 446
    iget-object v0, p0, Ll/ew3;->a:Ll/h1c;

    .line 447
    .line 448
    invoke-virtual {p2}, Ll/p85;->b()Ljava/util/List;

    .line 449
    .line 450
    .line 451
    move-result-object v1

    .line 452
    iget-object v2, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 453
    .line 454
    invoke-virtual {v0, v1, v2}, Ll/h1c;->m(Ljava/util/List;Ljava/lang/String;)Z

    .line 455
    .line 456
    .line 457
    goto :goto_4

    .line 458
    :catchall_0
    move-exception v0

    .line 459
    move-object p0, v0

    .line 460
    goto :goto_5

    .line 461
    :cond_d
    move v8, v9

    .line 462
    :goto_4
    new-instance v0, Ljava/util/ArrayList;

    .line 463
    .line 464
    invoke-virtual {p2}, Ll/p85;->a()Ljava/util/List;

    .line 465
    .line 466
    .line 467
    move-result-object p2

    .line 468
    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 469
    .line 470
    .line 471
    iput-object v0, p0, Ll/ew3;->b:Ljava/util/ArrayList;

    .line 472
    .line 473
    monitor-exit p1

    .line 474
    return v8

    .line 475
    :goto_5
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 476
    throw p0
.end method

.method public s(Lorg/json/JSONArray;)Z
    .locals 6
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    const-string v0, "CTInboxController:updateMessages() called"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    move v2, v1

    .line 13
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-ge v2, v3, :cond_2

    .line 18
    .line 19
    :try_start_0
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-object v4, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 24
    .line 25
    sget-object v5, Lcom/clevertap/android/sdk/inbox/InboxMessageSource;->V1:Lcom/clevertap/android/sdk/inbox/InboxMessageSource;

    .line 26
    .line 27
    invoke-static {v3, v4, v5}, Ll/ow3;->m(Lorg/json/JSONObject;Ljava/lang/String;Lcom/clevertap/android/sdk/inbox/InboxMessageSource;)Ll/ow3;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    if-nez v3, :cond_0

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_0
    iget-boolean v4, p0, Ll/ew3;->e:Z

    .line 35
    .line 36
    if-nez v4, :cond_1

    .line 37
    .line 38
    invoke-virtual {v3}, Ll/ow3;->a()Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-eqz v4, :cond_1

    .line 43
    .line 44
    const-string v3, "Dropping inbox message containing video/audio as app does not support video. For more information checkout CleverTap documentation."

    .line 45
    .line 46
    invoke-static {v3}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :catch_0
    move-exception v3

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    new-instance v4, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string v5, "Inbox Message for message id - "

    .line 61
    .line 62
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3}, Ll/ow3;->e()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v3, " added"

    .line 73
    .line 74
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-static {v3}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v5, "Unable to update notification inbox messages - "

    .line 88
    .line 89
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-static {v3}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-lez p1, :cond_3

    .line 114
    .line 115
    iget-object p1, p0, Ll/ew3;->a:Ll/h1c;

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Ll/h1c;->S(Ljava/util/List;)V

    .line 118
    .line 119
    .line 120
    const-string p1, "New Notification Inbox messages added"

    .line 121
    .line 122
    invoke-static {p1}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Ll/ew3;->c:Ljava/lang/Object;

    .line 126
    .line 127
    monitor-enter p1

    .line 128
    :try_start_1
    iget-object v0, p0, Ll/ew3;->a:Ll/h1c;

    .line 129
    .line 130
    iget-object v1, p0, Ll/ew3;->d:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Ll/h1c;->y(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Ll/ew3;->b:Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-direct {p0}, Ll/ew3;->r()V

    .line 139
    .line 140
    .line 141
    monitor-exit p1

    .line 142
    const/4 v1, 0x1

    .line 143
    goto :goto_3

    .line 144
    :catchall_0
    move-exception p0

    .line 145
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    throw p0

    .line 147
    :cond_3
    :goto_3
    return v1
.end method
