.class public final synthetic Leg2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgg2;


# direct methods
.method public synthetic constructor <init>(Lgg2;B)V
    .registers 3

    iput-byte p2, p0, Leg2;->a:B

    iput-object p1, p0, Leg2;->b:Lgg2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Leg2;->a:B

    const/16 v0, 0xa

    sget-object v1, Lli0;->f:Lli0;

    const/16 v2, 0x18

    iget-object p0, p0, Leg2;->b:Lgg2;

    packed-switch p1, :pswitch_data_118

    iget-object p1, p0, Lgg2;->y:Lz8b;

    iget-object p1, p1, Lz8b;->b:Ljava/lang/Object;

    check-cast p1, Lqb7;

    if-eqz p1, :cond_1e

    iget-object p1, p1, Lqb7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    sget-object v0, Ld90;->b:Ld90;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1e
    iget-object p1, p0, Lgg2;->B:Lbqj;

    invoke-virtual {p1}, Lbqj;->a()Z

    move-result p1

    if-eqz p1, :cond_31

    new-instance p1, Lvk1;

    const/16 v0, 0x14

    invoke-direct {p1, v0}, Lvk1;-><init>(B)V

    invoke-virtual {p0, p1}, Lgg2;->h(Lkotlin/jvm/functions/Function0;)V

    goto :goto_34

    :cond_31
    invoke-virtual {p0}, Lgg2;->i()V

    :goto_34
    return-void

    :pswitch_35
    sget-object p1, Lei7;->c:Lei7;

    new-instance v0, Lx2;

    invoke-direct {v0, p0, p1, v2}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lgg2;->h(Lkotlin/jvm/functions/Function0;)V

    iget-object p1, p0, Lgg2;->y:Lz8b;

    invoke-virtual {p1, v1}, Lz8b;->M(Lli0;)V

    sget-object p1, Lzlg;->e:Lzlg;

    invoke-virtual {p0, p1}, Lgg2;->k(Lzlg;)V

    return-void

    :pswitch_4a
    sget-object p1, Lei7;->c:Lei7;

    new-instance v0, Lx2;

    invoke-direct {v0, p0, p1, v2}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lgg2;->h(Lkotlin/jvm/functions/Function0;)V

    iget-object p1, p0, Lgg2;->y:Lz8b;

    invoke-virtual {p1, v1}, Lz8b;->M(Lli0;)V

    sget-object p1, Lzlg;->e:Lzlg;

    invoke-virtual {p0, p1}, Lgg2;->k(Lzlg;)V

    return-void

    :pswitch_5f
    iget-object p1, p0, Lgg2;->C:Lwl2;

    invoke-virtual {p1}, Lwl2;->a()V

    iget-object p1, p0, Lgg2;->z:Lp12;

    sget-object v1, Lpn7;->b:Lon7;

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    iget-object p1, p1, Lp12;->h:Ljava/lang/Object;

    check-cast p1, Lmig;

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-virtual {p1}, Lhkg;->c()Lgig;

    move-result-object v2

    invoke-interface {v2}, Lgig;->a0()J

    move-result-wide v2

    cmp-long v2, v0, v2

    if-nez v2, :cond_8a

    invoke-virtual {p1}, Lhkg;->c()Lgig;

    move-result-object p1

    invoke-interface {p1}, Lgig;->o0()V

    goto :goto_9b

    :cond_8a
    invoke-virtual {p1}, Lhkg;->c()Lgig;

    move-result-object v2

    invoke-interface {v2}, Lgig;->isCurrentWindowSeekable()Z

    move-result v2

    if-eqz v2, :cond_9b

    invoke-virtual {p1}, Lhkg;->c()Lgig;

    move-result-object p1

    invoke-static {p1, v0, v1}, Lmig;->f(Lgig;J)V

    :cond_9b
    :goto_9b
    iget-object p1, p0, Lgg2;->y:Lz8b;

    sget-object v0, Lli0;->b:Lli0;

    invoke-virtual {p1, v0}, Lz8b;->M(Lli0;)V

    sget-object p1, Lzlg;->c:Lzlg;

    invoke-virtual {p0, p1}, Lgg2;->k(Lzlg;)V

    return-void

    :pswitch_a8
    iget-object p1, p0, Lgg2;->C:Lwl2;

    invoke-virtual {p1}, Lwl2;->a()V

    iget-object p1, p0, Lgg2;->z:Lp12;

    sget-object v1, Lpn7;->b:Lon7;

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    iget-object p1, p1, Lp12;->h:Ljava/lang/Object;

    check-cast p1, Lmig;

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-virtual {p1}, Lhkg;->c()Lgig;

    move-result-object v2

    invoke-interface {v2}, Lgig;->s0()J

    move-result-wide v2

    cmp-long v2, v0, v2

    if-nez v2, :cond_d3

    invoke-virtual {p1}, Lhkg;->c()Lgig;

    move-result-object p1

    invoke-interface {p1}, Lgig;->p0()V

    goto :goto_e5

    :cond_d3
    invoke-virtual {p1}, Lhkg;->c()Lgig;

    move-result-object v2

    invoke-interface {v2}, Lgig;->isCurrentWindowSeekable()Z

    move-result v2

    if-eqz v2, :cond_e5

    invoke-virtual {p1}, Lhkg;->c()Lgig;

    move-result-object p1

    neg-long v0, v0

    invoke-static {p1, v0, v1}, Lmig;->f(Lgig;J)V

    :cond_e5
    :goto_e5
    iget-object p1, p0, Lgg2;->y:Lz8b;

    sget-object v0, Lli0;->c:Lli0;

    invoke-virtual {p1, v0}, Lz8b;->M(Lli0;)V

    sget-object p1, Lzlg;->d:Lzlg;

    invoke-virtual {p0, p1}, Lgg2;->k(Lzlg;)V

    return-void

    :pswitch_f2
    iget-object p1, p0, Lgg2;->C:Lwl2;

    invoke-virtual {p1}, Lwl2;->a()V

    iget-object p1, p0, Lgg2;->z:Lp12;

    iget-object p1, p1, Lp12;->h:Ljava/lang/Object;

    check-cast p1, Lmig;

    invoke-virtual {p1}, Lmig;->e()Z

    move-result p1

    iget-object v0, p0, Lgg2;->y:Lz8b;

    if-eqz p1, :cond_108

    sget-object v1, Lli0;->d:Lli0;

    goto :goto_10a

    :cond_108
    sget-object v1, Lli0;->e:Lli0;

    :goto_10a
    invoke-virtual {v0, v1}, Lz8b;->M(Lli0;)V

    if-eqz p1, :cond_112

    sget-object p1, Lzlg;->b:Lzlg;

    goto :goto_114

    :cond_112
    sget-object p1, Lzlg;->a:Lzlg;

    :goto_114
    invoke-virtual {p0, p1}, Lgg2;->k(Lzlg;)V

    return-void

    :pswitch_data_118
    .packed-switch 0x0
        :pswitch_f2
        :pswitch_a8
        :pswitch_5f
        :pswitch_4a
        :pswitch_35
    .end packed-switch
.end method
