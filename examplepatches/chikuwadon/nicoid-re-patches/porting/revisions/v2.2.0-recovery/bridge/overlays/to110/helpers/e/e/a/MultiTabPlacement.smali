.class final Le/e/a/MultiTabPlacement;
.super Ljava/lang/Object;
.source "MultiTabPlacement.java"


# static fields
.field static final DEFAULT_HEIGHT:I = 0x20

.field private static final ENABLE:Ljava/lang/String; = "multiple_video_tabs"

.field private static final HEIGHT:Ljava/lang/String; = "multiple_video_tabs_height_dp"

.field static final LABELS:[Ljava/lang/String;

.field private static final LAYOUT:Ljava/lang/String; = "nicoid_app_tab_layout"

.field static final MAX_HEIGHT:I = 0x40

.field static final MIN_HEIGHT:I = 0x1c

.field private static final POSITION:Ljava/lang/String; = "multiple_video_tabs_at_bottom"


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .line 38
    const-string v4, "\u4e0b\u90e8\uff1a\u30a2\u30d7\u30ea\u30d0\u30fc \u2192 \u30bf\u30d6\u30d0\u30fc"

    .line 39
    const-string v5, "\u4e0b\u90e8\uff1a\u30bf\u30d6\u30d0\u30fc \u2192 \u30a2\u30d7\u30ea\u30d0\u30fc"

    const-string v0, "\u4e0a\u90e8\uff1a\u30a2\u30d7\u30ea\u30d0\u30fc \u2192 \u30bf\u30d6\u30d0\u30fc"

    const-string v1, "\u4e0a\u90e8\uff1a\u30bf\u30d6\u30d0\u30fc \u2192 \u30a2\u30d7\u30ea\u30d0\u30fc"

    const-string v2, "\u4e0a\u90e8\uff1a\u30a2\u30d7\u30ea\u30d0\u30fc\u30fb\u4e0b\u90e8\uff1a\u30bf\u30d6\u30d0\u30fc"

    const-string v3, "\u4e0a\u90e8\uff1a\u30bf\u30d6\u30d0\u30fc\u30fb\u4e0b\u90e8\uff1a\u30a2\u30d7\u30ea\u30d0\u30fc"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    .line 33
    sput-object v0, Le/e/a/MultiTabPlacement;->LABELS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addConfiguration(Landroid/preference/PreferenceGroup;)V
    .registers 7

    .line 75
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 76
    invoke-static {v0}, Le/e/a/MultiTabPlacement;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 77
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, v0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 78
    const-string v3, "nicoid_app_tab_layout"

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const/4 v3, 0x0

    .line 79
    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setPersistent(Z)V

    .line 81
    const-string v3, "App bar and tab bar layout"

    const-string v4, "\u61c9\u7528\u7a0b\u5f0f\u5217\u8207\u5206\u9801\u5217\u6392\u5217"

    .line 80
    const-string v5, "\u30a2\u30d7\u30ea\u30d0\u30fc\u3068\u30bf\u30d6\u30d0\u30fc\u306e\u914d\u7f6e"

    invoke-static {v0, v5, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 82
    invoke-static {v2, v1}, Le/e/a/MultiTabPlacement;->updateSummary(Landroid/preference/Preference;Landroid/content/SharedPreferences;)V

    .line 83
    new-instance v0, Le/e/a/MultiTabPlacement$0;

    invoke-direct {v0, v2, v1}, Le/e/a/MultiTabPlacement$0;-><init>(Landroid/preference/Preference;Landroid/content/SharedPreferences;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 90
    invoke-virtual {p0, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 91
    const-string p0, "multiple_video_tabs"

    invoke-virtual {v2, p0}, Landroid/preference/Preference;->setDependency(Ljava/lang/String;)V

    return-void
.end method

.method private static button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 5

    .line 254
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 255
    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v1, 0x11

    .line 256
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 257
    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41c00000    # 24.0f

    .line 258
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v1, 0x2c

    .line 259
    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 260
    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 261
    const-string/jumbo p0, "\uff0b"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string/jumbo p0, "\u9ad8\u3055\u30921dp\u5897\u3084\u3059"

    goto :goto_0

    :cond_0
    const-string/jumbo p0, "\u9ad8\u3055\u30921dp\u6e1b\u3089\u3059"

    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method private static drawPreview(Landroid/content/Context;Landroid/widget/LinearLayout;II)V
    .registers 15

    .line 266
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v0, 0x2

    const/4 v1, 0x3

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez p2, :cond_0

    .line 267
    invoke-static {p0, p1, v3, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    invoke-static {p0, p1, v2, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    goto :goto_0

    :cond_0
    if-ne p2, v2, :cond_1

    .line 268
    invoke-static {p0, p1, v2, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    invoke-static {p0, p1, v3, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    goto :goto_0

    :cond_1
    if-ne p2, v0, :cond_2

    .line 269
    invoke-static {p0, p1, v3, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    goto :goto_0

    :cond_2
    if-ne p2, v1, :cond_3

    .line 270
    invoke-static {p0, p1, v2, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    .line 272
    :cond_3
    :goto_0
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 273
    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v5, 0x10

    .line 274
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v6, 0xc

    .line 275
    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v4, v6, v3, v3, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    move v6, v3

    :goto_1
    const/4 v7, -0x1

    if-lt v6, v1, :cond_8

    .line 283
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x68

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    if-ne p2, v0, :cond_4

    .line 285
    invoke-static {p0, p1, v2, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    return-void

    :cond_4
    if-ne p2, v1, :cond_5

    .line 286
    invoke-static {p0, p1, v3, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    return-void

    :cond_5
    const/4 v0, 0x4

    if-ne p2, v0, :cond_6

    .line 287
    invoke-static {p0, p1, v3, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    invoke-static {p0, p1, v2, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    return-void

    :cond_6
    const/4 v0, 0x5

    if-ne p2, v0, :cond_7

    .line 288
    invoke-static {p0, p1, v2, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    invoke-static {p0, p1, v3, p3}, Le/e/a/MultiTabPlacement;->previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V

    :cond_7
    return-void

    .line 277
    :cond_8
    const-string v8, "\u25a3\u3000\u52d5\u753b\u60c5\u5831"

    invoke-static {p0, v8}, Le/e/a/MultiTabPlacement;->label(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v8

    .line 278
    invoke-static {v8}, Le/e/a/DynamicTheme;->secondaryTextColor(Landroid/view/View;)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 279
    invoke-virtual {v8, v3, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 280
    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 281
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v10, 0x1f

    invoke-static {p0, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v9, v7, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_1
.end method

.method static heightDp(Landroid/content/SharedPreferences;)I
    .registers 3

    .line 67
    const-string v0, "multiple_video_tabs_height_dp"

    const/16 v1, 0x20

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/16 v0, 0x40

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/16 v0, 0x1c

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method static insert(Landroid/widget/LinearLayout;Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 7

    .line 345
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/MultiTabPlacement;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 346
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0}, Le/e/a/MultiTabPlacement;->heightDp(Landroid/content/SharedPreferences;)I

    move-result v2

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    iput v1, p3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 347
    invoke-static {v0}, Le/e/a/MultiTabPlacement;->layout(Landroid/content/SharedPreferences;)I

    move-result v0

    invoke-static {v0}, Le/e/a/MultiTabPlacement;->tabAtBottom(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p2

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 348
    invoke-static {p0, p1}, Le/e/a/AppBarPlacement202;->attach(Landroid/widget/LinearLayout;Landroid/view/View;)V

    return-void
.end method

.method private static label(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 4

    .line 245
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 246
    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    invoke-static {v0}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 p1, 0x41600000    # 14.0f

    .line 248
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 p1, 0x7

    .line 249
    invoke-static {p0, p1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    const/4 v1, 0x5

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1, v1, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method static synthetic lambda$0(Landroid/preference/Preference;Landroid/content/SharedPreferences;Landroid/preference/Preference;)Z
    .registers 3

    .line 84
    invoke-static {p0, p1}, Le/e/a/MultiTabPlacement;->showConfiguration(Landroid/preference/Preference;Landroid/content/SharedPreferences;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/widget/SeekBar;Landroid/view/View;Landroid/content/Context;)V
    .registers 6

    .line 159
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/SeekBar;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    .line 160
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    .line 159
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 161
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getLeft()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/SeekBar;->getPaddingLeft()I

    move-result p0

    add-int/2addr v2, p0

    shl-int/lit8 v0, v0, 0x2

    int-to-float p0, v0

    const/high16 v0, 0x42100000    # 36.0f

    div-float/2addr p0, v0

    .line 162
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    add-int/2addr v2, p0

    .line 165
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, 0x1

    .line 166
    invoke-static {p2, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p2

    sub-int/2addr v2, p2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 167
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/Runnable;Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 170
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$3(Landroid/widget/TextView;[ILandroid/content/Context;Landroid/widget/LinearLayout;[ILandroid/widget/TextView;Landroid/widget/TextView;)V
    .registers 10

    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u521d\u671f\u5024"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " 32 dp  \u2502  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    aget v2, p1, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " dp"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    aget p0, p4, v1

    aget p4, p1, v1

    invoke-static {p2, p3, p0, p4}, Le/e/a/MultiTabPlacement;->drawPreview(Landroid/content/Context;Landroid/widget/LinearLayout;II)V

    .line 190
    aget p0, p1, v1

    const/16 p2, 0x1c

    const/4 p3, 0x1

    if-le p0, p2, :cond_0

    move p0, p3

    goto :goto_0

    :cond_0
    move p0, v1

    :goto_0
    invoke-virtual {p5, p0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 191
    aget p0, p1, v1

    const/16 p1, 0x40

    if-ge p0, p1, :cond_1

    move v1, p3

    :cond_1
    invoke-virtual {p6, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 192
    invoke-virtual {p5}, Landroid/widget/TextView;->isEnabled()Z

    move-result p0

    const/high16 p1, 0x3f800000    # 1.0f

    const p2, 0x3eb33333    # 0.35f

    if-eqz p0, :cond_2

    move p0, p1

    goto :goto_1

    :cond_2
    move p0, p2

    :goto_1
    invoke-virtual {p5, p0}, Landroid/widget/TextView;->setAlpha(F)V

    .line 193
    invoke-virtual {p6}, Landroid/widget/TextView;->isEnabled()Z

    move-result p0

    if-nez p0, :cond_3

    move p1, p2

    :cond_3
    invoke-virtual {p6, p1}, Landroid/widget/TextView;->setAlpha(F)V

    return-void
.end method

.method static synthetic lambda$4([ILjava/lang/Runnable;Landroid/view/View;)V
    .registers 4

    .line 197
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const/4 v0, 0x0

    aput p2, p0, v0

    .line 198
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$5(Landroid/widget/SeekBar;Landroid/view/View;)V
    .registers 3

    .line 201
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    return-void
.end method

.method static synthetic lambda$6(Landroid/widget/SeekBar;Landroid/view/View;)V
    .registers 3

    .line 202
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getMax()I

    move-result p1

    .line 203
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 202
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    return-void
.end method

.method static synthetic lambda$7(Landroid/content/SharedPreferences;[I[ILandroid/preference/Preference;Landroid/content/DialogInterface;I)V
    .registers 8

    .line 221
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p4

    const/4 p5, 0x0

    aget v0, p1, p5

    const-string v1, "nicoid_app_tab_layout"

    invoke-interface {p4, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p4

    .line 222
    aget p1, p1, p5

    invoke-static {p1}, Le/e/a/MultiTabPlacement;->tabAtBottom(I)Z

    move-result p1

    const-string v0, "multiple_video_tabs_at_bottom"

    invoke-interface {p4, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 223
    const-string p4, "multiple_video_tabs_height_dp"

    aget p2, p2, p5

    invoke-interface {p1, p4, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 224
    invoke-static {p3, p0}, Le/e/a/MultiTabPlacement;->updateSummary(Landroid/preference/Preference;Landroid/content/SharedPreferences;)V

    .line 225
    invoke-static {}, Le/e/a/AppBarPlacement202;->refreshCurrent()V

    return-void
.end method

.method static synthetic lambda$8(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .registers 3

    .line 231
    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p0

    .line 232
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 233
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method static synthetic lambda$9([I[ILandroid/widget/SeekBar;Landroid/widget/RadioGroup;Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 6

    const/4 p5, 0x0

    .line 236
    aput p5, p0, p5

    const/16 p0, 0x20

    .line 237
    aput p0, p1, p5

    const/4 p0, 0x4

    .line 238
    invoke-virtual {p2, p0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 239
    invoke-virtual {p3, p5}, Landroid/widget/RadioGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/RadioButton;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 240
    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static layout(Landroid/content/SharedPreferences;)I
    .registers 3

    .line 61
    const-string v0, "multiple_video_tabs_at_bottom"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    .line 62
    :cond_0
    const-string v0, "nicoid_app_tab_layout"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    if-ltz p0, :cond_1

    .line 63
    sget-object v0, Le/e/a/MultiTabPlacement;->LABELS:[Ljava/lang/String;

    array-length v0, v0

    if-ge p0, v0, :cond_1

    return p0

    :cond_1
    return v1
.end method

.method private static part(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;
    .registers 5

    .line 292
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 293
    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p0, p2

    .line 294
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 295
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 p0, 0x10

    .line 296
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setGravity(I)V

    const/4 p0, 0x1

    .line 297
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setSingleLine(Z)V

    return-object v0
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 57
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static previewBar(Landroid/content/Context;Landroid/widget/LinearLayout;ZI)V
    .registers 13

    if-nez p2, :cond_0

    const/16 p3, 0x38

    .line 302
    :cond_0
    invoke-static {p0, p3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p3

    .line 303
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x10

    .line 304
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v2, 0x9

    .line 305
    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, -0x1

    if-eqz p2, :cond_1

    .line 307
    invoke-static {p0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result p2

    invoke-static {v0}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v5

    .line 310
    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    move-result v6

    mul-int/lit8 v6, v6, 0x56

    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    move-result v7

    mul-int/lit8 v7, v7, 0xe

    add-int/2addr v6, v7

    div-int/lit8 v6, v6, 0x64

    .line 311
    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    move-result v7

    mul-int/lit8 v7, v7, 0x56

    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    move-result v8

    mul-int/lit8 v8, v8, 0xe

    add-int/2addr v7, v8

    div-int/lit8 v7, v7, 0x64

    .line 312
    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    move-result p2

    mul-int/lit8 p2, p2, 0x56

    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0xe

    add-int/2addr p2, v5

    div-int/lit8 p2, p2, 0x64

    .line 309
    invoke-static {v6, v7, p2}, Landroid/graphics/Color;->rgb(III)I

    move-result p2

    .line 313
    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 314
    const-string p2, "\u2315 \u691c\u7d22"

    invoke-static {v0}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v5

    const/16 v6, 0xc

    invoke-static {p0, p2, v6, v5}, Le/e/a/MultiTabPlacement;->part(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    .line 315
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v4, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 314
    invoke-virtual {v0, p2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 316
    const-string p2, "\u5c65\u6b74"

    invoke-static {v0}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v5

    invoke-static {p0, p2, v6, v5}, Le/e/a/MultiTabPlacement;->part(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    .line 317
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v4, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 316
    invoke-virtual {v0, p2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 318
    const-string p2, "\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-static {v0}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v5

    invoke-static {p0, p2, v6, v5}, Le/e/a/MultiTabPlacement;->part(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    .line 319
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v4, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 318
    invoke-virtual {v0, p2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 320
    const-string/jumbo p2, "\uff0b"

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-static {p0, p2, v1, v2}, Le/e/a/MultiTabPlacement;->part(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p0

    .line 321
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p2, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 320
    invoke-virtual {v0, p0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0

    :cond_1
    const p2, -0xdfcbac

    .line 323
    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 324
    const-string p2, "\u2630"

    const/16 v5, 0x13

    invoke-static {p0, p2, v5, v3}, Le/e/a/MultiTabPlacement;->part(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    .line 325
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x1c

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v5, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 326
    new-instance p2, Landroid/widget/LinearLayout;

    invoke-direct {p2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x1

    .line 327
    invoke-virtual {p2, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 328
    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 329
    const-string v1, "\u30b5\u30f3\u30d7\u30eb"

    const/16 v5, 0xd

    invoke-static {p0, v1, v5, v3}, Le/e/a/MultiTabPlacement;->part(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/16 v1, 0xa

    const v5, -0x423829

    .line 330
    const-string v6, "\u30bf\u30b0\u691c\u7d22 \u30b3\u30e1\u30f3\u30c8\u304c\u65b0\u3057\u3044\u9806"

    invoke-static {p0, v6, v1, v5}, Le/e/a/MultiTabPlacement;->part(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 331
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v4, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/4 v2, 0x7

    .line 332
    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 333
    invoke-virtual {v0, p2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 334
    const-string p2, "\u2315"

    const/16 v1, 0x14

    invoke-static {p0, p2, v1, v3}, Le/e/a/MultiTabPlacement;->part(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    const/16 v1, 0x11

    .line 335
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 336
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x1b

    invoke-static {p0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p2, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 337
    const-string p2, "\u22ee"

    const/16 v2, 0x16

    invoke-static {p0, p2, v2, v3}, Le/e/a/MultiTabPlacement;->part(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    .line 338
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 339
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x17

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-direct {v1, p0, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 341
    :goto_0
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static settingsOrder(Landroid/preference/PreferenceGroup;[Ljava/lang/String;)[Ljava/lang/String;
    .registers 6

    .line 45
    const-string v0, "multiple_video_tabs"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 46
    const-string v1, "nicoid_app_tab_layout"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-nez v2, :cond_0

    invoke-static {p0}, Le/e/a/MultiTabPlacement;->addConfiguration(Landroid/preference/PreferenceGroup;)V

    .line 47
    :cond_0
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p0

    add-int/lit8 v0, p0, 0x1

    const/4 v2, 0x1

    if-ge v0, v2, :cond_2

    :cond_1
    return-object p1

    .line 49
    :cond_2
    array-length v3, p1

    add-int/2addr v3, v2

    new-array v2, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    .line 50
    invoke-static {p1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    aput-object v1, v2, v0

    add-int/lit8 p0, p0, 0x2

    .line 52
    array-length v1, p1

    sub-int/2addr v1, v0

    invoke-static {p1, v0, v2, p0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method

.method static showConfiguration(Landroid/preference/Preference;Landroid/content/SharedPreferences;)V
    .registers 19

    .line 100
    invoke-virtual/range {p0 .. p0}, Landroid/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v4

    .line 101
    invoke-static/range {p1 .. p1}, Le/e/a/MultiTabPlacement;->layout(Landroid/content/SharedPreferences;)I

    move-result v0

    filled-new-array {v0}, [I

    move-result-object v6

    invoke-static/range {p1 .. p1}, Le/e/a/MultiTabPlacement;->heightDp(Landroid/content/SharedPreferences;)I

    move-result v0

    filled-new-array {v0}, [I

    move-result-object v3

    .line 102
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x10

    .line 103
    invoke-static {v4, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/16 v5, 0x8

    .line 105
    invoke-static {v4, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/16 v7, 0xc

    invoke-static {v4, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v0, v2, v5, v2, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/4 v2, 0x1

    .line 106
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 108
    new-instance v9, Landroid/widget/RadioGroup;

    invoke-direct {v9, v4}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    .line 109
    invoke-virtual {v9, v2}, Landroid/widget/RadioGroup;->setOrientation(I)V

    const/4 v10, 0x0

    move v5, v10

    .line 110
    :goto_0
    sget-object v7, Le/e/a/MultiTabPlacement;->LABELS:[Ljava/lang/String;

    array-length v8, v7

    if-lt v5, v8, :cond_1

    .line 120
    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 125
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 126
    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 127
    const-string v7, "\u30bf\u30d6\u30d0\u30fc\u306e\u9ad8\u3055"

    invoke-static {v4, v7}, Le/e/a/MultiTabPlacement;->label(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v7

    .line 128
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v8, v10, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    const-string v7, ""

    invoke-static {v4, v7}, Le/e/a/MultiTabPlacement;->label(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v7

    const/high16 v8, 0x41400000    # 12.0f

    .line 130
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextSize(F)V

    const v8, 0x800015

    .line 131
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setGravity(I)V

    .line 132
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 133
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 135
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 136
    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 137
    const-string v1, "\u2212"

    invoke-static {v4, v1}, Le/e/a/MultiTabPlacement;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    const-string/jumbo v8, "\uff0b"

    invoke-static {v4, v8}, Le/e/a/MultiTabPlacement;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v8

    .line 138
    new-instance v14, Landroid/widget/SeekBar;

    invoke-direct {v14, v4}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 139
    const-string v15, "nicoid-managed-input"

    invoke-virtual {v14, v15}, Landroid/widget/SeekBar;->setTag(Ljava/lang/Object;)V

    .line 140
    invoke-static {v4}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v15

    invoke-static {v15}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v15

    .line 141
    invoke-virtual {v14, v15}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 142
    invoke-virtual {v14, v15}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    const/16 v15, 0x24

    .line 143
    invoke-virtual {v14, v15}, Landroid/widget/SeekBar;->setMax(I)V

    .line 144
    aget v15, v3, v10

    add-int/lit8 v15, v15, -0x1c

    invoke-virtual {v14, v15}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 145
    new-instance v15, Landroid/widget/FrameLayout;

    invoke-direct {v15, v4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 146
    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v2, 0x30

    invoke-static {v4, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    const/4 v2, -0x1

    invoke-direct {v12, v2, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v15, v14, v12}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 148
    new-instance v11, Landroid/view/View;

    invoke-direct {v11, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 151
    invoke-virtual {v11, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 152
    invoke-virtual {v11, v13}, Landroid/view/View;->setAlpha(F)V

    .line 153
    invoke-virtual {v11, v10}, Landroid/view/View;->setClickable(Z)V

    .line 154
    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, 0x2

    .line 155
    invoke-static {v4, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/16 v10, 0x26

    invoke-static {v4, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    const v13, 0x800033

    .line 154
    invoke-direct {v12, v2, v10, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/4 v2, 0x5

    .line 156
    invoke-static {v4, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    iput v2, v12, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 157
    invoke-virtual {v15, v11, v12}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    new-instance v2, Le/e/a/MultiTabPlacement$2;

    invoke-direct {v2, v14, v11, v4}, Le/e/a/MultiTabPlacement$2;-><init>(Landroid/widget/SeekBar;Landroid/view/View;Landroid/content/Context;)V

    .line 169
    new-instance v10, Le/e/a/MultiTabPlacement$3;

    invoke-direct {v10, v2}, Le/e/a/MultiTabPlacement$3;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v14, v10}, Landroid/widget/SeekBar;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 171
    invoke-virtual {v14, v2}, Landroid/widget/SeekBar;->post(Ljava/lang/Runnable;)Z

    .line 172
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v10, 0x2c

    .line 173
    invoke-static {v4, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    const/16 v12, 0x30

    invoke-static {v4, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-direct {v2, v11, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 172
    invoke-virtual {v5, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 174
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 175
    invoke-static {v4, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    const/4 v12, 0x0

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v2, v12, v11, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 174
    invoke-virtual {v5, v15, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 177
    invoke-static {v4, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    const/16 v12, 0x30

    invoke-static {v4, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v2, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 176
    invoke-virtual {v5, v8, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 178
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 180
    const-string/jumbo v2, "\u914d\u7f6e\u30d7\u30ec\u30d3\u30e5\u30fc"

    invoke-static {v4, v2}, Le/e/a/MultiTabPlacement;->label(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    .line 181
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 182
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    .line 183
    invoke-virtual {v5, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 184
    invoke-static {v4}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v5, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 185
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x1

    const/4 v11, -0x2

    invoke-direct {v2, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 187
    new-instance v10, Le/e/a/MultiTabPlacement$4;

    move-object v2, v7

    move-object v7, v1

    move-object v1, v10

    invoke-direct/range {v1 .. v8}, Le/e/a/MultiTabPlacement$4;-><init>(Landroid/widget/TextView;[ILandroid/content/Context;Landroid/widget/LinearLayout;[ILandroid/widget/TextView;Landroid/widget/TextView;)V

    move-object v2, v7

    const/4 v12, 0x0

    .line 195
    :goto_1
    invoke-virtual {v9}, Landroid/widget/RadioGroup;->getChildCount()I

    move-result v5

    if-lt v12, v5, :cond_0

    .line 201
    new-instance v5, Le/e/a/MultiTabPlacement$6;

    invoke-direct {v5, v14}, Le/e/a/MultiTabPlacement$6;-><init>(Landroid/widget/SeekBar;)V

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v2 .. v2}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 202
    new-instance v5, Le/e/a/MultiTabPlacement$7;

    invoke-direct {v5, v14}, Le/e/a/MultiTabPlacement$7;-><init>(Landroid/widget/SeekBar;)V

    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v8 .. v8}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 204
    new-instance v5, Le/e/a/MultiTabPlacement$1;

    invoke-direct {v5, v3, v1}, Le/e/a/MultiTabPlacement$1;-><init>([ILjava/lang/Runnable;)V

    invoke-virtual {v14, v5}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 212
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 214
    new-instance v5, Landroid/widget/ScrollView;

    invoke-direct {v5, v4}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v12, 0x0

    .line 215
    invoke-virtual {v5, v12}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 216
    invoke-virtual {v5, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 217
    invoke-static {v4}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual/range {p0 .. p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 218
    const-string v5, "\u521d\u671f\u5024\u306b\u623b\u3059"

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v7}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v5, 0x1040000

    .line 219
    invoke-virtual {v0, v5, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 220
    new-instance v5, Le/e/a/MultiTabPlacement$8;

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    invoke-direct {v5, v11, v6, v3, v10}, Le/e/a/MultiTabPlacement$8;-><init>(Landroid/content/SharedPreferences;[I[ILandroid/preference/Preference;)V

    const-string/jumbo v7, "\u9069\u7528"

    invoke-virtual {v0, v7, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 226
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 227
    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    .line 230
    new-instance v5, Le/e/a/MultiTabPlacement$9;

    invoke-direct {v5, v4, v2, v8}, Le/e/a/MultiTabPlacement$9;-><init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;)V

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    const/4 v2, -0x3

    .line 235
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v5, Le/e/a/MultiTabPlacement$10;

    move-object v10, v1

    move-object v7, v3

    move-object v8, v14

    invoke-direct/range {v5 .. v10}, Le/e/a/MultiTabPlacement$10;-><init>([I[ILandroid/widget/SeekBar;Landroid/widget/RadioGroup;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    return-void

    :cond_0
    move-object v13, v14

    move-object v14, v1

    .line 196
    invoke-virtual {v9, v12}, Landroid/widget/RadioGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    new-instance v5, Le/e/a/MultiTabPlacement$5;

    invoke-direct {v5, v6, v14}, Le/e/a/MultiTabPlacement$5;-><init>([ILjava/lang/Runnable;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v1 .. v1}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    add-int/lit8 v12, v12, 0x1

    move-object v1, v14

    move-object v14, v13

    goto/16 :goto_1

    .line 111
    :cond_1
    new-instance v2, Landroid/widget/RadioButton;

    invoke-direct {v2, v4}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    .line 112
    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v8

    invoke-virtual {v2, v8}, Landroid/widget/RadioButton;->setId(I)V

    .line 113
    aget-object v7, v7, v5

    invoke-static {v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x41500000    # 13.0f

    .line 114
    invoke-virtual {v2, v7}, Landroid/widget/RadioButton;->setTextSize(F)V

    .line 115
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/RadioButton;->setTag(Ljava/lang/Object;)V

    const/16 v7, 0x26

    .line 116
    invoke-static {v4, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v2, v7}, Landroid/widget/RadioButton;->setMinHeight(I)V

    .line 117
    invoke-virtual {v9, v2}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    const/16 v16, 0x0

    .line 118
    aget v7, v6, v16

    if-ne v5, v7, :cond_2

    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Landroid/widget/RadioButton;->setChecked(Z)V

    :cond_2
    add-int/lit8 v5, v5, 0x1

    move/from16 v10, v16

    goto/16 :goto_0
.end method

.method static tabAtBottom(I)Z
    .registers 2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    const/4 v0, 0x4

    if-eq p0, v0, :cond_0

    const/4 v0, 0x5

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method static update(Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 6

    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    .line 355
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, p0, :cond_2

    .line 356
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/MultiTabPlacement;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 357
    invoke-static {v0}, Le/e/a/MultiTabPlacement;->layout(Landroid/content/SharedPreferences;)I

    move-result v1

    invoke-static {v1}, Le/e/a/MultiTabPlacement;->tabAtBottom(I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 358
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 359
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v0}, Le/e/a/MultiTabPlacement;->heightDp(Landroid/content/SharedPreferences;)I

    move-result v0

    invoke-static {v3, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    .line 360
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v3

    if-eq v3, v1, :cond_1

    .line 361
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 362
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 363
    invoke-virtual {p0, p1, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    .line 364
    :cond_1
    iget v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, v0, :cond_2

    .line 365
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 366
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 369
    :cond_2
    :goto_1
    invoke-static {p0, p1}, Le/e/a/AppBarPlacement202;->attach(Landroid/widget/LinearLayout;Landroid/view/View;)V

    :cond_3
    return-void
.end method

.method private static updateSummary(Landroid/preference/Preference;Landroid/content/SharedPreferences;)V
    .registers 5

    .line 95
    invoke-static {p1}, Le/e/a/MultiTabPlacement;->layout(Landroid/content/SharedPreferences;)I

    move-result v0

    .line 96
    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v2, Le/e/a/MultiTabPlacement;->LABELS:[Ljava/lang/String;

    aget-object v0, v2, v0

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, " / "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Le/e/a/MultiTabPlacement;->heightDp(Landroid/content/SharedPreferences;)I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " dp"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method
