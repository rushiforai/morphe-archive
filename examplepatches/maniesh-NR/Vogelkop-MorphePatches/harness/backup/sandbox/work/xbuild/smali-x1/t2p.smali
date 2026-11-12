.class public final Lt2p;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# static fields
.field public static final k:I


# instance fields
.field public a:Landroid/webkit/WebView;

.field public b:Landroid/content/Context;

.field public c:Lltm;

.field public d:Ljava/lang/String;

.field public e:Landroid/widget/ImageButton;

.field public f:Landroid/widget/ImageButton;

.field public g:Landroid/widget/ImageButton;

.field public h:Landroid/widget/ImageButton;

.field public i:Laoo;

.field public j:Z


# direct methods
.method static constructor <clinit>()V
    .registers 9

    :cond_0
    sget-object v0, Lsjo;->c:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    const-wide/16 v3, 0x1

    add-long v5, v1, v3

    const-wide v7, 0x7ffffffffffffffeL

    cmp-long v7, v5, v7

    if-gtz v7, :cond_14

    move-wide v3, v5

    :cond_14
    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v0

    if-eqz v0, :cond_0

    long-to-int v0, v1

    sput v0, Lt2p;->k:I

    return-void
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;Lltm;)Lt2p;
    .registers 14

    new-instance v0, Lt2p;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object p0, v0, Lt2p;->b:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    invoke-virtual {v0, v0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v4, Landroid/widget/RelativeLayout;

    invoke-direct {v4, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    invoke-direct {v6, v5, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    sget v8, Lt2p;->k:I

    invoke-virtual {v6, v8}, Landroid/view/View;->setId(I)V

    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v9, v5, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v7, 0xc

    invoke-virtual {v9, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v6, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    sget-object v7, Lbbp;->c:Lbbp;

    invoke-virtual {v7, p0}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    sget-object v7, Lbbp;->e:Lbbp;

    invoke-virtual {v7, p0}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v7

    invoke-virtual {v0, v7}, Lt2p;->a(Landroid/graphics/drawable/Drawable;)Landroid/widget/ImageButton;

    move-result-object v7

    iput-object v7, v0, Lt2p;->e:Landroid/widget/ImageButton;

    sget-object v7, Lbbp;->g:Lbbp;

    invoke-virtual {v7, p0}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v7

    invoke-virtual {v0, v7}, Lt2p;->a(Landroid/graphics/drawable/Drawable;)Landroid/widget/ImageButton;

    move-result-object v7

    iput-object v7, v0, Lt2p;->f:Landroid/widget/ImageButton;

    sget-object v7, Lbbp;->i:Lbbp;

    invoke-virtual {v7, p0}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v7

    invoke-virtual {v0, v7}, Lt2p;->a(Landroid/graphics/drawable/Drawable;)Landroid/widget/ImageButton;

    move-result-object v7

    iput-object v7, v0, Lt2p;->g:Landroid/widget/ImageButton;

    const v7, 0x7f0801c3

    invoke-static {v7, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v0, v7}, Lt2p;->a(Landroid/graphics/drawable/Drawable;)Landroid/widget/ImageButton;

    move-result-object v7

    iput-object v7, v0, Lt2p;->h:Landroid/widget/ImageButton;

    iget-object v7, v0, Lt2p;->e:Landroid/widget/ImageButton;

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v7, v0, Lt2p;->f:Landroid/widget/ImageButton;

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v7, v0, Lt2p;->g:Landroid/widget/ImageButton;

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v7, v0, Lt2p;->h:Landroid/widget/ImageButton;

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v6, Landroid/webkit/WebView;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Lt2p;->a:Landroid/webkit/WebView;

    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v6, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/4 v7, 0x2

    invoke-virtual {v6, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v8, v0, Lt2p;->a:Landroid/webkit/WebView;

    invoke-virtual {v8, v6}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v6, v0, Lt2p;->a:Landroid/webkit/WebView;

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iput-object p3, v0, Lt2p;->c:Lltm;

    iput-object p1, v0, Lt2p;->d:Ljava/lang/String;

    iget-object p1, v0, Lt2p;->a:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    invoke-virtual {p1, v2}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    invoke-virtual {p1, v2}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    invoke-virtual {p1, v2}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V

    iget-object p3, v0, Lt2p;->c:Lltm;

    if-eqz p3, :cond_eb

    invoke-virtual {p1}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    invoke-interface {p3}, Lltm;->k()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    :cond_eb
    iget-object p1, v0, Lt2p;->d:Ljava/lang/String;

    const-string p3, "http"

    invoke-virtual {p1, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_f9

    const-string p1, "about:blank"

    iput-object p1, v0, Lt2p;->d:Ljava/lang/String;

    :cond_f9
    iget-object p1, v0, Lt2p;->a:Landroid/webkit/WebView;

    iget-object p3, v0, Lt2p;->d:Ljava/lang/String;

    invoke-virtual {p1, p3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    iget-object p1, v0, Lt2p;->a:Landroid/webkit/WebView;

    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object p3

    invoke-virtual {p3, p1, v1}, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V

    iget-object p1, v0, Lt2p;->a:Landroid/webkit/WebView;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    iget-object p1, v0, Lt2p;->a:Landroid/webkit/WebView;

    new-instance p3, Lc5d;

    const/4 v3, 0x3

    invoke-direct {p3, v0, v3}, Lc5d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object p1, v0, Lt2p;->e:Landroid/widget/ImageButton;

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object p1, v0, Lt2p;->e:Landroid/widget/ImageButton;

    new-instance p3, Ly1p;

    invoke-direct {p3, v0, v2}, Ly1p;-><init>(Lt2p;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, v0, Lt2p;->f:Landroid/widget/ImageButton;

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object p1, v0, Lt2p;->f:Landroid/widget/ImageButton;

    new-instance p3, Ly1p;

    invoke-direct {p3, v0, v1}, Ly1p;-><init>(Lt2p;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, v0, Lt2p;->g:Landroid/widget/ImageButton;

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object p1, v0, Lt2p;->g:Landroid/widget/ImageButton;

    new-instance p3, Ly1p;

    invoke-direct {p3, v0, v7}, Ly1p;-><init>(Lt2p;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, v0, Lt2p;->h:Landroid/widget/ImageButton;

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object p1, v0, Lt2p;->h:Landroid/widget/ImageButton;

    new-instance p3, Ly1p;

    invoke-direct {p3, v0, v3}, Ly1p;-><init>(Lt2p;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-boolean v2, v0, Lt2p;->j:Z

    invoke-static {p0, p2}, Lupj;->f(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    if-eqz p0, :cond_167

    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_167
    return-object v0
.end method


# virtual methods
.method public final a(Landroid/graphics/drawable/Drawable;)Landroid/widget/ImageButton;
    .registers 5

    new-instance v0, Landroid/widget/ImageButton;

    iget-object p0, p0, Lt2p;->b:Landroid/content/Context;

    invoke-direct {v0, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p0, v1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/16 v1, 0x10

    iput v1, p0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-object v0
.end method

.method public final c()V
    .registers 3

    iget-boolean v0, p0, Lt2p;->j:Z

    if-nez v0, :cond_24

    iget-object v0, p0, Lt2p;->a:Landroid/webkit/WebView;

    const/4 v1, 0x0

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    iget-object v0, p0, Lt2p;->a:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    :cond_11
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    invoke-static {p0}, Lupj;->j(Landroid/view/View;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lt2p;->j:Z

    iget-object p0, p0, Lt2p;->i:Laoo;

    if-eqz p0, :cond_24

    invoke-virtual {p0}, Laoo;->m()V

    :cond_24
    return-void
.end method

.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .registers 4

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p3, 0x1

    if-ne p1, p3, :cond_1e

    const/4 p1, 0x4

    if-ne p2, p1, :cond_1e

    iget-object p1, p0, Lt2p;->a:Landroid/webkit/WebView;

    if-eqz p1, :cond_1a

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result p1

    if-eqz p1, :cond_1a

    iget-object p0, p0, Lt2p;->a:Landroid/webkit/WebView;

    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    return p3

    :cond_1a
    invoke-virtual {p0}, Lt2p;->c()V

    return p3

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method
