.class public final Ll/sej0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0015\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u000eR\u0016\u0010\u0012\u001a\u00020\u000f8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0011R\u0016\u0010\u0016\u001a\u00020\u00138\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0015R\u0016\u0010\u001a\u001a\u00020\u00178\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0019R\u001b\u0010 \u001a\u00020\u001b8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001c\u0010\u001d\u001a\u0004\u0008\u001e\u0010\u001f\u00a8\u0006!"
    }
    d2 = {
        "Ll/sej0;",
        "",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "",
        "url",
        "",
        "j",
        "(Ljava/lang/String;)V",
        "h",
        "()V",
        "a",
        "Landroid/content/Context;",
        "Landroid/view/View;",
        "b",
        "Landroid/view/View;",
        "root",
        "Lcom/p1/mobile/putong/live/base/webview/SelfTouchWebView;",
        "c",
        "Lcom/p1/mobile/putong/live/base/webview/SelfTouchWebView;",
        "webView",
        "Lv/VImage;",
        "d",
        "Lv/VImage;",
        "closeImage",
        "Ll/nu0;",
        "e",
        "Lkotlin/Lazy;",
        "i",
        "()Ll/nu0;",
        "dialog",
        "base_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/putong/live/base/webview/SelfTouchWebView;

.field public d:Lv/VImage;

.field public final e:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/sej0;->a:Landroid/content/Context;

    .line 8
    .line 9
    new-instance p1, Ll/qej0;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ll/qej0;-><init>(Ll/sej0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/sej0;->e:Lkotlin/Lazy;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Ll/sej0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sej0;->g(Ll/sej0;Landroid/view/View;)V

    return-void
.end method

.method public static b(Ll/sej0;)Ll/pej0;
    .locals 5

    .line 1
    new-instance v0, Ll/pej0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/sej0;->a:Landroid/content/Context;

    .line 4
    .line 5
    sget v2, Ll/ggc0;->b:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, Ll/vec0;->K:I

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    const/4 v4, 0x0

    .line 22
    invoke-virtual {v1, v2, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/sej0;->b:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/sej0;->b:Landroid/view/View;

    .line 35
    .line 36
    const-string v2, "root"

    .line 37
    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    move-object v1, v4

    .line 44
    :cond_0
    sget v3, Ll/jdc0;->o1:I

    .line 45
    .line 46
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    check-cast v1, Lcom/p1/mobile/putong/live/base/webview/SelfTouchWebView;

    .line 54
    .line 55
    iput-object v1, p0, Ll/sej0;->c:Lcom/p1/mobile/putong/live/base/webview/SelfTouchWebView;

    .line 56
    .line 57
    iget-object v1, p0, Ll/sej0;->b:Landroid/view/View;

    .line 58
    .line 59
    if-nez v1, :cond_1

    .line 60
    .line 61
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    move-object v1, v4

    .line 65
    :cond_1
    sget v2, Ll/jdc0;->f0:I

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    check-cast v1, Lv/VImage;

    .line 75
    .line 76
    iput-object v1, p0, Ll/sej0;->d:Lv/VImage;

    .line 77
    .line 78
    iget-object v1, p0, Ll/sej0;->c:Lcom/p1/mobile/putong/live/base/webview/SelfTouchWebView;

    .line 79
    .line 80
    const-string v2, "webView"

    .line 81
    .line 82
    if-nez v1, :cond_2

    .line 83
    .line 84
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    move-object v1, v4

    .line 88
    :cond_2
    new-instance v3, Lcom/p1/mobile/putong/app/web/WebViewClientX;

    .line 89
    .line 90
    invoke-direct {v3}, Lcom/p1/mobile/putong/app/web/WebViewClientX;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebViewClientX(Lcom/p1/mobile/putong/app/web/WebViewClientX;)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Ll/sej0;->c:Lcom/p1/mobile/putong/live/base/webview/SelfTouchWebView;

    .line 97
    .line 98
    if-nez v1, :cond_3

    .line 99
    .line 100
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    move-object v1, v4

    .line 104
    :cond_3
    new-instance v2, Ll/sej0$a;

    .line 105
    .line 106
    invoke-direct {v2}, Ll/sej0$a;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebChromeClientX(Ll/wqp0;)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Ll/sej0;->d:Lv/VImage;

    .line 113
    .line 114
    if-nez v1, :cond_4

    .line 115
    .line 116
    const-string v1, "closeImage"

    .line 117
    .line 118
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_4
    move-object v4, v1

    .line 123
    :goto_0
    new-instance v1, Ll/rej0;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/rej0;-><init>(Ll/sej0;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v4, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 129
    .line 130
    .line 131
    return-object v0
.end method

.method public static final synthetic c(Ll/sej0;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sej0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic d(Ll/sej0;)Ll/nu0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sej0;->i()Ll/nu0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic e(Ll/sej0;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sej0;->b:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic f(Ll/sej0;)Lcom/p1/mobile/putong/live/base/webview/SelfTouchWebView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sej0;->c:Lcom/p1/mobile/putong/live/base/webview/SelfTouchWebView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final g(Ll/sej0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sej0;->i()Ll/nu0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final h()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/sej0;->i()Ll/nu0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    const v1, 0x1020002

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Ll/jdc0;->F:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x3

    .line 41
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 42
    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/sej0;->b:Landroid/view/View;

    .line 49
    .line 50
    if-nez v1, :cond_0

    .line 51
    .line 52
    const-string v1, "root"

    .line 53
    .line 54
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, Ll/sej0$b;

    .line 63
    .line 64
    invoke-direct {v2, p0, v0}, Ll/sej0$b;-><init>(Ll/sej0;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Ll/sej0$c;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/sej0$c;-><init>(Ll/sej0;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->addBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method

.method public final i()Ll/nu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sej0;->e:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/nu0;

    .line 8
    .line 9
    return-object p0
.end method

.method public final j(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/sej0;->i()Ll/nu0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/sej0;->i()Ll/nu0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/sej0;->h()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ll/sej0;->c:Lcom/p1/mobile/putong/live/base/webview/SelfTouchWebView;

    .line 25
    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    const-string p0, "webView"

    .line 29
    .line 30
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    :cond_1
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
