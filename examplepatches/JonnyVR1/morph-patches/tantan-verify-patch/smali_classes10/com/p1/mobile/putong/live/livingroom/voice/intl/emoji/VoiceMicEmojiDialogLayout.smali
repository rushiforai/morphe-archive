.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;
.super Landroid/widget/ScrollView;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:F

.field public c:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->b:F

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->c:F

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->b:F

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->c:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->b:F

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->c:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->b:F

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->c:F

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/aao0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/oln0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->a:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_3

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0, v0}, Landroid/view/View;->scrollTo(II)V

    .line 11
    .line 12
    .line 13
    move v1, v0

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ge v1, v2, :cond_3

    .line 19
    .line 20
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ll/oln0;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    sget v4, Ll/yec0;->Q9:I

    .line 31
    .line 32
    const/4 v5, 0x0

    .line 33
    invoke-static {v3, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiGroupView;

    .line 38
    .line 39
    invoke-virtual {v2}, Ll/oln0;->a()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v2}, Ll/oln0;->b()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v3, v4, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiGroupView;->j0(Ljava/lang/String;Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 51
    .line 52
    const/4 v4, -0x1

    .line 53
    const/4 v5, -0x2

    .line 54
    invoke-direct {v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 55
    .line 56
    .line 57
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    const/4 v5, 0x1

    .line 62
    if-eq v4, v5, :cond_2

    .line 63
    .line 64
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    sub-int/2addr v4, v5

    .line 69
    if-ne v1, v4, :cond_1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    move v4, v0

    .line 73
    goto :goto_2

    .line 74
    :cond_2
    :goto_1
    const/high16 v4, 0x41f00000    # 30.0f

    .line 75
    .line 76
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    :goto_2
    invoke-virtual {v2, v0, v0, v0, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 81
    .line 82
    .line 83
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->a:Landroid/widget/LinearLayout;

    .line 84
    .line 85
    invoke-virtual {v4, v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    .line 87
    .line 88
    add-int/lit8 v1, v1, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_3
    :goto_3
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    and-int/lit16 v2, v2, 0xff

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    if-eq v2, p1, :cond_2

    .line 20
    .line 21
    const/4 v4, 0x2

    .line 22
    if-eq v2, v4, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->b:F

    .line 26
    .line 27
    sub-float v2, v0, v2

    .line 28
    .line 29
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->c:F

    .line 30
    .line 31
    sub-float v4, v1, v4

    .line 32
    .line 33
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    cmpg-float v2, v2, v4

    .line 42
    .line 43
    if-gez v2, :cond_2

    .line 44
    .line 45
    move v3, p1

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/ScrollView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_0
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->b:F

    .line 51
    .line 52
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiDialogLayout;->c:F

    .line 53
    .line 54
    return v3
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    const/high16 p2, 0x43b50000    # 362.0f

    .line 2
    .line 3
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/high16 v0, -0x80000000

    .line 8
    .line 9
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-super {p0, p1, p2}, Landroid/widget/ScrollView;->onMeasure(II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
