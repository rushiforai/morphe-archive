.class public Lcom/leanplum/utils/SizeUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static dp10:I = 0x0

.field public static dp100:I = 0x0

.field public static dp14:I = 0x0

.field public static dp16:I = 0x0

.field public static dp18:I = 0x0

.field public static dp2:I = 0x0

.field public static dp20:I = 0x0

.field public static dp200:I = 0x0

.field public static dp250:I = 0x0

.field public static dp30:I = 0x0

.field public static dp5:I = 0x0

.field public static dp50:I = 0x0

.field public static dp7:I = 0x0

.field private static hasInited:Z = false

.field public static final textSize0:I = 0x14

.field public static final textSize0_1:I = 0x12

.field public static final textSize0_2:I = 0x10

.field public static final textSize1:I = 0x16

.field public static final textSize2:I = 0x18


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dpToPx(Landroid/content/Context;I)I
    .registers 3

    invoke-static {p0}, Lcom/leanplum/utils/SizeUtil;->init(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    int-to-float p1, p1

    iget p0, p0, Landroid/util/DisplayMetrics;->xdpi:F

    const/high16 v0, 0x43200000    # 160.0f

    div-float/2addr p0, v0

    mul-float/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public static getDisplaySize(Landroid/app/Activity;)Landroid/graphics/Point;
    .registers 2

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    if-eqz p0, :cond_12

    :try_start_7
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p0

    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_12

    :catchall_12
    :cond_12
    return-object v0
.end method

.method public static getStatusBarHeight(Landroid/app/Activity;)I
    .registers 6

    invoke-static {p0}, Lcom/leanplum/utils/SizeUtil;->init(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/16 v1, 0x400

    and-int/2addr v0, v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_14

    return v2

    :cond_14
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "dimen"

    const-string v3, "android"

    const-string v4, "status_bar_height"

    invoke-virtual {v0, v4, v1, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_2d

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0

    :cond_2d
    return v2
.end method

.method public static getStatusBarHeight(Landroid/content/Context;)I
    .registers 5

    .line 46
    invoke-static {p0}, Lcom/leanplum/utils/SizeUtil;->init(Landroid/content/Context;)V

    .line 47
    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "status_bar_height"

    const-string v2, "dimen"

    const-string v3, "android"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_1c

    .line 48
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_1c

    return p0

    :catchall_1c
    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public static init(Landroid/content/Context;)V
    .registers 2

    sget-boolean v0, Lcom/leanplum/utils/SizeUtil;->hasInited:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    sput-boolean v0, Lcom/leanplum/utils/SizeUtil;->hasInited:Z

    const/16 v0, 0x1e

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp30:I

    const/4 v0, 0x5

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp5:I

    const/16 v0, 0x14

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp20:I

    const/16 v0, 0xa

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp10:I

    const/4 v0, 0x7

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp7:I

    const/16 v0, 0x12

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp18:I

    const/16 v0, 0x10

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp16:I

    const/16 v0, 0xe

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp14:I

    const/16 v0, 0x64

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp100:I

    const/16 v0, 0xc8

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp200:I

    const/16 v0, 0xfa

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp250:I

    const/4 v0, 0x2

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    sput v0, Lcom/leanplum/utils/SizeUtil;->dp2:I

    const/16 v0, 0x32

    invoke-static {p0, v0}, Lcom/leanplum/utils/SizeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result p0

    sput p0, Lcom/leanplum/utils/SizeUtil;->dp50:I

    return-void
.end method

.method public static pxToDp(Landroid/content/Context;I)I
    .registers 3

    invoke-static {p0}, Lcom/leanplum/utils/SizeUtil;->init(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    int-to-float p1, p1

    iget p0, p0, Landroid/util/DisplayMetrics;->xdpi:F

    const/high16 v0, 0x43200000    # 160.0f

    div-float/2addr p0, v0

    div-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public static pxToSp(Landroid/content/Context;I)I
    .registers 2

    invoke-static {p0}, Lcom/leanplum/utils/SizeUtil;->init(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    int-to-float p1, p1

    iget p0, p0, Landroid/util/DisplayMetrics;->scaledDensity:F

    div-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method

.method public static spToPx(Landroid/content/Context;I)I
    .registers 2

    invoke-static {p0}, Lcom/leanplum/utils/SizeUtil;->init(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    int-to-float p1, p1

    iget p0, p0, Landroid/util/DisplayMetrics;->scaledDensity:F

    mul-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method
