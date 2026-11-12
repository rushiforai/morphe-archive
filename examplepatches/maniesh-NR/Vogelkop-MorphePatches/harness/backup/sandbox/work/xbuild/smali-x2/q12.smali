.class public final synthetic Lq12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr12;


# direct methods
.method public synthetic constructor <init>(Lr12;B)V
    .registers 3

    iput-byte p2, p0, Lq12;->a:B

    iput-object p1, p0, Lq12;->b:Lr12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lq12;->a:B

    iget-object p0, p0, Lq12;->b:Lr12;

    packed-switch p1, :pswitch_data_20

    invoke-interface {p0}, Lr12;->e()V

    return-void

    :pswitch_b
    invoke-interface {p0}, Lr12;->d()V

    return-void

    :pswitch_f
    invoke-interface {p0}, Lr12;->f()V

    return-void

    :pswitch_13
    invoke-interface {p0}, Lr12;->b()V

    return-void

    :pswitch_17
    invoke-interface {p0}, Lr12;->a()V

    return-void

    :pswitch_1b
    invoke-interface {p0}, Lr12;->c()V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_17
        :pswitch_13
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
