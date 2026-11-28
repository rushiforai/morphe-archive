.class public final Le/e/a/BulkVideoActions215;
.super Ljava/lang/Object;
.source "BulkVideoActions215.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/BulkVideoActions215$SelectionIcon;,
        Le/e/a/BulkVideoActions215$Video;
    }
.end annotation


# static fields
.field private static final BUSY:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static final BUTTON_TAG:Ljava/lang/String; = "nicoid_multi_select_sort"

.field private static final MAIN:Landroid/os/Handler;

.field private static final MENU_ADD:I = 0x4e430712

.field private static final MENU_ENTER:I = 0x1

.field private static final REGISTER_TAG:Ljava/lang/String; = "nicoid_multi_register_action"

.field private static final TAG:Ljava/lang/String; = "nicoid-bulk-add"

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 48
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/BulkVideoActions215;->WORK:Ljava/util/concurrent/ExecutorService;

    .line 49
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/BulkVideoActions215;->MAIN:Landroid/os/Handler;

    .line 50
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/BulkVideoActions215;->BUSY:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static accent(Landroid/content/Context;)I
    .registers 5

    .line 54
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 55
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x1010435

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 56
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    return p0

    .line 57
    :cond_0
    iget p0, v0, Landroid/util/TypedValue;->data:I

    return p0

    .line 59
    :cond_1
    const/16 p0, 0xb5

    const/16 v0, 0xa0

    const/4 v1, 0x0

    invoke-static {v1, p0, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result p0

    return p0
.end method

.method static accountAdd(Landroid/app/Activity;Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Le/e/a/BulkVideoActions215$Video;",
            ">;)V"
        }
    .end annotation

    .line 614
    const-string v0, "(?:[0-9]+|deflist)"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->begin(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 615
    :cond_0
    sget-object v0, Le/e/a/BulkVideoActions215;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/BulkVideoActions215$22;

    invoke-direct {v1, p0, p2, p1}, Le/e/a/BulkVideoActions215$22;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 629
    return-void

    .line 614
    :cond_1
    :goto_0
    return-void
.end method

.method static accountChooser(Landroid/app/Activity;Ljava/util/ArrayList;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/ArrayList<",
            "Le/e/a/BulkVideoActions215$Video;",
            ">;)V"
        }
    .end annotation

    .line 572
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->begin(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 573
    :cond_0
    sget-object v0, Le/e/a/BulkVideoActions215;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/BulkVideoActions215$25;

    invoke-direct {v1, p0, p1}, Le/e/a/BulkVideoActions215$25;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 600
    return-void
.end method

.method static accountCreate(Landroid/app/Activity;Ljava/util/ArrayList;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/ArrayList<",
            "Le/e/a/BulkVideoActions215$Video;",
            ">;)V"
        }
    .end annotation

    .line 603
    :try_start_0
    const-string v0, "e.e.a.AccountLists"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 604
    const-string v1, "e.e.a.AccountLists$Created"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 605
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    new-instance v6, Le/e/a/BulkVideoActions215$13;

    invoke-direct {v6, p0, p1}, Le/e/a/BulkVideoActions215$13;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;)V

    invoke-static {v2, v4, v6}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p1

    .line 609
    const-string v2, "create"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    aput-object v1, v4, v3

    invoke-virtual {v0, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 610
    invoke-virtual {v0, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 611
    goto :goto_0

    :catch_0
    move-exception p1

    invoke-static {p1}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    const-string p1, "Unable to create Mylist"

    const-string/jumbo v0, "\u7121\u6cd5\u5efa\u7acb\u6e05\u55ae"

    const-string v1, "\u30de\u30a4\u30ea\u30b9\u30c8\u3092\u4f5c\u6210\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, v1, p1, v0}, Le/e/a/BulkVideoActions215;->toast(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 612
    :goto_0
    return-void
.end method

.method static begin(Landroid/app/Activity;)Z
    .registers 3

    .line 547
    sget-object v0, Le/e/a/BulkVideoActions215;->BUSY:Ljava/util/Set;

    monitor-enter v0

    :try_start_0
    sget-object v1, Le/e/a/BulkVideoActions215;->BUSY:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    monitor-exit v0

    const/4 p0, 0x0

    return p0

    :cond_0
    sget-object v1, Le/e/a/BulkVideoActions215;->BUSY:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    const/4 p0, 0x1

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method static cacheSortRoot(Landroid/app/Activity;)Landroid/view/View;
    .registers 5

    .line 200
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NicoidCacheManagerActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 201
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    return-object p0

    .line 204
    :cond_0
    const-string v0, "R"

    const-string v1, "y"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_2

    aget-object v2, v0, v1

    .line 205
    :try_start_0
    invoke-static {p0, v2}, Le/e/a/BulkVideoActions215;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 206
    instance-of v3, v2, Landroid/view/View;

    if-eqz v3, :cond_1

    move-object v3, v2

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->isShown()Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v3, v2

    check-cast v3, Landroid/view/View;

    .line 207
    invoke-static {v3}, Le/e/a/BulkVideoActions215;->findSpinner(Landroid/view/View;)Landroid/widget/Spinner;

    move-result-object v3

    if-eqz v3, :cond_1

    check-cast v2, Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 208
    :catch_0
    move-exception v2

    :cond_1
    nop

    .line 204
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 209
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static cacheTabAccessibility(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 4

    .line 285
    :try_start_0
    const-string v0, "cache"

    const-string v1, "screen"

    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;->declared(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 286
    const-string v0, "label"

    invoke-static {p0, v0}, Le/e/a/BulkVideoActions215;->declared(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 287
    :cond_0
    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    .line 288
    :goto_0
    return-object p1
.end method

.method static chooseAction(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 8

    .line 493
    invoke-static {p1}, Le/e/a/BulkVideoActions215;->snapshot(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p1

    .line 494
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "Select videos first"

    const-string/jumbo v0, "\u8acb\u5148\u9078\u53d6\u5f71\u7247"

    const-string v1, "\u52d5\u753b\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p0, v1, p1, v0}, Le/e/a/BulkVideoActions215;->toast(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 495
    :cond_0
    nop

    .line 496
    const-string v0, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0"

    const-string v1, "Add to playlist"

    const-string v2, "\u52a0\u5165\u64ad\u653e\u6e05\u55ae"

    invoke-static {p0, v0, v1, v2}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 497
    const-string v1, "\u30de\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0"

    const-string v2, "Add to Mylist"

    const-string v3, "\u52a0\u5165\u6211\u7684\u6e05\u55ae"

    invoke-static {p0, v1, v2, v3}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 498
    const-string v2, "\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0"

    const-string v3, "Add to Watch Later"

    const-string v4, "\u52a0\u5165\u7a0d\u5f8c\u89c0\u770b"

    invoke-static {p0, v2, v3, v4}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    .line 500
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->dialog(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\u4ef6\u3092\u767b\u9332"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Add "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " videos"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u52a0\u5165 "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " \u90e8\u5f71\u7247"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v2, v3, v4}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Le/e/a/BulkVideoActions215$16;

    invoke-direct {v2, p0, p1}, Le/e/a/BulkVideoActions215$16;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;)V

    .line 501
    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 505
    const-string v0, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v1, "Cancel"

    const-string v2, "\u53d6\u6d88"

    invoke-static {p0, v0, v1, v2}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 506
    return-void
.end method

.method static declared(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 68
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static dialog(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;
    .registers 6

    .line 97
    :try_start_0
    const-string v0, "e.e.a.UiDialogs"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "builder"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 98
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlertDialog$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 99
    :catch_0
    move-exception v0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public static discovery(II)Z
    .registers 4

    .line 81
    if-ltz p0, :cond_0

    const/4 v0, 0x5

    if-eq p0, v0, :cond_0

    const/16 v0, 0x8

    if-eq p0, v0, :cond_0

    const/16 v1, 0x9

    if-eq p0, v1, :cond_0

    const/4 p0, 0x4

    if-eq p1, p0, :cond_0

    if-eq p1, v0, :cond_0

    if-eq p1, v1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static dp(Landroid/content/Context;I)I
    .registers 2

    .line 52
    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public static drawCacheTabBadge(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Rect;)V
    .registers 15

    .line 293
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 294
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Canvas;->save()I

    move-result v9

    .line 295
    invoke-virtual {p1}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v10

    .line 296
    invoke-virtual {p1}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v11

    .line 298
    :try_start_0
    iget v2, p2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget v3, p2, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {p0, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 299
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x41800000    # 16.0f

    div-float/2addr v2, v3

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v3

    invoke-virtual {p0, v2, v0}, Landroid/graphics/Canvas;->scale(FF)V

    .line 300
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 301
    const/high16 v0, 0x3fc00000    # 1.5f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 302
    const/high16 v6, 0x40000000    # 2.0f

    const/high16 v7, 0x40000000    # 2.0f

    const v2, 0x3fe66666    # 1.8f

    const v3, 0x40133333    # 2.3f

    const v4, 0x41633333    # 14.2f

    const v5, 0x415b3333    # 13.7f

    move-object v1, p0

    move-object v8, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 303
    const v4, 0x41333333    # 11.2f

    const/high16 v5, 0x40b00000    # 5.5f

    const v2, 0x4099999a    # 4.8f

    const/high16 v3, 0x40b00000    # 5.5f

    move-object v1, p0

    move-object v6, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 305
    invoke-virtual {p1, v10}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 306
    invoke-virtual {p1, v11}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 307
    invoke-virtual {p0, v9}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 308
    nop

    .line 309
    return-void

    .line 305
    :catchall_0
    move-exception v0

    invoke-virtual {p1, v10}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 306
    invoke-virtual {p1, v11}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 307
    invoke-virtual {p0, v9}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 308
    throw v0

    .line 293
    :cond_1
    :goto_0
    return-void
.end method

.method static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 65
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static findSpinner(Landroid/view/View;)Landroid/widget/Spinner;
    .registers 4

    .line 188
    const/4 v0, 0x0

    if-eqz p0, :cond_5

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 189
    :cond_0
    instance-of v1, p0, Landroid/widget/Spinner;

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, p0

    check-cast v0, Landroid/widget/Spinner;

    :cond_1
    return-object v0

    .line 190
    :cond_2
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_4

    .line 191
    check-cast p0, Landroid/view/ViewGroup;

    .line 192
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 193
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Le/e/a/BulkVideoActions215;->findSpinner(Landroid/view/View;)Landroid/widget/Spinner;

    move-result-object v2

    .line 194
    if-eqz v2, :cond_3

    return-object v2

    .line 192
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 197
    :cond_4
    return-object v0

    .line 188
    :cond_5
    :goto_1
    return-object v0
.end method

.method static finish(Landroid/app/Activity;)V
    .registers 3

    .line 549
    sget-object v0, Le/e/a/BulkVideoActions215;->BUSY:Ljava/util/Set;

    monitor-enter v0

    :try_start_0
    sget-object v1, Le/e/a/BulkVideoActions215;->BUSY:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method static fragment(Landroid/app/Activity;)Ljava/lang/Object;
    .registers 2

    .line 71
    :try_start_0
    const-string v0, "F"

    invoke-static {p0, v0}, Le/e/a/BulkVideoActions215;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const/4 p0, 0x0

    return-object p0
.end method

.method static hasMoveAction(Ljava/lang/Object;)Z
    .registers 3

    .line 85
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->kind(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->type(Ljava/lang/Object;)I

    move-result p0

    const/4 v0, 0x4

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static history(Ljava/lang/Object;)Z
    .registers 3

    .line 87
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->kind(Ljava/lang/Object;)I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_1

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->type(Ljava/lang/Object;)I

    move-result p0

    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method static id(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 462
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    .line 463
    :cond_0
    const/16 v1, 0x3f

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 464
    if-gez v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 465
    :goto_0
    const/16 v1, 0x2f

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 466
    if-gez v1, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 467
    :goto_1
    const-string v1, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    move-object v0, p0

    :cond_3
    return-object v0
.end method

.method static initialize(Landroid/app/Activity;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 568
    const-string v0, "e.e.a.VideoDetails"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/content/Context;

    aput-object v4, v2, v3

    const-string v3, "initializeCookies"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 569
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    const/4 v1, 0x0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 570
    return-void
.end method

.method static installSort(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 10

    .line 216
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_7

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 217
    :cond_0
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->cacheSortRoot(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v0

    .line 218
    invoke-static {v0}, Le/e/a/BulkVideoActions215;->findSpinner(Landroid/view/View;)Landroid/widget/Spinner;

    move-result-object v0

    .line 219
    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroid/widget/Spinner;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-nez v1, :cond_1

    goto/16 :goto_2

    .line 220
    :cond_1
    invoke-virtual {v0}, Landroid/widget/Spinner;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 221
    const-string v2, "nicoid_multi_select_sort"

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->syncIcon(Landroid/app/Activity;)V

    return-void

    .line 222
    :cond_2
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v3

    .line 223
    invoke-virtual {v0}, Landroid/widget/Spinner;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    .line 224
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 225
    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 226
    const/16 v7, 0x10

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 227
    const-string v7, "nicoid_multi_select_sort_row"

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 228
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 229
    invoke-virtual {v1, v5, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 230
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v6, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 231
    new-instance v0, Landroid/widget/ImageButton;

    invoke-direct {v0, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 232
    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 233
    const/16 v1, 0x9

    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 234
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 235
    new-instance v1, Le/e/a/BulkVideoActions215$SelectionIcon;

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->accent(Landroid/content/Context;)I

    move-result v2

    const/16 v3, 0x18

    invoke-static {p0, v3}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v1, v6, v2, v3}, Le/e/a/BulkVideoActions215$SelectionIcon;-><init>(ZII)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 236
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 237
    invoke-virtual {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x1010435

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 238
    iget v2, v1, Landroid/util/TypedValue;->resourceId:I

    if-eqz v2, :cond_3

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    goto :goto_0

    :cond_3
    iget v1, v1, Landroid/util/TypedValue;->data:I

    .line 239
    :goto_0
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 241
    :cond_4
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 242
    invoke-virtual {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x101045c

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v2

    if-eqz v2, :cond_5

    iget v2, v1, Landroid/util/TypedValue;->resourceId:I

    if-eqz v2, :cond_5

    .line 243
    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    goto :goto_1

    .line 244
    :cond_5
    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 245
    :goto_1
    const-string v1, "Select multiple"

    const-string/jumbo v2, "\u9078\u53d6\u591a\u500b"

    const-string/jumbo v3, "\u8907\u6570\u9078\u629e"

    invoke-static {p0, v3, v1, v2}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 246
    new-instance v1, Le/e/a/BulkVideoActions215$24;

    invoke-direct {v1, p1, p0}, Le/e/a/BulkVideoActions215$24;-><init>(Ljava/lang/Runnable;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 247
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v1, 0x30

    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-direct {p1, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 248
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->syncIcon(Landroid/app/Activity;)V

    .line 249
    return-void

    .line 219
    :cond_6
    :goto_2
    return-void

    .line 216
    :cond_7
    :goto_3
    return-void
.end method

.method static kind(Ljava/lang/Object;)I
    .registers 2

    .line 74
    :try_start_0
    const-string v0, "g0"

    invoke-static {p0, v0}, Le/e/a/BulkVideoActions215;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const/4 p0, -0x1

    return p0
.end method

.method static synthetic lambda$accountAdd$0(Landroid/app/Activity;Ljava/util/ArrayList;Ljava/lang/String;)V
    .registers 8

    .line 616
    nop

    .line 617
    :try_start_0
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->initialize(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    .line 618
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    move v1, v0

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/BulkVideoActions215$Video;

    .line 620
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://nvapi.nicovideo.jp/v1/users/me/mylists/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 621
    invoke-static {p2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/items?itemId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v2, v2, Le/e/a/BulkVideoActions215$Video;->id:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&description="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 622
    const-string v3, "POST"

    invoke-static {v2, v3}, Le/e/a/BulkVideoActions215;->request(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    add-int/lit8 v0, v0, 0x1

    .line 623
    goto :goto_2

    :catch_1
    move-exception v2

    add-int/lit8 v1, v1, 0x1

    invoke-static {v2}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    .line 624
    :goto_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_3

    .line 625
    :cond_0
    goto :goto_1

    .line 626
    :cond_1
    :goto_3
    nop

    .line 627
    sget-object p1, Le/e/a/BulkVideoActions215;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/BulkVideoActions215$9;

    invoke-direct {p2, p0, v0, v1}, Le/e/a/BulkVideoActions215$9;-><init>(Landroid/app/Activity;II)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 628
    return-void
.end method

.method static synthetic lambda$accountAdd$1(Landroid/app/Activity;II)V
    .registers 4

    .line 627
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->finish(Landroid/app/Activity;)V

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Le/e/a/BulkVideoActions215;->toastResult(Landroid/app/Activity;III)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$accountChooser$0(Landroid/app/Activity;Ljava/util/ArrayList;)V
    .registers 10

    .line 574
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 575
    nop

    .line 577
    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->initialize(Landroid/app/Activity;)V

    .line 578
    const-string v0, "https://nvapi.nicovideo.jp/v1/users/me/mylists?sampleItemCount=3"

    const-string v2, "GET"

    invoke-static {v0, v2}, Le/e/a/BulkVideoActions215;->request(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "data"

    .line 579
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "mylists"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 580
    move v2, v1

    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 581
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 582
    const-string v6, "id"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 583
    const-string v7, "[0-9]+"

    invoke-virtual {v6, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v6, "name"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 580
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 585
    :cond_1
    nop

    .line 586
    const/4 v1, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    :goto_1
    move v2, v1

    .line 587
    nop

    .line 588
    sget-object v6, Le/e/a/BulkVideoActions215;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/BulkVideoActions215$10;

    move-object v1, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Le/e/a/BulkVideoActions215$10;-><init>(Landroid/app/Activity;ZLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {v6, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 599
    return-void
.end method

.method static synthetic lambda$accountChooser$1(Landroid/app/Activity;ZLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 8

    .line 589
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->finish(Landroid/app/Activity;)V

    .line 590
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 591
    :cond_0
    if-nez p1, :cond_1

    const-string p1, "Unable to load Mylists"

    const-string/jumbo p2, "\u7121\u6cd5\u53d6\u5f97\u6211\u7684\u6e05\u55ae"

    const-string p3, "\u30de\u30a4\u30ea\u30b9\u30c8\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, p3, p1, p2}, Le/e/a/BulkVideoActions215;->toast(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 592
    :cond_1
    const-string p1, "Create a Mylist"

    const-string v0, "\u5efa\u7acb\u65b0\u6e05\u55ae"

    const-string/jumbo v1, "\u65b0\u3057\u3044\u30de\u30a4\u30ea\u30b9\u30c8\u3092\u4f5c\u6210"

    invoke-static {p0, v1, p1, v0}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 593
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->dialog(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "Choose Mylist"

    const-string/jumbo v1, "\u9078\u64c7\u6211\u7684\u6e05\u55ae"

    const-string/jumbo v2, "\u767b\u9332\u5148\u306e\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-static {p0, v2, v0, v1}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    .line 594
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/CharSequence;

    new-instance v0, Le/e/a/BulkVideoActions215$14;

    invoke-direct {v0, p3, p0, p4}, Le/e/a/BulkVideoActions215$14;-><init>(Ljava/util/ArrayList;Landroid/app/Activity;Ljava/util/ArrayList;)V

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 597
    const-string p2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string p3, "Cancel"

    const-string p4, "\u53d6\u6d88"

    invoke-static {p0, p2, p3, p4}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 598
    return-void
.end method

.method static synthetic lambda$accountChooser$2(Ljava/util/ArrayList;Landroid/app/Activity;Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 595
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-ge p4, p3, :cond_0

    invoke-virtual {p0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p1, p0, p2}, Le/e/a/BulkVideoActions215;->accountAdd(Landroid/app/Activity;Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_0

    .line 596
    :cond_0
    invoke-static {p1, p2}, Le/e/a/BulkVideoActions215;->accountCreate(Landroid/app/Activity;Ljava/util/ArrayList;)V

    .line 597
    :goto_0
    return-void
.end method

.method static synthetic lambda$accountCreate$0(Landroid/app/Activity;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 606
    const-string p2, "done"

    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    aget-object p2, p4, p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2, p1}, Le/e/a/BulkVideoActions215;->accountAdd(Landroid/app/Activity;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 607
    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic lambda$chooseAction$0(Landroid/app/Activity;Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 502
    if-nez p3, :cond_0

    invoke-static {p0, p1}, Le/e/a/BulkVideoActions215;->local(Landroid/app/Activity;Ljava/util/ArrayList;)V

    goto :goto_0

    .line 503
    :cond_0
    const/4 p2, 0x1

    if-ne p3, p2, :cond_1

    invoke-static {p0, p1}, Le/e/a/BulkVideoActions215;->accountChooser(Landroid/app/Activity;Ljava/util/ArrayList;)V

    goto :goto_0

    .line 504
    :cond_1
    const-string p2, "deflist"

    invoke-static {p0, p2, p1}, Le/e/a/BulkVideoActions215;->accountAdd(Landroid/app/Activity;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 505
    :goto_0
    return-void
.end method

.method static synthetic lambda$installSort$0(Ljava/lang/Runnable;Landroid/app/Activity;Landroid/view/View;)V
    .registers 3

    .line 246
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    sget-object p0, Le/e/a/BulkVideoActions215;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/BulkVideoActions215$21;

    invoke-direct {p2, p1}, Le/e/a/BulkVideoActions215$21;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$installSort$1(Landroid/app/Activity;)V
    .registers 1

    .line 246
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->syncIcon(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$local$0(Landroid/app/Activity;Ljava/util/ArrayList;Ljava/lang/String;)V
    .registers 3

    .line 514
    invoke-static {p0, p2, p1}, Le/e/a/BulkVideoActions215;->localAdd(Landroid/app/Activity;Ljava/lang/String;Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic lambda$localAdd$0(Ljava/util/ArrayList;Ljava/lang/String;[ILjava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 525
    const-string p3, "apply"

    invoke-virtual {p4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    const/4 p4, 0x0

    if-nez p3, :cond_0

    return-object p4

    .line 526
    :cond_0
    const/4 p3, 0x0

    aget-object p5, p5, p3

    .line 527
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "videos"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONArray;

    .line 528
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, p3

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const/4 v3, 0x2

    const-class v5, Ljava/lang/String;

    aput-object v5, v2, v3

    const/4 v3, 0x3

    const-class v5, Ljava/lang/String;

    aput-object v5, v2, v3

    const/4 v3, 0x4

    const-class v5, Ljava/lang/String;

    aput-object v5, v2, v3

    const-string v3, "add"

    invoke-virtual {v1, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 529
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/BulkVideoActions215$Video;

    .line 530
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 531
    iget-object v5, v2, Le/e/a/BulkVideoActions215$Video;->url:Ljava/lang/String;

    iget-object v6, v2, Le/e/a/BulkVideoActions215$Video;->title:Ljava/lang/String;

    iget-object v7, v2, Le/e/a/BulkVideoActions215$Video;->owner:Ljava/lang/String;

    iget-object v2, v2, Le/e/a/BulkVideoActions215$Video;->thumbnail:Ljava/lang/String;

    filled-new-array {p1, v5, v6, v7, v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 532
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-le v2, v3, :cond_1

    aget v2, p2, p3

    add-int/2addr v2, v4

    aput v2, p2, p3

    goto :goto_1

    .line 533
    :cond_1
    aget v2, p2, v4

    add-int/2addr v2, v4

    aput v2, p2, v4

    .line 534
    :goto_1
    goto :goto_0

    .line 535
    :cond_2
    return-object p4
.end method

.method static synthetic lambda$localAdd$1(Landroid/app/Activity;[ILjava/lang/Boolean;)V
    .registers 5

    .line 540
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->finish(Landroid/app/Activity;)V

    .line 541
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    aget v0, p1, p2

    const/4 v1, 0x1

    aget p1, p1, v1

    invoke-static {p0, v0, p1, p2}, Le/e/a/BulkVideoActions215;->toastResult(Landroid/app/Activity;III)V

    .line 542
    :cond_0
    return-void
.end method

.method static synthetic lambda$localMenu$0(Landroid/app/Activity;)V
    .registers 2

    .line 155
    new-instance v0, Le/e/a/BulkVideoActions215$0;

    invoke-direct {v0, p0}, Le/e/a/BulkVideoActions215$0;-><init>(Landroid/app/Activity;)V

    invoke-static {p0, v0}, Le/e/a/BulkVideoActions215;->installSort(Landroid/app/Activity;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$localMenu$1(Landroid/app/Activity;)V
    .registers 1

    .line 155
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->toggleLocal(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$menu$0(Landroid/app/Activity;)V
    .registers 2

    .line 111
    new-instance v0, Le/e/a/BulkVideoActions215$8;

    invoke-direct {v0, p0}, Le/e/a/BulkVideoActions215$8;-><init>(Landroid/app/Activity;)V

    invoke-static {p0, v0}, Le/e/a/BulkVideoActions215;->installSort(Landroid/app/Activity;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$menu$1(Landroid/app/Activity;)V
    .registers 1

    .line 111
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->toggleCache(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$menu$2(Landroid/app/Activity;)V
    .registers 3

    .line 119
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->fragment(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v0

    .line 120
    if-eqz v0, :cond_0

    invoke-static {v0}, Le/e/a/BulkVideoActions215;->kind(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0}, Le/e/a/BulkVideoActions215;->type(Ljava/lang/Object;)I

    move-result v0

    invoke-static {v1, v0}, Le/e/a/BulkVideoActions215;->discovery(II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 121
    new-instance v0, Le/e/a/BulkVideoActions215$23;

    invoke-direct {v0, p0}, Le/e/a/BulkVideoActions215$23;-><init>(Landroid/app/Activity;)V

    invoke-static {p0, v0}, Le/e/a/BulkVideoActions215;->installSort(Landroid/app/Activity;Ljava/lang/Runnable;)V

    .line 122
    :cond_0
    return-void
.end method

.method static synthetic lambda$menu$3(Landroid/app/Activity;)V
    .registers 1

    .line 121
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->toggleNative(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$menu$4(Landroid/app/Activity;)V
    .registers 2

    .line 126
    new-instance v0, Le/e/a/BulkVideoActions215$19;

    invoke-direct {v0, p0}, Le/e/a/BulkVideoActions215$19;-><init>(Landroid/app/Activity;)V

    invoke-static {p0, v0}, Le/e/a/BulkVideoActions215;->installSort(Landroid/app/Activity;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$menu$5(Landroid/app/Activity;)V
    .registers 1

    .line 126
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->toggleNative(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$menu$6(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 3

    .line 135
    const-string p1, "nicoid-bulk-add"

    const-string v0, "Native list selection requested from options menu"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->toggleNative(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$menu$7(Landroid/app/Activity;Ljava/lang/Object;Landroid/view/MenuItem;)Z
    .registers 3

    .line 145
    invoke-static {p0, p1}, Le/e/a/BulkVideoActions215;->chooseAction(Landroid/app/Activity;Ljava/lang/Object;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$onSelectionChanged$0(Ljava/lang/Object;)V
    .registers 16

    .line 358
    if-eqz p0, :cond_12

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NicoidVideoListFragment"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_4

    .line 359
    :cond_0
    const-string v0, "o0"

    invoke-static {p0, v0}, Le/e/a/BulkVideoActions215;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 360
    if-eqz v0, :cond_11

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_11

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_1

    goto/16 :goto_2

    .line 361
    :cond_1
    invoke-static {v0}, Le/e/a/BulkVideoActions215;->syncIcon(Landroid/app/Activity;)V

    .line 362
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->selecting(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return-void

    .line 363
    :cond_2
    const-string v1, "Z"

    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 364
    if-nez v1, :cond_3

    return-void

    .line 365
    :cond_3
    const v2, 0x7f0801bd

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 366
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-nez v2, :cond_4

    return-void

    .line 367
    :cond_4
    check-cast v1, Landroid/view/ViewGroup;

    .line 368
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-eqz v2, :cond_10

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/LinearLayout;

    if-nez v3, :cond_5

    goto/16 :goto_1

    .line 369
    :cond_5
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 373
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->kind(Ljava/lang/Object;)I

    move-result v3

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->type(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v3, v4}, Le/e/a/BulkVideoActions215;->discovery(II)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v4, "\u52a0\u5165\u5df2\u9078\u5f71\u7247"

    const-string v5, "Add selected videos"

    const-string/jumbo v6, "\u9078\u629e\u3057\u305f\u52d5\u753b\u3092\u767b\u9332"

    const-string v7, "\u52a0\u5165"

    const-string v8, "Add"

    const-string/jumbo v9, "\u767b\u9332"

    const-string v10, "nicoid_multi_register_action"

    const/4 v11, 0x1

    if-eqz v3, :cond_9

    .line 374
    :try_start_1
    invoke-virtual {v1, v10}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    .line 375
    if-eqz v3, :cond_6

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 376
    :cond_6
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-lez v3, :cond_8

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/Button;

    if-eqz v3, :cond_8

    .line 377
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 378
    invoke-static {v0, v9, v8, v7}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 379
    invoke-static {v0, v6, v5, v4}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 381
    new-instance v3, Le/e/a/BulkVideoActions215$11;

    invoke-direct {v3, v0, p0}, Le/e/a/BulkVideoActions215$11;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 382
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->snapshot(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_7

    move v2, v11

    :cond_7
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 384
    :cond_8
    return-void

    .line 388
    :cond_9
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->history(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b

    .line 389
    invoke-virtual {v1, v10}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 390
    if-eqz p0, :cond_a

    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 391
    :cond_a
    return-void

    .line 393
    :cond_b
    nop

    .line 394
    invoke-virtual {v1, v10}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 395
    if-nez v3, :cond_d

    .line 396
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 397
    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 398
    const/16 v10, 0x11

    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setGravity(I)V

    .line 399
    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 400
    const/4 v10, 0x2

    const/high16 v12, 0x41600000    # 14.0f

    invoke-virtual {v3, v10, v12}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 401
    invoke-static {v0}, Le/e/a/BulkVideoActions215;->accent(Landroid/content/Context;)I

    move-result v10

    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 402
    const/16 v10, 0xc

    invoke-static {v0, v10}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-static {v0, v10}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-virtual {v3, v12, v2, v10, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 403
    const/16 v10, 0x30

    invoke-static {v0, v10}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v3, v12}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 404
    new-instance v12, Landroid/util/TypedValue;

    invoke-direct {v12}, Landroid/util/TypedValue;-><init>()V

    .line 405
    invoke-virtual {v0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v13

    const v14, 0x101030e

    invoke-virtual {v13, v14, v12, v11}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v13

    if-eqz v13, :cond_c

    iget v13, v12, Landroid/util/TypedValue;->resourceId:I

    if-eqz v13, :cond_c

    .line 408
    iget v12, v12, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v3, v12}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 409
    :cond_c
    invoke-static {v0, v9, v8, v7}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 410
    invoke-static {v0, v6, v5, v4}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 412
    new-instance v4, Le/e/a/BulkVideoActions215$12;

    invoke-direct {v4, v0, p0}, Le/e/a/BulkVideoActions215$12;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 414
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 415
    invoke-static {v0, v10}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v5

    const/4 v6, -0x2

    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 416
    const/16 v5, 0x14

    invoke-static {v0, v5}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v0

    iput v0, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 417
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    invoke-static {v11, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {v1, v3, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 419
    :cond_d
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->snapshot(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_e

    move v2, v11

    :cond_e
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 420
    invoke-virtual {v3}, Landroid/widget/TextView;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_f

    const/high16 p0, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_f
    const p0, 0x3ec28f5c    # 0.38f

    :goto_0
    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setAlpha(F)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 421
    goto :goto_3

    .line 368
    :cond_10
    :goto_1
    return-void

    .line 360
    :cond_11
    :goto_2
    return-void

    .line 421
    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    .line 422
    :goto_3
    return-void

    .line 358
    :cond_12
    :goto_4
    return-void
.end method

.method static synthetic lambda$onSelectionChanged$1(Landroid/app/Activity;Ljava/lang/Object;Landroid/view/View;)V
    .registers 3

    .line 381
    invoke-static {p0, p1}, Le/e/a/BulkVideoActions215;->chooseAction(Landroid/app/Activity;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$onSelectionChanged$2(Landroid/app/Activity;Ljava/lang/Object;Landroid/view/View;)V
    .registers 3

    .line 412
    invoke-static {p0, p1}, Le/e/a/BulkVideoActions215;->chooseAction(Landroid/app/Activity;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$toggleLocal$0(Landroid/app/Activity;)V
    .registers 1

    .line 183
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->syncIcon(Landroid/app/Activity;)V

    return-void
.end method

.method static local(Landroid/app/Activity;Ljava/util/ArrayList;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/ArrayList<",
            "Le/e/a/BulkVideoActions215$Video;",
            ">;)V"
        }
    .end annotation

    .line 511
    :try_start_0
    const-string v0, "e.e.a.LocalPlaylists"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 512
    const-string v1, "choose"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const-class v3, Ljava/util/function/Consumer;

    const/4 v5, 0x2

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 513
    invoke-virtual {v0, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 514
    new-instance v1, Le/e/a/BulkVideoActions215$7;

    invoke-direct {v1, p0, p1}, Le/e/a/BulkVideoActions215$7;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;)V

    const/4 p1, 0x0

    filled-new-array {p0, p1, v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 515
    goto :goto_0

    :catch_0
    move-exception p1

    invoke-static {p1}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    const-string p1, "Unable to open playlists"

    const-string/jumbo v0, "\u7121\u6cd5\u958b\u555f\u64ad\u653e\u6e05\u55ae"

    const-string v1, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, v1, p1, v0}, Le/e/a/BulkVideoActions215;->toast(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    :goto_0
    return-void
.end method

.method static localAdd(Landroid/app/Activity;Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Le/e/a/BulkVideoActions215$Video;",
            ">;)V"
        }
    .end annotation

    .line 519
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->begin(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 521
    :cond_0
    :try_start_0
    const-string v0, "e.e.a.LocalPlaylists"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 522
    const-string v1, "e.e.a.LocalPlaylists$Edit"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 523
    const/4 v2, 0x0

    filled-new-array {v2, v2}, [I

    move-result-object v3

    .line 524
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Class;

    aput-object v1, v6, v2

    new-instance v7, Le/e/a/BulkVideoActions215$17;

    invoke-direct {v7, p2, p1, v3}, Le/e/a/BulkVideoActions215$17;-><init>(Ljava/util/ArrayList;Ljava/lang/String;[I)V

    invoke-static {v4, v6, v7}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p1

    .line 537
    const-string p2, "change"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v2

    aput-object v1, v4, v5

    const-class v1, Ljava/util/function/Consumer;

    const/4 v2, 0x2

    aput-object v1, v4, v2

    invoke-virtual {v0, p2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    .line 538
    invoke-virtual {p2, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 539
    new-instance v0, Le/e/a/BulkVideoActions215$18;

    invoke-direct {v0, p0, v3}, Le/e/a/BulkVideoActions215$18;-><init>(Landroid/app/Activity;[I)V

    filled-new-array {p0, p1, v0}, [Ljava/lang/Object;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p2, v0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 543
    goto :goto_0

    :catch_0
    move-exception p1

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->finish(Landroid/app/Activity;)V

    invoke-static {p1}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    const-string p1, "Unable to add videos"

    const-string/jumbo p2, "\u7121\u6cd5\u65b0\u589e\u5f71\u7247"

    const-string/jumbo v0, "\u767b\u9332\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, v0, p1, p2}, Le/e/a/BulkVideoActions215;->toast(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    :goto_0
    return-void
.end method

.method public static localMenu(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 4

    .line 154
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "nicoid_local_playlists"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 155
    :cond_0
    sget-object p1, Le/e/a/BulkVideoActions215;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/BulkVideoActions215$20;

    invoke-direct {v0, p0}, Le/e/a/BulkVideoActions215$20;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 156
    return-void

    .line 154
    :cond_1
    :goto_0
    return-void
.end method

.method static log(Ljava/lang/Throwable;)V
    .registers 3

    .line 101
    const-string v0, "nicoid-bulk-add"

    const-string v1, "Bulk action failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static menu(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 7

    .line 108
    if-eqz p0, :cond_9

    if-nez p1, :cond_0

    goto/16 :goto_1

    .line 109
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 110
    const-string v1, "NicoidCacheManagerActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 111
    sget-object p1, Le/e/a/BulkVideoActions215;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/BulkVideoActions215$1;

    invoke-direct {v0, p0}, Le/e/a/BulkVideoActions215$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 112
    return-void

    .line 114
    :cond_1
    const-string v1, "NicoidVideoListActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    return-void

    .line 115
    :cond_2
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->fragment(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v0

    .line 116
    if-nez v0, :cond_3

    .line 118
    sget-object p1, Le/e/a/BulkVideoActions215;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/BulkVideoActions215$2;

    invoke-direct {v0, p0}, Le/e/a/BulkVideoActions215$2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 123
    return-void

    .line 125
    :cond_3
    invoke-static {v0}, Le/e/a/BulkVideoActions215;->kind(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0}, Le/e/a/BulkVideoActions215;->type(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v1, v2}, Le/e/a/BulkVideoActions215;->discovery(II)Z

    move-result v1

    .line 126
    if-nez v1, :cond_4

    sget-object v2, Le/e/a/BulkVideoActions215;->MAIN:Landroid/os/Handler;

    new-instance v3, Le/e/a/BulkVideoActions215$3;

    invoke-direct {v3, p0}, Le/e/a/BulkVideoActions215$3;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 127
    :cond_4
    invoke-static {v0}, Le/e/a/BulkVideoActions215;->selecting(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_6

    .line 128
    if-nez v1, :cond_5

    return-void

    .line 131
    :cond_5
    nop

    .line 132
    const-string/jumbo v0, "\u8907\u6570\u9078\u629e"

    const-string v1, "Select multiple"

    const-string/jumbo v2, "\u9078\u53d6\u591a\u500b"

    invoke-static {p0, v0, v1, v2}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 131
    const/4 v1, 0x1

    invoke-interface {p1, v3, v1, v3, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    .line 133
    invoke-interface {p1, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 134
    new-instance v0, Le/e/a/BulkVideoActions215$4;

    invoke-direct {v0, p0}, Le/e/a/BulkVideoActions215$4;-><init>(Landroid/app/Activity;)V

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 138
    goto :goto_0

    .line 141
    :cond_6
    invoke-static {v0}, Le/e/a/BulkVideoActions215;->history(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    invoke-static {v0}, Le/e/a/BulkVideoActions215;->kind(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0}, Le/e/a/BulkVideoActions215;->type(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v1, v2}, Le/e/a/BulkVideoActions215;->discovery(II)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 142
    :cond_7
    const-string v1, "Add selected videos"

    const-string v2, "\u6279\u6b21\u52a0\u5165"

    const-string v4, "\u4e00\u62ec\u767b\u9332"

    invoke-static {p0, v4, v1, v2}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const v2, 0x4e430712    # 8.180051E8f

    const/16 v4, 0x64

    invoke-interface {p1, v3, v2, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    .line 143
    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 144
    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v1, Le/e/a/BulkVideoActions215$5;

    invoke-direct {v1, p0, v0}, Le/e/a/BulkVideoActions215$5;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 148
    :cond_8
    invoke-static {v0}, Le/e/a/BulkVideoActions215;->onSelectionChanged(Ljava/lang/Object;)V

    .line 150
    :goto_0
    return-void

    .line 108
    :cond_9
    :goto_1
    return-void
.end method

.method static newTask()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 557
    const-string v0, "e.e.a.NetworkTask"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 558
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static onSelectionChanged(Ljava/lang/Object;)V
    .registers 3

    .line 356
    sget-object v0, Le/e/a/BulkVideoActions215;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/BulkVideoActions215$15;

    invoke-direct {v1, p0}, Le/e/a/BulkVideoActions215$15;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 423
    return-void
.end method

.method public static playlistDeleteMessage(Ljava/lang/Object;I)Ljava/lang/String;
    .registers 9

    .line 431
    :try_start_0
    const-string v0, "a"

    invoke-static {p0, v0}, Le/e/a/BulkVideoActions215;->declared(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 433
    const-string v1, "selected"

    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;->declared(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    .line 435
    const-string v2, "visible"

    invoke-static {p0, v2}, Le/e/a/BulkVideoActions215;->declared(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    .line 436
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 437
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 438
    const-string v4, "id"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 439
    const-string v4, "title"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 440
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 442
    :cond_0
    goto :goto_0

    .line 443
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "\u9078\u629e\u3057\u305f"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "\u4ef6\u306e\u52d5\u753b\u3092\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u304b\u3089\u524a\u9664\u3057\u307e\u3059\u3002"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Remove "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " selected videos from this playlist?"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "\u78ba\u5b9a\u8981\u5f9e\u64ad\u653e\u6e05\u55ae\u79fb\u9664\u6240\u9078 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " \u90e8\u5f71\u7247\u55ce\uff1f"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, p0, v1, v3}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 447
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x3

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    if-ge v1, v3, :cond_2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v3, "\n\u30fb"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 448
    :cond_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v4, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "\n"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u307b\u304b"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\u4ef6"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "and "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 449
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v4

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " more"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u4ee5\u53ca\u5176\u4ed6 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 450
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v4

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " \u90e8"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 448
    invoke-static {v0, v1, v3, v2}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 451
    :cond_3
    return-object p0

    .line 452
    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\u4ef6\u306e\u52d5\u753b\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static request(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 561
    const-string v0, "e.e.a.VideoDetails"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 562
    const-string v1, "e.e.a.NetworkTask"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 563
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const/4 v3, 0x2

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v2, v3

    const/4 v3, 0x3

    aput-object v1, v2, v3

    const-string v1, "request"

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 564
    invoke-virtual {v0, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 565
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {}, Le/e/a/BulkVideoActions215;->newTask()Ljava/lang/Object;

    move-result-object v2

    filled-new-array {p0, p1, v1, v2}, [Ljava/lang/Object;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {v0, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONObject;

    return-object p0
.end method

.method static selecting(Ljava/lang/Object;)Z
    .registers 3

    .line 89
    :try_start_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v1, "k0"

    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const/4 p0, 0x0

    return p0
.end method

.method static snapshot(Ljava/lang/Object;)Ljava/util/ArrayList;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/ArrayList<",
            "Le/e/a/BulkVideoActions215$Video;",
            ">;"
        }
    .end annotation

    .line 476
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 478
    :try_start_0
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/BulkVideoActions215;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    .line 479
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 480
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "a"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const-string v3, "isselect"

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 481
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 482
    :cond_0
    const-string v0, "videourl"

    invoke-static {v2, v0}, Le/e/a/BulkVideoActions215;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le/e/a/BulkVideoActions215;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 483
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 484
    :cond_1
    const-string v3, ""
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 485
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v6, "y"

    invoke-virtual {v0, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v3, v0

    goto :goto_1

    .line 486
    :catch_0
    move-exception v0

    :cond_2
    :goto_1
    move-object v7, v3

    .line 487
    :try_start_2
    new-instance v3, Le/e/a/BulkVideoActions215$Video;

    const-string v0, "title"

    invoke-static {v2, v0}, Le/e/a/BulkVideoActions215;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "thumbnail"

    invoke-static {v2, v0}, Le/e/a/BulkVideoActions215;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct/range {v3 .. v8}, Le/e/a/BulkVideoActions215$Video;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v4, v3}, Ljava/util/LinkedHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 488
    goto :goto_0

    .line 489
    :cond_3
    goto :goto_2

    :catch_1
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    .line 490
    :goto_2
    new-instance p0, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p0
.end method

.method static syncIcon(Landroid/app/Activity;)V
    .registers 7

    .line 253
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_7

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 254
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const-string v1, "nicoid_multi_select_sort"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 255
    instance-of v1, v0, Landroid/widget/ImageButton;

    if-nez v1, :cond_1

    return-void

    .line 256
    :cond_1
    nop

    .line 258
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "nicoid_local_playlists"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    .line 259
    const-string v2, "e.e.a.LocalPlaylists"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 260
    const-string v4, "PAGES"

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 261
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 262
    if-eqz v2, :cond_2

    .line 263
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "selecting"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 264
    invoke-virtual {v4, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v4, v2}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    .line 266
    :cond_2
    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "NicoidCacheManagerActivity"

    invoke-virtual {v2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 267
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v3, "G"

    invoke-static {p0, v3}, Le/e/a/BulkVideoActions215;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0

    .line 269
    :cond_4
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->fragment(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v2

    .line 270
    if-eqz v2, :cond_5

    invoke-static {v2}, Le/e/a/BulkVideoActions215;->selecting(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_5

    move v1, v3

    .line 272
    :cond_5
    :goto_0
    goto :goto_1

    :catch_0
    move-exception v2

    invoke-static {v2}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    .line 273
    :goto_1
    check-cast v0, Landroid/widget/ImageButton;

    .line 274
    new-instance v2, Le/e/a/BulkVideoActions215$SelectionIcon;

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->accent(Landroid/content/Context;)I

    move-result v3

    const/16 v4, 0x18

    invoke-static {p0, v4}, Le/e/a/BulkVideoActions215;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v2, v1, v3, v4}, Le/e/a/BulkVideoActions215$SelectionIcon;-><init>(ZII)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 275
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setSelected(Z)V

    .line 276
    if-eqz v1, :cond_6

    .line 277
    const-string v1, "Exit multiple selection"

    const-string/jumbo v2, "\u7d50\u675f\u591a\u91cd\u9078\u53d6"

    const-string/jumbo v3, "\u8907\u6570\u9078\u629e\u3092\u7d42\u4e86"

    invoke-static {p0, v3, v1, v2}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    .line 278
    :cond_6
    const-string v1, "Select multiple"

    const-string/jumbo v2, "\u9078\u53d6\u591a\u500b"

    const-string/jumbo v3, "\u8907\u6570\u9078\u629e"

    invoke-static {p0, v3, v1, v2}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 276
    :goto_2
    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 279
    return-void

    .line 253
    :cond_7
    :goto_3
    return-void
.end method

.method static toast(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 92
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 93
    :cond_0
    invoke-static {p0, p1, p2, p3}, Le/e/a/BulkVideoActions215;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 94
    return-void

    .line 92
    :cond_1
    :goto_0
    return-void
.end method

.method static toastResult(Landroid/app/Activity;III)V
    .registers 8

    .line 551
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "\u767b\u9332 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\u4ef6\u30fb\u30b9\u30ad\u30c3\u30d7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\u4ef6\u30fb\u5931\u6557 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\u4ef6"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Added "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " / skipped "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " / failed "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5df2\u65b0\u589e "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, " / \u8df3\u904e "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " / \u5931\u6557 "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, v1, p1}, Le/e/a/BulkVideoActions215;->toast(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 554
    return-void
.end method

.method static toggleCache(Landroid/app/Activity;)V
    .registers 5

    .line 165
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "s"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/app/Activity;->invalidateOptionsMenu()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    .line 167
    :goto_0
    return-void
.end method

.method static toggleLocal(Landroid/app/Activity;)V
    .registers 8

    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->catalogToggle(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 170
    :cond_0
    :try_start_0
    const-string v0, "e.e.a.LocalPlaylists"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 171
    const-string v1, "PAGES"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 172
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 173
    if-eqz v1, :cond_3

    const-string v4, "folder"

    invoke-static {v1, v4}, Le/e/a/BulkVideoActions215;->declared(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1

    goto :goto_1

    .line 174
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "selecting"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 175
    invoke-virtual {v4, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_2

    .line 176
    const-string v1, "back"

    new-array v2, v2, [Ljava/lang/Class;

    const-class v4, Landroid/app/Activity;

    aput-object v4, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 178
    :cond_2
    invoke-virtual {v4, v1, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 179
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "selectionChanged"

    new-array v4, v6, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 180
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v2, v6, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    :goto_0
    invoke-virtual {p0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 183
    sget-object v0, Le/e/a/BulkVideoActions215;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/BulkVideoActions215$6;

    invoke-direct {v1, p0}, Le/e/a/BulkVideoActions215$6;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    goto :goto_2

    .line 173
    :cond_3
    :goto_1
    return-void

    .line 184
    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    .line 185
    :goto_2
    return-void
.end method

.method static toggleNative(Landroid/app/Activity;)V
    .registers 6

    .line 159
    invoke-static {p0}, Le/e/a/BulkVideoActions215;->fragment(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v0

    .line 160
    if-nez v0, :cond_0

    return-void

    .line 161
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "Y"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/app/Activity;->invalidateOptionsMenu()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->log(Ljava/lang/Throwable;)V

    .line 163
    :goto_0
    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 62
    invoke-static {p0, p1, p2, p3}, Le/e/a/LocalePatch215;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static type(Ljava/lang/Object;)I
    .registers 2

    .line 77
    :try_start_0
    const-string v0, "h0"

    invoke-static {p0, v0}, Le/e/a/BulkVideoActions215;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const/4 p0, -0x1

    return p0
.end method

.method static value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 457
    const-string v0, ""

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "a"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v1, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 458
    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v0

    .line 459
    :catch_0
    move-exception p0

    return-object v0
.end method
