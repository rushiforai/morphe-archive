.class public final Lcom/opera/android/utilities/DisplayUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/Object;

.field public static b:Landroid/view/Display;

.field public static c:Landroid/util/DisplayMetrics;

.field public static d:I

.field public static e:F

.field public static f:F

.field public static g:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/opera/android/utilities/DisplayUtil;->a:Ljava/lang/Object;

    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .registers 2

    invoke-static {p0}, Lcom/opera/android/utilities/DisplayUtil;->f(Landroid/content/Context;)V

    sget v0, Lcom/opera/android/utilities/DisplayUtil;->f:F

    invoke-static {p0, v0}, Lcom/opera/android/utilities/DisplayUtil;->d(Landroid/content/Context;F)Z

    move-result p0

    return p0
.end method

.method public static b(Landroid/content/Context;)I
    .registers 1

    invoke-static {p0}, Lcom/opera/android/utilities/DisplayUtil;->f(Landroid/content/Context;)V

    sget-object p0, Lcom/opera/android/utilities/DisplayUtil;->b:Landroid/view/Display;

    invoke-virtual {p0}, Landroid/view/Display;->getHeight()I

    move-result p0

    return p0
.end method

.method public static c(Landroid/content/Context;)I
    .registers 1

    invoke-static {p0}, Lcom/opera/android/utilities/DisplayUtil;->f(Landroid/content/Context;)V

    sget-object p0, Lcom/opera/android/utilities/DisplayUtil;->b:Landroid/view/Display;

    invoke-virtual {p0}, Landroid/view/Display;->getWidth()I

    move-result p0

    return p0
.end method

.method public static d(Landroid/content/Context;F)Z
    .registers 6

    sget v0, Lcom/opera/android/utilities/DisplayUtil;->g:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_2f

    const/4 v3, 0x2

    if-eq v0, v3, :cond_2f

    const/4 v3, 0x3

    if-eq v0, v3, :cond_28

    const/4 v3, 0x4

    if-eq v0, v3, :cond_27

    sget v0, Lcom/opera/android/utilities/DisplayUtil;->e:F

    cmpl-float p1, v0, p1

    if-ltz p1, :cond_26

    invoke-static {p0}, Lcom/opera/android/utilities/DisplayUtil;->c(Landroid/content/Context;)I

    move-result p1

    invoke-static {p0}, Lcom/opera/android/utilities/DisplayUtil;->b(Landroid/content/Context;)I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/16 p1, 0x258

    if-lt p0, p1, :cond_26

    return v2

    :cond_26
    return v1

    :cond_27
    return v2

    :cond_28
    sget p0, Lcom/opera/android/utilities/DisplayUtil;->e:F

    cmpl-float p0, p0, p1

    if-ltz p0, :cond_2f

    return v2

    :cond_2f
    return v1
.end method

.method public static e(Landroid/content/Context;)Z
    .registers 2

    invoke-static {p0}, Lcom/opera/android/utilities/DisplayUtil;->f(Landroid/content/Context;)V

    const v0, 0x40b9999a    # 5.8f

    invoke-static {p0, v0}, Lcom/opera/android/utilities/DisplayUtil;->d(Landroid/content/Context;F)Z

    move-result p0

    return p0
.end method

.method public static f(Landroid/content/Context;)V
    .registers 6

    sget-object v0, Lcom/opera/android/utilities/DisplayUtil;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/opera/android/utilities/DisplayUtil;->b:Landroid/view/Display;

    if-eqz v1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    const-string v1, "window"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    sput-object v1, Lcom/opera/android/utilities/DisplayUtil;->b:Landroid/view/Display;

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    sput-object v1, Lcom/opera/android/utilities/DisplayUtil;->c:Landroid/util/DisplayMetrics;

    sget-object v2, Lcom/opera/android/utilities/DisplayUtil;->b:Landroid/view/Display;

    invoke-virtual {v2, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_7e

    :try_start_23
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0080

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    sput v1, Lcom/opera/android/utilities/DisplayUtil;->d:I
    :try_end_30
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_23 .. :try_end_30} :catch_31
    .catchall {:try_start_23 .. :try_end_30} :catchall_7e

    goto :goto_35

    :catch_31
    const/16 v1, 0xf0

    :try_start_33
    sput v1, Lcom/opera/android/utilities/DisplayUtil;->d:I

    :goto_35
    sget-object v1, Lcom/opera/android/utilities/DisplayUtil;->b:Landroid/view/Display;

    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v2

    int-to-float v2, v2

    sget-object v3, Lcom/opera/android/utilities/DisplayUtil;->c:Landroid/util/DisplayMetrics;

    iget v3, v3, Landroid/util/DisplayMetrics;->xdpi:F

    div-float/2addr v2, v3

    invoke-virtual {v1}, Landroid/view/Display;->getHeight()I

    move-result v1

    int-to-float v1, v1

    sget-object v3, Lcom/opera/android/utilities/DisplayUtil;->c:Landroid/util/DisplayMetrics;

    iget v3, v3, Landroid/util/DisplayMetrics;->ydpi:F

    div-float/2addr v1, v3

    mul-float/2addr v2, v2

    mul-float/2addr v1, v1

    add-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float v1, v1

    sput v1, Lcom/opera/android/utilities/DisplayUtil;->e:F

    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07099d

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    invoke-virtual {v1}, Landroid/util/TypedValue;->getFloat()F

    move-result v1

    sput v1, Lcom/opera/android/utilities/DisplayUtil;->f:F

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 p0, p0, 0xf

    sput p0, Lcom/opera/android/utilities/DisplayUtil;->g:I

    monitor-exit v0

    return-void

    :goto_7c
    monitor-exit v0
    :try_end_7d
    .catchall {:try_start_33 .. :try_end_7d} :catchall_7e

    throw p0

    :catchall_7e
    move-exception p0

    goto :goto_7c
.end method

.method public static isTabletFormFactor()Z
    .registers 2

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0047

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_12

    const/4 v0, 0x1

    return v0

    :cond_12
    const/4 v0, 0x0

    return v0
.end method
