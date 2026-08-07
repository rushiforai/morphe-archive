.class public Lcom/xiaomi/push/h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/h$b;
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Z

.field private c:I

.field private d:J

.field private e:Lcom/xiaomi/push/f;

.field private f:Lcom/xiaomi/push/a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/xiaomi/push/h;->b:Z

    .line 6
    .line 7
    invoke-static {}, Lcom/xiaomi/push/a;->b()Lcom/xiaomi/push/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/xiaomi/push/h;->f:Lcom/xiaomi/push/a;

    .line 12
    .line 13
    return-void
.end method

.method private b(Lcom/xiaomi/push/a$a;)Lcom/xiaomi/push/ej;
    .locals 1

    .line 1
    iget v0, p1, Lcom/xiaomi/push/a$a;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p1, Lcom/xiaomi/push/a$a;->c:Ljava/lang/Object;

    .line 6
    .line 7
    instance-of p1, p0, Lcom/xiaomi/push/ej;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Lcom/xiaomi/push/ej;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0

    .line 16
    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/h;->a()Lcom/xiaomi/push/ej;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget-object v0, Lcom/xiaomi/push/ei;->k:Lcom/xiaomi/push/ei;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/xiaomi/push/ei;->a()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/ej;->a(I)Lcom/xiaomi/push/ej;

    .line 27
    .line 28
    .line 29
    iget v0, p1, Lcom/xiaomi/push/a$a;->a:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/xiaomi/push/ej;->c(I)Lcom/xiaomi/push/ej;

    .line 32
    .line 33
    .line 34
    iget-object p1, p1, Lcom/xiaomi/push/a$a;->b:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/ej;->c(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 37
    .line 38
    .line 39
    return-object p0
.end method

.method private d(I)Lcom/xiaomi/push/ek;
    .locals 7

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/xiaomi/push/ek;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/xiaomi/push/h;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-direct {v1, v2, v0}, Lcom/xiaomi/push/ek;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/xiaomi/push/h;->e:Lcom/xiaomi/push/f;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 16
    .line 17
    invoke-static {v2}, Ll/mtq0;->x(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, Lcom/xiaomi/push/h;->e:Lcom/xiaomi/push/f;

    .line 24
    .line 25
    iget-object v2, v2, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 26
    .line 27
    invoke-static {v2}, Ll/u3r0;->B(Landroid/content/Context;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Lcom/xiaomi/push/ek;->a(Ljava/lang/String;)Lcom/xiaomi/push/ek;

    .line 32
    .line 33
    .line 34
    :cond_0
    new-instance v2, Ll/c4r0;

    .line 35
    .line 36
    invoke-direct {v2, p1}, Ll/c4r0;-><init>(I)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Lcom/xiaomi/push/ig$a;

    .line 40
    .line 41
    invoke-direct {v3}, Lcom/xiaomi/push/ig$a;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3, v2}, Lcom/xiaomi/push/ig$a;->a(Ll/e4r0;)Ll/w3r0;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    :try_start_0
    invoke-virtual {v1, v3}, Lcom/xiaomi/push/ek;->b(Ll/w3r0;)V
    :try_end_0
    .catch Lcom/xiaomi/push/hu; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    :catch_0
    iget-object v4, p0, Lcom/xiaomi/push/h;->f:Lcom/xiaomi/push/a;

    .line 52
    .line 53
    invoke-virtual {v4}, Lcom/xiaomi/push/a;->c()Ljava/util/LinkedList;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    :goto_0
    :try_start_1
    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    if-lez v5, :cond_4

    .line 62
    .line 63
    invoke-virtual {v4}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    check-cast v5, Lcom/xiaomi/push/a$a;

    .line 68
    .line 69
    invoke-direct {p0, v5}, Lcom/xiaomi/push/h;->b(Lcom/xiaomi/push/a$a;)Lcom/xiaomi/push/ej;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    if-eqz v5, :cond_1

    .line 74
    .line 75
    invoke-virtual {v5, v3}, Lcom/xiaomi/push/ej;->b(Ll/w3r0;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-virtual {v2}, Ll/c4r0;->h()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-le v6, p1, :cond_2

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    if-eqz v5, :cond_3

    .line 86
    .line 87
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_3
    invoke-virtual {v4}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/xiaomi/push/hu; {:try_start_1 .. :try_end_1} :catch_1

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :catch_1
    :cond_4
    :goto_1
    return-object v1
.end method

.method public static e()Lcom/xiaomi/push/f;
    .locals 2

    .line 1
    sget-object v0, Lcom/xiaomi/push/h$b;->a:Lcom/xiaomi/push/h;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, v0, Lcom/xiaomi/push/h;->e:Lcom/xiaomi/push/f;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw v1
.end method

.method public static f()Lcom/xiaomi/push/h;
    .locals 1

    .line 1
    sget-object v0, Lcom/xiaomi/push/h$b;->a:Lcom/xiaomi/push/h;

    .line 2
    .line 3
    return-object v0
.end method

.method private g()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/xiaomi/push/h;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-wide v2, p0, Lcom/xiaomi/push/h;->d:J

    .line 10
    .line 11
    sub-long/2addr v0, v2

    .line 12
    iget v2, p0, Lcom/xiaomi/push/h;->c:I

    .line 13
    .line 14
    int-to-long v2, v2

    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/xiaomi/push/h;->b:Z

    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/xiaomi/push/h;->d:J

    .line 25
    .line 26
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized a()Lcom/xiaomi/push/ej;
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lcom/xiaomi/push/ej;

    .line 3
    .line 4
    invoke-direct {v0}, Lcom/xiaomi/push/ej;-><init>()V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/xiaomi/push/h;->e:Lcom/xiaomi/push/f;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 10
    .line 11
    invoke-static {v1}, Ll/mtq0;->e(Landroid/content/Context;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/ej;->a(Ljava/lang/String;)Lcom/xiaomi/push/ej;

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-byte v1, v0, Lcom/xiaomi/push/ej;->a:B

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    iput v1, v0, Lcom/xiaomi/push/ej;->b:I

    .line 23
    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    const-wide/16 v3, 0x3e8

    .line 29
    .line 30
    div-long/2addr v1, v3

    .line 31
    long-to-int v1, v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/ej;->d(I)Lcom/xiaomi/push/ej;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    monitor-exit p0

    .line 36
    return-object v0

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    throw v0
.end method

.method public declared-synchronized c()Lcom/xiaomi/push/ek;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/push/h;->l()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/xiaomi/push/h;->e:Lcom/xiaomi/push/f;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/xiaomi/push/f;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 11
    .line 12
    invoke-static {v0}, Ll/mtq0;->x(Landroid/content/Context;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const/16 v0, 0x177

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/16 v0, 0x2ee

    .line 22
    .line 23
    :goto_0
    invoke-direct {p0, v0}, Lcom/xiaomi/push/h;->d(I)Lcom/xiaomi/push/ek;

    .line 24
    .line 25
    .line 26
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    goto :goto_1

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    goto :goto_2

    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    :goto_1
    monitor-exit p0

    .line 32
    return-object v0

    .line 33
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw v0
.end method

.method public h(I)V
    .locals 2

    .line 1
    if-lez p1, :cond_2

    .line 2
    .line 3
    mul-int/lit16 p1, p1, 0x3e8

    .line 4
    .line 5
    const v0, 0x240c8400

    .line 6
    .line 7
    .line 8
    if-le p1, v0, :cond_0

    .line 9
    .line 10
    move p1, v0

    .line 11
    :cond_0
    iget v0, p0, Lcom/xiaomi/push/h;->c:I

    .line 12
    .line 13
    if-ne v0, p1, :cond_1

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/xiaomi/push/h;->b:Z

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    :cond_1
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/xiaomi/push/h;->b:Z

    .line 21
    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    iput-wide v0, p0, Lcom/xiaomi/push/h;->d:J

    .line 27
    .line 28
    iput p1, p0, Lcom/xiaomi/push/h;->c:I

    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v1, "enable dot duration = "

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p1, " start = "

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-wide p0, p0, Lcom/xiaomi/push/h;->d:J

    .line 46
    .line 47
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public declared-synchronized i(Lcom/xiaomi/push/ej;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/h;->f:Lcom/xiaomi/push/a;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/a;->e(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public declared-synchronized j(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lcom/xiaomi/push/f;

    .line 3
    .line 4
    invoke-direct {v0, p1}, Lcom/xiaomi/push/f;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/xiaomi/push/h;->e:Lcom/xiaomi/push/f;

    .line 8
    .line 9
    const-string p1, ""

    .line 10
    .line 11
    iput-object p1, p0, Lcom/xiaomi/push/h;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Lcom/xiaomi/push/service/ax;->a()Lcom/xiaomi/push/service/ax;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Lcom/xiaomi/push/h$a;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lcom/xiaomi/push/h$a;-><init>(Lcom/xiaomi/push/h;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lcom/xiaomi/push/service/ax;->a(Lcom/xiaomi/push/service/ax$a;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p1
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/xiaomi/push/h;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/push/h;->g()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/xiaomi/push/h;->b:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/xiaomi/push/h;->f:Lcom/xiaomi/push/a;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/xiaomi/push/a;->a()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-lez p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method
