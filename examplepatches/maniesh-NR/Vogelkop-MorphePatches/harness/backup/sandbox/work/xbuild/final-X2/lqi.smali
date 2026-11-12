.class public final Llqi;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public t:Z

.field public final synthetic u:Z

.field public final synthetic v:Ly03;

.field public final synthetic w:Lshf;

.field public final synthetic x:Lv84;

.field public final synthetic y:Lxbf;

.field public final synthetic z:Z


# direct methods
.method public constructor <init>(ZLy03;Lshf;Lv84;Lxbf;ZLmt5;)V
    .registers 8

    iput-boolean p1, p0, Llqi;->u:Z

    iput-object p2, p0, Llqi;->v:Ly03;

    iput-object p3, p0, Llqi;->w:Lshf;

    iput-object p4, p0, Llqi;->x:Lv84;

    iput-object p5, p0, Llqi;->y:Lxbf;

    iput-boolean p6, p0, Llqi;->z:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p7}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 11

    new-instance v0, Llqi;

    iget-object v5, p0, Llqi;->y:Lxbf;

    iget-boolean v6, p0, Llqi;->z:Z

    iget-boolean v1, p0, Llqi;->u:Z

    iget-object v2, p0, Llqi;->v:Ly03;

    iget-object v3, p0, Llqi;->w:Lshf;

    iget-object v4, p0, Llqi;->x:Lv84;

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Llqi;-><init>(ZLy03;Lshf;Lv84;Lxbf;ZLmt5;)V

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Llqi;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Llqi;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Llqi;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Llqi;->t:Z

    const/4 v2, 0x0

    const/4 v3, 0x3

    iget-object v4, p0, Llqi;->y:Lxbf;

    const/4 v5, 0x1

    iget-object v6, p0, Llqi;->v:Ly03;

    if-eqz v1, :cond_19

    if-ne v1, v5, :cond_13

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_31

    :cond_13
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_19
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-boolean p1, p0, Llqi;->u:Z

    if-eqz p1, :cond_4b

    iget p1, v6, Ly03;->a:I

    if-ge p1, v3, :cond_4b

    invoke-virtual {v6}, Ly03;->a()J

    move-result-wide v1

    iput-boolean v5, p0, Llqi;->t:Z

    invoke-static {v1, v2, p0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_31

    return-object v0

    :cond_31
    :goto_31
    iget-object p1, p0, Llqi;->x:Lv84;

    invoke-interface {p1}, Lv84;->clone()Lv84;

    move-result-object p1

    iget v0, v6, Ly03;->a:I

    if-ge v0, v3, :cond_3e

    add-int/2addr v0, v5

    iput v0, v6, Ly03;->a:I

    :cond_3e
    new-instance v0, Lp8f;

    const/16 v1, 0xe

    iget-object p0, p0, Llqi;->w:Lshf;

    invoke-direct {v0, p0, v4, v6, v1}, Lp8f;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Lv84;->enqueue(Lf94;)V

    goto :goto_69

    :cond_4b
    iget-boolean p0, p0, Llqi;->z:Z

    if-eqz p0, :cond_62

    iget-object p0, v4, Lxbf;->c:Ljava/lang/Object;

    check-cast p0, Lvqi;

    iget-object p0, p0, Lvqi;->e:Luqi;

    iget-object p0, p0, Luqi;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "etag"

    invoke-static {p0, p1, v2}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    :cond_62
    iget-object p0, v4, Lxbf;->g:Ljava/lang/Object;

    check-cast p0, Lq2g;

    invoke-virtual {p0}, Lq2g;->run()V

    :goto_69
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
