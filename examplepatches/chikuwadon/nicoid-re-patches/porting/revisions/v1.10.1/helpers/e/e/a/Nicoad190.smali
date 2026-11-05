.class public final Le/e/a/Nicoad190;
.super Ljava/lang/Object;
.source "Nicoad190.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Nicoad190$AdIcon;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static attach(Landroid/view/View;Ljava/lang/String;)V
    .registers 14

    .line 11
    const-string v0, "(?:sm|nm|so|ss)[0-9]+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    const-string v0, "nicoid_nicoad"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1a

    new-instance v0, Le/e/a/Nicoad190$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Le/e/a/Nicoad190$$ExternalSyntheticLambda1;-><init>(Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    .line 12
    :cond_1a
    const-string v1, "nicoid_like"

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_cc

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/LinearLayout;

    if-nez v2, :cond_2c

    goto/16 :goto_cc

    .line 13
    :cond_2c
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v3

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const/16 v5, 0x28

    invoke-static {v4, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    .line 15
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v6, 0x10

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v1, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    instance-of v5, v1, Landroid/widget/TextView;

    const/4 v7, 0x0

    if-eqz v5, :cond_5c

    move-object v5, v1

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    const/16 v8, 0x11

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setGravity(I)V

    .line 16
    :cond_5c
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v5

    const/4 v8, 0x1

    if-ne v5, v8, :cond_91

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    new-instance v9, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-direct {v9, v10}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x1

    const/4 v11, -0x2

    invoke-direct {v6, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    const/16 v11, 0xc

    invoke-static {v10, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    iput v10, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v2, v9, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v9, v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object v2, v9

    const/4 v3, 0x0

    .line 17
    :cond_91
    new-instance v1, Le/e/a/Nicoad190$AdIcon;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v1, v5}, Le/e/a/Nicoad190$AdIcon;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v5, "Niconi Ads"

    const-string v6, "Niconi \u5ee3\u544a"

    const-string v9, "\u30cb\u30b3\u30cb\u5e83\u544a"

    invoke-static {v0, v9, v5, v6}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/Nicoad190$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p1}, Le/e/a/Nicoad190$$ExternalSyntheticLambda2;-><init>(Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p1, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x4

    invoke-static {p0, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {p1, p0, v7, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    add-int/2addr v3, v8

    invoke-virtual {v2, v1, v3, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 18
    return-void

    .line 12
    :cond_cc
    :goto_cc
    return-void
.end method

.method public static bind(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3

    .line 8
    if-nez p1, :cond_3

    return-void

    :cond_3
    new-instance v0, Le/e/a/Nicoad190$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Le/e/a/Nicoad190$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 10
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Landroid/view/View;)V
    .registers 4

    .line 9
    :try_start_0
    const-string v0, "i0"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Bundle;

    if-nez p0, :cond_b

    return-void

    :cond_b
    const-string v0, "videoId"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Le/e/a/Nicoad190;->attach(Landroid/view/View;Ljava/lang/String;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_17

    goto :goto_18

    .line 10
    :catch_17
    move-exception p0

    :goto_18
    return-void
.end method

.method static synthetic lambda$1(Landroid/view/View;Ljava/lang/String;Landroid/view/View;)V
    .registers 3

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Le/e/a/Nicoad190;->open(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/view/View;Ljava/lang/String;Landroid/view/View;)V
    .registers 3

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Le/e/a/Nicoad190;->open(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$3(Landroid/app/Dialog;Landroid/view/View;)V
    .registers 2

    .line 25
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$4(Landroid/webkit/WebView;Landroid/app/Dialog;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .registers 5

    .line 25
    const/4 p2, 0x4

    if-ne p3, p2, :cond_19

    invoke-virtual {p4}, Landroid/view/KeyEvent;->getAction()I

    move-result p2

    const/4 p3, 0x1

    if-eq p2, p3, :cond_b

    goto :goto_19

    :cond_b
    invoke-virtual {p0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result p2

    if-eqz p2, :cond_15

    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    goto :goto_18

    :cond_15
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    :goto_18
    return p3

    :cond_19
    :goto_19
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$5(Landroid/webkit/WebView;Landroid/widget/LinearLayout;Landroid/content/DialogInterface;)V
    .registers 3

    .line 25
    invoke-virtual {p0}, Landroid/webkit/WebView;->stopLoading()V

    const-string p2, "about:blank"

    invoke-virtual {p0, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/webkit/WebView;->destroy()V

    return-void
.end method

.method static open(Landroid/content/Context;Ljava/lang/String;)V
    .registers 20

    .line 19
    move-object/from16 v0, p1

    const-string v1, "(?:sm|nm|so|ss)[0-9]+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_b

    return-void

    :cond_b
    invoke-static/range {p0 .. p0}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    invoke-static/range {p0 .. p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/app/Dialog;

    invoke-direct {v2, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    invoke-static {v1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v5, v5, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {v4}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    .line 20
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v7, 0x10

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v7, 0x8

    invoke-static {v1, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v6, v7, v5, v5, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const-string v7, "Niconi Ads"

    const-string v8, "Niconi \u5ee3\u544a"

    const-string v9, "\u30cb\u30b3\u30cb\u5e83\u544a"

    invoke-static {v1, v9, v7, v8}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0xe

    invoke-static {v1, v7, v8}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v7

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x2

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v8, v5, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v7, "\u00d7"

    invoke-static {v1, v7}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v5, v5, v5, v5}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v7, v5}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {v7, v5}, Landroid/widget/Button;->setMinimumHeight(I)V

    const-string v8, "\u9589\u3058\u308b"

    invoke-static {v8}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v9, 0x28

    invoke-static {v1, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-static {v1, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v8, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v1, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    const/4 v11, -0x1

    invoke-direct {v8, v11, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    new-instance v6, Landroid/widget/ProgressBar;

    const/4 v8, 0x0

    const v9, 0x1010078

    invoke-direct {v6, v1, v8, v9}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 v8, 0x64

    invoke-virtual {v6, v8}, Landroid/widget/ProgressBar;->setMax(I)V

    invoke-static {v1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v8

    invoke-static {v8}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, 0x3

    invoke-static {v1, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v8, v11, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    new-instance v8, Landroid/webkit/WebView;

    invoke-direct {v8, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    invoke-virtual {v8}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v9

    invoke-virtual {v9, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v9, v3}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    invoke-virtual {v9, v5}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    invoke-virtual {v9, v5}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V

    invoke-virtual {v9, v3}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x1a

    if-lt v12, v13, :cond_e0

    invoke-virtual {v9, v3}, Landroid/webkit/WebSettings;->setSafeBrowsingEnabled(Z)V

    .line 23
    :cond_e0
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v9

    invoke-virtual {v9, v3}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v3

    const-string v12, ";"

    invoke-virtual {v3, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v12, v3

    const-string v13, ""

    const/4 v14, 0x0

    :goto_f5
    const-string v15, "https://nicoad.nicovideo.jp"

    if-lt v14, v12, :cond_1a3

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_127

    const-string v3, "user_session"

    const-string v12, "user_session_secure"

    filled-new-array {v3, v12}, [Ljava/lang/String;

    move-result-object v3

    const/4 v12, 0x0

    :goto_108
    const/4 v13, 0x2

    if-lt v12, v13, :cond_10c

    goto :goto_127

    :cond_10c
    aget-object v13, v3, v12

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v14, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, "=; Domain=.nicovideo.jp; Path=/; Max-Age=0; Secure"

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v15, v13}, Landroid/webkit/CookieManager;->setCookie(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v12, v12, 0x1

    goto :goto_108

    :cond_127
    :goto_127
    invoke-virtual {v9}, Landroid/webkit/CookieManager;->flush()V

    .line 24
    new-instance v3, Le/e/a/Nicoad190$1;

    move-object/from16 v9, p0

    invoke-direct {v3, v9}, Le/e/a/Nicoad190$1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 25
    new-instance v3, Le/e/a/Nicoad190$2;

    invoke-direct {v3, v6}, Le/e/a/Nicoad190$2;-><init>(Landroid/widget/ProgressBar;)V

    invoke-virtual {v8, v3}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v11, v5, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v8, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v4}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    new-instance v3, Le/e/a/Nicoad190$$ExternalSyntheticLambda3;

    invoke-direct {v3, v2}, Le/e/a/Nicoad190$$ExternalSyntheticLambda3;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {v7, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Le/e/a/Nicoad190$$ExternalSyntheticLambda4;

    invoke-direct {v3, v8, v2}, Le/e/a/Nicoad190$$ExternalSyntheticLambda4;-><init>(Landroid/webkit/WebView;Landroid/app/Dialog;)V

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    new-instance v3, Le/e/a/Nicoad190$$ExternalSyntheticLambda5;

    invoke-direct {v3, v8, v4}, Le/e/a/Nicoad190$$ExternalSyntheticLambda5;-><init>(Landroid/webkit/WebView;Landroid/widget/LinearLayout;)V

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    if-eqz v3, :cond_18a

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    new-instance v4, Landroid/graphics/drawable/ColorDrawable;

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    invoke-direct {v4, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v3, v4}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v5, v5, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v11, v11}, Landroid/view/Window;->setLayout(II)V

    :cond_18a
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://nicoad.nicovideo.jp/video/publish/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?frontend_id=6&frontend_version=0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 26
    return-void

    .line 23
    :cond_1a3
    aget-object v16, v3, v14

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v10, "user_session="

    invoke-virtual {v5, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_1b9

    const-string v11, "user_session_secure="

    invoke-virtual {v5, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1cf

    :cond_1b9
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v11, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "; Domain=.nicovideo.jp; Path=/; Secure; HttpOnly"

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v15, v0}, Landroid/webkit/CookieManager;->setCookie(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1cf
    invoke-virtual {v5, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d6

    move-object v13, v5

    :cond_1d6
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p1

    const/4 v5, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v11, -0x1

    goto/16 :goto_f5
.end method
