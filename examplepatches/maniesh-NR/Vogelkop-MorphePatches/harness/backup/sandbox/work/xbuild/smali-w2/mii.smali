.class public final synthetic Lmii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvzk;


# direct methods
.method public synthetic constructor <init>(Lvzk;B)V
    .registers 3

    iput-byte p2, p0, Lmii;->a:B

    iput-object p1, p0, Lmii;->b:Lvzk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Lmii;->a:B

    iget-object p0, p0, Lmii;->b:Lvzk;

    packed-switch p1, :pswitch_data_46

    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Lnii;

    iget-boolean p1, p0, Lnii;->d:Z

    if-eqz p1, :cond_13

    invoke-virtual {p0}, Lnii;->a()V

    goto :goto_3c

    :cond_13
    iget-object v0, p0, Lnii;->c:Lvzk;

    if-nez p1, :cond_3c

    invoke-virtual {v0}, Lvzk;->r()V

    const/4 p1, 0x0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lvzk;->x(ZZ)V

    iget-object v0, p0, Lnii;->b:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lnii;->a:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v2, 0x12c

    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    sget-object v0, Lnii;->e:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    iput-boolean v1, p0, Lnii;->d:Z

    :cond_3c
    :goto_3c
    return-void

    :pswitch_3d
    iget-object p0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast p0, Lkii;

    invoke-virtual {p0}, Lkii;->run()V

    return-void

    nop

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_3d
    .end packed-switch
.end method
