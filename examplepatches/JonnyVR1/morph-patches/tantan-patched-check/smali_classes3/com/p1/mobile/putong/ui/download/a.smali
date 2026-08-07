.class public Lcom/p1/mobile/putong/ui/download/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static g:Lcom/p1/mobile/putong/ui/download/a;


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

.field public e:Ljava/util/concurrent/atomic/AtomicInteger;

.field public f:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

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
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->c:Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 31
    .line 32
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 38
    .line 39
    new-instance v0, Ll/p9e;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/p9e;-><init>(Lcom/p1/mobile/putong/ui/download/a;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->f:Ljava/lang/Runnable;

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/download/a;Ll/y20;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/download/a;->m(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->E()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-interface {p1, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/ui/download/a;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->E()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 16
    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->e(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->d(I)V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->l(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/ui/download/a;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/a;->m(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/ui/download/a;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Integer;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->E()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->i(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x0

    .line 28
    const/16 v3, 0x64

    .line 29
    .line 30
    invoke-virtual {v0, v3, v1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setProgress(IIZ)Landroidx/core/app/NotificationCompat$Builder;

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
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p2, "%"

    .line 42
    .line 43
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {v0, p2}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 54
    .line 55
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->l(I)V

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/ui/download/a;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xa

    .line 5
    .line 6
    :try_start_0
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/a;->v()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/download/a;->i(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    :try_start_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->Q()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_1

    .line 22
    :catchall_0
    move-exception v1

    .line 23
    :try_start_2
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->L(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :goto_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->D()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/download/a;->k(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 36
    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/download/a;->A(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->K()V

    .line 43
    .line 44
    .line 45
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/a;->v()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 46
    .line 47
    .line 48
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0

    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception p0

    .line 51
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    goto :goto_3

    .line 55
    :catch_1
    move-exception p0

    .line 56
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_3
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/ui/download/a;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->i(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->E()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    if-eqz v0, :cond_2

    .line 24
    .line 25
    const/16 p2, 0x64

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, p2, v1, v1}, Landroidx/core/app/NotificationCompat$Builder;->setProgress(IIZ)Landroidx/core/app/NotificationCompat$Builder;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->l(I)V

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/ui/download/a;Ll/y20;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/download/a;->m(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->E()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-interface {p1, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/ui/download/a;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->a(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->E()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->k()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    sget v0, Lcom/p1/mobile/putong/ui/download/R$string;->e:I

    .line 26
    .line 27
    invoke-static {v0}, Ll/r1j0;->a(I)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->i(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    const/4 v2, 0x1

    .line 44
    const/16 v3, 0x64

    .line 45
    .line 46
    invoke-virtual {v0, v3, v1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setProgress(IIZ)Landroidx/core/app/NotificationCompat$Builder;

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->l(I)V

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_0
    return-void
.end method

.method public static u()Lcom/p1/mobile/putong/ui/download/a;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/ui/download/a;->g:Lcom/p1/mobile/putong/ui/download/a;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/ui/download/a;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/ui/download/a;->g:Lcom/p1/mobile/putong/ui/download/a;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/ui/download/a;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/ui/download/a;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/p1/mobile/putong/ui/download/a;->g:Lcom/p1/mobile/putong/ui/download/a;

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
    sget-object v0, Lcom/p1/mobile/putong/ui/download/a;->g:Lcom/p1/mobile/putong/ui/download/a;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public declared-synchronized A(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->c:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
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

.method public declared-synchronized B(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->c:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->a:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw p1
.end method

.method public declared-synchronized C(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->a:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->a:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->H()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p1
.end method

.method public D(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->D()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/a;->C(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/a;->r()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public declared-synchronized i(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/a;->A(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->c:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1
.end method

.method public declared-synchronized j(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method

.method public declared-synchronized k(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/a;->A(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->a:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1
.end method

.method public declared-synchronized l(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw p1
.end method

.method public m(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->f(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/a;->B(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->p()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/a;->l(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/a;->r()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/a;->j(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/a;->r()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public q(Ll/rg50;Ljava/lang/String;Ljava/lang/String;ZLl/y20;Ll/y20;)Lcom/p1/mobile/putong/ui/download/DownloadTask;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rg50;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ll/y20<",
            "Ljava/io/File;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/16 p2, 0x4000

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->l(I)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/16 p2, 0x1f4

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->s(I)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->r(Z)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance p2, Ll/r9e;

    .line 31
    .line 32
    invoke-direct {p2, p0}, Ll/r9e;-><init>(Lcom/p1/mobile/putong/ui/download/a;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->i(Ll/y20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance p2, Ll/s9e;

    .line 40
    .line 41
    invoke-direct {p2, p0}, Ll/s9e;-><init>(Lcom/p1/mobile/putong/ui/download/a;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->e(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance p2, Ll/t9e;

    .line 49
    .line 50
    invoke-direct {p2, p0}, Ll/t9e;-><init>(Lcom/p1/mobile/putong/ui/download/a;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->g(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    new-instance p2, Ll/u9e;

    .line 58
    .line 59
    invoke-direct {p2, p0}, Ll/u9e;-><init>(Lcom/p1/mobile/putong/ui/download/a;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->d(Ll/y20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance p2, Ll/v9e;

    .line 67
    .line 68
    invoke-direct {p2, p0}, Ll/v9e;-><init>(Lcom/p1/mobile/putong/ui/download/a;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->h(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance p2, Ll/w9e;

    .line 76
    .line 77
    invoke-direct {p2, p0, p5}, Ll/w9e;-><init>(Lcom/p1/mobile/putong/ui/download/a;Ll/y20;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance p2, Ll/x9e;

    .line 85
    .line 86
    invoke-direct {p2, p0, p6}, Ll/x9e;-><init>(Lcom/p1/mobile/putong/ui/download/a;Ll/y20;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 98
    .line 99
    .line 100
    return-object p1
.end method

.method public final declared-synchronized r()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x3

    .line 17
    if-ge v0, v1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->f:Ljava/lang/Runnable;

    .line 20
    .line 21
    invoke-static {v0}, Ll/xhi0;->a(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw v0
.end method

.method public declared-synchronized s(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    if-eqz p1, :cond_5

    .line 4
    .line 5
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    move-object v0, v2

    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :goto_0
    if-nez v0, :cond_3

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/a;->c:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_3

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_2

    .line 66
    .line 67
    move-object v0, v2

    .line 68
    :cond_3
    if-nez v0, :cond_5

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/a;->a:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_5

    .line 81
    .line 82
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-eqz v3, :cond_4

    .line 97
    .line 98
    move-object v0, v2

    .line 99
    goto :goto_2

    .line 100
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    throw p1

    .line 102
    :cond_5
    :goto_2
    monitor-exit p0

    .line 103
    return-object v0
.end method

.method public t(I)Lcom/p1/mobile/putong/ui/download/DownloadTask;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/a;->w(I)Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public declared-synchronized v()Lcom/p1/mobile/putong/ui/download/DownloadTask;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :goto_0
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/a;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    :cond_1
    monitor-exit p0

    .line 36
    return-object v0

    .line 37
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw v0
.end method

.method public declared-synchronized w(I)Lcom/p1/mobile/putong/ui/download/DownloadTask;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->c:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    if-ne v2, p1, :cond_0

    .line 27
    .line 28
    monitor-exit p0

    .line 29
    return-object v1

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->a:Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 49
    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 53
    .line 54
    .line 55
    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    if-ne v2, p1, :cond_2

    .line 57
    .line 58
    monitor-exit p0

    .line 59
    return-object v1

    .line 60
    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_5

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 77
    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 81
    .line 82
    .line 83
    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 84
    if-ne v2, p1, :cond_4

    .line 85
    .line 86
    monitor-exit p0

    .line 87
    return-object v1

    .line 88
    :cond_5
    monitor-exit p0

    .line 89
    const/4 p0, 0x0

    .line 90
    return-object p0

    .line 91
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 92
    throw p1
.end method

.method public x(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/download/a;->d:Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadNotificationHelper;->i(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public declared-synchronized y(Ljava/lang/String;)Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    if-eqz p1, :cond_5

    .line 4
    .line 5
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/a;->b:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x1

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    move v0, v3

    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    :goto_0
    if-nez v0, :cond_3

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/a;->c:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_3

    .line 51
    .line 52
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    move v0, v3

    .line 69
    :cond_3
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/download/a;->a:Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_5

    .line 82
    .line 83
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 88
    .line 89
    invoke-virtual {v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_4

    .line 98
    .line 99
    move v0, v3

    .line 100
    goto :goto_2

    .line 101
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    throw p1

    .line 103
    :cond_5
    :goto_2
    monitor-exit p0

    .line 104
    return v0
.end method

.method public z(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->G()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method
