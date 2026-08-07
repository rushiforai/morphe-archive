.class public Ll/flj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile b:Ll/flj;


# instance fields
.field private a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/flj;->a:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/flj;Ljava/lang/String;Ljava/lang/Exception;Ll/okj;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/flj;->k(Ljava/lang/String;Ljava/lang/Exception;Ll/okj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/flj;Ljava/lang/String;Ll/yjw;Ll/elj;ZLl/okj;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/flj;->j(Ljava/lang/String;Ll/yjw;Ll/elj;ZLl/okj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/flj;Ljava/io/File;Ll/elj;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/flj;->e(Ljava/io/File;Ll/elj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/flj;Ljava/lang/String;Ll/elj;Ljava/io/File;ZLl/okj;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/flj;->l(Ljava/lang/String;Ll/elj;Ljava/io/File;ZLl/okj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e(Ljava/io/File;Ll/elj;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/oiw;->e(Ljava/io/File;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p2, p2, Ll/elj;->d:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 15
    .line 16
    .line 17
    const-string p0, "check file md5 failed!"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static g()Ll/flj;
    .locals 2

    .line 1
    sget-object v0, Ll/flj;->b:Ll/flj;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/flj;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/flj;->b:Ll/flj;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/flj;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/flj;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/flj;->b:Ll/flj;

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
    sget-object v0, Ll/flj;->b:Ll/flj;

    .line 27
    .line 28
    return-object v0
.end method

.method private h(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/i8g0;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private j(Ljava/lang/String;Ll/yjw;Ll/elj;ZLl/okj;)V
    .locals 9

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    if-eqz p2, :cond_2

    .line 8
    .line 9
    if-nez p5, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/flj;->a:Ljava/util/List;

    .line 13
    .line 14
    iget-object v1, p3, Ll/elj;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-direct {p0, v1}, Ll/flj;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ll/yjw;->a()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    new-instance p0, Ljava/lang/NullPointerException;

    .line 34
    .line 35
    const-string p2, "savePath is null"

    .line 36
    .line 37
    invoke-direct {p0, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    invoke-interface {p5, p1, p2, p0}, Ll/okj;->b(Ljava/lang/String;ILjava/lang/Exception;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    new-instance v2, Ll/flj$b;

    .line 46
    .line 47
    move-object v3, p0

    .line 48
    move-object v6, p1

    .line 49
    move-object v5, p3

    .line 50
    move v7, p4

    .line 51
    move-object v8, p5

    .line 52
    invoke-direct/range {v2 .. v8}, Ll/flj$b;-><init>(Ll/flj;Ljava/lang/String;Ll/elj;Ljava/lang/String;ZLl/okj;)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x3

    .line 56
    invoke-static {p0, v2}, Lcom/hellogroup/common/thread/c;->d(ILjava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_0
    return-void
.end method

.method private k(Ljava/lang/String;Ljava/lang/Exception;Ll/okj;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/flj;->a:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-interface {p3, p1, p0, p2}, Ll/okj;->b(Ljava/lang/String;ILjava/lang/Exception;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method private l(Ljava/lang/String;Ll/elj;Ljava/io/File;ZLl/okj;)V
    .locals 8

    .line 1
    const-string p0, " failed."

    .line 2
    .line 3
    const-string v0, "unzip file "

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    iget-boolean v2, p2, Ll/elj;->f:Z

    .line 9
    .line 10
    if-eqz v2, :cond_1

    .line 11
    .line 12
    invoke-static {p1, p2}, Ll/glj;->a(Ljava/lang/String;Ll/elj;)Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-static {p1, p3, v3, v1, p5}, Ll/qyj0;->b(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;ZLl/okj;)Z

    .line 21
    .line 22
    .line 23
    move-result p5

    .line 24
    if-eqz p5, :cond_0

    .line 25
    .line 26
    move-object v4, p1

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    invoke-static {v2}, Lcom/hellogroup/common/file/FileUtil;->k(Ljava/io/File;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 32
    .line 33
    .line 34
    new-instance p1, Lcom/hellogroup/mk/core/offlinedownload/UnzipErrorException;

    .line 35
    .line 36
    new-instance p2, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-direct {p1, p0}, Lcom/hellogroup/mk/core/offlinedownload/UnzipErrorException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p1

    .line 55
    :cond_1
    if-nez p2, :cond_2

    .line 56
    .line 57
    const-string p5, ""

    .line 58
    .line 59
    :goto_0
    move-object v7, p5

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    iget-object p5, p2, Ll/elj;->a:Ljava/lang/String;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :goto_1
    invoke-static {}, Lcom/hellogroup/fep/base/core/FepManager;->z()Lcom/hellogroup/fep/base/core/FepManager;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    const-string v5, "custom"

    .line 73
    .line 74
    const-string v6, "9999999999"

    .line 75
    .line 76
    move-object v4, p1

    .line 77
    invoke-virtual/range {v2 .. v7}, Lcom/hellogroup/fep/base/core/FepManager;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_4

    .line 82
    .line 83
    :goto_2
    if-eqz p4, :cond_3

    .line 84
    .line 85
    invoke-static {v4, p2, v1}, Ll/glj;->i(Ljava/lang/String;Ll/elj;Z)V

    .line 86
    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_3
    invoke-static {v4, p2}, Ll/glj;->h(Ljava/lang/String;Ll/elj;)V

    .line 90
    .line 91
    .line 92
    :goto_3
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_4
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 97
    .line 98
    .line 99
    new-instance p1, Lcom/hellogroup/mk/core/offlinedownload/UnzipErrorException;

    .line 100
    .line 101
    new-instance p2, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-direct {p1, p0}, Lcom/hellogroup/mk/core/offlinedownload/UnzipErrorException;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    throw p1
.end method

.method private m(Ljava/lang/String;Ljava/lang/String;Ll/elj;ZZLl/okj;)V
    .locals 4

    .line 1
    iget-object v0, p3, Ll/elj;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p3, Ll/elj;->b:Ljava/lang/String;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :cond_0
    move-object p3, p1

    .line 15
    move-object p2, p6

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    sget-object v0, Ll/zjw;->INSTANCE:Ll/zjw;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/zjw;->c()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_2

    .line 24
    .line 25
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 26
    .line 27
    const-string p3, "downloader not initialized"

    .line 28
    .line 29
    invoke-direct {p2, p3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0, p1, p2, p6}, Ll/flj;->k(Ljava/lang/String;Ljava/lang/Exception;Ll/okj;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    iget-object v2, p3, Ll/elj;->b:Ljava/lang/String;

    .line 37
    .line 38
    invoke-direct {p0, v2}, Ll/flj;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v3, p0, Ll/flj;->a:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    new-instance v3, Ll/yjw;

    .line 48
    .line 49
    invoke-direct {v3}, Ll/yjw;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v2}, Ll/yjw;->h(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p3, Ll/elj;->b:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v3, v2}, Ll/yjw;->g(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3, v1}, Ll/yjw;->f(Z)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3, p2}, Ll/yjw;->e(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3, p5}, Ll/yjw;->d(Z)V

    .line 67
    .line 68
    .line 69
    move p5, p4

    .line 70
    move-object p4, p3

    .line 71
    move-object p3, p1

    .line 72
    move-object p1, p0

    .line 73
    new-instance p0, Ll/flj$a;

    .line 74
    .line 75
    move-object p2, p6

    .line 76
    invoke-direct/range {p0 .. p5}, Ll/flj$a;-><init>(Ll/flj;Ll/okj;Ljava/lang/String;Ll/elj;Z)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v3, v1, p0}, Ll/zjw;->a(Ll/yjw;ZLl/mxl$a;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :goto_0
    if-eqz p2, :cond_3

    .line 84
    .line 85
    new-instance p0, Ljava/lang/NullPointerException;

    .line 86
    .line 87
    const-string p1, "url is null"

    .line 88
    .line 89
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-interface {p2, p3, v1, p0}, Ll/okj;->b(Ljava/lang/String;ILjava/lang/Exception;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    return-void
.end method


# virtual methods
.method public f(Ljava/lang/String;Ll/elj;ZZLl/okj;)V
    .locals 8

    .line 1
    const/4 v2, 0x0

    .line 2
    if-eqz p2, :cond_6

    .line 3
    .line 4
    invoke-virtual {p2}, Ll/elj;->a()Z

    .line 5
    .line 6
    .line 7
    move-result v4

    .line 8
    if-nez v4, :cond_0

    .line 9
    .line 10
    goto/16 :goto_1

    .line 11
    .line 12
    :cond_0
    iget-boolean v4, p2, Ll/elj;->f:Z

    .line 13
    .line 14
    if-eqz v4, :cond_1

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {p1, p2, v4}, Ll/glj;->b(Ljava/lang/String;Ll/elj;Ljava/lang/String;)Ljava/io/File;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-static {}, Lcom/hellogroup/fep/base/core/FepManager;->z()Lcom/hellogroup/fep/base/core/FepManager;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    const-string v5, "custom"

    .line 27
    .line 28
    invoke-virtual {v4, p1, v5}, Lcom/hellogroup/fep/base/core/FepManager;->q(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    :goto_0
    if-eqz v4, :cond_2

    .line 33
    .line 34
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    if-nez v5, :cond_2

    .line 39
    .line 40
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object v5, p2, Ll/elj;->b:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v5}, Ll/glj;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    if-eqz v7, :cond_3

    .line 54
    .line 55
    if-eqz p5, :cond_7

    .line 56
    .line 57
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 58
    .line 59
    new-instance v4, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v5, "cannot get name by url: "

    .line 62
    .line 63
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v3, p2, Ll/elj;->b:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-interface {p5, p1, v2, v0}, Ll/okj;->b(Ljava/lang/String;ILjava/lang/Exception;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    iget-object v7, p2, Ll/elj;->b:Ljava/lang/String;

    .line 83
    .line 84
    invoke-direct {p0, v7}, Ll/flj;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    invoke-virtual {p0, v7}, Ll/flj;->i(Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    if-eqz v7, :cond_4

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_4
    new-instance v7, Ljava/io/File;

    .line 96
    .line 97
    invoke-direct {v7, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 101
    .line 102
    .line 103
    if-eqz p3, :cond_5

    .line 104
    .line 105
    invoke-static {p1, p2, v2}, Ll/glj;->i(Ljava/lang/String;Ll/elj;Z)V

    .line 106
    .line 107
    .line 108
    :cond_5
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    move-object v0, p0

    .line 113
    move-object v1, p1

    .line 114
    move-object v3, p2

    .line 115
    move v4, p3

    .line 116
    move v5, p4

    .line 117
    move-object v6, p5

    .line 118
    invoke-direct/range {v0 .. v6}, Ll/flj;->m(Ljava/lang/String;Ljava/lang/String;Ll/elj;ZZLl/okj;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_6
    :goto_1
    if-eqz p5, :cond_7

    .line 123
    .line 124
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 125
    .line 126
    const-string v3, "resource is null or not valid"

    .line 127
    .line 128
    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-interface {p5, p1, v2, v0}, Ll/okj;->b(Ljava/lang/String;ILjava/lang/Exception;)V

    .line 132
    .line 133
    .line 134
    :cond_7
    :goto_2
    return-void
.end method

.method public i(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    sget-object p0, Ll/zjw;->INSTANCE:Ll/zjw;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/zjw;->d(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
