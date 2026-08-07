.class public Ll/dr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gp;
.implements Ll/ep;
.implements Landroid/view/SurfaceHolder$Callback;
.implements Ll/ypl$f;


# static fields
.field public static z:D


# instance fields
.field public a:J

.field public b:I

.field public c:Ll/l0m;

.field public d:Landroid/app/Activity;

.field public e:Ll/qow;

.field public f:Landroid/view/SurfaceHolder;

.field public g:Z

.field public h:Z

.field public i:I

.field public j:I

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Ll/dp;

.field public q:Z

.field public r:Z

.field public s:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

.field public t:[F

.field public u:Z

.field public v:Z

.field public w:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation
.end field

.field public y:Ll/lpw;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/dr;->b:I

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/dr;->g:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/dr;->h:Z

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, p0, Ll/dr;->q:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/dr;->r:Z

    .line 15
    .line 16
    iput-boolean v1, p0, Ll/dr;->u:Z

    .line 17
    .line 18
    new-instance v0, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/dr;->w:Ljava/util/HashMap;

    .line 24
    .line 25
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/dr;->x:Ljava/util/List;

    .line 31
    .line 32
    new-instance v0, Ll/dr$a;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/dr$a;-><init>(Ll/dr;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/dr;->y:Ll/lpw;

    .line 38
    .line 39
    invoke-static {}, Ll/hu;->a()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput-boolean v0, p0, Ll/dr;->k:Z

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/dr;->Y()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static bridge synthetic A(Ll/dr;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dr;->n:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic B(Ll/dr;)Ll/dp;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dr;->p:Ll/dp;

    return-object p0
.end method

.method private U()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/dr;->c0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/dr;->p:Ll/dp;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {p0, v0, v1}, Ll/dp;->s(FI)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static Z()Ljava/lang/String;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "photo"

    .line 3
    .line 4
    const-string v2, "temp"

    .line 5
    .line 6
    invoke-static {v1, v2}, Ll/yj;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    goto :goto_0

    .line 11
    :catch_0
    move-exception v1

    .line 12
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->getInstance()Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2, v1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->e(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    move-object v1, v0

    .line 23
    :goto_0
    if-nez v1, :cond_0

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 27
    .line 28
    const-string v2, ".nomedia"

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catch_1
    move-exception v0

    .line 44
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->getInstance()Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2, v0}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->e(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 55
    .line 56
    const-string v2, "yyyy-MM-dd_HH-mm-ss"

    .line 57
    .line 58
    invoke-direct {v0, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    new-instance v2, Ljava/util/Date;

    .line 62
    .line 63
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v2, Ljava/io/File;

    .line 71
    .line 72
    new-instance v3, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v4, ".png_"

    .line 81
    .line 82
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    const/4 v3, 0x0

    .line 93
    :goto_2
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    if-eqz v5, :cond_2

    .line 98
    .line 99
    add-int/lit8 v3, v3, 0x1

    .line 100
    .line 101
    new-instance v2, Ljava/io/File;

    .line 102
    .line 103
    new-instance v5, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v6, "_"

    .line 112
    .line 113
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    invoke-direct {v2, v1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    return-object v0
.end method

.method public static synthetic a(Ll/dr;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dr;->e0(II)V

    return-void
.end method

.method public static a0()Ljava/lang/String;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "moment"

    .line 3
    .line 4
    const-string v2, "temp"

    .line 5
    .line 6
    invoke-static {v1, v2}, Ll/yj;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    goto :goto_0

    .line 11
    :catch_0
    move-exception v1

    .line 12
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->getInstance()Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2, v1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->e(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    move-object v1, v0

    .line 23
    :goto_0
    if-nez v1, :cond_0

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 27
    .line 28
    const-string v2, ".nomedia"

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catch_1
    move-exception v0

    .line 44
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->getInstance()Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2, v0}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->e(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_1
    new-instance v0, Ljava/io/File;

    .line 55
    .line 56
    new-instance v2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 62
    .line 63
    .line 64
    move-result-wide v3

    .line 65
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v3, ".mp4"

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    return-object v0
.end method

.method public static synthetic b(Ll/dr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dr;->f0()V

    return-void
.end method

.method public static synthetic c(Ll/dr;Ljava/lang/String;ILjava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/dr;->k0(Ljava/lang/String;ILjava/lang/Exception;)V

    return-void
.end method

.method private c0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Ll/dr;->n(Ll/y20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic d(Ll/dr;Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dr;->j0(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method

.method private synthetic e0(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/dr;->p:Ll/dp;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Ll/gp$a;->onError(II)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic f0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/dr;->p:Ll/dp;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/fp;->onFirstFrameRendered()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic g0()V
    .locals 1

    .line 1
    new-instance v0, Ll/br;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/br;-><init>(Ll/dr;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic h0(Ll/y20;Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->x:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/dr;->x:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Ll/dr;->c:Ll/l0m;

    .line 12
    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/dr;->x:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private synthetic i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/dp;->m()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/dr;->p:Ll/dp;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-interface {p0, v0, v1}, Ll/dp;->s(FI)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private synthetic j0(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/dr;->m:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/dr;->p:Ll/dp;

    .line 13
    .line 14
    invoke-interface {p0, p1, p2}, Ll/fp;->q(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic k(Ll/dr;Ll/y20;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dr;->h0(Ll/y20;Ljava/util/List;)V

    return-void
.end method

.method private synthetic k0(Ljava/lang/String;ILjava/lang/Exception;)V
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    new-instance p2, Ljava/io/File;

    .line 4
    .line 5
    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    new-instance p3, Ljava/io/FileNotFoundException;

    .line 15
    .line 16
    invoke-direct {p3}, Ljava/io/FileNotFoundException;-><init>()V

    .line 17
    .line 18
    .line 19
    :cond_0
    new-instance p2, Ll/cr;

    .line 20
    .line 21
    invoke-direct {p2, p0, p1, p3}, Ll/cr;-><init>(Ll/dr;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic l(Ll/dr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dr;->i0()V

    return-void
.end method

.method private static m0()V
    .locals 4

    .line 1
    sget-wide v0, Ll/dr;->z:D

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmpl-double v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->a:Landroid/app/Application;

    .line 11
    .line 12
    const-string v1, "activity"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/app/ActivityManager;

    .line 19
    .line 20
    new-instance v1, Landroid/app/ActivityManager$MemoryInfo;

    .line 21
    .line 22
    invoke-direct {v1}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-wide v0, v1, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    .line 35
    .line 36
    long-to-double v0, v0

    .line 37
    const-wide/high16 v2, 0x4090000000000000L    # 1024.0

    .line 38
    .line 39
    div-double/2addr v0, v2

    .line 40
    div-double/2addr v0, v2

    .line 41
    div-double/2addr v0, v2

    .line 42
    sput-wide v0, Ll/dr;->z:D

    .line 43
    .line 44
    return-void
.end method

.method private n0(Ll/crf0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dr;->d:Landroid/app/Activity;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const v2, 0x3fe38e39

    .line 5
    .line 6
    .line 7
    invoke-static {v0, p1, v1, v2}, Ll/vc4;->f(Landroid/content/Context;Ll/crf0;IF)Ll/crf0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object p1, v0

    .line 15
    :goto_0
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/16 v1, 0x500

    .line 20
    .line 21
    if-lt v0, v1, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/dr;->e:Ll/qow;

    .line 24
    .line 25
    const/high16 v1, 0x800000

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/qow;->U(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/16 v1, 0x3c0

    .line 36
    .line 37
    if-lt v0, v1, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Ll/dr;->e:Ll/qow;

    .line 40
    .line 41
    const/high16 v1, 0x700000

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ll/qow;->U(I)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/16 v1, 0x280

    .line 52
    .line 53
    if-lt v0, v1, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Ll/dr;->e:Ll/qow;

    .line 56
    .line 57
    const/high16 v1, 0x600000

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ll/qow;->U(I)V

    .line 60
    .line 61
    .line 62
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/dr;->e:Ll/qow;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/qow;->R(Ll/crf0;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private o0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/dr;->n:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v0, p0}, Ll/l0m;->H(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-static {}, Ll/dr;->a0()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/dr;->n:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const-string v0, "\u6ca1\u6709\u627e\u5230SD\u5361\uff0c\u65e0\u6cd5\u5f55\u5236\u89c6\u9891"

    .line 33
    .line 34
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 46
    .line 47
    iget-object p0, p0, Ll/dr;->n:Ljava/lang/String;

    .line 48
    .line 49
    invoke-interface {v0, p0}, Ll/l0m;->H(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_3
    :goto_0
    return-void
.end method

.method public static synthetic q(Ll/dr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dr;->g0()V

    return-void
.end method


# virtual methods
.method public C(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/m0m;->Q(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public E(IIII)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/dr;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_4

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Ll/dr;->m:Z

    .line 16
    .line 17
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-interface {v0}, Ll/fp;->j()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    :goto_0
    invoke-virtual {p0, v0}, Ll/dr;->r(I)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/dr;->Z()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Ll/dr;->o:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    iget-object p1, p0, Ll/dr;->p:Ll/dp;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    iget-object p0, p0, Ll/dr;->p:Ll/dp;

    .line 51
    .line 52
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 53
    .line 54
    const-string p2, "\u6ca1\u6709\u627e\u5230SD\u5361\uff0c\u65e0\u6cd5\u62cd\u7167"

    .line 55
    .line 56
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const/4 p2, 0x0

    .line 60
    invoke-interface {p0, p2, p1}, Ll/fp;->q(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    :goto_1
    return-void

    .line 64
    :cond_3
    iget-object v1, p0, Ll/dr;->o:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 67
    .line 68
    new-instance v6, Ll/wq;

    .line 69
    .line 70
    invoke-direct {v6, p0, v1}, Ll/wq;-><init>(Ll/dr;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    move v2, p1

    .line 74
    move v3, p2

    .line 75
    move v4, p3

    .line 76
    move v5, p4

    .line 77
    invoke-interface/range {v0 .. v6}, Ll/n0m;->G(Ljava/lang/String;IIIILl/qpw;)V

    .line 78
    .line 79
    .line 80
    :cond_4
    const-string p0, "e_camera_take_button"

    .line 81
    .line 82
    const-string p1, "p_camera"

    .line 83
    .line 84
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/l0m;->j()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public G()V
    .locals 0

    .line 1
    return-void
.end method

.method public H()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/dr;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public I(Z)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0, v0}, Ll/dr;->r(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3
    .line 4
    .line 5
    goto :goto_0

    .line 6
    :catch_0
    move-exception v1

    .line 7
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    :goto_0
    iget-object v1, p0, Ll/dr;->c:Ll/l0m;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Ll/dr;->c:Ll/l0m;

    .line 19
    .line 20
    invoke-interface {v1}, Ll/l0m;->s()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v1, p0, Ll/dr;->p:Ll/dp;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Ll/dr;->p:Ll/dp;

    .line 32
    .line 33
    invoke-interface {v1}, Ll/fp;->b()J

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    iget-boolean v3, p0, Ll/dr;->l:Z

    .line 38
    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    const-wide/16 v3, 0x0

    .line 44
    .line 45
    cmp-long p1, v1, v3

    .line 46
    .line 47
    if-lez p1, :cond_2

    .line 48
    .line 49
    const-wide/16 v3, 0x3e8

    .line 50
    .line 51
    cmp-long p1, v1, v3

    .line 52
    .line 53
    if-gez p1, :cond_2

    .line 54
    .line 55
    iget-object p1, p0, Ll/dr;->p:Ll/dp;

    .line 56
    .line 57
    invoke-interface {p1}, Ll/fp;->removeLast()V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/dr;->c:Ll/l0m;

    .line 61
    .line 62
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_1

    .line 67
    .line 68
    iget-object p1, p0, Ll/dr;->c:Ll/l0m;

    .line 69
    .line 70
    invoke-interface {p1}, Ll/l0m;->L()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iget-object v1, p0, Ll/dr;->p:Ll/dp;

    .line 75
    .line 76
    invoke-interface {v1}, Ll/fp;->getCount()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-le p1, v1, :cond_1

    .line 81
    .line 82
    iget-object p1, p0, Ll/dr;->c:Ll/l0m;

    .line 83
    .line 84
    invoke-interface {p1}, Ll/l0m;->removeLast()V

    .line 85
    .line 86
    .line 87
    :cond_1
    move p1, v0

    .line 88
    goto :goto_1

    .line 89
    :cond_2
    const/4 p1, 0x1

    .line 90
    :goto_1
    iget-object v1, p0, Ll/dr;->c:Ll/l0m;

    .line 91
    .line 92
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_3

    .line 97
    .line 98
    iget-object v1, p0, Ll/dr;->p:Ll/dp;

    .line 99
    .line 100
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-eqz v1, :cond_3

    .line 105
    .line 106
    iget-object v1, p0, Ll/dr;->p:Ll/dp;

    .line 107
    .line 108
    invoke-interface {v1}, Ll/fp;->getCount()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-gtz v1, :cond_3

    .line 113
    .line 114
    iget-object v1, p0, Ll/dr;->p:Ll/dp;

    .line 115
    .line 116
    invoke-interface {v1}, Ll/fp;->e()V

    .line 117
    .line 118
    .line 119
    :cond_3
    iput-boolean v0, p0, Ll/dr;->l:Z

    .line 120
    .line 121
    return p1
.end method

.method public J(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p0, p1, v0}, Ll/n0m;->k(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public K()Ll/qow;
    .locals 9

    .line 1
    invoke-static {}, Ll/dr;->m0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dr;->e:Ll/qow;

    .line 5
    .line 6
    if-nez v0, :cond_6

    .line 7
    .line 8
    iget v0, p0, Ll/dr;->i:I

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/bnl0;->y0()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Ll/dr;->i:I

    .line 17
    .line 18
    invoke-static {}, Ll/bnl0;->w0()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/dr;->j:I

    .line 23
    .line 24
    :cond_0
    iget-boolean v0, p0, Ll/dr;->k:Z

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    const/4 v2, 0x1

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-boolean v0, p0, Ll/dr;->v:Z

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    move v0, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v0, v1

    .line 37
    :goto_0
    invoke-static {}, Ll/qow;->A()Ll/qow;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iput-object v3, p0, Ll/dr;->e:Ll/qow;

    .line 42
    .line 43
    new-instance v4, Ll/crf0;

    .line 44
    .line 45
    iget v5, p0, Ll/dr;->i:I

    .line 46
    .line 47
    iget v6, p0, Ll/dr;->j:I

    .line 48
    .line 49
    invoke-direct {v4, v5, v6}, Ll/crf0;-><init>(II)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ll/qow;->X(Ll/crf0;)V

    .line 53
    .line 54
    .line 55
    iget-object v3, p0, Ll/dr;->e:Ll/qow;

    .line 56
    .line 57
    invoke-virtual {v3, v0}, Ll/qow;->E(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/dr;->e:Ll/qow;

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Ll/qow;->T(Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/dr;->e:Ll/qow;

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Ll/qow;->C(I)V

    .line 68
    .line 69
    .line 70
    const/16 v0, 0x1e

    .line 71
    .line 72
    iget-object v2, p0, Ll/dr;->e:Ll/qow;

    .line 73
    .line 74
    invoke-virtual {v2, v0}, Ll/qow;->V(I)V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Ll/bnl0;->y0()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    const/16 v2, 0x2d0

    .line 82
    .line 83
    if-gt v0, v2, :cond_2

    .line 84
    .line 85
    const/4 v1, 0x2

    .line 86
    :cond_2
    invoke-static {}, Ll/bnl0;->y0()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    const/4 v3, 0x3

    .line 91
    const/16 v4, 0x438

    .line 92
    .line 93
    if-lt v0, v4, :cond_3

    .line 94
    .line 95
    sget-wide v5, Ll/dr;->z:D

    .line 96
    .line 97
    const-wide/high16 v7, 0x4014000000000000L    # 5.0

    .line 98
    .line 99
    cmpl-double v0, v5, v7

    .line 100
    .line 101
    if-ltz v0, :cond_3

    .line 102
    .line 103
    move v1, v3

    .line 104
    :cond_3
    if-eqz v1, :cond_5

    .line 105
    .line 106
    if-eq v1, v3, :cond_4

    .line 107
    .line 108
    new-instance v0, Ll/crf0;

    .line 109
    .line 110
    const/16 v1, 0x280

    .line 111
    .line 112
    const/16 v2, 0x1e0

    .line 113
    .line 114
    invoke-direct {v0, v1, v2}, Ll/crf0;-><init>(II)V

    .line 115
    .line 116
    .line 117
    invoke-direct {p0, v0}, Ll/dr;->n0(Ll/crf0;)V

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_4
    new-instance v0, Ll/crf0;

    .line 122
    .line 123
    const/16 v1, 0x780

    .line 124
    .line 125
    invoke-direct {v0, v1, v4}, Ll/crf0;-><init>(II)V

    .line 126
    .line 127
    .line 128
    invoke-direct {p0, v0}, Ll/dr;->n0(Ll/crf0;)V

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_5
    new-instance v0, Ll/crf0;

    .line 133
    .line 134
    const/16 v1, 0x500

    .line 135
    .line 136
    invoke-direct {v0, v1, v2}, Ll/crf0;-><init>(II)V

    .line 137
    .line 138
    .line 139
    invoke-direct {p0, v0}, Ll/dr;->n0(Ll/crf0;)V

    .line 140
    .line 141
    .line 142
    :cond_6
    :goto_1
    iget-object p0, p0, Ll/dr;->e:Ll/qow;

    .line 143
    .line 144
    return-object p0
.end method

.method public L([F)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/dr;->q:Z

    .line 11
    .line 12
    iget-object v1, p0, Ll/dr;->c:Ll/l0m;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    aget v2, p1, v2

    .line 16
    .line 17
    invoke-interface {v1, v2}, Ll/m0m;->J(F)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 21
    .line 22
    aget p1, p1, v0

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ll/m0m;->O(F)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public M(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 15
    .line 16
    invoke-interface {p0, p2}, Ll/m0m;->u(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-object v0, p0, Ll/dr;->w:Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v1, p0, Ll/dr;->w:Ljava/util/HashMap;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 34
    .line 35
    invoke-interface {p0, p2}, Ll/m0m;->u(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    iget-object v0, p0, Ll/dr;->w:Ljava/util/HashMap;

    .line 52
    .line 53
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 57
    .line 58
    invoke-interface {p0, p2}, Ll/m0m;->u(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    :goto_0
    return-void
.end method

.method public N(Ljava/io/File;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/dr;->W()V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Ll/dr;->u:Z

    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method public O()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-interface {v0}, Ll/l0m;->L()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/fp;->u()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 22
    .line 23
    iget-object v1, p0, Ll/dr;->y:Ll/lpw;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ll/l0m;->P(Ll/lpw;)Z

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Ll/dr;->p:Ll/dp;

    .line 37
    .line 38
    invoke-interface {p0}, Ll/fp;->l()V

    .line 39
    .line 40
    .line 41
    :cond_2
    :goto_0
    return-void

    .line 42
    :cond_3
    :goto_1
    const-string p0, "\u8bf7\u5f55\u5236\u89c6\u9891"

    .line 43
    .line 44
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public P(I)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dr;->x:Ljava/util/List;

    .line 2
    .line 3
    if-ltz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ge p1, v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMFilter;->mFilterName:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public Q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/dr;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public R(I)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dr;->x:Ljava/util/List;

    .line 2
    .line 3
    if-ltz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ge p1, v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public S(IIZFFF)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/dr;->x:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    if-ltz p2, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/dr;->x:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-ge p2, p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/dr;->c:Ll/l0m;

    .line 28
    .line 29
    iget-object p0, p0, Ll/dr;->x:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->lookupUrl:Ljava/lang/String;

    .line 38
    .line 39
    const/4 p2, 0x0

    .line 40
    invoke-interface {p1, p0, p2}, Ll/o0m;->y(Ljava/lang/String;F)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public T(Landroid/app/Activity;Ll/fp;)V
    .locals 1

    .line 1
    invoke-interface {p2}, Ll/fp;->d()Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/dr;->d:Landroid/app/Activity;

    .line 9
    .line 10
    check-cast p2, Ll/dp;

    .line 11
    .line 12
    iput-object p2, p0, Ll/dr;->p:Ll/dp;

    .line 13
    .line 14
    invoke-static {p0}, Ll/qe20;->a(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public V(Landroid/hardware/Camera;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "\u76f8\u673a\u6253\u5f00\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7cfb\u7edf\u76f8\u673a\u662f\u5426\u53ef\u7528"

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public W()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/o0m;->F()Ll/m4m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/m4m;->B()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/n0m;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public Y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/be00;->a()Ll/l0m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 10
    .line 11
    new-instance v1, Ll/dr$b;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/dr$b;-><init>(Ll/dr;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ll/o0m;->B(Ll/c5g0$a;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-interface {v0, v1}, Ll/o0m;->N(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 26
    .line 27
    const v1, 0x3f19999a    # 0.6f

    .line 28
    .line 29
    .line 30
    invoke-interface {v0, v1}, Ll/m0m;->q(F)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 34
    .line 35
    const/high16 v1, 0x3f000000    # 0.5f

    .line 36
    .line 37
    invoke-interface {v0, v1}, Ll/m0m;->v(F)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 41
    .line 42
    invoke-interface {v0, p0}, Ll/n0m;->l(Ll/ypl$f;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 46
    .line 47
    new-instance v1, Ll/xq;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/xq;-><init>(Ll/dr;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {v0, v1}, Ll/n0m;->z(Ll/bpw;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 56
    .line 57
    new-instance v1, Ll/yq;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/yq;-><init>(Ll/dr;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v0, v1}, Ll/n0m;->D(Ll/epw;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public b0()Ll/vow;
    .locals 1

    .line 1
    new-instance v0, Ll/vow$b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dr;->e:Ll/qow;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/vow$b;-><init>(Ll/qow;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ll/vow$b;->i()Ll/vow;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public d0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/eo;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/n0m;->e()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public f()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/dr;->a:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x3e8

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-lez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/dr;->e()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    iget-boolean v1, p0, Ll/dr;->k:Z

    .line 29
    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    const-string p0, "\u6b64\u624b\u673a\u4e0d\u652f\u6301\u524d\u7f6e\u6444\u50cf\u5934"

    .line 33
    .line 34
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-interface {v0}, Ll/n0m;->f()V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/zq;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/zq;-><init>(Ll/dr;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    iput-wide v0, p0, Ll/dr;->a:J

    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/dr;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-direct {p0}, Ll/dr;->o0()V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Ll/dr;->h:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    :goto_0
    return-void

    .line 14
    :cond_1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 15
    .line 16
    iget-object v1, p0, Ll/dr;->f:Landroid/view/SurfaceHolder;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ll/n0m;->w(Landroid/view/SurfaceHolder;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/n0m;->g()V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Ll/dr;->U()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/dr;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    iget-object v1, p0, Ll/dr;->n:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object p0, p0, Ll/dr;->p:Ll/dp;

    .line 20
    .line 21
    const/16 v0, -0x194

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-interface {p0, v0, v1}, Ll/gp$a;->onError(II)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    iget-object v1, p0, Ll/dr;->n:Ljava/lang/String;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ll/l0m;->H(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/dr;->p:Ll/dp;

    .line 40
    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    const/4 v1, -0x1

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-interface {v1}, Ll/fp;->j()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    :goto_0
    invoke-virtual {p0, v1}, Ll/dr;->r(I)V

    .line 50
    .line 51
    .line 52
    invoke-interface {v0}, Ll/l0m;->i()V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    iput-boolean v0, p0, Ll/dr;->l:Z

    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/dr;->l:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/l0m;->j()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/l0m;->removeLast()V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Ll/dr;->l:Z

    .line 25
    .line 26
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/fp;->removeLast()V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 56
    .line 57
    invoke-interface {v0}, Ll/fp;->getCount()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-gtz v0, :cond_3

    .line 62
    .line 63
    iget-object p0, p0, Ll/dr;->p:Ll/dp;

    .line 64
    .line 65
    invoke-interface {p0}, Ll/fp;->e()V

    .line 66
    .line 67
    .line 68
    :cond_3
    return-void
.end method

.method public l0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public m()Z
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/n0m;->m()Z

    .line 12
    .line 13
    .line 14
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    return p0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public n(Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dr;->x:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-static {}, Ll/vo;->j()Ll/vo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/vo;->o()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/dr;->x:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void

    .line 32
    :cond_2
    :goto_0
    invoke-static {}, Ll/vo;->j()Ll/vo;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Ll/vo;->s(Z)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/vo;->j()Ll/vo;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->a:Landroid/app/Application;

    .line 45
    .line 46
    new-instance v2, Ll/ar;

    .line 47
    .line 48
    invoke-direct {v2, p0, p1}, Ll/ar;-><init>(Ll/dr;Ll/y20;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Ll/vo;->m(Landroid/content/Context;Ll/y20;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public o(Ljava/lang/String;F)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-interface {v0, v1, v2}, Ll/m0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Ll/m0m;->o(Ljava/lang/String;F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/dr;->I(Z)Z

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1}, Ll/fp;->k(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/dr;->X()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/dr;->d0()Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "makeup_lut"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "makeup_all"

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 19
    .line 20
    invoke-interface {v0, p1}, Ll/m0m;->p(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/dr;->w:Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/dr;->w:Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/dr;->w:Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 40
    .line 41
    invoke-interface {p0}, Ll/m0m;->t()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public prepare()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/dr;->Y()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dr;->K()Ll/qow;

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/kv0;->a()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/Exception;

    .line 14
    .line 15
    const-string v1, "AppContext.getContext() is null"

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->J()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->et()V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 31
    .line 32
    iget-object v1, p0, Ll/dr;->d:Landroid/app/Activity;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/dr;->b0()Ll/vow;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {v0, v1, p0}, Ll/l0m;->R(Landroid/app/Activity;Ll/vow;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0
.end method

.method public r(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/dr;->m()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x2

    .line 16
    if-ne p1, p0, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ll/n0m;->m()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-interface {v0, p1}, Ll/n0m;->r(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-interface {v0, p1}, Ll/n0m;->r(I)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/dr;->d:Landroid/app/Activity;

    .line 3
    .line 4
    iput-object v0, p0, Ll/dr;->p:Ll/dp;

    .line 5
    .line 6
    invoke-static {p0}, Ll/qe20;->b(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public removeLast()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/l0m;->removeLast()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/dr;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public setFaceBeautyValue(Ljava/lang/String;F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/m0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIntensity(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/m0m;->x(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setState(I)Z
    .locals 1

    .line 1
    iget v0, p0, Ll/dr;->b:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    iput p1, p0, Ll/dr;->b:I

    .line 9
    .line 10
    return v0
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/dr;->f:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    iget-object p2, p0, Ll/dr;->c:Ll/l0m;

    .line 4
    .line 5
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean v0, p0, Ll/dr;->g:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p2, p1}, Ll/n0m;->w(Landroid/view/SurfaceHolder;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, p3, p4}, Ll/n0m;->n(II)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Ll/dr;->g:Z

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/dr;->g()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dr;->f:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/dr;->h:Z

    .line 5
    .line 6
    iput-boolean p1, p0, Ll/dr;->g:Z

    .line 7
    .line 8
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/dr;->f:Landroid/view/SurfaceHolder;

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/dr;->h:Z

    .line 6
    .line 7
    return-void
.end method

.method public t()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dr;->w:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/m0m;->t()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public u(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/m0m;->u(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/util/Map$Entry;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/lang/Float;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget-object v2, p0, Ll/dr;->c:Ll/l0m;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-interface {v2, v1, v0}, Ll/m0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    return-void
.end method

.method public w([F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/dr;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ll/dr;->t:[F

    .line 8
    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/dr;->q:Z

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/dr;->l0(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 16
    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    aget v0, p1, v0

    .line 21
    .line 22
    invoke-interface {p0, v0}, Ll/m0m;->q(F)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    aget p1, p1, v0

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ll/m0m;->v(F)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/dr;->s:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    iget-object v0, p0, Ll/dr;->c:Ll/l0m;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 14
    .line 15
    iget v1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 16
    .line 17
    iget p1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-interface {p0, v0, v1, p1, v2}, Ll/l0m;->E(Ljava/lang/String;IIZ)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public y(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dr;->c:Ll/l0m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/l0m;->K(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z()Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dr;->s:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    return-object p0
.end method
