.class public final synthetic Lbal;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgal;


# direct methods
.method public synthetic constructor <init>(Lgal;B)V
    .registers 3

    iput-byte p2, p0, Lbal;->a:B

    iput-object p1, p0, Lbal;->b:Lgal;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 3

    iget-byte v0, p0, Lbal;->a:B

    iget-object p0, p0, Lbal;->b:Lgal;

    packed-switch v0, :pswitch_data_26

    iget-object v0, p0, Lgal;->g:Lpde;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lgal;->d()V

    return-void

    :pswitch_16
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Lgal;->f:F

    invoke-virtual {p0}, Lgal;->e()V

    return-void

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
