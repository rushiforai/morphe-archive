.class public final Lbbk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Landroid/content/Intent;

.field public final c:Z

.field public d:Z

.field public final synthetic e:Lcbk;


# direct methods
.method public constructor <init>(Lcbk;Lcom/opera/android/BrowserActivity;Landroid/content/Intent;Z)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lbbk;->e:Lcbk;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lbbk;->a:Landroid/content/Context;

    iput-object p3, p0, Lbbk;->b:Landroid/content/Intent;

    iput-boolean p4, p0, Lbbk;->c:Z

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 14

    iget-boolean v0, p0, Lbbk;->d:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lbbk;->d:Z

    iget-boolean v0, p0, Lbbk;->c:Z

    if-eqz v0, :cond_58

    sget v0, Lcom/opera/android/BrowserRestartActivity;->a:I

    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object v0

    invoke-static {v0}, Lg8;->R(Landroid/app/ActivityOptions;)V

    iget-object v1, p0, Lbbk;->b:Landroid/content/Intent;

    new-instance v2, Landroid/content/Intent;

    if-eqz v1, :cond_22

    invoke-direct {v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    goto :goto_25

    :cond_22
    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    :goto_25
    iget-object v1, p0, Lbbk;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-class v4, Lcom/opera/android/BrowserRestartActivity;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v3, 0x10000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const/high16 v3, 0x44000000    # 512.0f

    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    const/4 v4, 0x0

    invoke-static {v1, v4, v2, v3, v0}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;)Landroid/app/PendingIntent;

    move-result-object v5

    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object v0

    invoke-static {v0}, Lg8;->Q(Landroid/app/ActivityOptions;)V

    :try_start_4b
    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v12

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v5 .. v12}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;Landroid/app/PendingIntent$OnFinished;Landroid/os/Handler;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_58
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_4b .. :try_end_58} :catch_58

    :catch_58
    :cond_58
    :goto_58
    sget-object v0, Lngh;->d:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    if-eqz v0, :cond_66

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_58

    :cond_66
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    iget-object p0, p0, Lbbk;->e:Lcbk;

    const/4 v0, 0x0

    iput-object v0, p0, Lcbk;->e:Ljava/lang/Object;

    return-void
.end method

.method public final run()V
    .registers 1

    invoke-virtual {p0}, Lbbk;->a()V

    return-void
.end method
