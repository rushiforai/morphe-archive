.class public final Ll/pgy0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Ll/why0;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/pgy0;->a:Landroid/content/Context;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Intent;II)I
    .locals 5
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object p2, p0, Ll/pgy0;->a:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p2, v0, v0}, Ll/atx0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/measurement/zzdw;Ljava/lang/Long;)Ll/atx0;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-virtual {p2}, Ll/atx0;->zzj()Ll/d6x0;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const/4 v0, 0x2

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p2}, Ll/d6x0;->F()Ll/l8x0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "AppMeasurementService started with null intent"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return v0

    .line 25
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p2}, Ll/d6x0;->E()Ll/l8x0;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "Local AppMeasurementService called. startId, action"

    .line 34
    .line 35
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {v2, v3, v4, v1}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    const-string v2, "com.google.android.gms.measurement.UPLOAD"

    .line 43
    .line 44
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    new-instance v1, Ll/qhy0;

    .line 51
    .line 52
    invoke-direct {v1, p0, p3, p2, p1}, Ll/qhy0;-><init>(Ll/pgy0;ILl/d6x0;Landroid/content/Intent;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v1}, Ll/pgy0;->e(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    return v0
.end method

.method public final b(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pgy0;->j()Ll/d6x0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "onBind called with null intent"

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v1, "com.google.android.gms.measurement.START"

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    new-instance p1, Ll/iux0;

    .line 31
    .line 32
    iget-object p0, p0, Ll/pgy0;->a:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/google/android/gms/measurement/internal/j;->e(Landroid/content/Context;)Lcom/google/android/gms/measurement/internal/j;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-direct {p1, p0}, Ll/iux0;-><init>(Lcom/google/android/gms/measurement/internal/j;)V

    .line 39
    .line 40
    .line 41
    return-object p1

    .line 42
    :cond_1
    invoke-virtual {p0}, Ll/pgy0;->j()Ll/d6x0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/d6x0;->F()Ll/l8x0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string v1, "onBind received unknown action"

    .line 51
    .line 52
    invoke-virtual {p0, v1, p1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    return-object v0
.end method

.method public final c()V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pgy0;->a:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0, v0}, Ll/atx0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/measurement/zzdw;Ljava/lang/Long;)Ll/atx0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/d6x0;->E()Ll/l8x0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "Local AppMeasurementService is starting up"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic d(ILl/d6x0;Landroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pgy0;->a:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Ll/why0;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/why0;->zza(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/d6x0;->E()Ll/l8x0;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-string v0, "Local AppMeasurementService processed last upload request. StartId"

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p2, v0, p1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/pgy0;->j()Ll/d6x0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ll/d6x0;->E()Ll/l8x0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string p2, "Completed wakeful intent."

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/pgy0;->a:Landroid/content/Context;

    .line 38
    .line 39
    check-cast p0, Ll/why0;

    .line 40
    .line 41
    invoke-interface {p0, p3}, Ll/why0;->zza(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public final e(Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pgy0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/j;->e(Landroid/content/Context;)Lcom/google/android/gms/measurement/internal/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/j;->zzl()Ll/qsx0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Ll/rgy0;

    .line 12
    .line 13
    invoke-direct {v2, p0, v0, p1}, Ll/rgy0;-><init>(Ll/pgy0;Lcom/google/android/gms/measurement/internal/j;Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic f(Ll/d6x0;Landroid/app/job/JobParameters;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/d6x0;->E()Ll/l8x0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "AppMeasurementJobService processed last upload request."

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/pgy0;->a:Landroid/content/Context;

    .line 11
    .line 12
    check-cast p0, Ll/why0;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-interface {p0, p2, p1}, Ll/why0;->zza(Landroid/app/job/JobParameters;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final g(Landroid/app/job/JobParameters;)Z
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pgy0;->a:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1, v1}, Ll/atx0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/measurement/zzdw;Ljava/lang/Long;)Ll/atx0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getExtras()Landroid/os/PersistableBundle;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "action"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const-string v3, "Local AppMeasurementJobService called. action"

    .line 27
    .line 28
    invoke-virtual {v2, v3, v1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "com.google.android.gms.measurement.UPLOAD"

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    new-instance v1, Ll/mgy0;

    .line 40
    .line 41
    invoke-direct {v1, p0, v0, p1}, Ll/mgy0;-><init>(Ll/pgy0;Ll/d6x0;Landroid/app/job/JobParameters;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v1}, Ll/pgy0;->e(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    const/4 p0, 0x1

    .line 48
    return p0
.end method

.method public final h()V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pgy0;->a:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0, v0}, Ll/atx0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/measurement/zzdw;Ljava/lang/Long;)Ll/atx0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/d6x0;->E()Ll/l8x0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "Local AppMeasurementService is shutting down"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final i(Landroid/content/Intent;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pgy0;->j()Ll/d6x0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "onRebind called with null intent"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0}, Ll/pgy0;->j()Ll/d6x0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/d6x0;->E()Ll/l8x0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "onRebind called. action"

    .line 30
    .line 31
    invoke-virtual {p0, v0, p1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final j()Ll/d6x0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pgy0;->a:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0, v0}, Ll/atx0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/measurement/zzdw;Ljava/lang/Long;)Ll/atx0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final k(Landroid/content/Intent;)Z
    .locals 2
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pgy0;->j()Ll/d6x0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "onUnbind called with null intent"

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0}, Ll/pgy0;->j()Ll/d6x0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/d6x0;->E()Ll/l8x0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v1, "onUnbind called for intent. action"

    .line 31
    .line 32
    invoke-virtual {p0, v1, p1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return v0
.end method
