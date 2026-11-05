.class public final Le/e/a/MiniChrome236;
.super Ljava/lang/Object;
.source "MiniChrome236.java"


# instance fields
.field final heading:Landroid/widget/TextView;

.field loaded:Ljava/lang/String;

.field final play:Landroid/widget/Button;

.field final row:Landroid/widget/LinearLayout;

.field final subtitle:Landroid/widget/TextView;

.field final thumbnail:Landroid/widget/ImageView;

.field final words:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/view/View$OnTouchListener;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V
    .registers 16

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const-string v0, ""

    iput-object v0, p0, Le/e/a/MiniChrome236;->loaded:Ljava/lang/String;

    .line 7
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v0, p0, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    const/16 v3, 0x8

    invoke-static {p1, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v4, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 8
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le/e/a/MiniChrome236;->thumbnail:Landroid/widget/ImageView;

    iget-object v0, p0, Le/e/a/MiniChrome236;->thumbnail:Landroid/widget/ImageView;

    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    if-eqz p4, :cond_3b

    iget-object v0, p0, Le/e/a/MiniChrome236;->thumbnail:Landroid/widget/ImageView;

    invoke-virtual {v0, p4}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_3b
    iget-object p4, p0, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/MiniChrome236;->thumbnail:Landroid/widget/ImageView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x50

    invoke-static {p1, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/16 v6, 0x2e

    invoke-static {p1, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p4, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 9
    new-instance p4, Landroid/widget/LinearLayout;

    invoke-direct {p4, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p4, p0, Le/e/a/MiniChrome236;->words:Landroid/widget/LinearLayout;

    iget-object p4, p0, Le/e/a/MiniChrome236;->words:Landroid/widget/LinearLayout;

    const/4 v0, 0x1

    invoke-virtual {p4, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object p4, p0, Le/e/a/MiniChrome236;->words:Landroid/widget/LinearLayout;

    invoke-virtual {p4, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object p4, p0, Le/e/a/MiniChrome236;->words:Landroid/widget/LinearLayout;

    invoke-static {p1, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x4

    invoke-static {p1, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {p4, v2, v1, v4, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 10
    new-instance p4, Landroid/widget/TextView;

    invoke-direct {p4, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p4, p0, Le/e/a/MiniChrome236;->heading:Landroid/widget/TextView;

    iget-object p4, p0, Le/e/a/MiniChrome236;->heading:Landroid/widget/TextView;

    const v2, -0x111112

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p4, p0, Le/e/a/MiniChrome236;->heading:Landroid/widget/TextView;

    const/high16 v2, 0x41500000    # 13.0f

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object p4, p0, Le/e/a/MiniChrome236;->heading:Landroid/widget/TextView;

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object p4, p0, Le/e/a/MiniChrome236;->heading:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object p4, p0, Le/e/a/MiniChrome236;->words:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/MiniChrome236;->heading:Landroid/widget/TextView;

    invoke-virtual {p4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 11
    new-instance p4, Landroid/widget/TextView;

    invoke-direct {p4, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p4, p0, Le/e/a/MiniChrome236;->subtitle:Landroid/widget/TextView;

    iget-object p4, p0, Le/e/a/MiniChrome236;->subtitle:Landroid/widget/TextView;

    const v2, -0x333334

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p4, p0, Le/e/a/MiniChrome236;->subtitle:Landroid/widget/TextView;

    const/high16 v2, 0x41300000    # 11.0f

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object p4, p0, Le/e/a/MiniChrome236;->subtitle:Landroid/widget/TextView;

    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object p4, p0, Le/e/a/MiniChrome236;->subtitle:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object p4, p0, Le/e/a/MiniChrome236;->words:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/MiniChrome236;->subtitle:Landroid/widget/TextView;

    invoke-virtual {p4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p4, p0, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/MiniChrome236;->words:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, -0x1

    invoke-direct {v4, v1, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p4, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, p2, p3}, Le/e/a/MiniChrome236;->text(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    const-string p2, "Play or pause"

    const-string p3, "\u64ad\u653e\u6216\u66ab\u505c"

    const-string p4, "\u518d\u751f\u30fb\u4e00\u6642\u505c\u6b62"

    invoke-static {p1, p4, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string p3, "\u2161"

    invoke-static {p1, p3, p2, p6}, Le/e/a/PlaybackBar221;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object p2

    iput-object p2, p0, Le/e/a/MiniChrome236;->play:Landroid/widget/Button;

    const-string p2, "Close playback"

    const-string p3, "\u7d50\u675f\u64ad\u653e"

    const-string p4, "\u518d\u751f\u3092\u7d42\u4e86"

    invoke-static {p1, p4, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string p3, "\u00d7"

    invoke-static {p1, p3, p2, p7}, Le/e/a/PlaybackBar221;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object p2

    iget-object p3, p0, Le/e/a/MiniChrome236;->play:Landroid/widget/Button;

    filled-new-array {p3, p2}, [Landroid/widget/Button;

    move-result-object p2

    move p3, v1

    :goto_100
    const/4 p4, 0x2

    if-lt p3, p4, :cond_133

    .line 13
    new-array p6, v3, [Landroid/view/View;

    iget-object p2, p0, Le/e/a/MiniChrome236;->thumbnail:Landroid/widget/ImageView;

    aput-object p2, p6, v1

    iget-object p2, p0, Le/e/a/MiniChrome236;->words:Landroid/widget/LinearLayout;

    aput-object p2, p6, v0

    iget-object p2, p0, Le/e/a/MiniChrome236;->heading:Landroid/widget/TextView;

    aput-object p2, p6, p4

    const/4 p2, 0x3

    iget-object p3, p0, Le/e/a/MiniChrome236;->subtitle:Landroid/widget/TextView;

    aput-object p3, p6, p2

    :goto_116
    if-lt v1, v3, :cond_128

    iget-object p2, p0, Le/e/a/MiniChrome236;->thumbnail:Landroid/widget/ImageView;

    const-string p3, "Return to player"

    const-string p4, "\u8fd4\u56de\u64ad\u653e\u5668"

    const-string p5, "\u518d\u751f\u753b\u9762\u3078\u623b\u308b"

    invoke-static {p1, p5, p3, p4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 14
    return-void

    .line 13
    :cond_128
    aget-object p2, p6, v1

    invoke-virtual {p2, p5}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {p2, p8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_116

    .line 12
    :cond_133
    aget-object p4, p2, p3

    iget-object p6, p0, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    new-instance p7, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x30

    invoke-static {p1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-direct {p7, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p6, p4, p7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_100
.end method


# virtual methods
.method metadata(Landroid/os/Bundle;)V
    .registers 6

    .line 16
    if-nez p1, :cond_3

    return-void

    :cond_3
    invoke-static {p1}, Le/e/a/FeedbackFixes;->bundleTitle(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "uploaderName"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "author"

    invoke-virtual {p1, v3, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_1d

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_27

    :cond_1d
    iget-object v0, p0, Le/e/a/MiniChrome236;->heading:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_27
    invoke-virtual {p0, v0, v1}, Le/e/a/MiniChrome236;->text(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "thumbnailUrl"

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "thumbImage"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4c

    iget-object v0, p0, Le/e/a/MiniChrome236;->loaded:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4c

    iput-object p1, p0, Le/e/a/MiniChrome236;->loaded:Ljava/lang/String;

    iget-object v0, p0, Le/e/a/MiniChrome236;->thumbnail:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    :cond_4c
    return-void
.end method

.method text(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 15
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_18

    :cond_8
    iget-object p1, p0, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "Loading\u2026"

    const-string v1, "\u8f09\u5165\u4e2d\u2026"

    const-string v2, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {p1, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_18
    iget-object v0, p0, Le/e/a/MiniChrome236;->heading:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_29

    iget-object v0, p0, Le/e/a/MiniChrome236;->heading:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_29
    if-nez p2, :cond_2d

    const-string p2, ""

    :cond_2d
    iget-object p1, p0, Le/e/a/MiniChrome236;->subtitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3e

    iget-object p1, p0, Le/e/a/MiniChrome236;->subtitle:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3e
    iget-object p1, p0, Le/e/a/MiniChrome236;->subtitle:Landroid/widget/TextView;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_49

    const/16 p2, 0x8

    goto :goto_4a

    :cond_49
    const/4 p2, 0x0

    :goto_4a
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method
