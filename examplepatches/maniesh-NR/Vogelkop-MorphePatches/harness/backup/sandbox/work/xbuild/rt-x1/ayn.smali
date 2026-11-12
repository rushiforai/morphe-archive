.class public final Layn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lnx5;

.field public final b:Lrii;

.field public final c:Ljdj;

.field public final d:Lt0g;

.field public final e:Lt0g;


# direct methods
.method public constructor <init>(Lnx5;Lrii;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Layn;->a:Lnx5;

    iput-object p2, p0, Layn;->b:Lrii;

    const/4 p1, 0x0

    const/4 p2, 0x6

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {v0, v1, p1, p2}, Lipe;->c(IILh04;I)Ljdj;

    move-result-object p1

    iput-object p1, p0, Layn;->c:Ljdj;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p2

    iput-object p2, p0, Layn;->d:Lt0g;

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Layn;->e:Lt0g;

    return-void
.end method


# virtual methods
.method public final a(Lwc1;Lnt5;)V
    .registers 8

    instance-of v0, p2, Lzxn;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lzxn;

    iget v1, v0, Lzxn;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lzxn;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lzxn;

    invoke-direct {v0, p0, p2}, Lzxn;-><init>(Layn;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lzxn;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lzxn;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2d

    if-eq v2, v3, :cond_29

    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void

    :cond_29
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_43

    :cond_2d
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p2, Lbb7;->a:Lcv6;

    sget-object p2, Ls6d;->a:Ld7a;

    new-instance v2, Lnxn;

    const/4 v4, 0x0

    invoke-direct {v2, p0, p1, v4, v3}, Lnxn;-><init>(Layn;Lwc1;Lmt5;B)V

    iput v3, v0, Lzxn;->v:I

    invoke-static {p2, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_43

    return-void

    :cond_43
    :goto_43
    invoke-static {}, Lt3p;->v()V

    return-void
.end method
