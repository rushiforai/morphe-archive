.class public final Le/e/a/SettingsDisplay216;
.super Ljava/lang/Object;
.source "SettingsDisplay216.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SettingsDisplay216$Listener;
    }
.end annotation


# static fields
.field private static final LISTENERS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/preference/PreferenceActivity;",
            "Le/e/a/SettingsDisplay216$Listener;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 21
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/SettingsDisplay216;->MAIN:Landroid/os/Handler;

    .line 22
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SettingsDisplay216;->LISTENERS:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/preference/PreferenceActivity;)Z
    .registers 1

    .line 20
    invoke-static {p0}, Le/e/a/SettingsDisplay216;->valid(Landroid/preference/PreferenceActivity;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$100(Landroid/preference/PreferenceActivity;)V
    .registers 1

    .line 20
    invoke-static {p0}, Le/e/a/SettingsDisplay216;->refresh(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method static synthetic access$200()Landroid/os/Handler;
    .registers 1

    .line 20
    sget-object v0, Le/e/a/SettingsDisplay216;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method private static current(Landroid/content/SharedPreferences;Landroid/preference/Preference;)Ljava/lang/String;
    .registers 5

    .line 139
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 140
    instance-of v1, p1, Landroid/preference/ListPreference;

    if-eqz v1, :cond_0

    .line 141
    check-cast p1, Landroid/preference/ListPreference;

    invoke-static {p0, p1}, Le/e/a/SettingsDisplay216;->entry(Landroid/content/SharedPreferences;Landroid/preference/ListPreference;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 142
    :cond_0
    const-string v1, "default_playback_speed"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 145
    const/high16 p1, 0x3f800000    # 1.0f

    :try_start_0
    const-string v1, "1.0"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    goto :goto_0

    .line 146
    :catch_0
    move-exception p0

    .line 147
    move p0, p1

    .line 149
    :goto_0
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p0}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move p1, p0

    .line 150
    :cond_2
    :goto_1
    const/high16 p0, 0x41a00000    # 20.0f

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, p0

    const/high16 p0, 0x40400000    # 3.0f

    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p0

    const p1, 0x3dcccccd    # 0.1f

    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    .line 151
    const/high16 p1, 0x42c80000    # 100.0f

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    rem-int/lit8 p1, p1, 0xa

    if-nez p1, :cond_3

    const-string p1, "%.1f\u00d7"

    goto :goto_2

    :cond_3
    const-string p1, "%.2f\u00d7"

    .line 152
    :goto_2
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 154
    :cond_4
    const-string v1, "show_watch_progress"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    instance-of v1, p1, Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_8

    .line 155
    move-object v1, p1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    .line 156
    invoke-virtual {p1}, Landroid/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p1

    if-eqz p0, :cond_5

    const-string v0, "ON"

    goto :goto_3

    :cond_5
    const-string v0, "OFF"

    .line 157
    :goto_3
    if-eqz p0, :cond_6

    const-string v1, "On"

    goto :goto_4

    :cond_6
    const-string v1, "Off"

    :goto_4
    if-eqz p0, :cond_7

    const-string/jumbo p0, "\u958b\u555f"

    goto :goto_5

    :cond_7
    const-string/jumbo p0, "\u95dc\u9589"

    .line 156
    :goto_5
    invoke-static {p1, v0, v1, p0}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 159
    :cond_8
    const-string v1, "local_watch_history_limit"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 160
    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    .line 161
    if-nez p0, :cond_9

    invoke-virtual {p1}, Landroid/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "Original setting"

    const-string v0, "\u539f\u59cb\u8a2d\u5b9a"

    const-string v1, "\u5f93\u6765\u306e\u8a2d\u5b9a"

    invoke-static {p0, v1, p1, v0}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 162
    :cond_9
    if-gez p0, :cond_a

    invoke-virtual {p1}, Landroid/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "Unlimited"

    const-string v0, "\u4e0d\u8a2d\u4e0a\u9650"

    const-string/jumbo v1, "\u7121\u5236\u9650"

    invoke-static {p0, v1, p1, v0}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 163
    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p1}, Landroid/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, " entries"

    const-string v1, " \u7b46"

    const-string v2, "\u4ef6"

    invoke-static {p1, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 165
    :cond_b
    const-string p0, ""

    return-object p0
.end method

.method private static description(Landroid/preference/Preference;)Ljava/lang/String;
    .registers 5

    .line 38
    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 39
    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 40
    :cond_0
    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    if-nez v2, :cond_1

    const-string v2, ""

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 41
    :goto_0
    invoke-virtual {p0}, Landroid/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    .line 42
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    :cond_2
    goto/16 :goto_1

    :sswitch_0
    const-string v3, "comment_fps"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0x8

    goto/16 :goto_2

    :sswitch_1
    const-string v3, "video_menu_visible_items"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0xc

    goto/16 :goto_2

    :sswitch_2
    const-string v3, "videolist_tap"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    goto/16 :goto_2

    :sswitch_3
    const-string v3, "player_rotation"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0xa

    goto :goto_2

    :sswitch_4
    const-string v3, "startup_screen"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x6

    goto :goto_2

    :sswitch_5
    const-string v3, "local_watch_history_limit"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x7

    goto :goto_2

    :sswitch_6
    const-string v3, "quality_mode"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x2

    goto :goto_2

    :sswitch_7
    const-string v3, "show_watch_progress"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x5

    goto :goto_2

    :sswitch_8
    const-string v3, "intent_type"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_2

    :sswitch_9
    const-string v3, "video_menu_options"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0xb

    goto :goto_2

    :sswitch_a
    const-string v3, "mobile_quality_mode"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    goto :goto_2

    :sswitch_b
    const-string v3, "default_playback_speed"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x4

    goto :goto_2

    :sswitch_c
    const-string v3, "main_rotation"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0x9

    goto :goto_2

    :goto_1
    const/4 v0, -0x1

    :goto_2
    packed-switch v0, :pswitch_data_0

    .line 94
    const-string v0, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f\u306e\u8868\u793a"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 95
    const-string v0, "Background playback display"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 96
    const-string/jumbo v0, "\u80cc\u666f\u64ad\u653e"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "\u986f\u793a"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string/jumbo v0, "\u663e\u793a"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto/16 :goto_3

    .line 89
    :pswitch_0
    const-string v0, "Change the items and their order in the long-press and triangle menus"

    const-string/jumbo v1, "\u8b8a\u66f4\u9577\u6309\u53ca\u4e09\u89d2\u5f62\u9078\u55ae\u986f\u793a\u7684\u9805\u76ee\u8207\u9806\u5e8f"

    const-string/jumbo v2, "\u9577\u62bc\u3057\u30fb\u4e09\u89d2\u30e1\u30cb\u30e5\u30fc\u306e\u8868\u793a\u9805\u76ee\u3068\u9806\u756a\u3092\u5909\u66f4\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 83
    :pswitch_1
    const-string v0, "Choose the orientation and rotation behavior of the playback screen"

    const-string/jumbo v1, "\u8a2d\u5b9a\u5f71\u7247\u64ad\u653e\u756b\u9762\u7684\u65b9\u5411\u53ca\u65cb\u8f49\u65b9\u5f0f"

    const-string v2, "\u52d5\u753b\u518d\u751f\u753b\u9762\u306e\u5411\u304d\u3068\u5909\u66f4\u65b9\u6cd5\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 79
    :pswitch_2
    const-string v0, "Choose the orientation and rotation behavior of the main screen"

    const-string/jumbo v1, "\u8a2d\u5b9a\u4e3b\u756b\u9762\u7684\u65b9\u5411\u53ca\u65cb\u8f49\u65b9\u5f0f"

    const-string/jumbo v2, "\u901a\u5e38\u753b\u9762\u306e\u5411\u304d\u3068\u5909\u66f4\u65b9\u6cd5\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 75
    :pswitch_3
    const-string v0, "Choose the drawing frame rate for on-screen comments"

    const-string/jumbo v1, "\u8a2d\u5b9a\u756b\u9762\u7559\u8a00\u7684\u7e6a\u88fd\u5f71\u683c\u7387"

    const-string/jumbo v2, "\u753b\u9762\u306b\u8868\u793a\u3059\u308b\u30b3\u30e1\u30f3\u30c8\u306e\u63cf\u753b\u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 71
    :pswitch_4
    const-string v0, "Choose the maximum number of watch-history items saved on this device"

    const-string/jumbo v1, "\u8a2d\u5b9a\u6b64\u88dd\u7f6e\u5132\u5b58\u7684\u89c0\u770b\u7d00\u9304\u7b46\u6578\u4e0a\u9650"

    const-string/jumbo v2, "\u672c\u4f53\u306b\u4fdd\u5b58\u3059\u308b\u8996\u8074\u5c65\u6b74\u306e\u6700\u5927\u4ef6\u6570\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 67
    :pswitch_5
    const-string v0, "Choose the screen shown when the app starts"

    const-string/jumbo v1, "\u8a2d\u5b9a\u61c9\u7528\u7a0b\u5f0f\u555f\u52d5\u6642\u986f\u793a\u7684\u756b\u9762"

    const-string v2, "\u30a2\u30d7\u30ea\u8d77\u52d5\u6642\u306b\u8868\u793a\u3059\u308b\u753b\u9762\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 63
    :pswitch_6
    const-string v0, "Choose whether to show watch progress on thumbnails"

    const-string/jumbo v1, "\u8a2d\u5b9a\u662f\u5426\u5728\u7e2e\u5716\u4e0a\u986f\u793a\u89c0\u770b\u9032\u5ea6"

    const-string v2, "\u30b5\u30e0\u30cd\u30a4\u30eb\u306b\u8996\u8074\u6e08\u307f\u306e\u4f4d\u7f6e\u3092\u8868\u793a\u3059\u308b\u304b\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 59
    :pswitch_7
    const-string v0, "Choose the default speed when a video starts playing"

    const-string/jumbo v1, "\u8a2d\u5b9a\u5f71\u7247\u958b\u59cb\u64ad\u653e\u6642\u4f7f\u7528\u7684\u9810\u8a2d\u901f\u5ea6"

    const-string v2, "\u52d5\u753b\u518d\u751f\u6642\u306b\u9069\u7528\u3059\u308b\u521d\u671f\u901f\u5ea6\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 55
    :pswitch_8
    const-string v0, "Choose video quality when using mobile data"

    const-string/jumbo v1, "\u8a2d\u5b9a\u4f7f\u7528\u884c\u52d5\u6578\u64da\u64ad\u653e\u5f71\u7247\u6642\u7684\u756b\u8cea"

    const-string v2, "\u30e2\u30d0\u30a4\u30eb\u901a\u4fe1\u3067\u52d5\u753b\u3092\u518d\u751f\u3059\u308b\u3068\u304d\u306e\u753b\u8cea\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 51
    :pswitch_9
    const-string v0, "Choose video quality during playback"

    const-string/jumbo v1, "\u8a2d\u5b9a\u5f71\u7247\u64ad\u653e\u6642\u7684\u756b\u8cea"

    const-string v2, "\u52d5\u753b\u3092\u518d\u751f\u3059\u308b\u3068\u304d\u306e\u753b\u8cea\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 47
    :pswitch_a
    const-string v0, "Choose how videos opened from external links are played"

    const-string/jumbo v1, "\u8a2d\u5b9a\u5f9e\u5916\u90e8\u9023\u7d50\u958b\u555f\u5f71\u7247\u6642\u7684\u64ad\u653e\u65b9\u5f0f"

    const-string v2, "\u5916\u90e8\u30ea\u30f3\u30af\u304b\u3089\u52d5\u753b\u3092\u958b\u304f\u3068\u304d\u306e\u518d\u751f\u65b9\u6cd5\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 43
    :pswitch_b
    const-string v0, "Choose what happens when a video in a list is tapped"

    const-string/jumbo v1, "\u8a2d\u5b9a\u9ede\u9078\u5f71\u7247\u6e05\u55ae\u9805\u76ee\u6642\u7684\u64cd\u4f5c"

    const-string v2, "\u52d5\u753b\u4e00\u89a7\u3092\u30bf\u30c3\u30d7\u3057\u305f\u3068\u304d\u306e\u64cd\u4f5c\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 101
    :cond_3
    return-object v1

    .line 97
    :cond_4
    :goto_3
    const-string v0, "Choose how playback controls appear during background playback"

    const-string/jumbo v1, "\u8a2d\u5b9a\u80cc\u666f\u64ad\u653e\u6642\u63a7\u5236\u4ecb\u9762\u7684\u986f\u793a\u65b9\u5f0f"

    const-string v2, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f\u4e2d\u306e\u64cd\u4f5c\u90e8\u306e\u8868\u793a\u65b9\u6cd5\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_data_0
    .sparse-switch
        -0x7b8c64bc -> :sswitch_c
        -0x78cdd91f -> :sswitch_b
        -0x4f6e96a0 -> :sswitch_a
        -0x4af6d6fe -> :sswitch_9
        -0x457a2d03 -> :sswitch_8
        -0x1e123ee1 -> :sswitch_7
        -0x9c7071d -> :sswitch_6
        -0x11721f4 -> :sswitch_5
        0x148f246e -> :sswitch_4
        0x2619531c -> :sswitch_3
        0x3c7789fd -> :sswitch_2
        0x7aaee517 -> :sswitch_1
        0x7d666309 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static entry(Landroid/content/SharedPreferences;Landroid/preference/ListPreference;)Ljava/lang/String;
    .registers 5

    .line 110
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 115
    const-string v1, "videolist_tap"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "intent_type"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 116
    :cond_0
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 117
    const-string v1, "nicoid_fullscreen_tap262"

    goto :goto_0

    :cond_1
    const-string v1, "nicoid_fullscreen_link262"

    .line 118
    :goto_0
    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_6

    .line 119
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v1

    const-string v2, "nicoid_fullscreen262"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_2

    .line 123
    :cond_2
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 124
    invoke-virtual {p1}, Landroid/preference/ListPreference;->isPersistent()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 125
    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 126
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_3

    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    .line 128
    :cond_3
    if-eqz v1, :cond_4

    .line 129
    invoke-virtual {p1, v1}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result p0

    .line 130
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 131
    if-ltz p0, :cond_4

    if-eqz v0, :cond_4

    array-length v1, v0

    if-ge p0, v1, :cond_4

    aget-object v1, v0, p0

    if-eqz v1, :cond_4

    .line 132
    aget-object p0, v0, p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 134
    :cond_4
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object p0

    .line 135
    if-nez p0, :cond_5

    const-string p0, ""

    goto :goto_1

    :cond_5
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_1
    return-object p0

    .line 120
    :cond_6
    :goto_2
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "Fullscreen playback"

    const-string v0, "\u5168\u87a2\u5e55\u64ad\u653e"

    const-string v1, "\u5168\u753b\u9762\u518d\u751f"

    invoke-static {p0, v1, p1, v0}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 196
    invoke-static {p0}, Le/e/a/SettingsDisplay216;->valid(Landroid/preference/PreferenceActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 197
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 198
    sget-object v1, Le/e/a/SettingsDisplay216;->LISTENERS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SettingsDisplay216$Listener;

    .line 199
    if-eqz v1, :cond_1

    invoke-virtual {v1, v0}, Le/e/a/SettingsDisplay216$Listener;->close(Landroid/content/SharedPreferences;)V

    .line 200
    :cond_1
    new-instance v1, Le/e/a/SettingsDisplay216$Listener;

    invoke-direct {v1, p0}, Le/e/a/SettingsDisplay216$Listener;-><init>(Landroid/preference/PreferenceActivity;)V

    .line 201
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 202
    sget-object v0, Le/e/a/SettingsDisplay216;->LISTENERS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    invoke-virtual {v1}, Le/e/a/SettingsDisplay216$Listener;->attach()V

    .line 204
    invoke-static {p0}, Le/e/a/SettingsDisplay216;->refresh(Landroid/preference/PreferenceActivity;)V

    .line 205
    return-void
.end method

.method private static refresh(Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 191
    invoke-static {p0}, Le/e/a/SettingsDisplay216;->valid(Landroid/preference/PreferenceActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 192
    :cond_0
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-static {p0, v0, v1}, Le/e/a/SettingsDisplay216;->visit(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/content/SharedPreferences;)V

    .line 193
    return-void

    .line 191
    :cond_1
    :goto_0
    return-void
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 27
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "app_lang"

    const-string v1, "-1"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 28
    const-string v0, "1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p2

    .line 29
    :cond_0
    const-string v0, "2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p3

    .line 30
    :cond_1
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    .line 31
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 32
    const-string v0, "zh"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move-object p1, p3

    goto :goto_0

    :cond_2
    const-string p3, "ja"

    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    goto :goto_0

    :cond_3
    move-object p1, p2

    :goto_0
    return-object p1

    .line 34
    :cond_4
    return-object p1
.end method

.method private static valid(Landroid/preference/PreferenceActivity;)Z
    .registers 2

    .line 106
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static visit(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/content/SharedPreferences;)V
    .registers 8

    .line 169
    invoke-static {p1}, Le/e/a/SettingsDisplay216;->description(Landroid/preference/Preference;)Ljava/lang/String;

    move-result-object v0

    .line 170
    const/4 v1, 0x0

    if-eqz v0, :cond_5

    .line 171
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    .line 172
    const-string v3, "video_menu_options"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 173
    const-string v3, "video_menu_visible_items"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move v2, v1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v2, 0x1

    .line 174
    :goto_1
    if-eqz v2, :cond_2

    const-string v2, ""

    goto :goto_2

    :cond_2
    invoke-static {p2, p1}, Le/e/a/SettingsDisplay216;->current(Landroid/content/SharedPreferences;Landroid/preference/Preference;)Ljava/lang/String;

    move-result-object v2

    .line 175
    :goto_2
    const-string v3, ": "

    const-string/jumbo v4, "\uff1a"

    invoke-static {p0, v4, v3, v4}, Le/e/a/SettingsDisplay216;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 176
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_3

    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 179
    :goto_3
    invoke-virtual {p1}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v2

    .line 180
    if-eqz v2, :cond_4

    invoke-virtual {v0, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 181
    :cond_4
    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 183
    :cond_5
    instance-of v0, p1, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_6

    .line 184
    check-cast p1, Landroid/preference/PreferenceGroup;

    .line 185
    nop

    :goto_4
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    if-ge v1, v0, :cond_6

    .line 186
    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    invoke-static {p0, v0, p2}, Le/e/a/SettingsDisplay216;->visit(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/content/SharedPreferences;)V

    .line 185
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 188
    :cond_6
    return-void
.end method
