.class public final Lci8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llig;


# instance fields
.field public final synthetic a:Lp12;


# direct methods
.method public constructor <init>(Lp12;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lci8;->a:Lp12;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 3

    iget-object p0, p0, Lci8;->a:Lp12;

    iget-object p0, p0, Lp12;->g:Ljava/lang/Object;

    check-cast p0, Lkze;

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1e

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1b

    const/4 v0, 0x3

    if-eq p1, v0, :cond_18

    const/4 v0, 0x4

    if-eq p1, v0, :cond_15

    sget-object p1, Lag2;->a:Lag2;

    goto :goto_20

    :cond_15
    sget-object p1, Lag2;->d:Lag2;

    goto :goto_20

    :cond_18
    sget-object p1, Lag2;->c:Lag2;

    goto :goto_20

    :cond_1b
    sget-object p1, Lag2;->b:Lag2;

    goto :goto_20

    :cond_1e
    sget-object p1, Lag2;->a:Lag2;

    :goto_20
    invoke-static {p0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(J)V
    .registers 3

    iget-object p0, p0, Lci8;->a:Lp12;

    iget-object p0, p0, Lp12;->d:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method

.method public final d(ZZ)V
    .registers 3

    iget-object p0, p0, Lci8;->a:Lp12;

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lkze;

    if-eqz p2, :cond_10

    if-eqz p1, :cond_d

    sget-object p1, Lzf2;->b:Lzf2;

    goto :goto_12

    :cond_d
    sget-object p1, Lzf2;->a:Lzf2;

    goto :goto_12

    :cond_10
    sget-object p1, Lzf2;->c:Lzf2;

    :goto_12
    invoke-static {p0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method

.method public final e(J)V
    .registers 3

    iget-object p0, p0, Lci8;->a:Lp12;

    iget-object p0, p0, Lp12;->c:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method

.method public final i(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .registers 3

    iget-object p0, p0, Lci8;->a:Lp12;

    iget-object p1, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p1, Lkze;

    iget-object p0, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Lmig;

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->g()Lqjd;

    move-result-object p0

    if-eqz p0, :cond_17

    iget-object p0, p0, Lqjd;->e:Lvjd;

    goto :goto_19

    :cond_17
    sget-object p0, Lvjd;->K:Lvjd;

    :goto_19
    invoke-static {p1, p0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method

.method public final j(ZZZ)V
    .registers 5

    iget-object p0, p0, Lci8;->a:Lp12;

    iget-object p0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast p0, Lkze;

    new-instance v0, Lbg2;

    invoke-direct {v0, p1, p2, p3}, Lbg2;-><init>(ZZZ)V

    invoke-static {p0, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method
