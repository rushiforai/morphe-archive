.class public final Lcq6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lnx5;

.field public final b:Lfs6;

.field public final c:Lgmc;

.field public final d:Lti9;

.field public final e:Lqs6;

.field public final f:Lo0i;

.field public final g:Lrlh;


# direct methods
.method public constructor <init>(Lnx5;Lfs6;Lgmc;Lti9;Lqs6;Lvpc;Lo0i;Ldx5;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcq6;->a:Lnx5;

    iput-object p2, p0, Lcq6;->b:Lfs6;

    iput-object p3, p0, Lcq6;->c:Lgmc;

    iput-object p4, p0, Lcq6;->d:Lti9;

    iput-object p5, p0, Lcq6;->e:Lqs6;

    iput-object p7, p0, Lcq6;->f:Lo0i;

    sget-object p7, Ll08;->a:Ll08;

    invoke-static {p7}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    iget-object p7, p3, Lgmc;->o:Lrlh;

    iput-object p7, p0, Lcq6;->g:Lrlh;

    new-instance p7, Lup6;

    const/4 v0, 0x0

    invoke-direct {p7, p0, v0}, Lup6;-><init>(Lcq6;B)V

    iput-object p7, p5, Lqs6;->f:Lup6;

    new-instance p5, Lup6;

    const/4 p7, 0x1

    invoke-direct {p5, p0, p7}, Lup6;-><init>(Lcq6;B)V

    iget-object p4, p4, Lti9;->j:Ljh;

    iget-boolean v1, p4, Ljh;->a:Z

    if-eqz v1, :cond_36

    iget-boolean v1, p4, Ljh;->b:Z

    if-nez v1, :cond_38

    iput-boolean p7, p4, Ljh;->b:Z

    invoke-virtual {p5}, Lup6;->run()V

    goto :goto_38

    :cond_36
    iput-object p5, p4, Ljh;->c:Ljava/lang/Object;

    :cond_38
    :goto_38
    iget-object p4, p3, Lgmc;->v:Lrlh;

    new-instance p5, Lyc1;

    const/16 v1, 0xd

    invoke-direct {p5, p4, v1}, Lyc1;-><init>(Lf99;B)V

    new-instance p4, Lvp6;

    const/4 v2, 0x0

    invoke-direct {p4, p0, v2, v0}, Lvp6;-><init>(Lcq6;Lmt5;B)V

    invoke-static {p5, p1, p4}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    iget-object p4, p3, Lgmc;->p:Lrlh;

    new-instance p5, Lvp6;

    invoke-direct {p5, p0, v2, p7}, Lvp6;-><init>(Lcq6;Lmt5;B)V

    invoke-static {p4, p1, p5}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    iget-object p4, p6, Lvpc;->d:Lode;

    new-instance p5, Lwg5;

    invoke-direct {p5, p0, v1}, Lwg5;-><init>(Ljava/lang/Object;B)V

    new-instance p6, Lcl4;

    const/16 p7, 0x9

    invoke-direct {p6, p5, p7}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p4, p6}, Lekc;->k(Lf7f;)V

    iget-object p2, p2, Lfs6;->d:Ljze;

    invoke-static {p2}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p2

    iget-object p3, p3, Lgmc;->t:Lrlh;

    new-instance p4, Lkm4;

    const/4 p5, 0x3

    invoke-direct {p4, p5, v2, p5}, Lkm4;-><init>(ILmt5;B)V

    new-instance p5, Lya9;

    invoke-direct {p5, p2, p3, p4, v0}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p5, p8}, Lic4;->r(Lf99;Ldx5;)Lf99;

    move-result-object p2

    new-instance p3, Lyc1;

    invoke-direct {p3, p2, v1}, Lyc1;-><init>(Lf99;B)V

    invoke-static {p3}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p2

    new-instance p3, Lwp6;

    invoke-direct {p3, p0, v2, v0}, Lwp6;-><init>(Lcq6;Lmt5;B)V

    invoke-static {p2, p1, p3}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p1, Lxp6;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lxp6;

    iget v1, v0, Lxp6;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lxp6;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lxp6;

    invoke-direct {v0, p0, p1}, Lxp6;-><init>(Lcq6;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lxp6;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lxp6;->w:I

    const/4 v3, 0x3

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x2

    if-eqz v2, :cond_43

    if-eq v2, v4, :cond_3f

    if-eq v2, v6, :cond_37

    if-ne v2, v3, :cond_31

    iget-object p0, v0, Lxp6;->t:Ljava/lang/Object;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_b3

    :cond_31
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_37
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_63

    :cond_3f
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_59

    :cond_43
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lcq6;->b:Lfs6;

    iget-object p1, p1, Lfs6;->d:Ljze;

    new-instance v2, Lxf;

    const/16 v7, 0x9

    invoke-direct {v2, v6, v5, v7}, Lxf;-><init>(ILmt5;B)V

    iput v4, v0, Lxp6;->w:I

    invoke-static {p1, v2, v0}, Lxf8;->w(Lekc;Lkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_b1

    :goto_59
    iput v6, v0, Lxp6;->w:I

    iget-object p1, p0, Lcq6;->d:Lti9;

    invoke-virtual {p1, v0}, Lti9;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_b1

    :goto_63
    sget-object v2, Lt0i;->b:Lp0i;

    instance-of v2, p1, Lq0i;

    if-nez v2, :cond_b4

    move-object v2, p1

    check-cast v2, Ljava/util/List;

    check-cast v2, Ljava/lang/Iterable;

    new-instance v4, Ljava/util/ArrayList;

    const/16 v6, 0xa

    invoke-static {v2, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_7d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_96

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lgme;

    new-instance v7, Lquc;

    iget-wide v8, v6, Lgme;->a:J

    iget-object v6, v6, Lgme;->b:Ljava/lang/String;

    invoke-direct {v7, v8, v9, v6}, Lquc;-><init>(JLjava/lang/String;)V

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7d

    :cond_96
    iput-object p1, v0, Lxp6;->t:Ljava/lang/Object;

    iput v3, v0, Lxp6;->w:I

    iget-object p0, p0, Lcq6;->c:Lgmc;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lemc;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v4, v5, v3}, Lemc;-><init>(Lgmc;Ljava/util/ArrayList;Lmt5;B)V

    invoke-virtual {p0, v2, v0}, Lgmc;->a(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object v0, Lpx5;->a:Lpx5;

    if-eq p0, v0, :cond_af

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_af
    if-ne p0, v1, :cond_b2

    :cond_b1
    return-object v1

    :cond_b2
    move-object p0, p1

    :goto_b3
    move-object p1, p0

    :cond_b4
    sget-object p0, Lt0i;->b:Lp0i;

    instance-of p0, p1, Lq0i;

    if-nez p0, :cond_bf

    check-cast p1, Ljava/util/List;

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_bf
    return-object p1
.end method

.method public final b(Lnt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p1, Lyp6;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lyp6;

    iget v1, v0, Lyp6;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lyp6;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lyp6;

    invoke-direct {v0, p0, p1}, Lyp6;-><init>(Lcq6;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lyp6;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lyp6;->w:I

    const/4 v3, 0x3

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_42

    if-eq v2, v6, :cond_3e

    if-eq v2, v5, :cond_36

    if-ne v2, v3, :cond_30

    iget-object p0, v0, Lyp6;->t:Ljava/lang/Object;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_87

    :cond_30
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_36
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_62

    :cond_3e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_58

    :cond_42
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lcq6;->b:Lfs6;

    iget-object p1, p1, Lfs6;->d:Ljze;

    new-instance v2, Lxf;

    const/16 v7, 0xa

    invoke-direct {v2, v5, v4, v7}, Lxf;-><init>(ILmt5;B)V

    iput v6, v0, Lyp6;->w:I

    invoke-static {p1, v2, v0}, Lxf8;->w(Lekc;Lkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_85

    :goto_58
    iput v5, v0, Lyp6;->w:I

    iget-object p1, p0, Lcq6;->d:Lti9;

    invoke-virtual {p1, v0}, Lti9;->b(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_85

    :goto_62
    sget-object v2, Lt0i;->b:Lp0i;

    instance-of v2, p1, Lq0i;

    if-nez v2, :cond_88

    move-object v2, p1

    check-cast v2, Lo7f;

    iput-object p1, v0, Lyp6;->t:Ljava/lang/Object;

    iput v3, v0, Lyp6;->w:I

    iget-object p0, p0, Lcq6;->c:Lgmc;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Ls23;

    const/16 v5, 0xd

    invoke-direct {v3, p0, v2, v4, v5}, Ls23;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-virtual {p0, v3, v0}, Lgmc;->a(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_83

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_83
    if-ne p0, v1, :cond_86

    :cond_85
    return-object v1

    :cond_86
    move-object p0, p1

    :goto_87
    move-object p1, p0

    :cond_88
    sget-object p0, Lt0i;->b:Lp0i;

    instance-of p0, p1, Lq0i;

    if-nez p0, :cond_98

    check-cast p1, Lo7f;

    if-nez p1, :cond_93

    const/4 v6, 0x0

    :cond_93
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :cond_98
    return-object p1
.end method
