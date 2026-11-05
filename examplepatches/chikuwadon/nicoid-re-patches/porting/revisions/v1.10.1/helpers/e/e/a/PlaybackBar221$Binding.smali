.class final Le/e/a/PlaybackBar221$Binding;
.super Ljava/lang/Object;
.source "PlaybackBar221.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlaybackBar221;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Binding"
.end annotation


# instance fields
.field final activity:Landroid/app/Activity;

.field final bar:Landroid/widget/LinearLayout;

.field final body:Landroid/view/View;

.field final bodyPadding:I

.field final content:Landroid/widget/FrameLayout;

.field final height:I

.field final owner:Ljava/lang/Object;

.field final play:Landroid/widget/Button;

.field final thumbnail:Landroid/widget/ImageView;

.field final title:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 10

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaybackBar221$Binding;->activity:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/PlaybackBar221$Binding;->owner:Ljava/lang/Object;

    const p2, 0x1020002

    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/FrameLayout;

    iput-object p2, p0, Le/e/a/PlaybackBar221$Binding;->content:Landroid/widget/FrameLayout;

    if-eqz p2, :cond_148

    const/16 v0, 0x38

    invoke-static {p1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Le/e/a/PlaybackBar221$Binding;->height:I

    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_28

    invoke-virtual {p2, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    goto :goto_29

    :cond_28
    const/4 p2, 0x0

    :goto_29
    iput-object p2, p0, Le/e/a/PlaybackBar221$Binding;->body:Landroid/view/View;

    if-nez p2, :cond_2f

    const/4 p2, 0x0

    goto :goto_33

    :cond_2f
    invoke-virtual {p2}, Landroid/view/View;->getPaddingBottom()I

    move-result p2

    :goto_33
    iput p2, p0, Le/e/a/PlaybackBar221$Binding;->bodyPadding:I

    .line 48
    new-instance p2, Landroid/widget/LinearLayout;

    invoke-static {p1}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Le/e/a/PlaybackBar221$Binding;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v0, 0x10

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    const-string v2, "nicoid-playback-bar"

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    invoke-static {p1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 49
    new-instance v2, Landroid/widget/ImageView;

    invoke-direct {v2, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le/e/a/PlaybackBar221$Binding;->thumbnail:Landroid/widget/ImageView;

    sget-object v3, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x40

    invoke-static {p1, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v5, 0x28

    invoke-static {p1, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Le/e/a/PlaybackBar221$Binding$1;

    invoke-direct {v3, p0}, Le/e/a/PlaybackBar221$Binding$1;-><init>(Le/e/a/PlaybackBar221$Binding;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le/e/a/PlaybackBar221$Binding;->title:Landroid/widget/TextView;

    invoke-static {p1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_91

    const v3, -0x111112

    goto :goto_94

    :cond_91
    const v3, -0xdfdedc

    :goto_94
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v0, 0x8

    invoke-static {p1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v2, v0, v1, v0, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    const-string v0, "Return to player"

    const-string v4, "\u8fd4\u56de\u64ad\u653e\u5668"

    const-string v5, "\u518d\u751f\u753b\u9762\u3078\u623b\u308b"

    invoke-static {p1, v5, v0, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/PlaybackBar221$Binding$2;

    invoke-direct {v0, p0}, Le/e/a/PlaybackBar221$Binding$2;-><init>(Le/e/a/PlaybackBar221$Binding;)V

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, -0x1

    invoke-direct {v0, v1, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    const-string p2, "Play or pause"

    const-string v0, "\u64ad\u653e\u6216\u66ab\u505c"

    const-string v2, "\u518d\u751f\u30fb\u4e00\u6642\u505c\u6b62"

    invoke-static {p1, v2, p2, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Le/e/a/PlaybackBar221$Binding$3;

    invoke-direct {v0, p0}, Le/e/a/PlaybackBar221$Binding$3;-><init>(Le/e/a/PlaybackBar221$Binding;)V

    const-string v2, "\u2161"

    invoke-static {p1, v2, p2, v0}, Le/e/a/PlaybackBar221;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PlaybackBar221$Binding;->play:Landroid/widget/Button;

    .line 52
    const-string v0, "Close playback"

    const-string v2, "\u7d50\u675f\u64ad\u653e"

    const-string v4, "\u518d\u751f\u3092\u7d42\u4e86"

    invoke-static {p1, v4, v0, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Le/e/a/PlaybackBar221$Binding$4;

    invoke-direct {v2, p0}, Le/e/a/PlaybackBar221$Binding$4;-><init>(Le/e/a/PlaybackBar221$Binding;)V

    const-string v4, "\u00d7"

    invoke-static {p1, v4, v0, v2}, Le/e/a/PlaybackBar221;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object v0

    .line 53
    new-array v2, v3, [Landroid/widget/Button;

    aput-object p2, v2, v1

    const/4 p2, 0x1

    aput-object v0, v2, p2

    :goto_104
    if-lt v1, v3, :cond_133

    .line 54
    iget-object p1, p0, Le/e/a/PlaybackBar221$Binding;->content:Landroid/widget/FrameLayout;

    iget-object p2, p0, Le/e/a/PlaybackBar221$Binding;->bar:Landroid/widget/LinearLayout;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    iget v1, p0, Le/e/a/PlaybackBar221$Binding;->height:I

    const/16 v2, 0x50

    invoke-direct {v0, v5, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p1, p2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Le/e/a/PlaybackBar221$Binding;->body:Landroid/view/View;

    if-eqz p1, :cond_132

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    iget-object v0, p0, Le/e/a/PlaybackBar221$Binding;->body:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    iget-object v1, p0, Le/e/a/PlaybackBar221$Binding;->body:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    iget v2, p0, Le/e/a/PlaybackBar221$Binding;->bodyPadding:I

    iget v3, p0, Le/e/a/PlaybackBar221$Binding;->height:I

    add-int/2addr v2, v3

    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    :cond_132
    return-void

    .line 53
    :cond_133
    aget-object p2, v2, v1

    iget-object v0, p0, Le/e/a/PlaybackBar221$Binding;->bar:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x30

    invoke-static {p1, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_104

    .line 47
    :cond_148
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "No content frame"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method dispose()V
    .registers 6

    .line 56
    iget-object v0, p0, Le/e/a/PlaybackBar221$Binding;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_17

    iget-object v0, p0, Le/e/a/PlaybackBar221$Binding;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Le/e/a/PlaybackBar221$Binding;->bar:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_17
    iget-object v0, p0, Le/e/a/PlaybackBar221$Binding;->body:Landroid/view/View;

    if-eqz v0, :cond_3d

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    iget v1, p0, Le/e/a/PlaybackBar221$Binding;->bodyPadding:I

    iget v2, p0, Le/e/a/PlaybackBar221$Binding;->height:I

    add-int/2addr v1, v2

    if-ne v0, v1, :cond_3d

    iget-object v0, p0, Le/e/a/PlaybackBar221$Binding;->body:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Le/e/a/PlaybackBar221$Binding;->body:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Le/e/a/PlaybackBar221$Binding;->body:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    iget v4, p0, Le/e/a/PlaybackBar221$Binding;->bodyPadding:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    :cond_3d
    return-void
.end method
