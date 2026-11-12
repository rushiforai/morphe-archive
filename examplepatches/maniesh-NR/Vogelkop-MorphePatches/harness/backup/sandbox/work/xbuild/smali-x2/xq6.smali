.class public final Lxq6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Ldr9;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Ljava/lang/Object;

.field public synthetic v:Ljava/lang/Object;

.field public synthetic w:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILmt5;)V
    .registers 4

    .line 10
    const/4 v0, 0x0

    iput-byte v0, p0, Lxq6;->t:B

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method

.method public constructor <init>(Lv1;Lmt5;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lxq6;->t:B

    iput-object p1, p0, Lxq6;->w:Ljava/lang/Object;

    const/4 p1, 0x4

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lxq6;->t:B

    packed-switch v0, :pswitch_data_4c

    iget-object v0, p0, Lxq6;->u:Ljava/lang/Object;

    check-cast v0, Lt8k;

    iget-object v1, p0, Lxq6;->v:Ljava/lang/Object;

    check-cast v1, Lapn;

    sget-object v2, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lxq6;->w:Ljava/lang/Object;

    check-cast p0, Lv1;

    invoke-virtual {p0}, Lv1;->v()Lr1;

    move-result-object p0

    if-eqz p0, :cond_22

    iget-boolean p0, p0, Lr1;->f:Z

    goto :goto_26

    :cond_22
    invoke-virtual {v1}, Lapn;->c()Z

    move-result p0

    :goto_26
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_2b
    iget-object v0, p0, Lxq6;->u:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ld2g;

    iget-object v0, p0, Lxq6;->v:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ly1g;

    iget-object p0, p0, Lxq6;->w:Ljava/lang/Object;

    check-cast p0, Lvq6;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v4, p0, Lvq6;->a:Ljava/util/List;

    iget-object v5, p0, Lvq6;->b:Lcum;

    iget-object v7, p0, Lvq6;->c:Lwla;

    iget-object v6, p0, Lvq6;->d:Lola;

    new-instance v1, Ldla;

    invoke-direct/range {v1 .. v7}, Ldla;-><init>(Ly1g;Ld2g;Ljava/util/List;Lcum;Lola;Lwla;)V

    return-object v1

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method

.method public final j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lxq6;->t:B

    packed-switch v0, :pswitch_data_3c

    check-cast p1, Lt8k;

    check-cast p2, Lapn;

    check-cast p3, Lq1;

    check-cast p4, Lmt5;

    new-instance p3, Lxq6;

    iget-object p0, p0, Lxq6;->w:Ljava/lang/Object;

    check-cast p0, Lv1;

    invoke-direct {p3, p0, p4}, Lxq6;-><init>(Lv1;Lmt5;)V

    iput-object p1, p3, Lxq6;->u:Ljava/lang/Object;

    iput-object p2, p3, Lxq6;->v:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p3, p0}, Lxq6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_21
    check-cast p1, Ld2g;

    check-cast p2, Ly1g;

    check-cast p3, Lvq6;

    check-cast p4, Lmt5;

    new-instance p0, Lxq6;

    const/4 v0, 0x4

    invoke-direct {p0, v0, p4}, Lxq6;-><init>(ILmt5;)V

    iput-object p1, p0, Lxq6;->u:Ljava/lang/Object;

    iput-object p2, p0, Lxq6;->v:Ljava/lang/Object;

    iput-object p3, p0, Lxq6;->w:Ljava/lang/Object;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lxq6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method
