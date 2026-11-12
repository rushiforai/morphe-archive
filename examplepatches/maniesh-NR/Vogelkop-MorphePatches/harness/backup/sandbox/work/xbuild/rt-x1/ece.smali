.class public final Lece;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzth;


# instance fields
.field public final a:Ll4c;

.field public final b:Lnx5;

.field public final c:Lcb7;

.field public final d:Lyin;

.field public final e:Lpfe;

.field public final f:Ljava/util/HashMap;

.field public final g:Ljava/util/HashMap;

.field public final h:Ljdj;


# direct methods
.method public constructor <init>(Ll4c;Lnx5;Lcb7;Lyin;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lece;->a:Ll4c;

    iput-object p2, p0, Lece;->b:Lnx5;

    iput-object p3, p0, Lece;->c:Lcb7;

    iput-object p4, p0, Lece;->d:Lyin;

    new-instance p1, Lpfe;

    invoke-direct {p1}, Lpfe;-><init>()V

    iput-object p1, p0, Lece;->e:Lpfe;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lece;->f:Ljava/util/HashMap;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lece;->g:Ljava/util/HashMap;

    sget-object p1, Lh04;->b:Lh04;

    const/4 p2, 0x0

    const/4 p3, 0x1

    invoke-static {p2, p3, p1, p3}, Lipe;->c(IILh04;I)Ljdj;

    move-result-object p1

    iput-object p1, p0, Lece;->h:Ljdj;

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Lece;->g:Ljava/util/HashMap;

    instance-of v1, p2, Lbce;

    if-eqz v1, :cond_15

    move-object v1, p2

    check-cast v1, Lbce;

    iget v2, v1, Lbce;->x:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_15

    sub-int/2addr v2, v3

    iput v2, v1, Lbce;->x:I

    goto :goto_1a

    :cond_15
    new-instance v1, Lbce;

    invoke-direct {v1, p0, p2}, Lbce;-><init>(Lece;Lnt5;)V

    :goto_1a
    iget-object p2, v1, Lbce;->v:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lbce;->x:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_36

    if-ne v3, v4, :cond_30

    iget-object p1, v1, Lbce;->u:Lpfe;

    iget-object v1, v1, Lbce;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    move-object p2, p1

    move-object p1, v1

    goto :goto_48

    :cond_30
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_36
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v1, Lbce;->t:Ljava/lang/String;

    iget-object p2, p0, Lece;->e:Lpfe;

    iput-object p2, v1, Lbce;->u:Lpfe;

    iput v4, v1, Lbce;->x:I

    invoke-virtual {p2, v1}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v2, :cond_48

    return-object v2

    :cond_48
    :goto_48
    :try_start_48
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfra;

    if-nez v1, :cond_5a

    new-instance v1, Lfra;

    iget-object p0, p0, Lece;->a:Ll4c;

    invoke-direct {v1, p0, p1}, Lfra;-><init>(Ll4c;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5a
    .catchall {:try_start_48 .. :try_end_5a} :catchall_5e

    :cond_5a
    invoke-virtual {p2, v5}, Lpfe;->l(Ljava/lang/Object;)V

    return-object v1

    :catchall_5e
    move-exception p0

    invoke-virtual {p2, v5}, Lpfe;->l(Ljava/lang/Object;)V

    throw p0
.end method

.method public final e(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 11

    instance-of v0, p2, Lcce;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lcce;

    iget v1, v0, Lcce;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lcce;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lcce;

    invoke-direct {v0, p0, p2}, Lcce;-><init>(Lece;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lcce;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lcce;->x:I

    iget-object v3, p0, Lece;->f:Ljava/util/HashMap;

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_3f

    if-eq v2, v5, :cond_37

    if-ne v2, v4, :cond_31

    iget-object p0, v0, Lcce;->u:Lpfe;

    iget-object p1, v0, Lcce;->t:Ljava/lang/String;

    :try_start_2d
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_30
    .catchall {:try_start_2d .. :try_end_30} :catchall_73

    goto :goto_69

    :cond_31
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_37
    iget-object p1, v0, Lcce;->u:Lpfe;

    iget-object v2, v0, Lcce;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_52

    :cond_3f
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Lcce;->t:Ljava/lang/String;

    iget-object p2, p0, Lece;->e:Lpfe;

    iput-object p2, v0, Lcce;->u:Lpfe;

    iput v5, v0, Lcce;->x:I

    invoke-virtual {p2, v0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_66

    move-object v2, p1

    move-object p1, p2

    :goto_52
    :try_start_52
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ldwn;

    if-nez p2, :cond_75

    iput-object v2, v0, Lcce;->t:Ljava/lang/String;

    iput-object p1, v0, Lcce;->u:Lpfe;

    iput v4, v0, Lcce;->x:I

    invoke-virtual {p0, v2, v0}, Lece;->f(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p2
    :try_end_64
    .catchall {:try_start_52 .. :try_end_64} :catchall_79

    if-ne p2, v1, :cond_67

    :cond_66
    return-object v1

    :cond_67
    move-object p0, p1

    move-object p1, v2

    :goto_69
    :try_start_69
    move-object v0, p2

    check-cast v0, Ldwn;

    invoke-virtual {v3, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p2, Ldwn;
    :try_end_71
    .catchall {:try_start_69 .. :try_end_71} :catchall_73

    move-object p1, p0

    goto :goto_75

    :catchall_73
    move-exception p1

    goto :goto_7d

    :cond_75
    :goto_75
    invoke-virtual {p1, v6}, Lpfe;->l(Ljava/lang/Object;)V

    return-object p2

    :catchall_79
    move-exception p0

    move-object v7, p1

    move-object p1, p0

    move-object p0, v7

    :goto_7d
    invoke-virtual {p0, v6}, Lpfe;->l(Ljava/lang/Object;)V

    throw p1
.end method

.method public final f(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p2, Ldce;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Ldce;

    iget v1, v0, Ldce;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ldce;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Ldce;

    invoke-direct {v0, p0, p2}, Ldce;-><init>(Lece;Lnt5;)V

    :goto_18
    iget-object p2, v0, Ldce;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ldce;->w:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v4, :cond_2a

    iget-object p1, v0, Ldce;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_76

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p0, Lece;->a:Ll4c;

    invoke-interface {p2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lpna;

    iput-object p1, v0, Ldce;->t:Ljava/lang/String;

    iput v4, v0, Ldce;->w:I

    sget-object v2, Liwn;->d:Ltmj;

    invoke-static {p2, v2}, Lgoa;->a(Lpna;Lfoa;)Ljava/lang/Object;

    new-instance v2, Lcd5;

    invoke-direct {v2}, Lcd5;-><init>()V

    new-instance v4, Lspa;

    invoke-direct {v4}, Lspa;-><init>()V

    sget-object v5, Lvgm;->e:Lvgm;

    iget-object v6, v4, Lspa;->a:Ltgm;

    iput-object v5, v6, Ltgm;->d:Lvgm;

    invoke-virtual {v6}, Ltgm;->d()Lvgm;

    move-result-object v5

    iget-short v5, v5, Lvgm;->b:S

    invoke-virtual {v6, v5}, Ltgm;->e(I)V

    invoke-static {v6, p1}, Lugm;->b(Ltgm;Ljava/lang/String;)Ltgm;

    new-instance v5, Lyqa;

    const/4 v6, 0x0

    invoke-direct {v5, v4, p2, v6}, Lyqa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lg14;

    invoke-direct {v4, v5, v2, v3}, Lg14;-><init>(Lyqa;Lcd5;Lmt5;)V

    const/4 v5, 0x3

    invoke-static {p2, v3, v3, v4, v5}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    invoke-virtual {v2, v0}, Lxob;->A(Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_76

    return-object v1

    :cond_76
    :goto_76
    move-object v1, p2

    check-cast v1, Lan6;

    iget-object p2, p0, Lece;->c:Lcb7;

    check-cast p2, Lkzd;

    iget-object p2, p2, Lkzd;->a:Lab7;

    invoke-interface {p2}, Lab7;->c()Ldx5;

    move-result-object p2

    new-instance v3, La64;

    iget-object v2, p0, Lece;->b:Lnx5;

    invoke-interface {v2}, Lnx5;->l()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    invoke-interface {v0, p2}, Lkotlin/coroutines/CoroutineContext;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p2

    invoke-direct {v3, p2}, La64;-><init>(Lkotlin/coroutines/CoroutineContext;)V

    new-instance v5, Ljkc;

    const/16 p2, 0x10

    invoke-direct {v5, p0, p1, p2}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Ldwn;

    iget-object v4, p0, Lece;->h:Ljdj;

    invoke-direct/range {v0 .. v5}, Ldwn;-><init>(Lan6;Lnx5;La64;Ljdj;Ljkc;)V

    return-object v0
.end method
