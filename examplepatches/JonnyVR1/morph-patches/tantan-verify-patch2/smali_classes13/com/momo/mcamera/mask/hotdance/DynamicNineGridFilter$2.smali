.class Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->onMusicBeatDetect(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;

.field final synthetic val$offsetModel:Lcom/momo/mcamera/mask/hotdance/DanceModel;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;Lcom/momo/mcamera/mask/hotdance/DanceModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$2;->this$0:Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$2;->val$offsetModel:Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$2;->this$0:Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$2;->val$offsetModel:Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 14
    .line 15
    iget v2, v1, Lcom/momo/mcamera/mask/hotdance/DanceModel;->startScale:F

    .line 16
    .line 17
    iget v1, v1, Lcom/momo/mcamera/mask/hotdance/DanceModel;->endScale:F

    .line 18
    .line 19
    sub-float/2addr v1, v2

    .line 20
    mul-float/2addr v1, p1

    .line 21
    add-float/2addr v2, v1

    .line 22
    invoke-static {v0, v2}, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->access$002(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;F)F

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$2;->this$0:Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$2;->val$offsetModel:Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 28
    .line 29
    iget v2, v1, Lcom/momo/mcamera/mask/hotdance/DanceModel;->startTranslateX:F

    .line 30
    .line 31
    iget v1, v1, Lcom/momo/mcamera/mask/hotdance/DanceModel;->endTranslateX:F

    .line 32
    .line 33
    sub-float/2addr v1, v2

    .line 34
    mul-float/2addr v1, p1

    .line 35
    add-float/2addr v2, v1

    .line 36
    invoke-static {v0, v2}, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->access$102(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;F)F

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$2;->this$0:Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$2;->val$offsetModel:Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 42
    .line 43
    iget v1, p0, Lcom/momo/mcamera/mask/hotdance/DanceModel;->startTranslateY:F

    .line 44
    .line 45
    iget p0, p0, Lcom/momo/mcamera/mask/hotdance/DanceModel;->endTranslateY:F

    .line 46
    .line 47
    sub-float/2addr p0, v1

    .line 48
    mul-float/2addr p0, p1

    .line 49
    add-float/2addr v1, p0

    .line 50
    invoke-static {v0, v1}, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->access$202(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;F)F

    .line 51
    .line 52
    .line 53
    return-void
.end method
