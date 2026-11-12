.class public final Lu03;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lt03;


# instance fields
.field public final a:Lv03;


# direct methods
.method public constructor <init>(Lv03;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu03;->a:Lv03;

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Context;)V
    .registers 6

    const-string p0, "BackgroundTaskScheduler.cancel"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object p0

    :try_start_a
    invoke-static {}, Lujp;->l()Lujp;

    move-result-object v0

    const-string v1, "Android.BackgroundTaskScheduler.TaskCanceled"

    invoke-static {p1}, Lujp;->n(I)I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2, v1}, Lujp;->h(ILjava/lang/String;)V

    const-string v0, "jobscheduler"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/app/job/JobScheduler;
    :try_end_22
    .catchall {:try_start_a .. :try_end_22} :catchall_2b

    :try_start_22
    invoke-virtual {p2, p1}, Landroid/app/job/JobScheduler;->cancel(I)V
    :try_end_25
    .catch Ljava/lang/NullPointerException; {:try_start_22 .. :try_end_25} :catch_25
    .catchall {:try_start_22 .. :try_end_25} :catchall_2b

    :catch_25
    if-eqz p0, :cond_2a

    invoke-virtual {p0}, Lorg/chromium/base/TraceEvent;->close()V

    :cond_2a
    return-void

    :catchall_2b
    move-exception p1

    if-eqz p0, :cond_36

    :try_start_2e
    invoke-virtual {p0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_31
    .catchall {:try_start_2e .. :try_end_31} :catchall_32

    goto :goto_36

    :catchall_32
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_36
    :goto_36
    throw p1
.end method

.method public final b(Landroid/content/Context;Lorg/chromium/components/background_task_scheduler/TaskInfo;)Z
    .registers 5

    sget-object v0, Lorg/chromium/base/CommandLine;->d:Lorg/chromium/base/CommandLine;

    const-string v1, "ignore-background-tasks"

    invoke-virtual {v0, v1}, Lorg/chromium/base/CommandLine;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    iget v0, p2, Lorg/chromium/components/background_task_scheduler/TaskInfo;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "BackgroundTaskScheduler.schedule"

    invoke-static {v1, v0}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    :try_start_18
    new-instance v1, Ltn;

    invoke-direct {v1, p0, p1, p2}, Ltn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, p2, Lorg/chromium/components/background_task_scheduler/TaskInfo;->g:Lorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;

    invoke-interface {p0, v1}, Lorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;->a(Lycl;)V

    iget-boolean p0, v1, Ltn;->a:Z

    invoke-static {}, Lujp;->l()Lujp;

    move-result-object p1

    iget p2, p2, Lorg/chromium/components/background_task_scheduler/TaskInfo;->a:I

    if-eqz p0, :cond_39

    const-string v1, "Android.BackgroundTaskScheduler.TaskScheduled.Success"

    invoke-static {p2}, Lujp;->n(I)I

    move-result p2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2, v1}, Lujp;->h(ILjava/lang/String;)V

    goto :goto_45

    :cond_39
    const-string v1, "Android.BackgroundTaskScheduler.TaskScheduled.Failure"

    invoke-static {p2}, Lujp;->n(I)I

    move-result p2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2, v1}, Lujp;->h(ILjava/lang/String;)V
    :try_end_45
    .catchall {:try_start_18 .. :try_end_45} :catchall_4b

    :goto_45
    if-eqz v0, :cond_4a

    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V

    :cond_4a
    return p0

    :catchall_4b
    move-exception p0

    if-eqz v0, :cond_56

    :try_start_4e
    invoke-virtual {v0}, Lorg/chromium/base/TraceEvent;->close()V
    :try_end_51
    .catchall {:try_start_4e .. :try_end_51} :catchall_52

    goto :goto_56

    :catchall_52
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_56
    :goto_56
    throw p0
.end method
