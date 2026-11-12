.class public final Lft6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lgy6;

.field public final b:Lkz6;

.field public final c:Lyc1;

.field public final d:Lyc1;

.field public final e:Lyc1;


# direct methods
.method public constructor <init>(Lgy6;Lkz6;Lauj;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lft6;->a:Lgy6;

    iput-object p2, p0, Lft6;->b:Lkz6;

    iget-object p1, p2, Lkz6;->d:Lf99;

    new-instance p3, Lyc1;

    const/4 v0, 0x3

    invoke-direct {p3, p1, v0}, Lyc1;-><init>(Lf99;B)V

    iput-object p3, p0, Lft6;->c:Lyc1;

    iget-object p1, p2, Lkz6;->h:Lf99;

    new-instance p3, Lyc1;

    const/4 v0, 0x4

    invoke-direct {p3, p1, v0}, Lyc1;-><init>(Lf99;B)V

    iput-object p3, p0, Lft6;->d:Lyc1;

    iget-object p1, p2, Lkz6;->i:Lf99;

    new-instance p2, Lyc1;

    const/4 p3, 0x5

    invoke-direct {p2, p1, p3}, Lyc1;-><init>(Lf99;B)V

    iput-object p2, p0, Lft6;->e:Lyc1;

    return-void
.end method


# virtual methods
.method public final a(Luv9;Lnt5;)Ljava/lang/Object;
    .registers 15

    instance-of v0, p2, Let6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Let6;

    iget v1, v0, Let6;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Let6;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Let6;

    invoke-direct {v0, p0, p2}, Let6;-><init>(Lft6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Let6;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Let6;->w:I

    iget-object v3, p0, Lft6;->b:Lkz6;

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v2, :cond_43

    if-eq v2, v6, :cond_3d

    if-eq v2, v5, :cond_37

    if-ne v2, v4, :cond_31

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_d7

    :cond_31
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7

    :cond_37
    iget-object p0, v0, Let6;->t:Luv9;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_96

    :cond_3d
    iget-object p1, v0, Let6;->t:Luv9;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_75

    :cond_43
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p2, Lj2h;->a:[Lj2h;

    iget-wide v8, p1, Luv9;->a:D

    const-wide v10, 0x408f400000000000L    # 1000.0

    mul-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->floor(D)D

    move-result-wide v8

    div-double/2addr v8, v10

    new-instance p2, Ljava/lang/Double;

    invoke-direct {p2, v8, v9}, Ljava/lang/Double;-><init>(D)V

    iget-wide v8, p1, Luv9;->b:D

    mul-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->floor(D)D

    move-result-wide v8

    div-double/2addr v8, v10

    new-instance v2, Ljava/lang/Double;

    invoke-direct {v2, v8, v9}, Ljava/lang/Double;-><init>(D)V

    iput-object p1, v0, Let6;->t:Luv9;

    iput v6, v0, Let6;->w:I

    iget-object p0, p0, Lft6;->a:Lgy6;

    const-string v6, "OfABeta"

    invoke-virtual {p0, v6, p2, v2, v0}, Lgy6;->b(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_d6

    :goto_75
    check-cast p2, Lvne;

    invoke-static {}, Lfxc;->e()Lexc;

    move-result-object p0

    iget-object v2, p2, Lvne;->a:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lexc;->b(Ljava/lang/String;)V

    iget-object p2, p2, Lvne;->b:Ljava/lang/String;

    invoke-virtual {p0, p2}, Lexc;->c(Ljava/lang/String;)V

    invoke-virtual {p0}, Lgv9$a;->build()Lgv9;

    move-result-object p0

    check-cast p0, Lfxc;

    iput-object p1, v0, Let6;->t:Luv9;

    iput v5, v0, Let6;->w:I

    invoke-virtual {v3, p0, v0}, Lkz6;->k(Lfxc;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_d6

    move-object p0, p1

    :goto_96
    iput-object v7, v0, Let6;->t:Luv9;

    iput v4, v0, Let6;->w:I

    invoke-static {}, Lvv9;->f()Ltv9;

    move-result-object p1

    iget-wide v4, p0, Luv9;->a:D

    invoke-virtual {p1}, Lgv9$a;->copyOnWrite()V

    iget-object p2, p1, Lgv9$a;->instance:Lgv9;

    check-cast p2, Lvv9;

    invoke-virtual {p2, v4, v5}, Lvv9;->g(D)V

    iget-wide v4, p0, Luv9;->b:D

    invoke-virtual {p1}, Lgv9$a;->copyOnWrite()V

    iget-object p2, p1, Lgv9$a;->instance:Lgv9;

    check-cast p2, Lvv9;

    invoke-virtual {p2, v4, v5}, Lvv9;->h(D)V

    iget-object p0, p0, Luv9;->c:Lebb;

    invoke-virtual {p0}, Lebb;->i()J

    move-result-wide v4

    invoke-virtual {p1}, Lgv9$a;->copyOnWrite()V

    iget-object p0, p1, Lgv9$a;->instance:Lgv9;

    check-cast p0, Lvv9;

    invoke-virtual {p0, v4, v5}, Lvv9;->i(J)V

    invoke-virtual {p1}, Lgv9$a;->build()Lgv9;

    move-result-object p0

    check-cast p0, Lvv9;

    invoke-virtual {v3, p0, v0}, Lkz6;->h(Lvv9;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_d4

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_d4
    if-ne p0, v1, :cond_d7

    :cond_d6
    return-object v1

    :cond_d7
    :goto_d7
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
