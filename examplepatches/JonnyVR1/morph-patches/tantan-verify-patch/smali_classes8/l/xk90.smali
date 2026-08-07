.class public final Ll/xk90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# static fields
.field public static final g:Ll/vk90;


# instance fields
.field public a:J

.field public b:Ll/vk90;

.field public c:Z

.field public d:J

.field public e:J

.field public f:Ll/vk90;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/xk90$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xk90$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/xk90;->g:Ll/vk90;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 14

    .line 1
    :cond_0
    :goto_0
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Ll/xk90;->d:J

    .line 3
    .line 4
    iget-wide v2, p0, Ll/xk90;->e:J

    .line 5
    .line 6
    iget-object v4, p0, Ll/xk90;->f:Ll/vk90;

    .line 7
    .line 8
    const-wide/16 v5, 0x0

    .line 9
    .line 10
    cmp-long v7, v0, v5

    .line 11
    .line 12
    if-nez v7, :cond_1

    .line 13
    .line 14
    cmp-long v8, v2, v5

    .line 15
    .line 16
    if-nez v8, :cond_1

    .line 17
    .line 18
    if-nez v4, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Ll/xk90;->c:Z

    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_3

    .line 27
    :cond_1
    iput-wide v5, p0, Ll/xk90;->d:J

    .line 28
    .line 29
    iput-wide v5, p0, Ll/xk90;->e:J

    .line 30
    .line 31
    const/4 v8, 0x0

    .line 32
    iput-object v8, p0, Ll/xk90;->f:Ll/vk90;

    .line 33
    .line 34
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    iget-wide v9, p0, Ll/xk90;->a:J

    .line 36
    .line 37
    const-wide v11, 0x7fffffffffffffffL

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    cmp-long v13, v9, v11

    .line 43
    .line 44
    if-eqz v13, :cond_5

    .line 45
    .line 46
    add-long/2addr v9, v0

    .line 47
    cmp-long v13, v9, v5

    .line 48
    .line 49
    if-ltz v13, :cond_4

    .line 50
    .line 51
    cmp-long v13, v9, v11

    .line 52
    .line 53
    if-nez v13, :cond_2

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    sub-long/2addr v9, v2

    .line 57
    cmp-long v2, v9, v5

    .line 58
    .line 59
    if-ltz v2, :cond_3

    .line 60
    .line 61
    iput-wide v9, p0, Ll/xk90;->a:J

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_3
    const-string p0, "more produced than requested"

    .line 65
    .line 66
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_4
    :goto_1
    iput-wide v11, p0, Ll/xk90;->a:J

    .line 71
    .line 72
    move-wide v9, v11

    .line 73
    :cond_5
    :goto_2
    if-eqz v4, :cond_7

    .line 74
    .line 75
    sget-object v0, Ll/xk90;->g:Ll/vk90;

    .line 76
    .line 77
    if-ne v4, v0, :cond_6

    .line 78
    .line 79
    iput-object v8, p0, Ll/xk90;->b:Ll/vk90;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_6
    iput-object v4, p0, Ll/xk90;->b:Ll/vk90;

    .line 83
    .line 84
    invoke-interface {v4, v9, v10}, Ll/vk90;->request(J)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_7
    iget-object v2, p0, Ll/xk90;->b:Ll/vk90;

    .line 89
    .line 90
    if-eqz v2, :cond_0

    .line 91
    .line 92
    if-eqz v7, :cond_0

    .line 93
    .line 94
    invoke-interface {v2, v0, v1}, Ll/vk90;->request(J)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    throw v0
.end method

.method public b(J)V
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-lez v2, :cond_3

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    iget-boolean v2, p0, Ll/xk90;->c:Z

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    iget-wide v0, p0, Ll/xk90;->e:J

    .line 13
    .line 14
    add-long/2addr v0, p1

    .line 15
    iput-wide v0, p0, Ll/xk90;->e:J

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_2

    .line 21
    :cond_0
    const/4 v2, 0x1

    .line 22
    iput-boolean v2, p0, Ll/xk90;->c:Z

    .line 23
    .line 24
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :try_start_1
    iget-wide v2, p0, Ll/xk90;->a:J

    .line 26
    .line 27
    const-wide v4, 0x7fffffffffffffffL

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    cmp-long v4, v2, v4

    .line 33
    .line 34
    if-eqz v4, :cond_2

    .line 35
    .line 36
    sub-long/2addr v2, p1

    .line 37
    cmp-long p1, v2, v0

    .line 38
    .line 39
    if-ltz p1, :cond_1

    .line 40
    .line 41
    iput-wide v2, p0, Ll/xk90;->a:J

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_1
    move-exception p1

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 47
    .line 48
    const-string p2, "more items arrived than were requested"

    .line 49
    .line 50
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p1

    .line 54
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/xk90;->a()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :goto_1
    monitor-enter p0

    .line 59
    const/4 p2, 0x0

    .line 60
    :try_start_2
    iput-boolean p2, p0, Ll/xk90;->c:Z

    .line 61
    .line 62
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 63
    throw p1

    .line 64
    :catchall_2
    move-exception p1

    .line 65
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 66
    throw p1

    .line 67
    :goto_2
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 68
    throw p1

    .line 69
    :cond_3
    const-string p0, "n > 0 required"

    .line 70
    .line 71
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public c(Ll/vk90;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/xk90;->c:Z

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    sget-object p1, Ll/xk90;->g:Ll/vk90;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    goto :goto_3

    .line 13
    :cond_0
    :goto_0
    iput-object p1, p0, Ll/xk90;->f:Ll/vk90;

    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :cond_1
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Ll/xk90;->c:Z

    .line 19
    .line 20
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    :try_start_1
    iput-object p1, p0, Ll/xk90;->b:Ll/vk90;

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget-wide v0, p0, Ll/xk90;->a:J

    .line 26
    .line 27
    invoke-interface {p1, v0, v1}, Ll/vk90;->request(J)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :catchall_1
    move-exception p1

    .line 32
    goto :goto_2

    .line 33
    :cond_2
    :goto_1
    invoke-virtual {p0}, Ll/xk90;->a()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :goto_2
    monitor-enter p0

    .line 38
    const/4 v0, 0x0

    .line 39
    :try_start_2
    iput-boolean v0, p0, Ll/xk90;->c:Z

    .line 40
    .line 41
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 42
    throw p1

    .line 43
    :catchall_2
    move-exception p1

    .line 44
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 45
    throw p1

    .line 46
    :goto_3
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 47
    throw p1
.end method

.method public request(J)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-ltz v2, :cond_4

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    monitor-enter p0

    .line 11
    :try_start_0
    iget-boolean v2, p0, Ll/xk90;->c:Z

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    iget-wide v0, p0, Ll/xk90;->d:J

    .line 16
    .line 17
    add-long/2addr v0, p1

    .line 18
    iput-wide v0, p0, Ll/xk90;->d:J

    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    goto :goto_2

    .line 24
    :cond_1
    const/4 v2, 0x1

    .line 25
    iput-boolean v2, p0, Ll/xk90;->c:Z

    .line 26
    .line 27
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    :try_start_1
    iget-wide v2, p0, Ll/xk90;->a:J

    .line 29
    .line 30
    add-long/2addr v2, p1

    .line 31
    cmp-long v0, v2, v0

    .line 32
    .line 33
    if-gez v0, :cond_2

    .line 34
    .line 35
    const-wide v2, 0x7fffffffffffffffL

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    :cond_2
    iput-wide v2, p0, Ll/xk90;->a:J

    .line 41
    .line 42
    iget-object v0, p0, Ll/xk90;->b:Ll/vk90;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    invoke-interface {v0, p1, p2}, Ll/vk90;->request(J)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_1
    move-exception p1

    .line 51
    goto :goto_1

    .line 52
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/xk90;->a()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :goto_1
    monitor-enter p0

    .line 57
    const/4 p2, 0x0

    .line 58
    :try_start_2
    iput-boolean p2, p0, Ll/xk90;->c:Z

    .line 59
    .line 60
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 61
    throw p1

    .line 62
    :catchall_2
    move-exception p1

    .line 63
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 64
    throw p1

    .line 65
    :goto_2
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 66
    throw p1

    .line 67
    :cond_4
    const-string p0, "n >= 0 required"

    .line 68
    .line 69
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
