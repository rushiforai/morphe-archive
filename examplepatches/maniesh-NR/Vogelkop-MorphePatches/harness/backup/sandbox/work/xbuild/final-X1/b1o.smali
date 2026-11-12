.class public final Lb1o;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lwjh;

.field public final c:Lm91;

.field public final d:Lbr6;

.field public final e:Ljv1;

.field public final f:Lzyk;

.field public final g:La64;

.field public final h:La1o;

.field public final i:Li07;

.field public volatile j:Lv0o;

.field public k:Ld3k;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lwjh;Lm91;Lbr6;Ljv1;)V
    .registers 7

    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb1o;->a:Landroid/content/Context;

    iput-object p2, p0, Lb1o;->b:Lwjh;

    iput-object p3, p0, Lb1o;->c:Lm91;

    iput-object p4, p0, Lb1o;->d:Lbr6;

    iput-object p5, p0, Lb1o;->e:Ljv1;

    new-instance p1, Lm2n;

    const/16 p3, 0xc

    invoke-direct {p1, p0, p3}, Lm2n;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lb1o;->f:Lzyk;

    invoke-static {}, Lzch;->a()Lcsk;

    move-result-object p1

    invoke-static {p1}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object p1

    iput-object p1, p0, Lb1o;->g:La64;

    iget-object p3, p2, Lwjh;->d:Ljava/lang/Object;

    check-cast p3, Ljg8;

    iget-object p4, p2, Lwjh;->e:Ljava/lang/Object;

    check-cast p4, Ljg8;

    new-instance p5, La1o;

    invoke-direct {p5, p0, p3, p4}, La1o;-><init>(Lb1o;Ljg8;Ljg8;)V

    iput-object p5, p0, Lb1o;->h:La1o;

    iget-object p2, p2, Lwjh;->d:Ljava/lang/Object;

    check-cast p2, Ljg8;

    new-instance p3, Lu6k;

    const/16 p4, 0xa

    const/4 v0, 0x0

    invoke-direct {p3, p4, v0, p0}, Lu6k;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p4, 0x2

    invoke-static {p1, p2, v0, p3, p4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object p1

    iput-object p1, p0, Lb1o;->i:Li07;

    iget-object p0, p5, Ln1f;->b:Ljava/lang/Object;

    check-cast p0, Ld3k;

    invoke-virtual {p0}, Lxob;->start()Z

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lx0o;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lx0o;

    iget v1, v0, Lx0o;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lx0o;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lx0o;

    invoke-direct {v0, p0, p1}, Lx0o;-><init>(Lb1o;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lx0o;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lx0o;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_49

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lb1o;->k:Ld3k;

    if-eqz p1, :cond_39

    iget-object p1, p0, Lb1o;->j:Lv0o;

    if-nez p1, :cond_3c

    :cond_39
    invoke-virtual {p0}, Lb1o;->b()V

    :cond_3c
    iget-object p1, p0, Lb1o;->k:Ld3k;

    if-eqz p1, :cond_49

    iput v3, v0, Lx0o;->v:I

    invoke-virtual {p1, v0}, Lxob;->Z(Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_49

    return-object v1

    :cond_49
    :goto_49
    iget-object p0, p0, Lb1o;->j:Lv0o;

    return-object p0
.end method

.method public final b()V
    .registers 6

    iget-object v0, p0, Lb1o;->k:Ld3k;

    const/4 v1, 0x1

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lxob;->isActive()Z

    move-result v0

    if-ne v0, v1, :cond_c

    return-void

    :cond_c
    iget-object v0, p0, Lb1o;->b:Lwjh;

    iget-object v0, v0, Lwjh;->b:Ljava/lang/Object;

    check-cast v0, Ld7a;

    new-instance v2, Lpin;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3, p0}, Lpin;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v1, 0x2

    iget-object v4, p0, Lb1o;->g:La64;

    invoke-static {v4, v0, v3, v2, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v0

    iput-object v0, p0, Lb1o;->k:Ld3k;

    return-void
.end method

.method public final c()V
    .registers 10

    iget-object v0, p0, Lb1o;->j:Lv0o;

    if-eqz v0, :cond_5f

    iget-object v0, v0, Lv0o;->e:Ljava/lang/Long;

    if-eqz v0, :cond_5f

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    iget-object v2, p0, Lb1o;->e:Ljv1;

    invoke-virtual {v2}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lskm;

    check-cast v2, Lx5f;

    iget-object v3, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    new-instance v5, Lck0;

    invoke-direct {v5, v3, v4}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v3, v5, Lck0;->d:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkn0;

    const-wide/16 v5, 0x3e8

    mul-long/2addr v5, v0

    iget-object v3, v3, Lkn0;->b:Lin0;

    const/16 v7, 0x23

    const/4 v8, 0x1

    invoke-virtual {v3, v7, v8, v5, v6}, Ljf0;->p(IIJ)V

    invoke-virtual {v2, v4}, Lx5f;->U0(Lx56;)V

    iget-object p0, p0, Lb1o;->e:Ljv1;

    invoke-virtual {p0}, Ljv1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lskm;

    invoke-static {v0, v1}, Lurj;->j(J)Z

    move-result v0

    check-cast p0, Lx5f;

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v3}, Lck0;->h()Lat0;

    move-result-object v1

    iget-object v1, v1, Lat0;->a:Lzs0;

    const/16 v3, 0xb

    invoke-virtual {v1, v3, v8, v0}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_5f
    iget-object v0, p0, Lb1o;->g:La64;

    iget-object v1, p0, Lb1o;->b:Lwjh;

    iget-object v1, v1, Lwjh;->d:Ljava/lang/Object;

    check-cast v1, Ljg8;

    new-instance v2, Lrf4;

    const/16 v3, 0x14

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, p0}, Lrf4;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x2

    invoke-static {v0, v1, v4, v2, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final d(Lnt5;)Ljava/lang/Object;
    .registers 13

    instance-of v0, p1, Ly0o;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Ly0o;

    iget v1, v0, Ly0o;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ly0o;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Ly0o;

    invoke-direct {v0, p0, p1}, Ly0o;-><init>(Lb1o;Lnt5;)V

    :goto_18
    iget-object p1, v0, Ly0o;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ly0o;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-wide v0, v0, Ly0o;->t:J

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4d

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lb1o;->j:Lv0o;

    if-eqz p1, :cond_b6

    iget-object p1, p1, Lv0o;->e:Ljava/lang/Long;

    if-eqz p1, :cond_b6

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-object p1, p0, Lb1o;->i:Li07;

    iput-wide v4, v0, Ly0o;->t:J

    iput v3, v0, Ly0o;->w:I

    invoke-virtual {p1, v0}, Lxob;->A(Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_4c

    return-object v1

    :cond_4c
    move-wide v0, v4

    :goto_4d
    check-cast p1, Landroid/content/SharedPreferences;

    const-string v2, "report_first_seen"

    const/4 v4, 0x0

    invoke-interface {p1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_b3

    iget-object v5, p0, Lb1o;->e:Ljv1;

    invoke-virtual {v5}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lskm;

    check-cast v5, Lx5f;

    iget-object v6, v5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v7

    new-instance v8, Lck0;

    invoke-direct {v8, v6, v7}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v6, v8, Lck0;->d:Lzyk;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkn0;

    const-wide/16 v8, 0x3e8

    mul-long/2addr v8, v0

    iget-object v6, v6, Lkn0;->b:Lin0;

    const/16 v10, 0x23

    invoke-virtual {v6, v10, v3, v8, v9}, Ljf0;->p(IIJ)V

    invoke-virtual {v5, v7}, Lx5f;->U0(Lx56;)V

    iget-object p0, p0, Lb1o;->e:Ljv1;

    invoke-virtual {p0}, Ljv1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lskm;

    invoke-static {v0, v1}, Lurj;->j(J)Z

    move-result v0

    check-cast p0, Lx5f;

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    new-instance v6, Lck0;

    invoke-direct {v6, v1, v5}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v6}, Lck0;->h()Lat0;

    move-result-object v1

    iget-object v1, v1, Lat0;->a:Lzs0;

    const/16 v6, 0xb

    invoke-virtual {v1, v6, v3, v0}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v5}, Lx5f;->U0(Lx56;)V

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_b3
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_b6
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
