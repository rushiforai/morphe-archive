.class public final synthetic Lgw8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Liw8;


# direct methods
.method public synthetic constructor <init>(Liw8;B)V
    .registers 3

    iput-byte p2, p0, Lgw8;->a:B

    iput-object p1, p0, Lgw8;->b:Liw8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Lgw8;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lgw8;->b:Liw8;

    packed-switch p1, :pswitch_data_42

    iget-object p1, p0, Lnv9;->k:Lnrl;

    iget-object v1, p0, Lnv9;->l:Ljava/lang/Object;

    iput-boolean v0, p1, Lnrl;->a:Z

    iget-object p1, p1, Lnrl;->b:Ljava/lang/Object;

    check-cast p1, Lqp5;

    invoke-interface {p1, v1}, Lqp5;->accept(Ljava/lang/Object;)V

    iget-object p1, p0, Liw8;->r:Lbw8;

    invoke-virtual {p1}, Lbw8;->s0()V

    iget-object p1, p0, Liw8;->o:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Liw8;->p:Lsz4;

    iget-object v1, p0, Liw8;->q:Loi;

    new-instance v2, Ldg7;

    const/16 v3, 0xf

    invoke-direct {v2, p0, v3}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v0, v1, v2}, Lyi4;->R(Landroid/content/Context;Lsz4;Loi;Lcom/opera/api/Callback;)V

    return-void

    :pswitch_2b
    iget-object p1, p0, Lnv9;->k:Lnrl;

    iget-object v1, p0, Lnv9;->m:Ljava/lang/Object;

    iput-boolean v0, p1, Lnrl;->a:Z

    iget-object p1, p1, Lnrl;->b:Ljava/lang/Object;

    check-cast p1, Lqp5;

    invoke-interface {p1, v1}, Lqp5;->accept(Ljava/lang/Object;)V

    iget-object p1, p0, Liw8;->r:Lbw8;

    invoke-virtual {p1}, Lbw8;->s0()V

    invoke-virtual {p0}, Lnv9;->w()V

    return-void

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method
