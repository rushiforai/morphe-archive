.class public final synthetic Lvqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwqn;

.field public final synthetic c:Lrqn;


# direct methods
.method public synthetic constructor <init>(Lwqn;Lrqn;B)V
    .registers 4

    iput-byte p3, p0, Lvqn;->a:B

    iput-object p1, p0, Lvqn;->b:Lwqn;

    iput-object p2, p0, Lvqn;->c:Lrqn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lvqn;->a:B

    iget-object v0, p0, Lvqn;->c:Lrqn;

    iget-object p0, p0, Lvqn;->b:Lwqn;

    packed-switch p1, :pswitch_data_30

    iget-object p0, p0, Lwqn;->c:Lz4k;

    iget-object p1, v0, Lrqn;->a:Ljava/lang/String;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lmrn;

    iget-object p0, p0, Lmrn;->p:Lkrn;

    new-instance v0, Lfrn;

    invoke-direct {v0, p1}, Lfrn;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v0}, Lkrn;->f(Ltc2;)V

    return-void

    :pswitch_1c
    iget-object p0, p0, Lwqn;->c:Lz4k;

    iget-object p1, v0, Lrqn;->a:Ljava/lang/String;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lmrn;

    iget-object p0, p0, Lmrn;->p:Lkrn;

    new-instance v0, Lgrn;

    invoke-direct {v0, p1}, Lgrn;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v0}, Lkrn;->f(Ltc2;)V

    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method
