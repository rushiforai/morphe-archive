.class public final Lbqc;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lfr9;


# instance fields
.field public synthetic t:Ljava/lang/Boolean;

.field public synthetic u:Z

.field public synthetic v:Z

.field public synthetic w:Ljava/util/List;

.field public synthetic x:Z

.field public final synthetic y:Ldqc;


# direct methods
.method public constructor <init>(Ldqc;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lbqc;->y:Ldqc;

    const/4 p1, 0x6

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Lbqc;->t:Ljava/lang/Boolean;

    iget-boolean v1, p0, Lbqc;->u:Z

    iget-boolean v2, p0, Lbqc;->v:Z

    iget-object v3, p0, Lbqc;->w:Ljava/util/List;

    check-cast v3, Ljava/util/List;

    iget-boolean v4, p0, Lbqc;->x:Z

    sget-object v5, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lbqc;->y:Ldqc;

    iget-object p0, p0, Ldqc;->a:Lfs6;

    iget-object p0, p0, Lfs6;->d:Ljze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_2f

    if-nez v4, :cond_2f

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_32

    :cond_2f
    sget-object p0, Leqc;->a:Leqc;

    return-object p0

    :cond_32
    new-instance p0, Lfqc;

    invoke-direct {p0, v3, v1, v2, p1}, Lfqc;-><init>(Ljava/util/List;ZZZ)V

    return-object p0
.end method

.method public final k(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    check-cast p4, Ljava/util/List;

    check-cast p5, Ljava/lang/Boolean;

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p5

    check-cast p6, Lmt5;

    new-instance v0, Lbqc;

    iget-object p0, p0, Lbqc;->y:Ldqc;

    invoke-direct {v0, p0, p6}, Lbqc;-><init>(Ldqc;Lmt5;)V

    iput-object p1, v0, Lbqc;->t:Ljava/lang/Boolean;

    iput-boolean p2, v0, Lbqc;->u:Z

    iput-boolean p3, v0, Lbqc;->v:Z

    check-cast p4, Ljava/util/List;

    iput-object p4, v0, Lbqc;->w:Ljava/util/List;

    iput-boolean p5, v0, Lbqc;->x:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lbqc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
