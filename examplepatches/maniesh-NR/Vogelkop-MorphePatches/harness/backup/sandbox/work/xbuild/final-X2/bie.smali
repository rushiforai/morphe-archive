.class public final Lbie;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzyk;

.field public b:Lksd;

.field public final c:Lphe;

.field public final d:Lzyk;

.field public final e:Lzyk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    sget-object v0, Lwjo;->b:Lwjo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lm53;

    invoke-direct {v0, p1, p2}, Lm53;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lbie;->a:Lzyk;

    sget-object p1, Lphe;->a:Ls16;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lphe;->b:Lphe;

    iput-object p1, p0, Lbie;->c:Lphe;

    new-instance p1, Lxhe;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lxhe;-><init>(Lbie;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lbie;->d:Lzyk;

    new-instance p1, Lxhe;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lxhe;-><init>(Lbie;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lbie;->e:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lkotlin/jvm/functions/Function1;)Lqhe;
    .registers 3

    invoke-virtual {p0}, Lbie;->b()Lo7p;

    move-result-object p0

    iget-object p0, p0, Lpxo;->d:Lvoo;

    check-cast p0, Ly2p;

    if-eqz p0, :cond_20

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsro;

    if-eqz p0, :cond_20

    new-instance p1, Lqhe;

    iget-object v0, p0, Lyjo;->b:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget-object p0, p0, Lsro;->f:Ltqo;

    invoke-direct {p1, v0, p0}, Lqhe;-><init>(Landroid/net/Uri;Ltqo;)V

    return-object p1

    :cond_20
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b()Lo7p;
    .registers 1

    iget-object p0, p0, Lbie;->a:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lo7p;

    return-object p0
.end method

.method public final c()Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Lbie;->b()Lo7p;

    move-result-object p0

    invoke-virtual {p0}, Lo7p;->j()Lc4p;

    move-result-object p0

    if-eqz p0, :cond_13

    iget-object p0, p0, Lc4p;->l:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_13
    const/4 p0, 0x0

    return-object p0
.end method

.method public final d()V
    .registers 4

    invoke-virtual {p0}, Lbie;->g()V

    invoke-virtual {p0}, Lbie;->b()Lo7p;

    move-result-object p0

    iget-object v0, p0, Lpxo;->e:Lbap;

    new-instance v1, Lu6p;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lu6p;-><init>(Lo7p;B)V

    invoke-virtual {v0, v1}, Lbap;->c(Lkotlin/jvm/functions/Function1;)Lbap;

    move-result-object v0

    iput-object v0, p0, Lpxo;->e:Lbap;

    return-void
.end method

.method public final e(Landroid/widget/FrameLayout;Ligi;)V
    .registers 9

    new-instance v2, Liko;

    invoke-direct {v2, p1}, Liko;-><init>(Landroid/widget/FrameLayout;)V

    sget-object v0, Lfko;->a:Lejo;

    invoke-static {p1}, Lfko;->b(Landroid/view/ViewGroup;)V

    invoke-virtual {p0}, Lbie;->b()Lo7p;

    move-result-object v1

    iget-object v4, p0, Lbie;->c:Lphe;

    iget-object p1, v1, Lpxo;->e:Lbap;

    new-instance v0, Lk48;

    const/4 v5, 0x3

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lk48;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p2, Lu6p;

    const/4 v2, 0x3

    invoke-direct {p2, v1, v2}, Lu6p;-><init>(Lo7p;B)V

    invoke-virtual {p1, v0, p2}, Lbap;->b(Lk48;Lu6p;)Lbap;

    move-result-object p1

    iput-object p1, v1, Lpxo;->e:Lbap;

    iget-object p1, v1, Lpxo;->e:Lbap;

    instance-of p1, p1, Lu9p;

    if-eqz p1, :cond_31

    iget-object p1, v3, Ligi;->b:Ljava/lang/Object;

    check-cast p1, Lksd;

    iput-object p1, p0, Lbie;->b:Lksd;

    :cond_31
    return-void
.end method

.method public final f()Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Lbie;->b()Lo7p;

    move-result-object p0

    invoke-virtual {p0}, Lo7p;->j()Lc4p;

    move-result-object p0

    if-eqz p0, :cond_13

    iget-object p0, p0, Lc4p;->o:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_13
    const/4 p0, 0x0

    return-object p0
.end method

.method public final g()V
    .registers 3

    invoke-virtual {p0}, Lbie;->b()Lo7p;

    move-result-object v0

    iget-object v1, v0, Lpxo;->e:Lbap;

    invoke-virtual {v1}, Lbap;->i()Lbap;

    move-result-object v1

    iput-object v1, v0, Lpxo;->e:Lbap;

    iget-object v0, p0, Lbie;->b:Lksd;

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    iput-object v1, v0, Lksd;->a:Landroid/widget/ImageView;

    iput-object v1, v0, Lksd;->b:Lzro;

    :cond_18
    iput-object v1, p0, Lbie;->b:Lksd;

    return-void
.end method
