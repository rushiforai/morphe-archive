.class public final Le/e/a/Revision196;
.super Ljava/lang/Object;
.source "Revision196.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Revision196$Back;
    }
.end annotation


# static fields
.field static final INFO_POSITION:Ljava/lang/String; = "popup_info_position"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static back(Landroid/widget/TextView;)V
    .registers 3

    .line 48
    const-string v0, ""

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string v0, "\u623b\u308b"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v0, Le/e/a/Revision196$Back;

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v1

    invoke-direct {v0, v1}, Le/e/a/Revision196$Back;-><init>(I)V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 49
    return-void
.end method

.method public static centered(Landroid/widget/TextView;)V
    .registers 4

    .line 55
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0, v2, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextAlignment(I)V

    return-void
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static followTint(Landroid/content/Context;ZZ)I
    .registers 4

    .line 28
    const/4 v0, -0x1

    if-eqz p2, :cond_4

    return v0

    .line 29
    :cond_4
    if-eqz p1, :cond_b

    invoke-static {p0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v0

    goto :goto_16

    :cond_b
    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_12

    goto :goto_16

    :cond_12
    invoke-static {p0}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v0

    :goto_16
    return v0
.end method

.method public static glyph(FLjava/lang/String;)F
    .registers 3

    .line 57
    const-string v0, "play"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "pause"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_39

    .line 59
    :cond_11
    const-string v0, "fullscreen"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_25

    const-string v0, "exitfullscreen"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_22

    goto :goto_25

    :cond_22
    const/16 p1, 0x18

    goto :goto_27

    :cond_25
    :goto_25
    const/16 p1, 0x15

    :goto_27
    int-to-float p1, p1

    .line 60
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p0

    return p0

    .line 57
    :cond_39
    :goto_39
    return p0
.end method

.method static infoLeft(Landroid/content/Context;)Z
    .registers 3

    .line 17
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "popup_info_position"

    const-string v1, "left"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "right"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public static inherit(Landroid/view/View;Landroid/view/View;)V
    .registers 6

    .line 67
    if-eqz p0, :cond_51

    if-nez p1, :cond_5

    goto :goto_51

    .line 69
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eq v0, v1, :cond_16

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 70
    :cond_16
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v1

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_29

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 71
    :cond_29
    invoke-virtual {p0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    .line 72
    if-eqz v0, :cond_50

    new-instance v1, Landroid/view/animation/Transformation;

    invoke-direct {v1}, Landroid/view/animation/Transformation;-><init>()V

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3, v1}, Landroid/view/animation/Animation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    invoke-virtual {v1}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v0

    mul-float p0, p0, v0

    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v0

    cmpl-float v0, v0, p0

    if-eqz v0, :cond_50

    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 73
    :cond_50
    return-void

    .line 67
    :cond_51
    :goto_51
    return-void
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;[Ljava/lang/String;Landroid/preference/Preference;)Z
    .registers 7

    .line 24
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p3

    invoke-static {p3}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    invoke-virtual {p1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    invoke-static {p0}, Le/e/a/Revision196;->infoLeft(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    new-instance v2, Le/e/a/Revision196$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, p1, p2}, Le/e/a/Revision196$$ExternalSyntheticLambda1;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;[Ljava/lang/String;)V

    invoke-virtual {p3, p2, v0, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return v1
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;[Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 7

    .line 24
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    if-nez p4, :cond_d

    const-string v0, "left"

    goto :goto_f

    :cond_d
    const-string v0, "right"

    :goto_f
    const-string v1, "popup_info_position"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    aget-object p0, p2, p4

    invoke-virtual {p1, p0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method public static popupCenter(Landroid/view/View;)V
    .registers 3

    .line 63
    const-string v0, "topmenulay"

    invoke-static {p0, v0}, Le/e/a/Revision196;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v1, "viewctrllay"

    invoke-static {p0, v1}, Le/e/a/Revision196;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    if-eqz v0, :cond_15

    if-nez p0, :cond_11

    goto :goto_15

    .line 64
    :cond_11
    invoke-static {v0, p0}, Le/e/a/Revision196;->inherit(Landroid/view/View;Landroid/view/View;)V

    .line 65
    return-void

    .line 63
    :cond_15
    :goto_15
    return-void
.end method

.method public static popupCount(Landroid/widget/LinearLayout;)I
    .registers 2

    .line 42
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Revision196;->infoLeft(Landroid/content/Context;)Z

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public static popupInfo(Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 6

    .line 32
    if-eqz p1, :cond_6c

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/RelativeLayout;

    if-nez v0, :cond_b

    goto :goto_6c

    .line 33
    :cond_b
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 34
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/Revision196;->infoLeft(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_30

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2c

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_2c
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void

    .line 35
    :cond_30
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    if-eq p0, v0, :cond_6b

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of p0, p0, Landroid/view/ViewGroup;

    if-eqz p0, :cond_47

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_47
    new-instance p0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x28

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-direct {p0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x9

    invoke-virtual {p0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v1, 0xa

    invoke-virtual {p0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v0, p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    :cond_6b
    return-void

    .line 32
    :cond_6c
    :goto_6c
    return-void
.end method

.method public static popupInfoSettings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 6

    .line 19
    const-string v0, "popup_info_position"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    .line 20
    :cond_9
    new-instance v1, Landroid/preference/Preference;

    invoke-direct {v1, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 21
    const-string v0, "Video information button position in popup"

    const-string v2, "\u6d6e\u52d5\u64ad\u653e\u7684\u5f71\u7247\u8cc7\u8a0a\u6309\u9215\u4f4d\u7f6e"

    const-string v3, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u306e\u52d5\u753b\u60c5\u5831\u30dc\u30bf\u30f3\u306e\u4f4d\u7f6e"

    invoke-static {p0, v3, v0, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 22
    const-string v0, "Left"

    const-string v2, "\u5de6\u5074"

    invoke-static {p0, v2, v0, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "Right"

    const-string v3, "\u53f3\u5074"

    invoke-static {p0, v3, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v0

    .line 23
    invoke-static {p0}, Le/e/a/Revision196;->infoLeft(Landroid/content/Context;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    aget-object v2, v0, v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 24
    new-instance v2, Le/e/a/Revision196$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v1, v0}, Le/e/a/Revision196$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;[Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 25
    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 26
    return-void
.end method

.method public static popupInfoSize(Landroid/widget/LinearLayout;I)V
    .registers 5

    .line 38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-nez v0, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const-string v1, "infobutton"

    invoke-static {v0, v1}, Le/e/a/Revision196;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_18

    return-void

    .line 39
    :cond_18
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v2, p1, :cond_24

    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v2, p1, :cond_2b

    :cond_24
    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    :cond_2b
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Revision196;->infoLeft(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_37

    goto :goto_38

    :cond_37
    const/4 p1, 0x0

    :goto_38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    move-result v0

    if-eq v0, p1, :cond_41

    invoke-virtual {p0, p1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 41
    :cond_41
    return-void
.end method

.method public static queue(Ljava/lang/Object;)V
    .registers 11

    .line 76
    const-string v0, "w0"

    :try_start_2
    const-string v1, "o0"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_8} :catch_f8

    const/4 v2, 0x0

    :try_start_9
    const-string v3, "v"

    invoke-static {v1, v3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_f} :catch_10

    goto :goto_12

    :catch_10
    move-exception v1

    move-object v1, v2

    .line 77
    :goto_12
    :try_start_12
    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_1c} :catch_f8

    .line 78
    if-eqz v1, :cond_36

    :try_start_1e
    const-string v4, "C1"

    invoke-static {v1, v4}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_24} :catch_33

    :try_start_24
    const-string v5, "D1"

    invoke-static {v1, v5}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v3
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_30} :catch_31

    goto :goto_37

    :catch_31
    move-exception v1

    goto :goto_37

    :catch_33
    move-exception v1

    move-object v4, v2

    goto :goto_37

    :cond_36
    move-object v4, v2

    .line 79
    :goto_37
    :try_start_37
    instance-of v1, v4, Ljava/util/List;
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_39} :catch_f8

    const-string v5, "c"

    const/4 v6, 0x0

    if-nez v1, :cond_52

    :try_start_3e
    const-string v1, "e.e.a.v0"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    new-array v7, v6, [Ljava/lang/Class;

    invoke-virtual {v1, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v7, v6, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_50} :catch_51

    goto :goto_52

    :catch_51
    move-exception v1

    .line 80
    :cond_52
    :goto_52
    :try_start_52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "a0"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 81
    if-nez v2, :cond_6c

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    :cond_6c
    instance-of v1, v4, Ljava/util/List;

    if-eqz v1, :cond_78

    new-instance v1, Ljava/util/ArrayList;

    check-cast v4, Ljava/util/List;

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_7d

    :cond_78
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 83
    :goto_7d
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/4 v4, 0x1

    if-eqz v1, :cond_8c

    const/4 v1, 0x0

    goto :goto_99

    :cond_8c
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v4

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 84
    :goto_99
    const/4 v3, 0x0

    :goto_9a
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt v3, v7, :cond_d7

    .line 85
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 87
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "l0"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_bc

    const/4 v4, 0x0

    :cond_bc
    invoke-virtual {v0, p0, v4}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 88
    const-string v0, "Z"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_100

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-array v1, v6, [Ljava/lang/Class;

    invoke-virtual {v0, v5, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v6, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    goto :goto_100

    .line 84
    :cond_d7
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "i"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    if-ne v3, v1, :cond_ed

    const/4 v9, 0x1

    goto :goto_ee

    :cond_ed
    const/4 v9, 0x0

    :goto_ee
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_f5
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_f5} :catch_f8

    add-int/lit8 v3, v3, 0x1

    goto :goto_9a

    .line 89
    :catch_f8
    move-exception p0

    const-string v0, "nicoid-player"

    const-string v1, "Unable to restore queue view"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 90
    :cond_100
    :goto_100
    return-void
.end method

.method public static summary(Landroid/preference/Preference;Z)V
    .registers 5

    .line 45
    invoke-virtual {p0}, Landroid/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz p1, :cond_9

    const-string v1, "\u30d7\u30ec\u30a4\u30e4\u30fc\u4e0a\u90e8\u306e\u30dc\u30bf\u30f3\u306e\u8868\u793a\u30fb\u975e\u8868\u793a\u3068\u4e26\u3073\u9806\u3092\u5909\u66f4\u3057\u307e\u3059\u3002"

    goto :goto_b

    :cond_9
    const-string v1, "\u52d5\u753b\u60c5\u5831\u6b04\u306e\u30dc\u30bf\u30f3\u306e\u8868\u793a\u30fb\u975e\u8868\u793a\u3092\u8a2d\u5b9a\u3057\u307e\u3059\u3002"

    :goto_b
    if-eqz p1, :cond_10

    const-string v2, "Change the visibility and order of the buttons at the top of the player."

    goto :goto_12

    :cond_10
    const-string v2, "Show or hide buttons in the video information area."

    :goto_12
    if-eqz p1, :cond_17

    const-string p1, "\u8a2d\u5b9a\u64ad\u653e\u5668\u4e0a\u65b9\u6309\u9215\u7684\u986f\u793a\u72c0\u614b\u8207\u9806\u5e8f\u3002"

    goto :goto_19

    :cond_17
    const-string p1, "\u8a2d\u5b9a\u5f71\u7247\u8cc7\u8a0a\u5340\u6309\u9215\u7684\u986f\u793a\u72c0\u614b\u3002"

    :goto_19
    invoke-static {v0, v1, v2, p1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 46
    return-void
.end method
