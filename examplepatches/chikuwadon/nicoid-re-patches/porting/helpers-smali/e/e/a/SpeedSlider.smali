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

.method public static label(F)Ljava/lang/String;
    .registers 6
    .param p0, "speed"    # F

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

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$settings$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;F)V
    .registers 6
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "p"    # Landroid/preference/Preference;
    .param p2, "s"    # F

    .line 17
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p2}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$settings$2(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/preference/Preference;)Z
    .registers 7
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "p"    # Landroid/preference/Preference;
    .param p2, "v"    # Landroid/preference/Preference;

    .line 17
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "1.0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlaybackRules;->defaultSpeed(Ljava/lang/String;)F

    move-result v0

    new-instance v1, Le/e/a/SpeedSlider$2;

    invoke-direct {v1, p0, p1}, Le/e/a/SpeedSlider$2;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V

    const-string v2, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306e\u518d\u751f\u901f\u5ea6"

    const/4 v3, 0x0

    invoke-static {p0, v2, v0, v3, v1}, Le/e/a/SpeedSlider;->show(Landroid/content/Context;Ljava/lang/String;FZLe/e/a/SpeedSlider$Selection;)V

    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$show$0(Le/e/a/SpeedSlider$Selection;Landroid/widget/SeekBar;Landroid/content/DialogInterface;I)V
    .registers 5
    .param p0, "selected"    # Le/e/a/SpeedSlider$Selection;
    .param p1, "seek"    # Landroid/widget/SeekBar;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 13
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-static {v0}, Le/e/a/SpeedSlider;->value(I)F

    move-result v0

    invoke-interface {p0, v0}, Le/e/a/SpeedSlider$Selection;->selected(F)V

    return-void
.end method

.method public static progress(F)I
    .registers 3
    .param p0, "value"    # F

    .line 6
    const/high16 v0, 0x41a00000    # 20.0f

    mul-float v0, v0, p0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    const/16 v1, 0x3a

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 7
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "group"    # Landroid/preference/PreferenceGroup;

    .line 17
    const-string v0, "default_playback_speed"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .local v1, "old":Landroid/preference/Preference;
    instance-of v2, v1, Landroid/preference/ListPreference;

    if-eqz v2, :cond_e

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_11

    :cond_e
    if-eqz v1, :cond_11

    return-void

    :cond_11
    :goto_11
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .local v2, "p":Landroid/preference/Preference;
    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306e\u518d\u751f\u901f\u5ea6"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-virtual {v2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    const-string v4, "1.0"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlaybackRules;->defaultSpeed(Ljava/lang/String;)F

    move-result v0

    invoke-static {v0}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/SpeedSlider$0;

    invoke-direct {v0, p0, v2}, Le/e/a/SpeedSlider$0;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {p1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method public static show(Landroid/content/Context;Ljava/lang/String;FZLe/e/a/SpeedSlider$Selection;)V
    .registers 18
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "speed"    # F
    .param p3, "overlay"    # Z
    .param p4, "selected"    # Le/e/a/SpeedSlider$Selection;

    .line 9
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    .local v0, "c":Landroid/content/Context;
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .local v1, "box":Landroid/widget/LinearLayout;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x41c00000    # 24.0f

    mul-float v3, v3, v4

    float-to-int v3, v3

    .local v3, "pad":I
    invoke-virtual {v1, v3, v3, v3, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 10
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .local v4, "label":Landroid/widget/TextView;
    const/16 v5, 0x11

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v5, 0x41b00000    # 22.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/SeekBar;

    invoke-direct {v5, v0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .local v5, "seek":Landroid/widget/SeekBar;
    const/16 v8, 0x3a

    invoke-virtual {v5, v8}, Landroid/widget/SeekBar;->setMax(I)V

    invoke-static {p2}, Le/e/a/SpeedSlider;->progress(F)I

    move-result v8

    invoke-virtual {v5, v8}, Landroid/widget/SeekBar;->setProgress(I)V

    invoke-virtual {v5}, Landroid/widget/SeekBar;->getProgress()I

    move-result v8

    invoke-static {v8}, Le/e/a/SpeedSlider;->value(I)F

    move-result v8

    invoke-static {v8}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 11
    new-instance v6, Landroid/util/TypedValue;

    invoke-direct {v6}, Landroid/util/TypedValue;-><init>()V

    .local v6, "color":Landroid/util/TypedValue;
    invoke-virtual {v5}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v7

    const v8, 0x7f03005e

    invoke-virtual {v7, v8, v6, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v2, v6, Landroid/util/TypedValue;->resourceId:I

    if-nez v2, :cond_7a

    iget v2, v6, Landroid/util/TypedValue;->data:I

    goto :goto_84

    :cond_7a
    invoke-virtual {v5}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v7, v6, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    .local v2, "tint":I
    :goto_84
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    .local v7, "colors":Landroid/content/res/ColorStateList;
    invoke-virtual {v5, v7}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v5, v7}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    .line 12
    new-instance v8, Le/e/a/SpeedSlider$1;

    invoke-direct {v8, v4}, Le/e/a/SpeedSlider$1;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v5, v8}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 13
    new-instance v8, Landroid/app/AlertDialog$Builder;

    invoke-direct {v8, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    invoke-virtual {v8, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    const-string v9, "OK"

    invoke-static {v9}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Le/e/a/SpeedSlider$3;

    move-object/from16 v11, p4

    invoke-direct {v10, v11, v5}, Le/e/a/SpeedSlider$3;-><init>(Le/e/a/SpeedSlider$Selection;Landroid/widget/SeekBar;)V

    invoke-virtual {v8, v9, v10}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    const-string v9, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v9}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    .line 14
    .local v8, "d":Landroid/app/AlertDialog;
    if-eqz p3, :cond_db

    invoke-virtual {v8}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v9

    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x1a

    if-lt v10, v12, :cond_d6

    const/16 v10, 0x7f6

    goto :goto_d8

    :cond_d6
    const/16 v10, 0x7d2

    :goto_d8
    invoke-virtual {v9, v10}, Landroid/view/Window;->setType(I)V

    :cond_db
    invoke-virtual {v8}, Landroid/app/AlertDialog;->show()V

    invoke-static {v8}, Le/e/a/PlaybackSession;->styleDialog(Landroid/app/AlertDialog;)V

    .line 15
    return-void
.end method

.method public static value(I)F
    .registers 3
    .param p0, "progress"    # I

    .line 5
    const/16 v0, 0x3a

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    const/high16 v1, 0x41a00000    # 20.0f

    div-float/2addr v0, v1

    return v0
.end method

.method private static white(Landroid/view/View;)V
    .registers 4
    .param p0, "v"    # Landroid/view/View;

    .line 16
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_b

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_b
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_23

    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    .local v0, "g":Landroid/view/ViewGroup;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_23

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Le/e/a/SpeedSlider;->white(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .end local v0    # "g":Landroid/view/ViewGroup;
    .end local v1    # "i":I
    :cond_23
    return-void
.end method
