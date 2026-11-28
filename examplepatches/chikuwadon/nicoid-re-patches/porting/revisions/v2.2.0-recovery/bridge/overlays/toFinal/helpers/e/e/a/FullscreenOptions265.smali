.class public final Le/e/a/FullscreenOptions265;
.super Ljava/lang/Object;
.source "FullscreenOptions265.java"


# static fields
.field private static final FULL:I = 0x46f9

.field private static final SELECTED:Ljava/lang/String; = "nicoid_fullscreen262"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Menu;",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;",
            "Landroid/app/Activity;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    if-eqz p0, :cond_12

    if-eqz p1, :cond_12

    if-eqz p2, :cond_12

    .line 92
    invoke-static {p2}, Le/e/a/FullscreenOptions265;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p3

    const-string v0, "video_menu_visible_18169"

    const/4 v1, 0x1

    invoke-interface {p3, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p3

    .line 95
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v5, v2

    move v4, v3

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, 0x5

    const/16 v8, 0x46f9

    if-nez v6, :cond_f

    if-nez v4, :cond_1

    if-eqz v5, :cond_12

    :cond_1
    if-nez v5, :cond_2

    move-object v0, v2

    goto :goto_1

    .line 104
    :cond_2
    iget-object v0, v5, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    :goto_1
    if-eqz v5, :cond_4

    .line 106
    iget v6, v5, Le/e/a/ListActions$Action;->id:I

    invoke-interface {p0, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    if-nez v6, :cond_3

    .line 107
    iget v6, v5, Le/e/a/ListActions$Action;->id:I

    iget-object v9, v5, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    invoke-interface {p0, v3, v6, v3, v9}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v6

    .line 108
    :cond_3
    new-instance v9, Le/e/a/FullscreenOptions265$0;

    invoke-direct {v9, v0}, Le/e/a/FullscreenOptions265$0;-><init>(Ljava/lang/Runnable;)V

    .line 116
    invoke-interface {p1, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v5

    new-instance v10, Le/e/a/ListActions$Action;

    invoke-direct {v10, v6, v9}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, v5, v10}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 118
    new-instance v5, Le/e/a/FullscreenOptions265$1;

    invoke-direct {v5, v9}, Le/e/a/FullscreenOptions265$1;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {v6, v5}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    :cond_4
    if-eqz p3, :cond_12

    if-nez v4, :cond_5

    if-eqz v0, :cond_5

    .line 122
    invoke-static {p2}, Le/e/a/FullscreenOptions262;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p0, v3, v8, v3, p3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p3

    .line 123
    new-instance v4, Le/e/a/ListActions$Action;

    new-instance v5, Le/e/a/FullscreenOptions265$2;

    invoke-direct {v5, v0}, Le/e/a/FullscreenOptions265$2;-><init>(Ljava/lang/Runnable;)V

    invoke-direct {v4, p3, v5}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    :cond_5
    invoke-static {p2}, Le/e/a/FullscreenOptions265;->registerLabel(Landroid/content/Context;)V

    .line 133
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 134
    invoke-static {p2}, Le/e/a/FullscreenOptions265;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p3

    .line 135
    const-string v0, "video_menu_order_v1"

    invoke-interface {p3, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_6

    .line 137
    invoke-static {p2}, Le/e/a/MenuEditor120;->order(Landroid/content/Context;)Ljava/util/List;

    move-result-object p2

    .line 138
    new-instance p3, Le/e/a/FullscreenOptions265$3;

    invoke-direct {p3, p2}, Le/e/a/FullscreenOptions265$3;-><init>(Ljava/util/List;)V

    invoke-static {p1, p3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_6

    .line 146
    :cond_6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_7
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Le/e/a/ListActions$Action;

    iget p3, p2, Le/e/a/ListActions$Action;->id:I

    if-ne p3, v8, :cond_7

    move-object v2, p2

    :cond_8
    if-eqz v2, :cond_e

    .line 148
    invoke-interface {p1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move p2, v3

    .line 150
    :goto_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p3

    if-lt p2, p3, :cond_9

    const/4 p2, -0x1

    goto :goto_3

    .line 151
    :cond_9
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Le/e/a/ListActions$Action;

    iget p3, p3, Le/e/a/ListActions$Action;->id:I

    const/4 v0, 0x6

    if-ne p3, v0, :cond_d

    add-int/2addr p2, v1

    :goto_3
    if-gez p2, :cond_b

    move p3, v3

    .line 153
    :goto_4
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge p3, v0, :cond_b

    .line 154
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ListActions$Action;

    iget v0, v0, Le/e/a/ListActions$Action;->id:I

    if-ne v0, v7, :cond_a

    add-int/lit8 p2, p3, 0x1

    goto :goto_5

    :cond_a
    add-int/lit8 p3, p3, 0x1

    goto :goto_4

    :cond_b
    :goto_5
    if-gez p2, :cond_c

    move p2, v3

    .line 156
    :cond_c
    invoke-interface {p1, p2, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_6

    :cond_d
    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    .line 161
    :cond_e
    :goto_6
    invoke-interface {p0}, Landroid/view/Menu;->clear()V

    move p2, v3

    .line 162
    :goto_7
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p3

    if-ge p2, p3, :cond_12

    .line 163
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Le/e/a/ListActions$Action;

    .line 164
    iget v0, p3, Le/e/a/ListActions$Action;->id:I

    iget-object v1, p3, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    invoke-interface {p0, v3, v0, p2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    .line 165
    iget-boolean v1, p3, Le/e/a/ListActions$Action;->enabled:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 166
    iget-object v1, p3, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    .line 167
    new-instance v2, Le/e/a/FullscreenOptions265$4;

    invoke-direct {v2, p3, v1}, Le/e/a/FullscreenOptions265$4;-><init>(Le/e/a/ListActions$Action;Ljava/lang/Runnable;)V

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    add-int/lit8 p2, p2, 0x1

    goto :goto_7

    .line 95
    :cond_f
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/ListActions$Action;

    .line 96
    iget v9, v6, Le/e/a/ListActions$Action;->id:I

    if-ne v9, v8, :cond_10

    move v4, v1

    :cond_10
    if-nez v5, :cond_0

    .line 97
    iget-boolean v8, v6, Le/e/a/ListActions$Action;->enabled:Z

    if-eqz v8, :cond_0

    iget-object v8, v6, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    if-eqz v8, :cond_0

    .line 98
    iget v8, v6, Le/e/a/ListActions$Action;->id:I

    if-eq v8, v7, :cond_11

    const-string v7, "\u52d5\u753b\u518d\u751f"

    iget-object v8, v6, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_11

    .line 99
    const-string v7, "Play video"

    iget-object v8, v6, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_11

    .line 100
    const-string v7, "Video playback"

    iget-object v8, v6, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    :cond_11
    move-object v5, v6

    goto/16 :goto_0

    :cond_12
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;)V
    .registers 1

    .line 109
    invoke-static {}, Le/e/a/FullscreenOptions262;->armNormal()V

    .line 110
    :try_start_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 112
    invoke-static {}, Le/e/a/FullscreenOptions262;->cancelMenuChoice()V

    .line 113
    throw p0
.end method

.method static synthetic lambda$1(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 2

    .line 118
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$2(Ljava/lang/Runnable;)V
    .registers 1

    .line 124
    invoke-static {}, Le/e/a/FullscreenOptions262;->armMenu()V

    .line 125
    :try_start_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 127
    invoke-static {}, Le/e/a/FullscreenOptions262;->cancelMenuChoice()V

    .line 128
    throw p0
.end method

.method static synthetic lambda$3(Ljava/util/List;Le/e/a/ListActions$Action;Le/e/a/ListActions$Action;)I
    .registers 3

    .line 139
    iget p1, p1, Le/e/a/ListActions$Action;->id:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    iget p2, p2, Le/e/a/ListActions$Action;->id:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p0, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p0

    const p2, 0x7fffffff

    if-gez p1, :cond_0

    move p1, p2

    :cond_0
    if-gez p0, :cond_1

    move p0, p2

    .line 142
    :cond_1
    invoke-static {p1, p0}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$4(Le/e/a/ListActions$Action;Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 3

    .line 168
    iget-boolean p0, p0, Le/e/a/ListActions$Action;->enabled:Z

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method private static moveAfterInformation(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V
    .registers 12

    .line 57
    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    .line 58
    instance-of v0, p1, Landroid/preference/ListPreference;

    if-eqz v0, :cond_8

    .line 59
    check-cast p1, Landroid/preference/ListPreference;

    .line 60
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v0, :cond_8

    if-eqz v1, :cond_8

    .line 61
    array-length v2, v0

    array-length v3, v1

    if-ne v2, v3, :cond_8

    const/4 v2, -0x1

    const/4 v3, 0x0

    move v4, v2

    move v5, v3

    .line 63
    :goto_0
    array-length v6, v1

    const-string v7, "nicoid_fullscreen262"

    if-lt v5, v6, :cond_4

    if-ltz v2, :cond_8

    .line 73
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 74
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    move v5, v3

    .line 75
    :goto_1
    array-length v9, v0

    if-lt v5, v9, :cond_2

    .line 79
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ltz v4, :cond_1

    if-ge v2, v4, :cond_0

    move v1, v3

    goto :goto_2

    :cond_0
    const/4 v1, 0x1

    :goto_2
    add-int/2addr v4, v1

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 80
    :cond_1
    invoke-static {p0}, Le/e/a/FullscreenOptions262;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v6, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 81
    invoke-virtual {v8, v0, v7}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 82
    new-array p0, v3, [Ljava/lang/CharSequence;

    invoke-virtual {v6, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/CharSequence;

    invoke-virtual {p1, p0}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 83
    new-array p0, v3, [Ljava/lang/CharSequence;

    invoke-virtual {v8, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/CharSequence;

    invoke-virtual {p1, p0}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    return-void

    :cond_2
    if-eq v5, v2, :cond_3

    .line 77
    aget-object v9, v0, v5

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    aget-object v9, v1, v5

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 64
    :cond_4
    aget-object v6, v1, v5

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    .line 65
    aget-object v8, v0, v5

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    .line 66
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    move v2, v5

    .line 67
    :cond_5
    const-string v7, "\u52d5\u753b\u60c5\u5831"

    invoke-virtual {v8, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6

    const-string v7, "video information"

    invoke-virtual {v8, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 68
    const-string v7, "video info"

    invoke-virtual {v8, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6

    const-string/jumbo v7, "\u5f71\u7247\u8cc7\u8a0a"

    invoke-virtual {v8, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 69
    const-string/jumbo v7, "\u5f71\u7247\u4fe1\u606f"

    invoke-virtual {v8, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6

    const-string v7, "info"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 70
    const-string v7, "detail"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    :cond_6
    move v4, v5

    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    :cond_8
    return-void
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 28
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static registerLabel(Landroid/content/Context;)V
    .registers 9

    .line 175
    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/16 v1, 0x46f9

    .line 177
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 178
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0}, Le/e/a/FullscreenOptions262;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 180
    :cond_1
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 182
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_4

    if-nez v4, :cond_3

    .line 188
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0}, Le/e/a/FullscreenOptions262;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, v1, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    :cond_3
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V

    return-void

    .line 182
    :cond_4
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 183
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v2, v6, v7}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, 0x6

    if-ne v5, v6, :cond_2

    .line 185
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {p0}, Le/e/a/FullscreenOptions262;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v4, 0x1

    goto :goto_0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 14

    if-nez p0, :cond_0

    return-void

    .line 35
    :cond_0
    const-string v0, "videolist_tap"

    const-string v1, "intent_type"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    const/4 v5, 0x2

    if-lt v4, v5, :cond_1

    .line 50
    invoke-static {p0}, Le/e/a/FullscreenOptions262;->settingsCore(Landroid/preference/PreferenceActivity;)V

    .line 51
    invoke-static {p0, v0}, Le/e/a/FullscreenOptions265;->moveAfterInformation(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V

    .line 52
    invoke-static {p0, v1}, Le/e/a/FullscreenOptions265;->moveAfterInformation(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V

    .line 53
    invoke-static {p0}, Le/e/a/AppResume253;->refresh(Landroid/preference/PreferenceActivity;)V

    return-void

    .line 35
    :cond_1
    aget-object v5, v2, v4

    .line 36
    invoke-virtual {p0, v5}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    .line 37
    instance-of v6, v5, Landroid/preference/ListPreference;

    if-eqz v6, :cond_4

    .line 38
    check-cast v5, Landroid/preference/ListPreference;

    .line 39
    invoke-virtual {v5}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v7

    if-eqz v6, :cond_4

    if-eqz v7, :cond_4

    .line 40
    array-length v8, v6

    array-length v9, v7

    if-ne v8, v9, :cond_4

    .line 41
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 42
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    move v10, v3

    .line 43
    :goto_1
    array-length v11, v7

    if-lt v10, v11, :cond_2

    .line 47
    new-array v6, v3, [Ljava/lang/CharSequence;

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 48
    new-array v6, v3, [Ljava/lang/CharSequence;

    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 44
    :cond_2
    aget-object v11, v7, v10

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "nicoid_fullscreen262"

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_3

    .line 45
    aget-object v11, v6, v10

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    aget-object v11, v7, v10

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    :cond_4
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method
