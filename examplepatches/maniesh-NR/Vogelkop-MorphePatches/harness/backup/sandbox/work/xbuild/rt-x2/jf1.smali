.class public final Ljf1;
.super Landroid/animation/FloatEvaluator;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/view/animation/PathInterpolator;


# direct methods
.method public constructor <init>(Landroid/view/animation/PathInterpolator;)V
    .registers 2

    iput-object p1, p0, Ljf1;->a:Landroid/view/animation/PathInterpolator;

    invoke-direct {p0}, Landroid/animation/FloatEvaluator;-><init>()V

    return-void
.end method


# virtual methods
.method public final evaluate(FLjava/lang/Number;Ljava/lang/Number;)Ljava/lang/Float;
    .registers 5

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget-object p0, p0, Ljf1;->a:Landroid/view/animation/PathInterpolator;

    invoke-virtual {p0, p1}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    move-result p0

    check-cast p3, Ljava/lang/Float;

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    sub-float/2addr p1, p2

    mul-float/2addr p1, p0

    add-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public final bridge synthetic evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 30
    check-cast p2, Ljava/lang/Number;

    check-cast p3, Ljava/lang/Number;

    invoke-virtual {p0, p1, p2, p3}, Ljf1;->evaluate(FLjava/lang/Number;Ljava/lang/Number;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method
