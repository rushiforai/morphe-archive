.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->i(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:F

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;FFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;->a:F

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;->b:F

    .line 6
    .line 7
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;->c:F

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4
    .param p1    # Landroid/animation/ValueAnimator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;->a:F

    .line 12
    .line 13
    const/high16 v1, 0x40000000    # 2.0f

    .line 14
    .line 15
    div-float v2, v0, v1

    .line 16
    .line 17
    const/high16 v3, 0x3f800000    # 1.0f

    .line 18
    .line 19
    add-float/2addr v2, v3

    .line 20
    cmpl-float v2, p1, v2

    .line 21
    .line 22
    if-lez v2, :cond_0

    .line 23
    .line 24
    div-float v2, v0, v1

    .line 25
    .line 26
    add-float/2addr v2, v3

    .line 27
    div-float/2addr v0, v1

    .line 28
    add-float/2addr v0, v3

    .line 29
    sub-float/2addr p1, v0

    .line 30
    sub-float p1, v2, p1

    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;->b:F

    .line 35
    .line 36
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;->c:F

    .line 37
    .line 38
    mul-float/2addr v2, p1

    .line 39
    add-float/2addr v1, v2

    .line 40
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->d(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;F)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 46
    .line 47
    .line 48
    return-void
.end method
