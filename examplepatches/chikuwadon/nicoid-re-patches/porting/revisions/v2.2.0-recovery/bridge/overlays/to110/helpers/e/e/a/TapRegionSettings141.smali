.class public final Le/e/a/TapRegionSettings141;
.super Ljava/lang/Object;
.source "TapRegionSettings141.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/TapRegionSettings141$Editor;,
        Le/e/a/TapRegionSettings141$Preview;
    }
.end annotation


# static fields
.field private static final ANCHOR:Ljava/lang/String; = "gesture_quiet_controls"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Landroid/content/Context;

    .line 24
    invoke-static {p0}, Le/e/a/TapRegionSettings141;->names(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(III)I
    .registers 4
    .param p0, "x0"    # I
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .line 24
    invoke-static {p0, p1, p2}, Le/e/a/TapRegionSettings141;->clamp(III)I

    move-result v0

    return v0
.end method

.method static changeEdge([III)V
    .registers 5
    .param p0, "range"    # [I
    .param p1, "edge"    # I
    .param p2, "value"    # I

    .line 532
    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_0

    add-int/lit8 v0, p1, 0x1

    aget v0, p0, v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    invoke-static {p2, v1, v0}, Le/e/a/TapRegionSettings141;->clamp(III)I

    move-result v0

    aput v0, p0, p1

    goto :goto_0

    .line 533
    :cond_0
    add-int/lit8 v0, p1, -0x1

    aget v0, p0, v0

    add-int/lit8 v0, v0, 0x1

    const/16 v1, 0x64

    invoke-static {p2, v0, v1}, Le/e/a/TapRegionSettings141;->clamp(III)I

    move-result v0

    aput v0, p0, p1

    .line 534
    :goto_0
    return-void
.end method

.method private static clamp(III)I
    .registers 4
    .param p0, "value"    # I
    .param p1, "min"    # I
    .param p2, "max"    # I

    .line 537
    invoke-static {p2, p0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method private static description(Landroid/content/Context;)Ljava/lang/String;
    .registers 4
    .param p0, "c"    # Landroid/content/Context;

    .line 34
    const-string v0, "Choose where a single tap toggles playback controls"

    const-string/jumbo v1, "\u8a2d\u5b9a\u55ae\u9ede\u53ef\u958b\u95dc\u64ad\u653e\u63a7\u5236\u9805\u7684\u5340\u57df"

    const-string v2, "\u30b7\u30f3\u30b0\u30eb\u30bf\u30c3\u30d7\u3067\u518d\u751f\u30b3\u30f3\u30c8\u30ed\u30fc\u30eb\u3092\u958b\u9589\u3067\u304d\u308b\u9818\u57df\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 8
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 61
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-eqz v0, :cond_5

    const-string v0, "nicoid_single_tap_control_region"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_2

    .line 62
    :cond_0
    const-string v1, "gesture_quiet_controls"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 63
    .local v1, "anchor":Landroid/preference/Preference;
    if-nez v1, :cond_1

    return-void

    .line 64
    :cond_1
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-static {v2, v1}, Le/e/a/TapRegionSettings141;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    .line 65
    .local v2, "group":Landroid/preference/PreferenceGroup;
    if-nez v2, :cond_2

    return-void

    .line 66
    :cond_2
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v3, "siblings":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/preference/Preference;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v2}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v5

    if-ge v4, v5, :cond_3

    invoke-virtual {v2, v4}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 68
    .end local v4    # "i":I
    :cond_3
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/preference/Preference;

    mul-int/lit8 v6, v4, 0xa

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setOrder(I)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 69
    .end local v4    # "i":I
    :cond_4
    new-instance v4, Landroid/preference/Preference;

    invoke-direct {v4, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 70
    .local v4, "item":Landroid/preference/Preference;
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/preference/Preference;->setPersistent(Z)V

    .line 71
    invoke-virtual {v4, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 72
    invoke-virtual {v1}, Landroid/preference/Preference;->getOrder()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v4, v0}, Landroid/preference/Preference;->setOrder(I)V

    .line 73
    invoke-static {p0}, Le/e/a/TapRegionSettings141;->title(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 74
    invoke-static {p0}, Le/e/a/TapRegionSettings141;->description(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 75
    new-instance v0, Le/e/a/TapRegionSettings141$0;

    invoke-direct {v0, p0}, Le/e/a/TapRegionSettings141$0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v4, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 76
    invoke-virtual {v2, v4}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 77
    return-void

    .line 61
    .end local v1    # "anchor":Landroid/preference/Preference;
    .end local v2    # "group":Landroid/preference/PreferenceGroup;
    .end local v3    # "siblings":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/preference/Preference;>;"
    .end local v4    # "item":Landroid/preference/Preference;
    :cond_5
    :goto_2
    return-void
.end method

.method static synthetic lambda$install$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 3
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;
    .param p1, "p"    # Landroid/preference/Preference;

    .line 75
    invoke-static {p0}, Le/e/a/TapRegionSettings141;->open(Landroid/preference/PreferenceActivity;)V

    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$open$1(Landroid/preference/PreferenceActivity;Le/e/a/TapRegionSettings141$Editor;Landroid/content/DialogInterface;I)V
    .registers 6
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;
    .param p1, "editor"    # Le/e/a/TapRegionSettings141$Editor;
    .param p2, "closed"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 88
    invoke-virtual {p1}, Le/e/a/TapRegionSettings141$Editor;->value()Le/e/a/TapRegions141;

    move-result-object v0

    iget-object v1, p1, Le/e/a/TapRegionSettings141$Editor;->openOnly:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    invoke-static {p0, v0, v1}, Le/e/a/TapControls141;->save(Landroid/content/Context;Le/e/a/TapRegions141;Z)V

    return-void
.end method

.method private static names(Landroid/content/Context;)[Ljava/lang/String;
    .registers 8
    .param p0, "c"    # Landroid/content/Context;

    .line 39
    nop

    .line 40
    const-string/jumbo v0, "\u753b\u9762\u5168\u4f53"

    const-string v1, "Entire video"

    const-string/jumbo v2, "\u6574\u500b\u756b\u9762"

    invoke-static {p0, v0, v1, v2}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 41
    const-string v1, "\u5de6\u53f3\u7aef"

    const-string v2, "Side edges"

    const-string v3, "\u5de6\u53f3\u5169\u5074"

    invoke-static {p0, v1, v2, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 42
    const-string v2, "\u4e0a\u4e0b\u7aef"

    const-string v3, "Top / bottom"

    const-string v4, "\u4e0a\u4e0b\u5169\u5074"

    invoke-static {p0, v2, v3, v4}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 43
    const-string v3, "\u4e2d\u592e"

    const-string v4, "Center"

    invoke-static {p0, v3, v4, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 44
    const-string v4, "\u30ab\u30b9\u30bf\u30e0"

    const-string v5, "Custom"

    const-string/jumbo v6, "\u81ea\u8a02"

    invoke-static {p0, v4, v5, v6}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    .line 39
    return-object v0
.end method

.method private static open(Landroid/preference/PreferenceActivity;)V
    .registers 7
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 81
    :try_start_0
    const-string v0, "e.e.a.UiDialogs"

    const-string v1, "builder"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    invoke-static {v0, v1, v3, v2}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlertDialog$Builder;

    .line 83
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    new-instance v1, Le/e/a/TapRegionSettings141$Editor;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {p0}, Le/e/a/TapControls141;->settings(Landroid/content/Context;)Le/e/a/TapRegions141;

    move-result-object v3

    .line 84
    invoke-static {p0}, Le/e/a/TapControls141;->openOnly(Landroid/content/Context;)Z

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Le/e/a/TapRegionSettings141$Editor;-><init>(Landroid/content/Context;Le/e/a/TapRegions141;Z)V

    .line 85
    .local v1, "editor":Le/e/a/TapRegionSettings141$Editor;
    invoke-static {p0}, Le/e/a/TapRegionSettings141;->title(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    iget-object v3, v1, Le/e/a/TapRegionSettings141$Editor;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 86
    const/high16 v3, 0x1040000

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Le/e/a/TapRegionSettings141$1;

    invoke-direct {v3, p0, v1}, Le/e/a/TapRegionSettings141$1;-><init>(Landroid/preference/PreferenceActivity;Le/e/a/TapRegionSettings141$Editor;)V

    .line 87
    const v4, 0x104000a

    invoke-virtual {v2, v4, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 88
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .line 89
    .local v2, "dialog":Landroid/app/AlertDialog;
    invoke-static {v2}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    .line 90
    const/16 v3, 0x1c

    invoke-static {v2, v3}, Le/e/a/TapRegionSettings141;->roundDialog(Landroid/app/AlertDialog;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v1    # "editor":Le/e/a/TapRegionSettings141$Editor;
    .end local v2    # "dialog":Landroid/app/AlertDialog;
    goto :goto_0

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, "failure":Ljava/lang/Exception;
    const-string v1, "nicoid-controls"

    const-string v2, "Cannot open single-tap area editor"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 94
    .end local v0    # "failure":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5
    .param p0, "group"    # Landroid/preference/PreferenceGroup;
    .param p1, "anchor"    # Landroid/preference/Preference;

    .line 49
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 50
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    .line 51
    .local v1, "child":Landroid/preference/Preference;
    if-ne v1, p1, :cond_0

    return-object p0

    .line 52
    :cond_0
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1

    .line 53
    move-object v2, v1

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/TapRegionSettings141;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    .line 54
    .local v2, "result":Landroid/preference/PreferenceGroup;
    if-eqz v2, :cond_1

    return-object v2

    .line 49
    .end local v1    # "child":Landroid/preference/Preference;
    .end local v2    # "result":Landroid/preference/PreferenceGroup;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 57
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method private static roundDialog(Landroid/app/AlertDialog;I)V
    .registers 8
    .param p0, "dialog"    # Landroid/app/AlertDialog;
    .param p1, "radiusDp"    # I

    .line 98
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 100
    :cond_0
    :try_start_0
    const-string v0, "e.e.a.UiDialogs"

    const-string v1, "surface"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 101
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v4

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v4, v2, v5

    .line 100
    invoke-static {v0, v1, v3, v2}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 102
    .local v0, "surface":I
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 103
    .local v1, "background":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 104
    int-to-float v2, p1

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    mul-float v2, v2, v3

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 105
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    .end local v0    # "surface":I
    .end local v1    # "background":Landroid/graphics/drawable/GradientDrawable;
    goto :goto_0

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "error":Ljava/lang/Exception;
    const-string v1, "nicoid-controls"

    const-string v2, "Could not round tap-area dialog"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 109
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private static title(Landroid/content/Context;)Ljava/lang/String;
    .registers 4
    .param p0, "c"    # Landroid/content/Context;

    .line 30
    const-string v0, "Single-tap control area"

    const-string v1, "\u55ae\u9ede\u5207\u63db\u63a7\u5236\u9805\u7684\u5340\u57df"

    const-string v2, "\u30b7\u30f3\u30b0\u30eb\u30bf\u30c3\u30d7\u306e\u64cd\u4f5c\u90e8\u8868\u793a\u9818\u57df"

    invoke-static {p0, v2, v0, v1}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
