.class public final Lfra;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll4c;


# direct methods
.method public constructor <init>(Ll4c;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lfra;->a:Ljava/lang/String;

    iput-object p1, p0, Lfra;->b:Ll4c;

    return-void
.end method


# virtual methods
.method public final a(Lqfb;Lnt5;)Ljava/lang/Object;
    .registers 11

    instance-of v0, p2, Lera;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lera;

    iget v1, v0, Lera;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lera;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lera;

    invoke-direct {v0, p0, p2}, Lera;-><init>(Lfra;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lera;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lera;->v:I

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_38

    if-eq v2, v5, :cond_34

    if-ne v2, v4, :cond_2e

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_c9

    :cond_2e
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_34
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_95

    :cond_38
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p0, Lfra;->b:Ll4c;

    invoke-interface {p2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lpna;

    new-instance v2, Lspa;

    invoke-direct {v2}, Lspa;-><init>()V

    sget-object v7, Lapa;->c:Lapa;

    iput-object v7, v2, Lspa;->b:Lapa;

    sget-object v7, Lvpa;->a:Ljf2;

    iget-object v7, v2, Lspa;->a:Ltgm;

    iget-object p0, p0, Lfra;->a:Ljava/lang/String;

    invoke-static {v7, p0}, Lugm;->b(Ltgm;Ljava/lang/String;)Ltgm;

    iget-object p0, p1, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lkotlinx/serialization/json/c;

    invoke-virtual {p0}, Lkotlinx/serialization/json/c;->toString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, v2, Lspa;->d:Ljava/lang/Object;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    :try_start_63
    invoke-static {v3}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object p1
    :try_end_67
    .catchall {:try_start_63 .. :try_end_67} :catchall_68

    goto :goto_69

    :catchall_68
    move-object p1, v6

    :goto_69
    invoke-static {p0, p1, v2}, Lz1m;->p(Ls15;Lcam;Lspa;)V

    sget-object p0, Lpr5;->a:Ltr5;

    invoke-virtual {p0}, Ltr5;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v2, Lspa;->c:Lg9a;

    invoke-virtual {p1, p0}, Lg9a;->j(Ljava/lang/String;)V

    const-string v7, "Content-Type"

    invoke-virtual {p1, v7}, Leik;->d(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->clear()V

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p0, Lapa;->c:Lapa;

    iput-object p0, v2, Lspa;->b:Lapa;

    new-instance p0, Lyqa;

    const/4 p1, 0x0

    invoke-direct {p0, v2, p2, p1}, Lyqa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput v5, v0, Lera;->v:I

    invoke-virtual {p0, v0}, Lyqa;->e(Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_c8

    :goto_95
    check-cast p2, Lfr6;

    invoke-virtual {p2}, Lfr6;->e()Lzqa;

    move-result-object p0

    invoke-static {p0}, Lalo;->X(Lzqa;)Z

    move-result p0

    if-eqz p0, :cond_100

    invoke-virtual {p2}, Lfr6;->T()Ltna;

    move-result-object p0

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p1

    :try_start_a9
    sget-object p2, Luqh;->a:Lvqh;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v2

    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lcam;

    invoke-direct {p2, v2, v3, v5}, Lcam;-><init>(Lktb;Ljava/util/List;I)V
    :try_end_b9
    .catchall {:try_start_a9 .. :try_end_b9} :catchall_ba

    goto :goto_bb

    :catchall_ba
    move-object p2, v6

    :goto_bb
    new-instance v2, Lx9m;

    invoke-direct {v2, p1, p2}, Lx9m;-><init>(Litb;Lcam;)V

    iput v4, v0, Lera;->v:I

    invoke-virtual {p0, v2, v0}, Ltna;->b(Lx9m;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_c9

    :cond_c8
    return-object v1

    :cond_c9
    :goto_c9
    check-cast p2, Ljava/lang/String;

    if-eqz p2, :cond_fa

    sget-object p0, Lrpb;->d:Lqpb;

    iget-object p1, p0, Lrpb;->b:Lx79;

    const-class v0, Lkotlinx/serialization/json/c;

    invoke-static {v0}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v0

    invoke-static {p1, v0}, Lzwg;->p(Lx79;Lytb;)Lkotlinx/serialization/KSerializer;

    move-result-object p1

    check-cast p1, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p0, p2, p1}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/json/c;

    const-string p1, "error"

    invoke-virtual {p0, p1}, Lkotlinx/serialization/json/c;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_f0

    invoke-virtual {p0}, Lkotlinx/serialization/json/c;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_f0
    new-instance p1, Ljava/io/IOException;

    invoke-virtual {p0}, Lkotlinx/serialization/json/c;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_fa
    const-string p0, "No response body"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v6

    :cond_100
    invoke-virtual {p2}, Lfr6;->e()Lzqa;

    move-result-object p0

    iget p0, p0, Lzqa;->a:I

    const-string p1, "Got "

    const-string p2, " status code"

    invoke-static {p0, p1, p2}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v6
.end method
