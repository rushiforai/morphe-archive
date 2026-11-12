.class public final Lz89;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Z)V
    .registers 4

    iput-byte p1, p0, Lz89;->a:B

    iput-object p2, p0, Lz89;->d:Ljava/lang/Object;

    iput-boolean p3, p0, Lz89;->c:Z

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    iget-byte p1, p0, Lz89;->a:B

    packed-switch p1, :pswitch_data_e

    const/4 p1, 0x1

    iput-boolean p1, p0, Lz89;->b:Z

    return-void

    :pswitch_9
    const/4 p1, 0x1

    iput-boolean p1, p0, Lz89;->b:Z

    return-void

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 6

    iget-byte p1, p0, Lz89;->a:B

    const/4 v0, 0x4

    iget-boolean v1, p0, Lz89;->c:Z

    const/4 v2, 0x0

    iget-object v3, p0, Lz89;->d:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_42

    check-cast v3, Lcom/opera/android/widget/ThumbScroller;

    iput-object v2, v3, Lcom/opera/android/widget/ThumbScroller;->c:Landroid/view/ViewPropertyAnimator;

    iget-boolean p0, p0, Lz89;->b:Z

    if-nez p0, :cond_2b

    iget-object p0, v3, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    iget-object p0, v3, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    if-eqz v1, :cond_28

    iget-object p0, v3, Lcom/opera/android/widget/ThumbScroller;->p:Lcbl;

    const-wide/16 v0, 0x190

    invoke-virtual {v3, p0, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_2b

    :cond_28
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_2b
    :goto_2b
    return-void

    :pswitch_2c
    check-cast v3, Lc99;

    const/4 p1, 0x0

    iput-byte p1, v3, Lc99;->q:B

    iput-object v2, v3, Lc99;->l:Landroid/animation/Animator;

    iget-boolean p0, p0, Lz89;->b:Z

    if-nez p0, :cond_40

    iget-object p0, v3, Lc99;->r:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    if-eqz v1, :cond_3d

    const/16 v0, 0x8

    :cond_3d
    invoke-virtual {p0, v0, v1}, Lsan;->a(IZ)V

    :cond_40
    return-void

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_2c
    .end packed-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 6

    iget-byte v0, p0, Lz89;->a:B

    packed-switch v0, :pswitch_data_1e

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    return-void

    :pswitch_9
    iget-object v0, p0, Lz89;->d:Ljava/lang/Object;

    check-cast v0, Lc99;

    iget-object v1, v0, Lc99;->r:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-boolean v2, p0, Lz89;->c:Z

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Lsan;->a(IZ)V

    const/4 v1, 0x1

    iput-byte v1, v0, Lc99;->q:B

    iput-object p1, v0, Lc99;->l:Landroid/animation/Animator;

    iput-boolean v3, p0, Lz89;->b:Z

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
