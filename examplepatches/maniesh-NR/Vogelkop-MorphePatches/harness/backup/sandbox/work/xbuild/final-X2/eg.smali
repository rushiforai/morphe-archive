.class public final synthetic Leg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxo8;


# direct methods
.method public synthetic constructor <init>(Lxo8;B)V
    .registers 3

    iput-byte p2, p0, Leg;->a:B

    iput-object p1, p0, Leg;->b:Lxo8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Leg;->a:B

    iget-object p0, p0, Leg;->b:Lxo8;

    packed-switch v0, :pswitch_data_40

    iget-object p0, p0, Lxo8;->c:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_16

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_16
    return-void

    :pswitch_17
    iget-object v0, p0, Lxo8;->c:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-wide v1, Lxo8;->k:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Leg;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Leg;-><init>(Lxo8;B)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    return-void

    :pswitch_36
    invoke-virtual {p0}, Lxo8;->a()V

    return-void

    :pswitch_3a
    sget-object v0, Lwo8;->a:Lwo8;

    invoke-virtual {p0, v0}, Lxo8;->c(Lwo8;)V

    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_3a
        :pswitch_36
        :pswitch_17
    .end packed-switch
.end method
