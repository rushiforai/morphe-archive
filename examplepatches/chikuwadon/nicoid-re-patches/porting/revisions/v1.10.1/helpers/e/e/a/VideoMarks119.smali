.class public final Le/e/a/VideoMarks119;
.super Ljava/lang/Object;
.source "VideoMarks119.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/VideoMarks119$Done;,
        Le/e/a/VideoMarks119$Mark;
    }
.end annotation


# static fields
.field static final IO:Ljava/util/concurrent/ExecutorService;

.field static final MAIN:Landroid/os/Handler;

.field static final MARKS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/VideoMarks119$Mark;",
            ">;"
        }
    .end annotation
.end field

.field static volatile cached:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static checked:J

.field static rootKey:Ljava/lang/String;

.field static scanning:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/VideoMarks119;->MAIN:Landroid/os/Handler;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/VideoMarks119;->IO:Ljava/util/concurrent/ExecutorService;

    .line 6
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/VideoMarks119;->MARKS:Ljava/util/Map;

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/VideoMarks119;->cached:Ljava/util/Set;

    const-string v0, ""

    sput-object v0, Le/e/a/VideoMarks119;->rootKey:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bind(Landroid/view/View;Ljava/lang/Object;)V
    .registers 9

    .line 9
    const-string v0, "videourl"

    invoke-static {p1, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const v0, 0x7f0800cd

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0801d3

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-nez v0, :cond_1b

    return-void

    :cond_1b
    sget-object v2, Le/e/a/VideoMarks119;->MARKS:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/VideoMarks119$Mark;

    if-nez v2, :cond_3e

    new-instance v2, Le/e/a/VideoMarks119$Mark;

    invoke-direct {v2, v0}, Le/e/a/VideoMarks119$Mark;-><init>(Landroid/view/View;)V

    sget-object v3, Le/e/a/VideoMarks119;->MARKS:Ljava/util/Map;

    invoke-interface {v3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    new-instance v3, Le/e/a/VideoMarks119$$ExternalSyntheticLambda12;

    invoke-direct {v3, v2}, Le/e/a/VideoMarks119$$ExternalSyntheticLambda12;-><init>(Le/e/a/VideoMarks119$Mark;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_3e
    if-nez p1, :cond_42

    const-string p1, ""

    :cond_42
    iput-object p1, v2, Le/e/a/VideoMarks119$Mark;->id:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v2, p1}, Le/e/a/VideoMarks119$Mark;->read(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result p1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v3, p1, v0}, Le/e/a/VideoMarks119$Mark;->setBounds(IIII)V

    instance-of p1, v1, Landroid/widget/TextView;

    if-eqz p1, :cond_d2

    check-cast v1, Landroid/widget/TextView;

    sget-object p1, Le/e/a/VideoMarks119;->cached:Ljava/util/Set;

    iget-object v0, v2, Le/e/a/VideoMarks119$Mark;->id:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_80

    new-instance v2, Le/e/a/VideoMarks119$Done;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const/16 v6, 0x10

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v2, v4, v5}, Le/e/a/VideoMarks119$Done;-><init>(II)V

    goto :goto_81

    :cond_80
    move-object v2, v0

    :goto_81
    invoke-virtual {v1, v0, v0, v2, v0}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v2, 0x4

    invoke-static {v0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    invoke-virtual {v1}, Landroid/widget/TextView;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz p1, :cond_d2

    if-nez v0, :cond_9c

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    :cond_9c
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u6e08\u307f"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_cf

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_cf
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_d2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/VideoMarks119;->scan(Landroid/content/Context;)V

    return-void
.end method

.method public static changed(Landroid/content/Context;)V
    .registers 3

    .line 12
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_1c

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Le/e/a/VideoMarks119;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/VideoMarks119$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0}, Le/e/a/VideoMarks119$$ExternalSyntheticLambda16;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_1c
    const-wide/16 v0, 0x0

    sput-wide v0, Le/e/a/VideoMarks119;->checked:J

    invoke-static {p0}, Le/e/a/VideoMarks119;->scan(Landroid/content/Context;)V

    invoke-static {}, Le/e/a/VideoMarks119;->refresh()V

    return-void
.end method

.method static synthetic lambda$0(Le/e/a/VideoMarks119$Mark;Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    const/4 p3, 0x0

    invoke-virtual {p0, p3, p3, p2, p1}, Le/e/a/VideoMarks119$Mark;->setBounds(IIII)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 2

    .line 10
    sget-object p0, Le/e/a/VideoMarks119;->MAIN:Landroid/os/Handler;

    new-instance p1, Le/e/a/VideoMarks119$$ExternalSyntheticLambda14;

    invoke-direct {p1}, Le/e/a/VideoMarks119$$ExternalSyntheticLambda14;-><init>()V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$3(Landroid/content/Context;)V
    .registers 1

    .line 12
    invoke-static {p0}, Le/e/a/VideoMarks119;->changed(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic lambda$4(Landroid/content/Context;)V
    .registers 10

    .line 13
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    :try_start_5
    invoke-static {p0}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_1f} :catch_7b

    :try_start_1f
    new-instance v1, Le/e/a/CacheFile;

    invoke-direct {v1, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_7e

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    array-length v3, v1

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_32
    if-lt v5, v3, :cond_53

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_38
    :goto_38
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3f

    goto :goto_7e

    :cond_3f
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p0, v2}, Le/e/a/CachedPlayback;->completedBytes(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_38

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_38

    :cond_53
    aget-object v6, v1, v5

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, ".json"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_76

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x5

    invoke-virtual {v7, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_76} :catch_79

    :cond_76
    add-int/lit8 v5, v5, 0x1

    goto :goto_32

    :catch_79
    move-exception v1

    goto :goto_7e

    :catch_7b
    move-exception p0

    const-string p0, ""

    :cond_7e
    :goto_7e
    sget-object v1, Le/e/a/VideoMarks119;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/VideoMarks119$$ExternalSyntheticLambda13;

    invoke-direct {v2, p0, v0}, Le/e/a/VideoMarks119$$ExternalSyntheticLambda13;-><init>(Ljava/lang/String;Ljava/util/Set;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$5(Ljava/lang/String;Ljava/util/Set;)V
    .registers 4

    .line 13
    sget-object v0, Le/e/a/VideoMarks119;->rootKey:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_13

    sget-object v0, Le/e/a/VideoMarks119;->cached:Ljava/util/Set;

    invoke-interface {p1, v0}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v0, 0x0

    goto :goto_14

    :cond_13
    const/4 v0, 0x1

    :goto_14
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p1

    sput-object p1, Le/e/a/VideoMarks119;->cached:Ljava/util/Set;

    sput-object p0, Le/e/a/VideoMarks119;->rootKey:Ljava/lang/String;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p0

    sput-wide p0, Le/e/a/VideoMarks119;->checked:J

    sput-boolean v1, Le/e/a/VideoMarks119;->scanning:Z

    if-eqz v0, :cond_92

    new-instance p0, Ljava/util/IdentityHashMap;

    invoke-direct {p0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {p0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object p0

    new-instance p1, Ljava/util/ArrayList;

    sget-object v0, Le/e/a/VideoMarks119;->MARKS:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_3e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_59

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_48
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_4f

    goto :goto_92

    :cond_4f
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/widget/BaseAdapter;

    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    goto :goto_48

    :cond_59
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_62

    :cond_61
    goto :goto_3e

    :cond_62
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    :goto_66
    if-eqz v0, :cond_72

    instance-of v1, v0, Landroid/widget/AbsListView;

    if-eqz v1, :cond_6d

    goto :goto_72

    :cond_6d
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_66

    :cond_72
    :goto_72
    instance-of v1, v0, Landroid/widget/AbsListView;

    if-eqz v1, :cond_61

    check-cast v0, Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ListAdapter;

    instance-of v1, v0, Landroid/widget/HeaderViewListAdapter;

    if-eqz v1, :cond_88

    check-cast v0, Landroid/widget/HeaderViewListAdapter;

    invoke-virtual {v0}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    :cond_88
    instance-of v1, v0, Landroid/widget/BaseAdapter;

    if-eqz v1, :cond_61

    check-cast v0, Landroid/widget/BaseAdapter;

    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3e

    :cond_92
    :goto_92
    return-void
.end method

.method public static record(Ljava/lang/Object;Z)V
    .registers 11

    .line 8
    if-eqz p1, :cond_5

    :try_start_2
    const-string v0, "e"

    goto :goto_7

    :cond_5
    const-string v0, "a0"

    :goto_7
    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz p1, :cond_11

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    goto :goto_19

    :cond_11
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    :goto_19
    if-eqz p1, :cond_1e

    const-string p1, "f"

    goto :goto_20

    :cond_1e
    const-string p1, "b0"

    :goto_20
    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v2, "getCurrentPosition"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {p1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v2, "getDuration"

    new-array v6, v3, [Ljava/lang/Class;

    invoke-virtual {p1, v2, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    const-wide/16 v6, 0x0

    cmp-long p1, v4, v6

    if-lez p1, :cond_a7

    cmp-long p1, v2, v6

    if-lez p1, :cond_a7

    if-eqz p0, :cond_a7

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_70

    goto :goto_a7

    :cond_70
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-static {v1}, Le/e/a/VideoMarks119;->watched(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    sub-long v0, v2, v4

    const-wide/16 v6, 0x3e8

    cmp-long v8, v0, v6

    if-gtz v8, :cond_85

    move-wide v4, v2

    :cond_85
    invoke-interface {p1, p0, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "_duration"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {}, Le/e/a/VideoMarks119;->refresh()V
    :try_end_a6
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_a6} :catch_a8

    goto :goto_a9

    :cond_a7
    :goto_a7
    return-void

    :catch_a8
    move-exception p0

    :goto_a9
    return-void
.end method

.method static refresh()V
    .registers 3

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Le/e/a/VideoMarks119;->MARKS:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_16

    return-void

    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-eqz v2, :cond_f

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/VideoMarks119$Mark;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Le/e/a/VideoMarks119$Mark;->read(Landroid/content/Context;)V

    goto :goto_f
.end method

.method static scan(Landroid/content/Context;)V
    .registers 6

    .line 13
    sget-boolean v0, Le/e/a/VideoMarks119;->scanning:Z

    if-nez v0, :cond_23

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sget-wide v2, Le/e/a/VideoMarks119;->checked:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    cmp-long v4, v0, v2

    if-gez v4, :cond_12

    goto :goto_23

    :cond_12
    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/VideoMarks119;->scanning:Z

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Le/e/a/VideoMarks119;->IO:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/VideoMarks119$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0}, Le/e/a/VideoMarks119$$ExternalSyntheticLambda11;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_23
    :goto_23
    return-void
.end method

.method static settings(Landroid/preference/PreferenceActivity;)V
    .registers 4

    .line 10
    const-string v0, "show_watch_progress"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    const-string v1, "setting_whole"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-nez v2, :cond_14

    return-void

    :cond_14
    new-instance v2, Landroid/preference/CheckBoxPreference;

    invoke-direct {v2, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    const-string p0, "\u30b5\u30e0\u30cd\u30a4\u30eb\u306b\u8996\u8074\u9032\u6357\u3092\u8868\u793a"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    const/16 p0, 0x140

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOrder(I)V

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    new-instance p0, Le/e/a/VideoMarks119$$ExternalSyntheticLambda15;

    invoke-direct {p0}, Le/e/a/VideoMarks119$$ExternalSyntheticLambda15;-><init>()V

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    return-void
.end method

.method static watched(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 7
    const-string v0, "nicoid-watched"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method
