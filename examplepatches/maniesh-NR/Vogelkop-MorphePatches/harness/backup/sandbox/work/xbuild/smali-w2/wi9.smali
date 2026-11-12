.class public final Lwi9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Llsf;

.field public final b:Lode;

.field public final c:Ldx5;

.field public final d:Ljh;

.field public final e:Ljdj;

.field public final f:Ljdj;


# direct methods
.method public constructor <init>(Llsf;Lode;Lxoc;Ldx5;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwi9;->a:Llsf;

    iput-object p2, p0, Lwi9;->b:Lode;

    iput-object p4, p0, Lwi9;->c:Ldx5;

    new-instance p1, Ljh;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p3, p1, Ljh;->c:Ljava/lang/Object;

    iput-object p1, p0, Lwi9;->d:Ljh;

    const/4 p1, 0x0

    const/4 p2, 0x6

    const/4 p3, 0x1

    const/4 p4, 0x0

    invoke-static {p3, p4, p1, p2}, Lipe;->c(IILh04;I)Ljdj;

    move-result-object p1

    iput-object p1, p0, Lwi9;->e:Ljdj;

    iput-object p1, p0, Lwi9;->f:Ljdj;

    return-void
.end method


# virtual methods
.method public final a(Ltpc;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p2, Lui9;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lui9;

    iget v1, v0, Lui9;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lui9;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lui9;

    invoke-direct {v0, p0, p2}, Lui9;-><init>(Lwi9;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lui9;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lui9;->w:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_3b

    if-eq v2, v4, :cond_33

    if-ne v2, v3, :cond_2d

    iget-object p0, v0, Lui9;->t:Lhne;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6f

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_33
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p1, p2, Lt0i;->a:Ljava/lang/Object;

    goto :goto_54

    :cond_3b
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p0, Lwi9;->a:Llsf;

    iget-object p2, p2, Llsf;->c:Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lzfo;

    iget-object v2, p1, Ltpc;->c:Ljava/lang/String;

    iget-object p1, p1, Ltpc;->b:Ljava/lang/String;

    iput v4, v0, Lui9;->w:I

    invoke-virtual {p2, v2, p1, v0}, Lzfo;->b(Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_6d

    :goto_54
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p2

    if-nez p2, :cond_72

    check-cast p1, Lhne;

    new-instance p2, Lfb9;

    invoke-direct {p2, p0, p1, v5, v4}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-object p1, v0, Lui9;->t:Lhne;

    iput v3, v0, Lui9;->w:I

    iget-object p0, p0, Lwi9;->c:Ldx5;

    invoke-static {p0, p2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_6e

    :cond_6d
    return-object v1

    :cond_6e
    move-object p0, p1

    :goto_6f
    iget-object p0, p0, Lhne;->a:Ljava/util/List;

    return-object p0

    :cond_72
    sget-object p0, Ll08;->a:Ll08;

    return-object p0
.end method

.method public final b(Lnt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p1, Lvi9;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lvi9;

    iget v1, v0, Lvi9;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lvi9;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lvi9;

    invoke-direct {v0, p0, p1}, Lvi9;-><init>(Lwi9;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lvi9;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lvi9;->x:I

    const/4 v3, 0x0

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_45

    if-eq v2, v6, :cond_3a

    if-eq v2, v5, :cond_34

    if-ne v2, v4, :cond_2e

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_74

    :cond_2e
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_34
    iget-object p0, v0, Lvi9;->t:Ljdj;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_69

    :cond_3a
    iget-object p0, v0, Lvi9;->u:Lwi9;

    iget-object v2, v0, Lvi9;->t:Ljdj;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v7, v2

    move-object v2, p1

    move-object p1, v7

    goto :goto_58

    :cond_45
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lwi9;->e:Ljdj;

    iput-object p1, v0, Lvi9;->t:Ljdj;

    iput-object p0, v0, Lvi9;->u:Lwi9;

    iput v6, v0, Lvi9;->x:I

    iget-object v2, p0, Lwi9;->b:Lode;

    invoke-static {v2, v0}, Lxf8;->v(Lekc;Lnt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_73

    :goto_58
    check-cast v2, Ltpc;

    iput-object p1, v0, Lvi9;->t:Ljdj;

    iput-object v3, v0, Lvi9;->u:Lwi9;

    iput v5, v0, Lvi9;->x:I

    invoke-virtual {p0, v2, v0}, Lwi9;->a(Ltpc;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_73

    move-object v7, p1

    move-object p1, p0

    move-object p0, v7

    :goto_69
    iput-object v3, v0, Lvi9;->t:Ljdj;

    iput v4, v0, Lvi9;->x:I

    invoke-interface {p0, p1, v0}, Lxee;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_74

    :cond_73
    return-object v1

    :cond_74
    :goto_74
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
