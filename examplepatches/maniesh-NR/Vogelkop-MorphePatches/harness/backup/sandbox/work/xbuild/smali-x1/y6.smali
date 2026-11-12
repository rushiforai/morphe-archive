.class public final Ly6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public t:Z

.field public final synthetic u:Ljpi;

.field public final synthetic v:F

.field public final synthetic w:F


# direct methods
.method public constructor <init>(Ljpi;FFLmt5;)V
    .registers 5

    iput-object p1, p0, Ly6;->u:Ljpi;

    iput p2, p0, Ly6;->v:F

    iput p3, p0, Ly6;->w:F

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    new-instance p1, Ly6;

    iget v0, p0, Ly6;->v:F

    iget v1, p0, Ly6;->w:F

    iget-object p0, p0, Ly6;->u:Ljpi;

    invoke-direct {p1, p0, v0, v1, p2}, Ly6;-><init>(Ljpi;FFLmt5;)V

    return-object p1
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Ly6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ly6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ly6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Ly6;->t:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_14

    if-ne v1, v2, :cond_d

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3c

    :cond_d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_14
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget p1, p0, Ly6;->v:F

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long v3, p1

    iget p1, p0, Ly6;->w:F

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long v5, p1

    const/16 p1, 0x20

    shl-long/2addr v3, p1

    const-wide v7, 0xffffffffL

    and-long/2addr v5, v7

    or-long/2addr v3, v5

    iput-boolean v2, p0, Ly6;->t:Z

    iget-object p1, p0, Ly6;->u:Ljpi;

    iget-object p1, p1, Ljpi;->R:Lspi;

    invoke-static {p1, v3, v4, p0}, Lepi;->b(Lspi;JLnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_3c

    return-object v0

    :cond_3c
    :goto_3c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
