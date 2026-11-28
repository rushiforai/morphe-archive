.class public final Le/e/a/Dev112;
.super Ljava/lang/Object;
.source "Dev112.java"


# static fields
.field static final CONFIRM_EXIT:Ljava/lang/String; = "nicoid_confirm_exit"

.field private static final MAIN:Landroid/os/Handler;

.field private static final SCROLL_RESTORES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/widget/ListView;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static final VERTICAL_TURN:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 36
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Dev112;->VERTICAL_TURN:Ljava/util/Map;

    .line 37
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/Dev112;->MAIN:Landroid/os/Handler;

    .line 38
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Dev112;->SCROLL_RESTORES:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/Map;
    .registers 1

    .line 34
    sget-object v0, Le/e/a/Dev112;->SCROLL_RESTORES:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$100()Landroid/os/Handler;
    .registers 1

    .line 34
    sget-object v0, Le/e/a/Dev112;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method public static back(Landroid/app/Activity;)Z
    .registers 2

    invoke-static {p0}, Le/e/a/ExitModeOptions;->normalBack(Landroid/app/Activity;)Z

    move-result v0

    return v0
.end method

.method static builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;
    .registers 7
    .param p0, "a"    # Landroid/app/Activity;

    .line 62
    :try_start_0
    const-string v0, "e.e.a.UiDialogs"

    const-string v1, "builder"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    invoke-static {v0, v1, v3, v2}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlertDialog$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 63
    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/Exception;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    return-object v1
.end method

.method private static confirmRemove(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 6
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "id"    # Ljava/lang/String;

    .line 245
    invoke-static {p0}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Remove from playlist?"

    const-string/jumbo v2, "\u8981\u5f9e\u64ad\u653e\u6e05\u55ae\u79fb\u9664\u55ce\uff1f"

    const-string v3, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u304b\u3089\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {p0, v3, v1, v2}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 246
    const-string v1, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306e\u767b\u9332\u306e\u307f\u3092\u524a\u9664\u3057\u307e\u3059\u3002\u52d5\u753b\u3084\u30ad\u30e3\u30c3\u30b7\u30e5\u306f\u524a\u9664\u3055\u308c\u307e\u305b\u3093\u3002"

    const-string v2, "Only the playlist entry will be removed. The video and cache are kept."

    const-string v3, "\u53ea\u79fb\u9664\u64ad\u653e\u6e05\u55ae\u9805\u76ee\uff0c\u5f71\u7247\u8207\u5feb\u53d6\u6703\u4fdd\u7559\u3002"

    invoke-static {p0, v1, v2, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 249
    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v2, "Cancel"

    const-string v3, "\u53d6\u6d88"

    invoke-static {p0, v1, v2, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 250
    const-string v1, "\u524a\u9664"

    const-string v2, "Remove"

    const-string/jumbo v3, "\u79fb\u9664"

    invoke-static {p0, v1, v2, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/Dev112$6;

    invoke-direct {v2, p0, p1}, Le/e/a/Dev112$6;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 245
    invoke-static {v0}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    .line 251
    return-void
.end method

.method private static edit(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "to"    # Ljava/lang/String;

    .line 270
    :try_start_0
    const-string v0, "e.e.a.LocalPlaylists"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 271
    .local v0, "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "e.e.a.LocalPlaylists$Edit"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 272
    .local v1, "editType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    new-instance v6, Le/e/a/Dev112$8;

    invoke-direct {v6, p1, p2}, Le/e/a/Dev112$8;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2, v4, v6}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v2

    .line 283
    .local v2, "edit":Ljava/lang/Object;
    const-string v4, "change"

    const/4 v6, 0x3

    new-array v7, v6, [Ljava/lang/Class;

    const-class v8, Landroid/content/Context;

    aput-object v8, v7, v5

    aput-object v1, v7, v3

    const-class v8, Ljava/util/function/Consumer;

    const/4 v9, 0x2

    aput-object v8, v7, v9

    invoke-virtual {v0, v4, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 284
    .local v4, "change":Ljava/lang/reflect/Method;
    invoke-virtual {v4, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 285
    new-instance v7, Le/e/a/Dev112$9;

    invoke-direct {v7, v0, p0}, Le/e/a/Dev112$9;-><init>(Ljava/lang/Class;Landroid/app/Activity;)V

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p0, v6, v5

    aput-object v2, v6, v3

    aput-object v7, v6, v9

    const/4 v3, 0x0

    invoke-virtual {v4, v3, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 292
    nop

    .end local v0    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "editType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "edit":Ljava/lang/Object;
    .end local v4    # "change":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 290
    :catch_0
    move-exception v0

    .line 291
    .local v0, "error":Ljava/lang/Exception;
    const-string v1, "nicoid-playlist"

    const-string v2, "Playlist edit failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 293
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static exit(Landroid/app/Activity;)V
    .registers 2
    .param p0, "a"    # Landroid/app/Activity;

    .line 186
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 187
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->finishAffinity()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "error":Ljava/lang/RuntimeException;
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 188
    .end local v0    # "error":Ljava/lang/RuntimeException;
    :goto_0
    return-void
.end method

.method public static exitSettings(Landroid/preference/PreferenceActivity;)V
    .registers 2

    invoke-static {p0}, Le/e/a/ExitModeOptions;->install(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method static field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 42
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v0, p0

    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-eqz v0, :cond_0

    .line 43
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .local v1, "f":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 44
    .end local v1    # "f":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v1

    .line 42
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 46
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    new-instance v0, Ljava/lang/NoSuchFieldException;

    invoke-direct {v0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static findVideo(Ljava/lang/Object;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 10
    .param p0, "page"    # Ljava/lang/Object;
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 236
    const-string v0, "visible"

    invoke-static {p0, v0}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 237
    .local v0, "videos":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .local v2, "obj":Ljava/lang/Object;
    instance-of v3, v2, Lorg/json/JSONObject;

    if-eqz v3, :cond_1

    .line 238
    move-object v3, v2

    check-cast v3, Lorg/json/JSONObject;

    .line 239
    .local v3, "video":Lorg/json/JSONObject;
    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v7

    const-string v6, "e.e.a.HistoryRules"

    const-string v7, "id"

    invoke-static {v6, v7, v5, v4}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 240
    .local v4, "watchId":Ljava/lang/String;
    const-string v5, "url"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "videoId"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_0
    return-object v3

    .line 237
    .end local v2    # "obj":Ljava/lang/Object;
    .end local v3    # "video":Lorg/json/JSONObject;
    .end local v4    # "watchId":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 242
    :cond_2
    const/4 v1, 0x0

    return-object v1
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 49
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/Dev112;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$back$1(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .registers 3
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "d"    # Landroid/content/DialogInterface;
    .param p2, "w"    # I

    .line 177
    invoke-static {p0}, Le/e/a/Dev112;->exit(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$confirmRemove$6(Landroid/app/Activity;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 5
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 250
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/Dev112;->edit(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$edit$8(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
    .param p0, "id"    # Ljava/lang/String;
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "proxy"    # Ljava/lang/Object;
    .param p3, "method"    # Ljava/lang/reflect/Method;
    .param p4, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 274
    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    invoke-static {}, Le/e/a/Dev112;->thisObject()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p3, v0, p4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 275
    :cond_0
    if-eqz p4, :cond_2

    array-length v0, p4

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 276
    const/4 v0, 0x0

    aget-object v2, p4, v0

    .line 277
    .local v2, "model":Ljava/lang/Object;
    invoke-static {p0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    .line 278
    .local v3, "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez p1, :cond_1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    new-array v5, v1, [Ljava/lang/Class;

    const-class v6, Ljava/util/Set;

    aput-object v6, v5, v0

    const-string v6, "delete"

    invoke-virtual {v4, v6, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v3, v1, v0

    invoke-virtual {v4, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 279
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Ljava/util/Set;

    aput-object v7, v6, v0

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v1

    const-string v7, "move"

    invoke-virtual {v4, v7, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v0

    aput-object p1, v5, v1

    invoke-virtual {v4, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    .end local v2    # "model":Ljava/lang/Object;
    .end local v3    # "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method static synthetic lambda$edit$9(Ljava/lang/Class;Landroid/app/Activity;Ljava/lang/Boolean;)V
    .registers 8
    .param p0, "owner"    # Ljava/lang/Class;
    .param p1, "a"    # Landroid/app/Activity;
    .param p2, "ok"    # Ljava/lang/Boolean;

    .line 286
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 287
    :cond_0
    :try_start_0
    const-string v0, "show"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v4

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 288
    :catch_0
    move-exception v0

    :goto_0
    nop

    .line 289
    return-void
.end method

.method static synthetic lambda$moveVideo$7(Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "from"    # Ljava/lang/String;
    .param p1, "a"    # Landroid/app/Activity;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "to"    # Ljava/lang/String;

    .line 261
    if-eqz p3, :cond_0

    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1, p2, p3}, Le/e/a/Dev112;->edit(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    :cond_0
    return-void
.end method

.method static synthetic lambda$playlistMenu$2(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "id"    # Ljava/lang/String;

    .line 206
    invoke-static {p0, p1}, Le/e/a/Dev112;->moveVideo(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$playlistMenu$3(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 3
    .param p0, "move"    # Ljava/lang/Runnable;
    .param p1, "m"    # Landroid/view/MenuItem;

    .line 207
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$playlistMenu$4(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "id"    # Ljava/lang/String;

    .line 219
    invoke-static {p0, p1}, Le/e/a/Dev112;->confirmRemove(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$playlistMenu$5(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 3
    .param p0, "remove"    # Ljava/lang/Runnable;
    .param p1, "m"    # Landroid/view/MenuItem;

    .line 220
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$restoreList$0(Landroid/widget/ListView;II)V
    .registers 3
    .param p0, "list"    # Landroid/widget/ListView;
    .param p1, "index"    # I
    .param p2, "top"    # I

    .line 98
    invoke-static {p0, p1, p2}, Le/e/a/Dev112;->restoreList(Landroid/widget/ListView;II)V

    return-void
.end method

.method private static moveVideo(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 12
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "id"    # Ljava/lang/String;

    .line 254
    :try_start_0
    invoke-static {p0}, Le/e/a/Dev112;->page(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v0

    .line 255
    .local v0, "page":Ljava/lang/Object;
    const-string v1, "folder"

    invoke-static {v0, v1}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 256
    .local v1, "from":Ljava/lang/String;
    const-string v2, "e.e.a.LocalPlaylists"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 257
    .local v2, "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x3

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Ljava/lang/String;

    const/4 v7, 0x1

    aput-object v5, v4, v7

    const-class v5, Ljava/util/function/Consumer;

    const/4 v8, 0x2

    aput-object v5, v4, v8

    .line 258
    .local v4, "args":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v5, "choose"

    invoke-virtual {v2, v5, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 259
    .local v5, "choose":Ljava/lang/reflect/Method;
    invoke-virtual {v5, v7}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 260
    new-instance v9, Le/e/a/Dev112$0;

    invoke-direct {v9, v1, p0, p1}, Le/e/a/Dev112$0;-><init>(Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;)V

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v6

    aput-object v1, v3, v7

    aput-object v9, v3, v8

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 265
    nop

    .end local v0    # "page":Ljava/lang/Object;
    .end local v1    # "from":Ljava/lang/String;
    .end local v2    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "args":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v5    # "choose":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 263
    :catch_0
    move-exception v0

    .line 264
    .local v0, "error":Ljava/lang/Exception;
    const-string v1, "nicoid-playlist"

    const-string v2, "Playlist move dialog failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 266
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private static page(Landroid/app/Activity;)Ljava/lang/Object;
    .registers 4
    .param p0, "a"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 227
    const-string v0, "e.e.a.LocalPlaylists"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 228
    .local v0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "PAGES"

    invoke-static {v0, v1}, Le/e/a/Dev112;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 229
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static playlistMenu(Landroid/app/Activity;Ljava/lang/Object;Landroid/view/Menu;Ljava/util/List;I)V
    .registers 25
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "videoRow"    # Ljava/lang/Object;
    .param p2, "menu"    # Landroid/view/Menu;
    .param p3, "actions"    # Ljava/util/List;
    .param p4, "order"    # I

    .line 193
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    const-string v0, "id"

    if-nez v1, :cond_0

    return-void

    .line 195
    :cond_0
    :try_start_0
    invoke-static {v1}, Le/e/a/Dev112;->page(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v4

    .line 196
    .local v4, "page":Ljava/lang/Object;
    if-eqz v4, :cond_8

    const-string v5, "folder"

    invoke-static {v4, v5}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_1

    move-object/from16 v6, p1

    move-object/from16 v19, v4

    goto/16 :goto_2

    .line 197
    :cond_1
    const-string v5, "videourl"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v6, p1

    :try_start_1
    invoke-static {v6, v5}, Le/e/a/Dev112;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 198
    .local v5, "uri":Ljava/lang/String;
    invoke-static {v4, v5}, Le/e/a/Dev112;->findVideo(Ljava/lang/Object;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 199
    .local v7, "video":Lorg/json/JSONObject;
    if-nez v7, :cond_2

    return-void

    .line 200
    :cond_2
    const-string v8, ""

    invoke-virtual {v7, v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 201
    .local v8, "id":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_3

    return-void

    .line 202
    :cond_3
    const/16 v9, 0x46b6

    invoke-interface {v2, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v10

    .line 203
    .local v10, "item":Landroid/view/MenuItem;
    if-nez v10, :cond_4

    return-void

    .line 204
    :cond_4
    const-string v11, "\u5225\u306e\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306b\u79fb\u52d5"

    const-string v12, "Move to another playlist"

    const-string/jumbo v13, "\u79fb\u81f3\u5176\u4ed6\u64ad\u653e\u6e05\u55ae"

    invoke-static {v1, v11, v12, v13}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 205
    .local v11, "moveText":Ljava/lang/String;
    invoke-interface {v10, v11}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 206
    new-instance v12, Le/e/a/Dev112$2;

    invoke-direct {v12, v1, v8}, Le/e/a/Dev112$2;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 207
    .local v12, "move":Ljava/lang/Runnable;
    new-instance v13, Le/e/a/Dev112$3;

    invoke-direct {v13, v12}, Le/e/a/Dev112$3;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {v10, v13}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 208
    const/4 v13, -0x1

    .line 209
    .local v13, "index":I
    const/4 v14, 0x0

    .local v14, "n":I
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v15

    if-ge v14, v15, :cond_6

    .line 210
    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    .line 211
    .local v15, "action":Ljava/lang/Object;
    invoke-static {v15, v0}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Number;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Number;->intValue()I

    move-result v9

    move-object/from16 v16, v0

    const/16 v0, 0x46b6

    if-ne v9, v0, :cond_5

    move v13, v14

    goto :goto_1

    .line 209
    .end local v15    # "action":Ljava/lang/Object;
    :cond_5
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, v16

    const/16 v9, 0x46b6

    goto :goto_0

    .line 213
    .end local v14    # "n":I
    :cond_6
    :goto_1
    if-gez v13, :cond_7

    return-void

    .line 214
    :cond_7
    const-string v0, "e.e.a.ListActions$Action"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v9, 0x2

    new-array v14, v9, [Ljava/lang/Class;

    const-class v15, Landroid/view/MenuItem;

    const/4 v9, 0x0

    aput-object v15, v14, v9

    const-class v15, Ljava/lang/Runnable;

    const/16 v17, 0x0

    const/4 v9, 0x1

    aput-object v15, v14, v9

    invoke-virtual {v0, v14}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 215
    .local v0, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v0, v9}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 216
    const/4 v14, 0x2

    new-array v15, v14, [Ljava/lang/Object;

    aput-object v10, v15, v17

    aput-object v12, v15, v9

    invoke-virtual {v0, v15}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    invoke-interface {v3, v13, v14}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 217
    const-string v14, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u304b\u3089\u524a\u9664"

    const-string v15, "Remove from playlist"

    const/16 v18, 0x1

    const-string/jumbo v9, "\u5f9e\u64ad\u653e\u6e05\u55ae\u79fb\u9664"

    invoke-static {v1, v14, v15, v9}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 218
    .local v9, "removeText":Ljava/lang/String;
    add-int/lit8 v14, p4, 0x1

    const/16 v15, 0x46b9

    move-object/from16 v19, v4

    const/4 v4, 0x0

    .end local v4    # "page":Ljava/lang/Object;
    .local v19, "page":Ljava/lang/Object;
    invoke-interface {v2, v4, v15, v14, v9}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v14

    .line 219
    .local v14, "removeItem":Landroid/view/MenuItem;
    new-instance v4, Le/e/a/Dev112$4;

    invoke-direct {v4, v1, v8}, Le/e/a/Dev112$4;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 220
    .local v4, "remove":Ljava/lang/Runnable;
    new-instance v15, Le/e/a/Dev112$5;

    invoke-direct {v15, v4}, Le/e/a/Dev112$5;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {v14, v15}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 221
    add-int/lit8 v15, v13, 0x1

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/16 v17, 0x0

    aput-object v14, v1, v17

    aput-object v4, v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v3, v15, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 224
    .end local v0    # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v4    # "remove":Ljava/lang/Runnable;
    .end local v5    # "uri":Ljava/lang/String;
    .end local v7    # "video":Lorg/json/JSONObject;
    .end local v8    # "id":Ljava/lang/String;
    .end local v9    # "removeText":Ljava/lang/String;
    .end local v10    # "item":Landroid/view/MenuItem;
    .end local v11    # "moveText":Ljava/lang/String;
    .end local v12    # "move":Ljava/lang/Runnable;
    .end local v13    # "index":I
    .end local v14    # "removeItem":Landroid/view/MenuItem;
    .end local v19    # "page":Ljava/lang/Object;
    goto :goto_4

    .line 222
    :catch_0
    move-exception v0

    goto :goto_3

    .line 196
    .local v4, "page":Ljava/lang/Object;
    :cond_8
    move-object/from16 v6, p1

    move-object/from16 v19, v4

    .end local v4    # "page":Ljava/lang/Object;
    .restart local v19    # "page":Ljava/lang/Object;
    :goto_2
    return-void

    .line 222
    .end local v19    # "page":Ljava/lang/Object;
    :catch_1
    move-exception v0

    move-object/from16 v6, p1

    .line 223
    .local v0, "error":Ljava/lang/Exception;
    :goto_3
    const-string v1, "nicoid-playlist"

    const-string v4, "Playlist menu customization skipped"

    invoke-static {v1, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 225
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_4
    return-void
.end method

.method public static restoreList(Landroid/widget/ListView;II)V
    .registers 3

    invoke-static {p0, p1, p2}, Le/e/a/SmoothTabRestore204;->restoreList(Landroid/widget/ListView;II)V

    return-void
.end method

.method static show(Landroid/app/AlertDialog;)V
    .registers 7
    .param p0, "d"    # Landroid/app/AlertDialog;

    .line 66
    :try_start_0
    const-string v0, "e.e.a.UiDialogs"

    const-string v1, "show"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/app/AlertDialog;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    invoke-static {v0, v1, v3, v2}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/Exception;
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    .line 68
    .end local v0    # "ignored":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static varargs staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;
    .param p3, "values"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 52
    .local p2, "args":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 53
    .local v0, "m":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 54
    const/4 v1, 0x0

    invoke-virtual {v0, v1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private static thisObject()Ljava/lang/Object;
    .registers 1

    .line 294
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "ja"    # Ljava/lang/String;
    .param p2, "en"    # Ljava/lang/String;
    .param p3, "zh"    # Ljava/lang/String;

    .line 57
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, "lang":Ljava/lang/String;
    const-string v1, "-1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 59
    :cond_0
    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "en"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    const-string v1, "2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "zh"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    :cond_2
    move-object v1, p1

    goto :goto_2

    :cond_3
    :goto_0
    move-object v1, p3

    goto :goto_2

    :cond_4
    :goto_1
    move-object v1, p2

    :goto_2
    return-object v1
.end method

.method private static value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "row"    # Ljava/lang/Object;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 232
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p0, v0, v3

    aput-object p1, v0, v4

    const-string v2, "e.e.a.ListActions"

    const-string v3, "value"

    invoke-static {v2, v3, v1, v0}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static verticalTurnReady(Ljava/lang/Object;Landroid/view/MotionEvent;F)Z
    .registers 13
    .param p0, "state"    # Ljava/lang/Object;
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "density"    # F

    .line 73
    const/4 v0, 0x1

    :try_start_0
    const-string v1, "rules"

    invoke-static {p0, v1}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 74
    .local v1, "rules":Ljava/lang/Object;
    const-string v2, "pattern"

    invoke-static {v1, v2}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 75
    .local v2, "p":Ljava/lang/String;
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_4

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x44

    const/16 v6, 0x55

    if-eq v4, v6, :cond_0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v5, :cond_4

    .line 76
    :cond_0
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v6, :cond_1

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v5, :cond_1

    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v4

    const/high16 v5, 0x3f000000    # 0.5f

    invoke-static {v5, p2}, Ljava/lang/Math;->max(FF)F

    move-result v5

    div-float/2addr v4, v5

    .line 81
    .local v4, "y":F
    sget-object v5, Le/e/a/Dev112;->VERTICAL_TURN:Ljava/util/Map;

    invoke-interface {v5, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Float;

    .line 82
    .local v5, "start":Ljava/lang/Float;
    if-nez v5, :cond_2

    sget-object v6, Le/e/a/Dev112;->VERTICAL_TURN:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-interface {v6, p0, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v3

    .line 83
    :cond_2
    const-string v6, "distance"

    invoke-static {v1, v6}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->floatValue()F

    move-result v6

    .line 84
    .local v6, "base":F
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v7

    sub-float v7, v4, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    const v8, 0x3f59999a    # 0.85f

    mul-float v8, v8, v6

    const/high16 v9, 0x41a00000    # 20.0f

    invoke-static {v9, v8}, Ljava/lang/Math;->max(FF)F

    move-result v8

    cmpg-float v7, v7, v8

    if-gez v7, :cond_3

    return v3

    .line 85
    :cond_3
    sget-object v3, Le/e/a/Dev112;->VERTICAL_TURN:Ljava/util/Map;

    invoke-interface {v3, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    return v0

    .line 77
    .end local v4    # "y":F
    .end local v5    # "start":Ljava/lang/Float;
    .end local v6    # "base":F
    :cond_4
    :goto_0
    sget-object v3, Le/e/a/Dev112;->VERTICAL_TURN:Ljava/util/Map;

    invoke-interface {v3, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    return v0

    .line 87
    .end local v1    # "rules":Ljava/lang/Object;
    .end local v2    # "p":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 88
    .local v1, "error":Ljava/lang/Exception;
    const-string v2, "nicoid-gesture"

    const-string v3, "Vertical threshold fallback"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    return v0
.end method
