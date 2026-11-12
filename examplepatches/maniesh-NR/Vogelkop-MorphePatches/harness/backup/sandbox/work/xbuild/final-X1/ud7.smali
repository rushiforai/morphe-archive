.class public final Lud7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lud7;->a:B

    iput-object p1, p0, Lud7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final o(Z)V
    .registers 5

    iget-byte v0, p0, Lud7;->a:B

    iget-object p0, p0, Lud7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_84

    check-cast p0, Lpom;

    iget-object p1, p0, Lpom;->a:Landroid/content/Context;

    invoke-static {p1}, Lhom;->t(Landroid/content/Context;)Lhom;

    move-result-object p1

    invoke-virtual {p1}, Lno7;->c()Lsa2;

    move-result-object p1

    iget p1, p1, Lsa2;->b:I

    if-eqz p1, :cond_1d

    invoke-virtual {p0, p1}, Lpom;->T(I)V

    invoke-virtual {p0}, Lpom;->S()V

    :cond_1d
    return-void

    :pswitch_1e
    check-cast p0, Ldyf;

    if-nez p1, :cond_28

    invoke-virtual {p0}, Ldyf;->d()V

    invoke-virtual {p0}, Ldyf;->c()V

    :cond_28
    return-void

    :pswitch_29
    check-cast p0, Lp0c;

    invoke-virtual {p0}, Lp0c;->a()V

    return-void

    :pswitch_2f
    check-cast p0, Lwd7;

    iget-object p1, p0, Lwd7;->e:Ldj9;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcj9;

    iget-object p1, p1, Lcj9;->a:Ljava/lang/String;

    if-eqz p1, :cond_82

    iget-object p0, p0, Lwd7;->c:Lox3;

    invoke-virtual {p0}, Lox3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhd;

    iget-boolean v0, p0, Lhd;->b:Z

    if-eqz v0, :cond_82

    iget-object v0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast v0, Ly55;

    invoke-static {}, Ly55;->w()Lu56;

    move-result-object v1

    new-instance v2, Lzj0;

    invoke-direct {v2, v0, v1}, Lzj0;-><init>(Ly55;Lu56;)V

    const/16 v0, 0x8

    invoke-virtual {v1, v0, p1}, Lu56;->x(ILjava/lang/String;)V

    iget-object p1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p1, Lmgh;

    invoke-virtual {p1, v1}, Lmgh;->c(Ljf0;)Z

    move-result p1

    if-nez p1, :cond_82

    iget-object p1, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Lo5f;

    const/16 v1, 0x10

    invoke-direct {p1, p0, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    :cond_82
    return-void

    nop

    :pswitch_data_84
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_29
        :pswitch_1e
    .end packed-switch
.end method
