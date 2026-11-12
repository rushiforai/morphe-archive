.class public final synthetic Ls78;
.super Lkr;
.source "SourceFile"

# interfaces
.implements Lfr9;


# virtual methods
.method public final k(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    check-cast p1, Lh78;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    check-cast p3, Lz88;

    check-cast p4, Ljava/lang/Boolean;

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    check-cast p5, Ldef;

    check-cast p6, Lmt5;

    iget-object p0, p0, Lkr;->a:Ljava/lang/Object;

    check-cast p0, Ln78;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x3

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p6

    instance-of v0, p3, Lx88;

    const/4 v1, 0x0

    if-nez v0, :cond_b2

    if-eqz p4, :cond_b2

    new-instance p4, Lrxh;

    const v0, 0x7f1406c9

    invoke-direct {p4, v0}, Lrxh;-><init>(I)V

    filled-new-array {p4}, [Ljava/lang/Object;

    move-result-object p4

    new-instance v6, Lsxh;

    const v0, 0x7f1406cf

    invoke-direct {v6, v0, p4}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    invoke-virtual {p5}, Ljava/lang/Enum;->ordinal()I

    move-result p4

    if-eqz p4, :cond_9d

    const/4 p5, 0x1

    if-eq p4, p5, :cond_77

    const/4 p5, 0x2

    if-eq p4, p5, :cond_4d

    if-eq p4, p0, :cond_77

    invoke-static {}, Lh9o;->p()V

    return-object v1

    :cond_4d
    new-instance v2, Lk78;

    new-instance v3, Lrxh;

    const p4, 0x7f1406c8

    invoke-direct {v3, p4}, Lrxh;-><init>(I)V

    filled-new-array {p6, p6}, [Ljava/lang/Object;

    move-result-object p4

    new-instance v4, Ltxh;

    const p5, 0x7f120032

    invoke-direct {v4, p4, p5, p0}, Ltxh;-><init>([Ljava/lang/Object;II)V

    new-instance v5, Lrxh;

    const p0, 0x7f1406c5

    invoke-direct {v5, p0}, Lrxh;-><init>(I)V

    new-instance v7, Lrxh;

    const p0, 0x7f1406c3

    invoke-direct {v7, p0}, Lrxh;-><init>(I)V

    invoke-direct/range {v2 .. v7}, Lk78;-><init>(Lrxh;Lpxh;Lrxh;Lsxh;Lrxh;)V

    goto :goto_9e

    :cond_77
    new-instance v2, Lk78;

    new-instance v3, Lrxh;

    const p0, 0x7f140bdf

    invoke-direct {v3, p0}, Lrxh;-><init>(I)V

    new-instance v4, Lrxh;

    const p0, 0x7f140bde

    invoke-direct {v4, p0}, Lrxh;-><init>(I)V

    new-instance v5, Lrxh;

    const p0, 0x7f1406c6

    invoke-direct {v5, p0}, Lrxh;-><init>(I)V

    new-instance v7, Lrxh;

    const p0, 0x7f1403b5

    invoke-direct {v7, p0}, Lrxh;-><init>(I)V

    invoke-direct/range {v2 .. v7}, Lk78;-><init>(Lrxh;Lpxh;Lrxh;Lsxh;Lrxh;)V

    goto :goto_9e

    :cond_9d
    move-object v2, v1

    :goto_9e
    if-eqz v2, :cond_b2

    new-instance p0, Li78;

    new-instance p3, Lqxh;

    const-string p4, ""

    invoke-direct {p3, p4}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    const/4 p4, 0x4

    invoke-static {p1, p3, p4}, Lh78;->a(Lh78;Lpxh;I)Lh78;

    move-result-object p1

    invoke-direct {p0, p1, v2, p2}, Li78;-><init>(Lh78;Lm78;Z)V

    return-object p0

    :cond_b2
    sget-object p0, Lx88;->a:Lx88;

    invoke-static {p3, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_c2

    new-instance p0, Li78;

    sget-object p3, Ll78;->a:Ll78;

    invoke-direct {p0, p1, p3, p2}, Li78;-><init>(Lh78;Lm78;Z)V

    return-object p0

    :cond_c2
    instance-of p0, p3, Lw88;

    if-eqz p0, :cond_e8

    new-instance p0, Li78;

    new-instance p4, Lj78;

    check-cast p3, Lw88;

    iget p5, p3, Lw88;->a:I

    iget-object p3, p3, Lw88;->b:Ljava/lang/String;

    invoke-static {p5, p3}, Ln78;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p3

    new-instance p5, Lqxh;

    invoke-direct {p5, p3}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    new-instance p3, Lrxh;

    const p6, 0x7f140d2b

    invoke-direct {p3, p6}, Lrxh;-><init>(I)V

    invoke-direct {p4, p5, p3}, Lj78;-><init>(Lqxh;Lrxh;)V

    invoke-direct {p0, p1, p4, p2}, Li78;-><init>(Lh78;Lm78;Z)V

    return-object p0

    :cond_e8
    instance-of p0, p3, Ly88;

    if-eqz p0, :cond_10e

    new-instance p0, Li78;

    new-instance p4, Lj78;

    check-cast p3, Ly88;

    iget p5, p3, Ly88;->a:I

    iget-object p3, p3, Ly88;->b:Ljava/lang/String;

    invoke-static {p5, p3}, Ln78;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p3

    new-instance p5, Lqxh;

    invoke-direct {p5, p3}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    new-instance p3, Lrxh;

    const p6, 0x7f140113

    invoke-direct {p3, p6}, Lrxh;-><init>(I)V

    invoke-direct {p4, p5, p3}, Lj78;-><init>(Lqxh;Lrxh;)V

    invoke-direct {p0, p1, p4, p2}, Li78;-><init>(Lh78;Lm78;Z)V

    return-object p0

    :cond_10e
    invoke-static {}, Lh9o;->p()V

    return-object v1
.end method
