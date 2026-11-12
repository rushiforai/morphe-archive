.class public final synthetic Leqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llqn;


# direct methods
.method public synthetic constructor <init>(Llqn;B)V
    .registers 3

    iput-byte p2, p0, Leqn;->a:B

    iput-object p1, p0, Leqn;->b:Llqn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 11

    iget-byte v0, p0, Leqn;->a:B

    iget-object v1, p0, Leqn;->b:Llqn;

    packed-switch v0, :pswitch_data_64

    new-instance v0, Lxw;

    iget-object v3, p0, Leqn;->b:Llqn;

    iget-object p0, v3, Llqn;->w:Lvsn;

    iget-object p0, p0, Lvsn;->q:Lwnm;

    invoke-static {p0}, Lxf8;->B(Likc;)Ltsd;

    move-result-object p0

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltsn;

    iget-object p0, p0, Ltsn;->a:Lzm9;

    iget-object p0, p0, Lzm9;->e:Ljava/lang/Object;

    check-cast p0, Lssn;

    new-instance v1, Llrk;

    const/4 v7, 0x0

    const/16 v8, 0x14

    const/4 v2, 0x1

    const-class v4, Llqn;

    const-string v5, "onMenuItemClick"

    const-string v6, "onMenuItemClick(Landroid/view/MenuItem;)Z"

    invoke-direct/range {v1 .. v8}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    const/16 v2, 0xc

    invoke-direct {v0, p0, v1, v2}, Lxw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lo73;->p(Landroid/view/View;)V

    return-void

    :pswitch_37
    iget-object p0, v1, Llqn;->w:Lvsn;

    iget-object p1, p0, Lvsn;->c:Ls62;

    invoke-virtual {p1}, Ls62;->f()Lqyj;

    move-result-object v0

    invoke-virtual {v0}, Lqyj;->f()V

    invoke-virtual {v0}, Lqyj;->m()V

    invoke-virtual {p1}, Ls62;->c()Lp62;

    move-result-object p1

    sget-object v0, Lt52;->k:Lt52;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lp62;->a(Lwyh;Lm62;)V

    iget-object p0, p0, Lvsn;->k:Lg7m;

    sget-object p1, Ll60;->c:Ll60;

    invoke-virtual {p0, p1}, Lg7m;->c(Ll60;)V

    return-void

    :pswitch_57
    invoke-virtual {v1}, Llqn;->K0()V

    return-void

    :pswitch_5b
    iget-object p0, v1, Llqn;->w:Lvsn;

    sget-object p1, Lb80;->d:Lb80;

    invoke-virtual {p0, p1}, Lvsn;->k(Lb80;)V

    return-void

    nop

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_5b
        :pswitch_57
        :pswitch_37
    .end packed-switch
.end method
