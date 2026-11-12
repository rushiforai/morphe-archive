.class public final synthetic Lxaf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/bar/OmniButtonView;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/bar/OmniButtonView;B)V
    .registers 3

    iput-byte p2, p0, Lxaf;->a:B

    iput-object p1, p0, Lxaf;->b:Lcom/opera/android/bar/OmniButtonView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 2

    iget-byte p1, p0, Lxaf;->a:B

    iget-object p0, p0, Lxaf;->b:Lcom/opera/android/bar/OmniButtonView;

    packed-switch p1, :pswitch_data_14

    sget p1, Lcom/opera/android/bar/OmniButtonView;->m:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_d
    sget p1, Lcom/opera/android/bar/OmniButtonView;->m:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
