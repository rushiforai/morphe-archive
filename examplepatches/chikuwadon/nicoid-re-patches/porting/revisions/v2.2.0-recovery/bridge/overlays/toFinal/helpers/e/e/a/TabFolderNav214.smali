.class public final Le/e/a/TabFolderNav214;
.super Ljava/lang/Object;
.source "TabFolderNav214.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/TabFolderNav214$Snapshot;,
        Le/e/a/TabFolderNav214$GroupAction;
    }
.end annotation


# static fields
.field private static final FOLDER_ACTIONS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/AlertDialog$Builder;",
            "Le/e/a/TabFolderNav214$GroupAction;",
            ">;"
        }
    .end annotation
.end field

.field private static final FROM_ROOT:Ljava/lang/String; = "nicoid_mylist_root_label"

.field private static final LEAVING_FOLDER:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final LOCAL_FOLDER:Ljava/lang/String; = "nicoid-local-folder:"

.field private static final LOCAL_ROOT_LABELS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final MYLIST_ROOTS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/TabFolderNav214$Snapshot;",
            ">;"
        }
    .end annotation
.end field

.field private static final RENAMING:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final SAVED:Ljava/lang/String; = "nicoid_saved_tab_id"

.field private static final TAG:Ljava/lang/String; = "nicoid-folder-tabs"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 39
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Le/e/a/TabFolderNav214;->RENAMING:Ljava/util/Set;

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/TabFolderNav214;->MYLIST_ROOTS:Ljava/util/Map;

    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/TabFolderNav214;->LOCAL_ROOT_LABELS:Ljava/util/Map;

    .line 42
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/TabFolderNav214;->FOLDER_ACTIONS:Ljava/util/WeakHashMap;

    .line 43
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/TabFolderNav214;->LEAVING_FOLDER:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 34
    invoke-static {p0, p1}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Ljava/lang/Object;Ljava/lang/String;)I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 34
    invoke-static {p0, p1}, Le/e/a/TabFolderNav214;->integer(Ljava/lang/Object;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 34
    invoke-static {p0, p1, p2}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static backToMylistRoot(Landroid/app/Activity;)Z
    .registers 15

    .line 324
    const-string v0, ""

    const/4 v1, 0x0

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "NicoidVideoListActivity"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_4

    .line 325
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 326
    if-eqz v2, :cond_9

    const-string v3, "type"

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    const/4 v6, 0x5

    if-ne v5, v6, :cond_9

    const-string v5, "nicoid_saved_tab_id"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    goto/16 :goto_3

    .line 327
    :cond_1
    sget-object v6, Le/e/a/TabFolderNav214;->LEAVING_FOLDER:Ljava/util/WeakHashMap;

    invoke-virtual {v6, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_2

    return v7

    .line 328
    :cond_2
    invoke-virtual {v2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 329
    if-eqz v6, :cond_8

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_3

    goto/16 :goto_2

    .line 330
    :cond_3
    const-string v8, "nicoid_mylist_root_label"

    invoke-virtual {v2, v8}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_4

    sget-object v9, Le/e/a/TabFolderNav214;->MYLIST_ROOTS:Ljava/util/Map;

    invoke-interface {v9, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    return v1

    .line 332
    :cond_4
    :try_start_0
    invoke-static {}, Le/e/a/TabFolderNav214;->model()Ljava/lang/Object;

    move-result-object v9

    .line 333
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "find"

    new-array v12, v7, [Ljava/lang/Class;

    const-class v13, Ljava/lang/String;

    aput-object v13, v12, v1

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 334
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v9, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 335
    if-nez v9, :cond_5

    return v1

    .line 336
    :cond_5
    sget-object v10, Le/e/a/TabFolderNav214;->MYLIST_ROOTS:Ljava/util/Map;

    invoke-interface {v10, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Le/e/a/TabFolderNav214$Snapshot;

    .line 337
    if-eqz v10, :cond_6

    invoke-virtual {v10, v9}, Le/e/a/TabFolderNav214$Snapshot;->restore(Ljava/lang/Object;)V

    goto :goto_1

    .line 339
    :cond_6
    const-string v10, "screen"

    const-string v11, "mylist"

    invoke-static {v9, v10, v11}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v10, "kind"

    const/4 v11, 0x3

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v9, v10, v11}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v9, v3, v10}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 340
    const-string v3, "label"

    invoke-virtual {v2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-nez v10, :cond_7

    .line 341
    const-string v2, "\u30de\u30a4\u30ea\u30b9\u30c8"

    const-string v8, "Mylist"

    const-string/jumbo v10, "\u6211\u7684\u6e05\u55ae"

    invoke-static {p0, v2, v8, v10}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_7
    invoke-virtual {v2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 340
    :goto_0
    invoke-static {v9, v3, v2}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 342
    const-string v2, "url"

    invoke-static {v9, v2, v0}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "item"

    invoke-static {v9, v2, v0}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "folder"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v9, v0, v2}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 344
    :goto_1
    invoke-static {}, Le/e/a/TabFolderNav214;->save()V

    .line 345
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 346
    const-string v2, "com.sauzask.nicoid.NicoidMylistGroupActivity"

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 347
    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 348
    const/high16 v2, 0x20030000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 349
    sget-object v2, Le/e/a/TabFolderNav214;->LEAVING_FOLDER:Ljava/util/WeakHashMap;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, p0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 351
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    invoke-virtual {p0, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 352
    sget-object v0, Le/e/a/TabFolderNav214;->MYLIST_ROOTS:Ljava/util/Map;

    invoke-interface {v0, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 353
    return v7

    .line 354
    :catch_0
    move-exception v0

    sget-object v2, Le/e/a/TabFolderNav214;->LEAVING_FOLDER:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "Unable to navigate to Mylist root"

    invoke-static {p0, v0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    return v1

    .line 329
    :cond_8
    :goto_2
    return v1

    .line 326
    :cond_9
    :goto_3
    return v1

    .line 324
    :cond_a
    :goto_4
    return v1
.end method

.method private static dialog(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;
    .registers 7

    .line 195
    :try_start_0
    const-string v0, "e.e.a.UiDialogs"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 196
    const-string v1, "builder"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 197
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlertDialog$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 198
    :catch_0
    move-exception v0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private static dialogContext(Landroid/app/Activity;)Landroid/content/Context;
    .registers 7

    .line 188
    :try_start_0
    const-string v0, "e.e.a.PlaybackSession"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 189
    const-string v1, "dialogContext"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 190
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 191
    :catch_0
    move-exception v0

    return-object p0
.end method

.method private static field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 4
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

    .line 70
    nop

    :goto_0
    if-eqz p0, :cond_0

    .line 71
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 72
    :catch_0
    move-exception v0

    .line 70
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_0

    .line 73
    :cond_0
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 75
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/TabFolderNav214;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static host(Landroid/app/Activity;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 89
    const-string v0, "e.e.a.MultiTabs227"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 90
    const-string v1, "HOSTS"

    invoke-static {v0, v1}, Le/e/a/TabFolderNav214;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 91
    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static integer(Ljava/lang/Object;Ljava/lang/String;)I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 78
    invoke-static {p0, p1}, Le/e/a/TabFolderNav214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method static synthetic lambda$localMenuListener$0(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface;I)V
    .registers 7

    .line 401
    const/4 v0, 0x3

    if-ne p5, v0, :cond_0

    .line 402
    :try_start_0
    const-string p3, "a"

    invoke-static {p0, p3}, Le/e/a/TabFolderNav214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    invoke-static {p0, p1, p2}, Le/e/a/TabFolderNav214;->localNewTab(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 403
    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Unable to create local playlist tab"

    invoke-static {p1, p0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 404
    :cond_0
    invoke-interface {p3, p4, p5}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 405
    :goto_0
    return-void
.end method

.method static synthetic lambda$mylistMenu$0(Landroid/app/Activity;Le/e/a/TabFolderNav214$GroupAction;Landroid/app/AlertDialog$Builder;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 175
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p3

    if-nez p3, :cond_4

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result p3

    if-eqz p3, :cond_0

    goto :goto_1

    .line 176
    :cond_0
    if-nez p4, :cond_1

    invoke-static {p1}, Le/e/a/TabFolderNav214;->renameMylist(Le/e/a/TabFolderNav214$GroupAction;)V

    goto :goto_0

    .line 177
    :cond_1
    const/4 p3, 0x1

    if-ne p4, p3, :cond_2

    iget-object p2, p1, Le/e/a/TabFolderNav214$GroupAction;->id:Ljava/lang/String;

    iget-object p1, p1, Le/e/a/TabFolderNav214$GroupAction;->title:Ljava/lang/String;

    invoke-static {p0, p2, p1}, Le/e/a/TabFolderNav214;->openMylistNewTab(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 178
    :cond_2
    const/4 p0, 0x2

    if-ne p4, p0, :cond_3

    invoke-static {p2}, Le/e/a/TabFolderNav214;->showDeleteConfirm(Landroid/app/AlertDialog$Builder;)V

    .line 179
    :cond_3
    :goto_0
    return-void

    .line 175
    :cond_4
    :goto_1
    return-void
.end method

.method static synthetic lambda$renameMylist$0(Landroid/widget/EditText;Landroid/app/Activity;Le/e/a/TabFolderNav214$GroupAction;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 223
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 224
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p3

    const/16 p4, 0x64

    if-le p3, p4, :cond_0

    goto :goto_1

    .line 227
    :cond_0
    iget-object p1, p2, Le/e/a/TabFolderNav214$GroupAction;->title:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    sget-object p1, Le/e/a/TabFolderNav214;->RENAMING:Ljava/util/Set;

    iget-object p3, p2, Le/e/a/TabFolderNav214$GroupAction;->id:Ljava/lang/String;

    invoke-interface {p1, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    .line 228
    :cond_1
    new-instance p1, Ljava/lang/Thread;

    new-instance p3, Le/e/a/TabFolderNav214$0;

    invoke-direct {p3, p2, p0}, Le/e/a/TabFolderNav214$0;-><init>(Le/e/a/TabFolderNav214$GroupAction;Ljava/lang/String;)V

    const-string p0, "nicoid-mylist-rename"

    invoke-direct {p1, p3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 229
    return-void

    .line 227
    :cond_2
    :goto_0
    return-void

    .line 225
    :cond_3
    :goto_1
    const-string p0, "Name must be 1\u2013100 characters"

    const-string p2, "\u540d\u7a31\u9808\u70ba1\u81f3100\u500b\u5b57\u5143"

    const-string p3, "\u540d\u524d\u306f1\uff5e100\u6587\u5b57\u3067\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p1, p3, p0, p2}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x1

    invoke-static {p1, p0, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$renameMylist$1(Le/e/a/TabFolderNav214$GroupAction;Ljava/lang/String;)V
    .registers 2

    .line 228
    invoke-static {p0, p1}, Le/e/a/TabFolderNav214;->updateRemoteName(Le/e/a/TabFolderNav214$GroupAction;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$updateRemoteName$0(Le/e/a/TabFolderNav214$GroupAction;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    .line 275
    sget-object v0, Le/e/a/TabFolderNav214;->RENAMING:Ljava/util/Set;

    iget-object v1, p0, Le/e/a/TabFolderNav214$GroupAction;->id:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 276
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 277
    :cond_0
    if-eqz p2, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Could not rename Mylist"

    const-string/jumbo v0, "\u91cd\u65b0\u547d\u540d\u5931\u6557"

    const-string v1, "\u540d\u524d\u5909\u66f4\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-static {p1, v1, p3, v0}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p3, " ("

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, ")"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x1

    invoke-static {p1, p0, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 280
    :cond_1
    :try_start_0
    const-string p2, "z"

    invoke-static {p1, p2}, Le/e/a/TabFolderNav214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/ArrayList;

    .line 281
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 282
    iget-object v1, p0, Le/e/a/TabFolderNav214$GroupAction;->id:Ljava/lang/String;

    const-string v2, "id"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_0

    .line 283
    :cond_2
    const-string p0, "title"

    invoke-interface {v0, p0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    const-string p0, "A"

    invoke-static {p1, p0}, Le/e/a/TabFolderNav214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/widget/ListView;

    .line 285
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p2

    instance-of p2, p2, Landroid/widget/BaseAdapter;

    if-eqz p2, :cond_3

    .line 286
    invoke-virtual {p0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p0

    check-cast p0, Landroid/widget/BaseAdapter;

    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    :cond_3
    goto :goto_1

    :catch_0
    move-exception p0

    const-string p2, "Rename succeeded but UI refresh failed"

    invoke-static {p2, p0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 290
    :goto_1
    const-string p0, "Mylist renamed"

    const-string p2, "\u5df2\u91cd\u65b0\u547d\u540d\u6211\u7684\u6e05\u55ae"

    const-string p3, "\u30de\u30a4\u30ea\u30b9\u30c8\u540d\u3092\u5909\u66f4\u3057\u307e\u3057\u305f"

    invoke-static {p1, p3, p0, p2}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    invoke-static {p1, p0, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 291
    return-void

    .line 276
    :cond_4
    :goto_2
    return-void
.end method

.method public static localActivated(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 8

    .line 445
    const-string v0, "nicoid-local-folder:"

    if-eqz p0, :cond_7

    if-nez p1, :cond_0

    goto/16 :goto_2

    .line 447
    :cond_0
    :try_start_0
    const-string v1, "playlist"

    const-string v2, "screen"

    invoke-static {p1, v2}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    .line 448
    :cond_1
    const-string v1, "item"

    invoke-static {p1, v1}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 449
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_2
    move-object p1, v2

    .line 450
    :goto_0
    const-string v0, "e.e.a.LocalPlaylists"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 451
    const-string v1, "PAGES"

    invoke-static {v0, v1}, Le/e/a/TabFolderNav214;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 452
    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 453
    if-nez p0, :cond_3

    return-void

    .line 454
    :cond_3
    const-string v0, "folder"

    invoke-static {p0, v0}, Le/e/a/TabFolderNav214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 455
    if-nez v0, :cond_4

    if-eqz p1, :cond_5

    :cond_4
    if-eqz v0, :cond_6

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_5
    return-void

    .line 457
    :cond_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "lambda$17$e-e-a-LocalPlaylists$Page"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 459
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 460
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 461
    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "Unable to activate local tab\'s playlist folder"

    invoke-static {p1, p0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 462
    :goto_1
    return-void

    .line 445
    :cond_7
    :goto_2
    return-void
.end method

.method public static localIntent(Landroid/content/Intent;Ljava/lang/Object;)V
    .registers 5

    .line 435
    const-string v0, "nicoid-local-folder:"

    if-eqz p0, :cond_3

    if-nez p1, :cond_0

    goto :goto_1

    .line 437
    :cond_0
    :try_start_0
    const-string v1, "playlist"

    const-string v2, "screen"

    invoke-static {p1, v2}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    .line 438
    :cond_1
    const-string v1, "item"

    invoke-static {p1, v1}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 439
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "nicoid_playlist_folder"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 440
    :cond_2
    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Unable to encode local tab folder"

    invoke-static {p1, p0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 441
    :goto_0
    return-void

    .line 435
    :cond_3
    :goto_1
    return-void
.end method

.method public static localMenuItems(Landroid/content/Context;[Ljava/lang/String;Z)[Ljava/lang/String;
    .registers 7

    if-eqz p1, :cond_0

    if-nez p2, :cond_0

    array-length v0, p1

    add-int/lit8 v1, v0, 0x1

    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    const-string v1, "Open in new tab"

    const-string v2, "\u5728\u65b0\u5206\u9801\u4e2d\u958b\u555f"

    const-string/jumbo v3, "\u65b0\u3057\u3044\u30bf\u30d6\u3067\u958b\u304f"

    invoke-static {p0, v3, v1, v2}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, p1, v0

    :cond_0
    return-object p1
.end method

.method public static localMenuListener(Landroid/content/DialogInterface$OnClickListener;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/DialogInterface$OnClickListener;
    .registers 5

    .line 398
    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    if-eqz p4, :cond_0

    goto :goto_0

    .line 400
    :cond_0
    new-instance p4, Le/e/a/TabFolderNav214$4;

    invoke-direct {p4, p1, p2, p3, p0}, Le/e/a/TabFolderNav214$4;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V

    return-object p4

    .line 398
    :cond_1
    :goto_0
    return-object p0
.end method

.method private static localNewTab(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    .line 410
    :try_start_0
    invoke-static {p0}, Le/e/a/TabFolderNav214;->host(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 411
    :cond_0
    const-string v1, "e.e.a.SavedTabs227$Tab"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 412
    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 413
    new-array v5, v2, [Ljava/lang/Object;

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 414
    const-string v5, "screen"

    const-string v6, "playlist"

    invoke-static {v3, v5, v6}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v5, "kind"

    const/4 v6, 0x2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v3, v5, v6}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 415
    const-string v5, "label"

    invoke-static {v3, v5, p2}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p2, "item"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "nicoid-local-folder:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p2, p1}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 416
    sget-object p1, Le/e/a/TabFolderNav214;->LOCAL_ROOT_LABELS:Ljava/util/Map;

    const-string p2, "id"

    invoke-static {v3, p2}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string/jumbo v5, "\u672c\u4f53\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8"

    const-string v6, "Device playlists"

    const-string/jumbo v7, "\u672c\u6a5f\u64ad\u653e\u6e05\u55ae"

    .line 417
    invoke-static {p0, v5, v6, v7}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 416
    invoke-interface {p1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string p1, "addTab"

    new-array p2, v4, [Ljava/lang/Class;

    aput-object v1, p2, v2

    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    .line 419
    invoke-virtual {p0, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 420
    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Unable to open local folder as separate tab"

    invoke-static {p1, p0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 421
    :goto_0
    return-void
.end method

.method public static localToolbar(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 11

    .line 359
    const-string v0, "id"

    const-string v1, "item"

    if-nez p0, :cond_0

    return-void

    .line 361
    :cond_0
    :try_start_0
    const-string v2, "a"

    invoke-static {p0, v2}, Le/e/a/TabFolderNav214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    .line 362
    if-nez v2, :cond_1

    return-void

    .line 363
    :cond_1
    invoke-static {}, Le/e/a/TabFolderNav214;->selectedTab()Ljava/lang/Object;

    move-result-object v3

    .line 364
    invoke-static {v2}, Le/e/a/TabFolderNav214;->host(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v4

    .line 365
    if-eqz v3, :cond_c

    if-eqz v4, :cond_c

    invoke-static {v3, v0}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "currentId"

    invoke-static {v4, v6}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    const-string v4, "playlist"

    const-string v5, "screen"

    .line 366
    invoke-static {v3, v5}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    goto/16 :goto_3

    .line 367
    :cond_2
    invoke-static {v3, v0}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "folder"

    invoke-static {p0, v4}, Le/e/a/TabFolderNav214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Le/e/a/TabFolderNav214;->strOrEmpty(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 369
    invoke-static {v3, v1}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 370
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v6, "nicoid-local-folder:"

    const-string v7, "label"

    if-eqz v5, :cond_5

    .line 371
    :try_start_1
    sget-object p0, Le/e/a/TabFolderNav214;->LOCAL_ROOT_LABELS:Ljava/util/Map;

    invoke-interface {p0, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    .line 372
    if-nez p0, :cond_4

    invoke-static {v3, v1}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 373
    const-string/jumbo p0, "\u672c\u4f53\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8"

    const-string p1, "Device playlists"

    const-string/jumbo v0, "\u672c\u6a5f\u64ad\u653e\u6e05\u55ae"

    invoke-static {v2, p0, p1, v0}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 374
    :cond_3
    invoke-static {v3, v7}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_0
    nop

    .line 375
    :cond_4
    invoke-static {v3, v1}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_9

    const-string p1, ""

    invoke-static {v3, v1, p1}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 377
    :cond_5
    sget-object v5, Le/e/a/TabFolderNav214;->LOCAL_ROOT_LABELS:Ljava/util/Map;

    invoke-interface {v5, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    sget-object v5, Le/e/a/TabFolderNav214;->LOCAL_ROOT_LABELS:Ljava/util/Map;

    invoke-static {v3, v7}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    :cond_6
    if-eqz p1, :cond_7

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    :cond_7
    invoke-static {v3, v7}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 379
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, v1, p0}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    move-object p0, p1

    .line 381
    :cond_9
    :goto_1
    invoke-static {v3, v7}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    .line 382
    invoke-static {v3, v7, p0}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Le/e/a/TabFolderNav214;->save()V

    invoke-static {v2}, Le/e/a/TabFolderNav214;->updateBar(Landroid/app/Activity;)V

    goto :goto_2

    .line 383
    :cond_a
    invoke-static {v3, v1}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    invoke-static {}, Le/e/a/TabFolderNav214;->save()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 384
    :cond_b
    :goto_2
    goto :goto_4

    .line 366
    :cond_c
    :goto_3
    return-void

    .line 384
    :catch_0
    move-exception p0

    const-string p1, "Unable to synchronize local playlist tab title"

    invoke-static {p1, p0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 385
    :goto_4
    return-void
.end method

.method private static log(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 3

    .line 111
    const-string v0, "nicoid-folder-tabs"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method private static model()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 80
    const-string v0, "e.e.a.MultiTabs227"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 81
    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-string v3, "data"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    const/4 v2, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static mylistMenu(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;
    .registers 8

    .line 163
    sget-object v0, Le/e/a/TabFolderNav214;->FOLDER_ACTIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/TabFolderNav214$GroupAction;

    .line 164
    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    return-object p0

    .line 165
    :cond_0
    iget-object v1, v0, Le/e/a/TabFolderNav214$GroupAction;->activity:Landroid/app/Activity;

    .line 167
    :try_start_0
    invoke-static {v1}, Le/e/a/TabFolderNav214;->dialogContext(Landroid/app/Activity;)Landroid/content/Context;

    move-result-object v2

    .line 168
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/CharSequence;

    const-string v4, "\u540d\u524d\u3092\u5909\u66f4"

    const-string v5, "Rename"

    const-string/jumbo v6, "\u91cd\u65b0\u547d\u540d"

    .line 169
    invoke-static {v2, v4, v5, v6}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string/jumbo v4, "\u65b0\u3057\u3044\u30bf\u30d6\u3067\u958b\u304f"

    const-string v5, "Open in new tab"

    const-string v6, "\u5728\u65b0\u5206\u9801\u4e2d\u958b\u555f"

    .line 170
    invoke-static {v2, v4, v5, v6}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const-string v4, "\u524a\u9664"

    const-string v5, "Delete"

    const-string v6, "\u522a\u9664"

    .line 171
    invoke-static {v2, v4, v5, v6}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    .line 173
    invoke-static {v2}, Le/e/a/TabFolderNav214;->dialog(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    iget-object v5, v0, Le/e/a/TabFolderNav214$GroupAction;->title:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    new-instance v5, Le/e/a/TabFolderNav214$2;

    invoke-direct {v5, v1, v0, p0}, Le/e/a/TabFolderNav214$2;-><init>(Landroid/app/Activity;Le/e/a/TabFolderNav214$GroupAction;Landroid/app/AlertDialog$Builder;)V

    .line 174
    invoke-virtual {v4, v3, v5}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v3, "Cancel"

    const-string v4, "\u53d6\u6d88"

    .line 180
    invoke-static {v2, v1, v3, v4}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 181
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    return-object p0

    .line 182
    :catch_0
    move-exception v0

    const-string v1, "Unable to create Mylist action picker"

    invoke-static {v1, v0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 183
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    return-object p0
.end method

.method private static openMylistNewTab(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .line 311
    :try_start_0
    const-string v0, "e.e.a.CachePlayback"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 312
    const-string v1, "parse"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 313
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    .line 314
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 315
    const-string p1, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 316
    const-string p1, "type"

    const/4 v1, 0x5

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "name"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 317
    const-string p1, "nicoid_mylist_longpress_new_tab"

    invoke-virtual {v0, p1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 318
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 319
    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Unable to launch folder in a new tab"

    invoke-static {p1, p0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 320
    :goto_0
    return-void
.end method

.method public static prepareMylistMenu(Landroid/app/AlertDialog$Builder;Ljava/lang/Object;I)V
    .registers 6

    .line 149
    if-eqz p0, :cond_4

    if-eqz p1, :cond_4

    if-gez p2, :cond_0

    goto :goto_2

    .line 151
    :cond_0
    :try_start_0
    const-string v0, "a"

    invoke-static {p1, v0}, Le/e/a/TabFolderNav214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    .line 153
    const-string v0, "z"

    invoke-static {p1, v0}, Le/e/a/TabFolderNav214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 154
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p2, v1, :cond_1

    return-void

    .line 155
    :cond_1
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map;

    .line 156
    const-string v0, "id"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "title"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 157
    if-eqz v0, :cond_3

    if-nez p2, :cond_2

    goto :goto_0

    .line 158
    :cond_2
    sget-object v1, Le/e/a/TabFolderNav214;->FOLDER_ACTIONS:Ljava/util/WeakHashMap;

    new-instance v2, Le/e/a/TabFolderNav214$GroupAction;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v2, p1, v0, p2}, Le/e/a/TabFolderNav214$GroupAction;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    goto :goto_1

    .line 157
    :cond_3
    :goto_0
    return-void

    .line 159
    :catch_0
    move-exception p0

    const-string p1, "Unable to prepare folder action menu"

    invoke-static {p1, p0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 160
    :goto_1
    return-void

    .line 149
    :cond_4
    :goto_2
    return-void
.end method

.method private static put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 76
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/TabFolderNav214;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private static readBody(Ljava/net/HttpURLConnection;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 302
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 303
    const/16 v1, 0x1000

    :try_start_1
    new-array v1, v1, [B

    const/4 v2, 0x0

    move v3, v2

    .line 304
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_1

    add-int/2addr v3, v4

    const v5, 0x1e8480

    if-gt v3, v5, :cond_0

    invoke-virtual {v0, v1, v2, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Response too large"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 305
    :cond_1
    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 306
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 305
    :cond_2
    return-object v1

    .line 302
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception v0

    if-eqz p0, :cond_3

    :try_start_5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p0

    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    throw v0
.end method

.method private static renameMylist(Le/e/a/TabFolderNav214$GroupAction;)V
    .registers 9

    .line 210
    iget-object v0, p0, Le/e/a/TabFolderNav214$GroupAction;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 211
    :cond_0
    invoke-static {v0}, Le/e/a/TabFolderNav214;->dialogContext(Landroid/app/Activity;)Landroid/content/Context;

    move-result-object v1

    .line 212
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 213
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setSingleLine(Z)V

    iget-object v4, p0, Le/e/a/TabFolderNav214$GroupAction;->title:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 214
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setSelectAllOnFocus(Z)V

    .line 215
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x41a00000    # 20.0f

    mul-float/2addr v3, v4

    float-to-int v3, v3

    .line 216
    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 217
    div-int/lit8 v5, v3, 0x2

    invoke-virtual {v4, v3, v5, v3, v5}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 218
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v3, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 219
    invoke-static {v1}, Le/e/a/TabFolderNav214;->dialog(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string v5, "Rename Mylist"

    const-string/jumbo v6, "\u8b8a\u66f4\u6211\u7684\u6e05\u55ae\u540d\u7a31"

    const-string v7, "\u30de\u30a4\u30ea\u30b9\u30c8\u540d\u3092\u5909\u66f4"

    invoke-static {v1, v7, v5, v6}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 220
    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 221
    const-string v4, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v5, "Cancel"

    const-string v6, "\u53d6\u6d88"

    invoke-static {v1, v4, v5, v6}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 222
    const-string v4, "\u4fdd\u5b58"

    const-string v5, "Save"

    const-string v6, "\u5132\u5b58"

    invoke-static {v1, v4, v5, v6}, Le/e/a/TabFolderNav214;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v4, Le/e/a/TabFolderNav214$3;

    invoke-direct {v4, v2, v0, p0}, Le/e/a/TabFolderNav214$3;-><init>(Landroid/widget/EditText;Landroid/app/Activity;Le/e/a/TabFolderNav214$GroupAction;)V

    invoke-virtual {v3, v1, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 229
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 230
    return-void

    .line 210
    :cond_1
    :goto_0
    return-void
.end method

.method public static restoreMylistRoot(Landroid/app/Activity;)V
    .registers 3

    .line 136
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "NicoidMylistGroupActivity"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_1

    .line 138
    :cond_0
    :try_start_0
    invoke-static {}, Le/e/a/TabFolderNav214;->selectedTab()Ljava/lang/Object;

    move-result-object p0

    .line 139
    if-nez p0, :cond_1

    return-void

    .line 140
    :cond_1
    sget-object v0, Le/e/a/TabFolderNav214;->MYLIST_ROOTS:Ljava/util/Map;

    const-string v1, "id"

    invoke-static {p0, v1}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/TabFolderNav214$Snapshot;

    .line 141
    if-nez v0, :cond_2

    return-void

    .line 142
    :cond_2
    invoke-virtual {v0, p0}, Le/e/a/TabFolderNav214$Snapshot;->restore(Ljava/lang/Object;)V

    invoke-static {}, Le/e/a/TabFolderNav214;->save()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "Unable to restore mylist root label"

    invoke-static {v0, p0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 144
    :goto_0
    return-void

    .line 136
    :cond_3
    :goto_1
    return-void
.end method

.method public static routeMylistTap(Landroid/app/Activity;Landroid/content/Intent;)V
    .registers 10

    .line 115
    const-string v0, "screen"

    const-string v1, "item"

    if-eqz p0, :cond_6

    if-eqz p1, :cond_6

    const-string v2, "type"

    const/4 v3, -0x1

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    const/4 v5, 0x5

    if-ne v4, v5, :cond_6

    .line 116
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    const-string v4, "NicoidMylistGroupActivity"

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_4

    .line 118
    :cond_0
    :try_start_0
    invoke-static {}, Le/e/a/TabFolderNav214;->selectedTab()Ljava/lang/Object;

    move-result-object p0

    .line 119
    if-eqz p0, :cond_5

    const-string v4, "mylist"

    invoke-static {p0, v0}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    goto/16 :goto_2

    .line 120
    :cond_1
    const-string v4, "id"

    invoke-static {p0, v4}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 121
    sget-object v6, Le/e/a/TabFolderNav214;->MYLIST_ROOTS:Ljava/util/Map;

    invoke-interface {v6, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    sget-object v6, Le/e/a/TabFolderNav214;->MYLIST_ROOTS:Ljava/util/Map;

    new-instance v7, Le/e/a/TabFolderNav214$Snapshot;

    invoke-direct {v7, p0}, Le/e/a/TabFolderNav214$Snapshot;-><init>(Ljava/lang/Object;)V

    invoke-interface {v6, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    :cond_2
    const-string v6, "list"

    invoke-static {p0, v0, v6}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 123
    const-string v0, "kind"

    const/4 v6, 0x3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p0, v0, v6}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p0, v2, v0}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 124
    const-string v0, "label"

    const-string v2, "name"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v2}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 125
    const-string v0, "url"

    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v5, ""

    if-nez v2, :cond_3

    move-object v2, v5

    goto :goto_0

    :cond_3
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-static {p0, v0, v2}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 126
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    goto :goto_1

    :cond_4
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-static {p0, v1, v5}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 127
    const-string v0, "folder"

    const-string v1, "folderid"

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v0, v1}, Le/e/a/TabFolderNav214;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 128
    const-string p0, "nicoid_saved_tab_id"

    invoke-virtual {p1, p0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 129
    const-string p0, "nicoid_mylist_root_label"

    sget-object v0, Le/e/a/TabFolderNav214;->MYLIST_ROOTS:Ljava/util/Map;

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/TabFolderNav214$Snapshot;

    iget-object v0, v0, Le/e/a/TabFolderNav214$Snapshot;->label:Ljava/lang/String;

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    invoke-static {}, Le/e/a/TabFolderNav214;->save()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 131
    goto :goto_3

    .line 119
    :cond_5
    :goto_2
    return-void

    .line 131
    :catch_0
    move-exception p0

    const-string p1, "Unable to reuse selected mylist tab"

    invoke-static {p1, p0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 132
    :goto_3
    return-void

    .line 116
    :cond_6
    :goto_4
    return-void
.end method

.method public static sameLocalTab(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 7

    .line 425
    const-string v0, "item"

    const-string v1, "screen"

    const-string v2, "playlist"

    const/4 v3, 0x0

    if-eqz p0, :cond_3

    if-nez p1, :cond_0

    goto :goto_1

    .line 427
    :cond_0
    :try_start_0
    invoke-static {p0, v1}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 428
    invoke-static {p1, v1}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 429
    :cond_1
    invoke-static {p0, v0}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, v0}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 428
    :cond_2
    :goto_0
    const/4 p0, 0x1

    return p0

    .line 430
    :catch_0
    move-exception p0

    const-string p1, "Unable to compare local folder tab identities"

    invoke-static {p1, p0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    return v3

    .line 425
    :cond_3
    :goto_1
    return v3
.end method

.method private static save()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 94
    const-string v0, "e.e.a.MultiTabs227"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 95
    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-string v3, "save"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    const/4 v2, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    return-void
.end method

.method private static selectedTab()Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 84
    invoke-static {}, Le/e/a/TabFolderNav214;->model()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "selected"

    invoke-static {v0, v1}, Le/e/a/TabFolderNav214;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 85
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const-string v5, "find"

    invoke-virtual {v2, v5, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 86
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static sessionHeaders(Ljava/net/HttpURLConnection;Ljava/lang/String;)V
    .registers 3

    .line 294
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 295
    const-string v0, "Cookie"

    invoke-virtual {p0, v0, p1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    const-string p1, "X-Frontend-Id"

    const-string v0, "6"

    invoke-virtual {p0, p1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    const-string p1, "X-Frontend-Version"

    const-string v0, "0"

    invoke-virtual {p0, p1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    const-string p1, "X-Request-With"

    const-string v0, "https://www.nicovideo.jp"

    invoke-virtual {p0, p1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    const-string p1, "Accept"

    const-string v0, "application/json"

    invoke-virtual {p0, p1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    return-void
.end method

.method private static showDeleteConfirm(Landroid/app/AlertDialog$Builder;)V
    .registers 7

    .line 201
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 203
    :try_start_0
    const-string v0, "e.e.a.PlaybackSession"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 204
    const-string v1, "showDialog"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/app/AlertDialog;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 205
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    .line 207
    :goto_0
    return-void
.end method

.method private static str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 77
    invoke-static {p0, p1}, Le/e/a/TabFolderNav214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static strOrEmpty(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    .line 386
    if-nez p0, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    .line 103
    :try_start_0
    const-string v0, "e.e.a.PanelUi"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 104
    const-string v1, "tr"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/String;

    const/4 v5, 0x2

    aput-object v3, v2, v5

    const-class v3, Ljava/lang/String;

    const/4 v5, 0x3

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 105
    invoke-virtual {v0, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 106
    :catch_0
    move-exception v0

    .line 107
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 108
    const-string v0, "ja"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "zh"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    move-object p1, p3

    goto :goto_0

    :cond_1
    move-object p1, p2

    :goto_0
    return-object p1
.end method

.method private static updateBar(Landroid/app/Activity;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 98
    invoke-static {p0}, Le/e/a/TabFolderNav214;->host(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_0

    return-void

    .line 99
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "bar"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    return-void
.end method

.method private static updateRemoteName(Le/e/a/TabFolderNav214$GroupAction;Ljava/lang/String;)V
    .registers 18

    .line 233
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v0, "UTF-8"

    iget-object v3, v1, Le/e/a/TabFolderNav214$GroupAction;->activity:Landroid/app/Activity;

    .line 234
    nop

    .line 235
    nop

    .line 237
    const/4 v4, 0x0

    :try_start_0
    iget-object v5, v1, Le/e/a/TabFolderNav214$GroupAction;->id:Ljava/lang/String;

    const-string v6, "[0-9]+"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 238
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "https://nvapi.nicovideo.jp/v1/users/me/mylists/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v1, Le/e/a/TabFolderNav214$GroupAction;->id:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 239
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v6

    const-string v7, "https://nvapi.nicovideo.jp/"

    invoke-virtual {v6, v7}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 240
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1

    :cond_0
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v6

    const-string v7, "https://www.nicovideo.jp/"

    invoke-virtual {v6, v7}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 241
    :cond_1
    if-eqz v6, :cond_b

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_b

    .line 242
    new-instance v7, Ljava/net/URL;

    invoke-direct {v7, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v7}, Lnicoid/network238/ApiConnection254;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v7

    check-cast v7, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 243
    :try_start_1
    const-string v8, "GET"

    invoke-virtual {v7, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 244
    const/16 v8, 0x2ee0

    invoke-virtual {v7, v8}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v7, v8}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 245
    invoke-static {v7, v6}, Le/e/a/TabFolderNav214;->sessionHeaders(Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    .line 246
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v9

    const/16 v10, 0xc8

    if-ne v9, v10, :cond_a

    .line 247
    new-instance v9, Lorg/json/JSONObject;

    invoke-static {v7}, Le/e/a/TabFolderNav214;->readBody(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 248
    const-string v11, "data"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 249
    if-nez v9, :cond_2

    move-object v9, v4

    goto :goto_0

    :cond_2
    const-string v11, "mylist"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 250
    :goto_0
    if-eqz v9, :cond_9

    .line 251
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 252
    :try_start_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 253
    const-string v11, "name="

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v2, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    const-string v11, "description"

    const-string v12, "defaultSortKey"

    const-string v13, "defaultSortOrder"

    const-string v14, "isPublic"

    filled-new-array {v11, v12, v13, v14}, [Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    :goto_1
    const/4 v13, 0x4

    if-ge v12, v13, :cond_4

    aget-object v13, v11, v12

    .line 255
    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3

    const/16 v14, 0x26

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v15, 0x3d

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    .line 256
    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    :cond_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 258
    :cond_4
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lnicoid/network238/ApiConnection254;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/net/HttpURLConnection;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 259
    :try_start_3
    const-string v0, "PUT"

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 260
    invoke-virtual {v5, v8}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v5, v8}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 261
    invoke-static {v5, v6}, Le/e/a/TabFolderNav214;->sessionHeaders(Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    .line 262
    const-string v0, "Content-Type"

    const-string v6, "application/x-www-form-urlencoded; charset=UTF-8"

    invoke-virtual {v5, v0, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    const/4 v0, 0x1

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 264
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 265
    :try_start_4
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 266
    if-eqz v6, :cond_5

    :try_start_5
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    .line 267
    :cond_5
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 268
    if-eq v0, v10, :cond_7

    const/16 v6, 0xcc

    if-ne v0, v6, :cond_6

    goto :goto_2

    :cond_6
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Mylist rename: HTTP "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 272
    :cond_7
    :goto_2
    if-eqz v5, :cond_f

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_6

    .line 264
    :catchall_0
    move-exception v0

    move-object v4, v0

    if-eqz v6, :cond_8

    :try_start_6
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v0

    :try_start_7
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8
    :goto_3
    throw v4
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 272
    :catchall_2
    move-exception v0

    move-object v4, v5

    goto/16 :goto_7

    .line 269
    :catch_0
    move-exception v0

    move-object v4, v5

    goto :goto_4

    .line 250
    :cond_9
    :try_start_8
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v4, "Mylist metadata missing"

    invoke-direct {v0, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 246
    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Mylist information GET: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 272
    :catchall_3
    move-exception v0

    move-object v4, v7

    goto :goto_7

    .line 269
    :catch_1
    move-exception v0

    move-object v4, v7

    goto :goto_4

    .line 241
    :cond_b
    :try_start_9
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v5, "Niconico login cookie unavailable"

    invoke-direct {v0, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 237
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v5, "Invalid Mylist ID"

    invoke-direct {v0, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 272
    :catchall_4
    move-exception v0

    goto :goto_7

    .line 269
    :catch_2
    move-exception v0

    .line 270
    :goto_4
    :try_start_a
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_d

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    goto :goto_5

    :cond_d
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    .line 271
    :goto_5
    const-string v6, "Mylist rename failed safely"

    invoke-static {v6, v0}, Le/e/a/TabFolderNav214;->log(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 272
    if-eqz v4, :cond_e

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 273
    :cond_e
    move-object v4, v5

    :cond_f
    :goto_6
    nop

    .line 274
    new-instance v0, Le/e/a/TabFolderNav214$1;

    invoke-direct {v0, v1, v3, v4, v2}, Le/e/a/TabFolderNav214$1;-><init>(Le/e/a/TabFolderNav214$GroupAction;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 292
    return-void

    .line 272
    :goto_7
    if-eqz v4, :cond_10

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_10
    throw v0
.end method
