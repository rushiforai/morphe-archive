.class public final synthetic Lbwk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcwk;


# direct methods
.method public synthetic constructor <init>(Lcwk;B)V
    .registers 3

    iput-byte p2, p0, Lbwk;->a:B

    iput-object p1, p0, Lbwk;->b:Lcwk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lbwk;->a:B

    iget-object p0, p0, Lbwk;->b:Lcwk;

    packed-switch v0, :pswitch_data_36

    iget-object v0, p0, Lcwk;->b:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lbwk;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lbwk;-><init>(Lcwk;B)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lcwk;->o:Ls03;

    if-eqz v0, :cond_2e

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 v1, 0x1

    iput-boolean v1, v0, Ls03;->b:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcwk;->o:Ls03;

    :cond_2e
    return-void

    :pswitch_2f
    iget-object p0, p0, Lcwk;->b:Landroid/view/View;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2f
    .end packed-switch
.end method
