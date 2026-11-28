.class final Le/e/a/NicolivePlayerFrame;
.super Landroid/widget/FrameLayout;
.source "NicolivePlayerFrame.java"


# instance fields
.field final bottom:Landroid/widget/LinearLayout;

.field cc:Landroid/widget/ImageButton;

.field final comments:Le/e/a/NicoliveCommentsView;

.field compact:Z

.field cornerLeft:Z

.field cornerResize:Z

.field cornerTop:Z

.field cornerWidth:I

.field cornerX:I

.field cornerY:I

.field downX:F

.field downY:F

.field dragging:Z

.field final hideControls:Ljava/lang/Runnable;

.field lastComments:Ljava/lang/Boolean;

.field lastPlaying:Ljava/lang/Boolean;

.field final live:Landroid/widget/TextView;

.field originX:I

.field originY:I

.field owner:Le/e/a/NicoliveService;

.field pendingTap:Ljava/lang/Runnable;

.field pictureTouch:Z

.field pinched:Z

.field final play:Landroid/widget/ImageButton;

.field popout:Landroid/widget/ImageButton;

.field final popup:Z

.field ratio:F

.field reconnect:Landroid/widget/ImageButton;

.field resizing:Z

.field final scale:Landroid/view/ScaleGestureDetector;

.field final tapPolicy:Le/e/a/PopupTouchPolicy125$State;

.field final top:Landroid/widget/LinearLayout;

.field final touchSlop:I

.field final video:Landroid/view/TextureView;


# direct methods
.method constructor <init>(Landroid/content/Context;Z)V
    .registers 11

    .line 31
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const v0, 0x3fe38e39

    .line 20
    iput v0, p0, Le/e/a/NicolivePlayerFrame;->ratio:F

    .line 24
    new-instance v0, Le/e/a/PopupTouchPolicy125$State;

    invoke-direct {v0}, Le/e/a/PopupTouchPolicy125$State;-><init>()V

    iput-object v0, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    .line 28
    new-instance v0, Le/e/a/NicolivePlayerFrame$1;

    invoke-direct {v0, p0}, Le/e/a/NicolivePlayerFrame$1;-><init>(Le/e/a/NicolivePlayerFrame;)V

    iput-object v0, p0, Le/e/a/NicolivePlayerFrame;->hideControls:Ljava/lang/Runnable;

    .line 31
    iput-boolean p2, p0, Le/e/a/NicolivePlayerFrame;->popup:Z

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Le/e/a/NicolivePlayerFrame;->touchSlop:I

    const/high16 v0, -0x1000000

    invoke-virtual {p0, v0}, Le/e/a/NicolivePlayerFrame;->setBackgroundColor(I)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le/e/a/NicolivePlayerFrame;->setClickable(Z)V

    .line 32
    new-instance v1, Landroid/view/TextureView;

    invoke-direct {v1, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le/e/a/NicolivePlayerFrame;->video:Landroid/view/TextureView;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v2}, Le/e/a/NicolivePlayerFrame;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    new-instance v1, Le/e/a/NicoliveCommentsView;

    invoke-direct {v1, p1}, Le/e/a/NicoliveCommentsView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v2}, Le/e/a/NicolivePlayerFrame;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    invoke-static {p1}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    iput-object v1, p0, Le/e/a/NicolivePlayerFrame;->top:Landroid/widget/LinearLayout;

    invoke-static {p1}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    iput-object v1, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    const/high16 v2, -0x50000000

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 35
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v4, 0x42100000    # 36.0f

    invoke-static {p1, v4}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v5

    const/16 v6, 0x50

    invoke-direct {v2, v3, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v1, v2}, Le/e/a/NicolivePlayerFrame;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    const-string v2, "\u4e00\u6642\u505c\u6b62"

    const-string v5, "pause"

    invoke-static {p1, v5, v2}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v2

    iput-object v2, p0, Le/e/a/NicolivePlayerFrame;->play:Landroid/widget/ImageButton;

    new-instance v6, Le/e/a/NicoliveUi$Glyph;

    invoke-direct {v6, v5, v3}, Le/e/a/NicoliveUi$Glyph;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v2, v6}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 37
    new-instance v5, Le/e/a/NicolivePlayerFrame$0;

    invoke-direct {v5, p0}, Le/e/a/NicolivePlayerFrame$0;-><init>(Le/e/a/NicolivePlayerFrame;)V

    invoke-virtual {v2, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    const-string v2, "LIVE"

    const/16 v5, 0xc

    invoke-static {p1, v2, v5}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    iput-object v2, p0, Le/e/a/NicolivePlayerFrame;->live:Landroid/widget/TextView;

    const/16 v5, 0x11

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v5, 0x40800000    # 4.0f

    invoke-static {p1, v5}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-static {p1, v5}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v5

    const/4 v7, 0x0

    invoke-virtual {v2, v6, v7, v5, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    const-string/jumbo v5, "\u6700\u65b0\u306e\u518d\u751f\u4f4d\u7f6e\u3078\u623b\u308b"

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {p1}, Le/e/a/NicoliveUi;->videoAccent(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v5, 0x41400000    # 12.0f

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setMinWidth(I)V

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setMinimumWidth(I)V

    .line 39
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v0, v7, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le/e/a/NicolivePlayerFrame$4;

    invoke-direct {v0, p0}, Le/e/a/NicolivePlayerFrame$4;-><init>(Le/e/a/NicolivePlayerFrame;)V

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-nez p2, :cond_0

    .line 41
    const-string v0, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a"

    const-string v2, "comments"

    invoke-static {p1, v2, v0}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicolivePlayerFrame;->cc:Landroid/widget/ImageButton;

    new-instance v5, Le/e/a/NicoliveUi$Glyph;

    invoke-direct {v5, v2, v3}, Le/e/a/NicoliveUi$Glyph;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->cc:Landroid/widget/ImageButton;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 42
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->cc:Landroid/widget/ImageButton;

    new-instance v2, Le/e/a/NicolivePlayerFrame$5;

    invoke-direct {v2, p0}, Le/e/a/NicolivePlayerFrame$5;-><init>(Le/e/a/NicolivePlayerFrame;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    const-string v0, "\u518d\u63a5\u7d9a"

    const-string v2, "refresh"

    invoke-static {p1, v2, v0}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicolivePlayerFrame;->reconnect:Landroid/widget/ImageButton;

    new-instance v5, Le/e/a/NicoliveUi$Glyph;

    invoke-direct {v5, v2, v3}, Le/e/a/NicoliveUi$Glyph;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->reconnect:Landroid/widget/ImageButton;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->reconnect:Landroid/widget/ImageButton;

    new-instance v2, Le/e/a/NicolivePlayerFrame$6;

    invoke-direct {v2, p0}, Le/e/a/NicolivePlayerFrame$6;-><init>(Le/e/a/NicolivePlayerFrame;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string v0, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7"

    const-string v2, "popup"

    invoke-static {p1, v2, v0}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicolivePlayerFrame;->popout:Landroid/widget/ImageButton;

    new-instance v5, Le/e/a/NicoliveUi$Glyph;

    invoke-direct {v5, v2, v3}, Le/e/a/NicoliveUi$Glyph;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->popout:Landroid/widget/ImageButton;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->popout:Landroid/widget/ImageButton;

    new-instance v2, Le/e/a/NicolivePlayerFrame$7;

    invoke-direct {v2, p1}, Le/e/a/NicolivePlayerFrame$7;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, v7}, Le/e/a/NicolivePlayerFrame;->fullscreen(Z)V

    :cond_0
    if-eqz p2, :cond_1

    .line 45
    const-string/jumbo v0, "\u901a\u5e38\u753b\u9762\u3078"

    goto :goto_0

    :cond_1
    const-string v0, "\u5168\u753b\u9762"

    :goto_0
    const-string v2, "expand"

    invoke-static {p1, v2, v0}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    new-instance v5, Le/e/a/NicoliveUi$Glyph;

    invoke-direct {v5, v2, v3}, Le/e/a/NicoliveUi$Glyph;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 46
    new-instance v2, Le/e/a/NicolivePlayerFrame$8;

    invoke-direct {v2, p0, p1}, Le/e/a/NicolivePlayerFrame$8;-><init>(Le/e/a/NicolivePlayerFrame;Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    const-string v0, "close"

    const-string v2, "settings"

    if-eqz p2, :cond_2

    const-string v5, "\u518d\u751f\u3092\u7d42\u4e86"

    move-object v6, v0

    goto :goto_1

    :cond_2
    const-string/jumbo v5, "\u753b\u8cea\u3068\u8868\u793a\u8a2d\u5b9a"

    move-object v6, v2

    :goto_1
    invoke-static {p1, v6, v5}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v5

    new-instance v6, Le/e/a/NicoliveUi$Glyph;

    if-nez p2, :cond_3

    move-object v0, v2

    :cond_3
    invoke-direct {v6, v0, v3}, Le/e/a/NicoliveUi$Glyph;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v5, v6}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 48
    new-instance v0, Le/e/a/NicolivePlayerFrame$9;

    invoke-direct {v0, p0, p1}, Le/e/a/NicolivePlayerFrame$9;-><init>(Le/e/a/NicolivePlayerFrame;Landroid/content/Context;)V

    invoke-virtual {v5, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move v0, v7

    .line 49
    :goto_2
    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_5

    if-eqz p2, :cond_4

    .line 53
    const-string/jumbo p2, "\u6620\u50cf\u3092\u30c9\u30e9\u30c3\u30b0\u3057\u3066\u79fb\u52d5\u3001\u56db\u9685\u307e\u305f\u306f\u30d4\u30f3\u30c1\u3067\u30b5\u30a4\u30ba\u5909\u66f4"

    invoke-virtual {p0, p2}, Le/e/a/NicolivePlayerFrame;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 55
    :cond_4
    new-instance p2, Landroid/view/ScaleGestureDetector;

    new-instance v0, Le/e/a/NicolivePlayerFrame$2;

    invoke-direct {v0, p0}, Le/e/a/NicolivePlayerFrame$2;-><init>(Le/e/a/NicolivePlayerFrame;)V

    invoke-direct {p2, p1, v0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object p2, p0, Le/e/a/NicolivePlayerFrame;->scale:Landroid/view/ScaleGestureDetector;

    .line 59
    invoke-virtual {p2, v7}, Landroid/view/ScaleGestureDetector;->setQuickScaleEnabled(Z)V

    invoke-virtual {p2, v7}, Landroid/view/ScaleGestureDetector;->setStylusScaleEnabled(Z)V

    .line 60
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->video:Landroid/view/TextureView;

    new-instance p2, Le/e/a/NicolivePlayerFrame$10;

    invoke-direct {p2, p0}, Le/e/a/NicolivePlayerFrame$10;-><init>(Le/e/a/NicolivePlayerFrame;)V

    invoke-virtual {p1, p2}, Landroid/view/TextureView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void

    .line 49
    :cond_5
    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/ImageButton;

    if-eqz v2, :cond_6

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42200000    # 40.0f

    invoke-static {p1, v3}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-static {p1, v4}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-direct {v2, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {p1, v2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    const/high16 v5, 0x40c00000    # 6.0f

    invoke-static {p1, v5}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-static {p1, v2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-static {p1, v5}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-virtual {v1, v3, v6, v2, v5}, Landroid/view/View;->setPadding(IIII)V

    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method static synthetic lambda$4(Landroid/content/Context;Landroid/view/View;)V
    .registers 2

    .line 44
    instance-of p1, p0, Le/e/a/NicoliveActivity;

    if-eqz p1, :cond_0

    check-cast p0, Le/e/a/NicoliveActivity;

    invoke-virtual {p0}, Le/e/a/NicoliveActivity;->popup()V

    :cond_0
    return-void
.end method


# virtual methods
.method aspect(F)V
    .registers 3

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_0

    const p1, 0x3fe38e39

    .line 74
    :cond_0
    iput p1, p0, Le/e/a/NicolivePlayerFrame;->ratio:F

    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->transform()V

    return-void
.end method

.method compact(Z)V
    .registers 4

    .line 64
    iput-boolean p1, p0, Le/e/a/NicolivePlayerFrame;->compact:Z

    if-eqz p1, :cond_0

    .line 66
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Le/e/a/NicoliveCommentsView;->setVisibility(I)V

    .line 67
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 68
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->top:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 69
    invoke-virtual {p0, v0}, Le/e/a/NicolivePlayerFrame;->setClickable(Z)V

    .line 70
    iget-object p0, p0, Le/e/a/NicolivePlayerFrame;->video:Landroid/view/TextureView;

    invoke-virtual {p0, v0}, Landroid/view/TextureView;->setClickable(Z)V

    :cond_0
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 16

    .line 93
    iget-boolean v0, p0, Le/e/a/NicolivePlayerFrame;->popup:Z

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    .line 94
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_9

    .line 96
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->pendingTap:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    invoke-virtual {p0, v0}, Le/e/a/NicolivePlayerFrame;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/NicolivePlayerFrame;->pendingTap:Ljava/lang/Runnable;

    .line 97
    :cond_1
    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->cornerResize:Z

    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->pinched:Z

    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->resizing:Z

    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->dragging:Z

    .line 98
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Le/e/a/NicolivePlayerFrame;->downX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, p0, Le/e/a/NicolivePlayerFrame;->downY:F

    .line 99
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz v0, :cond_2

    iget-object v0, v0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    if-eqz v0, :cond_2

    .line 100
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    iput v0, p0, Le/e/a/NicolivePlayerFrame;->originX:I

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    iput v0, p0, Le/e/a/NicolivePlayerFrame;->originY:I

    .line 102
    :cond_2
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iget-object v3, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getTop()I

    move-result v3

    int-to-float v3, v3

    cmpg-float v0, v0, v3

    if-ltz v0, :cond_3

    move v0, v1

    goto :goto_0

    :cond_3
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Le/e/a/NicolivePlayerFrame;->pictureTouch:Z

    .line 103
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz v0, :cond_6

    iget-object v0, v0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    if-eqz v0, :cond_6

    .line 104
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 105
    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->getHeight()I

    move-result v5

    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    .line 104
    invoke-static {v0, v3, v4, v5, v6}, Le/e/a/NicolivePopupCorner202;->hit(FFIIF)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 106
    iput-boolean v2, p0, Le/e/a/NicolivePlayerFrame;->cornerResize:Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->getWidth()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    cmpg-float v0, v0, v3

    if-gez v0, :cond_4

    move v0, v2

    goto :goto_1

    :cond_4
    move v0, v1

    :goto_1
    iput-boolean v0, p0, Le/e/a/NicolivePlayerFrame;->cornerLeft:Z

    .line 107
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v4

    cmpg-float p1, p1, v0

    if-gez p1, :cond_5

    move v1, v2

    :cond_5
    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->cornerTop:Z

    .line 108
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-object p1, p1, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    iput p1, p0, Le/e/a/NicolivePlayerFrame;->cornerWidth:I

    .line 109
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-object p1, p1, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->x:I

    iput p1, p0, Le/e/a/NicolivePlayerFrame;->cornerX:I

    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-object p1, p1, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->y:I

    iput p1, p0, Le/e/a/NicolivePlayerFrame;->cornerY:I

    .line 110
    iget-object p0, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    invoke-virtual {p0}, Le/e/a/PopupTouchPolicy125$State;->cancel()V

    return v2

    .line 113
    :cond_6
    iget-boolean v0, p0, Le/e/a/NicolivePlayerFrame;->pictureTouch:Z

    .line 118
    iget-object v3, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    if-nez v0, :cond_7

    .line 115
    invoke-virtual {v3}, Le/e/a/PopupTouchPolicy125$State;->cancel()V

    .line 116
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    .line 118
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    iget v6, p0, Le/e/a/NicolivePlayerFrame;->downX:F

    iget v7, p0, Le/e/a/NicolivePlayerFrame;->downY:F

    .line 119
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_8

    move v8, v2

    goto :goto_2

    :cond_8
    move v8, v1

    .line 120
    :goto_2
    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledDoubleTapSlop()I

    move-result v10

    .line 121
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v0

    int-to-long v11, v0

    const/4 v9, 0x0

    .line 118
    invoke-virtual/range {v3 .. v12}, Le/e/a/PopupTouchPolicy125$State;->begin(JFFZZIJ)Z

    .line 122
    iget-object p0, p0, Le/e/a/NicolivePlayerFrame;->scale:Landroid/view/ScaleGestureDetector;

    invoke-virtual {p0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    return v2

    .line 125
    :cond_9
    iget-boolean v3, p0, Le/e/a/NicolivePlayerFrame;->cornerResize:Z

    const/4 v4, 0x3

    const/4 v5, 0x5

    const/4 v6, 0x2

    if-eqz v3, :cond_e

    if-ne v0, v5, :cond_a

    .line 127
    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->cornerResize:Z

    iput-boolean v2, p0, Le/e/a/NicolivePlayerFrame;->resizing:Z

    iput-boolean v2, p0, Le/e/a/NicolivePlayerFrame;->pinched:Z

    iget-object p0, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    invoke-virtual {p0}, Le/e/a/PopupTouchPolicy125$State;->cancel()V

    return v2

    :cond_a
    if-ne v0, v6, :cond_b

    .line 130
    iget-object v3, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz v3, :cond_b

    iget-object v3, v3, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    if-eqz v3, :cond_b

    .line 131
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    iget v5, p0, Le/e/a/NicolivePlayerFrame;->downX:F

    sub-float v10, v3, v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iget v3, p0, Le/e/a/NicolivePlayerFrame;->downY:F

    sub-float v11, p1, v3

    float-to-double v5, v10

    float-to-double v7, v11

    .line 132
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v5

    iget p1, p0, Le/e/a/NicolivePlayerFrame;->touchSlop:I

    int-to-double v7, p1

    cmpl-double p1, v5, v7

    if-lez p1, :cond_b

    .line 133
    iput-boolean v2, p0, Le/e/a/NicolivePlayerFrame;->dragging:Z

    .line 134
    iget-object v6, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget v7, p0, Le/e/a/NicolivePlayerFrame;->cornerWidth:I

    iget v8, p0, Le/e/a/NicolivePlayerFrame;->cornerX:I

    iget v9, p0, Le/e/a/NicolivePlayerFrame;->cornerY:I

    .line 135
    iget-boolean v12, p0, Le/e/a/NicolivePlayerFrame;->cornerLeft:Z

    iget-boolean v13, p0, Le/e/a/NicolivePlayerFrame;->cornerTop:Z

    .line 134
    invoke-virtual/range {v6 .. v13}, Le/e/a/NicoliveService;->cornerResizePopup(IIIFFZZ)V

    :cond_b
    if-eq v0, v2, :cond_c

    if-ne v0, v4, :cond_d

    .line 139
    :cond_c
    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->resizing:Z

    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->dragging:Z

    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->cornerResize:Z

    :cond_d
    return v2

    .line 142
    :cond_e
    iget-boolean v3, p0, Le/e/a/NicolivePlayerFrame;->pictureTouch:Z

    if-nez v3, :cond_f

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :cond_f
    if-ne v0, v5, :cond_10

    .line 144
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    invoke-virtual {v0}, Le/e/a/PopupTouchPolicy125$State;->cancel()V

    iput-boolean v2, p0, Le/e/a/NicolivePlayerFrame;->resizing:Z

    iput-boolean v2, p0, Le/e/a/NicolivePlayerFrame;->pinched:Z

    .line 145
    iget-object p0, p0, Le/e/a/NicolivePlayerFrame;->scale:Landroid/view/ScaleGestureDetector;

    invoke-virtual {p0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    return v2

    :cond_10
    const/4 v3, 0x6

    if-ne v0, v3, :cond_11

    .line 148
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->scale:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    invoke-virtual {p1}, Le/e/a/PopupTouchPolicy125$State;->cancel()V

    iput-boolean v2, p0, Le/e/a/NicolivePlayerFrame;->pinched:Z

    return v2

    :cond_11
    if-ne v0, v6, :cond_14

    .line 151
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->scale:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 152
    iget-boolean v0, p0, Le/e/a/NicolivePlayerFrame;->pinched:Z

    if-nez v0, :cond_13

    .line 153
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    iget v4, p0, Le/e/a/NicolivePlayerFrame;->touchSlop:I

    invoke-virtual {v0, v1, v3, v4}, Le/e/a/PopupTouchPolicy125$State;->move(FFI)V

    .line 154
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v1, p0, Le/e/a/NicolivePlayerFrame;->downX:F

    sub-float/2addr v0, v1

    float-to-double v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    iget v4, p0, Le/e/a/NicolivePlayerFrame;->downY:F

    sub-float/2addr v3, v4

    float-to-double v3, v3

    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v0

    iget v3, p0, Le/e/a/NicolivePlayerFrame;->touchSlop:I

    int-to-double v3, v3

    cmpl-double v0, v0, v3

    if-lez v0, :cond_12

    .line 155
    iput-boolean v2, p0, Le/e/a/NicolivePlayerFrame;->dragging:Z

    .line 156
    :cond_12
    iget-boolean v0, p0, Le/e/a/NicolivePlayerFrame;->dragging:Z

    if-eqz v0, :cond_13

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz v0, :cond_13

    iget-object v0, v0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    if-eqz v0, :cond_13

    .line 157
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget v1, p0, Le/e/a/NicolivePlayerFrame;->originX:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    iget v4, p0, Le/e/a/NicolivePlayerFrame;->downX:F

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    add-int/2addr v1, v3

    .line 158
    iget v3, p0, Le/e/a/NicolivePlayerFrame;->originY:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iget p0, p0, Le/e/a/NicolivePlayerFrame;->downY:F

    sub-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    add-int/2addr v3, p0

    .line 157
    invoke-virtual {v0, v1, v3}, Le/e/a/NicoliveService;->movePopup(II)V

    :cond_13
    return v2

    :cond_14
    if-ne v0, v2, :cond_18

    .line 163
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->scale:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 164
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v4

    iget v5, p0, Le/e/a/NicolivePlayerFrame;->touchSlop:I

    invoke-virtual {v0, v3, v4, v5}, Le/e/a/PopupTouchPolicy125$State;->move(FFI)V

    .line 166
    iget-boolean v0, p0, Le/e/a/NicolivePlayerFrame;->dragging:Z

    if-nez v0, :cond_15

    iget-boolean v0, p0, Le/e/a/NicolivePlayerFrame;->pinched:Z

    if-nez v0, :cond_15

    .line 167
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v3

    .line 168
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result p1

    int-to-long v7, p1

    .line 167
    invoke-virtual {v0, v3, v4, v7, v8}, Le/e/a/PopupTouchPolicy125$State;->end(JJ)I

    move-result p1

    goto :goto_3

    .line 169
    :cond_15
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    invoke-virtual {p1}, Le/e/a/PopupTouchPolicy125$State;->cancel()V

    move p1, v1

    :goto_3
    if-ne p1, v6, :cond_16

    .line 173
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz p1, :cond_17

    invoke-virtual {p1}, Le/e/a/NicoliveService;->stopPlayback()V

    goto :goto_4

    :cond_16
    if-ne p1, v2, :cond_17

    .line 175
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    .line 176
    new-instance v0, Le/e/a/NicolivePlayerFrame$3;

    invoke-direct {v0, p0, p1}, Le/e/a/NicolivePlayerFrame$3;-><init>(Le/e/a/NicolivePlayerFrame;Le/e/a/NicoliveService;)V

    .line 183
    iput-object v0, p0, Le/e/a/NicolivePlayerFrame;->pendingTap:Ljava/lang/Runnable;

    .line 184
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result p1

    int-to-long v3, p1

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    invoke-virtual {p0, v0, v3, v4}, Le/e/a/NicolivePlayerFrame;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 186
    :cond_17
    :goto_4
    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->pinched:Z

    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->resizing:Z

    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->dragging:Z

    return v2

    :cond_18
    if-ne v0, v4, :cond_19

    .line 190
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    invoke-virtual {p1}, Le/e/a/PopupTouchPolicy125$State;->cancel()V

    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->pinched:Z

    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->resizing:Z

    iput-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->dragging:Z

    :cond_19
    return v2
.end method

.method fullscreen(Z)V
    .registers 6

    .line 73
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->reconnect:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    :cond_1
    iget-object p0, p0, Le/e/a/NicolivePlayerFrame;->popout:Landroid/widget/ImageButton;

    if-eqz p0, :cond_3

    if-nez p1, :cond_2

    move v1, v2

    :cond_2
    invoke-virtual {p0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    :cond_3
    return-void
.end method

.method synthetic lambda$0$e-e-a-NicolivePlayerFrame(Landroid/view/View;)V
    .registers 3

    .line 37
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Le/e/a/NicoliveService;->playRequested()Z

    move-result p1

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz p1, :cond_0

    invoke-virtual {v0}, Le/e/a/NicoliveService;->pause()V

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Le/e/a/NicoliveService;->resume()V

    :goto_0
    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->revealControls()V

    :cond_1
    return-void
.end method

.method synthetic lambda$1$e-e-a-NicolivePlayerFrame(Landroid/view/View;)V
    .registers 2

    .line 39
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Le/e/a/NicoliveService;->goLive()V

    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->revealControls()V

    :cond_0
    return-void
.end method

.method synthetic lambda$2$e-e-a-NicolivePlayerFrame(Landroid/view/View;)V
    .registers 2

    .line 42
    iget-object p1, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Le/e/a/NicoliveService;->toggleComments()V

    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->revealControls()V

    :cond_0
    return-void
.end method

.method synthetic lambda$3$e-e-a-NicolivePlayerFrame(Landroid/view/View;)V
    .registers 2

    .line 44
    iget-object p0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Le/e/a/NicoliveService;->reconnect()V

    :cond_0
    return-void
.end method

.method synthetic lambda$5$e-e-a-NicolivePlayerFrame(Landroid/content/Context;Landroid/view/View;)V
    .registers 3

    .line 46
    iget-object p2, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz p2, :cond_1

    iget-boolean p0, p0, Le/e/a/NicolivePlayerFrame;->popup:Z

    if-eqz p0, :cond_0

    invoke-virtual {p2}, Le/e/a/NicoliveService;->returnToActivity()V

    return-void

    :cond_0
    instance-of p0, p1, Le/e/a/NicoliveActivity;

    if-eqz p0, :cond_1

    check-cast p1, Le/e/a/NicoliveActivity;

    invoke-virtual {p1}, Le/e/a/NicoliveActivity;->toggleFullscreen()V

    :cond_1
    return-void
.end method

.method synthetic lambda$6$e-e-a-NicolivePlayerFrame(Landroid/content/Context;Landroid/view/View;)V
    .registers 3

    .line 48
    iget-object p2, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz p2, :cond_1

    iget-boolean p0, p0, Le/e/a/NicolivePlayerFrame;->popup:Z

    if-eqz p0, :cond_0

    invoke-virtual {p2}, Le/e/a/NicoliveService;->stopPlayback()V

    return-void

    :cond_0
    instance-of p0, p1, Le/e/a/NicoliveActivity;

    if-eqz p0, :cond_1

    check-cast p1, Le/e/a/NicoliveActivity;

    invoke-virtual {p1}, Le/e/a/NicoliveActivity;->playerSettings()V

    :cond_1
    return-void
.end method

.method synthetic lambda$7$e-e-a-NicolivePlayerFrame(Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 60
    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->transform()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .line 206
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->hideControls:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Le/e/a/NicolivePlayerFrame;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 207
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->pendingTap:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Le/e/a/NicolivePlayerFrame;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/NicolivePlayerFrame;->pendingTap:Ljava/lang/Runnable;

    .line 208
    :cond_0
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->tapPolicy:Le/e/a/PopupTouchPolicy125$State;

    invoke-virtual {v0}, Le/e/a/PopupTouchPolicy125$State;->reset()V

    .line 209
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {v0}, Le/e/a/NicoliveCommentsView;->clear()V

    .line 210
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    .line 196
    iget-boolean v0, p0, Le/e/a/NicolivePlayerFrame;->popup:Z

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public performClick()Z
    .registers 2

    .line 199
    invoke-super {p0}, Landroid/widget/FrameLayout;->performClick()Z

    .line 200
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Le/e/a/NicoliveService;->playRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    iget-object p0, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0

    .line 202
    :cond_0
    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->revealControls()V

    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method revealControls()V
    .registers 4

    .line 76
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->hideControls:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Le/e/a/NicolivePlayerFrame;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Le/e/a/NicoliveService;->playRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->hideControls:Ljava/lang/Runnable;

    const-wide/16 v1, 0xbb8

    invoke-virtual {p0, v0, v1, v2}, Le/e/a/NicolivePlayerFrame;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->updateControls()V

    return-void
.end method

.method transform()V
    .registers 9

    .line 75
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->video:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->getWidth()I

    move-result v0

    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->video:Landroid/view/TextureView;

    invoke-virtual {v1}, Landroid/view/TextureView;->getHeight()I

    move-result v1

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    int-to-float v0, v0

    int-to-float v1, v1

    div-float v2, v0, v1

    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    iget v4, p0, Le/e/a/NicolivePlayerFrame;->ratio:F

    cmpl-float v5, v2, v4

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v7, 0x40000000    # 2.0f

    if-lez v5, :cond_0

    div-float/2addr v4, v2

    div-float/2addr v0, v7

    div-float/2addr v1, v7

    invoke-virtual {v3, v4, v6, v0, v1}, Landroid/graphics/Matrix;->setScale(FFFF)V

    goto :goto_0

    :cond_0
    div-float/2addr v2, v4

    div-float/2addr v0, v7

    div-float/2addr v1, v7

    invoke-virtual {v3, v6, v2, v0, v1}, Landroid/graphics/Matrix;->setScale(FFFF)V

    :goto_0
    iget-object p0, p0, Le/e/a/NicolivePlayerFrame;->video:Landroid/view/TextureView;

    invoke-virtual {p0, v3}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    :cond_1
    return-void
.end method

.method updateControls()V
    .registers 9

    .line 78
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    if-eqz v0, :cond_e

    .line 79
    iget-boolean v1, p0, Le/e/a/NicolivePlayerFrame;->compact:Z

    if-eqz v1, :cond_0

    iget-object p0, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void

    .line 80
    :cond_0
    invoke-virtual {v0}, Le/e/a/NicoliveService;->playRequested()Z

    move-result v0

    .line 81
    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->lastPlaying:Ljava/lang/Boolean;

    const/4 v2, -0x1

    const-string v3, "\u4e00\u6642\u505c\u6b62"

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v1, v0, :cond_4

    .line 82
    :cond_1
    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->play:Landroid/widget/ImageButton;

    if-eqz v0, :cond_2

    move-object v4, v3

    goto :goto_0

    :cond_2
    const-string v4, "\u518d\u751f"

    :goto_0
    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->play:Landroid/widget/ImageButton;

    new-instance v4, Le/e/a/NicoliveUi$Glyph;

    if-eqz v0, :cond_3

    const-string v5, "pause"

    goto :goto_1

    :cond_3
    const-string v5, "play"

    :goto_1
    invoke-direct {v4, v5, v2}, Le/e/a/NicoliveUi$Glyph;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Le/e/a/NicolivePlayerFrame;->lastPlaying:Ljava/lang/Boolean;

    .line 83
    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->hideControls:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Le/e/a/NicolivePlayerFrame;->removeCallbacks(Ljava/lang/Runnable;)Z

    if-eqz v0, :cond_4

    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->hideControls:Ljava/lang/Runnable;

    const-wide/16 v4, 0xbb8

    invoke-virtual {p0, v1, v4, v5}, Le/e/a/NicolivePlayerFrame;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 85
    :cond_4
    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->cc:Landroid/widget/ImageButton;

    if-eqz v1, :cond_9

    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->lastComments:Ljava/lang/Boolean;

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v4, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-boolean v4, v4, Le/e/a/NicoliveService;->commentVisible:Z

    if-eq v1, v4, :cond_9

    :cond_5
    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-boolean v1, v1, Le/e/a/NicoliveService;->commentVisible:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Le/e/a/NicolivePlayerFrame;->lastComments:Ljava/lang/Boolean;

    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->cc:Landroid/widget/ImageButton;

    iget-object v4, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-boolean v4, v4, Le/e/a/NicoliveService;->commentVisible:Z

    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setSelected(Z)V

    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->cc:Landroid/widget/ImageButton;

    iget-object v4, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-boolean v4, v4, Le/e/a/NicoliveService;->commentVisible:Z

    if-eqz v4, :cond_6

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u3092\u975e\u8868\u793a"

    goto :goto_2

    :cond_6
    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u3092\u8868\u793a"

    :goto_2
    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->cc:Landroid/widget/ImageButton;

    new-instance v4, Le/e/a/NicoliveUi$Glyph;

    iget-object v5, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-boolean v5, v5, Le/e/a/NicoliveService;->commentVisible:Z

    if-eqz v5, :cond_7

    const-string v5, "comments"

    goto :goto_3

    :cond_7
    const-string v5, "comments-off"

    :goto_3
    iget-object v6, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-boolean v6, v6, Le/e/a/NicoliveService;->commentVisible:Z

    if-eqz v6, :cond_8

    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/NicoliveUi;->videoAccent(Landroid/content/Context;)I

    move-result v2

    :cond_8
    invoke-direct {v4, v5, v2}, Le/e/a/NicoliveUi$Glyph;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 86
    :cond_9
    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->bottom:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v1

    if-nez v1, :cond_e

    .line 87
    iget-object v1, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-boolean v1, v1, Le/e/a/NicoliveService;->terminal:Z

    if-eqz v1, :cond_a

    const-string/jumbo v3, "\u653e\u9001\u7d42\u4e86"

    goto :goto_4

    :cond_a
    if-eqz v0, :cond_b

    const-string v3, "LIVE"

    :cond_b
    :goto_4
    if-eqz v0, :cond_d

    .line 88
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    if-eqz v0, :cond_d

    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-object v0, v0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    iget-wide v0, v0, Le/e/a/NicoliveData$Program;->begin:J

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    if-lez v0, :cond_d

    iget-boolean v0, p0, Le/e/a/NicolivePlayerFrame;->popup:Z

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x43820000    # 260.0f

    invoke-static {v1, v2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    if-lt v0, v1, :cond_d

    :cond_c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/16 v6, 0x3e8

    div-long/2addr v1, v6

    iget-object v3, p0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-object v3, v3, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    iget-wide v6, v3, Le/e/a/NicoliveData$Program;->begin:J

    sub-long/2addr v1, v6

    invoke-static {v4, v5, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    invoke-static {v1, v2}, Le/e/a/NicoliveUi;->time(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 89
    :cond_d
    iget-object v0, p0, Le/e/a/NicolivePlayerFrame;->live:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_e

    iget-object p0, p0, Le/e/a/NicolivePlayerFrame;->live:Landroid/widget/TextView;

    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_e
    return-void
.end method
