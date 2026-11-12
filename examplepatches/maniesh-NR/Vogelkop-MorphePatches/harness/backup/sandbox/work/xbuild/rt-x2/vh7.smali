.class public final synthetic Lvh7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxh7;


# direct methods
.method public synthetic constructor <init>(Lxh7;B)V
    .registers 3

    iput-byte p2, p0, Lvh7;->a:B

    iput-object p1, p0, Lvh7;->b:Lxh7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 2

    iget-byte p1, p0, Lvh7;->a:B

    iget-object p0, p0, Lvh7;->b:Lxh7;

    packed-switch p1, :pswitch_data_18

    invoke-virtual {p0}, Lxh7;->c()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lxh7;->c()V

    return-void

    :pswitch_f
    invoke-virtual {p0}, Lxh7;->c()V

    return-void

    :pswitch_13
    invoke-virtual {p0}, Lxh7;->c()V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_13
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
