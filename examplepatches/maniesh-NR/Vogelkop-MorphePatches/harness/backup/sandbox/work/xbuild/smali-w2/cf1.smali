.class public final Lcf1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lvkd;ZLtjg;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lcf1;->a:B

    iput-boolean p2, p0, Lcf1;->b:Z

    iput-object p3, p0, Lcf1;->c:Ljava/lang/Object;

    iput-object p1, p0, Lcf1;->d:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(ZLandroid/view/View;Ljava/lang/Object;B)V
    .registers 5

    .line 13
    iput-byte p4, p0, Lcf1;->a:B

    iput-boolean p1, p0, Lcf1;->b:Z

    iput-object p2, p0, Lcf1;->c:Ljava/lang/Object;

    iput-object p3, p0, Lcf1;->d:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 4

    iget-byte v0, p0, Lcf1;->a:B

    packed-switch v0, :pswitch_data_28

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    return-void

    :pswitch_9
    iget-object p1, p0, Lcf1;->d:Ljava/lang/Object;

    check-cast p1, Luh7;

    iget v0, p1, Luh7;->a:F

    iget-object v1, p0, Lcf1;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    iget-boolean p0, p0, Lcf1;->b:Z

    if-eqz p0, :cond_27

    iget p0, p1, Luh7;->c:F

    invoke-virtual {v1, p0}, Landroid/view/View;->setTranslationZ(F)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleY(F)V

    iget p0, p1, Luh7;->b:F

    invoke-virtual {v1, p0}, Landroid/view/View;->setAlpha(F)V

    :cond_27
    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 6

    iget-byte p1, p0, Lcf1;->a:B

    iget-boolean v0, p0, Lcf1;->b:Z

    const/4 v1, 0x0

    iget-object v2, p0, Lcf1;->d:Ljava/lang/Object;

    iget-object p0, p0, Lcf1;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_44

    check-cast v2, Lvkd;

    iget-object p1, v2, Lvkd;->c:Landroid/view/View;

    const v3, 0x7f0a0679

    invoke-virtual {p1, v3, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    if-eqz v0, :cond_1f

    check-cast p0, Ltjg;

    iget-object p1, v2, Lvkd;->f:Lsjg;

    invoke-virtual {p0, p1}, Ltjg;->j(Lsjg;)V

    :cond_1f
    iget-object p0, v2, Lvkd;->b:Landroid/view/ViewGroup;

    iget-object p1, v2, Lvkd;->e:Lcom/opera/android/media/MediaPlayerMini;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void

    :pswitch_27
    check-cast v2, Landroid/view/View;

    if-nez v0, :cond_3a

    check-cast p0, Landroid/view/View;

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    const/high16 p0, 0x3f800000    # 1.0f

    invoke-virtual {v2, p0}, Landroid/view/View;->setAlpha(F)V

    const/4 p0, 0x0

    invoke-virtual {v2, p0}, Landroid/view/View;->setVisibility(I)V

    :cond_3a
    return-void

    :pswitch_3b
    check-cast p0, Landroid/view/View;

    const p1, 0x7f0a0b4a

    invoke-virtual {p0, p1, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    return-void

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_3b
        :pswitch_27
    .end packed-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 3

    iget-byte v0, p0, Lcf1;->a:B

    packed-switch v0, :pswitch_data_22

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    return-void

    :pswitch_9
    iget-object p1, p0, Lcf1;->d:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    iget-boolean v0, p0, Lcf1;->b:Z

    if-eqz v0, :cond_21

    iget-object p0, p0, Lcf1;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    const/4 p0, 0x4

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    :cond_21
    return-void

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
