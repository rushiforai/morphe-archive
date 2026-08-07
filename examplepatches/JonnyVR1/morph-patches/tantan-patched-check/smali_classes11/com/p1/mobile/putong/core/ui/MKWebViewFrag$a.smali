.class public Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;
.super Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->T4()Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;Ll/nxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;-><init>(Ll/nxl;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, -0x2

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    const-string p1, "&_offline=1"

    .line 11
    .line 12
    const-string p2, ""

    .line 13
    .line 14
    invoke-virtual {p4, p1, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 19
    .line 20
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->Q4(Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->C:Landroid/widget/FrameLayout;

    .line 33
    .line 34
    const/16 p1, 0x8

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->C:Landroid/widget/FrameLayout;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public f(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->B:Landroid/widget/ProgressBar;

    .line 4
    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->P4(Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    sget-object p1, Ll/rx3;->EMPTY_PAGE:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->C:Landroid/widget/FrameLayout;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_0

    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 67
    .line 68
    sget p2, Ll/adc0;->zf:I

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-eqz p1, :cond_0

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 79
    .line 80
    sget p2, Ll/adc0;->zf:I

    .line 81
    .line 82
    const/4 v0, 0x0

    .line 83
    invoke-virtual {p1, p2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->M:Ll/x20;

    .line 89
    .line 90
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_1

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;->b:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->M:Ll/x20;

    .line 99
    .line 100
    invoke-interface {p0}, Ll/x20;->call()V

    .line 101
    .line 102
    .line 103
    :cond_1
    return-void
.end method

.method public g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
