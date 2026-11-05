.class public Le/e/a/m1;
.super Ljava/util/TimerTask;
.source ""


# instance fields
.field public a:I

.field public final synthetic b:Lcom/sauzask/nicoid/NicoidVideoFragment;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V
    .registers 2

    iput-object p1, p0, Le/e/a/m1;->b:Lcom/sauzask/nicoid/NicoidVideoFragment;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    const/4 p1, -0x1

    iput p1, p0, Le/e/a/m1;->a:I

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Le/e/a/m1;->b:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 1
    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H0:Z

    if-eqz v1, :cond_7

    return-void

    .line 2
    :cond_7
    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Q1:Z

    if-nez v1, :cond_13

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v1}, Le/e/a/PlayerControlsDock;->enabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 3
    :cond_13
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getCurrentPosition()J

    move-result-wide v0

    long-to-int v1, v0

    iput v1, p0, Le/e/a/m1;->a:I

    goto :goto_20

    :cond_1d
    const/4 v0, -0x1

    iput v0, p0, Le/e/a/m1;->a:I

    :goto_20
    iget-object v0, p0, Le/e/a/m1;->b:Lcom/sauzask/nicoid/NicoidVideoFragment;

    .line 4
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y:Landroid/os/Handler;

    if-eqz v0, :cond_2e

    .line 5
    new-instance v1, Le/e/a/m1$a;

    invoke-direct {v1, p0}, Le/e/a/m1$a;-><init>(Le/e/a/m1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_2e
    return-void
.end method
