.class public final synthetic Lhg2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj3d;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lhg2;->a:B

    iput-object p1, p0, Lhg2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lhg2;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lhg2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_82

    check-cast p0, Locn;

    check-cast p1, Lp2d;

    iget-object v0, p0, Locn;->a:Lncn;

    invoke-virtual {v0, p1}, Lncn;->o(Lp2d;)Z

    invoke-virtual {p0}, Locn;->T()V

    iget-object p1, v0, Lf3d;->a:Lp2d;

    if-eqz p1, :cond_38

    iget p1, p0, Locn;->g:I

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    if-eqz p1, :cond_35

    if-eq p1, v1, :cond_2f

    const/4 v0, 0x2

    if-eq p1, v0, :cond_29

    const/4 v0, 0x3

    if-eq p1, v0, :cond_35

    goto :goto_38

    :cond_29
    sget-object p1, Locn;->k:Lk2d;

    invoke-virtual {p0, p1}, Locn;->S(Lk2d;)V

    goto :goto_38

    :cond_2f
    sget-object p1, Locn;->m:Lk2d;

    invoke-virtual {p0, p1}, Locn;->S(Lk2d;)V

    goto :goto_38

    :cond_35
    const/4 p1, 0x0

    iput-object p1, p0, Locn;->h:Lk2d;

    :cond_38
    :goto_38
    return-void

    :pswitch_39
    check-cast p0, Llvk;

    check-cast p1, Lp2d;

    invoke-virtual {p0, p1}, Llvk;->o(Lp2d;)Z

    return-void

    :pswitch_41
    check-cast p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

    check-cast p1, Lp2d;

    sget-object v0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->p:Lrxh;

    new-instance v0, Lf3d;

    invoke-direct {v0}, Lf3d;-><init>()V

    invoke-virtual {v0, p1}, Lf3d;->o(Lp2d;)Z

    iget-object p1, v0, Lf3d;->b:Lp3d;

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iput-object v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->j:Lf3d;

    iput-object v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->i:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v2}, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->a(Z)V

    iget-boolean p1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->n:Z

    if-eqz p1, :cond_72

    iput-boolean v2, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->n:Z

    iget-object p1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->j:Lf3d;

    if-eqz p1, :cond_70

    invoke-virtual {p1, v2}, Lf3d;->p(I)V

    invoke-virtual {p1}, Lf3d;->k()V

    goto :goto_72

    :cond_70
    iput-boolean v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->n:Z

    :cond_72
    :goto_72
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_76
    check-cast p0, Lig2;

    check-cast p1, Lp2d;

    invoke-virtual {p0, p1}, Lig2;->o(Lp2d;)Z

    invoke-virtual {p0}, Lf3d;->invalidateSelf()V

    return-void

    nop

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_76
        :pswitch_41
        :pswitch_39
    .end packed-switch
.end method
