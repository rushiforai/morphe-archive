.class public final Lorg/chromium/components/background_task_scheduler/TaskInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;
    }
.end annotation


# instance fields
.field public final a:I

.field public final b:Landroid/os/PersistableBundle;

.field public final c:I

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Lorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;


# direct methods
.method public constructor <init>(Lorg/chromium/components/background_task_scheduler/a;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Lorg/chromium/components/background_task_scheduler/a;->a:I

    iput v0, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->a:I

    iget-object v0, p1, Lorg/chromium/components/background_task_scheduler/a;->b:Landroid/os/PersistableBundle;

    if-nez v0, :cond_10

    new-instance v0, Landroid/os/PersistableBundle;

    invoke-direct {v0}, Landroid/os/PersistableBundle;-><init>()V

    :cond_10
    iput-object v0, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->b:Landroid/os/PersistableBundle;

    iget v0, p1, Lorg/chromium/components/background_task_scheduler/a;->c:I

    iput v0, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->c:I

    iget-boolean v0, p1, Lorg/chromium/components/background_task_scheduler/a;->d:Z

    iput-boolean v0, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->d:Z

    iget-boolean v0, p1, Lorg/chromium/components/background_task_scheduler/a;->e:Z

    iput-boolean v0, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->e:Z

    iget-boolean v0, p1, Lorg/chromium/components/background_task_scheduler/a;->f:Z

    iput-boolean v0, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->f:Z

    iget-object p1, p1, Lorg/chromium/components/background_task_scheduler/a;->g:Lorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;

    iput-object p1, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->g:Lorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;

    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "{taskId: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", extras: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->b:Landroid/os/PersistableBundle;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", requiredNetworkType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->c:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", requiresCharging: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->d:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", userInitiated: false, isPersisted: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->e:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", updateCurrent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->f:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", timingInfo: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lorg/chromium/components/background_task_scheduler/TaskInfo;->g:Lorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "}"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
