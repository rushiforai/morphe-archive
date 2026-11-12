.class public final Lz0f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field public final a:Lx5f;

.field public final b:Ltd2;

.field public c:I


# direct methods
.method public constructor <init>(Lumi;Lx5f;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lz0f;->a:Lx5f;

    new-instance p2, Ltd2;

    invoke-direct {p2, p1}, Ltd2;-><init>(Lumi;)V

    iput-object p2, p0, Lz0f;->b:Ltd2;

    return-void
.end method


# virtual methods
.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .registers 4

    iget v0, p0, Lz0f;->c:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lz0f;->c:I

    if-ne v0, v1, :cond_1c

    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    new-instance v0, Ly0f;

    iget-object v1, p0, Lz0f;->a:Lx5f;

    invoke-direct {v0, v1}, Ly0f;-><init>(Lx5f;)V

    iget-object p0, p0, Lz0f;->b:Ltd2;

    invoke-virtual {p0, p1, v0}, Ltd2;->a(Landroid/app/NotificationManager;Lfd2;)V

    :cond_1c
    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    iget p1, p0, Lz0f;->c:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lz0f;->c:I

    return-void
.end method
