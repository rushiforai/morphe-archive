.class public final Lkf1;
.super Landroid/animation/IntEvaluator;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/view/animation/PathInterpolator;


# direct methods
.method public constructor <init>(Landroid/view/animation/PathInterpolator;)V
    .registers 2

    iput-object p1, p0, Lkf1;->a:Landroid/view/animation/PathInterpolator;

    invoke-direct {p0}, Landroid/animation/IntEvaluator;-><init>()V

    return-void
.end method


# virtual methods
.method public final evaluate(FLjava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object p0, p0, Lkf1;->a:Landroid/view/animation/PathInterpolator;

    invoke-virtual {p0, p1}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    move-result p0

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    sub-int/2addr p1, p2

    int-to-float p1, p1

    mul-float/2addr p0, p1

    float-to-int p0, p0

    add-int/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final bridge synthetic evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 28
    check-cast p2, Ljava/lang/Integer;

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2, p3}, Lkf1;->evaluate(FLjava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
