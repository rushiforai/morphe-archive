.class public final Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mBorderColor:Landroid/content/res/ColorStateList;

.field private mBorderWidth:F

.field private mCornerRadii:[F

.field private final mDisplayMetrics:Landroid/util/DisplayMetrics;

.field private mOval:Z

.field private mScaleType:Landroid/widget/ImageView$ScaleType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mCornerRadii:[F

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mOval:Z

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mBorderWidth:F

    .line 17
    .line 18
    const/high16 v0, -0x1000000

    .line 19
    .line 20
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 25
    .line 26
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 27
    .line 28
    iput-object v0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 29
    .line 30
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    .line 39
    .line 40
    return-void

    .line 41
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public static bridge synthetic a(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;

    return-object p0
.end method

.method public static bridge synthetic b(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)F
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mBorderWidth:F

    return p0
.end method

.method public static bridge synthetic c(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mCornerRadii:[F

    return-object p0
.end method

.method public static bridge synthetic d(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mOval:Z

    return p0
.end method

.method public static bridge synthetic e(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)Landroid/widget/ImageView$ScaleType;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object p0
.end method


# virtual methods
.method public borderColor(I)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    return-object p0
.end method

.method public borderColor(Landroid/content/res/ColorStateList;)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;
    .locals 0

    .line 8
    iput-object p1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;

    return-object p0
.end method

.method public borderWidth(F)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;
    .locals 0

    .line 1
    iput p1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mBorderWidth:F

    .line 2
    .line 3
    return-object p0
.end method

.method public borderWidthDp(F)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1, p1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mBorderWidth:F

    .line 9
    .line 10
    return-object p0
.end method

.method public build()Landroid/view/animation/Transformation;
    .locals 1

    .line 1
    new-instance v0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder$1;-><init>(Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public cornerRadius(F)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mCornerRadii:[F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput p1, v0, v1

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aput p1, v0, v1

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    aput p1, v0, v1

    .line 11
    .line 12
    const/4 v1, 0x3

    .line 13
    aput p1, v0, v1

    .line 14
    .line 15
    return-object p0
.end method

.method public cornerRadius(IF)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;
    .locals 1

    .line 16
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mCornerRadii:[F

    aput p2, v0, p1

    return-object p0
.end method

.method public cornerRadiusDp(F)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1, p1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0, p1}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->cornerRadius(F)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public cornerRadiusDp(IF)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;
    .locals 2

    .line 13
    iget-object v0, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    const/4 v1, 0x1

    invoke-static {v1, p2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p2

    invoke-virtual {p0, p1, p2}, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->cornerRadius(IF)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;

    move-result-object p0

    return-object p0
.end method

.method public oval(Z)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mOval:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public scaleType(Landroid/widget/ImageView$ScaleType;)Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/gip/core/view/round/RoundedTransformationBuilder;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    return-object p0
.end method
