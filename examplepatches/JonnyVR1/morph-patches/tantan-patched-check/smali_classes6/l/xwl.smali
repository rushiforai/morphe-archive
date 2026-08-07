.class public abstract Ll/xwl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public final b:Ll/lzv;

.field public c:Ll/osh0;

.field public d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public f:J


# direct methods
.method public constructor <init>(Ll/osh0;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/xwl;->a:I

    .line 6
    .line 7
    new-instance v0, Ll/nzv;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/nzv;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/xwl;->b:Ll/lzv;

    .line 13
    .line 14
    iput-object p1, p0, Ll/xwl;->c:Ll/osh0;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/osh0;->n()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    const-string p1, ".txt"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p1, ".trace"

    .line 26
    .line 27
    :goto_0
    iput-object p1, p0, Ll/xwl;->e:Ljava/lang/String;

    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xwl;->d()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, "_"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Ll/xwl;->d:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    iput-wide v0, p0, Ll/xwl;->f:J

    .line 67
    .line 68
    return-void
.end method

.method public static synthetic a(Ll/xwl;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xwl;->e(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final b()Z
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/xwl;->f:J

    .line 6
    .line 7
    sub-long v2, v0, v2

    .line 8
    .line 9
    const-wide/16 v4, 0x2710

    .line 10
    .line 11
    cmp-long v2, v2, v4

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-ltz v2, :cond_0

    .line 15
    .line 16
    iput-wide v0, p0, Ll/xwl;->f:J

    .line 17
    .line 18
    new-instance v0, Ljava/io/File;

    .line 19
    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/msh0;->a()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/xwl;->d:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Ll/nki;->i(Ljava/io/File;)J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    invoke-static {}, Ll/msh0;->b()J

    .line 54
    .line 55
    .line 56
    move-result-wide v4

    .line 57
    cmp-long p0, v0, v4

    .line 58
    .line 59
    if-ltz p0, :cond_0

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_0
    return v3
.end method

.method public c(Ll/nyv;)Ll/nyv;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xwl;->c:Ll/osh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/osh0;->b()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/z0j0;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ll/z0j0;->a(Ll/nyv;)Ll/nyv;

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-object p1
.end method

.method public abstract d()Ljava/lang/String;
.end method

.method public final synthetic e(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xwl;->b:Ll/lzv;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Ll/xwl;->a:I

    .line 5
    .line 6
    iget-object v2, p0, Ll/xwl;->c:Ll/osh0;

    .line 7
    .line 8
    invoke-virtual {v2}, Ll/osh0;->j()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge v1, v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xwl;->b()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/xwl;->b:Ll/lzv;

    .line 24
    .line 25
    iget-object v2, p0, Ll/xwl;->d:Ljava/lang/String;

    .line 26
    .line 27
    invoke-interface {v1, v2}, Ll/lzv;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/nsh0;->h()V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Ll/xwl;->e:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, p0, Ll/xwl;->d:Ljava/lang/String;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    iput v1, p0, Ll/xwl;->a:I

    .line 58
    .line 59
    :cond_1
    iget-object v1, p0, Ll/xwl;->b:Ll/lzv;

    .line 60
    .line 61
    iget-object v2, p0, Ll/xwl;->d:Ljava/lang/String;

    .line 62
    .line 63
    invoke-interface {v1, v2, p1}, Ll/lzv;->write(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget p1, p0, Ll/xwl;->a:I

    .line 67
    .line 68
    add-int/lit8 p1, p1, 0x1

    .line 69
    .line 70
    iput p1, p0, Ll/xwl;->a:I

    .line 71
    .line 72
    monitor-exit v0

    .line 73
    return-void

    .line 74
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    throw p0
.end method

.method public f(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/wwl;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/wwl;-><init>(Ll/xwl;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/msh0;->f()Ljava/util/concurrent/ThreadPoolExecutor;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Ll/u21;->b(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Ll/msh0;->f()Ljava/util/concurrent/ThreadPoolExecutor;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
