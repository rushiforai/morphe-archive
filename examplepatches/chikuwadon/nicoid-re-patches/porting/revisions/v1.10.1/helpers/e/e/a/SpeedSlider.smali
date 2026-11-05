.class public final Le/e/a/SpeedSlider;
.super Ljava/lang/Object;
.source "SpeedSlider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SpeedSlider$Selection;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(IZ)Ljava/lang/String;
    .registers 2

    .line 22
    invoke-static {p0, p1}, Le/e/a/SpeedSlider;->sliderLabel(IZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static holdProgress(F)I
    .registers 2

    const/4 v0, 0x0

    cmpg-float v0, p0, v0

    if-lez v0, :cond_13

    .line 21
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_c

    goto :goto_13

    :cond_c
    invoke-static {p0}, Le/e/a/SpeedSlider;->progress(F)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    goto :goto_14

    :cond_13
    :goto_13
    const/4 p0, 0x0

    :goto_14
    return p0
.end method

.method public static holdValue(I)F
    .registers 1

    if-gtz p0, :cond_4

    const/4 p0, 0x0

    goto :goto_a

    :cond_4
    add-int/lit8 p0, p0, -0x1

    .line 20
    invoke-static {p0}, Le/e/a/SpeedSlider;->value(I)F

    move-result p0

    :goto_a
    return p0
.end method

.method public static label(F)Ljava/lang/String;
    .registers 5

    .line 7
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const/high16 v1, 0x41200000    # 10.0f

    mul-float v2, p0, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    cmpl-float v1, p0, v2

    if-nez v1, :cond_13

    const-string v1, "%.1f\u00d7"

    goto :goto_15

    :cond_13
    const-string v1, "%.2f\u00d7"

    :goto_15
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Le/e/a/SpeedSlider$Selection;ZLandroid/widget/SeekBar;Landroid/content/DialogInterface;I)V
    .registers 5

    if-eqz p1, :cond_b

    .line 17
    invoke-virtual {p2}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    invoke-static {p1}, Le/e/a/SpeedSlider;->holdValue(I)F

    move-result p1

    goto :goto_13

    :cond_b
    invoke-virtual {p2}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    invoke-static {p1}, Le/e/a/SpeedSlider;->value(I)F

    move-result p1

    :goto_13
    invoke-interface {p0, p1}, Le/e/a/SpeedSlider$Selection;->selected(F)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/widget/SeekBar;ZLandroid/view/View;)V
    .registers 3

    if-eqz p1, :cond_9

    const/high16 p1, 0x40000000    # 2.0f

    .line 18
    invoke-static {p1}, Le/e/a/SpeedSlider;->holdProgress(F)I

    move-result p1

    goto :goto_f

    :cond_9
    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p1}, Le/e/a/SpeedSlider;->progress(F)I

    move-result p1

    :goto_f
    invoke-virtual {p0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/preference/Preference;)Z
    .registers 5

    .line 24
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "1.0"

    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/PlaybackRules;->defaultSpeed(Ljava/lang/String;)F

    move-result p2

    new-instance v0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0, p1}, Le/e/a/SpeedSlider$$ExternalSyntheticLambda7;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V

    const-string p1, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306e\u518d\u751f\u901f\u5ea6"

    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v1, v0}, Le/e/a/SpeedSlider;->show(Landroid/content/Context;Ljava/lang/String;FZLe/e/a/SpeedSlider$Selection;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$3(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;F)V
    .registers 5

    .line 24
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p2}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static progress(F)I
    .registers 2

    const/high16 v0, 0x41a00000    # 20.0f

    mul-float p0, p0, v0

    .line 6
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    add-int/lit8 p0, p0, -0x2

    const/16 v0, 0x3a

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v0, 0x0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 6

    .line 24
    const-string v0, "default_playback_speed"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    instance-of v2, v1, Landroid/preference/ListPreference;

    if-eqz v2, :cond_e

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_11

    :cond_e
    if-eqz v1, :cond_11

    return-void

    :cond_11
    :goto_11
    new-instance v1, Landroid/preference/Preference;

    invoke-direct {v1, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306e\u518d\u751f\u901f\u5ea6"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    const-string v3, "1.0"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlaybackRules;->defaultSpeed(Ljava/lang/String;)F

    move-result v0

    invoke-static {v0}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0, v1}, Le/e/a/SpeedSlider$$ExternalSyntheticLambda6;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method public static show(Landroid/content/Context;Ljava/lang/String;FZLe/e/a/SpeedSlider$Selection;)V
    .registers 11

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    .line 9
    invoke-static/range {v0 .. v5}, Le/e/a/SpeedSlider;->show(Landroid/content/Context;Ljava/lang/String;FZZLe/e/a/SpeedSlider$Selection;)V

    return-void
.end method

.method private static show(Landroid/content/Context;Ljava/lang/String;FZZLe/e/a/SpeedSlider$Selection;)V
    .registers 13

    .line 13
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x41c00000    # 24.0f

    mul-float v2, v2, v3

    float-to-int v2, v2

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 14
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v3, 0x41b00000    # 22.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/SeekBar;

    invoke-direct {v3, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    if-eqz p4, :cond_42

    const/16 v6, 0x3b

    goto :goto_44

    :cond_42
    const/16 v6, 0x3a

    :goto_44
    invoke-virtual {v3, v6}, Landroid/widget/SeekBar;->setMax(I)V

    if-eqz p4, :cond_4e

    invoke-static {p2}, Le/e/a/SpeedSlider;->holdProgress(F)I

    move-result p2

    goto :goto_52

    :cond_4e
    invoke-static {p2}, Le/e/a/SpeedSlider;->progress(F)I

    move-result p2

    :goto_52
    invoke-virtual {v3, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getProgress()I

    move-result p2

    invoke-static {p2, p4}, Le/e/a/SpeedSlider;->sliderLabel(IZ)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 15
    new-instance p2, Landroid/util/TypedValue;

    invoke-direct {p2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    const v5, 0x7f03005e

    invoke-virtual {v4, v5, p2, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v1, p2, Landroid/util/TypedValue;->resourceId:I

    if-nez v1, :cond_82

    iget p2, p2, Landroid/util/TypedValue;->data:I

    goto :goto_8c

    :cond_82
    invoke-virtual {v3}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget p2, p2, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    :goto_8c
    invoke-static {p2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {v3, p2}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v3, p2}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    .line 16
    new-instance p2, Le/e/a/SpeedSlider$1;

    invoke-direct {p2, v2, p4}, Le/e/a/SpeedSlider$1;-><init>(Landroid/widget/TextView;Z)V

    invoke-virtual {v3, p2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 17
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "OK"

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Le/e/a/SpeedSlider$$ExternalSyntheticLambda4;

    invoke-direct {v0, p5, p4, v3}, Le/e/a/SpeedSlider$$ExternalSyntheticLambda4;-><init>(Le/e/a/SpeedSlider$Selection;ZLandroid/widget/SeekBar;)V

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/4 p5, 0x0

    invoke-virtual {p1, p2, p5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "Reset to default"

    const-string v0, "\u9084\u539f\u9810\u8a2d\u503c"

    const-string v1, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306b\u623b\u3059"

    invoke-static {p0, v1, p2, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0, p5}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    if-eqz p3, :cond_ee

    .line 18
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x1a

    if-lt p2, p3, :cond_e9

    const/16 p2, 0x7f6

    goto :goto_eb

    :cond_e9
    const/16 p2, 0x7d2

    :goto_eb
    invoke-virtual {p1, p2}, Landroid/view/Window;->setType(I)V

    :cond_ee
    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 p1, -0x3

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    new-instance p1, Le/e/a/SpeedSlider$$ExternalSyntheticLambda5;

    invoke-direct {p1, v3, p4}, Le/e/a/SpeedSlider$$ExternalSyntheticLambda5;-><init>(Landroid/widget/SeekBar;Z)V

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public static showHold(Landroid/content/Context;FLe/e/a/SpeedSlider$Selection;)V
    .registers 9

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 11
    const-string v1, "\u9577\u62bc\u3057\u4e2d\u306e\u518d\u751f\u901f\u5ea6"

    move-object v0, p0

    move v2, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Le/e/a/SpeedSlider;->show(Landroid/content/Context;Ljava/lang/String;FZZLe/e/a/SpeedSlider$Selection;)V

    return-void
.end method

.method private static sliderLabel(IZ)Ljava/lang/String;
    .registers 2

    if-eqz p1, :cond_b

    if-nez p0, :cond_b

    .line 22
    const-string p0, "\u7121\u52b9"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1a

    :cond_b
    if-eqz p1, :cond_12

    invoke-static {p0}, Le/e/a/SpeedSlider;->holdValue(I)F

    move-result p0

    goto :goto_16

    :cond_12
    invoke-static {p0}, Le/e/a/SpeedSlider;->value(I)F

    move-result p0

    :goto_16
    invoke-static {p0}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object p0

    :goto_1a
    return-object p0
.end method

.method public static value(I)F
    .registers 2

    const/16 v0, 0x3a

    .line 5
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v0, 0x0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    add-int/lit8 p0, p0, 0x2

    int-to-float p0, p0

    const/high16 v0, 0x41a00000    # 20.0f

    div-float/2addr p0, v0

    return p0
.end method

.method private static white(Landroid/view/View;)V
    .registers 3

    .line 23
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_b

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_b
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_23

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_19

    goto :goto_23

    :cond_19
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/SpeedSlider;->white(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    :cond_23
    :goto_23
    return-void
.end method
