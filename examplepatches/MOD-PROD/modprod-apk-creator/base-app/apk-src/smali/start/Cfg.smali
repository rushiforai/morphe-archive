.class public Lstart/Cfg;
.super Ljava/lang/Object;
.source "Cfg.java"

# Réglages lus dans res/values/bools.xml et colors.xml (écrits par le patch « ModProd Réglages »).

# static fields
.field public static F:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/app/Activity;Landroid/webkit/WebView;)V
    .locals 7

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    # Android 11+ : contrôleur des barres système (null avant Android 11)
    const/4 v5, 0x0

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1e

    if-lt v3, v4, :cond_ctrl

    invoke-virtual {v2}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v5

    :cond_ctrl
    const-string v3, "fullscr"

    const/4 v4, 0x0

    invoke-static {v0, v1, v3, v4}, Lstart/Cfg;->b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lstart/Cfg;->F:Z

    if-eqz v3, :cond_0

    const/16 v3, 0x400

    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    if-eqz v5, :cond_0

    # Masque la barre d'état ; un glissement depuis le haut la fait réapparaître un moment.
    invoke-static {}, Landroid/view/WindowInsets$Type;->statusBars()I

    move-result v3

    invoke-interface {v5, v3}, Landroid/view/WindowInsetsController;->hide(I)V

    const/4 v3, 0x2

    invoke-interface {v5, v3}, Landroid/view/WindowInsetsController;->setSystemBarsBehavior(I)V

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->requestApplyInsets()V

    :cond_0
    # Icônes des barres : sombres si la couleur des barres est claire
    if-eqz v5, :cond_light

    const-string v3, "lightBars"

    const/4 v4, 0x0

    invoke-static {v0, v1, v3, v4}, Lstart/Cfg;->b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    const/16 v6, 0x18

    if-eqz v3, :cond_dark

    move v3, v6

    goto :goto_light

    :cond_dark
    const/4 v3, 0x0

    :goto_light
    invoke-interface {v5, v3, v6}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

    :cond_light
    const-string v3, "flag_secure"

    const/4 v4, 0x0

    invoke-static {v0, v1, v3, v4}, Lstart/Cfg;->b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v3, 0x2000

    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    :cond_1
    const-string v3, "keepScreenOn"

    const/4 v4, 0x0

    invoke-static {v0, v1, v3, v4}, Lstart/Cfg;->b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x80

    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    :cond_2
    const-string v3, "Zoom"

    const/4 v4, 0x0

    invoke-static {v0, v1, v3, v4}, Lstart/Cfg;->b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    const/4 v3, 0x0

    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    const-string v3, "ScrollBars"

    const/4 v4, 0x0

    invoke-static {v0, v1, v3, v4}, Lstart/Cfg;->b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {p1, v3}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    invoke-virtual {p1, v3}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    const-string v3, "portrait"

    const/4 v4, 0x1

    invoke-static {v0, v1, v3, v4}, Lstart/Cfg;->b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v3, 0x1

    goto :goto_0

    :cond_3
    const/4 v3, -0x1

    :goto_0
    invoke-virtual {p0, v3}, Landroid/app/Activity;->setRequestedOrientation(I)V

    const-string v3, "isDebugMode"

    const/4 v4, 0x0

    invoke-static {v0, v1, v3, v4}, Lstart/Cfg;->b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    invoke-static {v3}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method

.method private static b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 2

    const-string v0, "bool"

    invoke-virtual {p0, p2, v0, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    return v1

    :cond_0
    return p3
.end method

# Couleur des barres système (res/values/colors.xml : modprod_bars), sinon #141a21.
.method public static c(Landroid/content/Context;)I
    .locals 3

    const v0, -0xebe5df

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "modprod_bars"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "color"

    invoke-virtual {v1, v2, v0, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    const v0, -0xebe5df

    if-eqz v2, :cond_0

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return v0

    :catch_0
    const v0, -0xebe5df

    return v0
.end method

# Zoom activé : lève le blocage du zoom (user-scalable=no, maximum-scale) dans la balise viewport.
.method public static d(Landroid/app/Activity;Landroid/webkit/WebView;)V
    .locals 4

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Zoom"

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lstart/Cfg;->b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "(function(){var m=document.querySelector('meta[name=viewport]');if(!m)return;var c=m.getAttribute('content')||'';c=c.replace(/user-scalable *= *(no|0)/ig,'user-scalable=yes').replace(/maximum-scale *= *[0-9.]+/ig,'maximum-scale=5');m.setAttribute('content',c);})()"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    return-void
.end method
