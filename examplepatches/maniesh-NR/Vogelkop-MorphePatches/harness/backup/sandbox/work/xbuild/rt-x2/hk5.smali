.class public final Lhk5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lakg;[FLjava/util/ArrayList;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lhk5;->a:B

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lhk5;->b:Ljava/lang/Object;

    iput-object p3, p0, Lhk5;->c:Ljava/lang/Object;

    iput-object p1, p0, Lhk5;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lumi;Lki5;Llh4;)V
    .registers 10

    const/4 v0, 0x0

    iput-byte v0, p0, Lhk5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lhk5;->b:Ljava/lang/Object;

    iput-object p3, p0, Lhk5;->c:Ljava/lang/Object;

    new-instance p2, Llb4;

    const/16 p3, 0x19

    invoke-direct {p2, p0, p3}, Llb4;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, p2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    const/4 v1, 0x0

    const/4 v5, 0x0

    const-wide/16 v2, 0x1e

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v5}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    iput-object v0, p0, Lhk5;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lhk5;->a:B

    packed-switch v0, :pswitch_data_4a

    check-cast p1, Likg;

    iget-object v0, p0, Lhk5;->b:Ljava/lang/Object;

    check-cast v0, [F

    iget-object v1, p0, Lhk5;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    aget p1, v0, p1

    iget-object p0, p0, Lhk5;->d:Ljava/lang/Object;

    check-cast p0, Lakg;

    iget-object p0, p0, Lakg;->l:Ljava/lang/Object;

    check-cast p0, Lxbf;

    iget-object p0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgig;

    new-instance v0, Lthg;

    invoke-direct {v0, p1}, Lthg;-><init>(F)V

    invoke-interface {p0, v0}, Lgig;->c(Lthg;)V

    return-void

    :pswitch_30
    iget-object v0, p0, Lhk5;->d:Ljava/lang/Object;

    check-cast v0, Loml;

    const/4 v1, 0x0

    if-eqz v0, :cond_3d

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Loml;->cancel(Z)Z

    iput-object v1, p0, Lhk5;->d:Ljava/lang/Object;

    :cond_3d
    iget-object v0, p0, Lhk5;->c:Ljava/lang/Object;

    check-cast v0, Llh4;

    if-eqz v0, :cond_48

    invoke-virtual {v0, p1}, Llh4;->run(Ljava/lang/Object;)V

    iput-object v1, p0, Lhk5;->c:Ljava/lang/Object;

    :cond_48
    return-void

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_30
    .end packed-switch
.end method
