.class public Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;
.super Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->getPageListener()Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;Ll/nxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;-><init>(Ll/nxl;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->q()V

    return-void
.end method

.method private synthetic q()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->d(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->d(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/high16 p3, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {p1, p3}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->h(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/widget/ProgressBar;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/16 p3, 0x8

    .line 19
    .line 20
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->j(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "&_offline=1"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->e(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, p3}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const/4 p1, -0x2

    .line 48
    if-ne p2, p1, :cond_1

    .line 49
    .line 50
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    const-string p1, ""

    .line 57
    .line 58
    invoke-virtual {p4, v0, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 63
    .line 64
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->j(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-nez p1, :cond_1

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 75
    .line 76
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->e(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0, p3}, Landroid/view/View;->setVisibility(I)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 85
    .line 86
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->e(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const/4 p1, 0x0

    .line 91
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public f(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->f(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/wlw;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/wlw;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;)V

    .line 10
    .line 11
    .line 12
    const-wide/16 v1, 0x64

    .line 13
    .line 14
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->h(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/widget/ProgressBar;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/16 v0, 0x8

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->i(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->g(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 53
    .line 54
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->g(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_0

    .line 67
    .line 68
    sget-object p1, Ll/rx3;->EMPTY_PAGE:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-nez p1, :cond_0

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 77
    .line 78
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->e(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_0

    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 89
    .line 90
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->g(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    sget p2, Ll/gdc0;->e0:I

    .line 95
    .line 96
    invoke-virtual {p1, p2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    if-eqz p1, :cond_0

    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 103
    .line 104
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->g(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    sget p2, Ll/gdc0;->e0:I

    .line 109
    .line 110
    const/4 v0, 0x0

    .line 111
    invoke-virtual {p1, p2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 115
    .line 116
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->c(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Ll/x20;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_1

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 127
    .line 128
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->c(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Ll/x20;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-interface {p0}, Ll/x20;->call()V

    .line 133
    .line 134
    .line 135
    :cond_1
    return-void
.end method

.method public g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->d(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->h(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/widget/ProgressBar;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    invoke-super {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
