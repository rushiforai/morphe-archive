.class public final Le/e/a/PopupFrame233;
.super Ljava/lang/Object;
.source "PopupFrame233.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PopupFrame233$State;
    }
.end annotation


# static fields
.field static final frames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/PopupFrame233$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PopupFrame233;->frames:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Ljava/lang/Object;)V
    .registers 3

    .line 7
    :try_start_0
    const-string v0, "e"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_21

    sget-object v1, Le/e/a/PopupFrame233;->frames:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    goto :goto_21

    :cond_13
    new-instance v1, Le/e/a/PopupFrame233$State;

    invoke-direct {v1, p0, v0}, Le/e/a/PopupFrame233$State;-><init>(Ljava/lang/Object;Landroid/view/View;)V

    sget-object p0, Le/e/a/PopupFrame233;->frames:Ljava/util/Map;

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_20} :catch_22

    goto :goto_2a

    :cond_21
    :goto_21
    return-void

    :catch_22
    move-exception p0

    const-string v0, "nicoid-popup"

    const-string v1, "Cannot observe terminal frame"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2a
    return-void
.end method

.method public static clear(Ljava/lang/Object;)V
    .registers 2

    .line 13
    :try_start_0
    const-string v0, "e"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    sget-object v0, Le/e/a/PopupFrame233;->frames:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PopupFrame233$State;

    if-eqz p0, :cond_17

    invoke-virtual {p0}, Le/e/a/PopupFrame233$State;->dispose()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_15} :catch_16

    goto :goto_17

    :catch_16
    move-exception p0

    :cond_17
    :goto_17
    return-void
.end method

.method public static ended(Ljava/lang/Object;)V
    .registers 8

    .line 8
    const-string v0, "nicoid-popup"

    :try_start_2
    const-string v1, "e"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Le/e/a/PopupFrame233;->find(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v2

    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_72

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    if-lez v3, :cond_72

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v3

    if-gtz v3, :cond_21

    goto :goto_72

    :cond_21
    if-nez v2, :cond_27

    invoke-static {p0, v1}, Le/e/a/PopupFrame233;->surfaceFrame(Ljava/lang/Object;Landroid/view/View;)V

    return-void

    :cond_27
    invoke-virtual {v2}, Landroid/view/TextureView;->isAvailable()Z

    move-result v3

    if-nez v3, :cond_2e

    return-void

    :cond_2e
    invoke-virtual {v2}, Landroid/view/TextureView;->getWidth()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2}, Landroid/view/TextureView;->getHeight()I

    move-result v5

    int-to-long v5, v5

    mul-long/2addr v3, v5

    const-wide/16 v5, 0x1

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    long-to-double v3, v3

    const-wide v5, 0x413e848000000000L    # 2000000.0

    div-double/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    double-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-virtual {v2}, Landroid/view/TextureView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v3

    float-to-int v4, v4

    const/4 v5, 0x1

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v2}, Landroid/view/TextureView;->getHeight()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v3

    float-to-int v3, v6

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v2, v4, v3}, Landroid/view/TextureView;->getBitmap(II)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_7d

    invoke-static {p0, v1, v2}, Le/e/a/PopupFrame233;->present(Ljava/lang/Object;Landroid/view/View;Landroid/graphics/Bitmap;)V
    :try_end_71
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_71} :catch_77
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_71} :catch_73

    goto :goto_7d

    :cond_72
    :goto_72
    return-void

    :catch_73
    move-exception p0

    const-string v1, "Cannot inspect terminal frame"

    goto :goto_7a

    :catch_77
    move-exception p0

    const-string v1, "Cannot capture terminal frame"

    :goto_7a
    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_7d
    :goto_7d
    return-void
.end method

.method static find(Landroid/view/View;)Landroid/view/TextureView;
    .registers 4

    .line 12
    instance-of v0, p0, Landroid/view/TextureView;

    if-eqz v0, :cond_7

    check-cast p0, Landroid/view/TextureView;

    return-object p0

    :cond_7
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_24

    const/4 v0, 0x0

    :goto_c
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v0, v2, :cond_16

    goto :goto_24

    :cond_16
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PopupFrame233;->find(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v1

    if-eqz v1, :cond_21

    return-object v1

    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_24
    :goto_24
    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic lambda$0(Le/e/a/PopupFrame233$State;ILandroid/view/View;Ljava/lang/Object;Landroid/graphics/Bitmap;I)V
    .registers 8

    .line 10
    if-eqz p5, :cond_17

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Terminal frame copy result="

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "nicoid-popup"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_17
    :try_start_17
    iget p0, p0, Le/e/a/PopupFrame233$State;->generation:I

    if-ne p0, p1, :cond_49

    invoke-virtual {p2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p0

    if-eqz p0, :cond_49

    const-string p0, "e"

    invoke-static {p3, p0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_49

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string p5, "isPlaying"

    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Class;

    invoke-virtual {p1, p5, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array p5, v0, [Ljava/lang/Object;

    invoke-virtual {p1, p2, p5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_49

    invoke-static {p3, p2, p4}, Le/e/a/PopupFrame233;->present(Ljava/lang/Object;Landroid/view/View;Landroid/graphics/Bitmap;)V
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_47} :catch_48

    goto :goto_49

    :catch_48
    move-exception p0

    :cond_49
    :goto_49
    return-void
.end method

.method static present(Ljava/lang/Object;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .registers 6

    .line 11
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_6f

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_6f

    :cond_b
    invoke-static {p0}, Le/e/a/PopupFrame233;->attach(Ljava/lang/Object;)V

    sget-object p0, Le/e/a/PopupFrame233;->frames:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PopupFrame233$State;

    if-nez p0, :cond_19

    return-void

    :cond_19
    invoke-virtual {p0}, Le/e/a/PopupFrame233$State;->clear()V

    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImportantForAccessibility(I)V

    iput-object v0, p0, Le/e/a/PopupFrame233$State;->image:Landroid/widget/ImageView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Terminal frame installed "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v1, "nicoid-popup"

    invoke-static {v1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object p2, p1

    check-cast p2, Landroid/view/ViewGroup;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p0, p0, Le/e/a/PopupFrame233$State;->watch:Ljava/lang/Runnable;

    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_6f
    :goto_6f
    return-void
.end method

.method static surface(Landroid/view/View;)Landroid/view/SurfaceView;
    .registers 4

    .line 9
    instance-of v0, p0, Landroid/view/SurfaceView;

    if-eqz v0, :cond_7

    check-cast p0, Landroid/view/SurfaceView;

    return-object p0

    :cond_7
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_24

    const/4 v0, 0x0

    :goto_c
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v0, v2, :cond_16

    goto :goto_24

    :cond_16
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PopupFrame233;->surface(Landroid/view/View;)Landroid/view/SurfaceView;

    move-result-object v1

    if-eqz v1, :cond_21

    return-object v1

    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_24
    :goto_24
    const/4 p0, 0x0

    return-object p0
.end method

.method static surfaceFrame(Ljava/lang/Object;Landroid/view/View;)V
    .registers 11

    .line 10
    invoke-static {p1}, Le/e/a/PopupFrame233;->surface(Landroid/view/View;)Landroid/view/SurfaceView;

    move-result-object v0

    if-eqz v0, :cond_7f

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Surface;->isValid()Z

    move-result v1

    if-nez v1, :cond_15

    goto :goto_7f

    :cond_15
    invoke-static {p0}, Le/e/a/PopupFrame233;->attach(Ljava/lang/Object;)V

    sget-object v1, Le/e/a/PopupFrame233;->frames:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Le/e/a/PopupFrame233$State;

    if-nez v3, :cond_24

    return-void

    :cond_24
    iget v1, v3, Le/e/a/PopupFrame233$State;->generation:I

    const/4 v2, 0x1

    add-int/lit8 v4, v1, 0x1

    iput v4, v3, Le/e/a/PopupFrame233$State;->generation:I

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getWidth()I

    move-result v1

    int-to-long v5, v1

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHeight()I

    move-result v1

    int-to-long v7, v1

    mul-long/2addr v5, v7

    const-wide/16 v7, 0x1

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    long-to-double v5, v5

    const-wide v7, 0x413e848000000000L    # 2000000.0

    div-double/2addr v7, v5

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    double-to-float v1, v5

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v5, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v1

    float-to-int v5, v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHeight()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v1

    float-to-int v1, v6

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    new-instance v8, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;

    move-object v2, v8

    move-object v5, p1

    move-object v6, p0

    move-object v7, v1

    invoke-direct/range {v2 .. v7}, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;-><init>(Le/e/a/PopupFrame233$State;ILandroid/view/View;Ljava/lang/Object;Landroid/graphics/Bitmap;)V

    new-instance p0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-static {v0, v1, v8, p0}, Landroid/view/PixelCopy;->request(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;Landroid/view/PixelCopy$OnPixelCopyFinishedListener;Landroid/os/Handler;)V

    :cond_7f
    :goto_7f
    return-void
.end method
