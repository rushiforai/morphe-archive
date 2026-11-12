.class public final synthetic Lfqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmqn;


# direct methods
.method public synthetic constructor <init>(Lmqn;B)V
    .registers 3

    iput-byte p2, p0, Lfqn;->a:B

    iput-object p1, p0, Lfqn;->b:Lmqn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lfqn;->a:B

    iget-object p0, p0, Lfqn;->b:Lmqn;

    packed-switch p1, :pswitch_data_1e

    iget-object p0, p0, Llqn;->w:Lvsn;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_d
    iget-object p1, p0, Lmqn;->T:Lvl6;

    if-nez p1, :cond_12

    const/4 p1, 0x0

    :cond_12
    invoke-virtual {p1}, Lvl6;->S()Z

    iget-object p0, p0, Llqn;->w:Lvsn;

    iget-object p0, p0, Lvsn;->h:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
