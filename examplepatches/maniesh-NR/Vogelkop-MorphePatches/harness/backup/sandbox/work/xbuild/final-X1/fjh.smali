.class public final Lfjh;
.super Lj0i;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic A:Landroid/content/Context;

.field public u:Landroid/graphics/RectF;

.field public v:Ljava/util/Iterator;

.field public w:Z

.field public synthetic x:Ljava/lang/Object;

.field public final synthetic y:Ljava/util/ArrayList;

.field public final synthetic z:Li97;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Li97;Landroid/content/Context;Lmt5;)V
    .registers 5

    iput-object p1, p0, Lfjh;->y:Ljava/util/ArrayList;

    iput-object p2, p0, Lfjh;->z:Li97;

    iput-object p3, p0, Lfjh;->A:Landroid/content/Context;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lj0i;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 6

    new-instance v0, Lfjh;

    iget-object v1, p0, Lfjh;->z:Li97;

    iget-object v2, p0, Lfjh;->A:Landroid/content/Context;

    iget-object p0, p0, Lfjh;->y:Ljava/util/ArrayList;

    invoke-direct {v0, p0, v1, v2, p2}, Lfjh;-><init>(Ljava/util/ArrayList;Li97;Landroid/content/Context;Lmt5;)V

    iput-object p1, v0, Lfjh;->x:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Ll1j;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfjh;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfjh;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfjh;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-object v0, p0, Lfjh;->x:Ljava/lang/Object;

    check-cast v0, Ll1j;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-boolean v2, p0, Lfjh;->w:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_1c

    if-ne v2, v4, :cond_16

    iget-object v2, p0, Lfjh;->v:Ljava/util/Iterator;

    iget-object v5, p0, Lfjh;->u:Landroid/graphics/RectF;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2a

    :cond_16
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_1c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    iget-object p1, p0, Lfjh;->y:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2a
    :goto_2a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_92

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lf76;

    invoke-virtual {v5}, Landroid/graphics/RectF;->setEmpty()V

    iget-object v6, p1, Lf83;->g:Ls9i;

    iget-object v7, p0, Lfjh;->z:Li97;

    if-eqz v6, :cond_49

    iget-object p1, v7, Li97;->b:Landroid/graphics/PointF;

    invoke-virtual {v6, p1}, Ls9i;->P(Landroid/graphics/PointF;)Landroid/graphics/Path;

    move-result-object p1

    invoke-virtual {p1, v5, v4}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    goto :goto_60

    :cond_49
    iget-object p1, p1, Lf83;->e:Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v6, Ld82;

    invoke-direct {v6, p1, v4}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lac3;

    invoke-direct {p1, v6, v3}, Lac3;-><init>(Ld82;Lmt5;)V

    new-instance v6, Ld82;

    const/4 v8, 0x3

    invoke-direct {v6, p1, v8}, Ld82;-><init>(Ljava/lang/Object;B)V

    invoke-static {v6, v5}, Lrm5;->Y(Ld82;Landroid/graphics/RectF;)V

    :goto_60
    invoke-virtual {v5}, Landroid/graphics/RectF;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2a

    iget-object p1, p0, Lfjh;->A:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget v3, v7, Li97;->c:F

    sget v6, Lbb5;->j:I

    const/high16 v6, 0x41000000    # 8.0f

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-static {v4, v6, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    mul-float/2addr p1, v3

    neg-float p1, p1

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr p1, v3

    invoke-virtual {v5, p1, p1}, Landroid/graphics/RectF;->inset(FF)V

    iput-object v0, p0, Lfjh;->x:Ljava/lang/Object;

    iput-object v5, p0, Lfjh;->u:Landroid/graphics/RectF;

    iput-object v2, p0, Lfjh;->v:Ljava/util/Iterator;

    iput-boolean v4, p0, Lfjh;->w:Z

    invoke-virtual {v0, p0, v5}, Ll1j;->a(Lmt5;Ljava/lang/Object;)V

    sget-object p0, Lpx5;->a:Lpx5;

    return-object v1

    :cond_92
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
