.class public final synthetic Lcw8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lew8;


# direct methods
.method public synthetic constructor <init>(Lew8;B)V
    .registers 3

    iput-byte p2, p0, Lcw8;->a:B

    iput-object p1, p0, Lcw8;->b:Lew8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lcw8;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lcw8;->b:Lew8;

    packed-switch p1, :pswitch_data_48

    iget-object p1, p0, Lnv9;->k:Lnrl;

    iget-object v1, p0, Lnv9;->l:Ljava/lang/Object;

    iput-boolean v0, p1, Lnrl;->a:Z

    iget-object p1, p1, Lnrl;->b:Ljava/lang/Object;

    check-cast p1, Lqp5;

    invoke-interface {p1, v1}, Lqp5;->accept(Ljava/lang/Object;)V

    iget-object p1, p0, Lew8;->o:Ljue;

    iget-object v0, p1, Ljue;->d:Lkue;

    iget-object p1, p1, Ljue;->c:Lbwf;

    if-eqz p1, :cond_2e

    iget-object v1, v0, Lkue;->f:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_2e

    invoke-virtual {v0, p1}, Lkue;->a(I)V

    iget-object p1, p0, Lew8;->q:Lbw8;

    invoke-virtual {p1}, Lbw8;->s0()V

    :cond_2e
    invoke-virtual {p0}, Lnv9;->w()V

    return-void

    :pswitch_32
    iget-object p1, p0, Lnv9;->k:Lnrl;

    iget-object v1, p0, Lnv9;->m:Ljava/lang/Object;

    iput-boolean v0, p1, Lnrl;->a:Z

    iget-object p1, p1, Lnrl;->b:Ljava/lang/Object;

    check-cast p1, Lqp5;

    invoke-interface {p1, v1}, Lqp5;->accept(Ljava/lang/Object;)V

    iget-object p1, p0, Lew8;->q:Lbw8;

    invoke-virtual {p1}, Lbw8;->s0()V

    invoke-virtual {p0}, Lnv9;->w()V

    return-void

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_32
    .end packed-switch
.end method
