.class public final Le/e/a/CastControls218;
.super Ljava/lang/Object;
.source "CastControls218.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CastControls218$Clock;,
        Le/e/a/CastControls218$Disconnect;
    }
.end annotation


# static fields
.field private static final BUTTON:Ljava/lang/String; = "nicoid-cast-disconnect"

.field private static final COMMENTS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field public static final QUALITY:Ljava/lang/String; = "cast_fixed_quality"

.field private static final SHOWN:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 19
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/CastControls218;->MAIN:Landroid/os/Handler;

    .line 20
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CastControls218;->COMMENTS:Ljava/util/WeakHashMap;

    .line 21
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CastControls218;->SHOWN:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Ljava/lang/String;)Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    invoke-static {p0}, Le/e/a/CastControls218;->state(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-static {p0, p1}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2()Ljava/util/WeakHashMap;
    .registers 1

    .line 20
    sget-object v0, Le/e/a/CastControls218;->COMMENTS:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$3(Ljava/lang/Object;)V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 56
    invoke-static {p0}, Le/e/a/CastControls218;->showComments(Ljava/lang/Object;)V

    return-void
.end method

.method private static comments(Ljava/lang/Object;)Ljava/util/ArrayList;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/ArrayList<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 44
    sget-object p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->E:Le/e/a/v;

    const/4 v0, 0x0

    if-nez p0, :cond_6

    return-object v0

    .line 47
    :cond_6
    sget-object v1, Le/e/a/CastControls218;->COMMENTS:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_10
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2c

    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "b"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    return-object p0

    .line 47
    :cond_2c
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 48
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_39

    goto :goto_10

    .line 50
    :cond_39
    const-string v4, "k"

    invoke-static {v3, v4}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_43

    move-object v4, v0

    goto :goto_49

    .line 51
    :cond_43
    const-string v5, "a"

    invoke-static {v4, v5}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 52
    :goto_49
    instance-of v5, v4, Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    if-eqz v5, :cond_10

    const-string v5, "u"

    invoke-static {v4, v5}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v3, :cond_10

    const-string v3, "I"

    invoke-static {v3}, Le/e/a/CastControls218;->state(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    const-string v5, "t"

    invoke-static {v4, v5}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method public static current(Ljava/lang/Object;)Z
    .registers 4

    const/4 v0, 0x0

    if-eqz p0, :cond_33

    .line 27
    :try_start_3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "D"

    invoke-static {v2}, Le/e/a/CastControls218;->state(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "x0"

    invoke-static {p0, v2}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    const-string v1, "I"

    invoke-static {v1}, Le/e/a/CastControls218;->state(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "b0"

    invoke-static {p0, v2}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_2f} :catch_33

    if-eqz p0, :cond_33

    const/4 p0, 0x1

    return p0

    :catch_33
    :cond_33
    return v0
.end method

.method private static fixed(Ljava/lang/Object;)I
    .registers 4

    const/4 v0, -0x1

    .line 98
    :try_start_1
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "t"

    invoke-static {p0, v2}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    return v0

    .line 99
    :cond_10
    const-string v1, "K"

    invoke-static {p0, v1}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "cast_fixed_quality"

    const-string v2, ""

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 100
    const-string v1, "highest"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    const p0, 0x7fffffff

    return p0

    .line 101
    :cond_30
    const-string v1, "720"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_48

    const-string v1, "480"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_48

    const-string v1, "360"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_55

    :cond_48
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4c} :catch_4d

    return p0

    :catch_4d
    move-exception p0

    .line 102
    const-string v1, "nicoid-cast"

    const-string v2, "Cannot read Cast quality"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_55
    return v0
.end method

.method private static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static outputs(Ljava/lang/Object;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 108
    invoke-static {p0}, Le/e/a/CastControls218;->fixed(Ljava/lang/Object;)I

    move-result p0

    if-gez p0, :cond_8

    const/4 p0, 0x0

    return-object p0

    .line 109
    :cond_8
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {p1, p3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method public static phone(Landroid/app/Activity;)Z
    .registers 1

    if-eqz p0, :cond_e

    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_e

    sget-boolean p0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->D:Z

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public static pickVideo(Ljava/lang/Object;Lorg/json/JSONArray;I)Ljava/lang/String;
    .registers 3

    .line 105
    invoke-static {p0}, Le/e/a/CastControls218;->fixed(Ljava/lang/Object;)I

    move-result p0

    if-gez p0, :cond_b

    invoke-static {p1, p2}, Le/e/a/Playback214;->pickVideo(Lorg/json/JSONArray;I)Ljava/lang/String;

    move-result-object p0

    goto :goto_f

    :cond_b
    invoke-static {p1, p0}, Le/e/a/Playback214;->choose(Lorg/json/JSONArray;I)Ljava/lang/String;

    move-result-object p0

    :goto_f
    return-object p0
.end method

.method public static player(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 83
    invoke-static {p0}, Le/e/a/CastControls218;->current(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    new-instance v0, Le/e/a/CastControls218$Clock;

    invoke-direct {v0, p0}, Le/e/a/CastControls218$Clock;-><init>(Ljava/lang/Object;)V

    goto :goto_12

    :cond_c
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    :goto_12
    return-object v0
.end method

.method public static publish(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;)V"
        }
    .end annotation

    .line 32
    :try_start_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v1, "t"

    invoke-static {p0, v1}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    return-void

    .line 33
    :cond_f
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 34
    sget-object p1, Le/e/a/CastControls218;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/CastControls218$1;

    invoke-direct {v1, p0, v0}, Le/e/a/CastControls218$1;-><init>(Ljava/lang/Object;Ljava/util/ArrayList;)V

    invoke-virtual {p1, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1e} :catch_1f

    goto :goto_27

    :catch_1f
    move-exception p0

    .line 41
    const-string p1, "nicoid-cast"

    const-string v0, "Cannot publish Cast comments"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_27
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 11

    .line 112
    const-string v0, "cast_fixed_quality"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    .line 113
    :cond_9
    const-string v1, "google_cast"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-nez v2, :cond_14

    return-void

    .line 114
    :cond_14
    new-instance v2, Landroid/preference/ListPreference;

    invoke-direct {v2, p0}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    .line 115
    const-string v0, "Fixed Cast quality"

    const-string v3, "\u56fa\u5b9a Cast \u756b\u8cea"

    const-string v4, "Cast\u306e\u753b\u8cea\u56fa\u5b9a"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v0, 0x5

    .line 116
    new-array v3, v0, [Ljava/lang/CharSequence;

    const-string v4, "Automatic"

    const-string v5, "\u81ea\u52d5"

    invoke-static {p0, v5, v4, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "Highest (fixed)"

    const-string v6, "\u6700\u9ad8\u756b\u8cea\uff08\u56fa\u5b9a\uff09"

    const-string v7, "\u6700\u9ad8\u753b\u8cea\uff08\u56fa\u5b9a\uff09"

    invoke-static {p0, v7, v4, v6}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-string v4, "720p"

    const/4 v7, 0x2

    aput-object v4, v3, v7

    const-string v4, "480p"

    const/4 v8, 0x3

    aput-object v4, v3, v8

    const-string v4, "360p"

    const/4 v9, 0x4

    aput-object v4, v3, v9

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 117
    new-array v0, v0, [Ljava/lang/CharSequence;

    const-string v3, ""

    aput-object v3, v0, v5

    const-string v4, "highest"

    aput-object v4, v0, v6

    const-string v4, "720"

    aput-object v4, v0, v7

    const-string v4, "480"

    aput-object v4, v0, v8

    const-string v4, "360"

    aput-object v4, v0, v9

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 118
    const-string v0, "Applies to the next Cast playback. Fixes the best available quality up to the selected resolution; slow connections buffer without lowering quality"

    const-string v3, "\u4e0b\u6b21 Cast \u64ad\u653e\u751f\u6548\u3002\u56fa\u5b9a\u70ba\u6240\u9078\u89e3\u6790\u5ea6\u4ee5\u4e0b\u53ef\u7528\u7684\u6700\u9ad8\u756b\u8cea\uff0c\u9023\u7dda\u7de9\u6162\u6642\u7de9\u885d\u800c\u4e0d\u964d\u4f4e\u756b\u8cea"

    const-string v4, "\u6b21\u306eCast\u518d\u751f\u304b\u3089\u53cd\u6620\u3002\u6307\u5b9a\u89e3\u50cf\u5ea6\u4ee5\u4e0b\u3067\u5229\u7528\u53ef\u80fd\u306a\u6700\u9ad8\u753b\u8cea\u306b\u56fa\u5b9a\u3057\u3001\u901a\u4fe1\u304c\u9045\u3044\u5834\u5408\u306f\u753b\u8cea\u3092\u4e0b\u3052\u305a\u306b\u30d0\u30c3\u30d5\u30a1\u30ea\u30f3\u30b0\u3057\u307e\u3059"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 119
    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method private static showComments(Ljava/lang/Object;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 57
    invoke-static {p0}, Le/e/a/CastControls218;->current(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 58
    :cond_7
    invoke-static {p0}, Le/e/a/CastControls218;->comments(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_32

    .line 59
    sget-object v1, Le/e/a/CastControls218;->SHOWN:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v0, :cond_16

    goto :goto_32

    .line 60
    :cond_16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/util/ArrayList;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-string v5, "b"

    invoke-virtual {v2, v5, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v6

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_32
    :goto_32
    return-void
.end method

.method private static state(Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    const-class v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static update(Ljava/lang/Object;)V
    .registers 10

    .line 65
    const-string v0, "nicoid-cast-disconnect"

    :try_start_2
    const-string v1, "x1"

    invoke-static {p0, v1}, Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-nez v1, :cond_d

    return-void

    .line 66
    :cond_d
    const-string v2, "topmenulay"

    invoke-static {v1, v2}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    if-nez v2, :cond_18

    return-void

    .line 67
    :cond_18
    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    .line 68
    invoke-static {p0}, Le/e/a/CastControls218;->current(Ljava/lang/Object;)Z

    move-result v4

    const/16 v5, 0x8

    const/4 v6, 0x0

    if-eqz v4, :cond_7b

    if-nez v3, :cond_7b

    .line 70
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v3, Landroid/widget/ImageButton;

    invoke-direct {v3, v1}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 71
    const-string v0, "Cast\u306e\u63a5\u7d9a\u89e3\u9664"

    const-string v7, "Disconnect Cast"

    const-string v8, "\u4e2d\u65b7 Cast \u9023\u7dda"

    invoke-static {v1, v0, v7, v8}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 72
    invoke-virtual {v3, v6}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setElevation(F)V

    .line 73
    const/4 v0, 0x4

    invoke-static {v1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v3, v0, v0, v0, v0}, Landroid/widget/ImageButton;->setPadding(IIII)V

    invoke-virtual {v3, v6}, Landroid/widget/ImageButton;->setMinimumWidth(I)V

    invoke-virtual {v3, v6}, Landroid/widget/ImageButton;->setMinimumHeight(I)V

    .line 74
    new-instance v0, Le/e/a/CastControls218$Disconnect;

    invoke-static {v1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v7

    invoke-direct {v0, v7}, Le/e/a/CastControls218$Disconnect;-><init>(I)V

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 75
    new-instance v0, Le/e/a/CastControls218$2;

    invoke-direct {v0, v1}, Le/e/a/CastControls218$2;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/16 v0, 0x28

    .line 76
    invoke-static {v1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_7b
    if-eqz v3, :cond_83

    if-eqz v4, :cond_80

    const/4 v5, 0x0

    .line 78
    :cond_80
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 79
    :cond_83
    invoke-static {p0}, Le/e/a/CastControls218;->showComments(Ljava/lang/Object;)V
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_86} :catch_87

    goto :goto_8f

    :catch_87
    move-exception p0

    .line 80
    const-string v0, "nicoid-cast"

    const-string v1, "Cannot update Cast controls"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_8f
    return-void
.end method
