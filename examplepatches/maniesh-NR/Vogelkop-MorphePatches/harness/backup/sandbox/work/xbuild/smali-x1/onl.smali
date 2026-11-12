.class public final Lonl;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/widget/ThumbScroller;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/widget/ThumbScroller;B)V
    .registers 3

    iput-byte p2, p0, Lonl;->a:B

    iput-object p1, p0, Lonl;->b:Lcom/opera/android/widget/ThumbScroller;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    iget-byte p1, p0, Lonl;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lonl;->b:Lcom/opera/android/widget/ThumbScroller;

    packed-switch p1, :pswitch_data_14

    iput-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->c:Landroid/view/ViewPropertyAnimator;

    return-void

    :pswitch_b
    sget p1, Lcom/opera/android/widget/ThumbScroller;->q:I

    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->e()V

    iput-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->c:Landroid/view/ViewPropertyAnimator;

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
