.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/u3c;",
        ">;",
        "Landroid/view/Choreographer$FrameCallback;"
    }
.end annotation


# static fields
.field public static final g:I

.field public static final h:I

.field public static final i:I


# instance fields
.field public a:Ll/u3c;

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/FrameLayout$LayoutParams;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public final d:Landroid/view/Choreographer;

.field public final e:I

.field public f:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->k:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->g:I

    .line 4
    .line 5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->h:I

    .line 12
    .line 13
    const/high16 v0, 0x42000000    # 32.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->i:I

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/ArrayList;

    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->b:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->d:Landroid/view/Choreographer;

    .line 17
    .line 18
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 19
    .line 20
    sget v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->h:I

    .line 21
    .line 22
    sget v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->i:I

    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    mul-int/lit8 v3, v2, 0x2

    .line 28
    .line 29
    const/high16 v4, 0x42400000    # 48.0f

    .line 30
    .line 31
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    add-int/2addr v3, v4

    .line 36
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 37
    .line 38
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 42
    .line 43
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 44
    .line 45
    .line 46
    const/high16 v3, 0x41c00000    # 24.0f

    .line 47
    .line 48
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    add-int/2addr v3, v2

    .line 53
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 54
    .line 55
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 59
    .line 60
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 61
    .line 62
    .line 63
    const/high16 v1, 0x41000000    # 8.0f

    .line 64
    .line 65
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 70
    .line 71
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    const-string p2, "window"

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Landroid/view/WindowManager;

    .line 81
    .line 82
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Landroid/view/Display;->getRefreshRate()F

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    float-to-int p1, p1

    .line 91
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->e:I

    .line 92
    .line 93
    return-void
.end method

.method public static synthetic a(ILandroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->i(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V

    return-void
.end method

.method private k()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->c:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->d:Landroid/view/Choreographer;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->d:Landroid/view/Choreographer;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->c:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c(ILl/csl;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->b:Ljava/util/List;

    .line 2
    .line 3
    add-int/lit8 p1, p1, -0x1

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    instance-of v0, p2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    instance-of v0, p2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->getCalculateParams()Landroid/view/ViewGroup$MarginLayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p2, 0x0

    .line 30
    :goto_0
    if-eqz p2, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0, p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    return-void
.end method

.method public d(Ll/u3c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->a:Ll/u3c;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-static {}, Ll/u2c;->a()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->l()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public doFrame(J)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->c:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->l()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const/4 p2, 0x0

    .line 17
    new-array v0, p2, [I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->e([I)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    move v1, p2

    .line 24
    :goto_0
    if-ge v1, p1, :cond_3

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->m(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    if-nez v0, :cond_4

    .line 39
    .line 40
    new-array p1, p2, [I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->e([I)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_4

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->a:Ll/u3c;

    .line 49
    .line 50
    invoke-virtual {p1}, Ll/u3c;->g4()V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->d:Landroid/view/Choreographer;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public varargs e([I)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->a:Ll/u3c;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/oo2;->Z0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x3

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->f(I)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-nez p1, :cond_3

    .line 22
    .line 23
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->f(I)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    const/4 p1, 0x2

    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->f(I)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->f(I)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return v0

    .line 44
    :cond_2
    :goto_0
    return v2

    .line 45
    :cond_3
    array-length v1, p1

    .line 46
    move v3, v0

    .line 47
    :goto_1
    if-ge v3, v1, :cond_5

    .line 48
    .line 49
    aget v4, p1, v3

    .line 50
    .line 51
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->f(I)Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v4, :cond_4

    .line 56
    .line 57
    return v2

    .line 58
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_5
    return v0
.end method

.method public final f(I)Z
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    const/4 v3, 0x1

    .line 8
    if-ge v2, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    check-cast v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 19
    .line 20
    iget v5, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 21
    .line 22
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->b:Ljava/util/List;

    .line 23
    .line 24
    add-int/lit8 v3, p1, -0x1

    .line 25
    .line 26
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    iget v3, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 33
    .line 34
    if-ne v5, v3, :cond_0

    .line 35
    .line 36
    invoke-virtual {v4}, Landroid/view/View;->getTranslationX()F

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    sget v5, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->g:I

    .line 49
    .line 50
    add-int/2addr v4, v5

    .line 51
    int-to-float v4, v4

    .line 52
    cmpg-float v3, v3, v4

    .line 53
    .line 54
    if-gez v3, :cond_0

    .line 55
    .line 56
    return v1

    .line 57
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    return v3
.end method

.method public final synthetic i(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->a:Ll/u3c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u3c;->h4(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/u3c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->d(Ll/u3c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public varargs j(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;[I)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getMasks(I)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getFakeType()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget-object v2, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;->system:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;

    .line 11
    .line 12
    if-eq v1, v2, :cond_0

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getUserHierarchy()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    long-to-int v1, v1

    .line 25
    :goto_0
    new-instance v2, Ll/sh3;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-direct {v2, v3}, Ll/sh3;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getMasks(I)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getAvatar()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v2, v3}, Ll/sh3;->a(Ljava/lang/String;)Ll/sh3;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getMasks(I)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;->getDynamicUrl()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v2, v3}, Ll/sh3;->h(Ljava/lang/String;)Ll/sh3;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {p1, v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getMasks(I)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;->getStaticUrl()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v2, v3}, Ll/sh3;->n(Ljava/lang/String;)Ll/sh3;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    new-instance v3, Ll/g3c;

    .line 87
    .line 88
    invoke-direct {v3, p0, p1}, Ll/g3c;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, v3}, Ll/sh3;->b(Ll/x20;)Ll/sh3;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {p1, v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getMasks(I)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getName()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-virtual {v2, v3}, Ll/sh3;->k(Ljava/lang/String;)Ll/sh3;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v2, v1}, Ll/sh3;->o(I)Ll/sh3;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getContent()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v1, v2}, Ll/sh3;->j(Ljava/lang/String;)Ll/sh3;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getStyle()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBorderColor()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v1, v2}, Ll/sh3;->e(Ljava/lang/String;)Ll/sh3;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getStyle()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBorderColorsList()Ljava/util/List;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {v1, v2}, Ll/sh3;->f(Ljava/util/List;)Ll/sh3;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getStyle()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getOpacity()J

    .line 164
    .line 165
    .line 166
    move-result-wide v2

    .line 167
    long-to-int v2, v2

    .line 168
    invoke-virtual {v1, v2}, Ll/sh3;->l(I)Ll/sh3;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getStyle()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBackgroundColorsList()Ljava/util/List;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-virtual {v1, v2}, Ll/sh3;->c(Ljava/util/List;)Ll/sh3;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getStyle()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBackgroundUrl()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    invoke-virtual {v1, v2}, Ll/sh3;->d(Ljava/lang/String;)Ll/sh3;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getIconUrl()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-virtual {v1, v2}, Ll/sh3;->i(Ljava/lang/String;)Ll/sh3;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->a:Ll/u3c;

    .line 217
    .line 218
    invoke-virtual {v2}, Ll/xzs;->E2()Ll/oo2;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    invoke-virtual {v2}, Ll/oo2;->Z0()Z

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    invoke-virtual {v1, v2}, Ll/sh3;->m(Z)Ll/sh3;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-virtual {v1}, Ll/sh3;->g()Ll/csl;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    array-length v2, p2

    .line 235
    move v3, v0

    .line 236
    :goto_1
    if-ge v3, v2, :cond_2

    .line 237
    .line 238
    aget v4, p2, v3

    .line 239
    .line 240
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->f(I)Z

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    if-eqz v5, :cond_1

    .line 245
    .line 246
    invoke-virtual {p0, v4, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->c(ILl/csl;)V

    .line 247
    .line 248
    .line 249
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->a:Ll/u3c;

    .line 250
    .line 251
    invoke-virtual {p2}, Ll/xzs;->R2()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p2

    .line 255
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->a:Ll/u3c;

    .line 256
    .line 257
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 266
    .line 267
    const-string v2, "anchor_id"

    .line 268
    .line 269
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getPayAmount()J

    .line 278
    .line 279
    .line 280
    move-result-wide v2

    .line 281
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 282
    .line 283
    .line 284
    move-result-object v2

    .line 285
    const-string v3, "bullet_price"

    .line 286
    .line 287
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 292
    .line 293
    .line 294
    move-result-object v3

    .line 295
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getType()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v3

    .line 299
    const-string v4, "bullet_type"

    .line 300
    .line 301
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 302
    .line 303
    .line 304
    move-result-object v3

    .line 305
    invoke-virtual {p1, v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getMasks(I)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getUserId()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    const-string v0, "bullet_user_id"

    .line 314
    .line 315
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 316
    .line 317
    .line 318
    move-result-object p1

    .line 319
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->a:Ll/u3c;

    .line 320
    .line 321
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    const-string v4, "live_id"

    .line 330
    .line 331
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    filled-new-array {v1, v2, v3, p1, v0}, [Ll/pf60;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    const-string v0, "e_live_bullet_chat"

    .line 340
    .line 341
    invoke-static {v0, p2, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 342
    .line 343
    .line 344
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->k()V

    .line 345
    .line 346
    .line 347
    return-void

    .line 348
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 349
    .line 350
    goto :goto_1

    .line 351
    :cond_2
    return-void
.end method

.method public final m(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    add-int/2addr v2, v3

    .line 18
    int-to-float v2, v2

    .line 19
    div-float/2addr v1, v2

    .line 20
    const/high16 v2, 0x3f800000    # 1.0f

    .line 21
    .line 22
    cmpl-float v1, v1, v2

    .line 23
    .line 24
    if-ltz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 31
    .line 32
    .line 33
    check-cast p1, Ll/csl;

    .line 34
    .line 35
    invoke-static {p1}, Ll/u2c;->c(Ll/csl;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->f:I

    .line 40
    .line 41
    int-to-float p0, p0

    .line 42
    sub-float/2addr v0, p0

    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->l()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    if-eq p1, p3, :cond_0

    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->b:Ljava/util/List;

    .line 9
    .line 10
    new-instance p3, Ll/f3c;

    .line 11
    .line 12
    invoke-direct {p3, p1}, Ll/f3c;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-static {p2, p3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->e:I

    .line 19
    .line 20
    int-to-float p2, p2

    .line 21
    const/high16 p3, 0x447a0000    # 1000.0f

    .line 22
    .line 23
    div-float/2addr p3, p2

    .line 24
    const p2, 0x45bb8000    # 6000.0f

    .line 25
    .line 26
    .line 27
    div-float/2addr p2, p3

    .line 28
    int-to-float p1, p1

    .line 29
    div-float/2addr p1, p2

    .line 30
    float-to-double p1, p1

    .line 31
    invoke-static {p1, p2}, Ljava/lang/Math;->ceil(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide p1

    .line 35
    double-to-int p1, p1

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->f:I

    .line 37
    .line 38
    :cond_0
    return-void
.end method
