.class public final Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;
.super Landroid/preference/Preference;
.source "SubtitleStylePreview.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;
    }
.end annotation


# static fields
.field private static final views:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 16
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->views:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 17
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 19
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->init()V

    return-void
.end method

.method static frameWidth(FFF)F
    .registers 4

    const/high16 v0, 0x440c0000    # 560.0f

    mul-float/2addr p2, v0

    .line 37
    invoke-static {p0, p2}, Ljava/lang/Math;->min(FF)F

    move-result p0

    const/high16 p2, 0x3f400000    # 0.75f

    mul-float/2addr p1, p2

    const/high16 p2, 0x41100000    # 9.0f

    mul-float/2addr p1, p2

    const/high16 p2, 0x41800000    # 16.0f

    div-float/2addr p1, p2

    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p0

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method

.method private init()V
    .registers 2

    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->setPersistent(Z)V

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->setSelectable(Z)V

    return-void
.end method

.method static synthetic lambda$onCreateView$0(Landroid/widget/Button;Landroid/content/Context;Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;)V
    .registers 3

    .line 28
    iget-boolean p2, p2, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->portrait:Z

    if-eqz p2, :cond_7

    const-string p2, "\u5207\u6362\u4e3a\u6a2a\u5c4f"

    goto :goto_9

    :cond_7
    const-string p2, "\u5207\u6362\u4e3a\u7ad6\u5c4f"

    :goto_9
    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$onCreateView$1(Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;Landroid/view/View;)V
    .registers 2

    .line 28
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->performClick()Z

    return-void
.end method

.method static sampleLabel(Landroid/content/Context;Ljava/lang/String;IIFZ)Landroid/widget/TextView;
    .registers 14

    .line 44
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    .line 45
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    const/16 v3, 0x11

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 46
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setBreakStrategy(I)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setHyphenationFrequency(I)V

    const/high16 v4, 0x40c00000    # 6.0f

    .line 47
    iget v5, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v5, v4

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v4

    iget v5, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v6, 0x40800000    # 4.0f

    mul-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-virtual {v1, v4, v5, v4, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    if-eqz p5, :cond_46

    const p5, 0x3f47ae14    # 0.78f

    goto :goto_49

    :cond_46
    const p5, 0x3f6b851f    # 0.92f

    :goto_49
    mul-float/2addr p5, p4

    .line 48
    invoke-static {p5}, Ljava/lang/Math;->round(F)I

    move-result p5

    mul-int/2addr v4, v3

    sub-int/2addr p5, v4

    const/4 v5, 0x1

    invoke-static {v5, p5}, Ljava/lang/Math;->max(II)I

    move-result p5

    iget v5, v0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr p4, v5

    invoke-static {p2, p4}, Lapp/yydarlinker/deepseekcaptions/SubtitleStyleMetrics;->scaledSp(IF)F

    move-result p2

    .line 49
    invoke-virtual {v1, v3, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    iget p4, v0, Landroid/util/DisplayMetrics;->density:F

    iget v3, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v5, -0x30000000

    const/4 v7, 0x0

    invoke-virtual {v1, p4, v7, v3, v5}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 50
    new-instance p4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-static {p3}, Lapp/yydarlinker/deepseekcaptions/SubtitleStyleMetrics;->alpha(I)I

    move-result p3

    shl-int/lit8 p3, p3, 0x18

    invoke-virtual {p4, p3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    iget p3, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p3, v6

    invoke-virtual {p4, p3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v1, p4}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 51
    invoke-static {p0, p1, p2, p5}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->compactWidth(Landroid/content/Context;Ljava/lang/String;FI)I

    move-result p0

    add-int/2addr p0, v4

    const/high16 p1, 0x40000000    # 2.0f

    invoke-static {p0, p1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {v1, p1, p2}, Landroid/widget/TextView;->measure(II)V

    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result p1

    invoke-virtual {v1, v2, v2, p0, p1}, Landroid/widget/TextView;->layout(IIII)V

    return-object v1
.end method

.method static stageHeight(FFFZ)F
    .registers 6

    .line 40
    invoke-static {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->frameWidth(FFF)F

    move-result p0

    const/high16 v0, 0x41800000    # 16.0f

    const/high16 v1, 0x41100000    # 9.0f

    if-eqz p3, :cond_d

    mul-float/2addr p0, v0

    div-float/2addr p0, v1

    return p0

    :cond_d
    mul-float/2addr p0, v1

    div-float/2addr p0, v0

    const/high16 p3, 0x435c0000    # 220.0f

    mul-float/2addr p2, p3

    const p3, 0x3ef5c28f    # 0.48f

    mul-float/2addr p1, p3

    .line 41
    invoke-static {p2, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method

.method static update(Ljava/lang/String;I)V
    .registers 5

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->views:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;

    const-string v2, "deepseek_caption_text_size"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    iput p1, v1, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->size:I

    goto :goto_24

    :cond_22
    iput p1, v1, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->opacity:I

    :goto_24
    invoke-virtual {v1}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->invalidate()V

    goto :goto_b

    :cond_28
    return-void
.end method


# virtual methods
.method protected onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 8

    .line 22
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->row(Landroid/view/View;)V

    .line 23
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 24
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v2, "\u5b57\u5e55\u9884\u89c8"

    invoke-static {p0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->title(Landroid/widget/TextView;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v5, -0x2

    invoke-direct {v2, v4, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    new-instance v1, Landroid/widget/Button;

    const/4 v2, 0x0

    const v3, 0x101032b

    invoke-direct {v1, p0, v2, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->button(Landroid/widget/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 26
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;-><init>(Landroid/content/Context;)V

    const-string v2, "ai_style_preview_canvas"

    invoke-virtual {v0, v2}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->setTag(Ljava/lang/Object;)V

    sget-object v2, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->views:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 28
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1, p0, v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$$ExternalSyntheticLambda0;-><init>(Landroid/widget/Button;Landroid/content/Context;Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;)V

    iput-object v2, v0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;->onOrientationChanged:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$$ExternalSyntheticLambda1;-><init>(Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v1, "\u70b9\u6309\u753b\u9762\u5207\u6362\u65b9\u5411 \u00b7 \u5b57\u53f7\u4e0e\u80cc\u666f\u8bbe\u7f6e\u5b9e\u65f6\u9884\u89c8"

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->caption(Landroid/widget/TextView;)V

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-virtual {v0, v4, p0, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object p1
.end method
