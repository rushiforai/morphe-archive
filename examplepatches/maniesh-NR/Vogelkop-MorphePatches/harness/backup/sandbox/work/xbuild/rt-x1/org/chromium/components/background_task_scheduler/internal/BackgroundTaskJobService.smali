.class public Lorg/chromium/components/background_task_scheduler/internal/BackgroundTaskJobService;
.super Landroid/app/job/JobService;
.source "SourceFile"


# instance fields
.field public final a:Luac;

.field public final b:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    new-instance v0, Luac;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Luac;-><init>(B)V

    iput-object v0, p0, Lorg/chromium/components/background_task_scheduler/internal/BackgroundTaskJobService;->a:Luac;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/chromium/components/background_task_scheduler/internal/BackgroundTaskJobService;->b:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final onStartJob(Landroid/app/job/JobParameters;)Z
    .registers 14

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Landroid/app/Application;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_b4

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v0

    sget-object v2, Lp37;->h:Li06;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x1

    if-eq v0, v2, :cond_38

    const/16 v3, 0x66

    if-eq v0, v3, :cond_32

    const/16 v3, 0x69

    if-eq v0, v3, :cond_2c

    const/4 v0, 0x0

    goto :goto_3d

    :cond_2c
    new-instance v0, Lp03;

    invoke-direct {v0, v2}, Lp03;-><init>(B)V

    goto :goto_3d

    :cond_32
    new-instance v0, Lp03;

    invoke-direct {v0, v1}, Lp03;-><init>(B)V

    goto :goto_3d

    :cond_38
    new-instance v0, Las9;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    :goto_3d
    instance-of v2, v0, Lp03;

    if-eqz v2, :cond_4d

    move-object v2, v0

    check-cast v2, Lp03;

    new-instance v3, Lix5;

    const/16 v4, 0x16

    invoke-direct {v3, v4}, Lix5;-><init>(B)V

    iput-object v3, v2, Lp03;->c:Lix5;

    :cond_4d
    if-nez v0, :cond_5f

    invoke-static {}, Lp37;->J()Lt03;

    move-result-object p0

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result p1

    check-cast p0, Lu03;

    invoke-virtual {p0, p1, v0}, Lu03;->a(ILandroid/content/Context;)V

    return v1

    :cond_5f
    iget-object v2, p0, Lorg/chromium/components/background_task_scheduler/internal/BackgroundTaskJobService;->a:Luac;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getExtras()Landroid/os/PersistableBundle;

    move-result-object v4

    if-eqz v4, :cond_b5

    const-string v5, "_background_task_schedule_time"

    invoke-virtual {v4, v5}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_b5

    invoke-virtual {v4, v5}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    const-string v7, "_background_task_end_time"

    invoke-virtual {v4, v7}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8c

    invoke-virtual {v4, v7}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    move-result-wide v7

    add-long/2addr v7, v5

    cmp-long v2, v2, v7

    if-ltz v2, :cond_b5

    goto :goto_b4

    :cond_8c
    const-string v7, "_background_task_interval_time"

    invoke-virtual {v4, v7}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    move-result-wide v7

    invoke-static {}, Landroid/app/job/JobInfo;->getMinPeriodMillis()J

    move-result-wide v9

    cmp-long v9, v7, v9

    if-gez v9, :cond_9e

    invoke-static {}, Landroid/app/job/JobInfo;->getMinPeriodMillis()J

    move-result-wide v7

    :cond_9e
    const-string v9, "_background_task_flex_time"

    invoke-static {}, Landroid/app/job/JobInfo;->getMinFlexMillis()J

    move-result-wide v10

    invoke-virtual {v4, v9, v10, v11}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    sub-long/2addr v2, v5

    rem-long/2addr v2, v7

    sub-long v4, v7, v9

    cmp-long v2, v2, v4

    if-gez v2, :cond_b5

    cmp-long v2, v9, v7

    if-gez v2, :cond_b5

    :cond_b4
    :goto_b4
    return v1

    :cond_b5
    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lorg/chromium/components/background_task_scheduler/internal/BackgroundTaskJobService;->b:Ljava/util/HashMap;

    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Lv03;->a(Landroid/app/job/JobParameters;)Lzcl;

    move-result-object v1

    invoke-static {}, Lujp;->l()Lujp;

    move-result-object v3

    iget v4, v1, Lzcl;->a:I

    invoke-static {v4}, Lujp;->n(I)I

    move-result v4

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "Android.BackgroundTaskScheduler.TaskStarted"

    invoke-static {v4, v3}, Lujp;->h(ILjava/lang/String;)V

    sget-object v3, Lt8;->a:Landroid/content/Context;

    new-instance v4, Lbx7;

    invoke-direct {v4, p0, v0, p1}, Lbx7;-><init>(Lorg/chromium/components/background_task_scheduler/internal/BackgroundTaskJobService;Lr03;Landroid/app/job/JobParameters;)V

    invoke-interface {v0, v3, v1, v4}, Lr03;->a(Landroid/content/Context;Lzcl;Lbx7;)Z

    move-result p0

    if-nez p0, :cond_f0

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f0
    return p0
.end method

.method public final onStopJob(Landroid/app/job/JobParameters;)Z
    .registers 6

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Landroid/app/Application;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object p0, p0, Lorg/chromium/components/background_task_scheduler/internal/BackgroundTaskJobService;->b:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    const/4 p0, 0x0

    return p0

    :cond_2c
    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr03;

    invoke-static {p1}, Lv03;->a(Landroid/app/job/JobParameters;)Lzcl;

    move-result-object v1

    invoke-static {}, Lujp;->l()Lujp;

    move-result-object v2

    iget v3, v1, Lzcl;->a:I

    invoke-static {v3}, Lujp;->n(I)I

    move-result v3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "Android.BackgroundTaskScheduler.TaskStopped"

    invoke-static {v3, v2}, Lujp;->h(ILjava/lang/String;)V

    sget-object v2, Lt8;->a:Landroid/content/Context;

    invoke-interface {v0, v2, v1}, Lr03;->b(Landroid/content/Context;Lzcl;)Z

    move-result v0

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return v0
.end method
