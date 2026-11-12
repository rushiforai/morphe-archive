.class public final Lkon;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Ldr9;


# instance fields
.field public synthetic t:Z

.field public synthetic u:Z

.field public synthetic v:Z


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-boolean v0, p0, Lkon;->t:Z

    iget-boolean v1, p0, Lkon;->u:Z

    iget-boolean p0, p0, Lkon;->v:Z

    sget-object v2, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Ld2g;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-direct {p1, v0, v1, p0}, Ld2g;-><init>(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-object p1
.end method

.method public final j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    check-cast p4, Lmt5;

    new-instance p3, Lkon;

    const/4 v0, 0x4

    invoke-direct {p3, v0, p4}, Lkuk;-><init>(ILmt5;)V

    iput-boolean p0, p3, Lkon;->t:Z

    iput-boolean p1, p3, Lkon;->u:Z

    iput-boolean p2, p3, Lkon;->v:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p3, p0}, Lkon;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
