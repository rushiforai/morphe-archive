.class public final Lyq6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Ler9;


# instance fields
.field public final synthetic A:Lxm5;

.field public final synthetic B:Lx77;

.field public final synthetic C:Lqe6;

.field public final synthetic D:Lk5o;

.field public t:Z

.field public synthetic u:Z

.field public synthetic v:Z

.field public synthetic w:Z

.field public synthetic x:Z

.field public final synthetic y:Li06;

.field public final synthetic z:Leq6;


# direct methods
.method public constructor <init>(Li06;Leq6;Lxm5;Lx77;Lqe6;Lk5o;Lmt5;)V
    .registers 8

    iput-object p1, p0, Lyq6;->y:Li06;

    iput-object p2, p0, Lyq6;->z:Leq6;

    iput-object p3, p0, Lyq6;->A:Lxm5;

    iput-object p4, p0, Lyq6;->B:Lx77;

    iput-object p5, p0, Lyq6;->C:Lqe6;

    iput-object p6, p0, Lyq6;->D:Lk5o;

    const/4 p1, 0x5

    invoke-direct {p0, p1, p7}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    iget-boolean v3, p0, Lyq6;->u:Z

    iget-boolean v4, p0, Lyq6;->v:Z

    iget-boolean v5, p0, Lyq6;->w:Z

    iget-boolean v2, p0, Lyq6;->x:Z

    sget-object v12, Lpx5;->a:Lpx5;

    iget-boolean v0, p0, Lyq6;->t:Z

    const/4 v13, 0x1

    if-eqz v0, :cond_1c

    if-ne v0, v13, :cond_15

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    return-object p1

    :cond_15
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_1c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v0, Lwq6;

    iget-object v10, p0, Lyq6;->D:Lk5o;

    const/4 v11, 0x0

    iget-object v1, p0, Lyq6;->y:Li06;

    iget-object v6, p0, Lyq6;->z:Leq6;

    iget-object v7, p0, Lyq6;->A:Lxm5;

    iget-object v8, p0, Lyq6;->B:Lx77;

    iget-object v9, p0, Lyq6;->C:Lqe6;

    invoke-direct/range {v0 .. v11}, Lwq6;-><init>(Li06;ZZZZLeq6;Lxm5;Lx77;Lqe6;Lk5o;Lmt5;)V

    iput-boolean v3, p0, Lyq6;->u:Z

    iput-boolean v4, p0, Lyq6;->v:Z

    iput-boolean v5, p0, Lyq6;->w:Z

    iput-boolean v2, p0, Lyq6;->x:Z

    iput-boolean v13, p0, Lyq6;->t:Z

    invoke-static {v0, p0}, Lsgb;->q(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v12, :cond_42

    return-object v12

    :cond_42
    return-object p0
.end method

.method public final m(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    check-cast p4, Ljava/lang/Boolean;

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    move-object v7, p5

    check-cast v7, Lmt5;

    new-instance v0, Lyq6;

    iget-object v5, p0, Lyq6;->C:Lqe6;

    iget-object v6, p0, Lyq6;->D:Lk5o;

    iget-object v1, p0, Lyq6;->y:Li06;

    iget-object v2, p0, Lyq6;->z:Leq6;

    iget-object v3, p0, Lyq6;->A:Lxm5;

    iget-object v4, p0, Lyq6;->B:Lx77;

    invoke-direct/range {v0 .. v7}, Lyq6;-><init>(Li06;Leq6;Lxm5;Lx77;Lqe6;Lk5o;Lmt5;)V

    iput-boolean p1, v0, Lyq6;->u:Z

    iput-boolean p2, v0, Lyq6;->v:Z

    iput-boolean p3, v0, Lyq6;->w:Z

    iput-boolean p4, v0, Lyq6;->x:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lyq6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
