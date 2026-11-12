.class public final Lamc;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public t:Z

.field public final synthetic u:Lgmc;

.field public final synthetic v:J

.field public final synthetic w:Loi9;


# direct methods
.method public constructor <init>(Lgmc;JLoi9;Lmt5;)V
    .registers 6

    iput-object p1, p0, Lamc;->u:Lgmc;

    iput-wide p2, p0, Lamc;->v:J

    iput-object p4, p0, Lamc;->w:Loi9;

    const/4 p1, 0x1

    invoke-direct {p0, p1, p5}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Lmt5;)Lmt5;
    .registers 8

    new-instance v0, Lamc;

    iget-wide v2, p0, Lamc;->v:J

    iget-object v4, p0, Lamc;->w:Loi9;

    iget-object v1, p0, Lamc;->u:Lgmc;

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lamc;-><init>(Lgmc;JLoi9;Lmt5;)V

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lmt5;

    invoke-virtual {p0, p1}, Lamc;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lamc;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lamc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lamc;->t:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_14

    if-ne v1, v2, :cond_d

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_36

    :cond_d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_14
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lamc;->u:Lgmc;

    iget-object p1, p1, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    iput-boolean v2, p0, Lamc;->t:Z

    iget-object p1, p1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v1, Lqv0;

    iget-object v3, p0, Lamc;->w:Loi9;

    iget-wide v4, p0, Lamc;->v:J

    invoke-direct {v1, v3, v4, v5, v2}, Lqv0;-><init>(Ljava/lang/Object;JB)V

    const/4 v3, 0x0

    invoke-static {p0, p1, v3, v2, v1}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_36

    return-object v0

    :cond_36
    :goto_36
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
