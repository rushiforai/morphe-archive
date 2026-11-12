.class public abstract Lzm9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lspi;Lkotlin/jvm/functions/Function2;Ln27;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzm9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lzm9;->c:Ljava/lang/Object;

    iput-object p3, p0, Lzm9;->d:Ljava/lang/Object;

    new-instance p1, Lpad;

    const/16 p2, 0xd

    invoke-direct {p1, p2}, Lpad;-><init>(B)V

    iput-object p1, p0, Lzm9;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(ZLpxh;Ldxh;Lpsn;Lssn;)V
    .registers 6

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-boolean p1, p0, Lzm9;->a:Z

    .line 21
    iput-object p2, p0, Lzm9;->b:Ljava/lang/Object;

    .line 22
    iput-object p3, p0, Lzm9;->c:Ljava/lang/Object;

    .line 23
    iput-object p4, p0, Lzm9;->d:Ljava/lang/Object;

    .line 24
    iput-object p5, p0, Lzm9;->e:Ljava/lang/Object;

    return-void
.end method

.method public static a(Lfmg;)V
    .registers 4

    iget-object p0, p0, Lfmg;->a:Ljava/util/List;

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_18

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llmg;

    invoke-virtual {v2}, Llmg;->a()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_18
    return-void
.end method


# virtual methods
.method public final b(Z)V
    .registers 4

    iget-object v0, p0, Lzm9;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-boolean v0, p0, Lzm9;->a:Z

    if-eqz v0, :cond_2d

    iget-object v0, p0, Lzm9;->e:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_15

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    :cond_15
    iget-object v0, p0, Lzm9;->c:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    if-eqz v0, :cond_28

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    :cond_28
    if-eqz p1, :cond_2d

    invoke-virtual {p0}, Lzm9;->c()V

    :cond_2d
    iget-object p1, p0, Lzm9;->d:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    iput-object p1, p0, Lzm9;->d:Ljava/lang/Object;

    return-void
.end method

.method public abstract c()V
.end method

.method public abstract d()V
.end method

.method public final e(Lkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lnze;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lnze;

    iget v1, v0, Lnze;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lnze;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lnze;

    invoke-direct {v0, p0, p2}, Lnze;-><init>(Lzm9;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lnze;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lnze;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_43

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v4, p0, Lzm9;->a:Z

    new-instance p2, Lqmb;

    const/16 v2, 0xd

    invoke-direct {p2, p0, p1, v3, v2}, Lqmb;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v4, v0, Lnze;->v:I

    invoke-static {p2, v0}, Lzch;->z(Lkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_43

    return-object v1

    :cond_43
    :goto_43
    const/4 p1, 0x0

    iput-boolean p1, p0, Lzm9;->a:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
