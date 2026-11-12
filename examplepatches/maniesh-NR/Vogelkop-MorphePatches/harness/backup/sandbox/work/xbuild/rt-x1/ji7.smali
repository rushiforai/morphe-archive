.class public final Lji7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:Lmi7;

.field public c:Landroid/animation/ValueAnimator;

.field public final d:Landroid/graphics/PointF;

.field public final e:Landroid/graphics/PointF;

.field public final synthetic f:Lni7;


# direct methods
.method public constructor <init>(Lni7;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lji7;->f:Lni7;

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lji7;->a:F

    sget-object v0, Lmi7;->a:Lmi7;

    iput-object v0, p0, Lji7;->b:Lmi7;

    new-instance v0, Landroid/graphics/PointF;

    iget-object v1, p1, Lni7;->n:Lii7;

    invoke-virtual {v1}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    iget-object p1, p1, Lni7;->o:Lii7;

    invoke-virtual {p1}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3

    invoke-direct {v0, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, p0, Lji7;->d:Landroid/graphics/PointF;

    new-instance v0, Landroid/graphics/PointF;

    invoke-virtual {v1}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    invoke-virtual {p1}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    invoke-direct {v0, v1, p1}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, p0, Lji7;->e:Landroid/graphics/PointF;

    return-void
.end method

.method public static synthetic b(Lji7;Lmi7;JLli7;Lwg5;Lkotlin/jvm/functions/Function0;I)V
    .registers 15

    and-int/lit8 v0, p7, 0x4

    if-eqz v0, :cond_9

    new-instance p4, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    :cond_9
    move-object v4, p4

    and-int/lit8 p4, p7, 0x8

    if-eqz p4, :cond_15

    new-instance p5, Lm57;

    const/16 p4, 0xd

    invoke-direct {p5, p4}, Lm57;-><init>(B)V

    :cond_15
    move-object v5, p5

    and-int/lit8 p7, p7, 0x10

    if-eqz p7, :cond_21

    new-instance p6, Lki5;

    const/16 p4, 0x1a

    invoke-direct {p6, p4}, Lki5;-><init>(B)V

    :cond_21
    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lji7;->a(Lmi7;JLandroid/animation/TimeInterpolator;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final a(Lmi7;JLandroid/animation/TimeInterpolator;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)V
    .registers 9

    iget-object v0, p0, Lji7;->c:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lji7;->c:Landroid/animation/ValueAnimator;

    iput-object p1, p0, Lji7;->b:Lmi7;

    iget-object p1, p0, Lji7;->f:Lni7;

    iget-object v0, p1, Lni7;->n:Lii7;

    invoke-virtual {v0}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    iget-object v1, p0, Lji7;->d:Landroid/graphics/PointF;

    iput v0, v1, Landroid/graphics/PointF;->x:F

    iget-object v0, p1, Lni7;->o:Lii7;

    invoke-virtual {v0}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    iput v0, v1, Landroid/graphics/PointF;->y:F

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_5e

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    invoke-virtual {v0, p4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-static {p2, p3}, Lpn7;->f(J)J

    move-result-wide p2

    invoke-virtual {v0, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance p2, Laf1;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p1, p5, p3}, Laf1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    sget p1, Lni7;->C:I

    new-instance p1, Llqh;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance p2, Lki7;

    invoke-direct {p2, p1, p6, p1}, Lki7;-><init>(Llqh;Lkotlin/jvm/functions/Function0;Llqh;)V

    invoke-virtual {v0, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    iput-object v0, p0, Lji7;->c:Landroid/animation/ValueAnimator;

    return-void

    :array_5e
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final c(FF)V
    .registers 3

    iget-object p0, p0, Lji7;->e:Landroid/graphics/PointF;

    iput p1, p0, Landroid/graphics/PointF;->x:F

    iput p2, p0, Landroid/graphics/PointF;->y:F

    return-void
.end method
