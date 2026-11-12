.class public final Lcom/opera/android/downloads/DownloadJobService;
.super Lnzc;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "SpecifyJobSchedulerIdRange"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/opera/android/downloads/DownloadJobService;",
        "Lnzc;",
        "<init>",
        "()V",
        "g8",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic d:I


# instance fields
.field public b:Landroid/app/job/JobParameters;

.field public c:Lcg;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/app/job/JobParameters;)Z
    .registers 8

    sget-boolean v0, Lcom/opera/android/downloads/DownloadService;->e:Z

    const/4 v1, 0x0

    if-nez v0, :cond_a3

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/downloads/DownloadJobService;->b:Landroid/app/job/JobParameters;

    iget-object v0, p0, Lcom/opera/android/downloads/DownloadJobService;->c:Lcg;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lcg;->h()V

    :cond_f
    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getStopReason()I

    move-result p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_a3

    const/16 v2, 0xd

    if-eq p1, v2, :cond_65

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p0

    iget-object p0, p0, Lsf7;->a:Lrf7;

    invoke-virtual {p0}, Lrf7;->v()V

    :try_start_2b
    iget-object p1, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_35
    :goto_35
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lre7;

    invoke-virtual {v1}, Lre7;->m()Z

    move-result v2

    if-nez v2, :cond_4b

    iget-boolean v2, v1, Lre7;->w:Z

    if-eqz v2, :cond_35

    :cond_4b
    iget-object v2, v1, Lre7;->a:Lxf7;

    iget-object v2, v2, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    iget-object v1, v1, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v1}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide v3

    iget-wide v1, v2, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    const/4 v5, 0x2

    invoke-static {v1, v2, v3, v4, v5}, LJ/N;->MUhg9A8g(JJI)V
    :try_end_5b
    .catchall {:try_start_2b .. :try_end_5b} :catchall_60

    goto :goto_35

    :cond_5c
    invoke-virtual {p0}, Lrf7;->w()V

    return v0

    :catchall_60
    move-exception p1

    invoke-virtual {p0}, Lrf7;->w()V

    throw p1

    :cond_65
    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p0

    iget-object p0, p0, Lsf7;->a:Lrf7;

    invoke-virtual {p0}, Lrf7;->v()V

    :try_start_76
    iget-object p1, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_80
    :goto_80
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lre7;

    invoke-virtual {v0}, Lre7;->m()Z

    move-result v2

    if-nez v2, :cond_96

    iget-boolean v2, v0, Lre7;->w:Z

    if-eqz v2, :cond_80

    :cond_96
    invoke-virtual {v0}, Lre7;->s()V
    :try_end_99
    .catchall {:try_start_76 .. :try_end_99} :catchall_9e

    goto :goto_80

    :cond_9a
    invoke-virtual {p0}, Lrf7;->w()V

    return v1

    :catchall_9e
    move-exception p1

    invoke-virtual {p0}, Lrf7;->w()V

    throw p1

    :cond_a3
    return v1
.end method

.method public final b(Landroid/app/Notification;)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/downloads/DownloadJobService;->b:Landroid/app/job/JobParameters;

    if-eqz v0, :cond_b

    const v1, 0x7f0a02ed

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, p1, v2}, Landroid/app/job/JobService;->setNotification(Landroid/app/job/JobParameters;ILandroid/app/Notification;I)V

    :cond_b
    return-void
.end method

.method public final onDestroy()V
    .registers 1

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    iget-object p0, p0, Lcom/opera/android/downloads/DownloadJobService;->c:Lcg;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lcg;->h()V

    :cond_a
    return-void
.end method

.method public final onStartJob(Landroid/app/job/JobParameters;)Z
    .registers 5

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_19

    sget-boolean v0, Lcom/opera/android/downloads/DownloadService;->e:Z

    if-eqz v0, :cond_13

    invoke-static {p0}, Lev4;->k(Landroid/content/Context;)V

    return v1

    :cond_13
    invoke-static {p0}, Lev4;->g(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1a

    :cond_19
    return v1

    :cond_1a
    iput-object p1, p0, Lcom/opera/android/downloads/DownloadJobService;->b:Landroid/app/job/JobParameters;

    iget-object p1, p0, Lcom/opera/android/downloads/DownloadJobService;->c:Lcg;

    if-nez p1, :cond_2d

    new-instance p1, Lcg;

    new-instance v0, Ltu;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Ltu;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p0, v0}, Lcg;-><init>(Landroid/app/Service;Lcom/opera/api/Callback;)V

    iput-object p1, p0, Lcom/opera/android/downloads/DownloadJobService;->c:Lcg;

    :cond_2d
    iget-object v0, p1, Ln14;->b:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v1, v0, Lsf7;->c:Lfg7;

    iget-object v2, p1, Lcg;->i:Lbg;

    invoke-virtual {v1, v2}, Lfg7;->a(Lbg;)V

    iget-object v0, v0, Lsf7;->a:Lrf7;

    iget-object v1, p1, Lcg;->h:Lag;

    invoke-virtual {v0, v1}, Lrf7;->b(Lqf7;)V

    invoke-virtual {p1}, Lcg;->g()Landroid/app/Notification;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/downloads/DownloadJobService;->b(Landroid/app/Notification;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-nez p1, :cond_5b

    const/4 p1, 0x0

    :cond_5b
    invoke-static {p0, p1}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    new-instance p1, Lwt2;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lwt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, p1}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    return v0
.end method
