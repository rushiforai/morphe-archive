.class public final Le/e/a/CommentOptions;
.super Ljava/lang/Object;
.source "CommentOptions.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static label(ILjava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 12
    const-string v0, "shadow"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    int-to-float p0, p0

    const/high16 v0, 0x41200000    # 10.0f

    div-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const-string p0, "%.1f dp"

    invoke-static {p1, p0, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_4a

    :cond_1f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "rows"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    const-string p1, "\u884c"

    :goto_32
    invoke-static {p1}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_42

    :cond_37
    const-string v0, "seconds"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    const-string p1, "\u79d2"

    goto :goto_32

    :cond_42
    :goto_42
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_4a
    return-object p0
.end method

.method static synthetic lambda$slider$0(Landroid/widget/SeekBar;ILandroid/preference/PreferenceActivity;Ljava/lang/String;Landroid/preference/Preference;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 8

    .line 13
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result p0

    add-int/2addr p0, p1

    invoke-static {p2}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1, p3, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p0, p5}, Le/e/a/CommentOptions;->label(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p4, p0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$slider$1(Landroid/widget/SeekBar;IILandroid/view/View;)V
    .registers 4

    .line 13
    sub-int/2addr p1, p2

    invoke-virtual {p0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    return-void
.end method

.method static synthetic lambda$slider$2(Landroid/preference/PreferenceActivity;IILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/preference/Preference;ILandroid/preference/Preference;)Z
    .registers 22

    .line 13
    move v0, p1

    move v7, p2

    move-object/from16 v6, p5

    invoke-static {p0}, Le/e/a/FeedbackFixes;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v3, 0x18

    invoke-static {v1, v3}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v2, v3, v3, v3, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v4, 0x41b00000    # 22.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v9, Landroid/widget/SeekBar;

    invoke-direct {v9, v1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    sub-int v4, v0, v7

    invoke-virtual {v9, v4}, Landroid/widget/SeekBar;->setMax(I)V

    move-object v4, p0

    move-object v5, p3

    move/from16 v10, p4

    invoke-static {p0, p3, v10, p2, p1}, Le/e/a/CommentOptions;->value(Landroid/content/Context;Ljava/lang/String;III)I

    move-result v0

    sub-int/2addr v0, v7

    invoke-virtual {v9, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    invoke-virtual {v9}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    add-int/2addr v0, v7

    invoke-static {v0, v6}, Le/e/a/CommentOptions;->label(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v9, v0}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    new-instance v0, Le/e/a/CommentOptions$1;

    invoke-direct {v0, v3, p2, v6}, Le/e/a/CommentOptions$1;-><init>(Landroid/widget/TextView;ILjava/lang/String;)V

    invoke-virtual {v9, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static/range {p6 .. p6}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v1}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30c7\u30d5\u30a9\u30eb\u30c8\u306b\u623b\u3059"

    invoke-static {v1}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    new-instance v11, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;

    move-object v0, v11

    move-object v1, v9

    move v2, p2

    move-object v3, p0

    move-object v4, p3

    move-object/from16 v5, p7

    invoke-direct/range {v0 .. v6}, Le/e/a/CommentOptions$$ExternalSyntheticLambda0;-><init>(Landroid/widget/SeekBar;ILandroid/preference/PreferenceActivity;Ljava/lang/String;Landroid/preference/Preference;Ljava/lang/String;)V

    const-string v0, "OK"

    invoke-virtual {v10, v0, v11}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    :try_start_a6
    const-string v0, "PlaybackSession"

    const-string v2, "formDialog"

    new-array v3, v8, [Ljava/lang/Class;

    const-class v4, Landroid/app/AlertDialog;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v4, v8, [Ljava/lang/Object;

    aput-object v1, v4, v5

    invoke-static {v0, v2, v3, v4}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b8
    .catch Ljava/lang/Exception; {:try_start_a6 .. :try_end_b8} :catch_b9

    goto :goto_bd

    :catch_b9
    move-exception v0

    invoke-static {v0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_bd
    const/4 v0, -0x3

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Le/e/a/CommentOptions$$ExternalSyntheticLambda1;

    move/from16 v2, p8

    invoke-direct {v1, v9, v2, p2}, Le/e/a/CommentOptions$$ExternalSyntheticLambda1;-><init>(Landroid/widget/SeekBar;II)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return v8
.end method

.method public static opacity(Landroid/content/Context;)I
    .registers 5

    .line 7
    invoke-static {p0}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "comment_opacity_percent"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    const/16 v3, 0x64

    if-eqz v0, :cond_14

    invoke-static {p0, v1, v3, v2, v3}, Le/e/a/CommentOptions;->value(Landroid/content/Context;Ljava/lang/String;III)I

    move-result p0

    return p0

    :cond_14
    :try_start_14
    invoke-static {p0}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "comment_alpha"

    const-string v1, "255"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    int-to-float p0, p0

    const/high16 v0, 0x42c80000    # 100.0f

    mul-float p0, p0, v0

    const/high16 v0, 0x437f0000    # 255.0f

    div-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-static {v3, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {v2, p0}, Ljava/lang/Math;->max(II)I

    move-result p0
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_38} :catch_39

    return p0

    :catch_39
    move-exception p0

    return v3
.end method

.method static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 6

    .line 9
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    :cond_4
    const/4 v1, 0x0

    :goto_5
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-ge v1, v2, :cond_22

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    if-ne v2, p1, :cond_12

    return-object p0

    :cond_12
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_1f

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/CommentOptions;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_1f

    return-object v2

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_22
    return-object v0
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 4
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static remove(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V
    .registers 2

    .line 10
    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object p0

    invoke-static {p0, p1}, Le/e/a/CommentOptions;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object p0

    if-eqz p0, :cond_11

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_11
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 25

    .line 11
    move-object/from16 v9, p0

    invoke-virtual/range {p0 .. p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    const-string v1, "comment_size_level"

    invoke-virtual {v9, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/CommentOptions;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v0

    if-nez v0, :cond_20

    invoke-virtual/range {p0 .. p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    const-string v1, "comment_size_percent"

    invoke-virtual {v9, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/CommentOptions;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v0

    :cond_20
    if-nez v0, :cond_2a

    const-string v0, "player"

    invoke-virtual {v9, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceGroup;

    :cond_2a
    move-object v10, v0

    if-nez v10, :cond_2e

    return-void

    :cond_2e
    invoke-static/range {p0 .. p0}, Le/e/a/CommentOptions;->size(Landroid/content/Context;)I

    move-result v7

    invoke-static/range {p0 .. p0}, Le/e/a/CommentOptions;->opacity(Landroid/content/Context;)I

    move-result v11

    invoke-static/range {p0 .. p0}, Le/e/a/CommentOptions;->shadow(Landroid/content/Context;)F

    move-result v0

    const/high16 v1, 0x41200000    # 10.0f

    mul-float v0, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v12

    const-string v0, "comment_rows"

    const/16 v1, 0xa

    const/4 v13, 0x1

    const/16 v14, 0x14

    invoke-static {v9, v0, v1, v13, v14}, Le/e/a/CommentOptions;->value(Landroid/content/Context;Ljava/lang/String;III)I

    move-result v15

    const-string v22, "comment_rows"

    const-string v23, "comment_duration_seconds"

    const-string v16, "comment_size_level"

    const-string v17, "comment_alpha"

    const-string v18, "comment_size_percent"

    const-string v19, "comment_shadow_dp"

    const-string v20, "comment_shadow_tenths"

    const-string v21, "comment_opacity_percent"

    filled-new-array/range {v16 .. v23}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_62
    const/16 v2, 0x8

    if-ge v1, v2, :cond_6e

    aget-object v2, v0, v1

    invoke-static {v9, v2}, Le/e/a/CommentOptions;->remove(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_62

    :cond_6e
    const/16 v6, 0x64

    const-string v8, "%"

    const-string v2, "comment_size_percent"

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u306e\u5927\u304d\u3055"

    const/16 v4, 0xa

    const/16 v5, 0x12c

    move-object/from16 v0, p0

    move-object v1, v10

    invoke-static/range {v0 .. v8}, Le/e/a/CommentOptions;->slider(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;)V

    const/4 v6, 0x7

    const-string v8, "shadow"

    const-string v2, "comment_shadow_tenths"

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u306e\u5f71\u306e\u5927\u304d\u3055"

    const/4 v4, 0x1

    const/16 v5, 0x32

    move v7, v12

    invoke-static/range {v0 .. v8}, Le/e/a/CommentOptions;->slider(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;)V

    const/16 v6, 0x64

    const-string v8, "%"

    const-string v2, "comment_opacity_percent"

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u306e\u4e0d\u900f\u660e\u5ea6"

    const/4 v4, 0x0

    const/16 v5, 0x64

    move v7, v11

    invoke-static/range {v0 .. v8}, Le/e/a/CommentOptions;->slider(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;)V

    const/16 v6, 0xa

    const-string v8, "rows"

    const-string v2, "comment_rows"

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u306e\u6700\u5927\u884c\u6570"

    const/4 v4, 0x1

    const/16 v5, 0x14

    move v7, v15

    invoke-static/range {v0 .. v8}, Le/e/a/CommentOptions;->slider(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;)V

    const-string v0, "comment_duration_seconds"

    const/4 v1, 0x5

    invoke-static {v9, v0, v1, v13, v14}, Le/e/a/CommentOptions;->value(Landroid/content/Context;Ljava/lang/String;III)I

    move-result v7

    const-string v8, "seconds"

    const-string v2, "comment_duration_seconds"

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u306e\u8868\u793a\u6642\u9593"

    const/4 v6, 0x5

    move-object/from16 v0, p0

    move-object v1, v10

    invoke-static/range {v0 .. v8}, Le/e/a/CommentOptions;->slider(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;)V

    return-void
.end method

.method public static shadow(Landroid/content/Context;)F
    .registers 5

    .line 8
    invoke-static {p0}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "comment_shadow_dp"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_17

    const/4 v0, 0x0

    const/16 v3, 0x14

    invoke-static {p0, v1, v2, v0, v3}, Le/e/a/CommentOptions;->value(Landroid/content/Context;Ljava/lang/String;III)I

    move-result v0

    mul-int/lit8 v0, v0, 0xa

    goto :goto_18

    :cond_17
    const/4 v0, 0x7

    :goto_18
    const/16 v1, 0x32

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const-string v3, "comment_shadow_tenths"

    invoke-static {p0, v3, v0, v2, v1}, Le/e/a/CommentOptions;->value(Landroid/content/Context;Ljava/lang/String;III)I

    move-result p0

    int-to-float p0, p0

    const/high16 v0, 0x41200000    # 10.0f

    div-float/2addr p0, v0

    return p0
.end method

.method public static size(Landroid/content/Context;)I
    .registers 6

    .line 6
    invoke-static {p0}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "comment_size_percent"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    const/16 v2, 0x64

    if-eqz v0, :cond_17

    const/16 v0, 0xa

    const/16 v3, 0x12c

    invoke-static {p0, v1, v2, v0, v3}, Le/e/a/CommentOptions;->value(Landroid/content/Context;Ljava/lang/String;III)I

    move-result p0

    return p0

    :cond_17
    const/16 v0, 0x3c

    const/16 v1, 0x50

    const/16 v3, 0x78

    const/16 v4, 0x8c

    :try_start_1f
    filled-new-array {v0, v1, v2, v3, v4}, [I

    move-result-object v0

    invoke-static {p0}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "comment_size_level"

    const-string v3, "2"

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    const/4 v1, 0x4

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v1, 0x0

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    aget p0, v0, p0
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_3f} :catch_40

    return p0

    :catch_40
    move-exception p0

    return v2
.end method

.method static slider(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;)V
    .registers 21

    .line 13
    new-instance v10, Landroid/preference/Preference;

    move-object v1, p0

    invoke-direct {v10, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    move-object v4, p2

    invoke-virtual {v10, p2}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    invoke-static {p3}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static/range {p7 .. p8}, Le/e/a/CommentOptions;->label(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    move-object v0, p1

    invoke-virtual {p1, v10}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    new-instance v11, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;

    move-object v0, v11

    move/from16 v2, p5

    move/from16 v3, p4

    move/from16 v5, p7

    move-object/from16 v6, p8

    move-object v7, p3

    move-object v8, v10

    move/from16 v9, p6

    invoke-direct/range {v0 .. v9}, Le/e/a/CommentOptions$$ExternalSyntheticLambda2;-><init>(Landroid/preference/PreferenceActivity;IILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/preference/Preference;I)V

    invoke-virtual {v10, v11}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    return-void
.end method

.method public static value(Landroid/content/Context;Ljava/lang/String;III)I
    .registers 5

    .line 5
    :try_start_0
    invoke-static {p0}, Le/e/a/CommentOptions;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2
    :try_end_8
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_a

    :catch_9
    move-exception p0

    :goto_a
    invoke-static {p4, p2}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {p3, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method
