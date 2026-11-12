.class public final synthetic Lvpm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljl6;


# direct methods
.method public synthetic constructor <init>(Ljl6;B)V
    .registers 3

    iput-byte p2, p0, Lvpm;->a:B

    iput-object p1, p0, Lvpm;->b:Ljl6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 2

    iget-byte p1, p0, Lvpm;->a:B

    iget-object p0, p0, Lvpm;->b:Ljl6;

    packed-switch p1, :pswitch_data_10

    invoke-virtual {p0}, Ljl6;->r()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Ljl6;->r()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
