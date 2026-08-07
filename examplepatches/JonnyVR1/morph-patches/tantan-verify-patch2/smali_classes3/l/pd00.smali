.class public Ll/pd00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/jd00;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public A:Ljava/lang/String;

.field public B:Ll/k7f0;

.field public C:Ll/x20;

.field public D:Z

.field public E:Z

.field public F:J

.field public G:J

.field public final H:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final I:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Landroid/widget/FrameLayout;

.field public d:Ll/jd00;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field public final e:Lcom/p1/mobile/putong/app/PutongAct;

.field public f:Ll/w0c;

.field public g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public h:Lcom/p1/mobile/putong/ui/webview/mk/MkProgressView;

.field public i:Landroid/widget/ProgressBar;

.field public j:Landroid/widget/LinearLayout;

.field public k:Landroid/widget/LinearLayout;

.field public l:Landroid/widget/ImageView;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Ljava/lang/String;

.field public x:Ljava/lang/String;

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/pd00;->C:Ll/x20;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/pd00;->E:Z

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, Ll/pd00;->F:J

    .line 13
    .line 14
    iput-wide v0, p0, Ll/pd00;->G:J

    .line 15
    .line 16
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/pd00;->H:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 22
    .line 23
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/pd00;->I:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 30
    .line 31
    iput-object p1, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    return-void
.end method

.method private C()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/pd00;->y:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/high16 v1, -0x80000000

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/high16 v1, 0x4000000

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 39
    .line 40
    const/16 v2, 0x510

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/4 v1, 0x1

    .line 57
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->FlymeSetStatusBarLightMode(Landroid/view/Window;Z)Z

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->MIUISetStatusBarLightMode(Landroid/view/Window;Z)Z

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 70
    .line 71
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    iget-object p0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const/4 v0, 0x0

    .line 88
    invoke-virtual {p0, v0}, Ll/c30;->A(F)V

    .line 89
    .line 90
    .line 91
    :cond_1
    :goto_0
    return-void
.end method

.method private G()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pd00;->x:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/pd00;->x:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "transparent"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object v0, p0, Ll/pd00;->x:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "#"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object v2, p0, Ll/pd00;->x:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    :goto_0
    :try_start_0
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    iget-object p0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 67
    .line 68
    .line 69
    :catch_0
    return-void
.end method

.method private I()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/jec0;->D:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/ui/webview/mk/MkProgressView;

    .line 15
    .line 16
    iput-object v0, p0, Ll/pd00;->h:Lcom/p1/mobile/putong/ui/webview/mk/MkProgressView;

    .line 17
    .line 18
    iget-object v1, p0, Ll/pd00;->c:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/pd00;->h:Lcom/p1/mobile/putong/ui/webview/mk/MkProgressView;

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/ui/webview/mk/MkProgressView;->a:Landroid/widget/ProgressBar;

    .line 26
    .line 27
    iput-object v1, p0, Ll/pd00;->i:Landroid/widget/ProgressBar;

    .line 28
    .line 29
    iget-object v1, v0, Lcom/p1/mobile/putong/ui/webview/mk/MkProgressView;->b:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    iput-object v1, p0, Ll/pd00;->j:Landroid/widget/LinearLayout;

    .line 32
    .line 33
    iget-object v1, v0, Lcom/p1/mobile/putong/ui/webview/mk/MkProgressView;->c:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    iput-object v1, p0, Ll/pd00;->k:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/ui/webview/mk/MkProgressView;->d:Landroid/widget/ImageView;

    .line 38
    .line 39
    iput-object v0, p0, Ll/pd00;->l:Landroid/widget/ImageView;

    .line 40
    .line 41
    return-void
.end method

.method private K()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pd00;->w:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Ll/pd00;->w:Ljava/lang/String;

    .line 27
    .line 28
    const-string v3, "transparent"

    .line 29
    .line 30
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    iget-object v0, p0, Ll/pd00;->w:Ljava/lang/String;

    .line 38
    .line 39
    const-string v3, "#"

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-object v4, p0, Ll/pd00;->w:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    :goto_0
    :try_start_0
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :goto_1
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/4 v1, 0x2

    .line 78
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 82
    .line 83
    const/4 v0, 0x1

    .line 84
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :catch_0
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 98
    .line 99
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->onHomePressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic Q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pd00;->x(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/pd00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Ll/pd00;->Q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method public static synthetic b(Ll/pd00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pd00;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/pd00;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pd00;->R(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    return-void
.end method

.method public static synthetic d(Ll/pd00;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pd00;->N(Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic e(Ll/pd00;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pd00;->O(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/pd00;)Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/pd00;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pd00;->I:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/pd00;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/pd00;->G:J

    return-wide v0
.end method

.method public static bridge synthetic k(Ll/pd00;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pd00;->E:Z

    return p0
.end method

.method public static bridge synthetic l(Ll/pd00;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pd00;->v:Z

    return p0
.end method

.method public static bridge synthetic m(Ll/pd00;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/pd00;->E:Z

    return-void
.end method

.method private u()V
    .locals 5

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/pd00;->I:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/pd00;->I:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/pd00;->H:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v2, 0x3

    .line 22
    if-ge v0, v2, :cond_3

    .line 23
    .line 24
    iget-object v0, p0, Ll/pd00;->c:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-lez v0, :cond_1

    .line 33
    .line 34
    move v2, v1

    .line 35
    :goto_0
    if-ge v2, v0, :cond_1

    .line 36
    .line 37
    iget-object v3, p0, Ll/pd00;->c:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    iget-object v4, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 44
    .line 45
    if-eqz v4, :cond_0

    .line 46
    .line 47
    if-ne v3, v4, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Ll/pd00;->c:Landroid/widget/FrameLayout;

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->isDestroyed()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/4 v2, 0x1

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->destroy()V

    .line 66
    .line 67
    .line 68
    move v1, v2

    .line 69
    goto :goto_1

    .line 70
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    move v2, v1

    .line 74
    :cond_2
    :goto_1
    const/4 v0, 0x0

    .line 75
    iput-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 76
    .line 77
    iput-object v0, p0, Ll/pd00;->f:Ll/w0c;

    .line 78
    .line 79
    iget-object v0, p0, Ll/pd00;->d:Ll/jd00;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/jd00;->g0()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v1, v2}, Ll/pd00;->V(ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    .line 86
    .line 87
    :cond_3
    return-void

    .line 88
    :catchall_0
    move-exception p0

    .line 89
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method private x(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.intent.action.VIEW"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "android.intent.category.BROWSABLE"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public A()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/pd00;->y()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v1, "useToken"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/rnl;->A(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "1"

    .line 18
    .line 19
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/pd00;->y()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/pd00;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 40
    .line 41
    invoke-interface {v1}, Ll/bn5;->accessOutterToken()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/nd00;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/nd00;-><init>(Ll/pd00;)V

    .line 52
    .line 53
    .line 54
    new-instance v2, Ll/od00;

    .line 55
    .line 56
    invoke-direct {v2, p0}, Ll/od00;-><init>(Ll/pd00;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    iget-object v0, p0, Ll/pd00;->f:Ll/w0c;

    .line 68
    .line 69
    iget-object v1, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 70
    .line 71
    iget-object v2, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/pd00;->y()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v3, ""

    .line 78
    .line 79
    invoke-virtual {v0, v1, v3, v2, p0}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public E()V
    .locals 5

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/pd00;->F:J

    .line 6
    .line 7
    new-instance v0, Ll/w0c;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/w0c;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/pd00;->f:Ll/w0c;

    .line 13
    .line 14
    invoke-static {}, Ll/yfi;->r()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Ll/mjw;->INSTANCE:Ll/mjw;

    .line 22
    .line 23
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 24
    .line 25
    iget-object v3, p0, Ll/pd00;->n:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {v0, v2, v3, v4}, Ll/mjw;->s(Landroid/app/Activity;Ljava/lang/String;Landroid/content/Intent;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 36
    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 40
    .line 41
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    iget-object v4, p0, Ll/pd00;->n:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v3, v4}, Ll/brw;->a(Landroid/content/Intent;Ljava/lang/String;)Ll/brw;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-direct {v0, v2, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;-><init>(Landroid/content/Context;Ll/brw;)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object v0, p0, Ll/pd00;->n:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    iget-object v0, p0, Ll/pd00;->w:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    iget-object v0, p0, Ll/pd00;->w:Ljava/lang/String;

    .line 76
    .line 77
    const-string v2, "transparent"

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 92
    .line 93
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 94
    .line 95
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    iget-object v4, p0, Ll/pd00;->n:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v3, v4}, Ll/brw;->a(Landroid/content/Intent;Ljava/lang/String;)Ll/brw;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-direct {v0, v2, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;-><init>(Landroid/content/Context;Ll/brw;)V

    .line 106
    .line 107
    .line 108
    iput-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 109
    .line 110
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    if-nez v0, :cond_3

    .line 117
    .line 118
    iget-object v0, p0, Ll/pd00;->c:Landroid/widget/FrameLayout;

    .line 119
    .line 120
    iget-object v2, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 121
    .line 122
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 123
    .line 124
    .line 125
    invoke-direct {p0}, Ll/pd00;->I()V

    .line 126
    .line 127
    .line 128
    :cond_3
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 129
    .line 130
    new-instance v2, Ll/pd00$a;

    .line 131
    .line 132
    invoke-direct {v2, p0}, Ll/pd00$a;-><init>(Ll/pd00;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKPreLoadingUrlProcessor(Ll/tm80;)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/pd00;->f:Ll/w0c;

    .line 139
    .line 140
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 141
    .line 142
    iget-object v3, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 143
    .line 144
    invoke-virtual {v0, v2, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 148
    .line 149
    invoke-static {}, Ll/sjw;->i()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {v0, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setWebUserAgent(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 157
    .line 158
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 163
    .line 164
    .line 165
    iget-object p0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 166
    .line 167
    const/4 v0, 0x2

    .line 168
    const/4 v1, 0x0

    .line 169
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pd00;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Ll/abc0;->n:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/pd00;->b:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/ld00;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/ld00;-><init>(Ll/pd00;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/pd00;->s()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Ll/pd00;->b:Lv/navigationbar/VNavigationBar;

    .line 25
    .line 26
    const/16 v0, 0x8

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final H()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pd00;->A:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/pd00;->A:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "black"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object p0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/ktp0;->c(Lcom/p1/mobile/android/app/Act;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public J()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "JavascriptInterface"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/pd00;->y()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/pd00;->f:Ll/w0c;

    .line 12
    .line 13
    new-instance v1, Ll/kd00;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/kd00;-><init>(Ll/pd00;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->J(Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$a;)V

    .line 19
    .line 20
    .line 21
    iget-boolean v0, p0, Ll/pd00;->s:Z

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/pd00;->f:Ll/w0c;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/w0c;->N()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/pd00;->B()V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-boolean v0, p0, Ll/pd00;->p:Z

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 55
    .line 56
    .line 57
    :cond_1
    invoke-direct {p0}, Ll/pd00;->K()V

    .line 58
    .line 59
    .line 60
    invoke-direct {p0}, Ll/pd00;->G()V

    .line 61
    .line 62
    .line 63
    invoke-direct {p0}, Ll/pd00;->C()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/pd00;->H()V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/pd00;->z()Ll/dpf0;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 79
    .line 80
    .line 81
    move-result-wide v0

    .line 82
    iput-wide v0, p0, Ll/pd00;->G:J

    .line 83
    .line 84
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/pd00;->y()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_2
    return-void
.end method

.method public L(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public M()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pd00;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pd00;->f:Ll/w0c;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/w0c;->N()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/pd00;->f:Ll/w0c;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v2, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/pd00;->y()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v1, v0, p1, v2, p0}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ll/w0c;->P(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic O(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/pd00;->f:Ll/w0c;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/w0c;->N()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/pd00;->f:Ll/w0c;

    .line 10
    .line 11
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    iget-object v1, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/pd00;->y()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v2, ""

    .line 20
    .line 21
    invoke-virtual {p1, v0, v2, v1, p0}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic R(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/pd00;->u:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/md00;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/md00;-><init>(Ll/pd00;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-boolean v1, p0, Ll/pd00;->r:Z

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/16 v1, 0x64

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setTextZoom(I)V

    .line 37
    .line 38
    .line 39
    iget-boolean p0, p0, Ll/pd00;->D:Z

    .line 40
    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const/4 p1, 0x1

    .line 48
    invoke-virtual {p0, p1}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public S()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pd00;->f:Ll/w0c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->u()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pd00;->u()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pd00;->f:Ll/w0c;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->v()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public U(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    iget-object p1, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "title"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/pd00;->m:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p1, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "extra_custom_data"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/pd00;->o:Ljava/lang/String;

    .line 28
    .line 29
    sget-object p1, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 30
    .line 31
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "url"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p1, v0}, Ll/lhl;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Ll/pd00;->n:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p1, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-string v0, "needParseUrl"

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iput-boolean p1, p0, Ll/pd00;->z:Z

    .line 63
    .line 64
    iget-object p1, p0, Ll/pd00;->n:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    const/4 v0, 0x0

    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    iget-object p1, p0, Ll/pd00;->n:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    goto :goto_0

    .line 80
    :cond_0
    move-object p1, v0

    .line 81
    :goto_0
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 82
    .line 83
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    const-string v3, "hideNavigationBar"

    .line 88
    .line 89
    iget-boolean v4, p0, Ll/pd00;->z:Z

    .line 90
    .line 91
    invoke-static {v2, p1, v3, v4, v1}, Ll/eup0;->b(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZZ)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    iput-boolean v2, p0, Ll/pd00;->p:Z

    .line 96
    .line 97
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 98
    .line 99
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    const-string v3, "hardwareAccelerated"

    .line 104
    .line 105
    iget-boolean v4, p0, Ll/pd00;->z:Z

    .line 106
    .line 107
    invoke-static {v2, p1, v3, v4, v1}, Ll/eup0;->b(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZZ)Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    iput-boolean v2, p0, Ll/pd00;->q:Z

    .line 112
    .line 113
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 114
    .line 115
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    const-string v3, "playbackRequiresUserGesture"

    .line 120
    .line 121
    iget-boolean v4, p0, Ll/pd00;->z:Z

    .line 122
    .line 123
    const/4 v5, 0x1

    .line 124
    invoke-static {v2, p1, v3, v4, v5}, Ll/eup0;->b(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZZ)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    iput-boolean v2, p0, Ll/pd00;->r:Z

    .line 129
    .line 130
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 131
    .line 132
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    const-string v3, "advanceInitJsBridge"

    .line 137
    .line 138
    iget-boolean v4, p0, Ll/pd00;->z:Z

    .line 139
    .line 140
    invoke-static {v2, p1, v3, v4, v5}, Ll/eup0;->b(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZZ)Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    iput-boolean v2, p0, Ll/pd00;->s:Z

    .line 145
    .line 146
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 147
    .line 148
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    const-string v3, "transparent_status_bar"

    .line 153
    .line 154
    iget-boolean v4, p0, Ll/pd00;->z:Z

    .line 155
    .line 156
    invoke-static {v2, p1, v3, v4, v1}, Ll/eup0;->b(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZZ)Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    iput-boolean v2, p0, Ll/pd00;->t:Z

    .line 161
    .line 162
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 163
    .line 164
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    const-string v3, "AD_WebView"

    .line 169
    .line 170
    iget-boolean v4, p0, Ll/pd00;->z:Z

    .line 171
    .line 172
    invoke-static {v2, p1, v3, v4, v1}, Ll/eup0;->b(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZZ)Z

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    iput-boolean v2, p0, Ll/pd00;->u:Z

    .line 177
    .line 178
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 179
    .line 180
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    const-string v3, "skipLoading"

    .line 185
    .line 186
    iget-boolean v4, p0, Ll/pd00;->z:Z

    .line 187
    .line 188
    invoke-static {v2, p1, v3, v4, v1}, Ll/eup0;->b(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZZ)Z

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    iput-boolean v2, p0, Ll/pd00;->v:Z

    .line 193
    .line 194
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 195
    .line 196
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    const-string v3, "webviewColor"

    .line 201
    .line 202
    iget-boolean v4, p0, Ll/pd00;->z:Z

    .line 203
    .line 204
    invoke-static {v2, p1, v3, v4, v0}, Ll/eup0;->a(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    iput-object v2, p0, Ll/pd00;->w:Ljava/lang/String;

    .line 209
    .line 210
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 211
    .line 212
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    const-string v3, "notchColor"

    .line 217
    .line 218
    iget-boolean v4, p0, Ll/pd00;->z:Z

    .line 219
    .line 220
    invoke-static {v2, p1, v3, v4, v0}, Ll/eup0;->a(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    iput-object v0, p0, Ll/pd00;->x:Ljava/lang/String;

    .line 225
    .line 226
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 227
    .line 228
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    const-string v2, "hideNotch"

    .line 233
    .line 234
    iget-boolean v3, p0, Ll/pd00;->z:Z

    .line 235
    .line 236
    invoke-static {v0, p1, v2, v3, v1}, Ll/eup0;->b(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZZ)Z

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    iput-boolean v0, p0, Ll/pd00;->y:Z

    .line 241
    .line 242
    iget-object v0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 243
    .line 244
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    const-string v2, "swipeBack"

    .line 249
    .line 250
    iget-boolean v3, p0, Ll/pd00;->z:Z

    .line 251
    .line 252
    invoke-static {v0, p1, v2, v3, v5}, Ll/eup0;->b(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZZ)Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    iget-object v2, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 257
    .line 258
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    const-string v3, "autofill"

    .line 263
    .line 264
    iget-boolean v4, p0, Ll/pd00;->z:Z

    .line 265
    .line 266
    invoke-static {v2, p1, v3, v4, v1}, Ll/eup0;->b(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZZ)Z

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    iput-boolean v1, p0, Ll/pd00;->D:Z

    .line 271
    .line 272
    iget-object v1, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 273
    .line 274
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    const-string v2, "notchTextColor"

    .line 279
    .line 280
    const-string v3, ""

    .line 281
    .line 282
    invoke-static {v1, p1, v2, v5, v3}, Ll/eup0;->a(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    iput-object p1, p0, Ll/pd00;->A:Ljava/lang/String;

    .line 287
    .line 288
    if-nez v0, :cond_1

    .line 289
    .line 290
    iget-object p0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 291
    .line 292
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 293
    .line 294
    .line 295
    :cond_1
    return-void
.end method

.method public final V(ZZ)V
    .locals 2

    .line 1
    new-instance p0, Ljava/lang/Exception;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "recordReloadRecycleWeb,isTryRecycleWeb:"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, " isTryDeleteWeb:"

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public W(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pd00;->o:Ljava/lang/String;

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
    const-string v0, "tracker"

    .line 10
    .line 11
    iget-object p0, p0, Ll/pd00;->o:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p2, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    :cond_0
    const-string p0, "url"

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "params"

    .line 23
    .line 24
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "e_intl_android_web_vue"

    .line 33
    .line 34
    const-string p2, "p_intl_android_web_vue"

    .line 35
    .line 36
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public X()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pd00;->m:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/pd00;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/pd00;->m:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/pd00;->b:Lv/navigationbar/VNavigationBar;

    .line 19
    .line 20
    iget-object p0, p0, Ll/pd00;->m:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/pd00;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pd00;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/jd00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pd00;->q(Ll/jd00;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pd00;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qd00;->b(Ll/pd00;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pd00;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Ll/jd00;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/pd00;->d:Ll/jd00;

    .line 2
    .line 3
    return-void
.end method

.method public s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pd00;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public v()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->canGoBack()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Ll/rx3;->EMPTY_PAGE:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public w()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pd00;->f:Ll/w0c;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/w0c;->K()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/pd00;->c:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/webkit/WebView;->clearHistory()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public y()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pd00;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public z()Ll/dpf0;
    .locals 2

    .line 1
    new-instance v0, Ll/pd00$b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pd00;->f:Ll/w0c;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/pd00$b;-><init>(Ll/pd00;Ll/nxl;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
