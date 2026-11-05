.class public final Le/e/a/QueueMenu119;
.super Ljava/lang/Object;
.source "QueueMenu119.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static install(Ljava/lang/Object;Landroid/view/Menu;)V
    .registers 4

    .line 3
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_15

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Le/e/a/QueueMenu119$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Le/e/a/QueueMenu119$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Object;Landroid/view/Menu;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_15
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Landroid/view/Menu;)V
    .registers 3

    .line 3
    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-static {p0, p1}, Le/e/a/DownloadUi115;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    invoke-static {p0, p1}, Le/e/a/MenuOptions119;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    :cond_14
    return-void
.end method
