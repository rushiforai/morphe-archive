.class public final Lpn6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Loji;

.field public final b:Lw6j;


# direct methods
.method public constructor <init>(Lauj;Loji;Lw6j;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lpn6;->a:Loji;

    iput-object p3, p0, Lpn6;->b:Lw6j;

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p1, Lon6;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lon6;

    iget v1, v0, Lon6;->y:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lon6;->y:I

    goto :goto_18

    :cond_13
    new-instance v0, Lon6;

    invoke-direct {v0, p0, p1}, Lon6;-><init>(Lpn6;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lon6;->w:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lon6;->y:I

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_3b

    if-eq v2, v5, :cond_37

    if-ne v2, v4, :cond_31

    iget-object p0, v0, Lon6;->v:Ljava/lang/String;

    iget-object v1, v0, Lon6;->u:Ljava/lang/String;

    iget-object v0, v0, Lon6;->t:Lika;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_73

    :cond_31
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_37
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_48

    :cond_3b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput v5, v0, Lon6;->y:I

    iget-object p1, p0, Lpn6;->a:Loji;

    invoke-virtual {p1, v0}, Loji;->C(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_6d

    :goto_48
    check-cast p1, Lbum;

    sget-object v2, Lj2h;->a:[Lj2h;

    sget-object v2, Lika;->c:Lika;

    iget-object v5, p1, Lbum;->a:Ljava/lang/String;

    iget-object p1, p1, Lbum;->b:Ljava/lang/String;

    iput-object v2, v0, Lon6;->t:Lika;

    iput-object v5, v0, Lon6;->u:Ljava/lang/String;

    iput-object p1, v0, Lon6;->v:Ljava/lang/String;

    iput v4, v0, Lon6;->y:I

    iget-object p0, p0, Lpn6;->b:Lw6j;

    iget-object v4, p0, Lw6j;->c:Ljava/lang/Object;

    check-cast v4, Ljg8;

    new-instance v6, Lu6k;

    const/16 v7, 0x9

    invoke-direct {v6, v7, v3, p0}, Lu6k;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v4, v6, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_6e

    :cond_6d
    return-object v1

    :cond_6e
    move-object v0, p1

    move-object p1, p0

    move-object p0, v0

    move-object v0, v2

    move-object v1, v5

    :goto_73
    check-cast p1, Ljava/lang/String;

    new-instance v2, Lhka;

    invoke-direct {v2, v0, v1, p0, p1}, Lhka;-><init>(Lika;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method
