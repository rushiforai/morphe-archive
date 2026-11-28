.class final Le/e/a/NicoliveUi;
.super Ljava/lang/Object;
.source "NicoliveUi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/NicoliveUi$Glyph;,
        Le/e/a/NicoliveUi$TabLine;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static accent(Landroid/content/Context;)I
    .registers 1

    .line 7
    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method static button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 5

    .line 24
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v1, 0x41500000    # 13.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1, p1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-static {p0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v0, v2, p1, v1, p1}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-static {p0}, Le/e/a/NicoliveUi;->accent(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setTextColor(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackgroundColor(I)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setElevation(F)V

    return-object v0
.end method

.method static column(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .registers 2

    .line 22
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-static {v0}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    return-object v0
.end method

.method static dialog(Landroid/app/AlertDialog;)V
    .registers 1

    .line 64
    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Le/e/a/AppLocale251;->translate(Landroid/view/View;)V

    return-void
.end method

.method static dp(Landroid/content/Context;F)I
    .registers 2

    .line 5
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

.method static icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;
    .registers 6

    .line 62
    new-instance v0, Landroid/widget/ImageButton;

    invoke-direct {v0, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    new-instance v1, Le/e/a/NicoliveUi$Glyph;

    invoke-static {p0}, Le/e/a/NicoliveUi;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-direct {v1, p1, v2}, Le/e/a/NicoliveUi$Glyph;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    const/high16 p1, 0x41400000    # 12.0f

    invoke-static {p0, p1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p2

    invoke-static {p0, p1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-static {p0, p1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-static {p0, p1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p1

    invoke-virtual {v0, p2, v1, v2, p1}, Landroid/widget/ImageButton;->setPadding(IIII)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setElevation(F)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 p2, 0x42400000    # 48.0f

    invoke-static {p0, p2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-static {p0, p2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-direct {p1, v1, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method static input(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/EditText;
    .registers 6

    .line 63
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const-string v1, "nicoid-managed-input"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextSize(F)V

    invoke-static {v0}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextColor(I)V

    invoke-static {v0}, Le/e/a/DynamicTheme;->secondaryTextColor(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHintTextColor(I)V

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const/high16 p1, 0x41000000    # 8.0f

    invoke-static {p0, p1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    const/high16 v2, 0x40800000    # 4.0f

    invoke-static {p0, v2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-static {p0, p1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p1

    invoke-static {p0, v2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {v0, v1, v3, p1, v2}, Landroid/widget/EditText;->setPadding(IIII)V

    invoke-static {p0}, Le/e/a/NicoliveUi;->accent(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-object v0
.end method

.method static ja(Landroid/content/Context;)Z
    .registers 2

    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ja"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static navigationButton(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/view/View;
    .registers 12

    .line 34
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x11

    .line 36
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 37
    invoke-virtual {v0, p3}, Landroid/widget/LinearLayout;->setSelected(Z)V

    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setFocusable(Z)V

    .line 39
    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 40
    new-instance v3, Le/e/a/NicoliveUi$1;

    invoke-direct {v3}, Le/e/a/NicoliveUi$1;-><init>()V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    if-eqz p3, :cond_0

    .line 46
    invoke-static {p0}, Le/e/a/NicoliveUi;->accent(Landroid/content/Context;)I

    move-result p3

    goto :goto_0

    :cond_0
    invoke-static {v0}, Le/e/a/DynamicTheme;->secondaryTextColor(Landroid/view/View;)I

    move-result p3

    .line 47
    :goto_0
    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 48
    new-instance v4, Le/e/a/NicoliveUi$Glyph;

    invoke-direct {v4, p2, p3}, Le/e/a/NicoliveUi$Glyph;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 p2, 0x2

    .line 49
    invoke-virtual {v3, p2}, Landroid/widget/ImageView;->setImportantForAccessibility(I)V

    .line 50
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-static {p0, v5}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-static {p0, v5}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-direct {v4, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v3, 0xb

    .line 51
    invoke-static {p0, p1, v3}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    const/16 v4, 0x8

    .line 52
    invoke-virtual {p1, v4, v3, v1, p2}, Landroid/widget/TextView;->setAutoSizeTextTypeUniformWithConfiguration(IIII)V

    .line 53
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 54
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 55
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 57
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, -0x1

    invoke-static {p0, v5}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-direct {p2, p3, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 p3, 0x40000000    # 2.0f

    .line 58
    invoke-static {p0, p3}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 59
    invoke-virtual {v0, p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method static panel(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;
    .registers 8

    .line 26
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 27
    invoke-static {p0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, -0x1

    goto :goto_0

    :cond_0
    const/high16 v2, -0x1000000

    .line 28
    :goto_0
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v3

    mul-int/lit8 v3, v3, 0x5d

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v4

    mul-int/lit8 v4, v4, 0x7

    add-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x64

    .line 29
    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v4

    mul-int/lit8 v4, v4, 0x5d

    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0x7

    add-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x64

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    mul-int/lit8 v1, v1, 0x5d

    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x7

    add-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x64

    .line 28
    invoke-static {v3, v4, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    int-to-float p1, p1

    .line 30
    invoke-static {p0, p1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method static row(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .registers 2

    .line 23
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 p0, 0x10

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setGravity(I)V

    return-object v0
.end method

.method static selected(Landroid/widget/Button;Z)V
    .registers 5

    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/Button;->setSelected(Z)V

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/NicoliveUi;->accent(Landroid/content/Context;)I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Le/e/a/DynamicTheme;->secondaryTextColor(Landroid/view/View;)I

    move-result v0

    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/Button;->setTextColor(I)V

    new-instance v0, Le/e/a/NicoliveUi$TabLine;

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Le/e/a/NicoliveUi;->accent(Landroid/content/Context;)I

    move-result p1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-direct {v0, p1, v1}, Le/e/a/NicoliveUi$TabLine;-><init>(II)V

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static stat(Landroid/text/SpannableStringBuilder;Landroid/content/Context;Ljava/lang/String;J)V
    .registers 8

    .line 20
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    const-string/jumbo v1, "\ufffc "

    invoke-virtual {p0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p3

    const-string p4, "%,d"

    invoke-static {v2, p4, p3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    new-instance p3, Le/e/a/NicoliveUi$Glyph;

    new-instance p4, Landroid/widget/TextView;

    invoke-direct {p4, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-static {p4}, Le/e/a/DynamicTheme;->secondaryTextColor(Landroid/view/View;)I

    move-result p4

    invoke-direct {p3, p2, p4}, Le/e/a/NicoliveUi$Glyph;-><init>(Ljava/lang/String;I)V

    const/high16 p2, 0x41600000    # 14.0f

    invoke-static {p1, p2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p4

    invoke-static {p1, p2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result p1

    const/4 p2, 0x0

    invoke-virtual {p3, p2, p2, p4, p1}, Le/e/a/NicoliveUi$Glyph;->setBounds(IIII)V

    new-instance p1, Landroid/text/style/ImageSpan;

    const/4 p2, 0x1

    invoke-direct {p1, p3, p2}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    add-int/lit8 p2, v0, 0x1

    const/16 p3, 0x21

    invoke-virtual {p0, p1, v0, p2, p3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-void
.end method

.method static statistics(Landroid/content/Context;JJ)Ljava/lang/CharSequence;
    .registers 9

    .line 17
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-ltz v3, :cond_0

    .line 18
    const-string v3, "person"

    invoke-static {v0, p0, v3, p1, p2}, Le/e/a/NicoliveUi;->stat(Landroid/text/SpannableStringBuilder;Landroid/content/Context;Ljava/lang/String;J)V

    :cond_0
    cmp-long p1, p3, v1

    if-ltz p1, :cond_2

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    if-lez p1, :cond_1

    const-string p1, "   "

    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :cond_1
    const-string p1, "chat-stat"

    invoke-static {v0, p0, p1, p3, p4}, Le/e/a/NicoliveUi;->stat(Landroid/text/SpannableStringBuilder;Landroid/content/Context;Ljava/lang/String;J)V

    :cond_2
    return-object v0
.end method

.method static text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;
    .registers 4

    .line 21
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    sget-object p0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-static {v0}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 p0, 0x10

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setGravity(I)V

    return-object v0
.end method

.method static time(J)Ljava/lang/String;
    .registers 9

    const-wide/16 v0, 0xe10

    cmp-long v2, p0, v0

    const-wide/16 v3, 0x3c

    if-gez v2, :cond_0

    .line 65
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-long v1, p0, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    rem-long/2addr p0, v3

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%02d:%02d"

    invoke-static {v0, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-long v0, p0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    div-long v5, p0, v3

    rem-long/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    rem-long/2addr p0, v3

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%d:%02d:%02d"

    invoke-static {v2, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static videoAccent(Landroid/content/Context;)I
    .registers 5

    .line 8
    invoke-static {p0}, Le/e/a/NicoliveUi;->accent(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f19999a    # 0.6f

    mul-float/2addr v0, v1

    const/high16 v2, 0x42cc0000    # 102.0f

    add-float/2addr v0, v2

    float-to-int v0, v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v1

    add-float/2addr v3, v2

    float-to-int v3, v3

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    int-to-float p0, p0

    mul-float/2addr p0, v1

    add-float/2addr p0, v2

    float-to-int p0, p0

    invoke-static {v0, v3, p0}, Landroid/graphics/Color;->rgb(III)I

    move-result p0

    return p0
.end method
