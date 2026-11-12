.class public final Lv03;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Landroid/app/job/JobParameters;)Lzcl;
    .registers 3

    invoke-virtual {p0}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v0

    new-instance v1, Lzcl;

    invoke-direct {v1, v0}, Lzcl;-><init>(I)V

    invoke-virtual {p0}, Landroid/app/job/JobParameters;->getExtras()Landroid/os/PersistableBundle;

    move-result-object p0

    const-string v0, "_background_task_extras"

    invoke-virtual {p0, v0}, Landroid/os/PersistableBundle;->getPersistableBundle(Ljava/lang/String;)Landroid/os/PersistableBundle;

    move-result-object p0

    new-instance v0, Landroid/os/PersistableBundle;

    invoke-direct {v0}, Landroid/os/PersistableBundle;-><init>()V

    invoke-virtual {v0, p0}, Landroid/os/BaseBundle;->putAll(Landroid/os/PersistableBundle;)V

    iput-object v0, v1, Lzcl;->b:Landroid/os/PersistableBundle;

    new-instance p0, Lzcl;

    invoke-direct {p0, v1}, Lzcl;-><init>(Lzcl;)V

    return-object p0
.end method


# virtual methods
.method public final b(Landroid/content/Context;Lorg/chromium/components/background_task_scheduler/TaskInfo;)Z
    .registers 8

    new-instance p0, Landroid/os/PersistableBundle;

    invoke-direct {p0}, Landroid/os/PersistableBundle;-><init>()V

    iget-object v0, p2, Lorg/chromium/components/background_task_scheduler/TaskInfo;->b:Landroid/os/PersistableBundle;

    const-string v1, "_background_task_extras"

    invoke-virtual {p0, v1, v0}, Landroid/os/PersistableBundle;->putPersistableBundle(Ljava/lang/String;Landroid/os/PersistableBundle;)V

    new-instance v0, Landroid/app/job/JobInfo$Builder;

    iget v1, p2, Lorg/chromium/components/background_task_scheduler/TaskInfo;->a:I

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lorg/chromium/components/background_task_scheduler/internal/BackgroundTaskJobService;

    invoke-direct {v2, p1, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-direct {v0, v1, v2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    iget-boolean v2, p2, Lorg/chromium/components/background_task_scheduler/TaskInfo;->e:Z

    invoke-virtual {v0, v2}, Landroid/app/job/JobInfo$Builder;->setPersisted(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object v0

    iget-boolean v2, p2, Lorg/chromium/components/background_task_scheduler/TaskInfo;->d:Z

    invoke-virtual {v0, v2}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object v0

    iget v2, p2, Lorg/chromium/components/background_task_scheduler/TaskInfo;->c:I

    invoke-virtual {v0, v2}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object v0

    invoke-static {}, Lz04;->c()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_36

    invoke-virtual {v0, v3}, Landroid/app/job/JobInfo$Builder;->setUserInitiated(Z)Landroid/app/job/JobInfo$Builder;

    :cond_36
    new-instance v2, Lesg;

    const/4 v4, 0x5

    invoke-direct {v2, v4, v0, p0, v3}, Lesg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p0, p2, Lorg/chromium/components/background_task_scheduler/TaskInfo;->g:Lorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;

    invoke-interface {p0, v2}, Lorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;->a(Lycl;)V

    invoke-virtual {v0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    const-string v0, "jobscheduler"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/job/JobScheduler;

    iget-boolean p2, p2, Lorg/chromium/components/background_task_scheduler/TaskInfo;->f:Z

    const/4 v0, 0x1

    if-nez p2, :cond_6d

    invoke-virtual {p1}, Landroid/app/job/JobScheduler;->getAllPendingJobs()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_5a
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6d

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/job/JobInfo;

    invoke-virtual {v2}, Landroid/app/job/JobInfo;->getId()I

    move-result v2

    if-ne v2, v1, :cond_5a

    goto :goto_73

    :cond_6d
    :try_start_6d
    invoke-virtual {p1, p0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result p0
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_6d .. :try_end_71} :catch_74

    if-ne p0, v0, :cond_74

    :goto_73
    return v0

    :catch_74
    :cond_74
    return v3
.end method
