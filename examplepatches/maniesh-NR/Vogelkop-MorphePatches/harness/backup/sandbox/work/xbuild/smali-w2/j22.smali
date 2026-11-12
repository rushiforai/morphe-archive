.class public final synthetic Lj22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwim;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lj22;->a:B

    iput-object p1, p0, Lj22;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Z)V
    .registers 6

    iget-byte v0, p0, Lj22;->a:B

    iget-object p0, p0, Lj22;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_66

    check-cast p0, Lhi7;

    sget-wide v0, Lhi7;->t:J

    iget-object v2, p0, Lhi7;->e:Ligi;

    iget-object v2, v2, Ligi;->b:Ljava/lang/Object;

    check-cast v2, Landroid/widget/FrameLayout;

    if-eqz p1, :cond_32

    new-instance p1, Lki5;

    const/16 v3, 0x13

    invoke-direct {p1, v3}, Lki5;-><init>(B)V

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-virtual {v2, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    new-instance v0, Lai7;

    invoke-direct {v0, p0, p1}, Lai7;-><init>(Lhi7;Lki5;)V

    invoke-virtual {v2, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    goto :goto_4b

    :cond_32
    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    new-instance v0, Lai7;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lai7;-><init>(Lhi7;B)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    :goto_4b
    return-void

    :pswitch_4c
    check-cast p0, Lx22;

    if-eqz p1, :cond_65

    iget-object p0, p0, Lx22;->n:Lr22;

    if-eqz p0, :cond_65

    invoke-virtual {p0}, Lr22;->g()Lvsn;

    move-result-object p0

    if-eqz p0, :cond_65

    iget-object p0, p0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->f()Lqyj;

    move-result-object p0

    if-eqz p0, :cond_65

    invoke-virtual {p0}, Lqyj;->f()V

    :cond_65
    return-void

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_4c
    .end packed-switch
.end method
