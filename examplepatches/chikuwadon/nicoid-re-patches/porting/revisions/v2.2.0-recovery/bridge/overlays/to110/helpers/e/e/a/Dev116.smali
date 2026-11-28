.class public final Le/e/a/Dev116;
.super Ljava/lang/Object;
.source "Dev116.java"


# static fields
.field private static final DIRTY_ADAPTERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/widget/BaseAdapter;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final IMAGES:Ljava/util/concurrent/ExecutorService;

.field private static final LISTENERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/preference/PreferenceActivity;",
            "Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final PENDING:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Landroid/widget/BaseAdapter;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final REFRESH_ARTWORK:Ljava/lang/Runnable;

.field private static final THUMBNAILS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final VIDEO_ID:Ljava/util/regex/Pattern;

.field private static refreshScheduled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 43
    new-instance v0, Le/e/a/Dev116$3;

    invoke-direct {v0}, Le/e/a/Dev116$3;-><init>()V

    const/4 v1, 0x2

    invoke-static {v1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/Dev116;->IMAGES:Ljava/util/concurrent/ExecutorService;

    .line 46
    new-instance v0, Le/e/a/Dev116$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x40

    invoke-direct {v0, v3, v1, v2}, Le/e/a/Dev116$1;-><init>(IFZ)V

    sput-object v0, Le/e/a/Dev116;->THUMBNAILS:Ljava/util/Map;

    .line 49
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/Dev116;->MAIN:Landroid/os/Handler;

    .line 50
    const-string v0, "(?:sm|so|nm|ss)[0-9]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/Dev116;->VIDEO_ID:Ljava/util/regex/Pattern;

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/Dev116;->PENDING:Ljava/util/Map;

    .line 53
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Dev116;->DIRTY_ADAPTERS:Ljava/util/Map;

    .line 55
    new-instance v0, Le/e/a/Dev116$4;

    invoke-direct {v0}, Le/e/a/Dev116$4;-><init>()V

    sput-object v0, Le/e/a/Dev116;->REFRESH_ARTWORK:Ljava/lang/Runnable;

    .line 63
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Dev116;->LISTENERS:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static collectImages(Landroid/view/View;Ljava/util/List;)V
    .registers 5
    .param p0, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Landroid/widget/ImageView;",
            ">;)V"
        }
    .end annotation

    .line 266
    .local p1, "found":Ljava/util/List;, "Ljava/util/List<Landroid/widget/ImageView;>;"
    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/widget/ImageView;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 267
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    .line 268
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    .line 269
    .local v0, "g":Landroid/view/ViewGroup;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p1}, Le/e/a/Dev116;->collectImages(Landroid/view/View;Ljava/util/List;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 271
    .end local v0    # "g":Landroid/view/ViewGroup;
    .end local v1    # "i":I
    :cond_1
    :goto_1
    return-void
.end method

.method public static drawer(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 10
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 124
    const/4 v0, 0x0

    if-eqz p0, :cond_6

    if-eqz p1, :cond_6

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x102002c

    if-eq v1, v2, :cond_0

    goto/16 :goto_6

    .line 125
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "nicoid_local_playlists"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 126
    .local v1, "playlist":Z
    const/4 v2, 0x1

    if-nez v1, :cond_2

    .line 127
    :try_start_0
    const-string v3, "e.e.a.LocalPlaylists"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "PAGES"

    invoke-static {v3, v4}, Le/e/a/Dev112;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 128
    .local v3, "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    if-eqz v3, :cond_1

    invoke-interface {v3, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    move v1, v4

    .line 129
    .end local v3    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    :goto_1
    goto :goto_2

    :catch_0
    move-exception v3

    goto :goto_1

    .line 130
    :cond_2
    :goto_2
    if-nez v1, :cond_3

    return v0

    .line 132
    :cond_3
    const/4 v3, 0x0

    .line 133
    .local v3, "toggle":Ljava/lang/Object;
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .local v4, "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_3
    if-eqz v4, :cond_4

    .line 135
    :try_start_2
    const-string v5, "v"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 136
    .local v5, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v5, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 137
    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-object v3, v6

    .line 138
    goto :goto_4

    .line 139
    .end local v5    # "f":Ljava/lang/reflect/Field;
    :catch_1
    move-exception v5

    .line 133
    :try_start_3
    invoke-virtual {v4}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    move-object v4, v5

    goto :goto_3

    .line 141
    .end local v4    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4
    :goto_4
    if-eqz v3, :cond_5

    .line 142
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "a"

    new-array v6, v2, [Ljava/lang/Class;

    const-class v7, Landroid/view/MenuItem;

    aput-object v7, v6, v0

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 143
    .local v4, "handle":Ljava/lang/reflect/Method;
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    new-array v6, v2, [Ljava/lang/Object;

    aput-object p1, v6, v0

    invoke-virtual {v4, v3, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    if-eqz v5, :cond_5

    return v2

    .line 145
    .end local v3    # "toggle":Ljava/lang/Object;
    .end local v4    # "handle":Ljava/lang/reflect/Method;
    :cond_5
    goto :goto_5

    :catch_2
    move-exception v2

    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "nicoid-navigation"

    const-string v4, "Native drawer toggle unavailable, delegating to Activity"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 147
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_5
    return v0

    .line 124
    .end local v1    # "playlist":Z
    :cond_6
    :goto_6
    return v0
.end method

.method private static fallback(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "id"    # Ljava/lang/String;

    .line 309
    const-string v0, "\\D"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 310
    .local v0, "digits":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://nicovideo.cdn.nimg.jp/thumbnails/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".M"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static firstImage(Landroid/view/View;)Landroid/widget/ImageView;
    .registers 4
    .param p0, "v"    # Landroid/view/View;

    .line 255
    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/widget/ImageView;

    return-object v0

    .line 256
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    .line 257
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    .line 258
    .local v0, "g":Landroid/view/ViewGroup;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 259
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Le/e/a/Dev116;->firstImage(Landroid/view/View;)Landroid/widget/ImageView;

    move-result-object v2

    .line 260
    .local v2, "child":Landroid/widget/ImageView;
    if-eqz v2, :cond_1

    return-object v2

    .line 258
    .end local v2    # "child":Landroid/widget/ImageView;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 263
    .end local v0    # "g":Landroid/view/ViewGroup;
    .end local v1    # "i":I
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method private static invokeOld(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p0, "host"    # Landroid/app/Activity;
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "id"    # Ljava/lang/String;

    .line 118
    :try_start_0
    const-class v0, Le/e/a/Dev112;

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/app/Activity;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/String;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 119
    .local v0, "m":Ljava/lang/reflect/Method;
    invoke-virtual {v0, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v4

    aput-object p2, v1, v5

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    nop

    .end local v0    # "m":Ljava/lang/reflect/Method;
    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "nicoid-playlist"

    const-string v2, "Playlist action failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 121
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static synthetic lambda$playlistMenu$2(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3
    .param p0, "host"    # Landroid/app/Activity;
    .param p1, "selected"    # Ljava/lang/String;

    .line 99
    const-string v0, "moveVideo"

    invoke-static {p0, v0, p1}, Le/e/a/Dev116;->invokeOld(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$playlistMenu$3(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 3
    .param p0, "onMove"    # Ljava/lang/Runnable;
    .param p1, "i"    # Landroid/view/MenuItem;

    .line 100
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$playlistMenu$4(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3
    .param p0, "host"    # Landroid/app/Activity;
    .param p1, "selected"    # Ljava/lang/String;

    .line 109
    const-string v0, "confirmRemove"

    invoke-static {p0, v0, p1}, Le/e/a/Dev116;->invokeOld(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$playlistMenu$5(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 3
    .param p0, "onRemove"    # Ljava/lang/Runnable;
    .param p1, "i"    # Landroid/view/MenuItem;

    .line 110
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$playlistThumbnail$6(Ljava/util/List;)V
    .registers 6
    .param p0, "adapters"    # Ljava/util/List;

    .line 214
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 215
    .local v1, "reference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/widget/BaseAdapter;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/BaseAdapter;

    .line 216
    .local v2, "waiting":Landroid/widget/BaseAdapter;
    if-eqz v2, :cond_0

    sget-object v3, Le/e/a/Dev116;->DIRTY_ADAPTERS:Ljava/util/Map;

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    .end local v1    # "reference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/widget/BaseAdapter;>;"
    .end local v2    # "waiting":Landroid/widget/BaseAdapter;
    :cond_0
    goto :goto_0

    .line 218
    :cond_1
    sget-boolean v0, Le/e/a/Dev116;->refreshScheduled:Z

    if-nez v0, :cond_2

    sget-object v0, Le/e/a/Dev116;->DIRTY_ADAPTERS:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 219
    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/Dev116;->refreshScheduled:Z

    .line 220
    sget-object v0, Le/e/a/Dev116;->MAIN:Landroid/os/Handler;

    sget-object v1, Le/e/a/Dev116;->REFRESH_ARTWORK:Ljava/lang/Runnable;

    const-wide/16 v2, 0x30

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 222
    :cond_2
    return-void
.end method

.method static synthetic lambda$playlistThumbnail$7(Ljava/lang/String;)V
    .registers 7
    .param p0, "videoId"    # Ljava/lang/String;

    .line 203
    const/4 v0, 0x0

    .line 204
    .local v0, "found":Ljava/lang/String;
    :try_start_0
    invoke-static {p0}, Le/e/a/Dev116;->lookup(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_0

    :catch_0
    move-exception v1

    .line 205
    :goto_0
    if-nez v0, :cond_0

    invoke-static {p0}, Le/e/a/Dev116;->fallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 206
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 207
    .local v1, "adapters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/ref/WeakReference<Landroid/widget/BaseAdapter;>;>;"
    sget-object v2, Le/e/a/Dev116;->THUMBNAILS:Ljava/util/Map;

    monitor-enter v2

    .line 208
    :try_start_1
    sget-object v3, Le/e/a/Dev116;->THUMBNAILS:Ljava/util/Map;

    invoke-interface {v3, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    sget-object v3, Le/e/a/Dev116;->PENDING:Ljava/util/Map;

    invoke-interface {v3, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/BaseAdapter;

    .line 210
    .local v4, "waiting":Landroid/widget/BaseAdapter;
    if-eqz v4, :cond_1

    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    .end local v4    # "waiting":Landroid/widget/BaseAdapter;
    :cond_1
    goto :goto_1

    .line 212
    :cond_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 213
    sget-object v2, Le/e/a/Dev116;->MAIN:Landroid/os/Handler;

    new-instance v3, Le/e/a/Dev116$6;

    invoke-direct {v3, v1}, Le/e/a/Dev116$6;-><init>(Ljava/util/List;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 223
    return-void

    .line 212
    :catchall_0
    move-exception v3

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3
.end method

.method static synthetic lambda$settings$8(Landroid/preference/PreferenceActivity;)V
    .registers 1
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 330
    invoke-static {p0}, Le/e/a/Dev116;->updateMp4Setting(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method static synthetic lambda$settings$9(Ljava/lang/ref/WeakReference;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 5
    .param p0, "weak"    # Ljava/lang/ref/WeakReference;
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .line 328
    const-string v0, "mp4_tree_uri"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 329
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 330
    .local v0, "a":Landroid/preference/PreferenceActivity;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Le/e/a/Dev116$0;

    invoke-direct {v1, v0}, Le/e/a/Dev116$0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 331
    :cond_1
    return-void
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3
    .param p0, "r"    # Ljava/lang/Runnable;

    .line 44
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "nicoid-playlist-artwork"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .local v0, "t":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    return-object v0
.end method

.method static synthetic lambda$static$1()V
    .registers 3

    .line 56
    const/4 v0, 0x0

    sput-boolean v0, Le/e/a/Dev116;->refreshScheduled:Z

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Le/e/a/Dev116;->DIRTY_ADAPTERS:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 58
    .local v0, "adapters":Ljava/util/List;, "Ljava/util/List<Landroid/widget/BaseAdapter;>;"
    sget-object v1, Le/e/a/Dev116;->DIRTY_ADAPTERS:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 59
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/BaseAdapter;

    .line 60
    .local v2, "adapter":Landroid/widget/BaseAdapter;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 61
    .end local v2    # "adapter":Landroid/widget/BaseAdapter;
    :cond_0
    goto :goto_0

    .line 62
    :cond_1
    return-void
.end method

.method private static loadImage(Ljava/lang/String;Landroid/widget/ImageView;)V
    .registers 10
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "image"    # Landroid/widget/ImageView;

    .line 229
    const/4 v0, 0x0

    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 230
    :cond_0
    const-string v1, "e.e.a.ShortImages"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "load"

    const/4 v3, 0x3

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    aput-object v5, v4, v0

    const-class v5, Landroid/widget/ImageView;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    const-class v5, Landroid/widget/TextView;

    const/4 v7, 0x2

    aput-object v5, v4, v7

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 231
    .local v1, "load":Ljava/lang/reflect/Method;
    invoke-virtual {v1, v6}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 232
    new-array v2, v3, [Ljava/lang/Object;

    aput-object p0, v2, v0

    aput-object p1, v2, v6

    const/4 v0, 0x0

    aput-object v0, v2, v7

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    nop

    .end local v1    # "load":Ljava/lang/reflect/Method;
    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "nicoid-playlist"

    const-string v2, "Thumbnail image loader failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 234
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private static lookup(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 279
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://ext.nicovideo.jp/api/getthumbinfo/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/high16 v1, 0x20000

    invoke-static {v0, v1}, Le/e/a/Dev116;->read(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 280
    .local v0, "xml":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 281
    const-string v1, "<thumbnail_url>"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .local v1, "a":I
    const-string v2, "</thumbnail_url>"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 282
    .local v2, "b":I
    if-ltz v1, :cond_0

    if-le v2, v1, :cond_0

    .line 283
    add-int/lit8 v3, v1, 0xf

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, "&amp;"

    const-string v5, "&"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 284
    .local v3, "image":Ljava/lang/String;
    invoke-static {v3}, Le/e/a/Dev116;->validImage(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-static {v3}, Le/e/a/Dev116;->safeImage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 287
    .end local v1    # "a":I
    .end local v2    # "b":I
    .end local v3    # "image":Ljava/lang/String;
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public static nativePlaylistPopup(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 11
    .param p0, "listener"    # Ljava/lang/Object;
    .param p1, "popup"    # Ljava/lang/Object;

    .line 152
    const-class v0, Ljava/lang/Object;

    const/4 v1, 0x0

    if-eqz p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    .line 154
    :cond_0
    :try_start_0
    const-string v2, "e"

    invoke-static {p0, v2}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 155
    .local v2, "adapter":Ljava/lang/Object;
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v4, "e.e.a.LocalPlaylists"

    const-string v5, "hasAdapter"

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/Class;

    aput-object v0, v7, v1

    new-array v8, v6, [Ljava/lang/Object;

    aput-object v2, v8, v1

    invoke-static {v4, v5, v7, v8}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    return v1

    .line 156
    :cond_1
    const-string v3, "e.e.a.ListActions"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 157
    .local v3, "menu":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "extra"

    const/4 v5, 0x2

    new-array v7, v5, [Ljava/lang/Class;

    aput-object v0, v7, v1

    aput-object v0, v7, v6

    invoke-virtual {v3, v4, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 158
    .local v4, "extra":Ljava/lang/reflect/Method;
    const-string v7, "show"

    new-array v8, v5, [Ljava/lang/Class;

    aput-object v0, v8, v1

    aput-object v0, v8, v6

    invoke-virtual {v3, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 159
    .local v0, "show":Ljava/lang/reflect/Method;
    new-array v7, v5, [Ljava/lang/Object;

    aput-object p0, v7, v1

    aput-object p1, v7, v6

    const/4 v8, 0x0

    invoke-virtual {v4, v8, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    new-array v5, v5, [Ljava/lang/Object;

    aput-object p0, v5, v1

    aput-object p1, v5, v6

    invoke-virtual {v0, v8, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    return v6

    .line 162
    .end local v0    # "show":Ljava/lang/reflect/Method;
    .end local v2    # "adapter":Ljava/lang/Object;
    .end local v3    # "menu":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "extra":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .line 163
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "nicoid-playlist"

    const-string v3, "Native playlist popup bridge failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 164
    return v1

    .line 152
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    :goto_0
    return v1
.end method

.method public static playlistMenu(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/Menu;Ljava/util/List;)V
    .registers 36
    .param p0, "host"    # Landroid/app/Activity;
    .param p1, "listener"    # Ljava/lang/Object;
    .param p2, "row"    # Ljava/lang/Object;
    .param p3, "menu"    # Landroid/view/Menu;
    .param p4, "actions"    # Ljava/util/List;

    .line 69
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    if-eqz v1, :cond_14

    if-eqz v3, :cond_14

    if-eqz v4, :cond_14

    if-nez v5, :cond_0

    goto/16 :goto_10

    .line 71
    :cond_0
    :try_start_0
    const-string v0, "e.e.a.LocalPlaylists"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    move-object v6, v0

    .line 72
    .local v6, "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    if-nez v2, :cond_1

    move-object v7, v0

    goto :goto_0

    :cond_1
    const-string v7, "e"

    invoke-static {v2, v7}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 73
    .local v7, "adapter":Ljava/lang/Object;
    :goto_0
    const-string v8, "ADAPTER_PAGES"

    invoke-static {v6, v8}, Le/e/a/Dev112;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    .line 74
    .local v8, "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    if-nez v7, :cond_2

    move-object v9, v0

    goto :goto_1

    :cond_2
    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 75
    .local v9, "page":Ljava/lang/Object;
    :goto_1
    const-string v10, "PAGES"

    invoke-static {v6, v10}, Le/e/a/Dev112;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    move-object v10, v0

    .line 76
    .local v10, "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    if-nez v9, :cond_3

    if-eqz v10, :cond_3

    invoke-interface {v10, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    .line 77
    :cond_3
    if-eqz v9, :cond_13

    const-string v0, "folder"

    invoke-static {v9, v0}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_4

    move-object/from16 v19, v6

    move-object/from16 v22, v7

    move-object/from16 v23, v8

    move-object/from16 v24, v9

    move-object/from16 v20, v10

    goto/16 :goto_e

    .line 78
    :cond_4
    const-string v0, "visible"

    invoke-static {v9, v0}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    move-object v11, v0

    .line 79
    .local v11, "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    const-string v0, "e.e.a.ListActions"

    const-string v12, "value"

    const/4 v13, 0x2

    new-array v14, v13, [Ljava/lang/Class;

    const-class v15, Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v15, v14, v13

    const-class v15, Ljava/lang/String;

    const/16 v16, 0x0

    const/4 v13, 0x1

    aput-object v15, v14, v13

    const/4 v15, 0x2

    const/16 v17, 0x1

    new-array v13, v15, [Ljava/lang/Object;

    aput-object v3, v13, v16

    const-string v15, "videourl"

    aput-object v15, v13, v17

    invoke-static {v0, v12, v14, v13}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object v12, v0

    .line 80
    .local v12, "url":Ljava/lang/String;
    const-string v13, ""

    move-object v14, v13

    .line 81
    .local v14, "nativeId":Ljava/lang/String;
    :try_start_1
    const-string v0, "b"

    invoke-static {v3, v0}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v14, v0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 82
    :goto_2
    const/4 v0, 0x0

    .line 83
    .local v0, "identity":Ljava/lang/String;
    :try_start_2
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_3
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v18
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object/from16 v19, v0

    .end local v0    # "identity":Ljava/lang/String;
    .local v19, "identity":Ljava/lang/String;
    const-string v0, "id"

    if-eqz v18, :cond_8

    :try_start_3
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v20, v18

    .line 84
    .local v20, "item":Ljava/lang/Object;
    move-object/from16 v2, v20

    .end local v20    # "item":Ljava/lang/Object;
    .local v2, "item":Ljava/lang/Object;
    instance-of v3, v2, Lorg/json/JSONObject;

    if-nez v3, :cond_5

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v0, v19

    goto :goto_3

    .line 85
    :cond_5
    move-object v3, v2

    check-cast v3, Lorg/json/JSONObject;

    .line 86
    .local v3, "video":Lorg/json/JSONObject;
    move-object/from16 v18, v2

    .end local v2    # "item":Ljava/lang/Object;
    .local v18, "item":Ljava/lang/Object;
    const-string v2, "url"

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6

    const-string v2, "videoId"

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_4

    .line 89
    .end local v3    # "video":Lorg/json/JSONObject;
    .end local v18    # "item":Ljava/lang/Object;
    :cond_6
    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v0, v19

    goto :goto_3

    .line 87
    .restart local v3    # "video":Lorg/json/JSONObject;
    .restart local v18    # "item":Ljava/lang/Object;
    :cond_7
    :goto_4
    invoke-virtual {v3, v0, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .end local v19    # "identity":Ljava/lang/String;
    .local v2, "identity":Ljava/lang/String;
    goto :goto_5

    .line 83
    .end local v2    # "identity":Ljava/lang/String;
    .end local v3    # "video":Lorg/json/JSONObject;
    .end local v18    # "item":Ljava/lang/Object;
    .restart local v19    # "identity":Ljava/lang/String;
    :cond_8
    move-object/from16 v2, v19

    .line 90
    .end local v19    # "identity":Ljava/lang/String;
    .restart local v2    # "identity":Ljava/lang/String;
    :goto_5
    if-eqz v2, :cond_12

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_9

    move-object/from16 v18, v2

    move-object/from16 v19, v6

    move-object/from16 v22, v7

    move-object/from16 v23, v8

    move-object/from16 v24, v9

    move-object/from16 v20, v10

    move-object/from16 v29, v11

    move-object/from16 v30, v12

    goto/16 :goto_d

    .line 91
    :cond_9
    move-object v3, v2

    .line 92
    .local v3, "selected":Ljava/lang/String;
    const/4 v13, -0x1

    .line 93
    .local v13, "index":I
    const/4 v15, 0x0

    .local v15, "n":I
    :goto_6
    move-object/from16 v18, v2

    .end local v2    # "identity":Ljava/lang/String;
    .local v18, "identity":Ljava/lang/String;
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v2

    move-object/from16 v19, v6

    .end local v6    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v19, "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v6, 0x46b6

    if-ge v15, v2, :cond_b

    .line 94
    invoke-interface {v5, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2, v0}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    if-ne v2, v6, :cond_a

    move v13, v15

    goto :goto_7

    .line 93
    :cond_a
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v2, v18

    move-object/from16 v6, v19

    goto :goto_6

    .line 96
    .end local v15    # "n":I
    :cond_b
    :goto_7
    invoke-interface {v4, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 97
    .local v2, "move":Landroid/view/MenuItem;
    const-string/jumbo v15, "\u79fb\u81f3\u5176\u4ed6\u64ad\u653e\u6e05\u55ae"

    const-string v6, "Move to another playlist"

    move-object/from16 v21, v2

    .end local v2    # "move":Landroid/view/MenuItem;
    .local v21, "move":Landroid/view/MenuItem;
    const-string v2, "\u5225\u306e\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306b\u79fb\u52d5"

    if-nez v21, :cond_c

    move-object/from16 v22, v7

    .end local v7    # "adapter":Ljava/lang/Object;
    .local v22, "adapter":Ljava/lang/Object;
    :try_start_4
    invoke-static {v1, v2, v6, v15}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v23, v8

    .end local v8    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .local v23, "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    const/16 v8, 0x64

    move-object/from16 v24, v9

    move-object/from16 v20, v10

    const/16 v9, 0x46b6

    const/4 v10, 0x0

    .end local v9    # "page":Ljava/lang/Object;
    .end local v10    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .local v20, "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .local v24, "page":Ljava/lang/Object;
    invoke-interface {v4, v10, v9, v8, v7}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v7

    .end local v21    # "move":Landroid/view/MenuItem;
    .local v7, "move":Landroid/view/MenuItem;
    goto :goto_8

    .end local v20    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v22    # "adapter":Ljava/lang/Object;
    .end local v23    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v24    # "page":Ljava/lang/Object;
    .local v7, "adapter":Ljava/lang/Object;
    .restart local v8    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v9    # "page":Ljava/lang/Object;
    .restart local v10    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v21    # "move":Landroid/view/MenuItem;
    :cond_c
    move-object/from16 v22, v7

    move-object/from16 v23, v8

    move-object/from16 v24, v9

    move-object/from16 v20, v10

    .end local v7    # "adapter":Ljava/lang/Object;
    .end local v8    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v9    # "page":Ljava/lang/Object;
    .end local v10    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v20    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v22    # "adapter":Ljava/lang/Object;
    .restart local v23    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v24    # "page":Ljava/lang/Object;
    move-object/from16 v7, v21

    .line 98
    .end local v21    # "move":Landroid/view/MenuItem;
    .local v7, "move":Landroid/view/MenuItem;
    :goto_8
    invoke-static {v1, v2, v6, v15}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v7, v2}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 99
    new-instance v2, Le/e/a/Dev116$7;

    invoke-direct {v2, v1, v3}, Le/e/a/Dev116$7;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 100
    .local v2, "onMove":Ljava/lang/Runnable;
    new-instance v6, Le/e/a/Dev116$8;

    invoke-direct {v6, v2}, Le/e/a/Dev116$8;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {v7, v6}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 101
    const-string v6, "e.e.a.ListActions$Action"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 102
    .local v6, "actionType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v15, 0x2

    new-array v8, v15, [Ljava/lang/Class;

    const-class v9, Landroid/view/MenuItem;

    const/16 v16, 0x0

    aput-object v9, v8, v16

    const-class v9, Ljava/lang/Runnable;

    aput-object v9, v8, v17

    invoke-virtual {v6, v8}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v8

    .line 103
    .local v8, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 104
    const/4 v15, 0x2

    new-array v10, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v7, v10, v16

    aput-object v2, v10, v9

    invoke-virtual {v8, v10}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 105
    .local v9, "moveAction":Ljava/lang/Object;
    if-gez v13, :cond_d

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    move v13, v10

    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_d
    invoke-interface {v5, v13, v9}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 106
    :goto_9
    const/16 v10, 0x46b9

    invoke-interface {v4, v10}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v15
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 107
    .local v15, "remove":Landroid/view/MenuItem;
    const-string v10, "\u5f9e\u64ad\u653e\u6e05\u55ae\u79fb\u9664"

    move-object/from16 v25, v2

    .end local v2    # "onMove":Ljava/lang/Runnable;
    .local v25, "onMove":Ljava/lang/Runnable;
    const-string v2, "Remove from playlist"

    move-object/from16 v26, v6

    .end local v6    # "actionType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v26, "actionType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v6, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u304b\u3089\u524a\u9664"

    if-nez v15, :cond_e

    move-object/from16 v27, v7

    .end local v7    # "move":Landroid/view/MenuItem;
    .local v27, "move":Landroid/view/MenuItem;
    :try_start_5
    invoke-static {v1, v6, v2, v10}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v28, v9

    .end local v9    # "moveAction":Ljava/lang/Object;
    .local v28, "moveAction":Ljava/lang/Object;
    const/16 v9, 0x65

    move-object/from16 v29, v11

    move-object/from16 v30, v12

    const/16 v11, 0x46b9

    const/4 v12, 0x0

    .end local v11    # "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v12    # "url":Ljava/lang/String;
    .local v29, "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    .local v30, "url":Ljava/lang/String;
    invoke-interface {v4, v12, v11, v9, v7}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v7

    move-object v15, v7

    goto :goto_a

    .end local v27    # "move":Landroid/view/MenuItem;
    .end local v28    # "moveAction":Ljava/lang/Object;
    .end local v29    # "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v30    # "url":Ljava/lang/String;
    .restart local v7    # "move":Landroid/view/MenuItem;
    .restart local v9    # "moveAction":Ljava/lang/Object;
    .restart local v11    # "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    .restart local v12    # "url":Ljava/lang/String;
    :cond_e
    move-object/from16 v27, v7

    move-object/from16 v28, v9

    move-object/from16 v29, v11

    move-object/from16 v30, v12

    .line 108
    .end local v7    # "move":Landroid/view/MenuItem;
    .end local v9    # "moveAction":Ljava/lang/Object;
    .end local v11    # "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v12    # "url":Ljava/lang/String;
    .restart local v27    # "move":Landroid/view/MenuItem;
    .restart local v28    # "moveAction":Ljava/lang/Object;
    .restart local v29    # "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    .restart local v30    # "url":Ljava/lang/String;
    :goto_a
    invoke-static {v1, v6, v2, v10}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v15, v2}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 109
    new-instance v2, Le/e/a/Dev116$9;

    invoke-direct {v2, v1, v3}, Le/e/a/Dev116$9;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 110
    .local v2, "onRemove":Ljava/lang/Runnable;
    new-instance v6, Le/e/a/Dev116$10;

    invoke-direct {v6, v2}, Le/e/a/Dev116$10;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {v15, v6}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 111
    const/4 v6, 0x0

    .line 112
    .local v6, "present":Z
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_b
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_10

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .local v9, "action":Ljava/lang/Object;
    invoke-static {v9, v0}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Number;

    invoke-virtual {v10}, Ljava/lang/Number;->intValue()I

    move-result v10

    const/16 v11, 0x46b9

    if-ne v10, v11, :cond_f

    const/4 v6, 0x1

    goto :goto_c

    .end local v9    # "action":Ljava/lang/Object;
    :cond_f
    goto :goto_b

    .line 113
    :cond_10
    :goto_c
    if-nez v6, :cond_11

    add-int/lit8 v0, v13, 0x1

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v15, v7, v16

    const/16 v17, 0x1

    aput-object v2, v7, v17

    invoke-virtual {v8, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v5, v0, v7}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 114
    .end local v2    # "onRemove":Ljava/lang/Runnable;
    .end local v3    # "selected":Ljava/lang/String;
    .end local v6    # "present":Z
    .end local v8    # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v13    # "index":I
    .end local v14    # "nativeId":Ljava/lang/String;
    .end local v15    # "remove":Landroid/view/MenuItem;
    .end local v18    # "identity":Ljava/lang/String;
    .end local v19    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v20    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v22    # "adapter":Ljava/lang/Object;
    .end local v23    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v24    # "page":Ljava/lang/Object;
    .end local v25    # "onMove":Ljava/lang/Runnable;
    .end local v26    # "actionType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v27    # "move":Landroid/view/MenuItem;
    .end local v28    # "moveAction":Ljava/lang/Object;
    .end local v29    # "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v30    # "url":Ljava/lang/String;
    :cond_11
    goto :goto_f

    .line 90
    .local v2, "identity":Ljava/lang/String;
    .local v6, "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v7, "adapter":Ljava/lang/Object;
    .local v8, "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .local v9, "page":Ljava/lang/Object;
    .restart local v10    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v11    # "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    .restart local v12    # "url":Ljava/lang/String;
    .restart local v14    # "nativeId":Ljava/lang/String;
    :cond_12
    move-object/from16 v18, v2

    move-object/from16 v19, v6

    move-object/from16 v22, v7

    move-object/from16 v23, v8

    move-object/from16 v24, v9

    move-object/from16 v20, v10

    move-object/from16 v29, v11

    move-object/from16 v30, v12

    .end local v2    # "identity":Ljava/lang/String;
    .end local v6    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "adapter":Ljava/lang/Object;
    .end local v8    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v9    # "page":Ljava/lang/Object;
    .end local v10    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v11    # "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v12    # "url":Ljava/lang/String;
    .restart local v18    # "identity":Ljava/lang/String;
    .restart local v19    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v20    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v22    # "adapter":Ljava/lang/Object;
    .restart local v23    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v24    # "page":Ljava/lang/Object;
    .restart local v29    # "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    .restart local v30    # "url":Ljava/lang/String;
    :goto_d
    return-void

    .line 77
    .end local v14    # "nativeId":Ljava/lang/String;
    .end local v18    # "identity":Ljava/lang/String;
    .end local v19    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v20    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v22    # "adapter":Ljava/lang/Object;
    .end local v23    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v24    # "page":Ljava/lang/Object;
    .end local v29    # "visible":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v30    # "url":Ljava/lang/String;
    .restart local v6    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v7    # "adapter":Ljava/lang/Object;
    .restart local v8    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v9    # "page":Ljava/lang/Object;
    .restart local v10    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    :cond_13
    move-object/from16 v19, v6

    move-object/from16 v22, v7

    move-object/from16 v23, v8

    move-object/from16 v24, v9

    move-object/from16 v20, v10

    .end local v6    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "adapter":Ljava/lang/Object;
    .end local v8    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v9    # "page":Ljava/lang/Object;
    .end local v10    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v19    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v20    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v22    # "adapter":Ljava/lang/Object;
    .restart local v23    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .restart local v24    # "page":Ljava/lang/Object;
    :goto_e
    return-void

    .line 114
    .end local v19    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v20    # "pages":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v22    # "adapter":Ljava/lang/Object;
    .end local v23    # "registered":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .end local v24    # "page":Ljava/lang/Object;
    :catch_1
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "nicoid-playlist"

    const-string v3, "Playlist menu binding failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 115
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_f
    return-void

    .line 69
    :cond_14
    :goto_10
    return-void
.end method

.method public static playlistThumbnail(Landroid/view/View;Landroid/widget/BaseAdapter;Lorg/json/JSONObject;)V
    .registers 12
    .param p0, "row"    # Landroid/view/View;
    .param p1, "adapter"    # Landroid/widget/BaseAdapter;
    .param p2, "video"    # Lorg/json/JSONObject;

    invoke-static {p0}, Le/e/a/ThumbnailCorners;->applyNative(Landroid/view/View;)V

    .line 169
    if-eqz p0, :cond_b

    if-nez p2, :cond_0

    goto/16 :goto_2

    .line 170
    :cond_0
    invoke-static {p0}, Le/e/a/Dev116;->thumbView(Landroid/view/View;)Landroid/widget/ImageView;

    move-result-object v0

    .line 171
    .local v0, "image":Landroid/widget/ImageView;
    if-nez v0, :cond_1

    const-string v1, "nicoid-playlist"

    const-string v2, "Thumbnail ImageView missing in native video row"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 172
    :cond_1
    const-string v1, "thumbnail"

    const-string v2, ""

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 173
    .local v1, "original":Ljava/lang/String;
    invoke-static {v1}, Le/e/a/Dev116;->validImage(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "thumbnailUrl"

    const-string v3, ""

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 174
    :cond_2
    invoke-static {v1}, Le/e/a/Dev116;->validImage(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "thumbnail_url"

    const-string v3, ""

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 175
    :cond_3
    invoke-static {v1}, Le/e/a/Dev116;->validImage(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 176
    invoke-static {v1}, Le/e/a/Dev116;->safeImage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Le/e/a/Dev116;->loadImage(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 177
    return-void

    .line 179
    :cond_4
    const-string v2, "videoId"

    const-string v3, ""

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 180
    .local v2, "id":Ljava/lang/String;
    sget-object v3, Le/e/a/Dev116;->VIDEO_ID:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-nez v3, :cond_6

    .line 181
    sget-object v3, Le/e/a/Dev116;->VIDEO_ID:Ljava/util/regex/Pattern;

    const-string v4, "url"

    const-string v5, ""

    invoke-virtual {p2, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 182
    .local v3, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_5
    const-string v4, ""

    :goto_0
    move-object v2, v4

    .line 184
    .end local v3    # "matcher":Ljava/util/regex/Matcher;
    :cond_6
    move-object v3, v2

    .line 186
    .local v3, "videoId":Ljava/lang/String;
    const/4 v4, 0x0

    .line 187
    .local v4, "startLookup":Z
    sget-object v5, Le/e/a/Dev116;->THUMBNAILS:Ljava/util/Map;

    monitor-enter v5

    .line 188
    :try_start_0
    sget-object v6, Le/e/a/Dev116;->THUMBNAILS:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 189
    .local v6, "cached":Ljava/lang/String;
    if-nez v6, :cond_8

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_8

    .line 190
    sget-object v7, Le/e/a/Dev116;->PENDING:Ljava/util/Map;

    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map;

    .line 191
    .local v7, "waiters":Ljava/util/Map;, "Ljava/util/Map<Landroid/widget/BaseAdapter;Ljava/lang/Boolean;>;"
    if-nez v7, :cond_7

    .line 192
    new-instance v8, Ljava/util/WeakHashMap;

    invoke-direct {v8}, Ljava/util/WeakHashMap;-><init>()V

    move-object v7, v8

    .line 193
    sget-object v8, Le/e/a/Dev116;->PENDING:Ljava/util/Map;

    invoke-interface {v8, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const/4 v4, 0x1

    .line 196
    :cond_7
    if-eqz p1, :cond_8

    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v7, p1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .end local v7    # "waiters":Ljava/util/Map;, "Ljava/util/Map<Landroid/widget/BaseAdapter;Ljava/lang/Boolean;>;"
    :cond_8
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    if-nez v6, :cond_9

    const-string v5, ""

    goto :goto_1

    :cond_9
    move-object v5, v6

    :goto_1
    invoke-static {v5, v0}, Le/e/a/Dev116;->loadImage(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 201
    if-nez v4, :cond_a

    return-void

    .line 202
    :cond_a
    sget-object v5, Le/e/a/Dev116;->IMAGES:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Le/e/a/Dev116$5;

    invoke-direct {v7, v3}, Le/e/a/Dev116$5;-><init>(Ljava/lang/String;)V

    invoke-interface {v5, v7}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 224
    return-void

    .line 198
    .end local v6    # "cached":Ljava/lang/String;
    :catchall_0
    move-exception v6

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v6

    .line 169
    .end local v0    # "image":Landroid/widget/ImageView;
    .end local v1    # "original":Ljava/lang/String;
    .end local v2    # "id":Ljava/lang/String;
    .end local v3    # "videoId":Ljava/lang/String;
    .end local v4    # "startLookup":Z
    :cond_b
    :goto_2
    return-void
.end method

.method private static read(Ljava/lang/String;I)Ljava/lang/String;
    .registers 11
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "limit"    # I

    .line 290
    const/4 v0, 0x0

    .line 292
    .local v0, "connection":Ljava/net/HttpURLConnection;
    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lnicoid/network238/ReadOnlyConnection239;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    move-object v0, v2

    .line 293
    const/16 v2, 0x1194

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 294
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 295
    const-string v3, "Accept"

    const-string v4, "application/json, application/xml, text/xml"

    invoke-virtual {v0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    const/16 v4, 0xc8

    if-eq v3, v4, :cond_1

    .line 306
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 296
    :cond_0
    return-object v1

    .line 297
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .local v3, "in":Ljava/io/InputStream;
    :try_start_2
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 298
    .local v4, "data":Ljava/io/ByteArrayOutputStream;
    const/16 v5, 0x1000

    :try_start_3
    new-array v5, v5, [B

    .line 299
    .local v5, "buffer":[B
    :goto_0
    invoke-virtual {v3, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    move v7, v6

    .local v7, "n":I
    const/4 v8, -0x1

    if-eq v6, v8, :cond_5

    .line 300
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    add-int/2addr v6, v7

    if-le v6, p1, :cond_4

    .line 304
    :try_start_4
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    if-eqz v3, :cond_2

    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 306
    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 300
    :cond_3
    return-object v1

    .line 301
    :cond_4
    :try_start_6
    invoke-virtual {v4, v5, v2, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 303
    :cond_5
    const-string v2, "UTF-8"

    invoke-virtual {v4, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 304
    :try_start_7
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    if-eqz v3, :cond_6

    :try_start_8
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 306
    :cond_6
    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 303
    :cond_7
    return-object v2

    .line 297
    .end local v5    # "buffer":[B
    .end local v7    # "n":I
    :catchall_0
    move-exception v2

    :try_start_9
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v5

    :try_start_a
    invoke-virtual {v2, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    .end local v3    # "in":Ljava/io/InputStream;
    .end local p0    # "path":Ljava/lang/String;
    .end local p1    # "limit":I
    :goto_1
    throw v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .end local v4    # "data":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "connection":Ljava/net/HttpURLConnection;
    .restart local v3    # "in":Ljava/io/InputStream;
    .restart local p0    # "path":Ljava/lang/String;
    .restart local p1    # "limit":I
    :catchall_2
    move-exception v2

    if-eqz v3, :cond_8

    :try_start_b
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception v4

    :try_start_c
    invoke-virtual {v2, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    .end local p0    # "path":Ljava/lang/String;
    .end local p1    # "limit":I
    :cond_8
    :goto_2
    throw v2
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    .line 306
    .end local v3    # "in":Ljava/io/InputStream;
    .restart local v0    # "connection":Ljava/net/HttpURLConnection;
    .restart local p0    # "path":Ljava/lang/String;
    .restart local p1    # "limit":I
    :catchall_4
    move-exception v1

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_9
    throw v1

    .line 305
    :catch_0
    move-exception v2

    .line 306
    .local v2, "ignored":Ljava/lang/Exception;
    if-eqz v0, :cond_a

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 305
    :cond_a
    return-object v1
.end method

.method private static safeImage(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "url"    # Ljava/lang/String;

    .line 276
    const-string v0, "//"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "^http://"

    const-string v1, "https://"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 8
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 314
    const-string v0, "mp4_tree_uri"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 315
    .local v0, "mp4":Landroid/preference/Preference;
    const-string v1, "show_watch_progress"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 316
    .local v1, "progress":Landroid/preference/Preference;
    if-eqz v1, :cond_0

    const-string v2, "Show a progress bar along the bottom of thumbnails for previously watched videos"

    const-string v3, "\u5728\u5df2\u89c0\u770b\u5f71\u7247\u7684\u7e2e\u5716\u5e95\u90e8\u986f\u793a\u64ad\u653e\u9032\u5ea6\u689d"

    const-string/jumbo v4, "\u8996\u8074\u6e08\u307f\u52d5\u753b\u306e\u30b5\u30e0\u30cd\u30a4\u30eb\u4e0b\u7aef\u306b\u518d\u751f\u4f4d\u7f6e\u3092\u793a\u3059\u9032\u6357\u30d0\u30fc\u3092\u8868\u793a\u3057\u307e\u3059"

    invoke-static {p0, v4, v2, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 320
    :cond_0
    if-nez v0, :cond_1

    return-void

    .line 321
    :cond_1
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 322
    .local v2, "prefs":Landroid/content/SharedPreferences;
    invoke-static {p0}, Le/e/a/Dev116;->updateMp4Setting(Landroid/preference/PreferenceActivity;)V

    .line 324
    sget-object v3, Le/e/a/Dev116;->LISTENERS:Ljava/util/Map;

    invoke-interface {v3, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 325
    .local v3, "old":Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
    if-eqz v3, :cond_2

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 326
    :cond_2
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 327
    .local v4, "weak":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/preference/PreferenceActivity;>;"
    new-instance v5, Le/e/a/Dev116$2;

    invoke-direct {v5, v4}, Le/e/a/Dev116$2;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 332
    .local v5, "listener":Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
    invoke-interface {v2, v5}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 333
    sget-object v6, Le/e/a/Dev116;->LISTENERS:Ljava/util/Map;

    invoke-interface {v6, p0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    return-void
.end method

.method private static thumbView(Landroid/view/View;)Landroid/widget/ImageView;
    .registers 14
    .param p0, "root"    # Landroid/view/View;

    .line 238
    const v0, 0x7f0800cd

    const v1, 0x7f0801b2

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_1

    aget v2, v0, v1

    .line 239
    .local v2, "id":I
    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Le/e/a/Dev116;->firstImage(Landroid/view/View;)Landroid/widget/ImageView;

    move-result-object v3

    .line 240
    .local v3, "direct":Landroid/widget/ImageView;
    if-eqz v3, :cond_0

    return-object v3

    .line 238
    .end local v2    # "id":I
    .end local v3    # "direct":Landroid/widget/ImageView;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 242
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 243
    .local v0, "found":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/widget/ImageView;>;"
    invoke-static {p0, v0}, Le/e/a/Dev116;->collectImages(Landroid/view/View;Ljava/util/List;)V

    .line 244
    const/4 v1, 0x0

    .local v1, "best":Landroid/widget/ImageView;
    const-wide/16 v2, -0x1

    .line 245
    .local v2, "score":J
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 246
    .local v5, "image":Landroid/widget/ImageView;
    invoke-virtual {v5}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 247
    .local v6, "p":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v5}, Landroid/widget/ImageView;->getWidth()I

    move-result v7

    const/4 v8, 0x1

    if-lez v7, :cond_2

    invoke-virtual {v5}, Landroid/widget/ImageView;->getWidth()I

    move-result v7

    goto :goto_2

    :cond_2
    if-eqz v6, :cond_3

    iget v7, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-lez v7, :cond_3

    iget v7, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    goto :goto_2

    :cond_3
    const/4 v7, 0x1

    .line 248
    .local v7, "width":I
    :goto_2
    invoke-virtual {v5}, Landroid/widget/ImageView;->getHeight()I

    move-result v9

    if-lez v9, :cond_4

    invoke-virtual {v5}, Landroid/widget/ImageView;->getHeight()I

    move-result v8

    goto :goto_3

    :cond_4
    if-eqz v6, :cond_5

    iget v9, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v9, :cond_5

    iget v8, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 249
    .local v8, "height":I
    :cond_5
    :goto_3
    int-to-long v9, v7

    int-to-long v11, v8

    mul-long v9, v9, v11

    .line 250
    .local v9, "area":J
    cmp-long v11, v9, v2

    if-lez v11, :cond_6

    move-wide v2, v9

    move-object v1, v5

    .line 251
    .end local v5    # "image":Landroid/widget/ImageView;
    .end local v6    # "p":Landroid/view/ViewGroup$LayoutParams;
    .end local v7    # "width":I
    .end local v8    # "height":I
    .end local v9    # "area":J
    :cond_6
    goto :goto_1

    .line 252
    :cond_7
    return-object v1
.end method

.method private static updateMp4Setting(Landroid/preference/PreferenceActivity;)V
    .registers 9
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 337
    const-string v0, "mp4_tree_uri"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 338
    .local v1, "mp4":Landroid/preference/Preference;
    if-nez v1, :cond_0

    return-void

    .line 339
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 340
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const-string v3, "MP4 save folder"

    const-string v4, "MP4\u5132\u5b58\u8cc7\u6599\u593e"

    const-string v5, "MP4\u306e\u4fdd\u5b58\u5148\u30d5\u30a9\u30eb\u30c0"

    invoke-static {p0, v5, v3, v4}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 341
    const-string v3, ""

    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 342
    .local v0, "uri":Ljava/lang/String;
    const-string v3, "Not set (select when first downloading)"

    const-string/jumbo v4, "\u672a\u8a2d\u5b9a\uff08\u9996\u6b21\u4e0b\u8f09\u6642\u9078\u64c7\uff09"

    const-string/jumbo v5, "\u672a\u6307\u5b9a\uff08\u521d\u56de\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u6642\u306b\u9078\u629e\uff09"

    invoke-static {p0, v5, v3, v4}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 343
    .local v3, "location":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    :try_start_0
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-static {v4}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, v4

    goto :goto_0

    :catch_0
    move-exception v4

    .line 344
    :cond_1
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Location: "

    const-string v6, "\u5132\u5b58\u4f4d\u7f6e: "

    const-string v7, "\u4fdd\u5b58\u5148: "

    invoke-static {p0, v7, v5, v6}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 345
    const-string v5, "\u4fdd\u5b58\u3057\u305fMP4\u306f\u672c\u30a2\u30d7\u30ea\u3067\u306f\u518d\u751f\u3067\u304d\u307e\u305b\u3093\u3002\u5916\u90e8\u306e\u52d5\u753b\u518d\u751f\u30a2\u30d7\u30ea\u3092\u3054\u5229\u7528\u304f\u3060\u3055\u3044"

    const-string v6, "Saved MP4 files cannot be played in this app. Use an external video player"

    const-string/jumbo v7, "\u672c\u61c9\u7528\u7a0b\u5f0f\u7121\u6cd5\u64ad\u653e\u5132\u5b58\u7684MP4\u3002\u8acb\u4f7f\u7528\u5176\u4ed6\u5f71\u7247\u64ad\u653e\u5668"

    invoke-static {p0, v5, v6, v7}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 344
    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 349
    return-void
.end method

.method private static validImage(Ljava/lang/String;)Z
    .registers 2
    .param p0, "url"    # Ljava/lang/String;

    .line 273
    const-string v0, "https://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "http://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "//"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
