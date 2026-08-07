.class public Ll/syv;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static f:Z

.field public static g:Z


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:J

.field public d:J

.field public e:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "c++_shared"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "marsxlog"

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    sput-boolean v0, Ll/syv;->g:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    return-void

    .line 15
    :catchall_0
    const/4 v0, 0x0

    .line 16
    sput-boolean v0, Ll/syv;->g:Z

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/cjk0;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/syv;->b:Z

    .line 6
    .line 7
    const-wide/16 v0, 0x7

    .line 8
    .line 9
    iput-wide v0, p0, Ll/syv;->d:J

    .line 10
    .line 11
    new-instance p1, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/syv;->e:Landroid/os/Handler;

    .line 21
    .line 22
    invoke-virtual {p2}, Ll/cjk0;->g()Ll/qyv;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p2, p1, Ll/qyv;->b:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p2, p0, Ll/syv;->a:Ljava/lang/String;

    .line 29
    .line 30
    new-instance p2, Ljava/util/Date;

    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    invoke-direct {p2, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 37
    .line 38
    .line 39
    invoke-static {p2}, Ll/p8c;->a(Ljava/util/Date;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    iget-object v1, p1, Ll/qyv;->b:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    iget-wide v0, p1, Ll/qyv;->d:J

    .line 66
    .line 67
    iput-wide v0, p0, Ll/syv;->d:J

    .line 68
    .line 69
    sget-boolean p2, Ll/syv;->g:Z

    .line 70
    .line 71
    if-nez p2, :cond_0

    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    invoke-static {}, Ll/du2;->u()Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    const/4 v0, 0x1

    .line 79
    if-eqz p2, :cond_1

    .line 80
    .line 81
    move v2, v0

    .line 82
    goto :goto_0

    .line 83
    :cond_1
    const/4 p2, 0x2

    .line 84
    move v2, p2

    .line 85
    :goto_0
    iget-object v4, p1, Ll/qyv;->a:Ljava/lang/String;

    .line 86
    .line 87
    const/4 v7, 0x0

    .line 88
    iget-object v8, p1, Ll/qyv;->c:Ljava/lang/String;

    .line 89
    .line 90
    const/4 v3, 0x0

    .line 91
    const-string v6, "log"

    .line 92
    .line 93
    invoke-static/range {v2 .. v8}, Lcom/tencent/mars/xlog/Xlog;->appenderOpen(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Ll/du2;->u()Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    invoke-static {p2}, Lcom/tencent/mars/xlog/Xlog;->setConsoleLogOpen(Z)V

    .line 101
    .line 102
    .line 103
    iget-wide p1, p1, Ll/qyv;->e:J

    .line 104
    .line 105
    invoke-static {p1, p2}, Lcom/tencent/mars/xlog/Xlog;->setMaxFileSize(J)V

    .line 106
    .line 107
    .line 108
    new-instance p1, Lcom/tencent/mars/xlog/Xlog;

    .line 109
    .line 110
    invoke-direct {p1}, Lcom/tencent/mars/xlog/Xlog;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {p1}, Lcom/tencent/mars/xlog/Log;->setLogImp(Lcom/tencent/mars/xlog/Log$LogImp;)V

    .line 114
    .line 115
    .line 116
    new-instance p1, Ll/syv$a;

    .line 117
    .line 118
    invoke-direct {p1, p0}, Ll/syv$a;-><init>(Ll/syv;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, p1}, Ll/syv;->h(Ljava/lang/Runnable;)V

    .line 122
    .line 123
    .line 124
    sput-boolean v0, Ll/syv;->f:Z

    .line 125
    .line 126
    return-void
.end method

.method public static synthetic a(Ll/syv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/syv;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/syv;Ljava/lang/String;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/syv;->k(Ljava/lang/String;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Ll/syv;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/syv;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/syv;Ll/b3k0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/syv;->p(Ll/b3k0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/syv;Ll/b3k0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/syv;->o(Ll/b3k0;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/syv;Ll/b3k0;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/syv;->n(Ll/b3k0;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final g()V
    .locals 9

    .line 1
    invoke-static {}, Ll/p8c;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/syv;->d:J

    .line 6
    .line 7
    const-wide/32 v4, 0x5265c00

    .line 8
    .line 9
    .line 10
    mul-long/2addr v2, v4

    .line 11
    sub-long/2addr v0, v2

    .line 12
    new-instance v2, Ljava/io/File;

    .line 13
    .line 14
    iget-object p0, p0, Ll/syv;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    array-length v2, p0

    .line 32
    if-nez v2, :cond_0

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    array-length v2, p0

    .line 36
    const/4 v3, 0x0

    .line 37
    :goto_0
    if-ge v3, v2, :cond_2

    .line 38
    .line 39
    aget-object v4, p0, v3

    .line 40
    .line 41
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-static {v5}, Ll/p8c;->h(Ljava/lang/String;)J

    .line 46
    .line 47
    .line 48
    move-result-wide v5

    .line 49
    const-wide/16 v7, 0x0

    .line 50
    .line 51
    cmp-long v7, v5, v7

    .line 52
    .line 53
    if-eqz v7, :cond_1

    .line 54
    .line 55
    cmp-long v5, v5, v0

    .line 56
    .line 57
    if-gtz v5, :cond_1

    .line 58
    .line 59
    invoke-static {v4}, Ll/nki;->f(Ljava/io/File;)Z

    .line 60
    .line 61
    .line 62
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    :goto_1
    return-void
.end method

.method public final h(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/u21;->b(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    sget-boolean p0, Ll/syv;->f:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 p0, 0x1

    .line 7
    invoke-static {p0}, Lcom/tencent/mars/xlog/Log;->appenderFlush(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public j()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Date;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object p0, p0, Ll/syv;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    return-object v1

    .line 23
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    return-object v1

    .line 30
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    array-length v1, p0

    .line 36
    const/4 v2, 0x0

    .line 37
    :goto_0
    if-ge v2, v1, :cond_4

    .line 38
    .line 39
    aget-object v3, p0, v2

    .line 40
    .line 41
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-static {v3}, Ll/p8c;->b(Ljava/lang/String;)Ljava/util/Date;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    if-eqz v3, :cond_3

    .line 50
    .line 51
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_4
    return-object v0
.end method

.method public final k(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Ll/syv;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/syv$f;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/syv$f;-><init>(Ll/syv;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/nki;->h(Ljava/io/File;Ljava/io/FilenameFilter;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public l(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-boolean v0, Ll/syv;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-wide v2, p0, Ll/syv;->c:J

    .line 11
    .line 12
    sub-long/2addr v0, v2

    .line 13
    const-wide/32 v2, 0xea60

    .line 14
    .line 15
    .line 16
    cmp-long v0, v0, v2

    .line 17
    .line 18
    if-lez v0, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Ll/syv;->c:J

    .line 25
    .line 26
    iget-object v0, p0, Ll/syv;->a:Ljava/lang/String;

    .line 27
    .line 28
    const-wide/32 v1, 0x3200000

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1, v2}, Ll/nki;->j(Ljava/lang/String;J)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput-boolean v0, p0, Ll/syv;->b:Z

    .line 36
    .line 37
    :cond_1
    iget-boolean p0, p0, Ll/syv;->b:Z

    .line 38
    .line 39
    if-nez p0, :cond_2

    .line 40
    .line 41
    :goto_0
    return-void

    .line 42
    :cond_2
    invoke-static {p1, p2}, Lcom/tencent/mars/xlog/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public m(Ljava/util/Date;Ljava/lang/String;JLl/b3k0;)V
    .locals 8
    .param p5    # Ll/b3k0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-boolean v0, Ll/syv;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p5}, Ll/syv;->p(Ll/b3k0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    new-instance v1, Ll/syv$b;

    .line 12
    .line 13
    move-object v2, p0

    .line 14
    move-object v3, p1

    .line 15
    move-object v5, p2

    .line 16
    move-wide v6, p3

    .line 17
    move-object v4, p5

    .line 18
    invoke-direct/range {v1 .. v7}, Ll/syv$b;-><init>(Ll/syv;Ljava/util/Date;Ll/b3k0;Ljava/lang/String;J)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ll/syv;->h(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final n(Ll/b3k0;II)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/syv;->e:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/syv$c;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2, p3}, Ll/syv$c;-><init>(Ll/syv;Ll/b3k0;II)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final o(Ll/b3k0;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/syv;->e:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/syv$e;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/syv$e;-><init>(Ll/syv;Ll/b3k0;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final p(Ll/b3k0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/syv;->e:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/syv$d;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/syv$d;-><init>(Ll/syv;Ll/b3k0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
