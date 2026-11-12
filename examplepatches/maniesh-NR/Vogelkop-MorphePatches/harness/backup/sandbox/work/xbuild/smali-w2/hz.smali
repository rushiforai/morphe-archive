.class public final Lhz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;
.implements Ldmk;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 8
    const/4 v0, 0x3

    iput-byte v0, p0, Lhz;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lhz;->a:B

    iput-object p1, p0, Lhz;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ln1;)V
    .registers 5

    iget-object v0, p0, Lhz;->b:Ljava/lang/Object;

    check-cast v0, Liyk;

    if-nez v0, :cond_7

    return-void

    :cond_7
    new-instance v1, Lex1;

    iget-object v2, p1, Ln1;->b:Ljava/lang/Object;

    check-cast v2, Lix1;

    invoke-direct {v1, p1, v2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Liyk;->run(Ljava/lang/Object;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lhz;->b:Ljava/lang/Object;

    return-void
.end method

.method public final handleSubscriptionPlans(Lbmk;)V
    .registers 4

    new-instance v0, Lhx1;

    new-instance v1, Lu7k;

    iget-object p1, p1, Lbmk;->c:Lcsh;

    invoke-direct {v1, p1}, Lu7k;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Lhx1;-><init>(Lu7k;)V

    invoke-virtual {p0, v0}, Lhz;->a(Ln1;)V

    return-void
.end method

.method public final handleSubscriptionPlans(Lcmk;)V
    .registers 3

    .line 16
    new-instance p1, Lfx1;

    const-string v0, "Subscription plans are in an unexpected state"

    invoke-direct {p1, v0}, Lfx1;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lhz;->a(Ln1;)V

    return-void
.end method

.method public final handleSubscriptionPlans(Lzlk;)V
    .registers 3

    .line 17
    new-instance p1, Lfx1;

    const-string v0, "Failed to fetch subscription plans"

    invoke-direct {p1, v0}, Lfx1;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lhz;->a(Ln1;)V

    return-void
.end method

.method public final run(Ljava/lang/Object;)V
    .registers 9

    iget-byte v0, p0, Lhz;->a:B

    packed-switch v0, :pswitch_data_a6

    check-cast p1, Lylk;

    invoke-virtual {p1, p0}, Lylk;->s0(Ldmk;)V

    return-void

    :pswitch_b
    check-cast p1, Lisl;

    iget-object p0, p0, Lhz;->b:Ljava/lang/Object;

    check-cast p0, Lbhi;

    if-eqz p1, :cond_37

    instance-of v0, p1, Lhsl;

    if-eqz v0, :cond_29

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Ljava/lang/Exception;

    const-string v0, "No token available"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    new-instance v0, Lq0i;

    invoke-direct {v0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {p0, v0}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    goto :goto_3a

    :cond_29
    instance-of v0, p1, Ljsl;

    if-eqz v0, :cond_37

    sget-object v0, Lt0i;->b:Lp0i;

    check-cast p1, Ljsl;

    iget-object p1, p1, Ljsl;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    goto :goto_3a

    :cond_37
    invoke-static {}, Lh9o;->p()V

    :goto_3a
    return-void

    :pswitch_3b
    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lhz;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_a1

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v0

    const/16 v2, 0x9

    invoke-virtual {v0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    const/4 v4, 0x1

    if-eqz v3, :cond_6c

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_6c

    new-instance v5, Lhf0;

    invoke-direct {v5, v0, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_79

    :cond_6c
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v5, Lhf0;

    invoke-direct {v5, v0, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_79
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_7d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lng0;

    new-instance v2, Lmg0;

    const/16 v3, 0x98b

    const/4 v6, -0x1

    invoke-direct {v2, v3, v6, v4}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    if-nez v0, :cond_96

    move v6, v3

    goto :goto_97

    :cond_96
    move v6, v4

    :goto_97
    invoke-virtual {v2, v3, v6, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    goto :goto_7d

    :cond_9e
    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    :cond_a1
    return-void

    :pswitch_a2
    check-cast p1, Lgz;

    return-void

    nop

    :pswitch_data_a6
    .packed-switch 0x0
        :pswitch_a2
        :pswitch_3b
        :pswitch_b
    .end packed-switch
.end method
