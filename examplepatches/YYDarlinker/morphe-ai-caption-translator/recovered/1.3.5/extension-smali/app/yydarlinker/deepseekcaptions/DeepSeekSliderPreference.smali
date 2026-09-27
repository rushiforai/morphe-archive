.class public final Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;
.super Landroid/preference/Preference;
.source "DeepSeekSliderPreference.java"


# static fields
.field static final KEY_OPACITY:Ljava/lang/String; = "deepseek_caption_background_opacity"

.field static final KEY_TEXT_SIZE:Ljava/lang/String; = "deepseek_caption_text_size"


# direct methods
.method static bridge synthetic -$$Nest$mformat(Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;I)Ljava/lang/String;
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->format(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$msaveValue(Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;I)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->saveValue(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 20
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 21
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 25
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 30
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 40
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 41
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->initialize()V

    return-void
.end method

.method private currentValue()I
    .registers 3

    .line 144
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayStyle(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v0

    .line 145
    const-string v1, "deepseek_caption_text_size"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getKey()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_17

    .line 146
    iget p0, v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->captionTextSize:I

    return p0

    .line 147
    :cond_17
    iget p0, v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->backgroundOpacity:I

    return p0
.end method

.method private dp(I)I
    .registers 2

    int-to-float p1, p1

    .line 164
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private format(I)Ljava/lang/String;
    .registers 3

    .line 151
    const-string v0, "deepseek_caption_text_size"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getKey()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1e

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " sp"

    :goto_16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1e
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "%"

    goto :goto_16
.end method

.method private initialize()V
    .registers 2

    const/4 v0, 0x0

    .line 45
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->setPersistent(Z)V

    .line 46
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->setSelectable(Z)V

    return-void
.end method

.method private maximum()I
    .registers 2

    .line 140
    const-string v0, "deepseek_caption_text_size"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getKey()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_f

    const/16 p0, 0xf

    return p0

    :cond_f
    const/16 p0, 0x64

    return p0
.end method

.method private minimum()I
    .registers 2

    .line 136
    const-string v0, "deepseek_caption_text_size"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getKey()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_f

    const/16 p0, 0x8

    return p0

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method private saveValue(I)V
    .registers 4

    .line 155
    const-string v0, "deepseek_caption_text_size"

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 156
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->saveCaptionTextSize(Landroid/content/Context;I)V

    goto :goto_1b

    .line 158
    :cond_14
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->saveBackgroundOpacity(Landroid/content/Context;I)V

    .line 160
    :goto_1b
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->refreshStyle(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    .line 52
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_13

    if-eqz v0, :cond_13

    .line 53
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    goto :goto_14

    :cond_13
    const/4 p1, 0x0

    .line 56
    :goto_14
    invoke-super {p0, p1, p2}, Landroid/preference/Preference;->getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method protected onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 11

    .line 61
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 62
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 63
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/4 v1, 0x1

    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 65
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->row(Landroid/view/View;)V

    .line 67
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x0

    .line 68
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 69
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 75
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->title(Landroid/widget/TextView;)V

    .line 77
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v4, v7, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 78
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v7, v3, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 85
    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->caption(Landroid/widget/TextView;)V

    const/high16 v7, 0x41600000    # 14.0f

    .line 86
    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 87
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 88
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v4, v7, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/16 v1, 0xc

    .line 89
    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->dp(I)I

    move-result v1

    invoke-virtual {v4, v1, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 90
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    new-instance v1, Landroid/widget/SeekBar;

    invoke-direct {v1, p1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x30

    .line 96
    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->dp(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setMinimumHeight(I)V

    .line 97
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 98
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->minimum()I

    move-result v2

    .line 99
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->maximum()I

    move-result v3

    .line 100
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->currentValue()I

    move-result v7

    sub-int/2addr v3, v2

    .line 101
    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setMax(I)V

    sub-int v3, v7, v2

    .line 102
    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 103
    invoke-direct {p0, v7}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->format(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_ca

    .line 110
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-lez v7, :cond_ca

    .line 111
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 112
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    invoke-static {v7}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->caption(Landroid/widget/TextView;)V

    .line 114
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p1, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v7, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 120
    :cond_ca
    new-instance p1, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;

    invoke-direct {p1, p0, v4, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;Landroid/widget/TextView;I)V

    invoke-virtual {v1, p1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-object v0
.end method
