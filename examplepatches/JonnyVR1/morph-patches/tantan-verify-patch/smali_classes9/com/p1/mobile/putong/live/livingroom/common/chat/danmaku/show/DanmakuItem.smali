.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/csl;


# static fields
.field public static final i:I


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

.field public b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

.field public f:Landroid/graphics/drawable/GradientDrawable;

.field public g:Lcom/p1/mobile/putong/ui/download/DownloadTask;

.field public h:Landroid/graphics/Bitmap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->l:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->i:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->j()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->g(Ljava/io/File;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->i(Ljava/io/File;)V

    return-void
.end method

.method public static synthetic d(Ll/sh3;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sh3;->h:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->h(Ljava/io/File;)V

    return-void
.end method

.method private synthetic g(Ljava/io/File;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/ps40;->h(Landroid/view/View;Ljava/io/File;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->h:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    return-void
.end method

.method private synthetic h(Ljava/io/File;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/ps40;->h(Landroid/view/View;Ljava/io/File;)Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->h:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    return-void
.end method

.method private synthetic i(Ljava/io/File;)V
    .locals 1

    .line 1
    new-instance v0, Ll/t2c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/t2c;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;Ljava/io/File;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic j()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->f:Landroid/graphics/drawable/GradientDrawable;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private k(Ll/sh3;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Ll/sh3;->m:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/ps40;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    new-instance p1, Ll/q2c;

    .line 18
    .line 19
    invoke-direct {p1, p0, v0}, Ll/q2c;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;Ljava/io/File;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p1, p1, Ll/sh3;->m:Ljava/lang/String;

    .line 27
    .line 28
    new-instance v1, Ll/r2c;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/r2c;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ll/s2c;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Ll/s2c;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v0, v1, v2}, Ll/ps40;->f(Ljava/lang/String;Ljava/io/File;Ll/y20;Ll/x20;)Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->g:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public B()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Ll/bnl0;->f:I

    .line 8
    .line 9
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10
    .line 11
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/v2c;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->e:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->stopAnimCompletely()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->h:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->g:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 12
    .line 13
    invoke-static {v0, p0}, Ll/ps40;->e(Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onMeasure(II)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-static {v4}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    move-object v3, p0

    .line 28
    move v5, p1

    .line 29
    move v7, p2

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    const/4 v6, 0x0

    .line 32
    const/4 v8, 0x0

    .line 33
    move-object v3, p0

    .line 34
    move v5, p1

    .line 35
    move v7, p2

    .line 36
    invoke-virtual/range {v3 .. v8}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 48
    .line 49
    iget p1, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 50
    .line 51
    add-int/2addr p0, p1

    .line 52
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 57
    .line 58
    iget p1, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 59
    .line 60
    add-int/2addr p0, p1

    .line 61
    add-int/2addr v0, p0

    .line 62
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 63
    .line 64
    move-object p0, v3

    .line 65
    move p1, v5

    .line 66
    move p2, v7

    .line 67
    goto :goto_0

    .line 68
    :cond_1
    move-object v3, p0

    .line 69
    move v7, p2

    .line 70
    const/high16 p0, 0x40000000    # 2.0f

    .line 71
    .line 72
    invoke-static {v0, p0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    invoke-virtual {v3, p0, v7}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public z(Ll/sh3;)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    sget v1, Ll/qa00;->A:I

    .line 4
    .line 5
    iget-object v2, p1, Ll/sh3;->e:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p1, Ll/sh3;->g:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p1, Ll/sh3;->f:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, v4}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 15
    .line 16
    new-instance v1, Ll/p2c;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Ll/p2c;-><init>(Ll/sh3;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const-string v2, "..."

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    iget-object v1, p1, Ll/sh3;->c:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    const/4 v4, 0x6

    .line 41
    if-le v1, v4, :cond_0

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->c:Lv/VText;

    .line 44
    .line 45
    iget-object v5, p1, Ll/sh3;->c:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v5, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    iget-object v1, p1, Ll/sh3;->c:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    const/4 v4, 0x4

    .line 72
    if-le v1, v4, :cond_1

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->c:Lv/VText;

    .line 75
    .line 76
    iget-object v5, p1, Ll/sh3;->c:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v5, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-virtual {v4, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->c:Lv/VText;

    .line 91
    .line 92
    iget-object v2, p1, Ll/sh3;->c:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->d:Lv/VText;

    .line 98
    .line 99
    iget-object v2, p1, Ll/sh3;->b:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->f:Landroid/graphics/drawable/GradientDrawable;

    .line 105
    .line 106
    if-nez v1, :cond_2

    .line 107
    .line 108
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    .line 109
    .line 110
    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 111
    .line 112
    .line 113
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->f:Landroid/graphics/drawable/GradientDrawable;

    .line 114
    .line 115
    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->f:Landroid/graphics/drawable/GradientDrawable;

    .line 121
    .line 122
    sget v2, Ll/qa00;->i:I

    .line 123
    .line 124
    int-to-float v2, v2

    .line 125
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 126
    .line 127
    .line 128
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->f:Landroid/graphics/drawable/GradientDrawable;

    .line 129
    .line 130
    iget v2, p1, Ll/sh3;->k:I

    .line 131
    .line 132
    int-to-float v2, v2

    .line 133
    const/high16 v4, 0x42c80000    # 100.0f

    .line 134
    .line 135
    div-float/2addr v2, v4

    .line 136
    const/high16 v4, 0x437f0000    # 255.0f

    .line 137
    .line 138
    mul-float/2addr v2, v4

    .line 139
    float-to-int v2, v2

    .line 140
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 141
    .line 142
    .line 143
    iget-object v1, p1, Ll/sh3;->l:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->f:Landroid/graphics/drawable/GradientDrawable;

    .line 150
    .line 151
    if-eqz v1, :cond_3

    .line 152
    .line 153
    invoke-virtual {v2, v3, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_3
    sget v1, Ll/qa00;->a:I

    .line 158
    .line 159
    iget-object v4, p1, Ll/sh3;->l:Ljava/lang/String;

    .line 160
    .line 161
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    invoke-virtual {v2, v1, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 166
    .line 167
    .line 168
    :goto_1
    iget-object v1, p1, Ll/sh3;->j:Ljava/util/List;

    .line 169
    .line 170
    const/4 v2, 0x1

    .line 171
    if-eqz v1, :cond_5

    .line 172
    .line 173
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    iget-object v4, p1, Ll/sh3;->j:Ljava/util/List;

    .line 178
    .line 179
    if-ne v1, v2, :cond_4

    .line 180
    .line 181
    new-array v0, v0, [I

    .line 182
    .line 183
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    check-cast v1, Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    aput v1, v0, v3

    .line 194
    .line 195
    iget-object v1, p1, Ll/sh3;->j:Ljava/util/List;

    .line 196
    .line 197
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    check-cast v1, Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    aput v1, v0, v2

    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_4
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    new-array v0, v0, [I

    .line 215
    .line 216
    move v1, v3

    .line 217
    :goto_2
    iget-object v4, p1, Ll/sh3;->j:Ljava/util/List;

    .line 218
    .line 219
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    if-ge v1, v4, :cond_6

    .line 224
    .line 225
    iget-object v4, p1, Ll/sh3;->j:Ljava/util/List;

    .line 226
    .line 227
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    check-cast v4, Ljava/lang/String;

    .line 232
    .line 233
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 234
    .line 235
    .line 236
    move-result v4

    .line 237
    aput v4, v0, v1

    .line 238
    .line 239
    add-int/lit8 v1, v1, 0x1

    .line 240
    .line 241
    goto :goto_2

    .line 242
    :cond_5
    new-array v0, v0, [I

    .line 243
    .line 244
    const/high16 v1, -0x1000000

    .line 245
    .line 246
    aput v1, v0, v3

    .line 247
    .line 248
    aput v1, v0, v2

    .line 249
    .line 250
    :cond_6
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->f:Landroid/graphics/drawable/GradientDrawable;

    .line 251
    .line 252
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 253
    .line 254
    .line 255
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;

    .line 256
    .line 257
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->f:Landroid/graphics/drawable/GradientDrawable;

    .line 258
    .line 259
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 260
    .line 261
    .line 262
    iget-object v0, p1, Ll/sh3;->m:Ljava/lang/String;

    .line 263
    .line 264
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    if-nez v0, :cond_7

    .line 269
    .line 270
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->k(Ll/sh3;)V

    .line 271
    .line 272
    .line 273
    :cond_7
    iget-object v0, p1, Ll/sh3;->i:Ljava/lang/String;

    .line 274
    .line 275
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->e:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 280
    .line 281
    if-nez v0, :cond_8

    .line 282
    .line 283
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 284
    .line 285
    .line 286
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;->e:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 287
    .line 288
    iget-object p1, p1, Ll/sh3;->i:Ljava/lang/String;

    .line 289
    .line 290
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem$a;

    .line 291
    .line 292
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuItem;)V

    .line 293
    .line 294
    .line 295
    const/4 p0, -0x1

    .line 296
    invoke-virtual {v0, p1, p0, v1, v2}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->loadSVGAAnimWithListener(Ljava/lang/String;ILcom/immomo/svgaplayer/SVGAAnimListenerAdapter;Z)V

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :cond_8
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 301
    .line 302
    .line 303
    return-void
.end method
