.class final Le/e/a/LiveSettings;
.super Ljava/lang/Object;
.source "LiveSettings.java"


# static fields
.field private static final TRANSLATIONS:[[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 31

    .line 122
    const-string v0, "Show the refresh button"

    const-string/jumbo v1, "\u986f\u793a\u53f3\u4e0b\u89d2\u7684\u91cd\u65b0\u6574\u7406\u6309\u9215"

    const-string v2, "\u53f3\u4e0b\u306b\u66f4\u65b0\u30dc\u30bf\u30f3\u3092\u8868\u793a"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v3

    const-string v0, "Show a button to refresh the programme list"

    const-string/jumbo v1, "\u986f\u793a\u7528\u4f86\u91cd\u65b0\u6574\u7406\u7bc0\u76ee\u6e05\u55ae\u7684\u6309\u9215"

    const-string/jumbo v2, "\u756a\u7d44\u4e00\u89a7\u3092\u66f4\u65b0\u3059\u308b\u30dc\u30bf\u30f3\u3092\u8868\u793a\u3057\u307e\u3059"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v4

    const-string v0, "Confirm closing Niconico Live"

    const-string/jumbo v1, "\u95dc\u9589 Niconico \u76f4\u64ad\u6642\u78ba\u8a8d"

    const-string v2, "\u30cb\u30b3\u751f\u3092\u9589\u3058\u308b\u3068\u304d\u306e\u78ba\u8a8d"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v5

    const-string v0, "How to confirm when going back closes Niconico Live"

    const-string/jumbo v1, "\u6309\u8fd4\u56de\u95dc\u9589\u76f4\u64ad\u9801\u9762\u6642\u7684\u78ba\u8a8d\u65b9\u5f0f"

    const-string/jumbo v2, "\u623b\u308b\u64cd\u4f5c\u3067\u30cb\u30b3\u751f\u3092\u9589\u3058\u308b\u3068\u304d\u306e\u78ba\u8a8d\u65b9\u6cd5"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v6

    const-string v0, "Starting tab"

    const-string v1, "\u555f\u52d5\u6642\u986f\u793a\u7684\u5206\u9801"

    const-string/jumbo v2, "\u6700\u521d\u306b\u958b\u304f\u30bf\u30d6"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v7

    const-string v0, "Tab shown when opening Niconico Live"

    const-string/jumbo v1, "\u958b\u555f Niconico \u76f4\u64ad\u6642\u986f\u793a\u7684\u5206\u9801"

    const-string v2, "\u30cb\u30b3\u751f\u3092\u958b\u3044\u305f\u3068\u304d\u306b\u8868\u793a\u3059\u308b\u30bf\u30d6"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v8

    const-string v0, "Live"

    const-string/jumbo v1, "\u76f4\u64ad\u4e2d"

    const-string/jumbo v2, "\u653e\u9001\u4e2d"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v9

    const-string v0, "Ranking"

    const-string/jumbo v1, "\u6392\u884c\u699c"

    const-string v2, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v10

    const-string v0, "Schedule"

    const-string/jumbo v1, "\u7bc0\u76ee\u8868"

    const-string/jumbo v2, "\u756a\u7d44\u8868"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v11

    const-string v0, "Following"

    const-string/jumbo v1, "\u8ffd\u8e64"

    const-string v2, "\u30d5\u30a9\u30ed\u30fc"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v12

    const-string v0, "History"

    const-string/jumbo v1, "\u89c0\u770b\u8a18\u9304"

    const-string v2, "\u5c65\u6b74"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v13

    const-string v0, "Reservations"

    const-string/jumbo v1, "\u9810\u7d04\u6e05\u55ae"

    const-string v2, "\u4e88\u7d04\u30ea\u30b9\u30c8"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v14

    const-string v0, "Last opened tab"

    const-string v1, "\u4e0a\u6b21\u958b\u555f\u7684\u5206\u9801"

    const-string v2, "\u524d\u56de\u958b\u3044\u305f\u30bf\u30d6"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v15

    const-string v0, "Live broadcast time display"

    const-string/jumbo v1, "\u76f4\u64ad\u6642\u9593\u986f\u793a"

    const-string/jumbo v2, "\u653e\u9001\u4e2d\u306e\u6642\u523b\u8868\u793a"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v16

    const-string v0, "Time format shown in the programme list"

    const-string/jumbo v1, "\u7bc0\u76ee\u6e05\u55ae\u4e2d\u7684\u6642\u9593\u683c\u5f0f"

    const-string/jumbo v2, "\u756a\u7d44\u4e00\u89a7\u306b\u8868\u793a\u3059\u308b\u6642\u523b\u306e\u5f62\u5f0f"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v17

    const-string v0, "Elapsed time"

    const-string v1, "\u5df2\u64ad\u6642\u9593"

    const-string/jumbo v2, "\u7d4c\u904e\u6642\u9593"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v18

    const-string v0, "Start time"

    const-string/jumbo v1, "\u76f4\u64ad\u958b\u59cb\u6642\u9593"

    const-string/jumbo v2, "\u653e\u9001\u958b\u59cb\u6642\u523b"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v19

    const-string v0, "Tap action"

    const-string/jumbo v1, "\u9ede\u9078\u52d5\u4f5c"

    const-string v2, "\u30bf\u30c3\u30d7\u6642\u306e\u52d5\u4f5c"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v20

    const-string v0, "Playback mode when tapping a programme"

    const-string/jumbo v1, "\u9ede\u9078\u7bc0\u76ee\u6642\u7684\u64ad\u653e\u65b9\u5f0f"

    const-string/jumbo v2, "\u756a\u7d44\u3092\u30bf\u30c3\u30d7\u3057\u305f\u3068\u304d\u306e\u518d\u751f\u65b9\u6cd5"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v21

    const-string v0, "Normal playback"

    const-string v1, "\u4e00\u822c\u64ad\u653e"

    const-string/jumbo v2, "\u901a\u5e38\u518d\u751f"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v22

    const-string v0, "Popup playback"

    const-string v1, "\u5f48\u51fa\u8996\u7a97\u64ad\u653e"

    const-string v2, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v23

    const-string v0, "App bar placement"

    const-string/jumbo v1, "\u61c9\u7528\u7a0b\u5f0f\u5217\u4f4d\u7f6e"

    const-string v2, "\u30a2\u30d7\u30ea\u30d0\u30fc\u306e\u914d\u7f6e"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v24

    const-string v0, "App bar position on the Niconico Live screen"

    const-string v1, "Niconico \u76f4\u64ad\u9801\u9762\u7684\u61c9\u7528\u7a0b\u5f0f\u5217\u4f4d\u7f6e"

    const-string v2, "\u30cb\u30b3\u751f\u753b\u9762\u3067\u306e\u30a2\u30d7\u30ea\u30d0\u30fc\u306e\u4f4d\u7f6e"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v25

    const-string v0, "Top (default)"

    const-string/jumbo v1, "\u9802\u90e8\uff08\u9810\u8a2d\uff09"

    const-string v2, "\u4e0a\u90e8\uff08\u5f93\u6765\u3069\u304a\u308a\uff09"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v26

    const-string v0, "Bottom, above navigation"

    const-string v1, "\u5e95\u90e8\uff0c\u5c0e\u89bd\u5217\u4e0a\u65b9"

    const-string v2, "\u4e0b\u90e8\uff1a\u30ca\u30d3\u30b2\u30fc\u30b7\u30e7\u30f3\u306e\u4e0a"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v27

    const-string v0, "Bottom, below navigation"

    const-string v1, "\u5e95\u90e8\uff0c\u5c0e\u89bd\u5217\u4e0b\u65b9"

    const-string v2, "\u4e0b\u90e8\uff1a\u30ca\u30d3\u30b2\u30fc\u30b7\u30e7\u30f3\u306e\u4e0b"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v28

    const-string v0, "Resume catch-up playback"

    const-string/jumbo v1, "\u5f9e\u4e0a\u6b21\u4f4d\u7f6e\u7e7c\u7e8c\u8ffd\u770b"

    const-string/jumbo v2, "\u8ffd\u3063\u304b\u3051\u518d\u751f\u3092\u524d\u56de\u306e\u4f4d\u7f6e\u304b\u3089\u518d\u958b"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v29

    const-string v0, "Resume the same programme from the previous position when available"

    const-string v1, "\u518d\u6b21\u958b\u555f\u540c\u4e00\u7bc0\u76ee\u6642\uff0c\u5f9e\u4ecd\u53ef\u89c0\u770b\u7684\u4e0a\u6b21\u4f4d\u7f6e\u7e7c\u7e8c\u64ad\u653e"

    const-string v2, "\u540c\u3058\u756a\u7d44\u3092\u958b\u3044\u305f\u3068\u304d\u3001\u8996\u8074\u3067\u304d\u308b\u7bc4\u56f2\u5185\u3067\u524d\u56de\u306e\u4f4d\u7f6e\u306b\u623b\u308a\u307e\u3059"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v30

    filled-new-array/range {v3 .. v30}, [[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/LiveSettings;->TRANSLATIONS:[[Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static categoryOrder(I)I
    .registers 2

    .line 14
    const/16 v0, 0x12

    if-ne p0, v0, :cond_0

    const/16 p0, 0x17

    goto :goto_0

    :cond_0
    mul-int/lit8 p0, p0, 0x2

    :goto_0
    return p0
.end method

.method private static choice(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[II)V
    .registers 26

    .line 59
    move-object/from16 v1, p0

    move-object/from16 v13, p1

    move-object/from16 v5, p2

    move-object/from16 v7, p3

    move-object/from16 v6, p7

    move/from16 v12, p8

    move-object/from16 v9, p4

    invoke-static {v1, v9}, Le/e/a/LiveSettings;->translate(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 60
    move-object/from16 v10, p5

    invoke-static {v1, v10}, Le/e/a/LiveSettings;->translate(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 61
    invoke-virtual/range {p6 .. p6}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 62
    const/4 v4, 0x0

    move v8, v4

    :goto_0
    array-length v11, v3

    if-ge v8, v11, :cond_0

    aget-object v11, v3, v8

    invoke-static {v1, v11}, Le/e/a/LiveSettings;->translate(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v3, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 63
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "live_settings_row_"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 64
    invoke-virtual {v13, v8}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v14

    .line 65
    const/4 v11, 0x1

    if-nez v6, :cond_6

    const-string v15, "nicolive_start_time"

    invoke-virtual {v15, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_6

    .line 66
    instance-of v3, v14, Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_1

    .line 67
    move-object v1, v14

    check-cast v1, Landroid/preference/CheckBoxPreference;

    goto :goto_1

    :cond_1
    new-instance v3, Landroid/preference/CheckBoxPreference;

    invoke-direct {v3, v1}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    move-object v1, v3

    .line 68
    :goto_1
    invoke-virtual {v1, v4}, Landroid/preference/CheckBoxPreference;->setPersistent(Z)V

    .line 69
    invoke-virtual {v1, v8}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 70
    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 71
    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 72
    if-eqz v12, :cond_2

    move v4, v11

    :cond_2
    invoke-interface {v5, v7, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 73
    new-instance v0, Le/e/a/LiveSettings$$ExternalSyntheticLambda1;

    invoke-direct {v0, v5, v7}, Le/e/a/LiveSettings$$ExternalSyntheticLambda1;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 77
    if-eq v1, v14, :cond_5

    .line 78
    if-nez v14, :cond_3

    invoke-virtual/range {p1 .. p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    goto :goto_2

    :cond_3
    invoke-virtual {v14}, Landroid/preference/Preference;->getOrder()I

    move-result v0

    .line 79
    :goto_2
    if-eqz v14, :cond_4

    invoke-virtual {v13, v14}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 80
    :cond_4
    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setOrder(I)V

    .line 81
    invoke-virtual {v13, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 83
    :cond_5
    return-void

    .line 85
    :cond_6
    if-nez v14, :cond_7

    new-instance v15, Landroid/preference/Preference;

    invoke-direct {v15, v1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    goto :goto_3

    :cond_7
    move-object v15, v14

    .line 86
    :goto_3
    if-nez v6, :cond_a

    if-eqz v12, :cond_8

    move v4, v11

    :cond_8
    invoke-interface {v5, v7, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_9

    goto :goto_4

    :cond_9
    const/4 v11, 0x0

    goto :goto_4

    :cond_a
    invoke-interface {v5, v7, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v11

    .line 87
    :goto_4
    nop

    .line 88
    if-nez v6, :cond_b

    move v4, v11

    goto :goto_6

    .line 89
    :cond_b
    const/4 v4, 0x0

    const/16 v16, 0x0

    :goto_5
    array-length v1, v6

    if-ge v4, v1, :cond_d

    aget v1, v6, v4

    if-ne v1, v11, :cond_c

    move/from16 v16, v4

    :cond_c
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v1, p0

    goto :goto_5

    :cond_d
    move/from16 v4, v16

    .line 90
    :goto_6
    invoke-virtual {v15, v8}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 91
    invoke-virtual {v15, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v8, v3, v4

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v8, "\uff1a"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v15, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 93
    nop

    .line 94
    new-instance v11, Le/e/a/LiveSettings$$ExternalSyntheticLambda2;

    move-object v0, v11

    move-object/from16 v1, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p7

    move-object/from16 v7, p3

    move-object/from16 v8, p1

    move-object/from16 v9, p4

    move-object/from16 v10, p5

    move-object v13, v11

    move-object/from16 v11, p6

    move/from16 v12, p8

    invoke-direct/range {v0 .. v12}, Le/e/a/LiveSettings$$ExternalSyntheticLambda2;-><init>(Landroid/preference/PreferenceActivity;Ljava/lang/String;[Ljava/lang/String;ILandroid/content/SharedPreferences;[ILjava/lang/String;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;I)V

    invoke-virtual {v15, v13}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 109
    if-nez v14, :cond_e

    .line 110
    invoke-virtual/range {p1 .. p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    invoke-virtual {v15, v0}, Landroid/preference/Preference;->setOrder(I)V

    .line 111
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 113
    :cond_e
    return-void
.end method

.method static floatingHost(Landroid/widget/FrameLayout;)Landroid/widget/FrameLayout;
    .registers 3

    .line 25
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/VideoMiniPlayer;->floating(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRootView()Landroid/view/View;

    move-result-object v0

    .line 27
    instance-of v1, v0, Landroid/widget/FrameLayout;

    if-eqz v1, :cond_1

    move-object p0, v0

    check-cast p0, Landroid/widget/FrameLayout;

    :cond_1
    return-object p0

    .line 25
    :cond_2
    :goto_0
    return-object p0
.end method

.method static install(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 26

    .line 31
    move-object/from16 v9, p0

    move-object/from16 v10, p1

    if-nez v10, :cond_0

    return-void

    .line 32
    :cond_0
    const-string v0, "Niconico Live"

    const-string v1, "Niconico \u76f4\u64ad"

    const-string v2, "\u30cb\u30b3\u751f"

    invoke-static {v9, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceGroup;->setTitle(Ljava/lang/CharSequence;)V

    .line 33
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v11

    .line 34
    const-string v12, "OFF"

    const-string v13, "ON"

    filled-new-array {v12, v13}, [Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x1

    const-string v3, "nicolive_float_refresh"

    const-string v4, "\u53f3\u4e0b\u306b\u66f4\u65b0\u30dc\u30bf\u30f3\u3092\u8868\u793a"

    const-string/jumbo v5, "\u756a\u7d44\u4e00\u89a7\u3092\u66f4\u65b0\u3059\u308b\u30dc\u30bf\u30f3\u3092\u8868\u793a\u3057\u307e\u3059"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v2, v11

    invoke-static/range {v0 .. v8}, Le/e/a/LiveSettings;->choice(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 36
    nop

    .line 37
    invoke-static/range {p0 .. p0}, Le/e/a/ExitModeOptions;->labels(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v6

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/4 v8, 0x2

    filled-new-array {v14, v15, v8}, [I

    move-result-object v7

    .line 38
    const-string v0, "nicolive_exit_mode"

    invoke-static {v9, v0}, Le/e/a/ExitModeOptions;->mode(Landroid/content/Context;Ljava/lang/String;)I

    move-result v16

    .line 36
    const-string v3, "nicolive_exit_mode"

    const-string v4, "\u30cb\u30b3\u751f\u3092\u9589\u3058\u308b\u3068\u304d\u306e\u78ba\u8a8d"

    const-string/jumbo v5, "\u623b\u308b\u64cd\u4f5c\u3067\u30cb\u30b3\u751f\u3092\u9589\u3058\u308b\u3068\u304d\u306e\u78ba\u8a8d\u65b9\u6cd5"

    move-object/from16 v0, p0

    move/from16 v8, v16

    invoke-static/range {v0 .. v8}, Le/e/a/LiveSettings;->choice(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 39
    const-string v22, "\u4e88\u7d04\u30ea\u30b9\u30c8"

    const-string v23, "\u524d\u56de\u958b\u3044\u305f\u30bf\u30d6"

    const-string/jumbo v17, "\u653e\u9001\u4e2d"

    const-string v18, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    const-string/jumbo v19, "\u756a\u7d44\u8868"

    const-string v20, "\u30d5\u30a9\u30ed\u30fc"

    const-string v21, "\u5c65\u6b74"

    filled-new-array/range {v17 .. v23}, [Ljava/lang/String;

    move-result-object v6

    const/4 v0, 0x7

    new-array v7, v0, [I

    fill-array-data v7, :array_0

    const/4 v8, 0x0

    const-string v3, "nicolive_start_tab"

    const-string/jumbo v4, "\u6700\u521d\u306b\u958b\u304f\u30bf\u30d6"

    const-string v5, "\u30cb\u30b3\u751f\u3092\u958b\u3044\u305f\u3068\u304d\u306b\u8868\u793a\u3059\u308b\u30bf\u30d6"

    move-object/from16 v0, p0

    invoke-static/range {v0 .. v8}, Le/e/a/LiveSettings;->choice(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 43
    const-string/jumbo v0, "\u7d4c\u904e\u6642\u9593"

    const-string/jumbo v1, "\u653e\u9001\u958b\u59cb\u6642\u523b"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const-string v3, "nicolive_start_time"

    const-string/jumbo v4, "\u653e\u9001\u4e2d\u306e\u6642\u523b\u8868\u793a"

    const-string/jumbo v5, "\u756a\u7d44\u4e00\u89a7\u306b\u8868\u793a\u3059\u308b\u6642\u523b\u306e\u5f62\u5f0f"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static/range {v0 .. v8}, Le/e/a/LiveSettings;->choice(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 45
    const-string/jumbo v0, "\u901a\u5e38\u518d\u751f"

    const-string v1, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v6

    filled-new-array {v14, v15}, [I

    move-result-object v7

    const-string v3, "nicolive_tap_behavior"

    const-string v4, "\u30bf\u30c3\u30d7\u6642\u306e\u52d5\u4f5c"

    const-string/jumbo v5, "\u756a\u7d44\u3092\u30bf\u30c3\u30d7\u3057\u305f\u3068\u304d\u306e\u518d\u751f\u65b9\u6cd5"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static/range {v0 .. v8}, Le/e/a/LiveSettings;->choice(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 47
    const-string v0, "\u4e0b\u90e8\uff1a\u30ca\u30d3\u30b2\u30fc\u30b7\u30e7\u30f3\u306e\u4e0a"

    const-string v1, "\u4e0b\u90e8\uff1a\u30ca\u30d3\u30b2\u30fc\u30b7\u30e7\u30f3\u306e\u4e0b"

    const-string v2, "\u4e0a\u90e8\uff08\u5f93\u6765\u3069\u304a\u308a\uff09"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v6

    const/4 v0, 0x2

    filled-new-array {v14, v15, v0}, [I

    move-result-object v7

    const-string v3, "nicoid_live_app_bar_position"

    const-string v4, "\u30a2\u30d7\u30ea\u30d0\u30fc\u306e\u914d\u7f6e"

    const-string v5, "\u30cb\u30b3\u751f\u753b\u9762\u3067\u306e\u30a2\u30d7\u30ea\u30d0\u30fc\u306e\u4f4d\u7f6e"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v2, v11

    invoke-static/range {v0 .. v8}, Le/e/a/LiveSettings;->choice(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 51
    const-string v0, "nicolive_resume_chase"

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 52
    if-eqz v0, :cond_1

    invoke-virtual {v10, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 53
    :cond_1
    filled-new-array {v12, v13}, [Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v3, "nicolive_resume_chase"

    const-string/jumbo v4, "\u8ffd\u3063\u304b\u3051\u518d\u751f\u3092\u524d\u56de\u306e\u4f4d\u7f6e\u304b\u3089\u518d\u958b"

    const-string v5, "\u540c\u3058\u756a\u7d44\u3092\u958b\u3044\u305f\u3068\u304d\u3001\u8996\u8074\u3067\u304d\u308b\u7bc4\u56f2\u5185\u3067\u524d\u56de\u306e\u4f4d\u7f6e\u306b\u623b\u308a\u307e\u3059"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v2, v11

    invoke-static/range {v0 .. v8}, Le/e/a/LiveSettings;->choice(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 55
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x4
        0x3
        0x1
        0x2
        0x5
        -0x1
    .end array-data
.end method

.method static synthetic lambda$choice$0(Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 4

    .line 74
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 75
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$choice$1(Landroid/content/SharedPreferences;[ILjava/lang/String;Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ILandroid/content/DialogInterface;I)V
    .registers 20

    .line 98
    move-object v3, p2

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 99
    if-nez p1, :cond_1

    if-eqz p10, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_1

    .line 100
    :cond_1
    aget v1, p1, p10

    invoke-interface {v0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 101
    :goto_1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 102
    invoke-interface/range {p9 .. p9}, Landroid/content/DialogInterface;->dismiss()V

    .line 103
    move-object v0, p3

    move-object v1, p4

    move-object v2, p0

    move-object v3, p2

    move-object v4, p5

    move-object v5, p6

    move-object/from16 v6, p7

    move-object v7, p1

    move/from16 v8, p8

    invoke-static/range {v0 .. v8}, Le/e/a/LiveSettings;->choice(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[II)V

    .line 104
    return-void
.end method

.method static synthetic lambda$choice$2(Landroid/preference/PreferenceActivity;Ljava/lang/String;[Ljava/lang/String;ILandroid/content/SharedPreferences;[ILjava/lang/String;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ILandroid/preference/Preference;)Z
    .registers 25

    .line 95
    new-instance v0, Landroid/app/AlertDialog$Builder;

    move-object v5, p0

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 96
    move-object v1, p1

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v11, Le/e/a/LiveSettings$$ExternalSyntheticLambda0;

    move-object v1, v11

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    move/from16 v10, p11

    invoke-direct/range {v1 .. v10}, Le/e/a/LiveSettings$$ExternalSyntheticLambda0;-><init>(Landroid/content/SharedPreferences;[ILjava/lang/String;Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;I)V

    .line 97
    move-object v1, p2

    move v2, p3

    invoke-virtual {v0, p2, p3, v11}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 105
    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 106
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 107
    const/4 v0, 0x1

    return v0
.end method

.method static tabColor(Landroid/content/Context;Z)I
    .registers 3

    .line 18
    invoke-static {p0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result p0

    .line 19
    invoke-static {p0}, Landroid/graphics/Color;->luminance(I)F

    move-result p0

    const v0, 0x3ee66666    # 0.45f

    cmpg-float p0, p0, v0

    if-gez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    if-eqz p1, :cond_2

    if-eqz p0, :cond_1

    const p0, -0xcfcac6

    goto :goto_1

    :cond_1
    const p0, -0x130d0e

    :goto_1
    return p0

    .line 21
    :cond_2
    if-eqz p0, :cond_3

    const p0, -0x171312

    goto :goto_2

    :cond_3
    const p0, -0xdbd6d2

    :goto_2
    return p0
.end method

.method private static translate(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 116
    sget-object v0, Le/e/a/LiveSettings;->TRANSLATIONS:[[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 117
    aget-object v5, v4, v2

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v0, 0x1

    aget-object v0, v4, v0

    const/4 v1, 0x2

    aget-object v1, v4, v1

    invoke-static {p0, p1, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 116
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 119
    :cond_1
    return-object p1
.end method
