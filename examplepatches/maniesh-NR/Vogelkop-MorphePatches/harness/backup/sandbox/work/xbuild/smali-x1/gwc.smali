.class public final synthetic Lgwc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lja2;


# direct methods
.method public synthetic constructor <init>(Lja2;B)V
    .registers 3

    iput-byte p2, p0, Lgwc;->a:B

    iput-object p1, p0, Lgwc;->b:Lja2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lgwc;->a:B

    iget-object p0, p0, Lgwc;->b:Lja2;

    packed-switch p1, :pswitch_data_38

    check-cast p0, Lp6o;

    iget-object p0, p0, Lp6o;->f:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_f
    check-cast p0, Lkwc;

    iget-object p0, p0, Lkwc;->d:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_17
    check-cast p0, Ljwc;

    iget-object p0, p0, Ljwc;->f:Lvse;

    invoke-virtual {p0}, Lvse;->run()V

    return-void

    :pswitch_1f
    check-cast p0, Liwc;

    iget-object p0, p0, Lkwc;->d:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_27
    check-cast p0, Lfwc;

    iget-object p0, p0, Lfwc;->f:Lvse;

    invoke-virtual {p0}, Lvse;->run()V

    return-void

    :pswitch_2f
    check-cast p0, Lfwc;

    iget-object p0, p0, Lfwc;->e:Luse;

    invoke-virtual {p0}, Luse;->run()V

    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_27
        :pswitch_1f
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method
