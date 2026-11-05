.class public final Le/e/a/CommentGraph215;
.super Ljava/lang/Object;
.source "CommentGraph215.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentGraph215$Binding;,
        Le/e/a/CommentGraph215$Overlay;,
        Le/e/a/CommentGraph215$Snapshot;
    }
.end annotation


# static fields
.field static final BINDINGS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/CommentGraph215$Binding;",
            ">;"
        }
    .end annotation
.end field

.field static final DATA:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/CommentGraph215$Snapshot;",
            ">;"
        }
    .end annotation
.end field

.field public static final GRAPH:Ljava/lang/String; = "seek_comment_density"

.field static final MAIN:Landroid/os/Handler;

.field static final REFRESH_PENDING:Ljava/util/concurrent/atomic/AtomicBoolean;

.field static final SHARED:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/CommentGraph215$Snapshot;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentGraph215;->BINDINGS:Ljava/util/Map;

    .line 8
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/CommentGraph215;->DATA:Ljava/util/Map;

    .line 9
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/CommentGraph215;->SHARED:Ljava/util/Map;

    .line 10
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    sput-object v0, Le/e/a/CommentGraph215;->REFRESH_PENDING:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/CommentGraph215;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Ljava/lang/Object;)V
    .registers 2

    .line 23
    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/CommentGraph215;->attachOwner(Ljava/lang/Object;Z)V

    return-void
.end method

.method static attachOwner(Ljava/lang/Object;Z)V
    .registers 6

    .line 25
    if-eqz p1, :cond_5

    :try_start_2
    const-string v0, "a"

    goto :goto_7

    :cond_5
    const-string v0, "x1"

    :goto_7
    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz p1, :cond_12

    const-string v1, "d"

    goto :goto_14

    :cond_12
    const-string v1, "Z"

    :goto_14
    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/SeekBar;

    if-nez v0, :cond_1d

    return-void

    :cond_1d
    if-nez v1, :cond_27

    const-string v1, "seekBar"

    invoke-static {v0, v1}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/SeekBar;

    :cond_27
    if-nez v1, :cond_2a

    return-void

    :cond_2a
    if-eqz p1, :cond_3a

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/View;

    if-eqz v2, :cond_3a

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    :cond_3a
    sget-object v2, Le/e/a/CommentGraph215;->BINDINGS:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/CommentGraph215$Binding;

    if-eqz v2, :cond_50

    iget-object v3, v2, Le/e/a/CommentGraph215$Binding;->root:Landroid/view/View;

    if-ne v3, v0, :cond_50

    iget-object v3, v2, Le/e/a/CommentGraph215$Binding;->seek:Landroid/widget/SeekBar;

    if-ne v3, v1, :cond_50

    invoke-virtual {v2}, Le/e/a/CommentGraph215$Binding;->refresh()V

    return-void

    :cond_50
    if-eqz v2, :cond_55

    invoke-virtual {v2}, Le/e/a/CommentGraph215$Binding;->dispose()V

    :cond_55
    new-instance v2, Le/e/a/CommentGraph215$Binding;

    invoke-direct {v2, p0, v0, v1, p1}, Le/e/a/CommentGraph215$Binding;-><init>(Ljava/lang/Object;Landroid/view/View;Landroid/widget/SeekBar;Z)V

    sget-object p1, Le/e/a/CommentGraph215;->BINDINGS:Ljava/util/Map;

    invoke-interface {p1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Le/e/a/CommentGraph215$Binding;->start()V
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_62} :catch_63

    goto :goto_7e

    :catch_63
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Comment graph attachment unavailable: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    :goto_7e
    return-void
.end method

.method public static attachPopup(Ljava/lang/Object;)V
    .registers 2

    .line 24
    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/CommentGraph215;->attachOwner(Ljava/lang/Object;Z)V

    return-void
.end method

.method static enabled(Landroid/content/Context;)Z
    .registers 3

    .line 12
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "seek_comment_density"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 6

    .line 29
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    :cond_4
    const/4 v1, 0x0

    :goto_5
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-lt v1, v2, :cond_c

    return-object v0

    :cond_c
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    if-ne v2, p1, :cond_13

    return-object p0

    :cond_13
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_20

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/CommentGraph215;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_20

    return-object v2

    :cond_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method

.method public static publish(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;)V"
        }
    .end annotation

    .line 15
    move-object/from16 v0, p0

    if-eqz v0, :cond_104

    if-nez p1, :cond_8

    goto/16 :goto_104

    .line 16
    :cond_8
    :try_start_8
    const-string v1, "modernWatch"

    invoke-static {v0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    const/4 v2, 0x0

    if-nez v1, :cond_15

    move-object v3, v2

    goto :goto_1b

    :cond_15
    const-string v3, "video"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    :goto_1b
    if-nez v3, :cond_1e

    return-void

    .line 17
    :cond_1e
    const-string v4, "d"

    invoke-static {v0, v4}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "duration"

    const-wide/16 v6, 0x0

    invoke-virtual {v3, v5, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    mul-long/2addr v8, v10

    invoke-static {v1, v4}, Le/e/a/DetailData;->matchesWatch(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e7

    cmp-long v1, v8, v6

    if-gtz v1, :cond_3f

    goto/16 :goto_e7

    .line 18
    :cond_3f
    const/16 v1, 0xb4

    new-array v1, v1, [I

    .line 19
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v11, 0x0

    move-object v5, v2

    move v10, v11

    :goto_4a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    const/4 v13, 0x1

    if-nez v12, :cond_9d

    .line 20
    new-instance v2, Le/e/a/CommentGraph215$Snapshot;

    move-object v5, v2

    move-object v6, v4

    move-wide v7, v8

    move-object v9, v1

    invoke-direct/range {v5 .. v10}, Le/e/a/CommentGraph215$Snapshot;-><init>(Ljava/lang/String;J[II)V

    sget-object v1, Le/e/a/CommentGraph215;->DATA:Ljava/util/Map;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Le/e/a/CommentGraph215;->SHARED:Ljava/util/Map;

    monitor-enter v1
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_62} :catch_e8

    :try_start_62
    sget-object v0, Le/e/a/CommentGraph215;->SHARED:Ljava/util/Map;

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_67
    sget-object v0, Le/e/a/CommentGraph215;->SHARED:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    const/16 v2, 0x8

    if-gt v0, v2, :cond_86

    monitor-exit v1
    :try_end_72
    .catchall {:try_start_62 .. :try_end_72} :catchall_9a

    :try_start_72
    sget-object v0, Le/e/a/CommentGraph215;->REFRESH_PENDING:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v11, v13}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_103

    sget-object v0, Le/e/a/CommentGraph215;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/CommentGraph215$1;

    invoke-direct {v1}, Le/e/a/CommentGraph215$1;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_84
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_84} :catch_e8

    .line 21
    goto/16 :goto_103

    .line 20
    :cond_86
    :try_start_86
    sget-object v0, Le/e/a/CommentGraph215;->SHARED:Ljava/util/Map;

    sget-object v2, Le/e/a/CommentGraph215;->SHARED:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_67

    :catchall_9a
    move-exception v0

    monitor-exit v1
    :try_end_9c
    .catchall {:try_start_86 .. :try_end_9c} :catchall_9a

    :try_start_9c
    throw v0

    .line 19
    :cond_9d
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    if-nez v12, :cond_a4

    goto :goto_4a

    :cond_a4
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v14

    if-eq v2, v14, :cond_b4

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v5, "d"

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    :cond_b4
    invoke-virtual {v5, v12}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    instance-of v14, v12, Ljava/lang/Number;

    if-nez v14, :cond_bd

    :cond_bc
    :goto_bc
    goto :goto_e3

    :cond_bd
    check-cast v12, Ljava/lang/Number;

    invoke-virtual {v12}, Ljava/lang/Number;->longValue()J

    move-result-wide v14

    const-wide/16 v16, 0xa

    mul-long v14, v14, v16

    cmp-long v12, v14, v6

    if-ltz v12, :cond_bc

    cmp-long v12, v14, v8

    if-lez v12, :cond_d0

    goto :goto_bc

    :cond_d0
    const-wide/16 v16, 0xb4

    mul-long v14, v14, v16

    div-long/2addr v14, v8

    const-wide/16 v6, 0xb3

    invoke-static {v6, v7, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    long-to-int v6, v6

    aget v7, v1, v6

    add-int/2addr v7, v13

    aput v7, v1, v6
    :try_end_e1
    .catch Ljava/lang/Exception; {:try_start_9c .. :try_end_e1} :catch_e8

    add-int/lit8 v10, v10, 0x1

    :goto_e3
    const-wide/16 v6, 0x0

    goto/16 :goto_4a

    .line 17
    :cond_e7
    :goto_e7
    return-void

    .line 21
    :catch_e8
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Comment graph unavailable: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    .line 22
    :cond_103
    :goto_103
    return-void

    .line 15
    :cond_104
    :goto_104
    return-void
.end method

.method static remove(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V
    .registers 2

    .line 28
    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object p0

    invoke-static {p0, p1}, Le/e/a/CommentGraph215;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object p0

    if-eqz p1, :cond_13

    if-eqz p0, :cond_13

    invoke-virtual {p0, p1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    :cond_13
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 5

    .line 26
    const-string v0, "seek_thumbnails"

    invoke-static {p0, v0}, Le/e/a/CommentGraph215;->remove(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V

    const-string v0, "seek_local_frequency"

    invoke-static {p0, v0}, Le/e/a/CommentGraph215;->remove(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V

    const-string v0, "seek_comment_density"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_13

    return-void

    :cond_13
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    const-string v2, "quality_mode"

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    invoke-static {v1, v2}, Le/e/a/CommentGraph215;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-nez v1, :cond_27

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    :cond_27
    new-instance v2, Landroid/preference/CheckBoxPreference;

    invoke-direct {v2, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    const-string v0, "\u30b3\u30e1\u30f3\u30c8\u306e\u76db\u308a\u4e0a\u304c\u308a"

    const-string v3, "Comment activity"

    invoke-static {p0, v0, v3}, Le/e/a/CommentGraph215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "\u53d6\u5f97\u6e08\u307f\u30b3\u30e1\u30f3\u30c8\u306e\u6642\u523b\u5206\u5e03\u3092\u30b7\u30fc\u30af\u30d0\u30fc\u306b\u8868\u793a\u3057\u307e\u3059\u3002\u52d5\u753b\u306e\u5168\u30b3\u30e1\u30f3\u30c8\u306e\u7d71\u8a08\u3068\u306f\u9650\u308a\u307e\u305b\u3093"

    const-string v3, "Show the time distribution of fetched comments on the seek bar; this may not cover all comments"

    invoke-static {p0, v0, v3}, Le/e/a/CommentGraph215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/CommentGraph215;->enabled(Landroid/content/Context;)Z

    move-result p0

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ja"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_17

    goto :goto_18

    :cond_17
    move-object p1, p2

    :goto_18
    return-object p1
.end method
