.class public final Le/e/a/DefaultPanel219;
.super Ljava/lang/Object;
.source "DefaultPanel219.java"


# static fields
.field private static final EVENTS:Ljava/lang/StringBuilder;

.field private static final IDS:[Ljava/lang/String;

.field private static final KEY:Ljava/lang/String; = "nicoid_initial_player_panel"

.field private static final LABELS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 23
    const-string v0, "menu"

    const-string v1, "related"

    const-string v2, "info"

    const-string v3, "comments"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/DefaultPanel219;->IDS:[Ljava/lang/String;

    .line 24
    const-string v0, "\u30e1\u30cb\u30e5\u30fc"

    const-string/jumbo v1, "\u95a2\u9023\u52d5\u753b"

    const-string v2, "\u52d5\u753b\u60c5\u5831"

    const-string v3, "\u30b3\u30e1\u30f3\u30c8"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/DefaultPanel219;->LABELS:[Ljava/lang/String;

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v0, Le/e/a/DefaultPanel219;->EVENTS:Ljava/lang/StringBuilder;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized append(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const-class p0, Le/e/a/DefaultPanel219;

    monitor-enter p0

    .line 35
    :try_start_0
    sget-object v0, Le/e/a/DefaultPanel219;->EVENTS:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    monitor-exit p0

    return-object p1

    .line 36
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    if-nez p1, :cond_1

    const-string p1, ""

    :cond_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, "\n\nInitial player panel diagnostics:\n"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public static apply(Ljava/lang/Object;)V
    .registers 3

    if-nez p0, :cond_0

    return-void

    .line 92
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "E1"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 93
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 94
    instance-of v0, p0, Landroid/view/View;

    if-eqz v0, :cond_1

    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Le/e/a/DefaultPanel219;->applyPager(Landroid/view/View;)V

    return-void

    .line 95
    :cond_1
    const-string p0, "Legacy hook: E1 is not a View"

    invoke-static {p0}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Legacy hook failed: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    return-void
.end method

.method public static applyPager(Landroid/view/View;)V
    .registers 5

    if-nez p0, :cond_0

    .line 101
    const-string p0, "Player hook called with null pager"

    invoke-static {p0}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    return-void

    .line 102
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 103
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "nicoid_initial_player_panel"

    const-string v2, "info"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 104
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Player entry requested="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " class="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    .line 105
    invoke-static {v0}, Le/e/a/DefaultPanel219;->index(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "Ignoring unknown saved panel ID="

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    return-void

    .line 108
    :cond_1
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 109
    :cond_2
    new-instance v1, Le/e/a/DefaultPanel219$1;

    invoke-direct {v1, p0, v0}, Le/e/a/DefaultPanel219$1;-><init>(Landroid/view/View;Ljava/lang/String;)V

    const-wide/16 v2, 0x3c

    invoke-virtual {p0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 110
    new-instance v0, Le/e/a/DefaultPanel219$2;

    invoke-direct {v0, p0}, Le/e/a/DefaultPanel219$2;-><init>(Landroid/view/View;)V

    const-wide/16 v1, 0x3b6

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private static findStrip(Landroid/view/View;)Landroid/view/View;
    .registers 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 207
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.astuetz.PagerSlidingTabStrip"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object p0

    .line 208
    :cond_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_3

    .line 209
    check-cast p0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    .line 210
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 211
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Le/e/a/DefaultPanel219;->findStrip(Landroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_2

    return-object v2

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method private static findTabLabel(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 4

    .line 218
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 219
    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    .line 220
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 221
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Le/e/a/DefaultPanel219;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 223
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 224
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Le/e/a/DefaultPanel219;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    return-object p0

    .line 225
    :cond_2
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4

    .line 226
    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    .line 227
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 228
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1}, Le/e/a/DefaultPanel219;->findTabLabel(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_3

    return-object v1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    const/4 p0, 0x0

    return-object p0
.end method

.method private static fixedIndex(Ljava/lang/String;)I
    .registers 2

    .line 246
    const-string v0, "menu"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 247
    :cond_0
    const-string v0, "info"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x1

    return p0

    .line 248
    :cond_1
    const-string v0, "related"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p0, 0x3

    return p0

    .line 249
    :cond_2
    const-string v0, "comments"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 p0, 0x4

    return p0

    :cond_3
    const/4 p0, -0x1

    return p0
.end method

.method private static index(Ljava/lang/String;)I
    .registers 4

    const/4 v0, 0x0

    .line 75
    :goto_0
    sget-object v1, Le/e/a/DefaultPanel219;->IDS:[Ljava/lang/String;

    array-length v2, v1

    if-lt v0, v2, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    aget-object v1, v1, v0

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 7

    if-eqz p0, :cond_3

    .line 40
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_3

    .line 41
    const-string v0, "nicoid_initial_player_panel"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 43
    instance-of v2, v1, Landroid/preference/ListPreference;

    if-eqz v2, :cond_0

    check-cast v1, Landroid/preference/ListPreference;

    goto :goto_0

    :cond_0
    if-nez v1, :cond_3

    .line 46
    const-string v1, "player"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 47
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-nez v2, :cond_1

    const-string v1, "setting_whole"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 48
    :cond_1
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_3

    .line 49
    new-instance v2, Landroid/preference/ListPreference;

    invoke-direct {v2, p0}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    .line 50
    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    const/16 v3, 0x91

    .line 51
    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setOrder(I)V

    .line 52
    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    move-object v1, v2

    .line 54
    :goto_0
    const-string v2, "Default player panel"

    const-string/jumbo v3, "\u64ad\u653e\u5668\u9810\u8a2d\u9762\u677f"

    const-string v4, "\u52d5\u753b\u518d\u751f\u753b\u9762\u306e\u521d\u671f\u30d1\u30cd\u30eb"

    invoke-static {p0, v4, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 55
    sget-object v2, Le/e/a/DefaultPanel219;->IDS:[Ljava/lang/String;

    array-length v2, v2

    new-array v2, v2, [Ljava/lang/CharSequence;

    const/4 v3, 0x0

    .line 56
    :goto_1
    sget-object v4, Le/e/a/DefaultPanel219;->IDS:[Ljava/lang/String;

    array-length v5, v4

    if-lt v3, v5, :cond_2

    .line 57
    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 58
    invoke-virtual {v1, v4}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 59
    const-string v2, "info"

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 60
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 61
    invoke-static {p0, v1, v0}, Le/e/a/DefaultPanel219;->updateSummary(Landroid/content/Context;Landroid/preference/ListPreference;Ljava/lang/String;)V

    .line 62
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Settings panel selection loaded="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    .line 63
    new-instance v0, Le/e/a/DefaultPanel219$3;

    invoke-direct {v0, p0, v1}, Le/e/a/DefaultPanel219$3;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/ListPreference;)V

    invoke-virtual {v1, v0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    return-void

    .line 56
    :cond_2
    sget-object v4, Le/e/a/DefaultPanel219;->LABELS:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method private static varargs invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 265
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    const/4 v1, 0x1

    .line 266
    invoke-virtual {p2, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 267
    invoke-virtual {p2, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 269
    const-string p2, "getAdapter"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    const-string p2, "setCurrentItem"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 270
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Reflection "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " failed: "

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    :cond_2
    return-object v0
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/ListPreference;Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 5

    .line 64
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 65
    invoke-static {p2}, Le/e/a/DefaultPanel219;->index(Ljava/lang/String;)I

    move-result p3

    if-gez p3, :cond_0

    const/4 p0, 0x0

    return p0

    .line 67
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    const-string v0, "nicoid_initial_player_panel"

    invoke-interface {p3, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 68
    invoke-virtual {p1, p2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 69
    invoke-static {p0, p1, p2}, Le/e/a/DefaultPanel219;->updateSummary(Landroid/content/Context;Landroid/preference/ListPreference;Ljava/lang/String;)V

    .line 70
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Settings panel selection saved="

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/view/View;Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x0

    .line 109
    invoke-static {p0, p1, v0}, Le/e/a/DefaultPanel219;->select(Landroid/view/View;Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/view/View;)V
    .registers 2

    .line 110
    const-string v0, "safety"

    invoke-static {p0, v0}, Le/e/a/DefaultPanel219;->reveal(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$3(Landroid/view/View;ILjava/lang/String;)V
    .registers 6

    .line 156
    const-string v0, "getCurrentItem"

    invoke-static {p0, v0}, Le/e/a/DefaultPanel219;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v0

    .line 157
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    if-eq p1, v1, :cond_0

    .line 158
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Native reset to Video info; restoring saved choice="

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    const/4 p2, 0x2

    .line 159
    new-array p2, p2, [Ljava/lang/Class;

    const/4 v0, 0x0

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v2, p2, v0

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v0, p2, v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    filled-new-array {p1, v0}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "setCurrentItem"

    invoke-static {p0, v0, p2, p1}, Le/e/a/DefaultPanel219;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method static synthetic lambda$4(Landroid/view/View;)V
    .registers 2

    .line 187
    const-string v0, "one-argument setter"

    invoke-static {p0, v0}, Le/e/a/DefaultPanel219;->reveal(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$5(Landroid/view/View;)V
    .registers 2

    .line 197
    const-string v0, "native tab settled"

    invoke-static {p0, v0}, Le/e/a/DefaultPanel219;->reveal(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$6(Landroid/view/View;Ljava/lang/String;I)V
    .registers 3

    add-int/lit8 p2, p2, 0x1

    .line 243
    invoke-static {p0, p1, p2}, Le/e/a/DefaultPanel219;->select(Landroid/view/View;Ljava/lang/String;I)V

    return-void
.end method

.method private static declared-synchronized log(Ljava/lang/String;)V
    .registers 5

    const-class v0, Le/e/a/DefaultPanel219;

    monitor-enter v0

    .line 29
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 30
    const-string v2, "nicoid-panel"

    invoke-static {v2, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    sget-object p0, Le/e/a/DefaultPanel219;->EVENTS:Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 32
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/16 v2, 0x1388

    if-le v1, v2, :cond_0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit16 v1, v1, -0xfa0

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    :cond_0
    monitor-exit v0

    return-void

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method private static matches(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 254
    :cond_0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    const-string v1, " "

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 255
    const-string v1, "info"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    const-string p0, "\u52d5\u753b\u60c5\u5831"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "video information"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    .line 256
    const-string p0, "videoinfo"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string/jumbo p0, "\u5f71\u7247\u8cc7\u8a0a"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    return v0

    :cond_1
    return v2

    .line 257
    :cond_2
    const-string v1, "comments"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string p0, "\u30b3\u30e1\u30f3\u30c8"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_3

    const-string p0, "comment"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_3

    const-string/jumbo p0, "\u7559\u8a00"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_3

    return v0

    :cond_3
    return v2

    .line 258
    :cond_4
    const-string v1, "menu"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    const-string p0, "\u30e1\u30cb\u30e5\u30fc"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_5

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_5

    const-string/jumbo p0, "\u9078\u55ae"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_5

    return v0

    :cond_5
    return v2

    .line 259
    :cond_6
    const-string v1, "related"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    const-string/jumbo p0, "\u95a2\u9023"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_7

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_7

    const-string/jumbo p0, "\u76f8\u95dc"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_7

    return v0

    :cond_7
    return v2

    :cond_8
    return v0
.end method

.method private static number(Ljava/lang/Object;Ljava/lang/String;)I
    .registers 4

    const/4 v0, 0x0

    .line 275
    new-array v1, v0, [Ljava/lang/Class;

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, p1, v1, v0}, Le/e/a/DefaultPanel219;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 276
    instance-of p1, p0, Ljava/lang/Number;

    if-eqz p1, :cond_0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method private static retry(Landroid/view/View;Ljava/lang/String;ILjava/lang/String;)V
    .registers 6

    if-eqz p2, :cond_0

    const/16 v0, 0xa

    if-eq p2, v0, :cond_0

    const/16 v0, 0x1e

    if-eq p2, v0, :cond_0

    const/16 v0, 0x3b

    if-ne p2, v0, :cond_1

    .line 242
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Waiting for panel: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ", try="

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ", requested="

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    .line 243
    :cond_1
    new-instance p3, Le/e/a/DefaultPanel219$0;

    invoke-direct {p3, p0, p1, p2}, Le/e/a/DefaultPanel219$0;-><init>(Landroid/view/View;Ljava/lang/String;I)V

    const-wide/16 p1, 0x78

    invoke-virtual {p0, p3, p1, p2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private static reveal(Landroid/view/View;Ljava/lang/String;)V
    .registers 4

    if-eqz p0, :cond_0

    .line 235
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    .line 236
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Reveal initial panel: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", index="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "getCurrentItem"

    invoke-static {p0, p1}, Le/e/a/DefaultPanel219;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private static select(Landroid/view/View;Ljava/lang/String;I)V
    .registers 15

    .line 114
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    const/16 v1, 0x3c

    if-nez v0, :cond_1

    if-ge p2, v1, :cond_0

    .line 115
    const-string v0, "view detached"

    invoke-static {p0, p1, p2, v0}, Le/e/a/DefaultPanel219;->retry(Landroid/view/View;Ljava/lang/String;ILjava/lang/String;)V

    return-void

    .line 116
    :cond_0
    const-string p0, "Give up: detached after 60 tries"

    invoke-static {p0}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    return-void

    :cond_1
    const/4 v0, 0x0

    .line 119
    new-array v2, v0, [Ljava/lang/Class;

    new-array v3, v0, [Ljava/lang/Object;

    const-string v4, "getAdapter"

    invoke-static {p0, v4, v2, v3}, Le/e/a/DefaultPanel219;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 120
    const-string v3, "getCount"

    invoke-static {v2, v3}, Le/e/a/DefaultPanel219;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x1

    if-eqz v2, :cond_a

    const/4 v5, 0x4

    if-lt v3, v5, :cond_a

    .line 132
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v7, -0x1

    move v8, v0

    :goto_0
    if-lt v8, v3, :cond_6

    if-gez v7, :cond_2

    if-ne v3, v5, :cond_2

    .line 142
    invoke-static {p1}, Le/e/a/DefaultPanel219;->fixedIndex(Ljava/lang/String;)I

    move-result v7

    :cond_2
    if-gez v7, :cond_3

    .line 143
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "No matching panel "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", pages="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    return-void

    .line 144
    :cond_3
    const-string v2, "getCurrentItem"

    invoke-static {p0, v2}, Le/e/a/DefaultPanel219;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v5

    const/4 v8, 0x2

    .line 145
    new-array v8, v8, [Ljava/lang/Class;

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v9, v8, v0

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v0, v8, v4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v9, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    filled-new-array {v0, v9}, [Ljava/lang/Object;

    move-result-object v0

    const-string v9, "setCurrentItem"

    invoke-static {p0, v9, v8, v0}, Le/e/a/DefaultPanel219;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    invoke-static {p0, v2}, Le/e/a/DefaultPanel219;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v0

    .line 147
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v8, "Apply "

    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ": page "

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " -> "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", target="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    const-string v5, ", count="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", titles=["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    if-eq v0, v7, :cond_4

    if-ge p2, v1, :cond_4

    .line 149
    const-string v0, "page did not change"

    invoke-static {p0, p1, p2, v0}, Le/e/a/DefaultPanel219;->retry(Landroid/view/View;Ljava/lang/String;ILjava/lang/String;)V

    return-void

    :cond_4
    if-eqz p2, :cond_5

    if-ne p2, v4, :cond_b

    .line 153
    :cond_5
    new-instance p2, Le/e/a/DefaultPanel219$4;

    invoke-direct {p2, p0, v7, p1}, Le/e/a/DefaultPanel219$4;-><init>(Landroid/view/View;ILjava/lang/String;)V

    const-wide/16 v0, 0x28a

    invoke-virtual {p0, p2, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 134
    :cond_6
    new-array v9, v4, [Ljava/lang/Class;

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v10, v9, v0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v10

    const-string v11, "getPageTitle"

    invoke-static {v2, v11, v9, v10}, Le/e/a/DefaultPanel219;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-nez v9, :cond_7

    .line 135
    const-string v9, ""

    goto :goto_1

    :cond_7
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    :goto_1
    if-lez v8, :cond_8

    .line 136
    const-string v10, ", "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    :cond_8
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v10, 0x3d

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    invoke-static {p1, v9}, Le/e/a/DefaultPanel219;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_9

    move v7, v8

    :cond_9
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    :cond_a
    if-lt p2, v4, :cond_c

    .line 125
    invoke-static {p0, p1}, Le/e/a/DefaultPanel219;->selectNativeTab(Landroid/view/View;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_b
    return-void

    :cond_c
    if-ge p2, v1, :cond_d

    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "adapter count="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Le/e/a/DefaultPanel219;->retry(Landroid/view/View;Ljava/lang/String;ILjava/lang/String;)V

    return-void

    .line 127
    :cond_d
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Give up: native tabs unavailable, adapter count="

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    return-void
.end method

.method private static selectNativeTab(Landroid/view/View;Ljava/lang/String;)Z
    .registers 12

    .line 165
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/DefaultPanel219;->findStrip(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 167
    :cond_0
    invoke-static {v0, p1}, Le/e/a/DefaultPanel219;->findTabLabel(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_1

    return v1

    .line 169
    :cond_1
    invoke-static {p1}, Le/e/a/DefaultPanel219;->fixedIndex(Ljava/lang/String;)I

    move-result v3

    .line 170
    const-string v4, "getCurrentItem"

    invoke-static {p0, v4}, Le/e/a/DefaultPanel219;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v3, :cond_2

    .line 171
    const-string p1, "already selected"

    invoke-static {p0, p1}, Le/e/a/DefaultPanel219;->reveal(Landroid/view/View;Ljava/lang/String;)V

    return v6

    .line 176
    :cond_2
    invoke-static {p0, v4}, Le/e/a/DefaultPanel219;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v5

    const/4 v7, 0x2

    .line 177
    new-array v7, v7, [Ljava/lang/Class;

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v7, v1

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v7, v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    filled-new-array {v8, v9}, [Ljava/lang/Object;

    move-result-object v8

    const-string v9, "setCurrentItem"

    invoke-static {p0, v9, v7, v8}, Le/e/a/DefaultPanel219;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    invoke-static {p0, v4}, Le/e/a/DefaultPanel219;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v7

    if-ne v7, v3, :cond_3

    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Native panel selected without animation: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", from="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    .line 180
    const-string p1, "non-animated pager setter"

    invoke-static {p0, p1}, Le/e/a/DefaultPanel219;->reveal(Landroid/view/View;Ljava/lang/String;)V

    return v6

    .line 184
    :cond_3
    new-array v5, v6, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-static {p0, v9, v5, v7}, Le/e/a/DefaultPanel219;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    invoke-static {p0, v4}, Le/e/a/DefaultPanel219;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v5

    if-ne v5, v3, :cond_4

    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Native one-argument pager setter selected "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    .line 187
    new-instance p1, Le/e/a/DefaultPanel219$5;

    invoke-direct {p1, p0}, Le/e/a/DefaultPanel219$5;-><init>(Landroid/view/View;)V

    const-wide/16 v0, 0x17c

    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return v6

    :cond_4
    :goto_0
    if-eqz v2, :cond_7

    if-eq v2, v0, :cond_7

    .line 193
    invoke-virtual {v2}, Landroid/view/View;->isClickable()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-virtual {v2}, Landroid/view/View;->performClick()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Native tab selected "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", current="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0, v4}, Le/e/a/DefaultPanel219;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/DefaultPanel219;->log(Ljava/lang/String;)V

    .line 197
    new-instance p1, Le/e/a/DefaultPanel219$6;

    invoke-direct {p1, p0}, Le/e/a/DefaultPanel219$6;-><init>(Landroid/view/View;)V

    const-wide/16 v0, 0x1a4

    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return v6

    .line 200
    :cond_5
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .line 201
    instance-of v3, v2, Landroid/view/View;

    if-eqz v3, :cond_6

    check-cast v2, Landroid/view/View;

    goto :goto_0

    :cond_6
    const/4 v2, 0x0

    goto :goto_0

    :cond_7
    return v1
.end method

.method private static updateSummary(Landroid/content/Context;Landroid/preference/ListPreference;Ljava/lang/String;)V
    .registers 6

    .line 79
    invoke-static {p2}, Le/e/a/DefaultPanel219;->index(Ljava/lang/String;)I

    move-result p2

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 81
    :cond_0
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    aget-object p2, v0, p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 83
    const-string v0, "Choose the bottom panel shown when opening a video"

    .line 84
    const-string/jumbo v1, "\u9078\u64c7\u958b\u555f\u5f71\u7247\u6642\u9996\u5148\u986f\u793a\u7684\u5e95\u90e8\u9762\u677f"

    .line 82
    const-string v2, "\u52d5\u753b\u3092\u958b\u3044\u305f\u3068\u304d\u306b\u6700\u521d\u306b\u8868\u793a\u3059\u308b\u4e0b\u90e8\u30d1\u30cd\u30eb"

    invoke-static {p0, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, ": "

    const-string/jumbo v2, "\uff1a"

    invoke-static {p0, v2, p2, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method
