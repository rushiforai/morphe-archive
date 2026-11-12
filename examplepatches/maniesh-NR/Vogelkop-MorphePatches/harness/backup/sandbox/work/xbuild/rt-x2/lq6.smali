.class public final Llq6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lip6;


# direct methods
.method public synthetic constructor <init>(Lip6;)V
    .registers 2

    iput-object p1, p0, Llq6;->a:Lip6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lga8;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lkv6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lkv6;

    iget v1, v0, Lkv6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lkv6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lkv6;

    invoke-direct {v0, p0, p2}, Lkv6;-><init>(Llq6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lkv6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lkv6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lu11;

    const/16 v2, 0x9

    invoke-direct {p2, p0, p1, v3, v2}, Lu11;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v4, v0, Lkv6;->v:I

    invoke-static {p2, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_45

    return-object v1

    :cond_45
    return-object p0
.end method

.method public final b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lit6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lit6;

    iget v1, v0, Lit6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lit6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lit6;

    invoke-direct {v0, p0, p2}, Lit6;-><init>(Llq6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lit6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lit6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lu11;

    const/4 v2, 0x6

    invoke-direct {p2, p0, p1, v3, v2}, Lu11;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v4, v0, Lit6;->v:I

    invoke-static {p2, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_44

    return-object v1

    :cond_44
    return-object p0
.end method
