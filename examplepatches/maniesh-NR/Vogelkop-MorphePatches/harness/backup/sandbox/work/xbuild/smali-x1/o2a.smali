.class public final Lo2a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F

.field public c:I

.field public d:I

.field public e:Landroid/graphics/LinearGradient;

.field public final synthetic f:Lcom/opera/android/widget/GradientSlider;


# direct methods
.method public constructor <init>(Lcom/opera/android/widget/GradientSlider;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo2a;->f:Lcom/opera/android/widget/GradientSlider;

    const/high16 p1, -0x800000    # Float.NEGATIVE_INFINITY

    iput p1, p0, Lo2a;->a:F

    iput p1, p0, Lo2a;->b:F

    invoke-virtual {p0, p2}, Lo2a;->a(Landroid/content/res/ColorStateList;)I

    move-result p1

    iput p1, p0, Lo2a;->c:I

    invoke-virtual {p0, p3}, Lo2a;->a(Landroid/content/res/ColorStateList;)I

    move-result p1

    iput p1, p0, Lo2a;->d:I

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/res/ColorStateList;)I
    .registers 3

    iget-object p0, p0, Lo2a;->f:Lcom/opera/android/widget/GradientSlider;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object p0

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    invoke-virtual {p1, p0, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p0

    return p0
.end method
