.class public Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/app/web/WebViewX;

.field public b:F

.field public c:Landroid/animation/ValueAnimator;

.field public d:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->b:F

    .line 6
    .line 7
    new-instance p1, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->d:Ljava/lang/Runnable;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->b:F

    .line 17
    new-instance p1, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->d:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->b:F

    .line 20
    new-instance p1, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->d:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 21
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->b:F

    .line 23
    new-instance p1, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->d:Ljava/lang/Runnable;

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;)Lcom/p1/mobile/putong/app/web/WebViewX;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    return-object p0
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_5

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    if-eq v0, v1, :cond_4

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    if-eq v0, v2, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    if-eq v0, v1, :cond_4

    .line 26
    .line 27
    const/4 v1, 0x4

    .line 28
    if-eq v0, v1, :cond_4

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->b:F

    .line 36
    .line 37
    sub-float/2addr v0, v2

    .line 38
    const v2, 0x3f19999a    # 0.6f

    .line 39
    .line 40
    .line 41
    mul-float/2addr v0, v2

    .line 42
    sget v2, Ll/qa00;->K:I

    .line 43
    .line 44
    int-to-float v3, v2

    .line 45
    cmpl-float v3, v0, v3

    .line 46
    .line 47
    if-lez v3, :cond_2

    .line 48
    .line 49
    int-to-float v0, v2

    .line 50
    :cond_2
    const/4 v2, 0x0

    .line 51
    cmpg-float v3, v0, v2

    .line 52
    .line 53
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 54
    .line 55
    if-gtz v3, :cond_3

    .line 56
    .line 57
    invoke-virtual {v4, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 58
    .line 59
    .line 60
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0

    .line 65
    :cond_3
    invoke-virtual {v4, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 66
    .line 67
    .line 68
    return v1

    .line 69
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->d:Ljava/lang/Runnable;

    .line 70
    .line 71
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->b:F

    .line 80
    .line 81
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    return p0

    .line 86
    :cond_6
    :goto_1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    return p0
.end method

.method public set_webview(Lcom/p1/mobile/putong/app/web/WebViewX;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->a:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    return-void
.end method
