.class public final Le/e/a/SettingsLabels252;
.super Ljava/lang/Object;
.source "SettingsLabels252.java"


# static fields
.field private static final DESCRIPTION:Ljava/lang/String; = "\u52d5\u753b\u753b\u9762\u306e\u9577\u62bc\u3057\u4e2d\u3060\u3051\u518d\u751f\u901f\u5ea6\u3092\u5909\u66f4\u3057\u307e\u3059\u3002\u6307\u3092\u96e2\u3059\u3068\u5143\u306b\u623b\u308a\u307e\u3059\uff08\u5de6\u7aef\u3067\u7121\u52b9\uff09"

.field private static final MAIN:Landroid/os/Handler;

.field private static final WATCHERS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/preference/PreferenceActivity;",
            "Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 15
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/SettingsLabels252;->MAIN:Landroid/os/Handler;

    .line 16
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SettingsLabels252;->WATCHERS:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static aContext(Landroid/preference/PreferenceGroup;)Landroid/content/Context;
    .registers 1

    .line 110
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    return-object p0
.end method

.method private static findLongPress(Landroid/preference/Preference;)Landroid/preference/Preference;
    .registers 5

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 96
    :cond_0
    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 97
    invoke-virtual {p0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 98
    const-string/jumbo v2, "\u9577\u62bc\u3057\u4e2d\u306e\u518d\u751f\u901f\u5ea6"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "Long-press playback speed"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 99
    const-string/jumbo v3, "\u9577\u6309\u64ad\u653e\u901f\u5ea6"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    return-object p0

    .line 101
    :cond_2
    instance-of v1, p0, Landroid/preference/PreferenceGroup;

    if-eqz v1, :cond_4

    .line 102
    check-cast p0, Landroid/preference/PreferenceGroup;

    const/4 v1, 0x0

    .line 103
    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 104
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    invoke-static {v2}, Le/e/a/SettingsLabels252;->findLongPress(Landroid/preference/Preference;)Landroid/preference/Preference;

    move-result-object v2

    if-eqz v2, :cond_3

    return-object v2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    return-object v0
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 5

    if-eqz p0, :cond_1

    .line 21
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 22
    invoke-static {p0}, Le/e/a/SettingsLabels252;->refresh(Landroid/preference/PreferenceActivity;)V

    .line 23
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 24
    sget-object v1, Le/e/a/SettingsLabels252;->WATCHERS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    if-eqz v2, :cond_0

    .line 25
    invoke-interface {v0, v2}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 26
    :cond_0
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 27
    new-instance v3, Le/e/a/SettingsLabels252$3;

    invoke-direct {v3, v2}, Le/e/a/SettingsLabels252$3;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 48
    invoke-interface {v0, v3}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 49
    invoke-virtual {v1, p0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method private static isLongPressKey(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Z
    .registers 4

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 52
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 53
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object p0

    invoke-static {p0}, Le/e/a/SettingsLabels252;->findLongPress(Landroid/preference/Preference;)Landroid/preference/Preference;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 54
    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v0
.end method

.method static synthetic lambda$0(Ljava/lang/ref/WeakReference;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 4

    .line 28
    const-string v0, "app_lang"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 33
    sget-object p2, Le/e/a/SettingsLabels252;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/SettingsLabels252$0;

    invoke-direct {v0, p0, p1}, Le/e/a/SettingsLabels252$0;-><init>(Ljava/lang/ref/WeakReference;Landroid/content/SharedPreferences;)V

    const-wide/16 p0, 0x78

    invoke-virtual {p2, v0, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 42
    :cond_0
    const-string p1, "mp4_tree_uri"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/preference/PreferenceActivity;

    invoke-static {p1, p2}, Le/e/a/SettingsLabels252;->isLongPressKey(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    .line 43
    :cond_1
    sget-object p1, Le/e/a/SettingsLabels252;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/SettingsLabels252$1;

    invoke-direct {p2, p0}, Le/e/a/SettingsLabels252$1;-><init>(Ljava/lang/ref/WeakReference;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/ref/WeakReference;Landroid/content/SharedPreferences;)V
    .registers 4

    .line 34
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/preference/PreferenceActivity;

    if-eqz p0, :cond_0

    .line 35
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 36
    const-string v0, "app_lang"

    const-string v1, "0"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 37
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->recreate()V

    :cond_0
    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/ref/WeakReference;)V
    .registers 2

    .line 44
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/preference/PreferenceActivity;

    if-eqz p0, :cond_0

    .line 45
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Le/e/a/SettingsLabels252;->refresh(Landroid/preference/PreferenceActivity;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$3(Landroid/preference/PreferenceActivity;)V
    .registers 2

    .line 91
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Le/e/a/SettingsCategories241;->updateLanguage(Landroid/preference/PreferenceActivity;)V

    :cond_0
    return-void
.end method

.method public static refresh(Landroid/preference/PreferenceActivity;)V
    .registers 7

    if-eqz p0, :cond_8

    .line 57
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_8

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_8

    .line 58
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "0"

    const-string v2, "app_lang"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 59
    invoke-static {p0}, Le/e/a/SettingsCategories241;->updateLanguage(Landroid/preference/PreferenceActivity;)V

    .line 61
    const-string v0, "mp4_tree_uri"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 63
    const-string v3, "\u52d5\u753b\u30fb\u97f3\u58f0\u306e\u4fdd\u5b58\u5148\u30d5\u30a9\u30eb\u30c0"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 64
    invoke-virtual {v0}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v3

    if-nez v3, :cond_0

    .line 65
    const-string v3, ""

    goto :goto_0

    :cond_0
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\n"

    const/4 v5, 0x2

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v1

    .line 66
    :goto_0
    const-string v4, "\u4fdd\u5b58\u3057\u305fMP4\u30fbMP3\u306f\u672c\u30a2\u30d7\u30ea\u3067\u306f\u518d\u751f\u3067\u304d\u307e\u305b\u3093\u3002\u5916\u90e8\u306e\u518d\u751f\u30a2\u30d7\u30ea\u3092\u3054\u5229\u7528\u304f\u3060\u3055\u3044"

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 67
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\n"

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_1
    invoke-virtual {v0, v4}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 70
    :cond_2
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-static {v0}, Le/e/a/SettingsLabels252;->findLongPress(Landroid/preference/Preference;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 71
    invoke-virtual {v0}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 72
    invoke-virtual {v0}, Landroid/preference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    const v4, 0xff1a

    .line 73
    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-gez v4, :cond_3

    const/16 v4, 0x3a

    .line 74
    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    :cond_3
    if-ltz v4, :cond_4

    .line 75
    invoke-virtual {v3, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_4
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 78
    :goto_1
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x18

    if-ge v3, v4, :cond_5

    .line 79
    const-string v3, ": "

    const-string/jumbo v4, "\uff1a"

    invoke-static {p0, v4, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 80
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\u52d5\u753b\u753b\u9762\u306e\u9577\u62bc\u3057\u4e2d\u3060\u3051\u518d\u751f\u901f\u5ea6\u3092\u5909\u66f4\u3057\u307e\u3059\u3002\u6307\u3092\u96e2\u3059\u3068\u5143\u306b\u623b\u308a\u307e\u3059\uff08\u5de6\u7aef\u3067\u7121\u52b9\uff09"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 83
    :cond_5
    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 84
    const-string v1, "\u30a2\u30d7\u30ea\u5168\u4f53\u306e\u8a00\u8a9e"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 85
    :cond_6
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 86
    invoke-static {v0}, Le/e/a/SettingsLabels252;->translateLanguageHeader(Landroid/preference/PreferenceGroup;)V

    .line 89
    :cond_7
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getListView()Landroid/widget/ListView;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 90
    new-instance v1, Le/e/a/SettingsLabels252$2;

    invoke-direct {v1, p0}, Le/e/a/SettingsLabels252$2;-><init>(Landroid/preference/PreferenceActivity;)V

    const-wide/16 v2, 0xb4

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/ListView;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_8
    return-void
.end method

.method private static translateLanguageHeader(Landroid/preference/PreferenceGroup;)V
    .registers 6

    const/4 v0, 0x0

    .line 112
    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    return-void

    .line 113
    :cond_0
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    .line 114
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_4

    .line 115
    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 116
    invoke-virtual {v1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 117
    const-string/jumbo v3, "\u8a00\u8a9e"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "Language"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string/jumbo v4, "\u8a9e\u8a00"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 119
    const-string v3, "nicoid\u306b\u3064\u3044\u3066"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "About nicoid"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 120
    const-string v4, "About nicoid Re"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string/jumbo v4, "\u95dc\u65bcnicoid"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 121
    const-string/jumbo v4, "\u95dc\u65bc nicoid Re"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 122
    :cond_1
    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 118
    :cond_2
    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 124
    :cond_3
    :goto_1
    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1}, Le/e/a/SettingsLabels252;->translateLanguageHeader(Landroid/preference/PreferenceGroup;)V

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
