.class public final Lbgo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lpna;

.field public final c:Lqe6;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lpna;Lqe6;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbgo;->a:Ljava/lang/String;

    iput-object p2, p0, Lbgo;->b:Lpna;

    iput-object p3, p0, Lbgo;->c:Lqe6;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p2, Lago;

    if-eqz v0, :cond_14

    move-object v0, p2

    check-cast v0, Lago;

    iget v1, v0, Lago;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lago;->v:I

    :goto_12
    move-object v6, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lago;

    invoke-direct {v0, p0, p2}, Lago;-><init>(Lbgo;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p2, v6, Lago;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v6, Lago;->v:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_30

    if-ne v1, v2, :cond_2a

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    return-object p2

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    move-object p2, v3

    new-instance v3, Lceo;

    const/16 v1, 0xa

    invoke-direct {v3, p0, p1, v1}, Lceo;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-class p1, Lozh;

    invoke-static {p1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    :try_start_41
    const-class v4, Lx1d;

    invoke-static {v4}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v4

    sget-object v5, Lkotlin/reflect/KTypeProjection;->c:Lztb;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v4

    invoke-static {p1, v4}, Luqh;->e(Ljava/lang/Class;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object p1
    :try_end_54
    .catchall {:try_start_41 .. :try_end_54} :catchall_55

    goto :goto_56

    :catchall_55
    move-object p1, p2

    :goto_56
    new-instance v4, Lx9m;

    invoke-direct {v4, v1, p1}, Lx9m;-><init>(Litb;Lcam;)V

    iput v2, v6, Lago;->v:I

    const-string v5, ""

    iget-object v1, p0, Lbgo;->c:Lqe6;

    iget-object v2, p0, Lbgo;->b:Lpna;

    invoke-virtual/range {v1 .. v6}, Lqe6;->U(Lpna;Lkotlin/jvm/functions/Function1;Lx9m;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_6a

    return-object v0

    :cond_6a
    return-object p0
.end method
