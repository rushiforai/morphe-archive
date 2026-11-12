.class public final Lhc3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lneb;


# instance fields
.field public final a:Ltn;

.field public b:Ln61;

.field public c:Lnc3;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Ltn;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhc3;->a:Ltn;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lhc3;->d:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lhc3;->e:Z

    return-void
.end method


# virtual methods
.method public final close()V
    .registers 1

    invoke-virtual {p0}, Lhc3;->k()V

    return-void
.end method

.method public final h(Lk8e;)V
    .registers 2

    invoke-virtual {p0}, Lhc3;->k()V

    return-void
.end method

.method public final k()V
    .registers 7

    iget-boolean v0, p0, Lhc3;->e:Z

    if-eqz v0, :cond_48

    iget-object v0, p0, Lhc3;->a:Ltn;

    iget-object v1, v0, Ltn;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    invoke-virtual {v1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_46

    iget-object v1, v0, Ltn;->b:Ljava/lang/Object;

    check-cast v1, Lpc3;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "BatteryStatusManagerBroadcastReceiverInBackground"

    sget-object v4, Li8;->h:Li8;

    invoke-virtual {v4, v3}, Llt8;->f(Ljava/lang/String;)Z

    move-result v3

    iget-boolean v4, v1, Lpc3;->e:Z

    if-eqz v3, :cond_39

    if-eqz v4, :cond_44

    sget-object v3, Lpc3;->f:Lr1j;

    new-instance v4, Loc3;

    const/4 v5, 0x1

    invoke-direct {v4, v1, v5}, Loc3;-><init>(Lpc3;B)V

    check-cast v3, Lorg/chromium/base/task/TaskRunnerImpl;

    invoke-virtual {v3, v4}, Lorg/chromium/base/task/TaskRunnerImpl;->r(Ljava/lang/Runnable;)V

    iput-boolean v2, v1, Lpc3;->e:Z

    goto :goto_44

    :cond_39
    if-eqz v4, :cond_44

    sget-object v3, Lt8;->a:Landroid/content/Context;

    iget-object v4, v1, Lpc3;->c:Lup1;

    invoke-virtual {v3, v4}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-boolean v2, v1, Lpc3;->e:Z

    :cond_44
    :goto_44
    iput-boolean v2, v0, Ltn;->a:Z

    :cond_46
    iput-boolean v2, p0, Lhc3;->e:Z

    :cond_48
    return-void
.end method
