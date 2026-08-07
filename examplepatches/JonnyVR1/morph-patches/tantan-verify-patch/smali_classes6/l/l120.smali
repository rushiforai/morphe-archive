.class public Ll/l120;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Ll/zz10; = null

.field public static volatile b:Landroid/os/Handler; = null

.field public static c:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent; = null

.field public static d:Z = true

.field public static e:Z = false

.field public static f:Z = false

.field public static g:J = 0x0L

.field public static h:J = -0x2L

.field public static i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
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

.method public static synthetic a(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)V
    .locals 0

    .line 1
    sget-boolean p0, Ll/l120;->e:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/l120;->a:Ll/zz10;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/zz10;->g()Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->start()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static b()V
    .locals 1

    .line 1
    sget-object v0, Ll/l120;->i:Ljava/util/List;

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
    sget-object v0, Ll/l120;->i:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput-object v0, Ll/l120;->i:Ljava/util/List;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static c()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public static d()J
    .locals 2

    .line 1
    sget-wide v0, Ll/l120;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static e(Ljava/lang/String;)I
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_4

    .line 6
    .line 7
    :try_start_0
    new-instance v0, Landroid/media/MediaMetadataRetriever;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/16 v1, 0x9

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    if-lez v0, :cond_0

    .line 35
    .line 36
    return v0

    .line 37
    :catch_0
    move-exception v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    const/4 v0, 0x0

    .line 42
    :try_start_1
    new-instance v1, Landroid/media/MediaPlayer;

    .line 43
    .line 44
    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x3

    .line 48
    :try_start_2
    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, p0}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    .line 58
    .line 59
    .line 60
    move-result p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 61
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 68
    .line 69
    .line 70
    :cond_1
    return p0

    .line 71
    :catchall_0
    move-exception p0

    .line 72
    move-object v0, v1

    .line 73
    goto :goto_1

    .line 74
    :catch_1
    move-exception p0

    .line 75
    move-object v0, v1

    .line 76
    goto :goto_0

    .line 77
    :catchall_1
    move-exception p0

    .line 78
    goto :goto_1

    .line 79
    :catch_2
    move-exception p0

    .line 80
    :goto_0
    :try_start_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 81
    .line 82
    .line 83
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_2

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 90
    .line 91
    .line 92
    :cond_2
    const/4 p0, -0x1

    .line 93
    return p0

    .line 94
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_3

    .line 99
    .line 100
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 101
    .line 102
    .line 103
    :cond_3
    throw p0

    .line 104
    :cond_4
    const-string p0, "music path is null."

    .line 105
    .line 106
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    const/4 p0, 0x0

    .line 110
    return p0
.end method

.method public static f()Ll/zz10;
    .locals 3

    .line 1
    sget-object v0, Ll/l120;->a:Ll/zz10;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/l120;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/l120;->a:Ll/zz10;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/zz10;

    .line 13
    .line 14
    invoke-static {}, Ll/l120;->c()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-direct {v1, v2}, Ll/zz10;-><init>(Z)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Ll/l120;->a:Ll/zz10;

    .line 22
    .line 23
    sget-object v1, Ll/l120;->a:Ll/zz10;

    .line 24
    .line 25
    new-instance v2, Ll/k120;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/k120;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ll/zz10;->n(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception v1

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    monitor-exit v0

    .line 37
    goto :goto_2

    .line 38
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw v1

    .line 40
    :cond_1
    :goto_2
    sget-object v0, Ll/l120;->a:Ll/zz10;

    .line 41
    .line 42
    return-object v0
.end method

.method public static g()J
    .locals 4

    .line 1
    sget-wide v0, Ll/l120;->g:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    sput-wide v0, Ll/l120;->g:J

    .line 7
    .line 8
    const-wide v2, 0x7fffffffffffffffL

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    sput-wide v0, Ll/l120;->g:J

    .line 20
    .line 21
    :cond_0
    sget-wide v0, Ll/l120;->g:J

    .line 22
    .line 23
    return-wide v0
.end method

.method public static h()V
    .locals 2

    .line 1
    sget-object v0, Ll/l120;->b:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Ll/l120;->b:Landroid/os/Handler;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    sput-object v1, Ll/l120;->b:Landroid/os/Handler;

    .line 16
    .line 17
    invoke-static {}, Ll/l120;->i()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/l120;->b()V

    .line 21
    .line 22
    .line 23
    sget-object v0, Ll/l120;->a:Ll/zz10;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    sget-object v0, Ll/l120;->a:Ll/zz10;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/zz10;->h()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    sget-object v0, Ll/l120;->a:Ll/zz10;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/zz10;->i()V

    .line 42
    .line 43
    .line 44
    :cond_1
    sget-object v0, Ll/l120;->a:Ll/zz10;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/zz10;->j()V

    .line 47
    .line 48
    .line 49
    :cond_2
    sput-object v1, Ll/l120;->a:Ll/zz10;

    .line 50
    .line 51
    const-wide/16 v0, 0x0

    .line 52
    .line 53
    sput-wide v0, Ll/l120;->g:J

    .line 54
    .line 55
    return-void
.end method

.method public static i()V
    .locals 1

    .line 1
    invoke-static {}, Ll/l120;->j()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    sput-object v0, Ll/l120;->c:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    sput-boolean v0, Ll/l120;->e:Z

    .line 9
    .line 10
    sput-boolean v0, Ll/l120;->f:Z

    .line 11
    .line 12
    return-void
.end method

.method public static j()V
    .locals 1

    .line 1
    sget-object v0, Ll/l120;->a:Ll/zz10;

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
    sget-object v0, Ll/l120;->a:Ll/zz10;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/zz10;->k()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    sput-boolean v0, Ll/l120;->d:Z

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    sput-boolean v0, Ll/l120;->e:Z

    .line 19
    .line 20
    sput-boolean v0, Ll/l120;->f:Z

    .line 21
    .line 22
    return-void
.end method

.method public static k(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    sget-object v1, Ll/l120;->c:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    sget-object v1, Ll/l120;->c:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 30
    .line 31
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->isDeepEquals(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    invoke-static {}, Ll/l120;->f()Ll/zz10;

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/l120;->i()V

    .line 43
    .line 44
    .line 45
    sput-object p0, Ll/l120;->c:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 46
    .line 47
    :try_start_0
    sget-object v1, Ll/l120;->a:Ll/zz10;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v1, p0}, Ll/zz10;->m(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    goto :goto_0

    .line 56
    :catch_0
    move-exception p0

    .line 57
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    move p0, v0

    .line 61
    :goto_0
    sput-boolean v0, Ll/l120;->d:Z

    .line 62
    .line 63
    return p0

    .line 64
    :cond_2
    :goto_1
    return v0
.end method

.method public static l(JIIZF)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    sput-wide p0, Ll/l120;->h:J

    .line 2
    .line 3
    sget-object p0, Ll/l120;->a:Ll/zz10;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-boolean p0, Ll/l120;->d:Z

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Ll/l120;->a:Ll/zz10;

    .line 16
    .line 17
    invoke-virtual {p0, p2, p3, p4, p5}, Ll/zz10;->p(IIZF)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    sput-boolean p0, Ll/l120;->e:Z

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    sput-boolean p0, Ll/l120;->f:Z

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static m(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;JIIF)J
    .locals 3

    .line 1
    invoke-static {}, Ll/l120;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "\u8be5\u673a\u578b\u6682\u4e0d\u652f\u6301\u6b64\u529f\u80fd\uff01"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-wide v1

    .line 15
    :cond_0
    if-nez p0, :cond_1

    .line 16
    .line 17
    return-wide v1

    .line 18
    :cond_1
    sget-object v0, Ll/l120;->c:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->isDeepEquals(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    goto :goto_0

    .line 30
    :cond_2
    const/4 v0, 0x0

    .line 31
    :goto_0
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {p0}, Ll/l120;->k(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Z

    .line 34
    .line 35
    .line 36
    :cond_3
    move-wide p0, p1

    .line 37
    move p2, p3

    .line 38
    move p3, p4

    .line 39
    move p4, v0

    .line 40
    invoke-static/range {p0 .. p5}, Ll/l120;->l(JIIZF)V

    .line 41
    .line 42
    .line 43
    return-wide p0
.end method

.method public static n(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;II)J
    .locals 6

    .line 1
    invoke-static {}, Ll/l120;->g()J

    .line 2
    .line 3
    .line 4
    move-result-wide v1

    .line 5
    const/high16 v5, 0x3f800000    # 1.0f

    .line 6
    .line 7
    move-object v0, p0

    .line 8
    move v3, p1

    .line 9
    move v4, p2

    .line 10
    invoke-static/range {v0 .. v5}, Ll/l120;->m(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;JIIF)J

    .line 11
    .line 12
    .line 13
    move-result-wide p0

    .line 14
    return-wide p0
.end method

.method public static o(J)Z
    .locals 4

    .line 1
    sget-wide v0, Ll/l120;->h:J

    .line 2
    .line 3
    cmp-long p0, v0, p0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const-wide/high16 v2, -0x8000000000000000L

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    return p1

    .line 15
    :cond_0
    sget-object p0, Ll/l120;->a:Ll/zz10;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    sget-object p0, Ll/l120;->a:Ll/zz10;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/zz10;->q()V

    .line 26
    .line 27
    .line 28
    sput-boolean p1, Ll/l120;->e:Z

    .line 29
    .line 30
    sput-boolean p1, Ll/l120;->f:Z

    .line 31
    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    sput-object p0, Ll/l120;->c:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0
.end method
