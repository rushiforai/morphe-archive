.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;
.super Ll/lf2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$f;,
        Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$e;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:F

.field public e:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lf2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->a:I

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->b:I

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->c:I

    .line 10
    .line 11
    const/high16 v0, -0x40800000    # -1.0f

    .line 12
    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->d:F

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->p(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic d(Ll/bqq;Lv/navigationbar/VNavigationBar;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    new-instance v0, Ll/cpj0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/cpj0;-><init>(Ll/bqq;Landroid/graphics/Bitmap;Lv/navigationbar/VNavigationBar;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e(Ll/bqq;Landroid/graphics/Bitmap;Lv/navigationbar/VNavigationBar;)V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/bqq;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-lez p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-lez p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    sget p0, Ll/qa00;->E:I

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-static {p1, p0, p0, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 40
    .line 41
    invoke-direct {p1, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2, p1}, Lv/navigationbar/VNavigationBar;->setLeftIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->r(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic g(Ll/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aqq;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic h(Ll/bqq;Lv/navigationbar/VNavigationBar;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/bqq;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/16 p0, 0x8

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic i(Ll/aqq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aqq;->d()Ll/hqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 3

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Landroid/view/View;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "transparent"

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 31
    .line 32
    .line 33
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 34
    .line 35
    const/4 v1, -0x1

    .line 36
    invoke-static {}, Ll/bnl0;->F0()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Landroid/view/ViewGroup;

    .line 52
    .line 53
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->q(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private m(Ll/bqq;)Lv/navigationbar/VNavigationBar;
    .locals 1
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    instance-of p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;

    .line 15
    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    instance-of p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;

    .line 23
    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_0
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    instance-of p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;

    .line 40
    .line 41
    sget p1, Ll/ycc0;->Y:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Lv/navigationbar/VNavigationBar;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_1
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    instance-of p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;

    .line 55
    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;

    .line 63
    .line 64
    sget p1, Ll/ycc0;->Y:I

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Lv/navigationbar/VNavigationBar;

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_2
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    instance-of p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;

    .line 78
    .line 79
    if-eqz p0, :cond_3

    .line 80
    .line 81
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    check-cast p0, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;

    .line 86
    .line 87
    sget p1, Ll/ycc0;->Y:I

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    check-cast p0, Lv/navigationbar/VNavigationBar;

    .line 94
    .line 95
    return-object p0

    .line 96
    :cond_3
    return-object v0
.end method


# virtual methods
.method public changeNotchBackgroundColor(Ll/aqq;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "changeNotchBackgroundColor"
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public changeWebviewBackgroundColor(Ll/aqq;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "changeWebviewBackgroundColor"
        uiThread = true
    .end annotation

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_2

    .line 6
    .line 7
    const-string p0, "transparent"

    .line 8
    .line 9
    invoke-virtual {p2, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p0, "#"

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Ll/aqq;->e()Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    :catch_0
    :cond_2
    :goto_0
    return-void
.end method

.method public getDeviceNotchInfo(Ll/aqq;)Ljava/lang/String;
    .locals 4
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "getDeviceNotchInfo"
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/nx40;->h(Landroid/app/Activity;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/nx40;->a(Landroid/app/Activity;)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 30
    .line 31
    new-instance v1, Lorg/json/JSONObject;

    .line 32
    .line 33
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 34
    .line 35
    .line 36
    :try_start_0
    const-string v2, "isNotch"

    .line 37
    .line 38
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    cmpl-float p0, v0, p0

    .line 43
    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    const-string p0, "notchHeight"

    .line 47
    .line 48
    int-to-float p1, p1

    .line 49
    div-float/2addr p1, v0

    .line 50
    float-to-double v2, p1

    .line 51
    invoke-virtual {v1, p0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 52
    .line 53
    .line 54
    :cond_0
    const-string p0, "statusBarHeight"

    .line 55
    .line 56
    invoke-static {}, Ll/bnl0;->F0()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    int-to-float p1, p1

    .line 61
    div-float/2addr p1, v0

    .line 62
    float-to-double v2, p1

    .line 63
    invoke-virtual {v1, p0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    return-object p0

    .line 71
    :catch_0
    move-exception p0

    .line 72
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    const-string p0, ""

    .line 76
    .line 77
    return-object p0
.end method

.method public hideNavigation(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "hideNavigation"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->n(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public hideNotch(Ll/aqq;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "hideNotch"
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->o(Ll/bqq;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "transparent"

    .line 9
    .line 10
    invoke-virtual {p2, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_1

    .line 15
    .line 16
    const-string p0, "#"

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    :cond_1
    new-instance p0, Ll/xoj0;

    .line 29
    .line 30
    invoke-direct {p0, p1, p2}, Ll/xoj0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public n(Ll/bqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->m(Ll/bqq;)Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p3, Ll/uoj0;

    .line 8
    .line 9
    invoke-direct {p3, p1, p0}, Ll/uoj0;-><init>(Ll/bqq;Lv/navigationbar/VNavigationBar;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p3}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    invoke-interface {p1}, Ll/bqq;->d()Ll/hqq;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0, p2}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-interface {p1}, Ll/bqq;->d()Ll/hqq;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0, p3}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final o(Ll/bqq;)V
    .locals 1
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-interface {p1}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/zoj0;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/zoj0;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->a:I

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/high16 v1, -0x80000000

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/high16 v1, 0x4000000

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Landroid/view/Window;->getStatusBarColor()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->b:I

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->statusBarColor()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->c:I

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/16 v2, 0x510

    .line 65
    .line 66
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const/4 v1, 0x1

    .line 77
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->FlymeSetStatusBarLightMode(Landroid/view/Window;Z)Z

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->MIUISetStatusBarLightMode(Landroid/view/Window;Z)Z

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_1

    .line 96
    .line 97
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ll/c30;->j()F

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iput v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->d:F

    .line 106
    .line 107
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const/4 p1, 0x0

    .line 112
    invoke-virtual {p0, p1}, Ll/c30;->A(F)V

    .line 113
    .line 114
    .line 115
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic q(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->s(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->b:I

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->b:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->a:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/16 v1, 0x400

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 38
    .line 39
    .line 40
    iget v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->c:I

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->d:F

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Ll/c30;->A(F)V

    .line 62
    .line 63
    .line 64
    :cond_1
    :goto_0
    return-void
.end method

.method public registerBarRight(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "registerBarRight"
        uiThread = true
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$e;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$e;

    .line 14
    .line 15
    invoke-interface {p0, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$e;->h0(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public registerMenus(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "registerMenus"
        uiThread = true
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$f;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$f;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->e:Ll/kcg0;

    .line 16
    .line 17
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0, p2}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$f;->S(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    new-instance v0, Ll/voj0;

    .line 33
    .line 34
    invoke-direct {v0, p0, p1, p3}, Ll/voj0;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Ll/aqq;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->e:Ll/kcg0;

    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public final s(Ll/aqq;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p3, "adtpOnClickMenu"

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ll/aqq;->d()Ll/hqq;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p2}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p0, p3, p1}, Ll/hqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setNavLeftButton(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "setNavLeftButton"
    .end annotation

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v6, p6

    .line 9
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->t(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setNavLeftButton(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "setNavLeftButton"
    .end annotation

    .line 13
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->t(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public setNavRightButton(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "setNavRightButton"
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->u(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setNavigation(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 13
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "setNavigation"
    .end annotation

    .line 1
    const/4 v12, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object/from16 v3, p3

    .line 6
    .line 7
    move-object/from16 v4, p4

    .line 8
    .line 9
    move-object/from16 v5, p5

    .line 10
    .line 11
    move-object/from16 v6, p6

    .line 12
    .line 13
    move-object/from16 v7, p7

    .line 14
    .line 15
    move-object/from16 v8, p8

    .line 16
    .line 17
    move-object/from16 v9, p9

    .line 18
    .line 19
    move-object/from16 v10, p10

    .line 20
    .line 21
    move-object/from16 v11, p11

    .line 22
    .line 23
    invoke-virtual/range {v0 .. v12}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->v(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setNavigation(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "setNavigation"
    .end annotation

    .line 27
    invoke-virtual/range {p0 .. p12}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->v(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public setNavigationTitle(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "setNavigationTitle"
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->w(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setTitle(Ll/aqq;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "setTitle"
        uiThread = true
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->m(Ll/bqq;)Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public showDialog(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "showDialog"
        uiThread = true
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance p2, Ll/apj0;

    .line 18
    .line 19
    invoke-direct {p2, p1, p6}, Ll/apj0;-><init>(Ll/aqq;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p4, p2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p2, Ll/bpj0;

    .line 27
    .line 28
    invoke-direct {p2, p1, p7}, Ll/bpj0;-><init>(Ll/aqq;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p5, p2}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, p8}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public showNotch(Ll/aqq;)V
    .locals 1
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "showNotch"
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/yoj0;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/yoj0;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public showToast(Ll/aqq;Ljava/lang/String;I)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "showToast"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->x(Ll/bqq;Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->m(Ll/bqq;)Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    if-eqz p3, :cond_1

    .line 6
    .line 7
    new-instance p6, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$b;

    .line 8
    .line 9
    invoke-direct {p6, p0, p1, p3}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$b;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Ll/bqq;Lv/navigationbar/VNavigationBar;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p6}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p6

    .line 19
    if-nez p6, :cond_0

    .line 20
    .line 21
    sget-object p6, Ll/uqb0;->G:Ll/fsb0;

    .line 22
    .line 23
    invoke-virtual {p6, p2}, Ll/fsb0;->E(Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    new-instance p6, Ll/woj0;

    .line 28
    .line 29
    invoke-direct {p6, p1, p3}, Ll/woj0;-><init>(Ll/bqq;Lv/navigationbar/VNavigationBar;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p6}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p6

    .line 36
    invoke-virtual {p2, p6}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;

    .line 40
    .line 41
    invoke-direct {p2, p0, p4, p1, p7}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Ljava/lang/String;Ll/bqq;Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p3, p2}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_2

    .line 52
    .line 53
    invoke-interface {p1}, Ll/bqq;->d()Ll/hqq;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0, p5}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_2

    .line 66
    .line 67
    invoke-interface {p1}, Ll/bqq;->d()Ll/hqq;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-interface {p0, p6}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    return-void
.end method

.method public final u(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->m(Ll/bqq;)Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    if-eqz v3, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;

    .line 8
    .line 9
    move-object v1, p0

    .line 10
    move-object v2, p1

    .line 11
    move-object v6, p2

    .line 12
    move-object v4, p3

    .line 13
    move-object v5, p4

    .line 14
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Ll/bqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    invoke-interface {v2}, Ll/bqq;->d()Ll/hqq;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0, p5}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    move-object v2, p1

    .line 35
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    invoke-interface {v2}, Ll/bqq;->d()Ll/hqq;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0, p6}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public unRegisterBarRight(Ll/aqq;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "unRegisterBarRight"
        uiThread = true
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$e;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$e;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$e;->y0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final v(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 15
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct/range {p0 .. p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->m(Ll/bqq;)Lv/navigationbar/VNavigationBar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2
    const-string v5, ""

    const-string v6, ""

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->w(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    const-string v12, ""

    const-string v13, ""

    move-object v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p4

    move-object/from16 v10, p5

    move-object/from16 v11, p6

    move/from16 v14, p12

    invoke-virtual/range {v7 .. v14}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->t(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 4
    const-string v12, ""

    const-string v13, ""

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    invoke-virtual/range {v7 .. v13}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->u(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    invoke-static/range {p10 .. p10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    .line 6
    invoke-interface/range {p1 .. p1}, Ll/bqq;->d()Ll/hqq;

    move-result-object p0

    move-object/from16 v0, p10

    invoke-interface {p0, v0}, Ll/hqq;->a(Ljava/lang/String;)V

    return-void

    .line 7
    :cond_0
    invoke-static/range {p11 .. p11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 8
    invoke-interface/range {p1 .. p1}, Ll/bqq;->d()Ll/hqq;

    move-result-object p0

    move-object/from16 v0, p11

    invoke-interface {p0, v0}, Ll/hqq;->a(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public final w(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->m(Ll/bqq;)Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    if-eqz v3, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;

    .line 8
    .line 9
    move-object v1, p0

    .line 10
    move-object v2, p1

    .line 11
    move-object v4, p2

    .line 12
    move-object v5, p3

    .line 13
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;-><init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Ll/bqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    invoke-interface {v2}, Ll/bqq;->d()Ll/hqq;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0, p4}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    move-object v2, p1

    .line 34
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    invoke-interface {v2}, Ll/bqq;->d()Ll/hqq;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {p0, p5}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public final x(Ll/bqq;Ljava/lang/String;I)V
    .locals 0
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
