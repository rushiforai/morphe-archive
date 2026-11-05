.class public final Le/e/a/ModernShorts;
.super Ljava/lang/Object;
.source "ModernShorts.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ModernShorts$Feed;,
        Le/e/a/ModernShorts$Home;,
        Le/e/a/ModernShorts$Item;,
        Le/e/a/ModernShorts$Result;,
        Le/e/a/ModernShorts$State;
    }
.end annotation


# static fields
.field private static final FEEDS:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Le/e/a/ModernShorts$Feed;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final MENU_STATE:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final MODE:Ljava/lang/String; = "nicoid_re_shorts"

.field private static final PATCH_VERSION:Ljava/lang/String; = "v1.10.1 @chikuwadon"

.field private static final PLAYER:Ljava/lang/String; = "com.sauzask.nicoid.NicoidVideoActivity"

.field private static final REFRESH_MONITORS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final REFRESH_WATCH:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final REQUESTS:Ljava/util/concurrent/ThreadPoolExecutor;

.field private static final SESSION:Ljava/lang/String; = "nicoid_re_shorts_session"

.field private static final STATES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/ModernShorts$State;",
            ">;"
        }
    .end annotation
.end field

.field private static registered:Z


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 68
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/ModernShorts;->MAIN:Landroid/os/Handler;

    .line 69
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 70
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 69
    const/4 v3, 0x2

    const/4 v4, 0x2

    const-wide/16 v5, 0x1e

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    sput-object v0, Le/e/a/ModernShorts;->REQUESTS:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 71
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Le/e/a/ModernShorts;->FEEDS:Ljava/util/LinkedHashMap;

    .line 72
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    .line 73
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ModernShorts;->MENU_STATE:Ljava/util/WeakHashMap;

    .line 74
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ModernShorts;->REFRESH_WATCH:Ljava/util/WeakHashMap;

    .line 75
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;

    .line 76
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/content/Context;I)I
    .registers 2

    .line 114
    invoke-static {p0, p1}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$1()Ljava/util/WeakHashMap;
    .registers 1

    .line 72
    sget-object v0, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$10(Le/e/a/ModernShorts$State;)V
    .registers 1

    .line 712
    invoke-static {p0}, Le/e/a/ModernShorts;->cancelRequest(Le/e/a/ModernShorts$State;)V

    return-void
.end method

.method static synthetic access$2(Le/e/a/ModernShorts$Feed;)V
    .registers 1

    .line 672
    invoke-static {p0}, Le/e/a/ModernShorts;->remember(Le/e/a/ModernShorts$Feed;)V

    return-void
.end method

.method static synthetic access$3(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .registers 2

    .line 167
    invoke-static {p0, p1}, Le/e/a/ModernShorts;->player(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4()Ljava/util/WeakHashMap;
    .registers 1

    .line 75
    sget-object v0, Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$5(Landroid/app/Activity;I)V
    .registers 2

    .line 874
    invoke-static {p0, p1}, Le/e/a/ModernShorts;->monitorRefresh(Landroid/app/Activity;I)V

    return-void
.end method

.method static synthetic access$6()Ljava/util/WeakHashMap;
    .registers 1

    .line 73
    sget-object v0, Le/e/a/ModernShorts;->MENU_STATE:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$7(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 113
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$8(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    .registers 2

    .line 578
    invoke-static {p0, p1}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$9(Ljava/lang/Exception;)V
    .registers 1

    .line 889
    invoke-static {p0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    return-void
.end method

.method public static active(Landroid/app/Activity;)Z
    .registers 2

    .line 674
    sget-object v0, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/ModernShorts$State;

    if-eqz p0, :cond_14

    iget-boolean v0, p0, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_14

    iget-object p0, p0, Le/e/a/ModernShorts$State;->video:Landroid/view/View;

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public static addMenu(Landroid/content/Context;Ljava/util/ArrayList;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "*>;)V"
        }
    .end annotation

    .line 204
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 205
    invoke-static {p0}, Le/e/a/ModernShorts;->register(Landroid/content/Context;)V

    .line 206
    invoke-static {p1}, Le/e/a/ModernShorts;->removeMovedMenuRows(Ljava/util/ArrayList;)V

    .line 207
    instance-of v0, p0, Landroid/app/Activity;

    const/4 v1, 0x1

    const-string v2, "show_shorts_menu"

    if-eqz v0, :cond_30

    sget-object v0, Le/e/a/ModernShorts;->MENU_STATE:Ljava/util/WeakHashMap;

    move-object v3, p0

    check-cast v3, Landroid/app/Activity;

    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    :cond_30
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_3b

    return-void

    .line 209
    :cond_3b
    const-string v0, "ss0"

    invoke-static {p0, v0}, Le/e/a/ModernShorts;->player(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid-re://shorts"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v5

    .line 210
    const-string v4, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u306e\u8996\u8074"

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-string v3, "\u30b7\u30e7\u30fc\u30c8"

    move-object v1, p1

    invoke-static/range {v1 .. v6}, Le/e/a/ModernShorts;->addMenuRow(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    .line 211
    return-void
.end method

.method private static addMenuRow(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V
    .registers 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "*>;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/content/Intent;",
            "I)V"
        }
    .end annotation

    .line 239
    :try_start_0
    const-string v0, "com.sauzask.nicoid.NicoidTopActivity"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "a"

    const/4 v2, 0x6

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/util/ArrayList;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    .line 240
    const-class v4, Ljava/lang/String;

    const/4 v7, 0x2

    aput-object v4, v3, v7

    const-class v4, Ljava/lang/String;

    const/4 v8, 0x3

    aput-object v4, v3, v8

    const-class v4, Landroid/content/Intent;

    const/4 v9, 0x4

    aput-object v4, v3, v9

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v10, 0x5

    aput-object v4, v3, v10

    .line 239
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 240
    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v1, v6

    aput-object p2, v1, v7

    aput-object p3, v1, v8

    aput-object p4, v1, v9

    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v10

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_47} :catch_48

    .line 241
    goto :goto_4c

    :catch_48
    move-exception v0

    invoke-static {v0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 242
    :goto_4c
    return-void
.end method

.method private static append(Landroid/content/Context;Le/e/a/ModernShorts$Feed;Ljava/util/ArrayList;)I
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Le/e/a/ModernShorts$Feed;",
            "Ljava/util/ArrayList<",
            "Le/e/a/ModernShorts$Item;",
            ">;)I"
        }
    .end annotation

    .line 665
    iget-object v0, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {p0}, Le/e/a/ContentFilter;->rules(Landroid/content/Context;)Le/e/a/ContentFilter$Rules;

    move-result-object p0

    .line 666
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iget-object v2, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_55

    .line 667
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1f
    :goto_1f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-nez p2, :cond_2d

    .line 670
    iget-object p0, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    sub-int/2addr p0, v0

    return p0

    .line 667
    :cond_2d
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Le/e/a/ModernShorts$Item;

    .line 668
    iget-object v2, p2, Le/e/a/ModernShorts$Item;->title:Ljava/lang/String;

    iget-object v4, p2, Le/e/a/ModernShorts$Item;->channel:Ljava/lang/String;

    invoke-virtual {p0, v2, v4}, Le/e/a/ContentFilter$Rules;->blocked(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1f

    iget-object v2, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v4, 0xc8

    if-ge v2, v4, :cond_1f

    iget-object v2, p2, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    iget-object v2, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1f

    .line 666
    :cond_55
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/ModernShorts$Item;

    iget-object v3, v3, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_15
.end method

.method public static attach(Landroid/app/Activity;)V
    .registers 9

    invoke-static {p0}, Le/e/a/CastControls218;->phone(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 456
    :cond_7
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_14

    move-object v2, v1

    goto :goto_18

    :cond_14
    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    .line 457
    :goto_18
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "nicoid_re_shorts"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_34

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    const-string v3, "/shorts/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_34

    :cond_33
    return-void

    .line 458
    :cond_34
    invoke-static {v2}, Le/e/a/ShortsRules;->videoId(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3b

    return-void

    .line 459
    :cond_3b
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/4 v3, 0x1

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 460
    sget-object v0, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    return-void

    .line 461
    :cond_4c
    invoke-static {p0}, Le/e/a/ModernShorts;->register(Landroid/content/Context;)V

    invoke-virtual {p0, v3}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 462
    new-instance v0, Le/e/a/ModernShorts$State;

    invoke-direct {v0, v1}, Le/e/a/ModernShorts$State;-><init>(Le/e/a/ModernShorts$State;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v6, "nicoid_re_shorts_index"

    invoke-virtual {v4, v6, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    iput v4, v0, Le/e/a/ModernShorts$State;->index:I

    .line 463
    sget-object v4, Le/e/a/ModernShorts;->FEEDS:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "nicoid_re_shorts_session"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/ModernShorts$Feed;

    iput-object v4, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    .line 464
    iget-object v4, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    if-nez v4, :cond_97

    new-instance v4, Le/e/a/ModernShorts$Feed;

    invoke-direct {v4, v1}, Le/e/a/ModernShorts$Feed;-><init>(Le/e/a/ModernShorts$Feed;)V

    iput-object v4, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    new-instance v4, Le/e/a/ModernShorts$Item;

    const-string v6, "\u73fe\u5728\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-direct {v4, v2, v6}, Le/e/a/ModernShorts$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput v5, v0, Le/e/a/ModernShorts$State;->index:I

    iget-object v1, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {v1}, Le/e/a/ModernShorts;->remember(Le/e/a/ModernShorts$Feed;)V

    .line 465
    :cond_97
    iget v1, v0, Le/e/a/ModernShorts$State;->index:I

    if-ltz v1, :cond_a7

    iget v1, v0, Le/e/a/ModernShorts$State;->index:I

    iget-object v4, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v4, v4, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v1, v4, :cond_a9

    :cond_a7
    iput v5, v0, Le/e/a/ModernShorts$State;->index:I

    .line 466
    :cond_a9
    sget-object v1, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    invoke-static {p0, v0, v5}, Le/e/a/ModernShorts;->install(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    .line 468
    iget-object v1, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v3, :cond_be

    invoke-static {p0, v0, v2, v5}, Le/e/a/ModernShorts;->extend(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V

    .line 469
    :cond_be
    return-void
.end method

.method public static bootstrap(Landroid/app/Activity;)Z
    .registers 6

    .line 310
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 311
    if-eqz v0, :cond_7e

    const-string v1, "nicoid-re"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7e

    const-string v1, "shorts"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    goto :goto_7e

    .line 312
    :cond_23
    invoke-static {p0}, Le/e/a/ModernShorts;->register(Landroid/content/Context;)V

    .line 313
    new-instance v0, Le/e/a/ModernShorts$State;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le/e/a/ModernShorts$State;-><init>(Le/e/a/ModernShorts$State;)V

    new-instance v2, Le/e/a/ModernShorts$Feed;

    invoke-direct {v2, v1}, Le/e/a/ModernShorts$Feed;-><init>(Le/e/a/ModernShorts$Feed;)V

    iput-object v2, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    const/4 v1, 0x1

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->home:Z

    sget-object v2, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    invoke-virtual {p0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 315
    invoke-static {p0}, Le/e/a/ModernShorts;->buildHome(Landroid/app/Activity;)Le/e/a/ModernShorts$Home;

    move-result-object v2

    iget-object v3, v2, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v3}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    iget-object v3, v2, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    iput-object v3, v0, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    .line 316
    new-instance v3, Le/e/a/ModernShorts$$ExternalSyntheticLambda23;

    invoke-direct {v3, v0, p0, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda23;-><init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;)V

    iput-object v3, v0, Le/e/a/ModernShorts$State;->redraw:Ljava/lang/Runnable;

    .line 317
    iget-object v3, v2, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda24;

    invoke-direct {v4, p0, v0, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda24;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 318
    iget-object v3, v2, Le/e/a/ModernShorts$Home;->refresh:Landroid/widget/ImageButton;

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda25;

    invoke-direct {v4, v2, p0, v0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda25;-><init>(Le/e/a/ModernShorts$Home;Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 322
    iget-object v3, v2, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;

    invoke-direct {v4, p0, v0, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 323
    iget-object v3, v2, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda27;

    invoke-direct {v4, p0, v0, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda27;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 329
    invoke-static {p0, v0, v2, v1}, Le/e/a/ModernShorts;->loadFeed(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V

    .line 330
    return v1

    .line 311
    :cond_7e
    :goto_7e
    const/4 p0, 0x0

    return p0
.end method

.method private static buildHome(Landroid/app/Activity;)Le/e/a/ModernShorts$Home;
    .registers 15

    .line 340
    new-instance v0, Le/e/a/ModernShorts$Home;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le/e/a/ModernShorts$Home;-><init>(Le/e/a/ModernShorts$Home;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 341
    iget-object v1, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    const/16 v3, 0x14

    invoke-static {p0, v3}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v5, 0x12

    invoke-static {p0, v5}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p0, v3}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v6, 0xc

    invoke-static {p0, v6}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v1, v4, v5, v3, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 342
    iget-object v1, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    const v3, 0x1010031

    const v4, -0xefeeea

    invoke-static {p0, v3, v4}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 343
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x10

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 344
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 345
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v7, "\u30b7\u30e7\u30fc\u30c8"

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x41e00000    # 28.0f

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 346
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v5, v7, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 347
    const v7, 0x1010036

    const/4 v8, -0x1

    invoke-static {p0, v7, v8}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 348
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v9, "\u6c17\u306b\u306a\u308b\u52d5\u753b\u3092\u9078\u3093\u3067\u518d\u751f"

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v9, 0x41600000    # 14.0f

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 349
    const v10, 0x1010038

    const v11, -0x47443b

    invoke-static {p0, v10, v11}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v12

    invoke-virtual {v7, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 350
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, 0x0

    const/4 v12, -0x2

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v5, v7, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 351
    iget-object v4, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 352
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 353
    invoke-static {p0, v6}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v5, 0x8

    invoke-static {p0, v5}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v1, v7, v4, v7, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 354
    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    iget-object v4, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    invoke-virtual {v4, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    const/high16 v4, 0x41800000    # 16.0f

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setTextSize(F)V

    .line 355
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    const-string v4, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u691c\u7d22"

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    const/4 v4, 0x3

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 356
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x34

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v2, v7, v4, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 357
    invoke-static {p0, v5}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iget-object v4, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    invoke-virtual {v1, v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 358
    const-string v2, "\u691c\u7d22"

    invoke-static {p0, v2}, Le/e/a/ModernShorts;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, v0, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x30

    invoke-static {p0, v6}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v4, v12, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 359
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 360
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    const-string v2, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u8aad\u307f\u8fbc\u3093\u3067\u3044\u307e\u3059\u2026"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 361
    iget-object v1, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    invoke-static {p0, v10, v11}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 362
    iget-object v1, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    invoke-static {p0, v3}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p0, v5}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v1, v7, v2, v7, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 363
    new-instance v1, Landroid/widget/ProgressBar;

    invoke-direct {v1, p0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    invoke-static {p0, v1}, Le/e/a/ModernShorts;->tint(Landroid/content/Context;Landroid/widget/ProgressBar;)V

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v5}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 364
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 365
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x16

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v3, v6, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 366
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x1c

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v3, v8, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 367
    new-instance v1, Landroid/widget/HorizontalScrollView;

    invoke-direct {v1, p0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v7}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 368
    invoke-virtual {v1, v7}, Landroid/widget/HorizontalScrollView;->setClipToPadding(Z)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 369
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v8, v7, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 370
    const-string v1, "\u518d\u8a66\u884c"

    invoke-static {p0, v1}, Le/e/a/ModernShorts;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, v0, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 371
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 372
    const-string v2, "niconico"

    const-string v3, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306e\u30db\u30fc\u30e0\u306b\u623b\u308b"

    invoke-static {p0, v2, v3}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v2

    .line 373
    new-instance v3, Le/e/a/ModernShorts$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 374
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_1d0

    const-string v3, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306b\u623b\u308b"

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setTooltipText(Ljava/lang/CharSequence;)V

    .line 375
    :cond_1d0
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v4, 0x38

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    const/16 v7, 0x11

    invoke-direct {v3, v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 376
    const-string v2, "refresh"

    const-string v3, "\u30b7\u30e7\u30fc\u30c8\u4e00\u89a7\u3092\u66f4\u65b0"

    invoke-static {p0, v2, v3}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v2

    iput-object v2, v0, Le/e/a/ModernShorts$Home;->refresh:Landroid/widget/ImageButton;

    .line 377
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->refresh:Landroid/widget/ImageButton;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    const v7, 0x800015

    invoke-direct {v3, v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 378
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-direct {v3, v8, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 379
    return-object v0
.end method

.method private static button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 7

    .line 126
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const p1, 0x7f03005e

    const v1, -0xad335d

    invoke-static {p0, p1, v1}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 127
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 128
    const-string v3, "sans-serif-medium"

    invoke-static {v3, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 129
    const/16 v3, 0x10

    invoke-static {p0, v3}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v3}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v0, v4, v2, v3, v2}, Landroid/widget/Button;->setPadding(IIII)V

    .line 130
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v3, 0x1010031

    const v4, -0xe4e2de

    invoke-static {p0, v3, v4}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 131
    const/16 v3, 0x18

    invoke-static {p0, v3}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    new-instance v3, Landroid/graphics/drawable/RippleDrawable;

    .line 132
    invoke-static {p0, p1, v1}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result p0

    const p1, 0xffffff

    and-int/2addr p0, p1

    const/high16 p1, 0x33000000

    or-int/2addr p0, p1

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    const/4 p1, 0x0

    invoke-direct {v3, p0, v2, p1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 131
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 132
    return-object v0
.end method

.method private static cancelRequest(Le/e/a/ModernShorts$State;)V
    .registers 2

    .line 713
    iget-object v0, p0, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    if-eqz v0, :cond_11

    iget-object v0, p0, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    invoke-virtual {v0}, Le/e/a/NetworkTask;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    sget-object v0, Le/e/a/ModernShorts;->REQUESTS:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->purge()V

    .line 714
    :cond_11
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/ModernShorts$State;->busy:Z

    .line 715
    return-void
.end method

.method private static color(Landroid/content/Context;II)I
    .registers 6

    .line 116
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 117
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-nez p1, :cond_11

    return p2

    .line 118
    :cond_11
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz p1, :cond_25

    :try_start_15
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_23} :catch_24

    return p0

    .line 119
    :catch_24
    move-exception p0

    .line 120
    :cond_25
    iget p0, v0, Landroid/util/TypedValue;->data:I

    return p0
.end method

.method private static complete(Le/e/a/ModernShorts$State;Le/e/a/NetworkTask;Le/e/a/ModernShorts$Result;Ljava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le/e/a/ModernShorts$State;",
            "Le/e/a/NetworkTask;",
            "Le/e/a/ModernShorts$Result;",
            "Ljava/util/ArrayList<",
            "Le/e/a/ModernShorts$Item;",
            ">;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation

    .line 717
    sget-object v0, Le/e/a/ModernShorts;->MAIN:Landroid/os/Handler;

    new-instance v7, Le/e/a/ModernShorts$$ExternalSyntheticLambda8;

    move-object v1, v7

    move-object v2, p1

    move-object v3, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Le/e/a/ModernShorts$$ExternalSyntheticLambda8;-><init>(Le/e/a/NetworkTask;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;Ljava/util/ArrayList;Ljava/lang/Exception;)V

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 721
    return-void
.end method

.method public static completed(Ljava/lang/Object;)Z
    .registers 6

    .line 561
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    sget-object v1, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ModernShorts$State;

    if-eqz v1, :cond_38

    iget-boolean v2, v1, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v2, :cond_38

    iget-boolean v2, v1, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v2, :cond_38

    iget-object v2, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    if-eqz v2, :cond_38

    iget-object v2, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-boolean v2, v2, Le/e/a/ModernShorts$Feed;->continuous:Z

    if-eqz v2, :cond_38

    iget v2, v1, Le/e/a/ModernShorts$State;->index:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iget-object v4, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v4, v4, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v2, v4, :cond_34

    goto :goto_38

    :cond_34
    invoke-static {p0, v1, v3}, Le/e/a/ModernShorts;->step(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_37} :catch_39

    return v3

    :cond_38
    :goto_38
    return v0

    :catch_39
    move-exception p0

    return v0
.end method

.method private static containsPreferenceKey(Landroid/preference/Preference;Ljava/lang/String;)Z
    .registers 6

    .line 294
    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_c

    return v1

    .line 295
    :cond_c
    instance-of v0, p0, Landroid/preference/PreferenceGroup;

    const/4 v2, 0x0

    if-eqz v0, :cond_29

    .line 296
    check-cast p0, Landroid/preference/PreferenceGroup;

    .line 297
    const/4 v0, 0x0

    :goto_14
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v3

    if-lt v0, v3, :cond_1b

    goto :goto_29

    .line 298
    :cond_1b
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v3

    invoke-static {v3, p1}, Le/e/a/ModernShorts;->containsPreferenceKey(Landroid/preference/Preference;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_26

    return v1

    .line 297
    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 300
    :cond_29
    :goto_29
    return v2
.end method

.method private static cookie()Ljava/lang/String;
    .registers 9

    .line 802
    const-string v0, ""

    :try_start_2
    const-string v1, "e.e.a.v0"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "b"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 803
    if-nez v2, :cond_16

    return-object v0

    .line 804
    :cond_16
    const-string v4, "a"

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Class;

    const-string v7, "org.apache.http.client.CookieStore"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-virtual {v1, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v4, v5, [Ljava/lang/Object;

    aput-object v2, v4, v8

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_32} :catch_33

    return-object v1

    .line 805
    :catch_33
    move-exception v1

    return-object v0
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 114
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    int-to-float p1, p1

    mul-float p0, p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private static extend(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V
    .registers 6

    .line 652
    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v0, :cond_26

    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-eqz v0, :cond_9

    goto :goto_26

    .line 653
    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    iget-object v0, p1, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_16

    iget-object v0, p1, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 654
    :cond_16
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda30;

    invoke-direct {v0, p0, p1, p2, p3}, Le/e/a/ModernShorts$$ExternalSyntheticLambda30;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V

    iput-object v0, p1, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    .line 655
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda31;

    invoke-direct {v0, p1, p0, p3}, Le/e/a/ModernShorts$$ExternalSyntheticLambda31;-><init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Z)V

    invoke-static {p1, p2, v0}, Le/e/a/ModernShorts;->request(Le/e/a/ModernShorts$State;Ljava/lang/String;Le/e/a/ModernShorts$Result;)V

    .line 663
    return-void

    .line 652
    :cond_26
    :goto_26
    return-void
.end method

.method private static fillVideo(Landroid/app/Activity;)V
    .registers 11

    .line 616
    const-string v0, "video"

    const-string v1, "video_view"

    const-string v2, "videoLayout"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v3, 0x0

    :goto_c
    const/4 v4, 0x3

    if-lt v3, v4, :cond_10

    .line 622
    return-void

    .line 616
    :cond_10
    aget-object v4, v0, v3

    .line 617
    invoke-static {p0, v4}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    if-nez v5, :cond_19

    goto :goto_55

    .line 618
    :cond_19
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3f

    :try_start_1f
    const-string v4, "e.e.a.CommentVisuals"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v6, "fullViewport"

    const/4 v7, 0x1

    new-array v8, v7, [Ljava/lang/Class;

    const-class v9, Landroid/view/View;

    aput-object v9, v8, v1

    invoke-virtual {v4, v6, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v6, v7, [Ljava/lang/Object;

    aput-object v5, v6, v1

    const/4 v7, 0x0

    invoke-virtual {v4, v7, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_3a} :catch_3b

    goto :goto_3f

    :catch_3b
    move-exception v4

    invoke-static {v4}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 619
    :cond_3f
    :goto_3f
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    .line 620
    if-eqz v4, :cond_55

    iget v6, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v7, -0x1

    if-ne v6, v7, :cond_4e

    iget v6, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v6, v7, :cond_55

    :cond_4e
    iput v7, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v7, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v5, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 616
    :cond_55
    :goto_55
    add-int/lit8 v3, v3, 0x1

    goto :goto_c
.end method

.method private static find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 578
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static finishMenu(Landroid/content/Context;Ljava/util/ArrayList;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "*>;)V"
        }
    .end annotation

    .line 214
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "app_lang"

    const-string v1, "0"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 215
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_13
    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_54

    .line 219
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 220
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x1

    const-string v3, "\u305d\u306e\u4ed6"

    const-string v4, ""

    move-object v1, v0

    invoke-static/range {v1 .. v6}, Le/e/a/ModernShorts;->addMenuRow(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    .line 221
    const/4 v6, 0x4

    const/4 v2, 0x0

    const-string v3, "\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5"

    const-string v4, "\u8a2d\u5b9a\u3092\u53cd\u6620\u3057\u3066\u6700\u521d\u304b\u3089\u958b\u304f"

    invoke-static/range {v1 .. v6}, Le/e/a/ModernShorts;->addMenuRow(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    .line 222
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 223
    const/4 p0, 0x0

    :goto_37
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt p0, v2, :cond_3e

    goto :goto_4c

    :cond_3e
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "\u30a2\u30d7\u30ea\u8a2d\u5b9a"

    invoke-static {v2, v3}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_51

    add-int/lit8 v1, p0, 0x1

    .line 224
    :goto_4c
    nop

    .line 225
    invoke-virtual {p1, v1, v0}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 226
    return-void

    .line 223
    :cond_51
    add-int/lit8 p0, p0, 0x1

    goto :goto_37

    .line 216
    :cond_54
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 217
    const-string v1, "\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5"

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_70

    const-string v1, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_70

    const-string v1, "\u305d\u306e\u4ed6"

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    :cond_70
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    goto :goto_13
.end method

.method private static hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 9

    .line 228
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_11

    check-cast p0, Ljava/util/Map;

    const-string v0, "title"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 229
    :cond_11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :goto_15
    const/4 v1, 0x0

    if-nez v0, :cond_19

    .line 234
    return v1

    .line 230
    :cond_19
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    array-length v3, v2

    :goto_1e
    if-lt v1, v3, :cond_25

    .line 229
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_15

    .line 230
    :cond_25
    aget-object v4, v2, v1

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Ljava/lang/String;

    if-ne v5, v6, :cond_3f

    .line 231
    const/4 v5, 0x1

    :try_start_30
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_3b} :catch_3e

    if-eqz v4, :cond_3f

    return v5

    .line 232
    :catch_3e
    move-exception v4

    .line 230
    :cond_3f
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e
.end method

.method private static icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;
    .registers 7

    .line 135
    new-instance v0, Landroid/widget/ImageButton;

    invoke-direct {v0, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    const/16 p2, 0xc

    invoke-static {p0, p2}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p0, p2}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p0, p2}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, p2}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result p2

    invoke-virtual {v0, v1, v2, v3, p2}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 136
    const p2, 0x7f03005e

    const v1, -0xad335d

    invoke-static {p0, p2, v1}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result p2

    .line 137
    new-instance v1, Le/e/a/ModernShorts$1;

    invoke-direct {v1, p2, p1, p0}, Le/e/a/ModernShorts$1;-><init>(ILjava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 164
    new-instance p0, Landroid/graphics/drawable/RippleDrawable;

    const p1, 0xffffff

    and-int/2addr p1, p2

    const/high16 p2, 0x33000000

    or-int/2addr p1, p2

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2, p2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 165
    return-object v0
.end method

.method private static install(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V
    .registers 19

    .line 471
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v0, p2

    iget-boolean v3, v2, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v3, :cond_25d

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-eqz v3, :cond_12

    goto/16 :goto_25d

    .line 472
    :cond_12
    const-string v3, "videoLayout"

    invoke-static {v1, v3}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 473
    if-nez v3, :cond_2b

    const/16 v3, 0x28

    if-ge v0, v3, :cond_2a

    sget-object v3, Le/e/a/ModernShorts;->MAIN:Landroid/os/Handler;

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda14;

    invoke-direct {v4, v1, v2, v0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda14;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    const-wide/16 v0, 0x32

    invoke-virtual {v3, v4, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2a
    return-void

    .line 474
    :cond_2b
    iput-object v3, v2, Le/e/a/ModernShorts$State;->video:Landroid/view/View;

    .line 475
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 476
    const/4 v4, -0x1

    if-eqz v0, :cond_3b

    .line 477
    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 478
    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 479
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 481
    :cond_3b
    const-string v0, "video_view"

    invoke-static {v1, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    .line 482
    invoke-static/range {p0 .. p0}, Le/e/a/ModernShorts;->fillVideo(Landroid/app/Activity;)V

    .line 483
    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v5, :cond_75

    .line 484
    :try_start_48
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v8, "setMeasureBasedOnAspectRatioEnabled"

    new-array v9, v6, [Ljava/lang/Class;

    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v10, v9, v7

    invoke-virtual {v0, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v8, v6, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v8, v7

    invoke-virtual {v0, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 486
    if-eqz v0, :cond_75

    .line 487
    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 488
    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 489
    invoke-virtual {v5, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_70} :catch_71

    .line 491
    goto :goto_75

    :catch_71
    move-exception v0

    invoke-static {v0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 492
    :cond_75
    :goto_75
    if-eqz v5, :cond_9d

    .line 493
    :try_start_77
    const-string v0, "com.devbrackets.android.exomedia.core.video.scale.ScaleType"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 494
    const-string v8, "FIT_CENTER"

    invoke-static {v0, v8}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v8

    .line 495
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-string v10, "setScaleType"

    new-array v11, v6, [Ljava/lang/Class;

    aput-object v0, v11, v7

    invoke-virtual {v9, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v9, v6, [Ljava/lang/Object;

    aput-object v8, v9, v7

    invoke-virtual {v0, v5, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_98
    .catch Ljava/lang/Exception; {:try_start_77 .. :try_end_98} :catch_99

    .line 496
    goto :goto_9d

    :catch_99
    move-exception v0

    invoke-static {v0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 497
    :cond_9d
    :goto_9d
    const-string v0, "info"

    invoke-static {v1, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    const/16 v8, 0x8

    if-eqz v5, :cond_aa

    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    .line 498
    :cond_aa
    const-string v5, "prevbutton"

    const-string v9, "nextbutton"

    filled-new-array {v5, v9}, [Ljava/lang/String;

    move-result-object v5

    const/4 v9, 0x0

    :goto_b3
    const/4 v10, 0x2

    if-lt v9, v10, :cond_247

    .line 499
    const-string v5, "fullscbutton"

    invoke-static {v1, v5}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    .line 500
    if-eqz v5, :cond_c9

    .line 501
    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 502
    new-instance v9, Le/e/a/ModernShorts$$ExternalSyntheticLambda15;

    invoke-direct {v9, v1}, Le/e/a/ModernShorts$$ExternalSyntheticLambda15;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v5, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 507
    :cond_c9
    const v5, 0x1020002

    invoke-virtual {v1, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/FrameLayout;

    .line 508
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v10, 0x10

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 509
    const/16 v10, 0xa

    invoke-static {v1, v10}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v11

    const/4 v12, 0x6

    invoke-static {v1, v12}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-static {v1, v10}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-static {v1, v12}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v9, v11, v13, v10, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 510
    new-instance v10, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v10}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v11, 0x1010031

    const v12, -0xe4e2de

    invoke-static {v1, v11, v12}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 511
    const/16 v11, 0x16

    invoke-static {v1, v11}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v11

    int-to-float v11, v11

    invoke-virtual {v10, v11}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 512
    iput-object v9, v2, Le/e/a/ModernShorts$State;->bar:Landroid/view/View;

    .line 513
    const-string v10, "prev"

    const-string v11, "\u524d\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-static {v1, v10, v11}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v10

    new-instance v11, Le/e/a/ModernShorts$$ExternalSyntheticLambda16;

    invoke-direct {v11, v1, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda16;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v10, v11}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 514
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-direct {v11, v7, v4, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v9, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 515
    new-instance v10, Landroid/widget/FrameLayout;

    invoke-direct {v10, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 516
    new-instance v11, Landroid/widget/TextView;

    invoke-direct {v11, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/16 v13, 0x11

    invoke-virtual {v11, v13}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v13, 0x41600000    # 14.0f

    invoke-virtual {v11, v13}, Landroid/widget/TextView;->setTextSize(F)V

    .line 517
    const-string v13, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u4e00\u89a7"

    invoke-virtual {v11, v13}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    const v13, 0x1010036

    invoke-static {v1, v13, v4}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v13

    invoke-virtual {v11, v13}, Landroid/widget/TextView;->setTextColor(I)V

    iput-object v11, v2, Le/e/a/ModernShorts$State;->number:Landroid/widget/TextView;

    .line 518
    new-instance v13, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v13, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v11, v13}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v13, v7, v4, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v9, v10, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 519
    new-instance v13, Landroid/widget/ProgressBar;

    invoke-direct {v13, v1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v13}, Le/e/a/ModernShorts;->tint(Landroid/content/Context;Landroid/widget/ProgressBar;)V

    iput-object v13, v2, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    iget-boolean v14, v2, Le/e/a/ModernShorts$State;->busy:Z

    if-eqz v14, :cond_172

    const/4 v14, 0x0

    goto :goto_174

    :cond_172
    const/16 v14, 0x8

    :goto_174
    invoke-virtual {v13, v14}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 520
    new-instance v14, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v15, 0x12

    invoke-static {v1, v15}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {v1, v15}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v15

    const v6, 0x800035

    invoke-direct {v14, v8, v15, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v10, v13, v14}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 521
    const-string v6, "home"

    const-string v8, "\u30b7\u30e7\u30fc\u30c8\u306e\u30db\u30fc\u30e0"

    invoke-static {v1, v6, v8}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v6

    new-instance v8, Le/e/a/ModernShorts$$ExternalSyntheticLambda17;

    invoke-direct {v8, v1}, Le/e/a/ModernShorts$$ExternalSyntheticLambda17;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v6, v8}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 522
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v7, v4, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v9, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 523
    const-string v6, "\u52d5\u753b\u60c5\u5831"

    invoke-static {v1, v0, v6}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    new-instance v6, Le/e/a/ModernShorts$$ExternalSyntheticLambda18;

    invoke-direct {v6, v1}, Le/e/a/ModernShorts$$ExternalSyntheticLambda18;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 524
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v7, v4, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v9, v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 525
    const-string v0, "next"

    const-string v6, "\u6b21\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-static {v1, v0, v6}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    new-instance v6, Le/e/a/ModernShorts$$ExternalSyntheticLambda19;

    invoke-direct {v6, v1, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda19;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 526
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v7, v4, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v9, v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 527
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda20;

    invoke-direct {v0, v1, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda20;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v6, 0x1

    invoke-virtual {v11, v6}, Landroid/widget/TextView;->setClickable(Z)V

    .line 528
    const/16 v0, 0x8

    invoke-virtual {v9, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 530
    const-string v0, "statuslay"

    invoke-static {v1, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1ef

    const/4 v6, 0x4

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 531
    :cond_1ef
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda21;

    invoke-direct {v0, v1, v2, v9}, Le/e/a/ModernShorts$$ExternalSyntheticLambda21;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/widget/LinearLayout;)V

    iput-object v0, v2, Le/e/a/ModernShorts$State;->controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 542
    invoke-virtual {v5}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v6, v2, Le/e/a/ModernShorts$State;->controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v0, v6}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 543
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v6, 0x40

    invoke-static {v1, v6}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    const/16 v8, 0x50

    invoke-direct {v0, v4, v6, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 544
    invoke-static/range {p0 .. p0}, Le/e/a/Review181;->shortOverlay(Landroid/app/Activity;)V

    .line 545
    const/16 v4, 0xc

    invoke-static {v1, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v1, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v8, 0x8

    invoke-static {v1, v8}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v0, v6, v7, v4, v8}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v5, v9, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static/range {p1 .. p1}, Le/e/a/ModernShorts;->update(Le/e/a/ModernShorts$State;)V

    .line 546
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda22;

    invoke-direct {v0, v2, v1, v3}, Le/e/a/ModernShorts$$ExternalSyntheticLambda22;-><init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Landroid/view/View;)V

    iput-object v0, v2, Le/e/a/ModernShorts$State;->listener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 558
    invoke-virtual {v5}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v3, v2, Le/e/a/ModernShorts$State;->listener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, v2, Le/e/a/ModernShorts$State;->listener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-interface {v0}, Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;->onGlobalLayout()V

    .line 559
    const-string v0, "\u4e0a\u306b\u30b9\u30ef\u30a4\u30d7\u3067\u6b21\u3001\u4e0b\u306b\u30b9\u30ef\u30a4\u30d7\u3067\u524d\u306e\u52d5\u753b"

    invoke-static {v1, v0, v7}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 560
    return-void

    .line 498
    :cond_247
    aget-object v8, v5, v9

    invoke-static {v1, v8}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_255

    const/16 v10, 0x8

    invoke-virtual {v8, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_257

    :cond_255
    const/16 v10, 0x8

    :goto_257
    add-int/lit8 v9, v9, 0x1

    const/16 v8, 0x8

    goto/16 :goto_b3

    .line 471
    :cond_25d
    :goto_25d
    return-void
.end method

.method private static interactive(Landroid/view/View;FF)Z
    .registers 8

    .line 703
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return v1

    .line 704
    :cond_8
    const/4 v0, 0x2

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 705
    aget v2, v0, v1

    int-to-float v2, v2

    cmpg-float v2, p1, v2

    if-ltz v2, :cond_73

    const/4 v2, 0x1

    aget v3, v0, v2

    int-to-float v3, v3

    cmpg-float v3, p2, v3

    if-ltz v3, :cond_73

    aget v3, v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v4

    add-int/2addr v3, v4

    int-to-float v3, v3

    cmpl-float v3, p1, v3

    if-gez v3, :cond_73

    aget v0, v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int/2addr v0, v3

    int-to-float v0, v0

    cmpl-float v0, p2, v0

    if-ltz v0, :cond_36

    goto :goto_73

    .line 706
    :cond_36
    instance-of v0, p0, Landroid/widget/Button;

    if-nez v0, :cond_72

    instance-of v0, p0, Landroid/widget/SeekBar;

    if-nez v0, :cond_72

    instance-of v0, p0, Landroid/widget/EditText;

    if-nez v0, :cond_72

    instance-of v0, p0, Landroid/widget/ImageButton;

    if-nez v0, :cond_72

    .line 707
    instance-of v0, p0, Landroid/widget/TextView;

    if-nez v0, :cond_4e

    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_55

    :cond_4e
    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_55

    goto :goto_72

    .line 708
    :cond_55
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_71

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_60
    if-gez v0, :cond_63

    goto :goto_71

    :cond_63
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1, p2}, Le/e/a/ModernShorts;->interactive(Landroid/view/View;FF)Z

    move-result v3

    if-eqz v3, :cond_6e

    return v2

    :cond_6e
    add-int/lit8 v0, v0, -0x1

    goto :goto_60

    .line 709
    :cond_71
    :goto_71
    return v1

    .line 707
    :cond_72
    :goto_72
    return v2

    .line 705
    :cond_73
    :goto_73
    return v1
.end method

.method private static isRefreshing(Landroid/view/View;)Z
    .registers 5

    .line 882
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "isRefreshing"

    new-array v3, v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_19} :catch_1a

    return p0

    .line 883
    :catch_1a
    move-exception p0

    return v0
.end method

.method static synthetic lambda$0([J[ILandroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 11

    .line 261
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 262
    const/4 p3, 0x0

    aget-wide v2, p0, p3

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1388

    cmp-long v6, v2, v4

    if-lez v6, :cond_11

    aput p3, p1, p3

    .line 263
    :cond_11
    aput-wide v0, p0, p3

    .line 264
    aget p0, p1, p3

    const/4 v0, 0x1

    add-int/2addr p0, v0

    aput p0, p1, p3

    const/16 v1, 0x8

    if-ne p0, v1, :cond_22

    aput p3, p1, p3

    invoke-static {p2}, Le/e/a/BikeRun;->open(Landroid/app/Activity;)V

    .line 265
    :cond_22
    return v0
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 7

    .line 286
    const/4 p1, 0x1

    :try_start_1
    const-string v0, "e.e.a.ModernDebug"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "share"

    new-array v2, p1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, p1, [Ljava/lang/Object;

    aput-object p0, v1, v4

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1c} :catch_1d

    goto :goto_21

    .line 287
    :catch_1d
    move-exception p0

    invoke-static {p0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 288
    :goto_21
    return p1
.end method

.method static synthetic lambda$10(Landroid/app/Activity;Le/e/a/ModernShorts$State;ILandroid/view/View;)V
    .registers 4

    .line 427
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    return-void
.end method

.method static synthetic lambda$11(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 3

    .line 442
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    return-void
.end method

.method static synthetic lambda$12(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;Ljava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 8

    .line 444
    iget-boolean v0, p0, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_48

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_48

    .line 445
    :cond_b
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/ModernShorts$State;->busy:Z

    iget-object v1, p2, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 446
    if-nez p4, :cond_34

    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1e

    goto :goto_34

    .line 451
    :cond_1e
    new-instance p4, Le/e/a/ModernShorts$Feed;

    const/4 v0, 0x0

    invoke-direct {p4, v0}, Le/e/a/ModernShorts$Feed;-><init>(Le/e/a/ModernShorts$Feed;)V

    iput-object p4, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p4, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {p1, p4, p3}, Le/e/a/ModernShorts;->append(Landroid/content/Context;Le/e/a/ModernShorts$Feed;Ljava/util/ArrayList;)I

    iget-object p3, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {p3}, Le/e/a/ModernShorts;->remember(Le/e/a/ModernShorts$Feed;)V

    invoke-static {p1, p0, p2}, Le/e/a/ModernShorts;->renderHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    .line 452
    return-void

    .line 447
    :cond_34
    :goto_34
    iget-object p0, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    if-eqz p4, :cond_3b

    const-string p1, "\u691c\u7d22\u7d50\u679c\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u901a\u4fe1\u72b6\u614b\u3092\u78ba\u8a8d\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    goto :goto_3d

    :cond_3b
    const-string p1, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u30ad\u30fc\u30ef\u30fc\u30c9\u3092\u5909\u3048\u3066\u304a\u8a66\u3057\u304f\u3060\u3055\u3044\u3002"

    :goto_3d
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 448
    if-eqz p4, :cond_47

    iget-object p0, p2, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 449
    :cond_47
    return-void

    .line 444
    :cond_48
    :goto_48
    return-void
.end method

.method static synthetic lambda$13(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V
    .registers 3

    .line 473
    add-int/lit8 p2, p2, 0x1

    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->install(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    return-void
.end method

.method static synthetic lambda$14(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 503
    :try_start_0
    invoke-static {p0}, Le/e/a/ModernShorts;->normalPlayer(Landroid/app/Activity;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_4

    goto :goto_8

    .line 504
    :catch_4
    move-exception p0

    invoke-static {p0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 505
    :goto_8
    return-void
.end method

.method static synthetic lambda$15(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 3

    .line 513
    const/4 p2, -0x1

    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->step(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    return-void
.end method

.method static synthetic lambda$16(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 521
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method static synthetic lambda$17(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 523
    invoke-static {p0}, Le/e/a/VideoDetails;->shortDetails(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$18(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 3

    .line 525
    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->step(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    return-void
.end method

.method static synthetic lambda$19(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 3

    .line 527
    invoke-static {p0, p1}, Le/e/a/ModernShorts;->showList(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    return-void
.end method

.method static synthetic lambda$2(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;)V
    .registers 4

    .line 316
    iget-object v0, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v0, v0, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d

    invoke-static {p1, p0, p2}, Le/e/a/ModernShorts;->renderHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    :cond_d
    return-void
.end method

.method static synthetic lambda$20(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/widget/LinearLayout;)Z
    .registers 5

    .line 532
    const-string v0, "fullscbutton"

    invoke-static {p0, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_10

    new-instance v1, Le/e/a/ModernShorts$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 533
    :cond_10
    const-string v0, "controller"

    invoke-static {p0, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 534
    invoke-static {p0}, Le/e/a/PlayerControlsDock;->enabled(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_20

    iget-boolean p1, p1, Le/e/a/ModernShorts$State;->controlsTapped:Z

    if-eqz p1, :cond_2a

    :cond_20
    if-eqz v0, :cond_2a

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result p1

    if-eqz p1, :cond_2a

    const/4 p1, 0x0

    goto :goto_2c

    :cond_2a
    const/16 p1, 0x8

    .line 535
    :goto_2c
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v1

    if-eq v1, p1, :cond_35

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 536
    :cond_35
    if-nez v0, :cond_3a

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_3e

    :cond_3a
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v0

    .line 537
    :goto_3e
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_49

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 538
    :cond_49
    invoke-static {p0}, Le/e/a/ModernShorts;->restoreLayout(Landroid/app/Activity;)V

    .line 539
    invoke-static {p0, p1, v0}, Le/e/a/Review181;->shortControls(Landroid/app/Activity;IF)V

    .line 540
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$21(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 532
    invoke-static {p0}, Le/e/a/ModernShorts;->normalPlayer(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$22(Le/e/a/ModernShorts$State;Landroid/app/Activity;Landroid/view/View;)V
    .registers 5

    .line 547
    iget-boolean p0, p0, Le/e/a/ModernShorts$State;->dead:Z

    if-eqz p0, :cond_5

    return-void

    .line 548
    :cond_5
    invoke-static {p1}, Le/e/a/ModernShorts;->fillVideo(Landroid/app/Activity;)V

    .line 549
    invoke-static {p1}, Le/e/a/ModernShorts;->liftController(Landroid/app/Activity;)V

    .line 550
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    .line 551
    if-eqz p0, :cond_21

    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1a

    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v0, v1, :cond_21

    .line 552
    :cond_1a
    iput v1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 553
    invoke-virtual {p2, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 555
    :cond_21
    const-string p0, "info"

    invoke-static {p1, p0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_34

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p2

    const/16 v0, 0x8

    if-eq p2, v0, :cond_34

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 556
    :cond_34
    const-string p0, "videopro"

    invoke-static {p1, p0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    instance-of p2, p0, Landroid/widget/ProgressBar;

    if-eqz p2, :cond_43

    check-cast p0, Landroid/widget/ProgressBar;

    invoke-static {p1, p0}, Le/e/a/ModernShorts;->tint(Landroid/content/Context;Landroid/widget/ProgressBar;)V

    .line 557
    :cond_43
    return-void
.end method

.method static synthetic lambda$23(Landroid/app/AlertDialog;ILe/e/a/ModernShorts$State;Landroid/app/Activity;Landroid/view/View;)V
    .registers 5

    .line 606
    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    iget p0, p2, Le/e/a/ModernShorts$State;->index:I

    if-eq p1, p0, :cond_e

    iget-boolean p0, p2, Le/e/a/ModernShorts$State;->busy:Z

    if-nez p0, :cond_e

    invoke-static {p3, p2, p1}, Le/e/a/ModernShorts;->launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    :cond_e
    return-void
.end method

.method static synthetic lambda$24(Landroid/app/AlertDialog;Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 4

    .line 610
    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    iget-object p0, p2, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p0, p0, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    iget p3, p2, Le/e/a/ModernShorts$State;->index:I

    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/ModernShorts$Item;

    iget-object p0, p0, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    const/4 p3, 0x0

    invoke-static {p1, p2, p0, p3}, Le/e/a/ModernShorts;->extend(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$25(Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 2

    .line 611
    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$26(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V
    .registers 4

    .line 654
    invoke-static {p0, p1, p2, p3}, Le/e/a/ModernShorts;->extend(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$27(Le/e/a/ModernShorts$State;Landroid/app/Activity;ZLjava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 8

    .line 656
    iget-boolean v0, p0, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_52

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_52

    .line 657
    :cond_b
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/ModernShorts$State;->busy:Z

    iget-object v1, p0, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    if-eqz v1, :cond_19

    iget-object v1, p0, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 658
    :cond_19
    if-eqz p4, :cond_25

    const-string p0, "\u4e00\u89a7\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u3082\u3046\u4e00\u5ea6\u304a\u8a66\u3057\u304f\u3060\u3055\u3044"

    invoke-static {p1, p0, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 659
    :cond_25
    iget-object p4, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {p1, p4, p3}, Le/e/a/ModernShorts;->append(Landroid/content/Context;Le/e/a/ModernShorts$Feed;Ljava/util/ArrayList;)I

    move-result p3

    invoke-static {p0}, Le/e/a/ModernShorts;->update(Le/e/a/ModernShorts$State;)V

    .line 660
    if-eqz p2, :cond_46

    iget p2, p0, Le/e/a/ModernShorts$State;->index:I

    add-int/lit8 p2, p2, 0x1

    iget-object p4, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p4, p4, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result p4

    if-ge p2, p4, :cond_46

    iget p2, p0, Le/e/a/ModernShorts$State;->index:I

    add-int/lit8 p2, p2, 0x1

    invoke-static {p1, p0, p2}, Le/e/a/ModernShorts;->launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    goto :goto_51

    .line 661
    :cond_46
    if-nez p3, :cond_51

    const-string p0, "\u65b0\u3057\u3044\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p1, p0, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 662
    :cond_51
    :goto_51
    return-void

    .line 656
    :cond_52
    :goto_52
    return-void
.end method

.method static synthetic lambda$28(Le/e/a/NetworkTask;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;Ljava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 6

    .line 718
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-nez v0, :cond_18

    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_18

    iget-object v0, p1, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    if-eq v0, p0, :cond_f

    goto :goto_18

    .line 719
    :cond_f
    const/4 p0, 0x0

    iput-object p0, p1, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    iput-object p0, p1, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    invoke-interface {p2, p3, p4}, Le/e/a/ModernShorts$Result;->done(Ljava/util/ArrayList;Ljava/lang/Exception;)V

    .line 720
    return-void

    .line 718
    :cond_18
    :goto_18
    return-void
.end method

.method static synthetic lambda$29(Le/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/String;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;)V
    .registers 15

    .line 726
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 728
    const/4 v1, 0x0

    :try_start_6
    const-string v2, "https://nvapi.nicovideo.jp/v1/playlist/recipe-id?recipeId=video_short_watch_recommendation&recipeVersion=1&site=nicovideo"

    .line 729
    if-eqz p1, :cond_33

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "&videoId="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&currentVideoId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 730
    :cond_33
    new-instance p1, Ljava/net/URL;

    invoke-direct {p1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_3e} :catch_159
    .catchall {:try_start_6 .. :try_end_3e} :catchall_157

    :try_start_3e
    invoke-virtual {p0, p1}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v2
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_42} :catch_154
    .catchall {:try_start_3e .. :try_end_42} :catchall_16e

    if-nez v2, :cond_4d

    .line 751
    if-eqz p1, :cond_4c

    invoke-virtual {p0, p1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 730
    :cond_4c
    return-void

    :cond_4d
    const/16 v2, 0x1f40

    :try_start_4f
    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 731
    const-string v2, "X-Frontend-Id"

    const-string v3, "6"

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "X-Frontend-Version"

    const-string v3, "0"

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 732
    const-string v2, "Accept"

    const-string v3, "application/json"

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "Origin"

    const-string v3, "https://www.nicovideo.jp"

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 733
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7c

    const-string v2, "Cookie"

    invoke-virtual {p1, v2, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 734
    :cond_7c
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_81
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_81} :catch_154
    .catchall {:try_start_4f .. :try_end_81} :catchall_16e

    .line 735
    :try_start_81
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-direct {v3, v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_91
    .catchall {:try_start_81 .. :try_end_91} :catchall_14a

    .line 736
    :goto_91
    :try_start_91
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3
    :try_end_95
    .catchall {:try_start_91 .. :try_end_95} :catchall_144

    if-nez v3, :cond_11c

    .line 737
    :try_start_97
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_9a
    .catchall {:try_start_97 .. :try_end_9a} :catchall_14a

    .line 738
    :try_start_9a
    new-instance v2, Lorg/json/JSONObject;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v2, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 739
    const-string p2, "meta"

    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "status"

    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p2

    const/16 v3, 0xc8

    if-ne p2, v3, :cond_114

    .line 740
    const-string p2, "data"

    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    const-string v2, "items"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    .line 741
    const/4 v2, 0x0

    :goto_c0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v3
    :try_end_c4
    .catch Ljava/lang/Exception; {:try_start_9a .. :try_end_c4} :catch_154
    .catchall {:try_start_9a .. :try_end_c4} :catchall_16e

    if-lt v2, v3, :cond_d0

    .line 751
    if-eqz p1, :cond_16a

    :goto_c8
    invoke-virtual {p0, p1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_16a

    .line 742
    :cond_d0
    :try_start_d0
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "watchId"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 743
    invoke-static {v4}, Le/e/a/ShortsRules;->videoId(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_e1

    goto :goto_111

    .line 744
    :cond_e1
    const-string v5, "content"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 745
    if-nez v5, :cond_eb

    move-object v6, v4

    goto :goto_f1

    :cond_eb
    const-string v6, "title"

    invoke-virtual {v5, v6, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 746
    :goto_f1
    invoke-static {v5}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    .line 747
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_ff

    invoke-static {v3}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    .line 748
    :cond_ff
    invoke-static {v5}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V

    invoke-static {v3}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V

    .line 749
    new-instance v8, Le/e/a/ModernShorts$Item;

    invoke-static {v3, v5}, Le/e/a/ModernShorts;->thumbnail(Lorg/json/JSONObject;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v8, v4, v6, v3, v7}, Le/e/a/ModernShorts$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 741
    :goto_111
    add-int/lit8 v2, v2, 0x1

    goto :goto_c0

    .line 739
    :cond_114
    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v1, "Feed unavailable"

    invoke-direct {p2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_11c
    .catch Ljava/lang/Exception; {:try_start_d0 .. :try_end_11c} :catch_154
    .catchall {:try_start_d0 .. :try_end_11c} :catchall_16e

    .line 736
    :cond_11c
    :try_start_11c
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v4
    :try_end_120
    .catchall {:try_start_11c .. :try_end_120} :catchall_144

    if-eqz v4, :cond_12e

    .line 737
    :try_start_122
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_125
    .catchall {:try_start_122 .. :try_end_125} :catchall_14a

    .line 751
    if-eqz p1, :cond_12d

    invoke-virtual {p0, p1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 736
    :cond_12d
    return-void

    :cond_12e
    :try_start_12e
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    const v4, 0x1e8480

    if-gt v3, v4, :cond_13c

    goto/16 :goto_91

    :cond_13c
    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v1, "Oversized feed"

    invoke-direct {p2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_144
    .catchall {:try_start_12e .. :try_end_144} :catchall_144

    .line 737
    :catchall_144
    move-exception p2

    move-object v1, p2

    :try_start_146
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    throw v1
    :try_end_14a
    .catchall {:try_start_146 .. :try_end_14a} :catchall_14a

    :catchall_14a
    move-exception p2

    if-eqz v1, :cond_153

    if-eq v1, p2, :cond_152

    :try_start_14f
    invoke-virtual {v1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_152
    move-object p2, v1

    :cond_153
    throw p2
    :try_end_154
    .catch Ljava/lang/Exception; {:try_start_14f .. :try_end_154} :catch_154
    .catchall {:try_start_14f .. :try_end_154} :catchall_16e

    .line 751
    :catch_154
    move-exception p2

    move-object v1, p2

    goto :goto_15d

    :catchall_157
    move-exception p1

    goto :goto_171

    :catch_159
    move-exception p1

    move-object v9, v1

    move-object v1, p1

    move-object p1, v9

    :goto_15d
    :try_start_15d
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p2

    if-nez p2, :cond_166

    invoke-static {v1}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V
    :try_end_166
    .catchall {:try_start_15d .. :try_end_166} :catchall_16e

    :cond_166
    if-eqz p1, :cond_16a

    goto/16 :goto_c8

    .line 752
    :cond_16a
    :goto_16a
    invoke-static {p3, p0, p4, v0, v1}, Le/e/a/ModernShorts;->complete(Le/e/a/ModernShorts$State;Le/e/a/NetworkTask;Le/e/a/ModernShorts$Result;Ljava/util/ArrayList;Ljava/lang/Exception;)V

    .line 753
    return-void

    .line 751
    :catchall_16e
    move-exception p2

    move-object v1, p1

    move-object p1, p2

    :goto_171
    if-eqz v1, :cond_179

    invoke-virtual {p0, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_179
    throw p1
.end method

.method static synthetic lambda$3(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Landroid/view/View;)V
    .registers 4

    .line 317
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->retryHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    return-void
.end method

.method static synthetic lambda$30(Le/e/a/NetworkTask;Ljava/lang/String;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;)V
    .registers 14

    .line 758
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 760
    const/4 v1, 0x0

    :try_start_6
    const-string v2, "https://nvapi.nicovideo.jp/v2/search/video"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    .line 761
    const-string v3, "keyword"

    invoke-virtual {v2, v3, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v2, "selectContentType"

    const-string v3, "short"

    invoke-virtual {p1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    .line 762
    const-string v2, "sortKey"

    const-string v3, "hot"

    invoke-virtual {p1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v2, "sortOrder"

    const-string v3, "none"

    invoke-virtual {p1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    .line 763
    const-string v2, "pageSize"

    const-string v3, "50"

    invoke-virtual {p1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v2, "page"

    const-string v3, "1"

    invoke-virtual {p1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 760
    nop

    .line 764
    new-instance v2, Ljava/net/URL;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_52} :catch_168
    .catchall {:try_start_6 .. :try_end_52} :catchall_166

    :try_start_52
    invoke-virtual {p0, p1}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v2
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_56} :catch_164
    .catchall {:try_start_52 .. :try_end_56} :catchall_17d

    if-nez v2, :cond_61

    .line 785
    if-eqz p1, :cond_60

    invoke-virtual {p0, p1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 764
    :cond_60
    return-void

    .line 765
    :cond_61
    const/16 v2, 0x1f40

    :try_start_63
    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v2, 0x2710

    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 766
    const-string v2, "Accept"

    const-string v3, "application/json"

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 767
    const-string v2, "User-Agent"

    const-string v3, "nicoid Re"

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 768
    const-string v2, "X-Frontend-Id"

    const-string v3, "6"

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "X-Frontend-Version"

    const-string v3, "0"

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 769
    const-string v2, "Origin"

    const-string v3, "https://www.nicovideo.jp"

    invoke-virtual {p1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 770
    invoke-static {}, Le/e/a/ModernShorts;->cookie()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_9d

    const-string v3, "Cookie"

    invoke-virtual {p1, v3, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 771
    :cond_9d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_a2
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_a2} :catch_164
    .catchall {:try_start_63 .. :try_end_a2} :catchall_17d

    .line 772
    :try_start_a2
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_b2
    .catchall {:try_start_a2 .. :try_end_b2} :catchall_159

    .line 773
    nop

    :goto_b3
    :try_start_b3
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4
    :try_end_b7
    .catchall {:try_start_b3 .. :try_end_b7} :catchall_154

    if-nez v4, :cond_12c

    .line 776
    :try_start_b9
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_bc
    .catchall {:try_start_b9 .. :try_end_bc} :catchall_159

    .line 777
    :try_start_bc
    new-instance v3, Lorg/json/JSONObject;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 778
    const-string v2, "meta"

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "status"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    const/16 v4, 0xc8

    if-ne v2, v4, :cond_124

    .line 779
    const-string v2, "data"

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "items"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 780
    const/4 v3, 0x0

    :goto_e2
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4
    :try_end_e6
    .catch Ljava/lang/Exception; {:try_start_bc .. :try_end_e6} :catch_164
    .catchall {:try_start_bc .. :try_end_e6} :catchall_17d

    if-lt v3, v4, :cond_f2

    .line 785
    if-eqz p1, :cond_179

    :goto_ea
    invoke-virtual {p0, p1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_179

    .line 781
    :cond_f2
    :try_start_f2
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "id"

    const-string v6, "watchId"

    const-string v7, ""

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 782
    invoke-static {v5}, Le/e/a/ShortsRules;->videoId(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_10b

    goto :goto_121

    .line 783
    :cond_10b
    new-instance v6, Le/e/a/ModernShorts$Item;

    const-string v7, "title"

    invoke-virtual {v4, v7, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v4}, Le/e/a/ModernShorts;->thumbnail(Lorg/json/JSONObject;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v4}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v6, v5, v7, v8, v4}, Le/e/a/ModernShorts$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 780
    :goto_121
    add-int/lit8 v3, v3, 0x1

    goto :goto_e2

    .line 778
    :cond_124
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Search unavailable"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_12c
    .catch Ljava/lang/Exception; {:try_start_f2 .. :try_end_12c} :catch_164
    .catchall {:try_start_f2 .. :try_end_12c} :catchall_17d

    .line 774
    :cond_12c
    :try_start_12c
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v5
    :try_end_130
    .catchall {:try_start_12c .. :try_end_130} :catchall_154

    if-eqz v5, :cond_13e

    .line 776
    :try_start_132
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_135
    .catchall {:try_start_132 .. :try_end_135} :catchall_159

    .line 785
    if-eqz p1, :cond_13d

    invoke-virtual {p0, p1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 774
    :cond_13d
    return-void

    :cond_13e
    :try_start_13e
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    const v5, 0x1e8480

    if-gt v4, v5, :cond_14c

    goto/16 :goto_b3

    :cond_14c
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Oversized search response"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_154
    .catchall {:try_start_13e .. :try_end_154} :catchall_154

    .line 776
    :catchall_154
    move-exception v1

    :try_start_155
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    throw v1
    :try_end_159
    .catchall {:try_start_155 .. :try_end_159} :catchall_159

    :catchall_159
    move-exception v2

    if-eqz v1, :cond_162

    if-eq v1, v2, :cond_163

    :try_start_15e
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_163

    :cond_162
    move-object v1, v2

    :cond_163
    :goto_163
    throw v1
    :try_end_164
    .catch Ljava/lang/Exception; {:try_start_15e .. :try_end_164} :catch_164
    .catchall {:try_start_15e .. :try_end_164} :catchall_17d

    .line 785
    :catch_164
    move-exception v1

    goto :goto_16c

    :catchall_166
    move-exception p2

    goto :goto_17f

    :catch_168
    move-exception p1

    move-object v9, v1

    move-object v1, p1

    move-object p1, v9

    :goto_16c
    :try_start_16c
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v2

    if-nez v2, :cond_175

    invoke-static {v1}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V
    :try_end_175
    .catchall {:try_start_16c .. :try_end_175} :catchall_17d

    :cond_175
    if-eqz p1, :cond_179

    goto/16 :goto_ea

    .line 786
    :cond_179
    :goto_179
    invoke-static {p2, p0, p3, v0, v1}, Le/e/a/ModernShorts;->complete(Le/e/a/ModernShorts$State;Le/e/a/NetworkTask;Le/e/a/ModernShorts$Result;Ljava/util/ArrayList;Ljava/lang/Exception;)V

    .line 787
    return-void

    .line 785
    :catchall_17d
    move-exception p2

    move-object v1, p1

    :goto_17f
    if-eqz v1, :cond_187

    invoke-virtual {p0, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_187
    throw p2
.end method

.method static synthetic lambda$31(ILandroid/app/Activity;)V
    .registers 4

    .line 876
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_17

    goto :goto_26

    .line 877
    :cond_17
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ModernShorts;->watchRefresh(Landroid/view/View;)V

    .line 878
    invoke-static {p1, p0}, Le/e/a/ModernShorts;->monitorRefresh(Landroid/app/Activity;I)V

    .line 879
    return-void

    .line 876
    :cond_26
    :goto_26
    return-void
.end method

.method static synthetic lambda$4(Le/e/a/ModernShorts$Home;Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 4

    .line 319
    iget-object p3, p0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_19

    const/4 p3, 0x0

    invoke-static {p1, p2, p0, p3}, Le/e/a/ModernShorts;->loadFeed(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V

    goto :goto_1c

    .line 320
    :cond_19
    invoke-static {p1, p2, p0}, Le/e/a/ModernShorts;->search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    .line 321
    :goto_1c
    return-void
.end method

.method static synthetic lambda$5(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Landroid/view/View;)V
    .registers 4

    .line 322
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    return-void
.end method

.method static synthetic lambda$6(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 6

    .line 324
    const/4 p3, 0x3

    if-eq p4, p3, :cond_9

    const/4 p3, 0x2

    if-ne p4, p3, :cond_7

    goto :goto_9

    .line 327
    :cond_7
    const/4 p0, 0x0

    return p0

    .line 325
    :cond_9
    :goto_9
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$7(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 373
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method static synthetic lambda$8(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V
    .registers 4

    .line 389
    invoke-static {p0, p1, p2, p3}, Le/e/a/ModernShorts;->loadFeed(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V

    return-void
.end method

.method static synthetic lambda$9(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;ZLjava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 9

    .line 391
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/ModernShorts$State;->busy:Z

    .line 392
    iget-boolean v1, p0, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v1, :cond_50

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_e

    goto :goto_50

    .line 393
    :cond_e
    iget-object v1, p2, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 394
    if-nez p5, :cond_43

    invoke-virtual {p4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p5

    if-eqz p5, :cond_1e

    goto :goto_43

    .line 398
    :cond_1e
    new-instance p5, Le/e/a/ModernShorts$Feed;

    const/4 v1, 0x0

    invoke-direct {p5, v1}, Le/e/a/ModernShorts$Feed;-><init>(Le/e/a/ModernShorts$Feed;)V

    iput-object p5, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p5, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {p1, p5, p4}, Le/e/a/ModernShorts;->append(Landroid/content/Context;Le/e/a/ModernShorts$Feed;Ljava/util/ArrayList;)I

    iget-object p4, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {p4}, Le/e/a/ModernShorts;->remember(Le/e/a/ModernShorts$Feed;)V

    invoke-static {p1, p0, p2}, Le/e/a/ModernShorts;->renderHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    .line 399
    if-eqz p3, :cond_42

    iget-object p2, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p2, p2, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_42

    invoke-static {p1, p0, v0}, Le/e/a/ModernShorts;->launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    .line 400
    :cond_42
    return-void

    .line 395
    :cond_43
    :goto_43
    iget-object p0, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    const-string p1, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u901a\u4fe1\u72b6\u614b\u3092\u78ba\u8a8d\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 396
    iget-object p0, p2, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setVisibility(I)V

    return-void

    .line 392
    :cond_50
    :goto_50
    return-void
.end method

.method private static launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V
    .registers 6

    .line 643
    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_68

    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->launching:Z

    if-nez v0, :cond_68

    if-ltz p2, :cond_68

    iget-object v0, p1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v0, v0, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p2, v0, :cond_15

    goto :goto_68

    .line 644
    :cond_15
    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/ModernShorts$State;->launching:Z

    iput p2, p1, Le/e/a/ModernShorts$State;->index:I

    .line 645
    iget-boolean v1, p1, Le/e/a/ModernShorts$State;->home:Z

    if-nez v1, :cond_20

    iput-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    .line 646
    :cond_20
    iget-object v1, p1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ModernShorts$Item;

    iget-object v1, v1, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-static {p0, v1}, Le/e/a/ModernShorts;->player(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "nicoid_re_shorts"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v1, Le/e/a/ModernShorts$Feed;->key:Ljava/lang/String;

    const-string v2, "nicoid_re_shorts_session"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 647
    const-string v1, "nicoid_re_shorts_index"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Le/e/a/ModernShorts$Item;

    iget-object p2, p2, Le/e/a/ModernShorts$Item;->title:Ljava/lang/String;

    const-string v1, "title"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    .line 646
    nop

    .line 649
    invoke-virtual {p0, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    iget-boolean p1, p1, Le/e/a/ModernShorts$State;->home:Z

    if-nez p1, :cond_63

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_63
    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 650
    return-void

    .line 643
    :cond_68
    :goto_68
    return-void
.end method

.method private static launchFrom(Landroid/app/Activity;Le/e/a/ModernShorts$Feed;I)V
    .registers 6

    .line 199
    iget-object v0, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernShorts$Item;

    iget-object v0, v0, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-static {p0, v0}, Le/e/a/ModernShorts;->player(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_re_shorts"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_re_shorts_session"

    iget-object v2, p1, Le/e/a/ModernShorts$Feed;->key:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 200
    const-string v1, "nicoid_re_shorts_index"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    iget-object p1, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/ModernShorts$Item;

    iget-object p1, p1, Le/e/a/ModernShorts$Item;->title:Ljava/lang/String;

    const-string p2, "title"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 199
    nop

    .line 201
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 202
    return-void
.end method

.method private static liftController(Landroid/app/Activity;)V
    .registers 7

    .line 624
    const-string v0, "controller"

    invoke-static {p0, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_9

    return-void

    .line 625
    :cond_9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 626
    instance-of v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_27

    .line 627
    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 628
    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    const/16 v4, 0x50

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    if-eq v3, v5, :cond_27

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result p0

    iput p0, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 630
    :cond_27
    return-void
.end method

.method private static loadFeed(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V
    .registers 6

    .line 386
    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v0, :cond_31

    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-eqz v0, :cond_9

    goto :goto_31

    .line 387
    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    iget-object v0, p2, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p2, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 388
    iget-object v0, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    const-string v1, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u8aad\u307f\u8fbc\u3093\u3067\u3044\u307e\u3059\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 389
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda28;

    invoke-direct {v0, p0, p1, p2, p3}, Le/e/a/ModernShorts$$ExternalSyntheticLambda28;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V

    iput-object v0, p1, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    .line 390
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda29;

    invoke-direct {v0, p1, p0, p2, p3}, Le/e/a/ModernShorts$$ExternalSyntheticLambda29;-><init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;Z)V

    const/4 p0, 0x0

    invoke-static {p1, p0, v0}, Le/e/a/ModernShorts;->request(Le/e/a/ModernShorts$State;Ljava/lang/String;Le/e/a/ModernShorts$Result;)V

    .line 401
    return-void

    .line 386
    :cond_31
    :goto_31
    return-void
.end method

.method private static loadThumbnail(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V
    .registers 3

    .line 434
    invoke-static {p0, p1, p2}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 435
    return-void
.end method

.method private static log(Ljava/lang/Exception;)V
    .registers 2

    .line 889
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "nicoid-shorts"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private static monitorRefresh(Landroid/app/Activity;I)V
    .registers 4

    .line 875
    sget-object v0, Le/e/a/ModernShorts;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/ModernShorts$$ExternalSyntheticLambda11;

    invoke-direct {v1, p1, p0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda11;-><init>(ILandroid/app/Activity;)V

    .line 879
    nop

    .line 875
    const-wide/16 p0, 0x3e8

    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 880
    return-void
.end method

.method public static normalPlayer(Landroid/app/Activity;)V
    .registers 9

    .line 569
    sget-object v0, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernShorts$State;

    const/4 v1, 0x1

    if-eqz v0, :cond_d

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->returnFromNormal:Z

    .line 570
    :cond_d
    const/4 v2, 0x0

    :try_start_e
    const-string v3, "v"

    invoke-static {p0, v3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "a0"

    invoke-static {v3, v4}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_1a} :catch_88

    .line 571
    :try_start_1a
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "getCurrentPosition"

    new-array v7, v2, [Ljava/lang/Class;

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v6, v2, [Ljava/lang/Object;

    invoke-virtual {v5, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v4
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_32} :catch_33

    goto :goto_36

    :catch_33
    move-exception v4

    const-wide/16 v4, 0x0

    .line 572
    :goto_36
    :try_start_36
    new-instance v6, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-virtual {v6, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v7, "nicoid_re_shorts"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    const-string v7, "nicoid_re_shorts_session"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    const-string v7, "nicoid_re_shorts_index"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    const-string v7, "nicoid_disable_shorts"

    invoke-virtual {v6, v7, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v1

    const-string v7, "nicoid_resume_position"

    invoke-virtual {v1, v7, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 573
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v7, "https://www.nicovideo.jp/watch/"

    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "b0"

    invoke-static {v3, v7}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v6, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 574
    if-eqz v0, :cond_84

    iput-wide v4, v0, Le/e/a/ModernShorts$State;->returnPosition:J

    .line 575
    :cond_84
    invoke-virtual {p0, v6}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_87
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_87} :catch_88

    .line 576
    goto :goto_90

    :catch_88
    move-exception p0

    if-eqz v0, :cond_8d

    iput-boolean v2, v0, Le/e/a/ModernShorts$State;->returnFromNormal:Z

    :cond_8d
    invoke-static {p0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 577
    :goto_90
    return-void
.end method

.method public static openVideos(Landroid/app/Activity;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;I)Z
    .registers 12

    .line 172
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-static/range {v0 .. v6}, Le/e/a/ModernShorts;->openVideos(Landroid/app/Activity;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;IZZ)Z

    move-result p0

    return p0
.end method

.method public static openVideos(Landroid/app/Activity;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;IZZ)Z
    .registers 16

    .line 174
    const/4 v0, 0x0

    if-eqz p1, :cond_ae

    array-length v1, p1

    if-eqz v1, :cond_ae

    if-ltz p4, :cond_ae

    array-length v1, p1

    if-lt p4, v1, :cond_d

    goto/16 :goto_ae

    .line 175
    :cond_d
    new-instance v1, Le/e/a/ModernShorts$Feed;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Le/e/a/ModernShorts$Feed;-><init>(Le/e/a/ModernShorts$Feed;)V

    .line 176
    const/4 v2, 0x1

    iput-boolean v2, v1, Le/e/a/ModernShorts$Feed;->fixed:Z

    .line 177
    const/4 v3, 0x0

    :goto_17
    array-length v4, p1

    const-string v5, "ss[0-9]+"

    if-lt v3, v4, :cond_7e

    .line 184
    nop

    .line 185
    aget-object p2, p1, p4

    .line 186
    const/4 p3, 0x0

    const/4 v3, 0x0

    :goto_21
    array-length v4, p1

    if-ge p3, v4, :cond_41

    iget-object v4, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v3, v4, :cond_2d

    goto :goto_41

    .line 187
    :cond_2d
    aget-object v4, p1, p3

    if-eqz v4, :cond_3e

    aget-object v4, p1, p3

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3e

    .line 188
    if-ne p3, p4, :cond_3c

    goto :goto_42

    .line 189
    :cond_3c
    add-int/lit8 v3, v3, 0x1

    .line 186
    :cond_3e
    add-int/lit8 p3, p3, 0x1

    goto :goto_21

    .line 192
    :cond_41
    :goto_41
    const/4 v3, -0x1

    :goto_42
    iget-object p1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_7d

    if-ltz v3, :cond_7d

    if-nez p2, :cond_4f

    goto :goto_7d

    .line 193
    :cond_4f
    iput-boolean p5, v1, Le/e/a/ModernShorts$Feed;->continuous:Z

    if-eqz p6, :cond_76

    iget-object p1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    :goto_58
    iget-object p1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lt v0, p1, :cond_61

    goto :goto_76

    :cond_61
    iget-object p1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/ModernShorts$Item;

    iget-object p1, p1, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_73

    move v3, v0

    goto :goto_76

    :cond_73
    add-int/lit8 v0, v0, 0x1

    goto :goto_58

    .line 194
    :cond_76
    :goto_76
    invoke-static {v1}, Le/e/a/ModernShorts;->remember(Le/e/a/ModernShorts$Feed;)V

    .line 195
    invoke-static {p0, v1, v3}, Le/e/a/ModernShorts;->launchFrom(Landroid/app/Activity;Le/e/a/ModernShorts$Feed;I)V

    .line 196
    return v2

    .line 192
    :cond_7d
    :goto_7d
    return v0

    .line 178
    :cond_7e
    aget-object v4, p1, v3

    .line 179
    if-eqz v4, :cond_aa

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_89

    goto :goto_aa

    .line 180
    :cond_89
    if-eqz p2, :cond_95

    array-length v5, p2

    if-ge v3, v5, :cond_95

    aget-object v5, p2, v3

    if-eqz v5, :cond_95

    aget-object v5, p2, v3

    goto :goto_96

    :cond_95
    move-object v5, v4

    .line 181
    :goto_96
    if-eqz p3, :cond_9e

    array-length v6, p3

    if-ge v3, v6, :cond_9e

    aget-object v6, p3, v3

    goto :goto_a0

    :cond_9e
    const-string v6, ""

    .line 182
    :goto_a0
    iget-object v7, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    new-instance v8, Le/e/a/ModernShorts$Item;

    invoke-direct {v8, v4, v5, v6}, Le/e/a/ModernShorts$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    :cond_aa
    :goto_aa
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_17

    .line 174
    :cond_ae
    :goto_ae
    return v0
.end method

.method private static player(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .registers 5

    .line 168
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://www.nicovideo.jp/watch/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 169
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "intentselect"

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    .line 168
    return-object p0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 113
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static register(Landroid/content/Context;)V
    .registers 4

    .line 808
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 809
    sget-boolean v0, Le/e/a/ModernShorts;->registered:Z

    if-eqz v0, :cond_14

    return-void

    :cond_14
    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/ModernShorts;->registered:Z

    .line 810
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Landroid/app/Application;

    .line 811
    new-instance v0, Le/e/a/ModernShorts$2;

    invoke-direct {v0}, Le/e/a/ModernShorts$2;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 855
    return-void
.end method

.method private static remember(Le/e/a/ModernShorts$Feed;)V
    .registers 3

    .line 672
    sget-object v0, Le/e/a/ModernShorts;->FEEDS:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Le/e/a/ModernShorts$Feed;->key:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Le/e/a/ModernShorts;->FEEDS:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->size()I

    move-result p0

    const/4 v0, 0x4

    if-le p0, v0, :cond_23

    sget-object p0, Le/e/a/ModernShorts;->FEEDS:Ljava/util/LinkedHashMap;

    sget-object v0, Le/e/a/ModernShorts;->FEEDS:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_23
    return-void
.end method

.method private static removeMovedMenuRows(Ljava/util/ArrayList;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "*>;)V"
        }
    .end annotation

    .line 303
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_4
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_b

    .line 307
    return-void

    .line 304
    :cond_b
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 305
    const-string v1, "\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5"

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2f

    const-string v1, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2f

    const-string v1, "\u305d\u306e\u4ed6"

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2f

    const-string v1, "\u30b7\u30e7\u30fc\u30c8"

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_2f
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    goto :goto_4
.end method

.method private static renderHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 20

    .line 403
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v2, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v3, v2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v5, v5, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " \u672c\u306e\u52d5\u753b"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 404
    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_2d
    iget-object v5, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v5, v5, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v4, v5, :cond_38

    .line 432
    return-void

    .line 405
    :cond_38
    iget-object v5, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v5, v5, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/ModernShorts$Item;

    .line 406
    new-instance v6, Landroid/widget/FrameLayout;

    invoke-direct {v6, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 407
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v8, 0x1010031

    const v9, -0xe4e2de

    invoke-static {v0, v8, v9}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 408
    const/16 v8, 0x14

    invoke-static {v0, v8}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v6, v7}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    invoke-virtual {v6, v7}, Landroid/widget/FrameLayout;->setClickable(Z)V

    invoke-virtual {v6, v7}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 409
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v9, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 410
    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v9, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v8, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 411
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v11, "\u25b6"

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v11, 0x42100000    # 36.0f

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTextSize(F)V

    .line 412
    const/16 v11, 0x11

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setGravity(I)V

    const v11, 0x7f03005e

    const v12, -0xad335d

    invoke-static {v0, v11, v12}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v11

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 413
    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v11, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v9, v11}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 414
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v12, 0x50

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 415
    const/16 v13, 0xc

    invoke-static {v0, v13}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v14

    const/16 v15, 0x18

    invoke-static {v0, v15}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-static {v0, v13}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-static {v0, v13}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-virtual {v11, v14, v15, v12, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 416
    new-instance v10, Landroid/graphics/drawable/GradientDrawable;

    sget-object v12, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 417
    const/4 v14, 0x3

    new-array v15, v14, [I

    const/high16 v16, -0x12000000

    aput v16, v15, v3

    const/high16 v16, -0x67000000

    aput v16, v15, v7

    .line 416
    invoke-direct {v10, v12, v15}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 417
    invoke-virtual {v11, v10}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 418
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v10, v5, Le/e/a/ModernShorts$Item;->title:Ljava/lang/String;

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v10, 0x41800000    # 16.0f

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 419
    invoke-virtual {v7, v14}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 420
    const/4 v10, -0x1

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 421
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v14, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b  \u2022  "

    invoke-direct {v12, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v14, v5, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v12, 0x41300000    # 11.0f

    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setTextSize(F)V

    .line 422
    const v12, 0x1010038

    const v14, -0x47443b

    invoke-static {v0, v12, v14}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v12

    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 423
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x2

    const/4 v15, -0x1

    invoke-direct {v12, v15, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v14, 0x5

    invoke-static {v0, v14}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v14

    iput v14, v12, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 424
    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v11, v10, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 425
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v10, 0x91

    invoke-static {v0, v10}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v10

    const/16 v12, 0x50

    invoke-direct {v7, v15, v10, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v6, v11, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 426
    iget-boolean v7, v5, Le/e/a/ModernShorts$Item;->paid:Z

    invoke-static {v6, v7}, Le/e/a/PaidVideos;->show(Landroid/view/ViewGroup;Z)V

    .line 427
    new-instance v7, Le/e/a/ModernShorts$$ExternalSyntheticLambda3;

    invoke-direct {v7, v0, v1, v4}, Le/e/a/ModernShorts$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    invoke-virtual {v6, v7}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 428
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v10, 0xda

    invoke-static {v0, v10}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v10

    const/16 v11, 0x172

    invoke-static {v0, v11}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v7, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 429
    invoke-static {v0, v13}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v10

    iput v10, v7, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iget-object v10, v2, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 430
    iget-object v5, v5, Le/e/a/ModernShorts$Item;->thumbnail:Ljava/lang/String;

    invoke-static {v5, v8, v9}, Le/e/a/ModernShorts;->loadThumbnail(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 404
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2d
.end method

.method private static request(Le/e/a/ModernShorts$State;Ljava/lang/String;Le/e/a/ModernShorts$Result;)V
    .registers 12

    .line 723
    invoke-static {}, Le/e/a/ModernShorts;->cookie()Ljava/lang/String;

    move-result-object v3

    .line 724
    new-instance v6, Le/e/a/NetworkTask;

    invoke-direct {v6}, Le/e/a/NetworkTask;-><init>()V

    iput-object v6, p0, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    .line 725
    sget-object v7, Le/e/a/ModernShorts;->REQUESTS:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v8, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;

    move-object v0, v8

    move-object v1, v6

    move-object v2, p1

    move-object v4, p0

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;-><init>(Le/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/String;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;)V

    invoke-virtual {v6, v7, v8}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 754
    return-void
.end method

.method private static requestSearch(Le/e/a/ModernShorts$State;Ljava/lang/String;Le/e/a/ModernShorts$Result;)V
    .registers 6

    .line 756
    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p0, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    .line 757
    sget-object v1, Le/e/a/ModernShorts;->REQUESTS:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v2, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0, p1, p0, p2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;-><init>(Le/e/a/NetworkTask;Ljava/lang/String;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 788
    return-void
.end method

.method public static restoreLayout(Landroid/app/Activity;)V
    .registers 9

    .line 563
    sget-object v0, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernShorts$State;

    if-eqz v0, :cond_c2

    iget-boolean v1, v0, Le/e/a/ModernShorts$State;->home:Z

    if-nez v1, :cond_c2

    iget-boolean v0, v0, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_c2

    invoke-static {p0}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1a

    goto/16 :goto_c2

    .line 564
    :cond_1a
    const-string v0, "info"

    const-string v1, "tabinfo"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_25
    const/4 v4, 0x1

    const/4 v5, 0x2

    if-lt v2, v5, :cond_aa

    .line 565
    const-string v0, "videoLayout"

    invoke-static {p0, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_58

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    if-eqz v2, :cond_58

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v5, -0x1

    if-ne v2, v5, :cond_48

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v2, v5, :cond_58

    :cond_48
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    const/4 v3, 0x1

    .line 566
    :cond_58
    if-eqz v3, :cond_a9

    invoke-static {p0}, Le/e/a/ModernShorts;->fillVideo(Landroid/app/Activity;)V

    invoke-static {p0}, Le/e/a/ModernShorts;->liftController(Landroid/app/Activity;)V

    const-string v0, "video_view"

    invoke-static {p0, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_a9

    :try_start_68
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "setMeasureBasedOnAspectRatioEnabled"

    new-array v3, v4, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v1

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "com.devbrackets.android.exomedia.core.video.scale.ScaleType"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v2, "FIT_CENTER"

    invoke-static {v0, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v5, "setScaleType"

    new-array v6, v4, [Ljava/lang/Class;

    aput-object v0, v6, v1

    invoke-virtual {v3, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v3, v4, [Ljava/lang/Object;

    aput-object v2, v3, v1

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a4
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_a4} :catch_a5

    goto :goto_a9

    :catch_a5
    move-exception p0

    invoke-static {p0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 567
    :cond_a9
    :goto_a9
    return-void

    .line 564
    :cond_aa
    aget-object v5, v0, v2

    invoke-static {p0, v5}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_be

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v7, 0x8

    if-eq v6, v7, :cond_be

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    const/4 v3, 0x1

    :cond_be
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_25

    .line 563
    :cond_c2
    :goto_c2
    return-void
.end method

.method private static retryHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 4

    .line 382
    iget-object v0, p2, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Le/e/a/ModernShorts;->loadFeed(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V

    goto :goto_1c

    .line 383
    :cond_19
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    .line 384
    :goto_1c
    return-void
.end method

.method private static search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 6

    .line 437
    iget-object v0, p2, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 438
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_48

    iget-boolean v1, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-eqz v1, :cond_19

    goto :goto_48

    .line 439
    :cond_19
    invoke-static {p1}, Le/e/a/ModernShorts;->cancelRequest(Le/e/a/ModernShorts$State;)V

    .line 440
    const/4 v1, 0x1

    iput-boolean v1, p1, Le/e/a/ModernShorts$State;->busy:Z

    iget-object v1, p2, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v1, p2, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 441
    iget-object v1, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    const-string v2, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u691c\u7d22\u3057\u3066\u3044\u307e\u3059\u2026"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p2, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 442
    new-instance v1, Le/e/a/ModernShorts$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda9;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    iput-object v1, p1, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    .line 443
    new-instance v1, Le/e/a/ModernShorts$$ExternalSyntheticLambda10;

    invoke-direct {v1, p1, p0, p2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda10;-><init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;)V

    invoke-static {p1, v0, v1}, Le/e/a/ModernShorts;->requestSearch(Le/e/a/ModernShorts$State;Ljava/lang/String;Le/e/a/ModernShorts$Result;)V

    .line 453
    return-void

    .line 438
    :cond_48
    :goto_48
    return-void
.end method

.method private static setRefreshing(Landroid/view/View;Z)V
    .registers 8

    .line 886
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setRefreshing"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1d} :catch_1e

    goto :goto_1f

    .line 887
    :catch_1e
    move-exception p0

    .line 888
    :goto_1f
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 11

    .line 244
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "0"

    const-string v2, "app_lang"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 245
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_16

    return-void

    .line 246
    :cond_16
    const-string v1, "player"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceGroup;

    if-nez v1, :cond_21

    move-object v1, v0

    .line 247
    :cond_21
    const-string v3, "show_shorts_menu"

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    const/4 v5, 0x1

    if-nez v4, :cond_46

    .line 248
    new-instance v4, Landroid/preference/CheckBoxPreference;

    invoke-direct {v4, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 249
    const-string v3, "\u30b5\u30a4\u30c9\u30d0\u30fc\u306b\u30b7\u30e7\u30fc\u30c8\u3092\u8868\u793a"

    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v3, "\u30e9\u30f3\u30ad\u30f3\u30b0\u306e\u4e0b\u306b\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u306e\u5165\u53e3\u3092\u8868\u793a\u3057\u307e\u3059"

    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 250
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-virtual {v1, v4}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 252
    :cond_46
    const-string v1, "v1.10.1 @chikuwadon"

    invoke-static {p0, v1}, Le/e/a/PatchInfo;->ensure(Landroid/preference/PreferenceActivity;Ljava/lang/String;)Landroid/preference/Preference;

    move-result-object v3

    .line 253
    if-eqz v3, :cond_63

    .line 254
    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 257
    invoke-virtual {v3, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 258
    invoke-virtual {v3, v5}, Landroid/preference/Preference;->setSelectable(Z)V

    .line 259
    new-array v1, v5, [I

    new-array v4, v5, [J

    .line 260
    new-instance v6, Le/e/a/ModernShorts$$ExternalSyntheticLambda12;

    invoke-direct {v6, v4, v1, p0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda12;-><init>([J[ILandroid/preference/PreferenceActivity;)V

    invoke-virtual {v3, v6}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 268
    :cond_63
    const-string v1, "nicoid_share_debug"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    if-nez v3, :cond_f7

    .line 269
    new-instance v3, Landroid/preference/PreferenceCategory;

    invoke-direct {v3, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    const-string v4, "nicoid_debug_category"

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->setKey(Ljava/lang/String;)V

    const-string v4, "\u30c7\u30d0\u30c3\u30b0"

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    .line 270
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v4

    .line 271
    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_80
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v8

    if-lt v7, v8, :cond_87

    goto :goto_a0

    .line 272
    :cond_87
    invoke-virtual {v0, v7}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v8

    .line 273
    invoke-static {v8, v2}, Le/e/a/ModernShorts;->containsPreferenceKey(Landroid/preference/Preference;Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_9d

    const-string v9, "player_lang"

    invoke-static {v8, v9}, Le/e/a/ModernShorts;->containsPreferenceKey(Landroid/preference/Preference;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_9a

    goto :goto_9d

    .line 271
    :cond_9a
    add-int/lit8 v7, v7, 0x1

    goto :goto_80

    .line 274
    :cond_9d
    :goto_9d
    add-int/lit8 v4, v7, 0x1

    .line 275
    nop

    .line 279
    :goto_a0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 280
    const/4 v7, 0x0

    :goto_a6
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v8

    if-lt v7, v8, :cond_ed

    .line 281
    nop

    :goto_ad
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt v6, v7, :cond_da

    .line 282
    mul-int/lit8 v4, v4, 0x2

    sub-int/2addr v4, v5

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceCategory;->setOrder(I)V

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 283
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v1, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u306e\u4fdd\u5b58"

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 284
    const-string v1, "\u518d\u751f\u72b6\u6cc1\u3084\u901a\u4fe1\u30a8\u30e9\u30fc\u306a\u3069\u306e\u8a3a\u65ad\u30ed\u30b0\u3092 Download \u30d5\u30a9\u30eb\u30c0\u306b\u4fdd\u5b58\u3057\u307e\u3059\u3002\u4e0d\u5177\u5408\u5831\u544a\u6642\u306b\u5229\u7528\u3067\u304d\u307e\u3059\u3002"

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 285
    new-instance v1, Le/e/a/ModernShorts$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda13;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 289
    invoke-virtual {v3, v2}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_f7

    .line 281
    :cond_da
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/preference/Preference;

    mul-int/lit8 v8, v6, 0x2

    if-ge v6, v4, :cond_e5

    goto :goto_e7

    :cond_e5
    add-int/lit8 v8, v8, 0x2

    :goto_e7
    invoke-virtual {v7, v8}, Landroid/preference/Preference;->setOrder(I)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_ad

    .line 280
    :cond_ed
    invoke-virtual {v0, v7}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_a6

    .line 291
    :cond_f7
    :goto_f7
    invoke-static {v0}, Le/e/a/UiText;->preferences(Landroid/preference/Preference;)V

    .line 292
    return-void
.end method

.method private static showList(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V
    .registers 18

    .line 581
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 582
    const/16 v4, 0x10

    invoke-static {v0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    const/16 v6, 0xc

    invoke-static {v0, v6}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {v0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {v0, v6}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v2, v5, v7, v8, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 583
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/16 v7, 0x18

    invoke-static {v0, v7}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v5, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 584
    const v7, 0x1010031

    const v8, -0xe4e2de

    invoke-static {v0, v7, v8}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v9

    invoke-virtual {v5, v9}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 585
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v9, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b"

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v9, 0x41b00000    # 22.0f

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 586
    const v9, 0x1010036

    const/4 v10, -0x1

    invoke-static {v0, v9, v10}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v11

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 587
    new-instance v5, Landroid/widget/ScrollView;

    invoke-direct {v5, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 588
    invoke-virtual {v5, v11}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v12, 0x190

    invoke-static {v0, v12}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v3, v10, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 589
    invoke-static/range {p0 .. p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    .line 590
    const/4 v5, 0x0

    const/4 v12, 0x0

    :goto_8c
    iget-object v13, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v13, v13, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lt v12, v13, :cond_dc

    .line 609
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v6, 0x800005

    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 610
    const-string v6, "\u66f4\u65b0"

    invoke-static {v0, v6}, Le/e/a/ModernShorts;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    new-instance v7, Le/e/a/ModernShorts$$ExternalSyntheticLambda5;

    invoke-direct {v7, v3, v0, v1}, Le/e/a/ModernShorts$$ExternalSyntheticLambda5;-><init>(Landroid/app/AlertDialog;Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 611
    const-string v1, "\u9589\u3058\u308b"

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Le/e/a/ModernShorts$$ExternalSyntheticLambda6;

    invoke-direct {v1, v3}, Le/e/a/ModernShorts$$ExternalSyntheticLambda6;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 612
    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 613
    invoke-virtual {v3}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_db

    invoke-virtual {v3}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 614
    :cond_db
    return-void

    .line 591
    :cond_dc
    iget-object v13, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v13, v13, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Le/e/a/ModernShorts$Item;

    .line 592
    new-instance v14, Landroid/widget/LinearLayout;

    invoke-direct {v14, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v14, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v15, 0x8

    invoke-static {v0, v15}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-static {v0, v15}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v0, v15}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v0, v15}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-virtual {v14, v9, v5, v6, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 593
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-static {v0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 594
    invoke-static {v0, v7, v8}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 595
    iget v6, v1, Le/e/a/ModernShorts$State;->index:I

    const v9, -0xad335d

    const v10, 0x7f03005e

    if-ne v12, v6, :cond_12d

    const/4 v6, 0x2

    invoke-static {v0, v6}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v0, v10, v9}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v4

    invoke-virtual {v5, v6, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 596
    :cond_12d
    invoke-virtual {v14, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 597
    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v6, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 598
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v7, -0x1

    invoke-direct {v6, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 599
    const-string v7, "\u25b6"

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v7, 0x11

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setGravity(I)V

    invoke-static {v0, v10, v9}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 600
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v9, -0x1

    invoke-direct {v7, v9, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v6, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v9, 0x46

    invoke-static {v0, v9}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v9

    const/16 v10, 0x64

    invoke-static {v0, v10}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v7, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v14, v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 601
    iget-boolean v7, v13, Le/e/a/ModernShorts$Item;->paid:Z

    invoke-static {v4, v7}, Le/e/a/PaidVideos;->show(Landroid/view/ViewGroup;Z)V

    .line 602
    iget-object v4, v13, Le/e/a/ModernShorts$Item;->thumbnail:Ljava/lang/String;

    invoke-static {v4, v5, v6}, Le/e/a/ModernShorts;->loadThumbnail(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 603
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    new-instance v5, Ljava/lang/StringBuilder;

    add-int/lit8 v6, v12, 0x1

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "  "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v7, v13, Le/e/a/ModernShorts$Item;->title:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v5, 0x41700000    # 15.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v5, 0x3

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 604
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    const/16 v5, 0xc

    invoke-static {v0, v5}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v9, 0x0

    invoke-virtual {v4, v7, v9, v9, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 605
    const v7, 0x1010036

    const/4 v10, -0x1

    invoke-static {v0, v7, v10}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v13

    invoke-virtual {v4, v13}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x3f800000    # 1.0f

    const/4 v5, -0x2

    invoke-direct {v10, v9, v5, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v14, v4, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 606
    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda4;

    invoke-direct {v4, v3, v12, v1, v0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda4;-><init>(Landroid/app/AlertDialog;ILe/e/a/ModernShorts$State;Landroid/app/Activity;)V

    invoke-virtual {v14, v4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 607
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v4, v10, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {v0, v15}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v11, v14, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 590
    move v12, v6

    const/16 v4, 0x10

    const/4 v5, 0x0

    const/16 v6, 0xc

    const v7, 0x1010031

    const v9, 0x1010036

    goto/16 :goto_8c
.end method

.method private static step(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V
    .registers 5

    .line 633
    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v0, :cond_50

    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_50

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_f

    goto :goto_50

    .line 634
    :cond_f
    iget v0, p1, Le/e/a/ModernShorts$State;->index:I

    add-int/2addr v0, p2

    .line 635
    const/4 p2, 0x0

    if-gez v0, :cond_1f

    const-string p1, "\u6700\u521d\u306e\u52d5\u753b\u3067\u3059"

    invoke-static {p0, p1, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 636
    :cond_1f
    iget-object v1, p1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_4c

    .line 637
    iget-object v0, p1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-boolean v0, v0, Le/e/a/ModernShorts$Feed;->fixed:Z

    if-eqz v0, :cond_39

    const-string p1, "\u6700\u5f8c\u306e\u52d5\u753b\u3067\u3059"

    invoke-static {p0, p1, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 638
    :cond_39
    iget-object p2, p1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p2, p2, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    iget v0, p1, Le/e/a/ModernShorts$State;->index:I

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Le/e/a/ModernShorts$Item;

    iget-object p2, p2, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Le/e/a/ModernShorts;->extend(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V

    return-void

    .line 640
    :cond_4c
    invoke-static {p0, p1, v0}, Le/e/a/ModernShorts;->launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    .line 641
    return-void

    .line 633
    :cond_50
    :goto_50
    return-void
.end method

.method private static thumbnail(Lorg/json/JSONObject;Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 13

    .line 790
    const/4 v0, 0x2

    new-array v1, v0, [Lorg/json/JSONObject;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p0, v1, p1

    const/4 p0, 0x0

    :goto_a
    const-string p1, ""

    if-lt p0, v0, :cond_f

    .line 798
    return-object p1

    .line 790
    :cond_f
    aget-object v3, v1, p0

    .line 791
    if-nez v3, :cond_14

    goto :goto_4e

    .line 792
    :cond_14
    const-string v4, "thumbnail"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 793
    const-string v5, "https://"

    if-eqz v4, :cond_41

    const-string v6, "url"

    const-string v7, "listingUrl"

    const-string v8, "shortUrl"

    const-string v9, "largeUrl"

    const-string v10, "middleUrl"

    filled-new-array {v8, v9, v10, v6, v7}, [Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    :goto_2d
    const/4 v8, 0x5

    if-lt v7, v8, :cond_31

    goto :goto_41

    :cond_31
    aget-object v8, v6, v7

    .line 794
    invoke-virtual {v4, v8, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3e

    return-object v8

    .line 793
    :cond_3e
    add-int/lit8 v7, v7, 0x1

    goto :goto_2d

    .line 796
    :cond_41
    :goto_41
    const-string v4, "thumbnailUrl"

    invoke-virtual {v3, v4, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4e

    return-object p1

    .line 790
    :cond_4e
    :goto_4e
    add-int/lit8 p0, p0, 0x1

    goto :goto_a
.end method

.method private static tint(Landroid/content/Context;Landroid/widget/ProgressBar;)V
    .registers 4

    .line 123
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const v0, 0x7f03005e

    const v1, -0xad335d

    invoke-static {p0, v0, v1}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result p0

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p1, p0, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 124
    return-void
.end method

.method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 12

    .line 676
    sget-object v0, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernShorts$State;

    const/4 v1, 0x0

    if-eqz v0, :cond_12e

    iget-object v2, v0, Le/e/a/ModernShorts$State;->video:Landroid/view/View;

    if-eqz v2, :cond_12e

    iget-boolean v2, v0, Le/e/a/ModernShorts$State;->dead:Z

    if-eqz v2, :cond_15

    goto/16 :goto_12e

    .line 677
    :cond_15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 678
    const/4 v3, 0x1

    if-nez v2, :cond_73

    .line 679
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    iput v2, v0, Le/e/a/ModernShorts$State;->x:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    iput v2, v0, Le/e/a/ModernShorts$State;->y:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v4

    iput-wide v4, v0, Le/e/a/ModernShorts$State;->downTime:J

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->dragging:Z

    .line 680
    iget-boolean v2, v0, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v2, :cond_70

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    iget v4, v0, Le/e/a/ModernShorts$State;->x:F

    iget v5, v0, Le/e/a/ModernShorts$State;->y:F

    invoke-static {v2, v4, v5}, Le/e/a/ModernShorts;->interactive(Landroid/view/View;FF)Z

    move-result v2

    if-nez v2, :cond_70

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    const/16 v4, 0x18

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    int-to-float v5, v5

    cmpg-float v2, v2, v5

    if-ltz v2, :cond_70

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result p0

    sub-int/2addr v2, p0

    int-to-float p0, v2

    cmpl-float p0, p1, p0

    if-gtz p0, :cond_70

    const/4 v3, 0x0

    :cond_70
    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->blocked:Z

    .line 681
    return v1

    .line 683
    :cond_73
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    if-gt v4, v3, :cond_12b

    const/4 v4, 0x5

    if-ne v2, v4, :cond_7e

    goto/16 :goto_12b

    .line 684
    :cond_7e
    const/4 v4, 0x3

    if-ne v2, v4, :cond_8c

    .line 685
    iget-boolean p0, v0, Le/e/a/ModernShorts$State;->dragging:Z

    .line 686
    iget-boolean p1, v0, Le/e/a/ModernShorts$State;->cancelling:Z

    if-nez p1, :cond_8b

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->dragging:Z

    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->blocked:Z

    .line 687
    :cond_8b
    return p0

    .line 689
    :cond_8c
    if-ne v2, v3, :cond_c2

    iget-boolean v5, v0, Le/e/a/ModernShorts$State;->dragging:Z

    if-nez v5, :cond_c2

    iget-boolean v5, v0, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v5, :cond_c2

    .line 690
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    iget v6, v0, Le/e/a/ModernShorts$State;->x:F

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const/16 v6, 0x10

    invoke-static {p0, v6}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v7

    int-to-float v7, v7

    cmpg-float v5, v5, v7

    if-gez v5, :cond_c2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    iget v7, v0, Le/e/a/ModernShorts$State;->y:F

    sub-float/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    invoke-static {p0, v6}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    int-to-float v6, v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_c2

    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->controlsTapped:Z

    .line 691
    :cond_c2
    iget-boolean v5, v0, Le/e/a/ModernShorts$State;->blocked:Z

    if-nez v5, :cond_12a

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v5

    iget-wide v7, v0, Le/e/a/ModernShorts$State;->downTime:J

    cmp-long v9, v5, v7

    if-eqz v9, :cond_d1

    goto :goto_12a

    .line 692
    :cond_d1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    iget v6, v0, Le/e/a/ModernShorts$State;->x:F

    sub-float/2addr v5, v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    iget v7, v0, Le/e/a/ModernShorts$State;->y:F

    sub-float/2addr v6, v7

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->density:F

    invoke-static {v5, v6, v7, v1}, Le/e/a/ShortsRules;->direction(FFFZ)I

    move-result v5

    .line 693
    const/4 v6, 0x2

    if-ne v2, v6, :cond_119

    if-eqz v5, :cond_119

    iget-boolean v6, v0, Le/e/a/ModernShorts$State;->dragging:Z

    if-nez v6, :cond_119

    .line 694
    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->dragging:Z

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->setAction(I)V

    .line 695
    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->cancelling:Z

    .line 696
    :try_start_101
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_10c
    .catchall {:try_start_101 .. :try_end_10c} :catchall_112

    .line 697
    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->cancelling:Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_119

    :catchall_112
    move-exception p0

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->cancelling:Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    throw p0

    .line 699
    :cond_119
    :goto_119
    if-ne v2, v3, :cond_127

    iget-boolean p1, v0, Le/e/a/ModernShorts$State;->dragging:Z

    if-eqz p1, :cond_127

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->dragging:Z

    if-eqz v5, :cond_126

    invoke-static {p0, v0, v5}, Le/e/a/ModernShorts;->step(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    :cond_126
    return v3

    .line 700
    :cond_127
    iget-boolean p0, v0, Le/e/a/ModernShorts$State;->dragging:Z

    return p0

    .line 691
    :cond_12a
    :goto_12a
    return v1

    .line 683
    :cond_12b
    :goto_12b
    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->blocked:Z

    return v1

    .line 676
    :cond_12e
    :goto_12e
    return v1
.end method

.method private static update(Le/e/a/ModernShorts$State;)V
    .registers 4

    .line 579
    iget-object v0, p0, Le/e/a/ModernShorts$State;->number:Landroid/widget/TextView;

    if-eqz v0, :cond_2c

    iget-object v0, p0, Le/e/a/ModernShorts$State;->number:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    iget v2, p0, Le/e/a/ModernShorts$State;->index:I

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object p0, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p0, p0, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2c
    return-void
.end method

.method private static watchRefresh(Landroid/view/View;)V
    .registers 8

    .line 857
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "androidx.swiperefreshlayout.widget.SwipeRefreshLayout"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_56

    .line 858
    invoke-static {p0}, Le/e/a/ModernShorts;->isRefreshing(Landroid/view/View;)Z

    move-result v0

    .line 859
    sget-object v2, Le/e/a/ModernShorts;->REFRESH_WATCH:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 860
    if-nez v0, :cond_25

    sget-object v0, Le/e/a/ModernShorts;->REFRESH_WATCH:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 861
    :cond_25
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .line 862
    if-nez v2, :cond_35

    sget-object v0, Le/e/a/ModernShorts;->REFRESH_WATCH:Ljava/util/WeakHashMap;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_55

    .line 863
    :cond_35
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x2710

    cmp-long v0, v3, v5

    if-ltz v0, :cond_55

    .line 864
    invoke-static {p0, v1}, Le/e/a/ModernShorts;->setRefreshing(Landroid/view/View;Z)V

    sget-object v0, Le/e/a/ModernShorts;->REFRESH_WATCH:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 865
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "\u66f4\u65b0\u304c\u5b8c\u4e86\u3057\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u3082\u3046\u4e00\u5ea6\u304a\u8a66\u3057\u304f\u3060\u3055\u3044\u3002"

    invoke-static {p0, v0, v1}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 867
    :cond_55
    :goto_55
    return-void

    .line 869
    :cond_56
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_6e

    .line 870
    check-cast p0, Landroid/view/ViewGroup;

    .line 871
    nop

    :goto_5d
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lt v1, v0, :cond_64

    goto :goto_6e

    :cond_64
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ModernShorts;->watchRefresh(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_5d

    .line 873
    :cond_6e
    :goto_6e
    return-void
.end method
