.class public final Lsze;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lddc;

.field public final b:Ltcc;

.field public final c:J

.field public final d:Ls55;

.field public final e:Ld06;

.field public final f:Ljdj;

.field public final g:Lg77;

.field public h:Z

.field public i:Lswh;

.field public final j:Ljdj;


# direct methods
.method public constructor <init>(Lcom/opera/android/OperaApplication;Lwjh;Lddc;Ltcc;Lmr3;Ltze;Lbr6;)V
    .registers 12

    sget-object p5, Lpn7;->b:Lon7;

    const/4 p5, 0x6

    sget-object v0, Lun7;->g:Lun7;

    invoke-static {p5, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    new-instance p5, Ld06;

    new-instance v2, Let3;

    const/16 v3, 0x8

    invoke-direct {v2, p1, v3}, Let3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-direct {p5}, Ljava/lang/Object;-><init>()V

    iput-object v2, p5, Ld06;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lsze;->a:Lddc;

    iput-object p4, p0, Lsze;->b:Ltcc;

    iput-wide v0, p0, Lsze;->c:J

    sget-object p1, Ls55;->b:Ls55;

    iput-object p1, p0, Lsze;->d:Ls55;

    iput-object p5, p0, Lsze;->e:Ld06;

    new-instance p1, Lqze;

    invoke-direct {p1, p0}, Lqze;-><init>(Lsze;)V

    sget-object p3, Lh04;->b:Lh04;

    const/4 p5, 0x2

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {v0, v1, p3, p5}, Lipe;->c(IILh04;I)Ljdj;

    move-result-object p3

    iput-object p3, p0, Lsze;->f:Ljdj;

    new-instance p5, Lg77;

    invoke-direct {p5}, Ljava/lang/Object;-><init>()V

    iput-object p2, p5, Lg77;->a:Ljava/lang/Object;

    iput-object p6, p5, Lg77;->b:Ljava/lang/Object;

    iput-object p7, p5, Lg77;->c:Ljava/lang/Object;

    iput-object p5, p0, Lsze;->g:Lg77;

    iput-object p3, p0, Lsze;->j:Ljdj;

    invoke-virtual {p4, p1}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 14

    instance-of v0, p1, Loze;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Loze;

    iget v1, v0, Loze;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Loze;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Loze;

    invoke-direct {v0, p0, p1}, Loze;-><init>(Lsze;Lnt5;)V

    :goto_18
    iget-object p1, v0, Loze;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Loze;->w:I

    const/4 v3, 0x2

    const/4 v4, 0x3

    const/4 v5, 0x1

    const/4 v10, 0x0

    if-eqz v2, :cond_40

    if-eq v2, v5, :cond_3c

    if-eq v2, v3, :cond_36

    if-ne v2, v4, :cond_2f

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_b7

    :cond_2f
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_36
    iget-object v2, v0, Loze;->t:Lfdk;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_83

    :cond_3c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6c

    :cond_40
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-boolean p1, p0, Lsze;->h:Z

    if-eqz p1, :cond_4a

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_4a
    iput v5, v0, Loze;->w:I

    iget-object p1, p0, Lsze;->e:Ld06;

    iget-object p1, p1, Ld06;->a:Ljava/lang/Object;

    check-cast p1, Let3;

    invoke-virtual {p1}, Let3;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqd6;

    invoke-interface {p1}, Lqd6;->getData()Lf99;

    move-result-object p1

    new-instance v2, Lra6;

    invoke-direct {v2, v4, v10, v5}, Lra6;-><init>(ILmt5;B)V

    new-instance v6, Lx99;

    invoke-direct {v6, p1, v2, v5}, Lx99;-><init>(Lf99;Lcr9;B)V

    invoke-static {v6, v0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_b6

    :goto_6c
    move-object v2, p1

    check-cast v2, Lfdk;

    iget-object p1, v2, Lfdk;->a:Lv3f;

    invoke-static {p1}, Lfr3;->w(Lv3f;)Lz48;

    move-result-object p1

    iput-boolean v5, p0, Lsze;->h:Z

    iput-object v2, v0, Loze;->t:Lfdk;

    iput v3, v0, Loze;->w:I

    iget-object v3, p0, Lsze;->f:Ljdj;

    invoke-virtual {v3, p1, v0}, Ljdj;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_b6

    :goto_83
    iget-object p1, v2, Lfdk;->b:Lebb;

    if-nez p1, :cond_90

    sget-object p1, Lpn7;->b:Lon7;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-wide v5, Lpn7;->c:J

    :goto_8e
    move-wide v8, v5

    goto :goto_9b

    :cond_90
    iget-object v3, p0, Lsze;->d:Ls55;

    invoke-virtual {v3}, Ls55;->a()Lebb;

    move-result-object v3

    invoke-virtual {v3, p1}, Lebb;->g(Lebb;)J

    move-result-wide v5

    goto :goto_8e

    :goto_9b
    iget-wide v5, p0, Lsze;->c:J

    invoke-static {v8, v9, v5, v6}, Lpn7;->c(JJ)I

    move-result p1

    if-ltz p1, :cond_ba

    iget-object p1, v2, Lfdk;->b:Lebb;

    if-nez p1, :cond_aa

    sget-object p1, Lswh;->a:Lswh;

    goto :goto_ac

    :cond_aa
    sget-object p1, Lswh;->b:Lswh;

    :goto_ac
    iput-object v10, v0, Loze;->t:Lfdk;

    iput v4, v0, Loze;->w:I

    invoke-virtual {p0, p1, v0}, Lsze;->b(Lswh;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_b7

    :cond_b6
    return-object v1

    :cond_b7
    :goto_b7
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_ba
    new-instance v6, Lus6;

    const/4 v7, 0x2

    move-object v11, p0

    invoke-direct/range {v6 .. v11}, Lus6;-><init>(BJLmt5;Ljava/lang/Object;)V

    iget-object p0, v11, Lsze;->a:Lddc;

    invoke-static {p0, v10, v10, v6, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final b(Lswh;Lnt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p2, Lrze;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lrze;

    iget v1, v0, Lrze;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lrze;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lrze;

    invoke-direct {v0, p0, p2}, Lrze;-><init>(Lsze;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lrze;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lrze;->w:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_4b

    if-eq v2, v5, :cond_43

    if-eq v2, v4, :cond_3d

    if-eq v2, v3, :cond_39

    const/4 p0, 0x4

    if-ne v2, p0, :cond_33

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_33
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_39
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_90

    :cond_3d
    iget-object p1, v0, Lrze;->t:Lv3f;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_83

    :cond_43
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p1, p2, Lt0i;->a:Ljava/lang/Object;

    goto :goto_6b

    :cond_4b
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p0, Lsze;->b:Ltcc;

    check-cast p2, Lqdc;

    iget-object p2, p2, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->e:Lqcc;

    invoke-virtual {p2, v2}, Lqcc;->d(Lqcc;)Z

    move-result p2

    if-nez p2, :cond_61

    iput-object p1, p0, Lsze;->i:Lswh;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_61
    iput v5, v0, Lrze;->w:I

    iget-object p2, p0, Lsze;->g:Lg77;

    invoke-virtual {p2, p1, v0}, Lg77;->j(Lswh;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_8f

    :goto_6b
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p2

    if-nez p2, :cond_90

    check-cast p1, Lv3f;

    invoke-static {p1}, Lfr3;->w(Lv3f;)Lz48;

    move-result-object p2

    iput-object p1, v0, Lrze;->t:Lv3f;

    iput v4, v0, Lrze;->w:I

    iget-object v2, p0, Lsze;->f:Ljdj;

    invoke-virtual {v2, p2, v0}, Ljdj;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_8f

    :goto_83
    iput-object v6, v0, Lrze;->t:Lv3f;

    iput v3, v0, Lrze;->w:I

    iget-object p2, p0, Lsze;->e:Ld06;

    invoke-virtual {p2, p1, v0}, Ld06;->r(Lv3f;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_90

    :cond_8f
    return-object v1

    :cond_90
    :goto_90
    new-instance p1, Lrf4;

    const/16 p2, 0xc

    invoke-direct {p1, p2, v6, p0}, Lrf4;-><init>(BLmt5;Ljava/lang/Object;)V

    iget-object p0, p0, Lsze;->a:Lddc;

    invoke-static {p0, v6, v6, p1, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
