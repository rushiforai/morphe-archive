.class public Lstart/MainActivity;
.super Le/i;
.source "SourceFile"


# static fields
.field public static H:Z


# instance fields
.field public A:Landroid/content/SharedPreferences;

.field public B:Z

.field public C:Z

.field public D:LT/g;

.field public E:Landroid/webkit/GeolocationPermissions$Callback;

.field public F:Ljava/lang/String;

.field public G:Landroid/webkit/PermissionRequest;

.field public x:Landroid/webkit/WebView;

.field public y:Landroid/webkit/ValueCallback;

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Le/i;-><init>()V

    iget-object v0, p0, Landroidx/activity/l;->e:LL/f;

    iget-object v0, v0, LL/f;->c:Ljava/lang/Object;

    check-cast v0, LL/e;

    new-instance v1, LL/a;

    invoke-direct {v1, p0}, LL/a;-><init>(Lstart/MainActivity;)V

    const-string v2, "androidx:appcompat"

    invoke-virtual {v0, v2, v1}, LL/e;->e(Ljava/lang/String;LL/d;)V

    new-instance v0, Le/h;

    invoke-direct {v0, p0}, Le/h;-><init>(Lstart/MainActivity;)V

    invoke-virtual {p0, v0}, Landroidx/activity/l;->f(La/b;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lstart/MainActivity;->A:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lstart/MainActivity;->B:Z

    iput-boolean v1, p0, Lstart/MainActivity;->C:Z

    iput-object v0, p0, Lstart/MainActivity;->E:Landroid/webkit/GeolocationPermissions$Callback;

    iput-object v0, p0, Lstart/MainActivity;->F:Ljava/lang/String;

    return-void
.end method

.method public static o(Lstart/MainActivity;)Ljava/io/File;
    .locals 2

    new-instance p0, Ljava/text/SimpleDateFormat;

    const-string v0, "yyyyMMdd_HHmmss"

    invoke-direct {p0, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "JPEG_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "_"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    const-string v1, ".jpg"

    invoke-static {p0, v1, v0}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const/4 v0, 0x1

    if-ne p1, v0, :cond_3

    iget-object v1, p0, Lstart/MainActivity;->y:Landroid/webkit/ValueCallback;

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 p1, -0x1

    const/4 v1, 0x0

    if-ne p2, p1, :cond_2

    const/4 p1, 0x0

    if-nez p3, :cond_1

    iget-object p2, p0, Lstart/MainActivity;->z:Ljava/lang/String;

    if-eqz p2, :cond_2

    new-array p3, v0, [Landroid/net/Uri;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    aput-object p2, p3, p1

    goto :goto_0

    :cond_1
    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_2

    new-array p3, v0, [Landroid/net/Uri;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    aput-object p2, p3, p1

    goto :goto_0

    :cond_2
    move-object p3, v1

    :goto_0
    iget-object p1, p0, Lstart/MainActivity;->y:Landroid/webkit/ValueCallback;

    invoke-interface {p1, p3}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    iput-object v1, p0, Lstart/MainActivity;->y:Landroid/webkit/ValueCallback;

    return-void

    :cond_3
    :goto_1
    invoke-super {p0, p1, p2, p3}, Le/i;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 11

    invoke-super {p0, p1}, Le/i;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001c

    invoke-virtual {p0, p1}, Le/i;->setContentView(I)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    new-instance v0, LT/g;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, v0, LT/g;->d:Landroid/os/Handler;

    iput-boolean p1, v0, LT/g;->e:Z

    const-string v1, ""

    iput-object v1, v0, LT/g;->h:Ljava/lang/String;

    const-string v1, "true"

    iput-object v1, v0, LT/g;->i:Ljava/lang/String;

    const-string v3, "false"

    iput-object v3, v0, LT/g;->j:Ljava/lang/String;

    const-string v2, "banner "

    iput-object v2, v0, LT/g;->k:Ljava/lang/String;

    const-string v2, ""

    iput-object v2, v0, LT/g;->l:Ljava/lang/String;

    iput-object v1, v0, LT/g;->m:Ljava/lang/String;

    iput-object v2, v0, LT/g;->n:Ljava/lang/String;

    iput-object v2, v0, LT/g;->o:Ljava/lang/String;

    iput-object v2, v0, LT/g;->p:Ljava/lang/String;

    const-string v1, "live"

    iput-object v1, v0, LT/g;->q:Ljava/lang/String;

    iput-object v2, v0, LT/g;->r:Ljava/lang/String;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, v0, LT/g;->s:Ljava/lang/Boolean;

    const/16 v1, 0xbb8

    iput v1, v0, LT/g;->f:I

    const v1, 0xea60

    iput v1, v0, LT/g;->g:I

    iput-object p0, v0, LT/g;->b:Lstart/MainActivity;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "installkey"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    if-nez v4, :cond_1

    new-instance v4, Ljava/util/Random;

    invoke-direct {v4}, Ljava/util/Random;-><init>()V

    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v7, 0x20

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    move v8, v5

    :goto_0
    if-ge v8, v7, :cond_0

    const/16 v9, 0x24

    invoke-virtual {v4, v9}, Ljava/util/Random;->nextInt(I)I

    move-result v9

    const-string v10, "0123456789qwertyuiopasdfghjklzxcvbnm"

    invoke-virtual {v10, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/2addr v8, p1

    goto :goto_0

    :cond_0
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6, v2, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, LT/g;->o:Ljava/lang/String;

    const-string v2, ""

    iput-object v2, v0, LT/g;->n:Ljava/lang/String;

    const-string v2, ""

    iput-object v2, v0, LT/g;->h:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, LT/g;->b:Lstart/MainActivity;

    invoke-static {v2}, LD/g;->C(Lstart/MainActivity;)LQ/n;

    move-result-object v2

    new-instance v3, LR/h;

    new-instance v4, LT/e;

    invoke-direct {v4, v0}, LT/e;-><init>(LT/g;)V

    new-instance v6, LF/d;

    const/16 v7, 0x9

    invoke-direct {v6, v7}, LF/d;-><init>(I)V

    invoke-direct {v3, v5, v1, v4, v6}, LR/h;-><init>(ILjava/lang/String;LQ/o;LF/d;)V

    iput-object v0, p0, Lstart/MainActivity;->D:LT/g;

    const v0, 0x7f08003d

    invoke-virtual {p0, v0}, Le/i;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    new-instance v1, Landroid/webkit/WebChromeClient;

    invoke-direct {v1}, Landroid/webkit/WebChromeClient;-><init>()V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    new-instance v1, Landroid/webkit/WebViewClient;

    invoke-direct {v1}, Landroid/webkit/WebViewClient;-><init>()V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    const-string v1, "file:///android_asset/htmlapp/helpers/loading.html"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-lt v0, v1, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, LS/f;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, LS/e;->f(Landroid/view/Window;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, LS/e;->d(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {v0}, LS/e;->g(Landroid/view/WindowInsetsController;)V

    :cond_2
    const-string v0, "modprod_app"

    invoke-virtual {p0, v0, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lstart/MainActivity;->A:Landroid/content/SharedPreferences;

    const v0, 0x7f08003c

    invoke-virtual {p0, v0}, Le/i;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lstart/MainActivity;->x:Landroid/webkit/WebView;

    # Thème des sites web : fond, mode choisi, menu par appui long
    invoke-static {v0}, Lstart/NativeUiTheme;->applyDarkBackground(Landroid/webkit/WebView;)V
    invoke-static {p0, v0}, Lstart/WebTheme;->apply(Landroid/app/Activity;Landroid/webkit/WebView;)V

    new-instance v1, Lstart/ThemeLongClick;
    invoke-direct {v1, p0}, Lstart/ThemeLongClick;-><init>(Lstart/MainActivity;)V
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    const v0, 0x7f080054

    invoke-virtual {p0, v0}, Le/i;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, LS/g;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    sget-object v2, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-static {v0, v1}, Ly/A;->u(Landroid/view/View;Ly/p;)V

    iget-object v0, p0, Lstart/MainActivity;->x:Landroid/webkit/WebView;

    new-instance v1, LS/i;

    invoke-direct {v1, p0}, LS/i;-><init>(Lstart/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    iget-object v0, p0, Lstart/MainActivity;->x:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    iget-object v0, p0, Lstart/MainActivity;->x:Landroid/webkit/WebView;

    new-instance v1, LS/j;

    invoke-direct {v1, p0}, LS/j;-><init>(Lstart/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    iget-object v0, p0, Lstart/MainActivity;->x:Landroid/webkit/WebView;

    new-instance v1, LS/h;

    invoke-direct {v1, p1, p0}, LS/h;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object v0, p0, Lstart/MainActivity;->x:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setTextZoom(I)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    new-instance p1, LS/d;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p0, p1, LS/d;->a:Lstart/MainActivity;

    const-string v1, "Android"

    invoke-virtual {v0, p1, v1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p0, Lstart/MainActivity;->x:Landroid/webkit/WebView;

    const-string v0, "file:///android_asset/htmlapp/root/index.html"

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    iget-object v0, p0, Lstart/MainActivity;->x:Landroid/webkit/WebView;

    invoke-static {p0, v0}, Lstart/Cfg;->a(Landroid/app/Activity;Landroid/webkit/WebView;)V

    return-void
.end method

.method public final onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lstart/MainActivity;->x:Landroid/webkit/WebView;

    const-string v1, "(window.__appBack ? window.__appBack() : (history.length > 1 ? (history.back(), \'ok\') : \'exit\'))"

    new-instance v2, Lstart/BackCb;

    invoke-direct {v2, p0}, Lstart/BackCb;-><init>(Lstart/MainActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Le/i;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public final onPause()V
    .locals 2

    invoke-super {p0}, Le/i;->onPause()V

    iget-object v0, p0, Lstart/MainActivity;->D:LT/g;

    iget-object v1, v0, LT/g;->d:Landroid/os/Handler;

    iget-object v0, v0, LT/g;->a:LQ/h;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Le/i;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    array-length p2, p3

    if-lez p2, :cond_4

    const/4 p2, 0x0

    aget p2, p3, p2

    if-nez p2, :cond_4

    const/16 p2, 0x64

    if-ne p1, p2, :cond_0

    iget-object p1, p0, Lstart/MainActivity;->E:Landroid/webkit/GeolocationPermissions$Callback;

    if-eqz p1, :cond_3

    iget-object p2, p0, Lstart/MainActivity;->F:Ljava/lang/String;

    const/4 p3, 0x1

    invoke-interface {p1, p2, p3, p3}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    goto :goto_0

    :cond_0
    const/16 p2, 0x3e9

    if-ne p1, p2, :cond_2

    const-string p1, "android.permission.RECORD_AUDIO"

    invoke-static {p0, p1}, Lo/e;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result p2

    if-nez p2, :cond_1

    iget-object p1, p0, Lstart/MainActivity;->G:Landroid/webkit/PermissionRequest;

    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/webkit/PermissionRequest;->grant([Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    const/16 p2, 0x6a

    invoke-static {p0, p1, p2}, Lo/e;->g(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_0

    :cond_2
    const/16 p2, 0x3ea

    if-ne p1, p2, :cond_3

    iget-object p1, p0, Lstart/MainActivity;->G:Landroid/webkit/PermissionRequest;

    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/webkit/PermissionRequest;->grant([Ljava/lang/String;)V

    :cond_3
    :goto_0
    iget-object p1, p0, Lstart/MainActivity;->x:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->reload()V

    :cond_4
    return-void
.end method

.method public final onResume()V
    .locals 3

    invoke-super {p0}, Le/i;->onResume()V

    iget-object v0, p0, Lstart/MainActivity;->A:Landroid/content/SharedPreferences;

    const-string v1, "firstrun"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lstart/MainActivity;->D:LT/g;

    iget-object v1, v0, LT/g;->d:Landroid/os/Handler;

    iget-object v0, v0, LT/g;->a:LQ/h;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
