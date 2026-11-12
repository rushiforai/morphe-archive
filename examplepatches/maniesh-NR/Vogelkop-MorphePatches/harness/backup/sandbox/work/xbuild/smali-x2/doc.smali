.class public final Ldoc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Llsf;

.field public final b:Lode;


# direct methods
.method public constructor <init>(Llsf;Lode;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldoc;->a:Llsf;

    iput-object p2, p0, Ldoc;->b:Lode;

    return-void
.end method


# virtual methods
.method public final a(JLnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p3, Lcoc;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lcoc;

    iget v1, v0, Lcoc;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lcoc;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lcoc;

    invoke-direct {v0, p0, p3}, Lcoc;-><init>(Ldoc;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lcoc;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lcoc;->v:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_32

    if-ne v2, v3, :cond_2c

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p3, Lt0i;

    iget-object p0, p3, Lt0i;->a:Ljava/lang/Object;

    goto :goto_56

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_32
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p3, p0, Ldoc;->b:Lode;

    invoke-virtual {p3}, Lekc;->g()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ltpc;

    iget-object p0, p0, Ldoc;->a:Llsf;

    iget-object p0, p0, Llsf;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzfo;

    if-eqz p3, :cond_4c

    iget-object p3, p3, Ltpc;->c:Ljava/lang/String;

    goto :goto_4d

    :cond_4c
    move-object p3, v4

    :goto_4d
    iput v3, v0, Lcoc;->v:I

    invoke-virtual {p0, p1, p2, v0, p3}, Lzfo;->a(JLnt5;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_56

    return-object v1

    :cond_56
    :goto_56
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-nez p1, :cond_61

    check-cast p0, Lcne;

    iget-object p0, p0, Lcne;->a:Lmme;

    return-object p0

    :cond_61
    return-object v4
.end method
