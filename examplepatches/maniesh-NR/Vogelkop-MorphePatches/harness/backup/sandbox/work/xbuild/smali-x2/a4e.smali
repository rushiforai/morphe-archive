.class public final La4e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, La4e;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Ly3e;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Ly3e;

    iget v1, v0, Ly3e;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ly3e;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Ly3e;

    invoke-direct {v0, p0, p1}, Ly3e;-><init>(La4e;Lnt5;)V

    :goto_18
    iget-object p1, v0, Ly3e;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ly3e;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-object p0, v0, Ly3e;->t:Ljava/lang/String;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4b

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, La4e;->a:Landroid/content/Context;

    invoke-static {p1}, Lzi4;->A(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_3d

    const-string p1, ""

    :cond_3d
    iput-object p1, v0, Ly3e;->t:Ljava/lang/String;

    iput v3, v0, Ly3e;->w:I

    invoke-virtual {p0, v0}, La4e;->b(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_48

    return-object v1

    :cond_48
    move-object v4, p1

    move-object p1, p0

    move-object p0, v4

    :goto_4b
    check-cast p1, Ljava/lang/String;

    new-instance v0, Lzua;

    invoke-direct {v0, p0, p1}, Lzua;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final b(Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p1, Lz3e;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lz3e;

    iget v1, v0, Lz3e;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lz3e;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lz3e;

    invoke-direct {v0, p0, p1}, Lz3e;-><init>(La4e;Lnt5;)V

    :goto_18
    iget-object p0, v0, Lz3e;->t:Ljava/lang/Object;

    sget-object p1, Lpx5;->a:Lpx5;

    iget v1, v0, Lz3e;->v:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2e

    if-ne v1, v3, :cond_28

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    return-object p0

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_2e
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    new-instance v1, Lrz1;

    const/4 v4, 0x2

    const/4 v5, 0x3

    invoke-direct {v1, v4, v2, v5}, Lrz1;-><init>(ILmt5;B)V

    iput v3, v0, Lz3e;->v:I

    invoke-static {p0, v1, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p1, :cond_45

    return-object p1

    :cond_45
    return-object p0
.end method
