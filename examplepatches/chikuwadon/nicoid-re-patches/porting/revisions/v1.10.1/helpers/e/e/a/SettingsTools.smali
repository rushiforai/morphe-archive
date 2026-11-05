.class public final Le/e/a/SettingsTools;
.super Ljava/lang/Object;
.source "SettingsTools.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SettingsTools$Node;,
        Le/e/a/SettingsTools$SearchIcon;,
        Le/e/a/SettingsTools$SummarySync;,
        Le/e/a/SettingsTools$VisibilityPreference;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static arrangeOther(Landroid/preference/PreferenceGroup;Landroid/preference/PreferenceGroup;)V
    .registers 7

    .line 14
    const-string v0, "nicoid_ng_comments"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    const-string v1, "nicoid_filter_list"

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-nez v0, :cond_f

    return-void

    :cond_f
    invoke-static {p0, v0}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object p0

    if-eqz p0, :cond_1a

    if-eq p0, p1, :cond_1a

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_1a
    if-eq p0, p1, :cond_1f

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    :cond_1f
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_26
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v4

    if-lt v3, v4, :cond_4a

    if-eqz v1, :cond_31

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setOrder(I)V

    :cond_31
    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/preference/Preference;->setOrder(I)V

    :goto_35
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lt v2, p1, :cond_3c

    return-void

    :cond_3c
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/preference/Preference;

    add-int/lit8 v0, v2, 0x2

    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setOrder(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_35

    :cond_4a
    invoke-virtual {p1, v3}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v4

    if-eq v4, v1, :cond_55

    if-eq v4, v0, :cond_55

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_55
    add-int/lit8 v3, v3, 0x1

    goto :goto_26
.end method

.method static cleanSummaries(Landroid/preference/PreferenceGroup;)V
    .registers 5

    .line 8
    if-nez p0, :cond_3

    return-void

    :cond_3
    const/4 v0, 0x0

    :goto_4
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {v1}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_22

    invoke-static {v2}, Le/e/a/SettingsTools;->withoutFinalStop(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_22

    invoke-virtual {v1, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_22
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_2b

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1}, Le/e/a/SettingsTools;->cleanSummaries(Landroid/preference/PreferenceGroup;)V

    :cond_2b
    add-int/lit8 v0, v0, 0x1

    goto :goto_4
.end method

.method static detailButtons(Landroid/preference/PreferenceActivity;)V
    .registers 10

    .line 12
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    const-string v1, "video_info_follow_button"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    if-eqz v2, :cond_14

    instance-of v3, v2, Landroid/preference/CheckBoxPreference;

    if-nez v3, :cond_14

    return-void

    :cond_14
    const/4 v3, 0x0

    if-nez v2, :cond_19

    move-object v4, v3

    goto :goto_1d

    :cond_19
    invoke-static {v0, v2}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v4

    :goto_1d
    if-nez v4, :cond_2d

    const-string v4, "nicoid_content_filter"

    invoke-virtual {p0, v4}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    instance-of v5, v4, Landroid/preference/PreferenceGroup;

    if-eqz v5, :cond_2c

    check-cast v4, Landroid/preference/PreferenceGroup;

    goto :goto_2d

    :cond_2c
    move-object v4, v0

    :cond_2d
    :goto_2d
    if-nez v2, :cond_34

    invoke-virtual {v4}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    goto :goto_38

    :cond_34
    invoke-virtual {v2}, Landroid/preference/Preference;->getOrder()I

    move-result v2

    :goto_38
    const-string v5, "video_info_like_button"

    const-string v6, "video_info_nicoad_button"

    filled-new-array {v1, v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    :goto_41
    const/4 v7, 0x3

    if-lt v6, v7, :cond_71

    new-instance v0, Landroid/preference/Preference;

    invoke-direct {v0, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/preference/Preference;->setOrder(I)V

    const-string v1, "\u52d5\u753b\u60c5\u5831\u6b04\u306e\u30dc\u30bf\u30f3"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v1, "Choose which Follow, Like and NicoNico Ads buttons appear in video details"

    const-string v2, "\u9078\u64c7\u5f71\u7247\u8cc7\u8a0a\u4e2d\u986f\u793a\u7684\u8ffd\u8e64\u3001\u559c\u6b61\u53ca Niconico \u5ee3\u544a\u6309\u9215"

    const-string v3, "\u52d5\u753b\u60c5\u5831\u306b\u8868\u793a\u3059\u308b\u300c\u30d5\u30a9\u30ed\u30fc\u300d\u300c\u3044\u3044\u306d\u300d\u300c\u30cb\u30b3\u30cb\u5e83\u544a\u300d\u306e\u30dc\u30bf\u30f3\u3092\u9078\u629e\u3057\u307e\u3059"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v1, Le/e/a/SettingsTools$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Le/e/a/SettingsTools$$ExternalSyntheticLambda3;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void

    :cond_71
    aget-object v7, v5, v6

    invoke-virtual {p0, v7}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    if-nez v7, :cond_7b

    move-object v8, v3

    goto :goto_7f

    :cond_7b
    invoke-static {v0, v7}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v8

    :goto_7f
    if-eqz v8, :cond_84

    invoke-virtual {v8, v7}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_84
    add-int/lit8 v6, v6, 0x1

    goto :goto_41
.end method

.method static finishSettings(Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 6
    invoke-static {p0}, Le/e/a/SettingsPlacement233;->finish(Landroid/preference/PreferenceActivity;)V

    const-string v0, "player"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    instance-of v1, v0, Landroid/preference/PreferenceGroup;

    if-eqz v1, :cond_10

    check-cast v0, Landroid/preference/PreferenceGroup;

    goto :goto_14

    :cond_10
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    :goto_14
    invoke-static {p0, v0}, Le/e/a/SettingsTools;->visibilityEntry(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    invoke-static {p0, v0}, Le/e/a/PlayerVisibility192;->settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    invoke-static {p0, v0}, Le/e/a/PlayerButtons192;->settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    invoke-static {p0}, Le/e/a/CommentSettings192;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/SettingsTools;->detailButtons(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object p0

    invoke-static {p0}, Le/e/a/SettingsTools;->cleanSummaries(Landroid/preference/PreferenceGroup;)V

    return-void
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 13
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getListView()Landroid/widget/ListView;

    move-result-object v0

    new-instance v1, Le/e/a/SettingsTools$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Le/e/a/SettingsTools$$ExternalSyntheticLambda4;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 12
    invoke-static {p0}, Le/e/a/DetailActions195;->show(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;)V
    .registers 13

    .line 13
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    const-string v1, "nicoid_content_filter"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceGroup;

    const/4 v2, 0x0

    if-eqz v1, :cond_5b

    const-string v3, "Other"

    const-string v4, "\u5176\u4ed6"

    const-string v5, "\u305d\u306e\u4ed6"

    invoke-static {p0, v5, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/PreferenceGroup;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static {p0, v1}, Le/e/a/NgCommentSettings;->install(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    const-string v3, "show_shorts_menu"

    const-string v4, "video_info_follow_button"

    const-string v5, "search_suggestions_enabled"

    filled-new-array {v5, v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    :goto_31
    const/4 v5, 0x3

    if-lt v4, v5, :cond_3b

    invoke-static {v0, v1}, Le/e/a/SettingsTools;->arrangeOther(Landroid/preference/PreferenceGroup;Landroid/preference/PreferenceGroup;)V

    invoke-static {p0, v1}, Le/e/a/HistoryLimit120;->settings(Landroid/app/Activity;Landroid/preference/PreferenceGroup;)V

    goto :goto_5b

    :cond_3b
    aget-object v5, v3, v4

    invoke-virtual {p0, v5}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    if-eqz v5, :cond_58

    invoke-static {v0, v5}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v6

    if-eqz v6, :cond_58

    if-eq v6, v1, :cond_58

    invoke-virtual {v6, v5}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    invoke-virtual {v1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setOrder(I)V

    invoke-virtual {v1, v5}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    :cond_58
    add-int/lit8 v4, v4, 0x1

    goto :goto_31

    :cond_5b
    :goto_5b
    invoke-static {p0}, Le/e/a/SettingsTools;->finishSettings(Landroid/preference/PreferenceActivity;)V

    const-string v1, "startup_screen"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-static {v1}, Le/e/a/StartupTabs120;->settings(Landroid/preference/Preference;)V

    invoke-static {p0}, Le/e/a/MenuOptions119;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/CustomTheme119;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/VideoMarks119;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/SettingsIntegrity;->stripSummaries(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getListView()Landroid/widget/ListView;

    move-result-object v1

    const-string v3, "settings_search"

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_80

    return-void

    :cond_80
    new-instance v4, Le/e/a/SettingsTools$SummarySync;

    invoke-direct {v4, p0, v1}, Le/e/a/SettingsTools$SummarySync;-><init>(Landroid/preference/PreferenceActivity;Landroid/view/View;)V

    invoke-virtual {v1, v4}, Landroid/widget/ListView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v1}, Landroid/widget/ListView;->isAttachedToWindow()Z

    move-result v5

    if-eqz v5, :cond_91

    invoke-virtual {v4, v1}, Le/e/a/SettingsTools$SummarySync;->onViewAttachedToWindow(Landroid/view/View;)V

    :cond_91
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/16 v3, 0x10

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/16 v6, 0x8

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v4, v5, v7, v8, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v3, 0xe

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v5, v3, v2, v7, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_cf

    const v3, -0xcfcdc8

    goto :goto_d2

    :cond_cf
    const v3, -0x111112

    :goto_d2
    const/16 v7, 0x1c

    invoke-static {p0, v3, v7}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x30

    invoke-static {p0, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v8, -0x1

    invoke-direct {v3, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Le/e/a/SettingsTools$SearchIcon;

    invoke-direct {v3, p0}, Le/e/a/SettingsTools$SearchIcon;-><init>(Landroid/content/Context;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v9, 0x18

    invoke-static {p0, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-static {p0, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v7, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setSingleLine(Z)V

    const-string v9, "Search settings"

    const-string v10, "\u641c\u5c0b\u8a2d\u5b9a\u9805\u76ee"

    const-string v11, "\u8a2d\u5b9a\u9805\u76ee\u3092\u691c\u7d22"

    invoke-static {p0, v11, v9, v10}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v9

    invoke-virtual {v3, v9}, Landroid/widget/EditText;->setTextColor(I)V

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v9

    if-eqz v9, :cond_128

    const v9, -0x403e3a

    goto :goto_12b

    :cond_128
    const v9, -0x989693

    :goto_12b
    invoke-virtual {v3, v9}, Landroid/widget/EditText;->setHintTextColor(I)V

    const/4 v9, 0x0

    invoke-virtual {v3, v9}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v10, 0xc

    invoke-static {p0, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {v3, v10, v2, p0, v2}, Landroid/widget/EditText;->setPadding(IIII)V

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setInputType(I)V

    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {p0, v2, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v3, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, v7}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    invoke-virtual {v1, v4, v9, v2}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    new-instance p0, Le/e/a/SettingsTools$Node;

    invoke-direct {p0, v0}, Le/e/a/SettingsTools$Node;-><init>(Landroid/preference/PreferenceGroup;)V

    new-instance v0, Le/e/a/SettingsTools$1;

    invoke-direct {v0, p0}, Le/e/a/SettingsTools$1;-><init>(Le/e/a/SettingsTools$Node;)V

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method

.method static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5

    .line 4
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_9

    const/4 p0, 0x0

    return-object p0

    :cond_9
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    if-ne v1, p1, :cond_10

    return-object p0

    :cond_10
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1d

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1, p1}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-eqz v1, :cond_1d

    return-object v1

    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method static visibilityEntry(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 6

    .line 9
    const-string v0, "player_controls_visibility_mode"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    instance-of v2, v1, Le/e/a/SettingsTools$VisibilityPreference;

    if-eqz v2, :cond_b

    return-void

    :cond_b
    if-nez v1, :cond_f

    move-object v2, p1

    goto :goto_17

    :cond_f
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-static {v2, v1}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    :goto_17
    if-nez v1, :cond_1e

    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v3

    goto :goto_22

    :cond_1e
    invoke-virtual {v1}, Landroid/preference/Preference;->getOrder()I

    move-result v3

    :goto_22
    if-eqz v1, :cond_29

    if-eqz v2, :cond_29

    invoke-virtual {v2, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_29
    new-instance v1, Le/e/a/SettingsTools$VisibilityPreference;

    invoke-direct {v1, p0}, Le/e/a/SettingsTools$VisibilityPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Le/e/a/SettingsTools$VisibilityPreference;->setKey(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Le/e/a/SettingsTools$VisibilityPreference;->setOrder(I)V

    if-nez v2, :cond_37

    goto :goto_38

    :cond_37
    move-object p1, v2

    :goto_38
    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method static withoutFinalStop(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 3

    .line 7
    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_8
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, "\u3002"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    return-object p0

    :cond_1d
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_8
.end method
