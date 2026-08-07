.class public Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    if-eq v0, v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->g:F

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->h:F

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->g:F

    .line 28
    .line 29
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->e:F

    .line 30
    .line 31
    sub-float/2addr v0, v2

    .line 32
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->h:F

    .line 37
    .line 38
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->f:F

    .line 39
    .line 40
    sub-float/2addr v2, v3

    .line 41
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    cmpg-float v0, v0, v2

    .line 46
    .line 47
    if-gez v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->f:F

    .line 54
    .line 55
    sub-float/2addr p1, v0

    .line 56
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    int-to-float v0, v0

    .line 73
    cmpl-float p1, p1, v0

    .line 74
    .line 75
    if-lez p1, :cond_2

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->i:Ljava/lang/Runnable;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_2

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->i:Ljava/lang/Runnable;

    .line 86
    .line 87
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->e:F

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->f:F

    .line 106
    .line 107
    :goto_0
    return v1
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ygj;->a(Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->b:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    const/16 v2, 0x50

    .line 15
    .line 16
    invoke-virtual {p3, v0, p2, v1, v2}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sget p2, Lcom/p1/mobile/putong/core/R$string;->nb:I

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->c:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    sget p2, Lcom/p1/mobile/putong/core/R$string;->lb:I

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->d:Lv/VText;

    .line 37
    .line 38
    sget p3, Lcom/p1/mobile/putong/core/R$string;->mb:I

    .line 39
    .line 40
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    filled-new-array {p1}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string p3, "#e1a11c"

    .line 53
    .line 54
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 59
    .line 60
    invoke-static {p2, p1, p3, v0}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
