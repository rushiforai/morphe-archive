.class public Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;
.super Landroidx/core/app/SafeJobIntentService;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/core/app/SafeJobIntentService;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->lambda$updateViews$4(Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->lambda$updateViews$6(Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->lambda$onHandleWork$1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;Lcom/p1/mobile/putong/data/MiniWidgetEnvelope;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->lambda$onHandleWork$0(Lcom/p1/mobile/putong/data/MiniWidgetEnvelope;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->lambda$updateViews$2(Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/util/Pair;)V

    return-void
.end method

.method private synthetic lambda$onHandleWork$0(Lcom/p1/mobile/putong/data/MiniWidgetEnvelope;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MiniWidgetEnvelope;->data:Lcom/p1/mobile/putong/data/MiniWidgetData;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->updateViews(Lcom/p1/mobile/putong/data/MiniWidgetData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$onHandleWork$1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->updateViewsNotLogin(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$updateViews$2(Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Landroid/graphics/Bitmap;

    .line 20
    .line 21
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p2, Landroid/graphics/Bitmap;

    .line 24
    .line 25
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->updateWidget(Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private synthetic lambda$updateViews$4(Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p2}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->updateWidget(Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private synthetic lambda$updateViews$6(Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p2}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->updateWidget(Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private static toRoundBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-gt v0, v1, :cond_0

    .line 10
    .line 11
    div-int/lit8 v1, v0, 0x2

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    int-to-float v2, v0

    .line 15
    const/4 v3, 0x0

    .line 16
    move v4, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    div-int/lit8 v2, v1, 0x2

    .line 19
    .line 20
    int-to-float v2, v2

    .line 21
    sub-int v3, v0, v1

    .line 22
    .line 23
    div-int/lit8 v3, v3, 0x2

    .line 24
    .line 25
    int-to-float v3, v3

    .line 26
    int-to-float v0, v0

    .line 27
    sub-float/2addr v0, v3

    .line 28
    int-to-float v4, v1

    .line 29
    move v10, v2

    .line 30
    move v2, v0

    .line 31
    move v0, v1

    .line 32
    move v1, v10

    .line 33
    :goto_0
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    .line 34
    .line 35
    invoke-static {v0, v0, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v5, Landroid/graphics/Canvas;

    .line 40
    .line 41
    invoke-direct {v5, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 42
    .line 43
    .line 44
    new-instance v6, Landroid/graphics/Paint;

    .line 45
    .line 46
    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 47
    .line 48
    .line 49
    new-instance v7, Landroid/graphics/Rect;

    .line 50
    .line 51
    float-to-int v3, v3

    .line 52
    float-to-int v2, v2

    .line 53
    float-to-int v8, v4

    .line 54
    const/4 v9, 0x0

    .line 55
    invoke-direct {v7, v3, v9, v2, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 56
    .line 57
    .line 58
    new-instance v2, Landroid/graphics/Rect;

    .line 59
    .line 60
    float-to-int v3, v4

    .line 61
    float-to-int v4, v4

    .line 62
    invoke-direct {v2, v9, v9, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 63
    .line 64
    .line 65
    new-instance v3, Landroid/graphics/RectF;

    .line 66
    .line 67
    invoke-direct {v3, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 68
    .line 69
    .line 70
    const/4 v4, 0x1

    .line 71
    invoke-virtual {v6, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v5, v9, v9, v9, v9}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5, v3, v1, v1, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 78
    .line 79
    .line 80
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    .line 81
    .line 82
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 83
    .line 84
    invoke-direct {v1, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v5, p0, v7, v2, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 91
    .line 92
    .line 93
    return-object v0
.end method

.method public static updateViewsNotLogin(Landroid/content/Context;)V
    .locals 7

    .line 1
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/content/ComponentName;

    .line 6
    .line 7
    const-class v2, Lcom/p1/mobile/putong/miniwidget/MiniWidgetProvider;

    .line 8
    .line 9
    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Landroid/widget/RemoteViews;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    sget v4, Ll/jec0;->C:I

    .line 19
    .line 20
    invoke-direct {v2, v3, v4}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    iget v3, v3, Landroid/content/res/Configuration;->uiMode:I

    .line 32
    .line 33
    and-int/lit8 v3, v3, 0x30

    .line 34
    .line 35
    new-instance v4, Landroid/content/Intent;

    .line 36
    .line 37
    const-class v5, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 38
    .line 39
    invoke-direct {v4, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 40
    .line 41
    .line 42
    const/high16 v5, 0x4000000

    .line 43
    .line 44
    const/16 v6, 0x64

    .line 45
    .line 46
    invoke-static {p0, v6, v4, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget v4, Ll/ycc0;->N:I

    .line 51
    .line 52
    const/16 v5, 0x8

    .line 53
    .line 54
    invoke-virtual {v2, v4, v5}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 55
    .line 56
    .line 57
    const/16 v4, 0x20

    .line 58
    .line 59
    const/4 v6, 0x0

    .line 60
    if-ne v3, v4, :cond_0

    .line 61
    .line 62
    sget v3, Ll/ycc0;->C0:I

    .line 63
    .line 64
    invoke-virtual {v2, v3, v5}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 65
    .line 66
    .line 67
    sget v3, Ll/ycc0;->B0:I

    .line 68
    .line 69
    invoke-virtual {v2, v3, v6}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 70
    .line 71
    .line 72
    sget v3, Ll/ycc0;->B0:I

    .line 73
    .line 74
    invoke-virtual {v2, v3, p0}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    sget v3, Ll/ycc0;->C0:I

    .line 79
    .line 80
    invoke-virtual {v2, v3, v6}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 81
    .line 82
    .line 83
    sget v3, Ll/ycc0;->B0:I

    .line 84
    .line 85
    invoke-virtual {v2, v3, v5}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 86
    .line 87
    .line 88
    sget v3, Ll/ycc0;->C0:I

    .line 89
    .line 90
    invoke-virtual {v2, v3, p0}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 91
    .line 92
    .line 93
    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(Landroid/content/ComponentName;Landroid/widget/RemoteViews;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method


# virtual methods
.method public onHandleWork(Landroid/content/Intent;)V
    .locals 2
    .param p1    # Landroid/content/Intent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string p1, "MiniWidgetService onHandle work"

    .line 2
    .line 3
    invoke-static {p1}, Ll/yhi0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Ll/uqb0;->c0:Ll/bn5;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/bn5;->signedIn_()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget-object p1, Ll/uqb0;->c0:Ll/bn5;

    .line 17
    .line 18
    invoke-interface {p1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    sget-object v0, Ll/uqb0;->V:Ll/mk5;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/mk5;->z(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/wb00;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/wb00;-><init>(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/xb00;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/xb00;-><init>(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-static {}, Ll/yhi0;->b()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public updateViews(Lcom/p1/mobile/putong/data/MiniWidgetData;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->avatar:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->backgroundImage:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->avatar:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/fsb0;->E(Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 32
    .line 33
    iget-object v2, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->backgroundImage:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ll/fsb0;->E(Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Ll/sas;

    .line 40
    .line 41
    invoke-direct {v2}, Ll/sas;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/qb00;

    .line 49
    .line 50
    invoke-direct {v1, p0, p1}, Ll/qb00;-><init>(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;Lcom/p1/mobile/putong/data/MiniWidgetData;)V

    .line 51
    .line 52
    .line 53
    new-instance p0, Ll/rb00;

    .line 54
    .line 55
    invoke-direct {p0}, Ll/rb00;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->avatar:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_1

    .line 79
    .line 80
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 81
    .line 82
    iget-object v1, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->avatar:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ll/fsb0;->E(Ljava/lang/String;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/sb00;

    .line 89
    .line 90
    invoke-direct {v1, p0, p1}, Ll/sb00;-><init>(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;Lcom/p1/mobile/putong/data/MiniWidgetData;)V

    .line 91
    .line 92
    .line 93
    new-instance p0, Ll/tb00;

    .line 94
    .line 95
    invoke-direct {p0}, Ll/tb00;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_2

    .line 111
    .line 112
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->backgroundImage:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-nez v0, :cond_2

    .line 119
    .line 120
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 121
    .line 122
    iget-object v1, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->backgroundImage:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ll/fsb0;->E(Ljava/lang/String;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    new-instance v1, Ll/ub00;

    .line 129
    .line 130
    invoke-direct {v1, p0, p1}, Ll/ub00;-><init>(Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;Lcom/p1/mobile/putong/data/MiniWidgetData;)V

    .line 131
    .line 132
    .line 133
    new-instance p0, Ll/vb00;

    .line 134
    .line 135
    invoke-direct {p0}, Ll/vb00;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 143
    .line 144
    .line 145
    :cond_2
    return-void
.end method

.method public updateWidget(Lcom/p1/mobile/putong/data/MiniWidgetData;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 5

    .line 1
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/content/ComponentName;

    .line 6
    .line 7
    const-class v2, Lcom/p1/mobile/putong/miniwidget/MiniWidgetProvider;

    .line 8
    .line 9
    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Landroid/widget/RemoteViews;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    sget v4, Ll/jec0;->C:I

    .line 19
    .line 20
    invoke-direct {v2, v3, v4}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    invoke-static {p2}, Lcom/p1/mobile/putong/miniwidget/MiniWidgetService;->toRoundBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_0

    .line 44
    .line 45
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-nez v3, :cond_0

    .line 50
    .line 51
    sget v3, Ll/ycc0;->P:I

    .line 52
    .line 53
    invoke-virtual {v2, v3, p2}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_1

    .line 61
    .line 62
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-nez p2, :cond_1

    .line 67
    .line 68
    sget p2, Ll/ycc0;->O:I

    .line 69
    .line 70
    invoke-virtual {v2, p2, p3}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->leftTopText:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-nez p2, :cond_2

    .line 80
    .line 81
    sget p2, Ll/ycc0;->F0:I

    .line 82
    .line 83
    iget-object p3, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->leftTopText:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v2, p2, p3}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    :cond_2
    iget-object p2, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->line1textNearAvatar:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-nez p2, :cond_3

    .line 95
    .line 96
    sget p2, Ll/ycc0;->D0:I

    .line 97
    .line 98
    iget-object p3, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->line1textNearAvatar:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v2, p2, p3}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->line2textNearAvatar:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    if-nez p2, :cond_4

    .line 110
    .line 111
    sget p2, Ll/ycc0;->E0:I

    .line 112
    .line 113
    iget-object p3, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->line2textNearAvatar:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v2, p2, p3}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    :cond_4
    sget p2, Ll/ycc0;->N:I

    .line 119
    .line 120
    const/4 p3, 0x0

    .line 121
    invoke-virtual {v2, p2, p3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 122
    .line 123
    .line 124
    :try_start_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MiniWidgetData;->deeplink:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 127
    .line 128
    .line 129
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    goto :goto_0

    .line 131
    :catch_0
    const/4 p1, 0x0

    .line 132
    :goto_0
    if-eqz p1, :cond_5

    .line 133
    .line 134
    new-instance p2, Landroid/content/Intent;

    .line 135
    .line 136
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    const/high16 p2, 0x4000000

    .line 144
    .line 145
    const/16 p3, 0x65

    .line 146
    .line 147
    invoke-static {p0, p3, p1, p2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    sget p1, Ll/ycc0;->o0:I

    .line 152
    .line 153
    invoke-virtual {v2, p1, p0}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 154
    .line 155
    .line 156
    :cond_5
    sget p0, Ll/ycc0;->C0:I

    .line 157
    .line 158
    const/16 p1, 0x8

    .line 159
    .line 160
    invoke-virtual {v2, p0, p1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 161
    .line 162
    .line 163
    sget p0, Ll/ycc0;->B0:I

    .line 164
    .line 165
    invoke-virtual {v2, p0, p1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0, v1, v2}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(Landroid/content/ComponentName;Landroid/widget/RemoteViews;)V

    .line 169
    .line 170
    .line 171
    return-void
.end method
