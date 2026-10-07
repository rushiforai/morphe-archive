.class public final Le/e/a/ModernShorts;
.super Ljava/lang/Object;
.source "ModernShorts.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ModernShorts$State;,
        Le/e/a/ModernShorts$Feed;,
        Le/e/a/ModernShorts$Home;,
        Le/e/a/ModernShorts$Result;,
        Le/e/a/ModernShorts$Item;
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

.field private static final PATCH_VERSION:Ljava/lang/String; = "v1.7.1-dev.3 @chikuwadon"

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

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

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

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;I)I
    .registers 2

    .line 63
    invoke-static {p0, p1}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$1000(Ljava/lang/Exception;)V
    .registers 1

    .line 63
    invoke-static {p0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic access$1100(Le/e/a/ModernShorts$State;)V
    .registers 1

    .line 63
    invoke-static {p0}, Le/e/a/ModernShorts;->cancelRequest(Le/e/a/ModernShorts$State;)V

    return-void
.end method

.method static synthetic access$400()Ljava/util/WeakHashMap;
    .registers 1

    .line 63
    sget-object v0, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$500()Ljava/util/WeakHashMap;
    .registers 1

    .line 63
    sget-object v0, Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$600(Landroid/app/Activity;I)V
    .registers 2

    .line 63
    invoke-static {p0, p1}, Le/e/a/ModernShorts;->monitorRefresh(Landroid/app/Activity;I)V

    return-void
.end method

.method static synthetic access$700()Ljava/util/WeakHashMap;
    .registers 1

    .line 63
    sget-object v0, Le/e/a/ModernShorts;->MENU_STATE:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$800(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 63
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    .registers 2

    .line 63
    invoke-static {p0, p1}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static active(Landroid/app/Activity;)Z
    .registers 2

    .line 605
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

    goto :goto_15

    :cond_14
    const/4 p0, 0x0

    :goto_15
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

    .line 168
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 169
    invoke-static {p0}, Le/e/a/ModernShorts;->register(Landroid/content/Context;)V

    .line 170
    invoke-static {p1}, Le/e/a/ModernShorts;->removeMovedMenuRows(Ljava/util/ArrayList;)V

    .line 171
    instance-of v0, p0, Landroid/app/Activity;

    const/4 v1, 0x1

    const-string v2, "show_shorts_menu"

    if-eqz v0, :cond_38

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

    .line 172
    :cond_38
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_43

    return-void

    .line 173
    :cond_43
    const-string v0, "ss0"

    invoke-static {p0, v0}, Le/e/a/ModernShorts;->player(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid-re://shorts"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v5

    .line 174
    const-string v4, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u306e\u8996\u8074"

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-string v3, "\u30b7\u30e7\u30fc\u30c8"

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v1, p1

    invoke-static/range {v1 .. v6}, Le/e/a/ModernShorts;->addMenuRow(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    .line 175
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

    .line 203
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

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    .line 204
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

    .line 205
    goto :goto_4c

    :catch_48
    move-exception v0

    invoke-static {v0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 206
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

    .line 596
    iget-object v0, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {p0}, Le/e/a/ContentFilter;->rules(Landroid/content/Context;)Le/e/a/ContentFilter$Rules;

    move-result-object p0

    .line 597
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iget-object v2, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/ModernShorts$Item;

    iget-object v3, v3, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_15

    .line 598
    :cond_27
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_2b
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_59

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/ModernShorts$Item;

    .line 599
    iget-object v3, v2, Le/e/a/ModernShorts$Item;->title:Ljava/lang/String;

    iget-object v4, v2, Le/e/a/ModernShorts$Item;->channel:Ljava/lang/String;

    invoke-virtual {p0, v3, v4}, Le/e/a/ContentFilter$Rules;->blocked(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_58

    iget-object v3, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/16 v4, 0xc8

    if-ge v3, v4, :cond_58

    iget-object v3, v2, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_58

    iget-object v3, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 600
    :cond_58
    goto :goto_2b

    .line 601
    :cond_59
    iget-object p0, p1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    sub-int/2addr p0, v0

    return p0
.end method

.method public static attach(Landroid/app/Activity;)V
    .registers 9

    .line 421
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_d

    move-object v2, v1

    goto :goto_11

    :cond_d
    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    .line 422
    :goto_11
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "nicoid_re_shorts"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_2d

    if-eqz v0, :cond_2c

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    const-string v3, "/shorts/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2d

    :cond_2c
    return-void

    .line 423
    :cond_2d
    invoke-static {v2}, Le/e/a/ShortsRules;->videoId(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_34

    return-void

    .line 424
    :cond_34
    invoke-static {p0}, Le/e/a/ModernShorts;->register(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 425
    new-instance v3, Le/e/a/ModernShorts$State;

    invoke-direct {v3, v1}, Le/e/a/ModernShorts$State;-><init>(Le/e/a/ModernShorts$1;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v6, "nicoid_re_shorts_index"

    invoke-virtual {v4, v6, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    iput v4, v3, Le/e/a/ModernShorts$State;->index:I

    .line 426
    sget-object v4, Le/e/a/ModernShorts;->FEEDS:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "nicoid_re_shorts_session"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/ModernShorts$Feed;

    iput-object v4, v3, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    .line 427
    iget-object v4, v3, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    if-nez v4, :cond_88

    new-instance v4, Le/e/a/ModernShorts$Feed;

    invoke-direct {v4, v1}, Le/e/a/ModernShorts$Feed;-><init>(Le/e/a/ModernShorts$1;)V

    iput-object v4, v3, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v3, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    new-instance v4, Le/e/a/ModernShorts$Item;

    const-string v6, "\u73fe\u5728\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-static/range {v6 .. v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static/range {v6 .. v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v2, v6}, Le/e/a/ModernShorts$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput v5, v3, Le/e/a/ModernShorts$State;->index:I

    iget-object v1, v3, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {v1}, Le/e/a/ModernShorts;->remember(Le/e/a/ModernShorts$Feed;)V

    .line 428
    :cond_88
    iget v1, v3, Le/e/a/ModernShorts$State;->index:I

    if-ltz v1, :cond_98

    iget v1, v3, Le/e/a/ModernShorts$State;->index:I

    iget-object v4, v3, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v4, v4, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v1, v4, :cond_9a

    :cond_98
    iput v5, v3, Le/e/a/ModernShorts$State;->index:I

    .line 429
    :cond_9a
    sget-object v1, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    invoke-static {p0, v3, v5}, Le/e/a/ModernShorts;->install(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    .line 431
    iget-object v1, v3, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v0, :cond_af

    invoke-static {p0, v3, v2, v5}, Le/e/a/ModernShorts;->extend(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V

    .line 432
    :cond_af
    return-void
.end method

.method public static bootstrap(Landroid/app/Activity;)Z
    .registers 6

    .line 275
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 276
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

    .line 277
    :cond_23
    invoke-static {p0}, Le/e/a/ModernShorts;->register(Landroid/content/Context;)V

    .line 278
    new-instance v0, Le/e/a/ModernShorts$State;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le/e/a/ModernShorts$State;-><init>(Le/e/a/ModernShorts$1;)V

    new-instance v2, Le/e/a/ModernShorts$Feed;

    invoke-direct {v2, v1}, Le/e/a/ModernShorts$Feed;-><init>(Le/e/a/ModernShorts$1;)V

    iput-object v2, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    const/4 v1, 0x1

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->home:Z

    sget-object v2, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    invoke-virtual {p0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 280
    invoke-static {p0}, Le/e/a/ModernShorts;->buildHome(Landroid/app/Activity;)Le/e/a/ModernShorts$Home;

    move-result-object v2

    iget-object v3, v2, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v3}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    iget-object v3, v2, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    iput-object v3, v0, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    .line 281
    new-instance v3, Le/e/a/ModernShorts$$ExternalSyntheticLambda21;

    invoke-direct {v3, v0, p0, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda21;-><init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;)V

    iput-object v3, v0, Le/e/a/ModernShorts$State;->redraw:Ljava/lang/Runnable;

    .line 282
    iget-object v3, v2, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda22;

    invoke-direct {v4, p0, v0, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda22;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 283
    iget-object v3, v2, Le/e/a/ModernShorts$Home;->refresh:Landroid/widget/ImageButton;

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda23;

    invoke-direct {v4, v2, p0, v0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda23;-><init>(Le/e/a/ModernShorts$Home;Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 287
    iget-object v3, v2, Le/e/a/ModernShorts$Home;->search:Landroid/widget/Button;

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda24;

    invoke-direct {v4, p0, v0, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda24;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 288
    iget-object v3, v2, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda25;

    invoke-direct {v4, p0, v0, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda25;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 294
    invoke-static {p0, v0, v2, v1}, Le/e/a/ModernShorts;->loadFeed(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V

    .line 295
    return v1

    .line 276
    :cond_7e
    :goto_7e
    const/4 p0, 0x0

    return p0
.end method

.method private static buildHome(Landroid/app/Activity;)Le/e/a/ModernShorts$Home;
    .registers 15

    .line 305
    new-instance v0, Le/e/a/ModernShorts$Home;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le/e/a/ModernShorts$Home;-><init>(Le/e/a/ModernShorts$1;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 306
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

    .line 307
    iget-object v1, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    const v3, 0x1010031

    const v4, -0xefeeea

    invoke-static {p0, v3, v4}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 308
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x10

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 309
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 310
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v7, "\u30b7\u30e7\u30fc\u30c8"

    invoke-static/range {v7 .. v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v7 .. v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x41e00000    # 28.0f

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 311
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v5, v7, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 312
    const v7, 0x1010036

    const/4 v8, -0x1

    invoke-static {p0, v7, v8}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 313
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v9, "\u6c17\u306b\u306a\u308b\u52d5\u753b\u3092\u9078\u3093\u3067\u518d\u751f"

    invoke-static/range {v9 .. v9}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static/range {v9 .. v9}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v9, 0x41600000    # 14.0f

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 314
    const v10, 0x1010038

    const v11, -0x47443b

    invoke-static {p0, v10, v11}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v12

    invoke-virtual {v7, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 315
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, 0x0

    const/4 v12, -0x2

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v5, v7, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 316
    iget-object v4, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 317
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 318
    invoke-static {p0, v6}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v5, 0x8

    invoke-static {p0, v5}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v1, v7, v4, v7, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 319
    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    iget-object v4, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    invoke-virtual {v4, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    const/high16 v4, 0x41800000    # 16.0f

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setTextSize(F)V

    .line 320
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    const-string v4, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u691c\u7d22"

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    const/4 v4, 0x3

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 321
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x34

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v2, v7, v4, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 322
    invoke-static {p0, v5}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iget-object v4, v0, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    invoke-virtual {v1, v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 323
    const-string v2, "\u691c\u7d22"

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

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

    .line 324
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 325
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    const-string v2, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u8aad\u307f\u8fbc\u3093\u3067\u3044\u307e\u3059\u2026"

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 326
    iget-object v1, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    invoke-static {p0, v10, v11}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 327
    iget-object v1, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    invoke-static {p0, v3}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p0, v5}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v1, v7, v2, v7, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 328
    new-instance v1, Landroid/widget/ProgressBar;

    invoke-direct {v1, p0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    invoke-static {p0, v1}, Le/e/a/ModernShorts;->tint(Landroid/content/Context;Landroid/widget/ProgressBar;)V

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v5}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 329
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 330
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x16

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v3, v6, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 331
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x1c

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v3, v8, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 332
    new-instance v1, Landroid/widget/HorizontalScrollView;

    invoke-direct {v1, p0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v7}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 333
    invoke-virtual {v1, v7}, Landroid/widget/HorizontalScrollView;->setClipToPadding(Z)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 334
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v8, v7, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 335
    const-string v1, "\u518d\u8a66\u884c"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Le/e/a/ModernShorts;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, v0, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v1, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    iget-object v2, v0, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 336
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 337
    const-string v2, "niconico"

    const-string v3, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306e\u30db\u30fc\u30e0\u306b\u623b\u308b"

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v2, v3}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v2

    .line 338
    new-instance v3, Le/e/a/ModernShorts$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 339
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_210

    const-string v3, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306b\u623b\u308b"

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setTooltipText(Ljava/lang/CharSequence;)V

    .line 340
    :cond_210
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v4, 0x38

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    const/16 v7, 0x11

    invoke-direct {v3, v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 341
    const-string v2, "refresh"

    const-string v3, "\u30b7\u30e7\u30fc\u30c8\u4e00\u89a7\u3092\u66f4\u65b0"

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v2, v3}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v2

    iput-object v2, v0, Le/e/a/ModernShorts$Home;->refresh:Landroid/widget/ImageButton;

    .line 342
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->refresh:Landroid/widget/ImageButton;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    const v7, 0x800015

    invoke-direct {v3, v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 343
    iget-object v2, v0, Le/e/a/ModernShorts$Home;->root:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-direct {v3, v8, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 344
    return-object v0
.end method

.method private static button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 7

    .line 122
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const p1, 0x7f03005e

    const v1, -0xad335d

    invoke-static {p0, p1, v1}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 123
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 124
    const-string v3, "sans-serif-medium"

    invoke-static {v3, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 125
    const/16 v3, 0x10

    invoke-static {p0, v3}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v3}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v0, v4, v2, v3, v2}, Landroid/widget/Button;->setPadding(IIII)V

    .line 126
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v3, 0x1010031

    const v4, -0xe4e2de

    invoke-static {p0, v3, v4}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 127
    const/16 v3, 0x18

    invoke-static {p0, v3}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    new-instance v3, Landroid/graphics/drawable/RippleDrawable;

    .line 128
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

    .line 127
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 128
    return-object v0
.end method

.method private static cancelRequest(Le/e/a/ModernShorts$State;)V
    .registers 2

    .line 644
    iget-object v0, p0, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    if-eqz v0, :cond_11

    iget-object v0, p0, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    invoke-virtual {v0}, Le/e/a/NetworkTask;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    sget-object v0, Le/e/a/ModernShorts;->REQUESTS:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->purge()V

    .line 645
    :cond_11
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/ModernShorts$State;->busy:Z

    .line 646
    return-void
.end method

.method private static color(Landroid/content/Context;II)I
    .registers 6

    .line 112
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 113
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-nez p1, :cond_11

    return p2

    .line 114
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

    .line 115
    :catch_24
    move-exception p0

    .line 116
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

    .line 648
    sget-object v0, Le/e/a/ModernShorts;->MAIN:Landroid/os/Handler;

    new-instance v7, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;

    move-object v1, v7

    move-object v2, p1

    move-object v3, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Le/e/a/ModernShorts$$ExternalSyntheticLambda7;-><init>(Le/e/a/NetworkTask;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;Ljava/util/ArrayList;Ljava/lang/Exception;)V

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 652
    return-void
.end method

.method private static containsPreferenceKey(Landroid/preference/Preference;Ljava/lang/String;)Z
    .registers 6

    .line 259
    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_c

    return v1

    .line 260
    :cond_c
    instance-of v0, p0, Landroid/preference/PreferenceGroup;

    const/4 v2, 0x0

    if-eqz v0, :cond_28

    .line 261
    check-cast p0, Landroid/preference/PreferenceGroup;

    .line 262
    const/4 v0, 0x0

    :goto_14
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v3

    if-ge v0, v3, :cond_28

    .line 263
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v3

    invoke-static {v3, p1}, Le/e/a/ModernShorts;->containsPreferenceKey(Landroid/preference/Preference;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_25

    return v1

    .line 262
    :cond_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 265
    :cond_28
    return v2
.end method

.method private static cookie()Ljava/lang/String;
    .registers 9

    .line 733
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

    .line 734
    if-nez v2, :cond_16

    return-object v0

    .line 735
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

    .line 736
    :catch_33
    move-exception v1

    return-object v0
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 110
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

    .line 583
    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v0, :cond_26

    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-eqz v0, :cond_9

    goto :goto_26

    .line 584
    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    iget-object v0, p1, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_16

    iget-object v0, p1, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 585
    :cond_16
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda28;

    invoke-direct {v0, p0, p1, p2, p3}, Le/e/a/ModernShorts$$ExternalSyntheticLambda28;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V

    iput-object v0, p1, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    .line 586
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda29;

    invoke-direct {v0, p1, p0, p3}, Le/e/a/ModernShorts$$ExternalSyntheticLambda29;-><init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Z)V

    invoke-static {p1, p2, v0}, Le/e/a/ModernShorts;->request(Le/e/a/ModernShorts$State;Ljava/lang/String;Le/e/a/ModernShorts$Result;)V

    .line 594
    return-void

    .line 583
    :cond_26
    :goto_26
    return-void
.end method

.method private static fillVideo(Landroid/app/Activity;)V
    .registers 7

    .line 550
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CommentVisuals;->fullViewport(Landroid/view/View;)V

    .line 551
    const-string v0, "video_view"

    const-string v1, "commentlay"

    const-string v2, "videoLayout"

    const-string v3, "video"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_17
    const/4 v2, 0x4

    if-ge v1, v2, :cond_3c

    aget-object v2, v0, v1

    .line 552
    invoke-static {p0, v2}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_23

    goto :goto_39

    .line 553
    :cond_23
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 554
    if-eqz v3, :cond_39

    iget v4, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_32

    iget v4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v4, v5, :cond_39

    :cond_32
    iput v5, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v5, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 551
    :cond_39
    :goto_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .line 556
    :cond_3c
    return-void
.end method

.method private static find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 512
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

    .line 178
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "app_lang"

    const-string v1, "0"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 179
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_59

    .line 180
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 181
    const-string v1, "\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_55

    const-string v1, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_55

    const-string v1, "\u305d\u306e\u4ed6"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_58

    :cond_55
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 182
    :cond_58
    goto :goto_1b

    .line 183
    :cond_59
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 184
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x1

    const-string v3, "\u305d\u306e\u4ed6"

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    move-object v1, p0

    invoke-static/range {v1 .. v6}, Le/e/a/ModernShorts;->addMenuRow(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    .line 185
    const/4 v6, 0x4

    const/4 v2, 0x0

    const-string v3, "\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5"

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\u8a2d\u5b9a\u3092\u53cd\u6620\u3057\u3066\u6700\u521d\u304b\u3089\u958b\u304f"

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v1 .. v6}, Le/e/a/ModernShorts;->addMenuRow(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Landroid/content/Intent;I)V

    .line 186
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 187
    const/4 v1, 0x0

    :goto_8f
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_af

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "\u30a2\u30d7\u30ea\u8a2d\u5b9a"

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_ac

    add-int/lit8 v0, v1, 0x1

    goto :goto_af

    :cond_ac
    add-int/lit8 v1, v1, 0x1

    goto :goto_8f

    .line 188
    :cond_af
    :goto_af
    nop

    .line 189
    invoke-virtual {p1, v0, p0}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 190
    return-void
.end method

.method private static hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 9

    .line 192
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_11

    check-cast p0, Ljava/util/Map;

    const-string v0, "title"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 193
    :cond_11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :goto_15
    const/4 v1, 0x0

    if-eqz v0, :cond_42

    .line 194
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    array-length v3, v2

    :goto_1d
    if-ge v1, v3, :cond_3d

    aget-object v4, v2, v1

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Ljava/lang/String;

    if-ne v5, v6, :cond_3a

    .line 195
    const/4 v5, 0x1

    :try_start_2a
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_35} :catch_38

    if-eqz v4, :cond_39

    return v5

    .line 196
    :catch_38
    move-exception v4

    :cond_39
    nop

    .line 194
    :cond_3a
    add-int/lit8 v1, v1, 0x1

    goto :goto_1d

    .line 193
    :cond_3d
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_15

    .line 198
    :cond_42
    return v1
.end method

.method private static icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;
    .registers 7

    .line 131
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

    .line 132
    const p2, 0x7f03005e

    const v1, -0xad335d

    invoke-static {p0, p2, v1}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result p2

    .line 133
    new-instance v1, Le/e/a/ModernShorts$1;

    invoke-direct {v1, p2, p1, p0}, Le/e/a/ModernShorts$1;-><init>(ILjava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 160
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

    .line 161
    return-object v0
.end method

.method private static install(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V
    .registers 19

    .line 434
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v0, p2

    iget-boolean v3, v2, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v3, :cond_273

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-eqz v3, :cond_12

    goto/16 :goto_273

    .line 435
    :cond_12
    const-string v3, "videoLayout"

    invoke-static {v1, v3}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 436
    if-nez v3, :cond_2b

    const/16 v3, 0x28

    if-ge v0, v3, :cond_2a

    sget-object v3, Le/e/a/ModernShorts;->MAIN:Landroid/os/Handler;

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda13;

    invoke-direct {v4, v1, v2, v0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda13;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    const-wide/16 v0, 0x32

    invoke-virtual {v3, v4, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2a
    return-void

    .line 437
    :cond_2b
    iput-object v3, v2, Le/e/a/ModernShorts$State;->video:Landroid/view/View;

    .line 438
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 439
    const/4 v4, -0x1

    if-eqz v0, :cond_3b

    .line 440
    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 441
    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 442
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 444
    :cond_3b
    const-string v0, "video_view"

    invoke-static {v1, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    .line 445
    invoke-static/range {p0 .. p0}, Le/e/a/ModernShorts;->fillVideo(Landroid/app/Activity;)V

    .line 446
    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v5, :cond_75

    .line 447
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

    .line 448
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 449
    if-eqz v0, :cond_70

    .line 450
    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 451
    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 452
    invoke-virtual {v5, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_70} :catch_71

    .line 454
    :cond_70
    goto :goto_75

    :catch_71
    move-exception v0

    invoke-static {v0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 455
    :cond_75
    :goto_75
    if-eqz v5, :cond_9d

    .line 456
    :try_start_77
    const-string v0, "com.devbrackets.android.exomedia.core.video.scale.ScaleType"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 457
    const-string v8, "CENTER_CROP"

    invoke-static {v0, v8}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v8

    .line 458
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

    .line 459
    goto :goto_9d

    :catch_99
    move-exception v0

    invoke-static {v0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 460
    :cond_9d
    :goto_9d
    const-string v0, "info"

    invoke-static {v1, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    const/16 v8, 0x8

    if-eqz v5, :cond_aa

    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    .line 461
    :cond_aa
    const-string v9, "nextbutton"

    const-string v10, "fullscbutton"

    const-string v11, "prevbutton"

    filled-new-array {v11, v9, v10}, [Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    :goto_b5
    const/4 v11, 0x3

    if-ge v10, v11, :cond_c6

    aget-object v11, v9, v10

    invoke-static {v1, v11}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v11

    if-eqz v11, :cond_c3

    invoke-virtual {v11, v8}, Landroid/view/View;->setVisibility(I)V

    :cond_c3
    add-int/lit8 v10, v10, 0x1

    goto :goto_b5

    .line 462
    :cond_c6
    const v9, 0x1020002

    invoke-virtual {v1, v9}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/FrameLayout;

    .line 463
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v11, 0x10

    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 464
    const/16 v11, 0xa

    invoke-static {v1, v11}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v12

    const/4 v13, 0x6

    invoke-static {v1, v13}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-static {v1, v11}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-static {v1, v13}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual {v10, v12, v14, v11, v13}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 465
    new-instance v11, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v11}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v12, 0x1010031

    const v13, -0xe4e2de

    invoke-static {v1, v12, v13}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 466
    const/16 v12, 0x16

    invoke-static {v1, v12}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v12

    int-to-float v12, v12

    invoke-virtual {v11, v12}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 467
    iput-object v10, v2, Le/e/a/ModernShorts$State;->bar:Landroid/view/View;

    .line 468
    const-string v11, "prev"

    const-string v12, "\u524d\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-static/range {v12 .. v12}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static/range {v12 .. v12}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v1, v11, v12}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v11

    new-instance v12, Le/e/a/ModernShorts$$ExternalSyntheticLambda14;

    invoke-direct {v12, v1, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda14;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v11, v12}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 469
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v12, v7, v4, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 470
    new-instance v11, Landroid/widget/FrameLayout;

    invoke-direct {v11, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 471
    new-instance v12, Landroid/widget/TextView;

    invoke-direct {v12, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/16 v14, 0x11

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v14, 0x41600000    # 14.0f

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setTextSize(F)V

    .line 472
    const-string v14, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u4e00\u89a7"

    invoke-static/range {v14 .. v14}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static/range {v14 .. v14}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    const v14, 0x1010036

    invoke-static {v1, v14, v4}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v14

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setTextColor(I)V

    iput-object v12, v2, Le/e/a/ModernShorts$State;->number:Landroid/widget/TextView;

    .line 473
    new-instance v14, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v14, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v12, v14}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v14, v7, v4, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v11, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 474
    new-instance v14, Landroid/widget/ProgressBar;

    invoke-direct {v14, v1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v14}, Le/e/a/ModernShorts;->tint(Landroid/content/Context;Landroid/widget/ProgressBar;)V

    iput-object v14, v2, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    iget-boolean v15, v2, Le/e/a/ModernShorts$State;->busy:Z

    if-eqz v15, :cond_17f

    const/4 v15, 0x0

    goto :goto_181

    :cond_17f
    const/16 v15, 0x8

    :goto_181
    invoke-virtual {v14, v15}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 475
    new-instance v15, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v8, 0x12

    invoke-static {v1, v8}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v1, v8}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v8

    const v4, 0x800035

    invoke-direct {v15, v6, v8, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v11, v14, v15}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 476
    const-string v4, "home"

    const-string v6, "\u30b7\u30e7\u30fc\u30c8\u306e\u30db\u30fc\u30e0"

    invoke-static/range {v6 .. v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static/range {v6 .. v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v4, v6}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v4

    new-instance v6, Le/e/a/ModernShorts$$ExternalSyntheticLambda15;

    invoke-direct {v6, v1}, Le/e/a/ModernShorts$$ExternalSyntheticLambda15;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v4, v6}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 477
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    invoke-direct {v6, v7, v8, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 478
    const-string v4, "\u52d5\u753b\u60c5\u5831"

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v0, v4}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda16;

    invoke-direct {v4, v2, v1}, Le/e/a/ModernShorts$$ExternalSyntheticLambda16;-><init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;)V

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 481
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v7, v8, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 482
    const-string v0, "next"

    const-string v4, "\u6b21\u306e\u30b7\u30e7\u30fc\u30c8"

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v0, v4}, Le/e/a/ModernShorts;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object v0

    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda17;

    invoke-direct {v4, v1, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda17;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 483
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v7, v8, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 484
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda18;

    invoke-direct {v0, v1, v2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda18;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v4, 0x1

    invoke-virtual {v12, v4}, Landroid/widget/TextView;->setClickable(Z)V

    .line 485
    const/16 v0, 0x8

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 487
    const-string v0, "statuslay"

    invoke-static {v1, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_215

    const/4 v4, 0x4

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 488
    :cond_215
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda19;

    invoke-direct {v0, v1, v2, v10}, Le/e/a/ModernShorts$$ExternalSyntheticLambda19;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/widget/LinearLayout;)V

    iput-object v0, v2, Le/e/a/ModernShorts$State;->controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 494
    invoke-virtual {v9}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v4, v2, Le/e/a/ModernShorts$State;->controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v0, v4}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 495
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v4, 0x40

    invoke-static {v1, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v6, 0x50

    const/4 v8, -0x1

    invoke-direct {v0, v8, v4, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 496
    const/16 v4, 0xc

    invoke-static {v1, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v1, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v8, 0x8

    invoke-static {v1, v8}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v0, v6, v7, v4, v8}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v9, v10, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static/range {p1 .. p1}, Le/e/a/ModernShorts;->update(Le/e/a/ModernShorts$State;)V

    .line 497
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda20;

    invoke-direct {v0, v2, v1, v3, v5}, Le/e/a/ModernShorts$$ExternalSyntheticLambda20;-><init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Landroid/view/View;Landroid/view/View;)V

    iput-object v0, v2, Le/e/a/ModernShorts$State;->listener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 509
    invoke-virtual {v9}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v3, v2, Le/e/a/ModernShorts$State;->listener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, v2, Le/e/a/ModernShorts$State;->listener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-interface {v0}, Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;->onGlobalLayout()V

    .line 510
    const-string v0, "\u4e0a\u306b\u30b9\u30ef\u30a4\u30d7\u3067\u6b21\u3001\u4e0b\u306b\u30b9\u30ef\u30a4\u30d7\u3067\u524d\u306e\u52d5\u753b"

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 511
    return-void

    .line 434
    :cond_273
    :goto_273
    return-void
.end method

.method private static interactive(Landroid/view/View;FF)Z
    .registers 8

    .line 634
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return v1

    .line 635
    :cond_8
    const/4 v0, 0x2

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 636
    aget v2, v0, v1

    int-to-float v2, v2

    cmpg-float v2, p1, v2

    if-ltz v2, :cond_72

    const/4 v2, 0x1

    aget v3, v0, v2

    int-to-float v3, v3

    cmpg-float v3, p2, v3

    if-ltz v3, :cond_72

    aget v3, v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v4

    add-int/2addr v3, v4

    int-to-float v3, v3

    cmpl-float v3, p1, v3

    if-gez v3, :cond_72

    aget v0, v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int/2addr v0, v3

    int-to-float v0, v0

    cmpl-float v0, p2, v0

    if-ltz v0, :cond_36

    goto :goto_72

    .line 637
    :cond_36
    instance-of v0, p0, Landroid/widget/Button;

    if-nez v0, :cond_71

    instance-of v0, p0, Landroid/widget/SeekBar;

    if-nez v0, :cond_71

    instance-of v0, p0, Landroid/widget/EditText;

    if-nez v0, :cond_71

    instance-of v0, p0, Landroid/widget/ImageButton;

    if-nez v0, :cond_71

    instance-of v0, p0, Landroid/widget/TextView;

    if-nez v0, :cond_4e

    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_55

    .line 638
    :cond_4e
    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_55

    goto :goto_71

    .line 639
    :cond_55
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_70

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_60
    if-ltz v0, :cond_70

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1, p2}, Le/e/a/ModernShorts;->interactive(Landroid/view/View;FF)Z

    move-result v3

    if-eqz v3, :cond_6d

    return v2

    :cond_6d
    add-int/lit8 v0, v0, -0x1

    goto :goto_60

    .line 640
    :cond_70
    return v1

    .line 638
    :cond_71
    :goto_71
    return v2

    .line 636
    :cond_72
    :goto_72
    return v1
.end method

.method private static isRefreshing(Landroid/view/View;)Z
    .registers 5

    .line 812
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

    .line 813
    :catch_1a
    move-exception p0

    return v0
.end method

.method static synthetic lambda$bootstrap$2(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;)V
    .registers 4

    .line 281
    iget-object v0, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v0, v0, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d

    invoke-static {p1, p0, p2}, Le/e/a/ModernShorts;->renderHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    :cond_d
    return-void
.end method

.method static synthetic lambda$bootstrap$3(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Landroid/view/View;)V
    .registers 4

    .line 282
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->retryHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    return-void
.end method

.method static synthetic lambda$bootstrap$4(Le/e/a/ModernShorts$Home;Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 4

    .line 284
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

    .line 285
    :cond_19
    invoke-static {p1, p2, p0}, Le/e/a/ModernShorts;->search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    .line 286
    :goto_1c
    return-void
.end method

.method static synthetic lambda$bootstrap$5(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Landroid/view/View;)V
    .registers 4

    .line 287
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    return-void
.end method

.method static synthetic lambda$bootstrap$6(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 6

    .line 289
    const/4 p3, 0x3

    if-eq p4, p3, :cond_9

    const/4 p3, 0x2

    if-ne p4, p3, :cond_7

    goto :goto_9

    .line 292
    :cond_7
    const/4 p0, 0x0

    return p0

    .line 290
    :cond_9
    :goto_9
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$buildHome$7(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 338
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method static synthetic lambda$complete$26(Le/e/a/NetworkTask;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;Ljava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 6

    .line 649
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-nez v0, :cond_18

    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_18

    iget-object v0, p1, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    if-eq v0, p0, :cond_f

    goto :goto_18

    .line 650
    :cond_f
    const/4 p0, 0x0

    iput-object p0, p1, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    iput-object p0, p1, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    invoke-interface {p2, p3, p4}, Le/e/a/ModernShorts$Result;->done(Ljava/util/ArrayList;Ljava/lang/Exception;)V

    .line 651
    return-void

    .line 649
    :cond_18
    :goto_18
    return-void
.end method

.method static synthetic lambda$extend$24(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V
    .registers 4

    .line 585
    invoke-static {p0, p1, p2, p3}, Le/e/a/ModernShorts;->extend(Landroid/app/Activity;Le/e/a/ModernShorts$State;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$extend$25(Le/e/a/ModernShorts$State;Landroid/app/Activity;ZLjava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 8

    .line 587
    iget-boolean v0, p0, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_62

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_62

    .line 588
    :cond_b
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/ModernShorts$State;->busy:Z

    iget-object v1, p0, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    if-eqz v1, :cond_19

    iget-object v1, p0, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 589
    :cond_19
    if-eqz p4, :cond_2d

    const-string p0, "\u4e00\u89a7\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u3082\u3046\u4e00\u5ea6\u304a\u8a66\u3057\u304f\u3060\u3055\u3044"

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 590
    :cond_2d
    iget-object p4, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {p1, p4, p3}, Le/e/a/ModernShorts;->append(Landroid/content/Context;Le/e/a/ModernShorts$Feed;Ljava/util/ArrayList;)I

    move-result p3

    invoke-static {p0}, Le/e/a/ModernShorts;->update(Le/e/a/ModernShorts$State;)V

    .line 591
    if-eqz p2, :cond_4e

    iget p2, p0, Le/e/a/ModernShorts$State;->index:I

    add-int/lit8 p2, p2, 0x1

    iget-object p4, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p4, p4, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result p4

    if-ge p2, p4, :cond_4e

    iget p2, p0, Le/e/a/ModernShorts$State;->index:I

    add-int/lit8 p2, p2, 0x1

    invoke-static {p1, p0, p2}, Le/e/a/ModernShorts;->launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    goto :goto_61

    .line 592
    :cond_4e
    if-nez p3, :cond_61

    const-string p0, "\u65b0\u3057\u3044\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 593
    :cond_61
    :goto_61
    return-void

    .line 587
    :cond_62
    :goto_62
    return-void
.end method

.method static synthetic lambda$install$13(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V
    .registers 3

    .line 436
    add-int/lit8 p2, p2, 0x1

    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->install(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    return-void
.end method

.method static synthetic lambda$install$14(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 3

    .line 468
    const/4 p2, -0x1

    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->step(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    return-void
.end method

.method static synthetic lambda$install$15(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 476
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method static synthetic lambda$install$16(Le/e/a/ModernShorts$State;Landroid/app/Activity;Landroid/view/View;)V
    .registers 5

    .line 479
    new-instance p2, Landroid/content/Intent;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://www.nicovideo.jp/watch/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v1, v1, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    iget p0, p0, Le/e/a/ModernShorts$State;->index:I

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/ModernShorts$Item;

    iget-object p0, p0, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 480
    invoke-virtual {p1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-virtual {p2, p0, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 481
    return-void
.end method

.method static synthetic lambda$install$17(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 3

    .line 482
    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->step(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    return-void
.end method

.method static synthetic lambda$install$18(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 3

    .line 484
    invoke-static {p0, p1}, Le/e/a/ModernShorts;->showList(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    return-void
.end method

.method static synthetic lambda$install$19(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/widget/LinearLayout;)Z
    .registers 4

    .line 489
    const-string v0, "controller"

    invoke-static {p0, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    .line 490
    iget-boolean p1, p1, Le/e/a/ModernShorts$State;->controlsTapped:Z

    if-eqz p1, :cond_14

    if-eqz p0, :cond_14

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x0

    goto :goto_16

    :cond_14
    const/16 p0, 0x8

    .line 491
    :goto_16
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result p1

    if-eq p1, p0, :cond_1f

    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 492
    :cond_1f
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$install$20(Le/e/a/ModernShorts$State;Landroid/app/Activity;Landroid/view/View;Landroid/view/View;)V
    .registers 6

    .line 498
    iget-boolean p0, p0, Le/e/a/ModernShorts$State;->dead:Z

    if-eqz p0, :cond_5

    return-void

    .line 499
    :cond_5
    invoke-static {p1}, Le/e/a/ModernShorts;->fillVideo(Landroid/app/Activity;)V

    .line 500
    invoke-static {p1}, Le/e/a/ModernShorts;->liftController(Landroid/app/Activity;)V

    .line 501
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    .line 502
    if-eqz p0, :cond_21

    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1a

    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v0, v1, :cond_21

    .line 503
    :cond_1a
    iput v1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 504
    invoke-virtual {p2, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 506
    :cond_21
    if-eqz p3, :cond_2e

    invoke-virtual {p3}, Landroid/view/View;->getVisibility()I

    move-result p0

    const/16 p2, 0x8

    if-eq p0, p2, :cond_2e

    invoke-virtual {p3, p2}, Landroid/view/View;->setVisibility(I)V

    .line 507
    :cond_2e
    const-string p0, "videopro"

    invoke-static {p1, p0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    instance-of p2, p0, Landroid/widget/ProgressBar;

    if-eqz p2, :cond_3d

    check-cast p0, Landroid/widget/ProgressBar;

    invoke-static {p1, p0}, Le/e/a/ModernShorts;->tint(Landroid/content/Context;Landroid/widget/ProgressBar;)V

    .line 508
    :cond_3d
    return-void
.end method

.method static synthetic lambda$loadFeed$8(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V
    .registers 4

    .line 354
    invoke-static {p0, p1, p2, p3}, Le/e/a/ModernShorts;->loadFeed(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V

    return-void
.end method

.method static synthetic lambda$loadFeed$9(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;ZLjava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 9

    .line 356
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/ModernShorts$State;->busy:Z

    .line 357
    iget-boolean v1, p0, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v1, :cond_58

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_e

    goto :goto_58

    .line 358
    :cond_e
    iget-object v1, p2, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 359
    if-nez p5, :cond_43

    invoke-virtual {p4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p5

    if-eqz p5, :cond_1e

    goto :goto_43

    .line 363
    :cond_1e
    new-instance p5, Le/e/a/ModernShorts$Feed;

    const/4 v1, 0x0

    invoke-direct {p5, v1}, Le/e/a/ModernShorts$Feed;-><init>(Le/e/a/ModernShorts$1;)V

    iput-object p5, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p5, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {p1, p5, p4}, Le/e/a/ModernShorts;->append(Landroid/content/Context;Le/e/a/ModernShorts$Feed;Ljava/util/ArrayList;)I

    iget-object p4, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {p4}, Le/e/a/ModernShorts;->remember(Le/e/a/ModernShorts$Feed;)V

    invoke-static {p1, p0, p2}, Le/e/a/ModernShorts;->renderHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    .line 364
    if-eqz p3, :cond_42

    iget-object p2, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p2, p2, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_42

    invoke-static {p1, p0, v0}, Le/e/a/ModernShorts;->launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    .line 365
    :cond_42
    return-void

    .line 360
    :cond_43
    :goto_43
    iget-object p0, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    const-string p1, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u901a\u4fe1\u72b6\u614b\u3092\u78ba\u8a8d\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 361
    iget-object p0, p2, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setVisibility(I)V

    return-void

    .line 357
    :cond_58
    :goto_58
    return-void
.end method

.method static synthetic lambda$monitorRefresh$29(ILandroid/app/Activity;)V
    .registers 4

    .line 806
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

    .line 807
    :cond_17
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ModernShorts;->watchRefresh(Landroid/view/View;)V

    .line 808
    invoke-static {p1, p0}, Le/e/a/ModernShorts;->monitorRefresh(Landroid/app/Activity;I)V

    .line 809
    return-void

    .line 806
    :cond_26
    :goto_26
    return-void
.end method

.method static synthetic lambda$renderHome$10(Landroid/app/Activity;Le/e/a/ModernShorts$State;ILandroid/view/View;)V
    .registers 4

    .line 392
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    return-void
.end method

.method static synthetic lambda$request$27(Ljava/lang/String;Le/e/a/NetworkTask;Ljava/lang/String;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;)V
    .registers 15

    .line 657
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 659
    const/4 v1, 0x0

    :try_start_6
    const-string v2, "https://nvapi.nicovideo.jp/v1/playlist/recipe-id?recipeId=video_short_watch_recommendation&recipeVersion=1&site=nicovideo"

    .line 660
    if-eqz p0, :cond_33

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&videoId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&currentVideoId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 661
    :cond_33
    new-instance p0, Ljava/net/URL;

    invoke-direct {p0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_3e} :catch_151
    .catchall {:try_start_6 .. :try_end_3e} :catchall_14f

    :try_start_3e
    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v2
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_42} :catch_14c
    .catchall {:try_start_3e .. :try_end_42} :catchall_165

    if-nez v2, :cond_4d

    .line 682
    if-eqz p0, :cond_4c

    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 661
    :cond_4c
    return-void

    :cond_4d
    const/16 v2, 0x1f40

    :try_start_4f
    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 662
    const-string v2, "X-Frontend-Id"

    const-string v3, "6"

    invoke-virtual {p0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "X-Frontend-Version"

    const-string v3, "0"

    invoke-virtual {p0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 663
    const-string v2, "Accept"

    const-string v3, "application/json"

    invoke-virtual {p0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "Origin"

    const-string v3, "https://www.nicovideo.jp"

    invoke-virtual {p0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 664
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7c

    const-string v2, "Cookie"

    invoke-virtual {p0, v2, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 665
    :cond_7c
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 666
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-direct {v3, v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_91
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_91} :catch_14c
    .catchall {:try_start_4f .. :try_end_91} :catchall_165

    .line 667
    :goto_91
    :try_start_91
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_be

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v4
    :try_end_9b
    .catchall {:try_start_91 .. :try_end_9b} :catchall_142

    if-eqz v4, :cond_a9

    .line 668
    :try_start_9d
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_a0
    .catch Ljava/lang/Exception; {:try_start_9d .. :try_end_a0} :catch_14c
    .catchall {:try_start_9d .. :try_end_a0} :catchall_165

    .line 682
    if-eqz p0, :cond_a8

    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 667
    :cond_a8
    return-void

    :cond_a9
    :try_start_a9
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    const v4, 0x1e8480

    if-gt v3, v4, :cond_b6

    goto :goto_91

    :cond_b6
    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v1, "Oversized feed"

    invoke-direct {p2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_be
    .catchall {:try_start_a9 .. :try_end_be} :catchall_142

    .line 668
    :cond_be
    :try_start_be
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 669
    new-instance v2, Lorg/json/JSONObject;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v2, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 670
    const-string p2, "meta"

    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "status"

    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p2

    const/16 v3, 0xc8

    if-ne p2, v3, :cond_13a

    .line 671
    const-string p2, "data"

    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    const-string v2, "items"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    .line 672
    const/4 v2, 0x0

    :goto_e7
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_131

    .line 673
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "watchId"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 674
    invoke-static {v4}, Le/e/a/ShortsRules;->videoId(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_fe

    goto :goto_12e

    .line 675
    :cond_fe
    const-string v5, "content"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 676
    if-nez v5, :cond_108

    move-object v6, v4

    goto :goto_10e

    :cond_108
    const-string v6, "title"

    invoke-virtual {v5, v6, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 677
    :goto_10e
    invoke-static {v5}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    .line 678
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_11c

    invoke-static {v3}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    .line 679
    :cond_11c
    invoke-static {v5}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V

    invoke-static {v3}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V

    .line 680
    new-instance v8, Le/e/a/ModernShorts$Item;

    invoke-static {v3, v5}, Le/e/a/ModernShorts;->thumbnail(Lorg/json/JSONObject;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v8, v4, v6, v3, v7}, Le/e/a/ModernShorts$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_12e
    .catch Ljava/lang/Exception; {:try_start_be .. :try_end_12e} :catch_14c
    .catchall {:try_start_be .. :try_end_12e} :catchall_165

    .line 672
    :goto_12e
    add-int/lit8 v2, v2, 0x1

    goto :goto_e7

    .line 682
    :cond_131
    if-eqz p0, :cond_161

    :goto_133
    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_161

    .line 670
    :cond_13a
    :try_start_13a
    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v1, "Feed unavailable"

    invoke-direct {p2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_142
    .catch Ljava/lang/Exception; {:try_start_13a .. :try_end_142} :catch_14c
    .catchall {:try_start_13a .. :try_end_142} :catchall_165

    .line 666
    :catchall_142
    move-exception p2

    :try_start_143
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_146
    .catchall {:try_start_143 .. :try_end_146} :catchall_147

    goto :goto_14b

    :catchall_147
    move-exception v1

    :try_start_148
    invoke-virtual {p2, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_14b
    throw p2
    :try_end_14c
    .catch Ljava/lang/Exception; {:try_start_148 .. :try_end_14c} :catch_14c
    .catchall {:try_start_148 .. :try_end_14c} :catchall_165

    .line 682
    :catch_14c
    move-exception p2

    move-object v1, p2

    goto :goto_155

    :catchall_14f
    move-exception p0

    goto :goto_168

    :catch_151
    move-exception p0

    move-object v9, v1

    move-object v1, p0

    move-object p0, v9

    :goto_155
    :try_start_155
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p2

    if-nez p2, :cond_15e

    invoke-static {v1}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V
    :try_end_15e
    .catchall {:try_start_155 .. :try_end_15e} :catchall_165

    :cond_15e
    if-eqz p0, :cond_161

    goto :goto_133

    .line 683
    :cond_161
    :goto_161
    invoke-static {p3, p1, p4, v0, v1}, Le/e/a/ModernShorts;->complete(Le/e/a/ModernShorts$State;Le/e/a/NetworkTask;Le/e/a/ModernShorts$Result;Ljava/util/ArrayList;Ljava/lang/Exception;)V

    .line 684
    return-void

    .line 682
    :catchall_165
    move-exception p2

    move-object v1, p0

    move-object p0, p2

    :goto_168
    if-eqz v1, :cond_170

    invoke-virtual {p1, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_170
    throw p0
.end method

.method static synthetic lambda$requestSearch$28(Ljava/lang/String;Le/e/a/NetworkTask;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;)V
    .registers 14

    .line 689
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 691
    const/4 v1, 0x0

    :try_start_6
    const-string v2, "https://nvapi.nicovideo.jp/v2/search/video"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "keyword"

    .line 692
    invoke-virtual {v2, v3, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v2, "selectContentType"

    const-string v3, "short"

    invoke-virtual {p0, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v2, "sortKey"

    const-string v3, "hot"

    .line 693
    invoke-virtual {p0, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v2, "sortOrder"

    const-string v3, "none"

    invoke-virtual {p0, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v2, "pageSize"

    const-string v3, "50"

    .line 694
    invoke-virtual {p0, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v2, "page"

    const-string v3, "1"

    invoke-virtual {p0, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    .line 695
    new-instance v2, Ljava/net/URL;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_51} :catch_15e
    .catchall {:try_start_6 .. :try_end_51} :catchall_15c

    :try_start_51
    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v2
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_55} :catch_15a
    .catchall {:try_start_51 .. :try_end_55} :catchall_172

    if-nez v2, :cond_60

    .line 716
    if-eqz p0, :cond_5f

    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 695
    :cond_5f
    return-void

    .line 696
    :cond_60
    const/16 v2, 0x1f40

    :try_start_62
    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v2, 0x2710

    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 697
    const-string v2, "Accept"

    const-string v3, "application/json"

    invoke-virtual {p0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 698
    const-string v2, "User-Agent"

    const-string v3, "nicoid Re"

    invoke-virtual {p0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 699
    const-string v2, "X-Frontend-Id"

    const-string v3, "6"

    invoke-virtual {p0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "X-Frontend-Version"

    const-string v3, "0"

    invoke-virtual {p0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 700
    const-string v2, "Origin"

    const-string v3, "https://www.nicovideo.jp"

    invoke-virtual {p0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 701
    invoke-static {}, Le/e/a/ModernShorts;->cookie()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_9c

    const-string v3, "Cookie"

    invoke-virtual {p0, v3, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 702
    :cond_9c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 703
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_b1
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_b1} :catch_15a
    .catchall {:try_start_62 .. :try_end_b1} :catchall_172

    .line 704
    :goto_b1
    :try_start_b1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_de

    .line 705
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v5
    :try_end_bb
    .catchall {:try_start_b1 .. :try_end_bb} :catchall_150

    if-eqz v5, :cond_c9

    .line 707
    :try_start_bd
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_c0
    .catch Ljava/lang/Exception; {:try_start_bd .. :try_end_c0} :catch_15a
    .catchall {:try_start_bd .. :try_end_c0} :catchall_172

    .line 716
    if-eqz p0, :cond_c8

    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 705
    :cond_c8
    return-void

    :cond_c9
    :try_start_c9
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    const v5, 0x1e8480

    if-gt v4, v5, :cond_d6

    goto :goto_b1

    :cond_d6
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Oversized search response"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_de
    .catchall {:try_start_c9 .. :try_end_de} :catchall_150

    .line 707
    :cond_de
    :try_start_de
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 708
    new-instance v3, Lorg/json/JSONObject;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 709
    const-string v2, "meta"

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "status"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    const/16 v4, 0xc8

    if-ne v2, v4, :cond_148

    .line 710
    const-string v2, "data"

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "items"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 711
    const/4 v3, 0x0

    :goto_107
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_13f

    .line 712
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "id"

    const-string v6, "watchId"

    const-string v7, ""

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 713
    invoke-static {v5}, Le/e/a/ShortsRules;->videoId(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_126

    goto :goto_13c

    .line 714
    :cond_126
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
    :try_end_13c
    .catch Ljava/lang/Exception; {:try_start_de .. :try_end_13c} :catch_15a
    .catchall {:try_start_de .. :try_end_13c} :catchall_172

    .line 711
    :goto_13c
    add-int/lit8 v3, v3, 0x1

    goto :goto_107

    .line 716
    :cond_13f
    if-eqz p0, :cond_16e

    :goto_141
    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_16e

    .line 709
    :cond_148
    :try_start_148
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Search unavailable"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_150
    .catch Ljava/lang/Exception; {:try_start_148 .. :try_end_150} :catch_15a
    .catchall {:try_start_148 .. :try_end_150} :catchall_172

    .line 703
    :catchall_150
    move-exception v1

    :try_start_151
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_154
    .catchall {:try_start_151 .. :try_end_154} :catchall_155

    goto :goto_159

    :catchall_155
    move-exception v2

    :try_start_156
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_159
    throw v1
    :try_end_15a
    .catch Ljava/lang/Exception; {:try_start_156 .. :try_end_15a} :catch_15a
    .catchall {:try_start_156 .. :try_end_15a} :catchall_172

    .line 716
    :catch_15a
    move-exception v1

    goto :goto_162

    :catchall_15c
    move-exception p2

    goto :goto_174

    :catch_15e
    move-exception p0

    move-object v9, v1

    move-object v1, p0

    move-object p0, v9

    :goto_162
    :try_start_162
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v2

    if-nez v2, :cond_16b

    invoke-static {v1}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V
    :try_end_16b
    .catchall {:try_start_162 .. :try_end_16b} :catchall_172

    :cond_16b
    if-eqz p0, :cond_16e

    goto :goto_141

    .line 717
    :cond_16e
    :goto_16e
    invoke-static {p2, p1, p3, v0, v1}, Le/e/a/ModernShorts;->complete(Le/e/a/ModernShorts$State;Le/e/a/NetworkTask;Le/e/a/ModernShorts$Result;Ljava/util/ArrayList;Ljava/lang/Exception;)V

    .line 718
    return-void

    .line 716
    :catchall_172
    move-exception p2

    move-object v1, p0

    :goto_174
    if-eqz v1, :cond_17c

    invoke-virtual {p1, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_17c
    throw p2
.end method

.method static synthetic lambda$search$11(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 3

    .line 407
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    return-void
.end method

.method static synthetic lambda$search$12(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;Ljava/util/ArrayList;Ljava/lang/Exception;)V
    .registers 8

    .line 409
    iget-boolean v0, p0, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_58

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_58

    .line 410
    :cond_b
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/ModernShorts$State;->busy:Z

    iget-object v1, p2, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 411
    if-nez p4, :cond_34

    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1e

    goto :goto_34

    .line 416
    :cond_1e
    new-instance p4, Le/e/a/ModernShorts$Feed;

    const/4 v0, 0x0

    invoke-direct {p4, v0}, Le/e/a/ModernShorts$Feed;-><init>(Le/e/a/ModernShorts$1;)V

    iput-object p4, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p4, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {p1, p4, p3}, Le/e/a/ModernShorts;->append(Landroid/content/Context;Le/e/a/ModernShorts$Feed;Ljava/util/ArrayList;)I

    iget-object p3, p0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    invoke-static {p3}, Le/e/a/ModernShorts;->remember(Le/e/a/ModernShorts$Feed;)V

    invoke-static {p1, p0, p2}, Le/e/a/ModernShorts;->renderHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    .line 417
    return-void

    .line 412
    :cond_34
    :goto_34
    iget-object p0, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    if-eqz p4, :cond_43

    const-string p1, "\u691c\u7d22\u7d50\u679c\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u901a\u4fe1\u72b6\u614b\u3092\u78ba\u8a8d\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_4d

    :cond_43
    const-string p1, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u30ad\u30fc\u30ef\u30fc\u30c9\u3092\u5909\u3048\u3066\u304a\u8a66\u3057\u304f\u3060\u3055\u3044\u3002"

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_4d
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 413
    if-eqz p4, :cond_57

    iget-object p0, p2, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 414
    :cond_57
    return-void

    .line 409
    :cond_58
    :goto_58
    return-void
.end method

.method static synthetic lambda$settings$0([J[ILandroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 11

    .line 226
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 227
    const/4 p3, 0x0

    aget-wide v2, p0, p3

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1388

    cmp-long v6, v2, v4

    if-lez v6, :cond_11

    aput p3, p1, p3

    .line 228
    :cond_11
    aput-wide v0, p0, p3

    .line 229
    aget p0, p1, p3

    const/4 v0, 0x1

    add-int/2addr p0, v0

    aput p0, p1, p3

    const/16 v1, 0x8

    if-ne p0, v1, :cond_22

    aput p3, p1, p3

    invoke-static {p2}, Le/e/a/BikeRun;->open(Landroid/app/Activity;)V

    .line 230
    :cond_22
    return v0
.end method

.method static synthetic lambda$settings$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 7

    .line 251
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

    .line 252
    goto :goto_21

    :catch_1d
    move-exception p0

    invoke-static {p0}, Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V

    .line 253
    :goto_21
    return p1
.end method

.method static synthetic lambda$showList$21(Landroid/app/AlertDialog;ILe/e/a/ModernShorts$State;Landroid/app/Activity;Landroid/view/View;)V
    .registers 5

    .line 540
    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    iget p0, p2, Le/e/a/ModernShorts$State;->index:I

    if-eq p1, p0, :cond_e

    iget-boolean p0, p2, Le/e/a/ModernShorts$State;->busy:Z

    if-nez p0, :cond_e

    invoke-static {p3, p2, p1}, Le/e/a/ModernShorts;->launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    :cond_e
    return-void
.end method

.method static synthetic lambda$showList$22(Landroid/app/AlertDialog;Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 4

    .line 544
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

.method static synthetic lambda$showList$23(Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 2

    .line 545
    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    return-void
.end method

.method private static launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V
    .registers 6

    .line 574
    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_67

    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->launching:Z

    if-nez v0, :cond_67

    if-ltz p2, :cond_67

    iget-object v0, p1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v0, v0, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p2, v0, :cond_15

    goto :goto_67

    .line 575
    :cond_15
    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/ModernShorts$State;->launching:Z

    iput p2, p1, Le/e/a/ModernShorts$State;->index:I

    .line 576
    iget-boolean v1, p1, Le/e/a/ModernShorts$State;->home:Z

    if-nez v1, :cond_20

    iput-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    .line 577
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

    .line 578
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

    .line 580
    invoke-virtual {p0, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    iget-boolean p1, p1, Le/e/a/ModernShorts$State;->home:Z

    if-nez p1, :cond_62

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_62
    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 581
    return-void

    .line 574
    :cond_67
    :goto_67
    return-void
.end method

.method private static liftController(Landroid/app/Activity;)V
    .registers 7

    .line 558
    const-string v0, "controller"

    invoke-static {p0, v0}, Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_9

    return-void

    .line 559
    :cond_9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 560
    instance-of v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_27

    .line 561
    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 562
    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    const/16 v4, 0x50

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    if-eq v3, v5, :cond_27

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result p0

    iput p0, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 564
    :cond_27
    return-void
.end method

.method private static loadFeed(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V
    .registers 6

    .line 351
    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v0, :cond_39

    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-eqz v0, :cond_9

    goto :goto_39

    .line 352
    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    iget-object v0, p2, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p2, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 353
    iget-object v0, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    const-string v1, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u8aad\u307f\u8fbc\u3093\u3067\u3044\u307e\u3059\u2026"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 354
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;

    invoke-direct {v0, p0, p1, p2, p3}, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V

    iput-object v0, p1, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    .line 355
    new-instance v0, Le/e/a/ModernShorts$$ExternalSyntheticLambda27;

    invoke-direct {v0, p1, p0, p2, p3}, Le/e/a/ModernShorts$$ExternalSyntheticLambda27;-><init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;Z)V

    const/4 p0, 0x0

    invoke-static {p1, p0, v0}, Le/e/a/ModernShorts;->request(Le/e/a/ModernShorts$State;Ljava/lang/String;Le/e/a/ModernShorts$Result;)V

    .line 366
    return-void

    .line 351
    :cond_39
    :goto_39
    return-void
.end method

.method private static loadThumbnail(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V
    .registers 3

    .line 399
    invoke-static {p0, p1, p2}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 400
    return-void
.end method

.method private static log(Ljava/lang/Exception;)V
    .registers 2

    .line 819
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

    .line 805
    sget-object v0, Le/e/a/ModernShorts;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/ModernShorts$$ExternalSyntheticLambda10;

    invoke-direct {v1, p1, p0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda10;-><init>(ILandroid/app/Activity;)V

    const-wide/16 p0, 0x3e8

    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 810
    return-void
.end method

.method private static player(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .registers 5

    .line 164
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://www.nicovideo.jp/watch/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 165
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "intentselect"

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    .line 164
    return-object p0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 109
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static register(Landroid/content/Context;)V
    .registers 4

    .line 739
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_lang"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 740
    sget-boolean v0, Le/e/a/ModernShorts;->registered:Z

    if-eqz v0, :cond_1c

    return-void

    :cond_1c
    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/ModernShorts;->registered:Z

    .line 741
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Landroid/app/Application;

    .line 742
    new-instance v0, Le/e/a/ModernShorts$2;

    invoke-direct {v0}, Le/e/a/ModernShorts$2;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 785
    return-void
.end method

.method private static remember(Le/e/a/ModernShorts$Feed;)V
    .registers 3

    .line 603
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

    .line 268
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_52

    .line 269
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 270
    const-string v1, "\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4e

    const-string v1, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4e

    const-string v1, "\u305d\u306e\u4ed6"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4e

    const-string v1, "\u30b7\u30e7\u30fc\u30c8"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->hasTitle(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_51

    :cond_4e
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 271
    :cond_51
    goto :goto_4

    .line 272
    :cond_52
    return-void
.end method

.method private static renderHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 19

    .line 368
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v2, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v3, v2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v5, v5, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " \u672c\u306e\u52d5\u753b"

    invoke-static/range {v5 .. v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static/range {v5 .. v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 369
    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_35
    iget-object v5, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v5, v5, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_190

    .line 370
    iget-object v5, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v5, v5, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/ModernShorts$Item;

    .line 371
    new-instance v6, Landroid/widget/FrameLayout;

    invoke-direct {v6, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 372
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v8, 0x1010031

    const v9, -0xe4e2de

    invoke-static {v0, v8, v9}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 373
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

    .line 374
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v9, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 375
    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v9, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v8, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 376
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v11, "\u25b6"

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v11, 0x42100000    # 36.0f

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTextSize(F)V

    .line 377
    const/16 v11, 0x11

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setGravity(I)V

    const v11, 0x7f03005e

    const v12, -0xad335d

    invoke-static {v0, v11, v12}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v11

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 378
    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v11, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v9, v11}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 379
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v7, 0x50

    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 380
    const/16 v12, 0xc

    invoke-static {v0, v12}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v13

    const/16 v14, 0x18

    invoke-static {v0, v14}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-static {v0, v12}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-static {v0, v12}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v11, v13, v14, v15, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 381
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    sget-object v13, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/high16 v14, -0x12000000

    const/high16 v15, -0x67000000

    filled-new-array {v14, v15, v3}, [I

    move-result-object v14

    invoke-direct {v7, v13, v14}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 382
    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 383
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v13, v5, Le/e/a/ModernShorts$Item;->title:Ljava/lang/String;

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v13, 0x41800000    # 16.0f

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setTextSize(F)V

    .line 384
    const/4 v13, 0x3

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v13, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 385
    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 386
    new-instance v13, Landroid/widget/TextView;

    invoke-direct {v13, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b  \u2022  "

    invoke-static/range {v15 .. v15}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static/range {v15 .. v15}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget-object v15, v5, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v14, 0x41300000    # 11.0f

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTextSize(F)V

    .line 387
    const v14, 0x1010038

    const v15, -0x47443b

    invoke-static {v0, v14, v15}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 388
    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v15, -0x2

    invoke-direct {v14, v10, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v15, 0x5

    invoke-static {v0, v15}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v15

    iput v15, v14, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 389
    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v11, v13, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 390
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v13, 0x91

    invoke-static {v0, v13}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v13

    const/16 v14, 0x50

    invoke-direct {v7, v10, v13, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v6, v11, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 391
    iget-boolean v7, v5, Le/e/a/ModernShorts$Item;->paid:Z

    invoke-static {v6, v7}, Le/e/a/PaidVideos;->show(Landroid/view/ViewGroup;Z)V

    .line 392
    new-instance v7, Le/e/a/ModernShorts$$ExternalSyntheticLambda2;

    invoke-direct {v7, v0, v1, v4}, Le/e/a/ModernShorts$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    invoke-virtual {v6, v7}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 393
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v10, 0xda

    invoke-static {v0, v10}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v10

    const/16 v11, 0x172

    invoke-static {v0, v11}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v7, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 394
    invoke-static {v0, v12}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v10

    iput v10, v7, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iget-object v10, v2, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 395
    iget-object v5, v5, Le/e/a/ModernShorts$Item;->thumbnail:Ljava/lang/String;

    invoke-static {v5, v8, v9}, Le/e/a/ModernShorts;->loadThumbnail(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 369
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_35

    .line 397
    :cond_190
    return-void
.end method

.method private static request(Le/e/a/ModernShorts$State;Ljava/lang/String;Le/e/a/ModernShorts$Result;)V
    .registers 12

    .line 654
    invoke-static {}, Le/e/a/ModernShorts;->cookie()Ljava/lang/String;

    move-result-object v3

    .line 655
    new-instance v6, Le/e/a/NetworkTask;

    invoke-direct {v6}, Le/e/a/NetworkTask;-><init>()V

    iput-object v6, p0, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    .line 656
    sget-object v7, Le/e/a/ModernShorts;->REQUESTS:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v8, Le/e/a/ModernShorts$$ExternalSyntheticLambda6;

    move-object v0, v8

    move-object v1, p1

    move-object v2, v6

    move-object v4, p0

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Le/e/a/ModernShorts$$ExternalSyntheticLambda6;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;Ljava/lang/String;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;)V

    invoke-virtual {v6, v7, v8}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 685
    return-void
.end method

.method private static requestSearch(Le/e/a/ModernShorts$State;Ljava/lang/String;Le/e/a/ModernShorts$Result;)V
    .registers 6

    .line 687
    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p0, Le/e/a/ModernShorts$State;->request:Le/e/a/NetworkTask;

    .line 688
    sget-object v1, Le/e/a/ModernShorts;->REQUESTS:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v2, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1, v0, p0, p2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Result;)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 719
    return-void
.end method

.method private static retryHome(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 4

    .line 347
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

    .line 348
    :cond_19
    invoke-static {p0, p1, p2}, Le/e/a/ModernShorts;->search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    .line 349
    :goto_1c
    return-void
.end method

.method private static search(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V
    .registers 6

    .line 402
    iget-object v0, p2, Le/e/a/ModernShorts$Home;->query:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 403
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_50

    iget-boolean v1, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-eqz v1, :cond_19

    goto :goto_50

    .line 404
    :cond_19
    invoke-static {p1}, Le/e/a/ModernShorts;->cancelRequest(Le/e/a/ModernShorts$State;)V

    .line 405
    const/4 v1, 0x1

    iput-boolean v1, p1, Le/e/a/ModernShorts$State;->busy:Z

    iget-object v1, p2, Le/e/a/ModernShorts$Home;->progress:Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v1, p2, Le/e/a/ModernShorts$Home;->retry:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 406
    iget-object v1, p2, Le/e/a/ModernShorts$Home;->message:Landroid/widget/TextView;

    const-string v2, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u691c\u7d22\u3057\u3066\u3044\u307e\u3059\u2026"

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p2, Le/e/a/ModernShorts$Home;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 407
    new-instance v1, Le/e/a/ModernShorts$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda8;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;)V

    iput-object v1, p1, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    .line 408
    new-instance v1, Le/e/a/ModernShorts$$ExternalSyntheticLambda9;

    invoke-direct {v1, p1, p0, p2}, Le/e/a/ModernShorts$$ExternalSyntheticLambda9;-><init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Le/e/a/ModernShorts$Home;)V

    invoke-static {p1, v0, v1}, Le/e/a/ModernShorts;->requestSearch(Le/e/a/ModernShorts$State;Ljava/lang/String;Le/e/a/ModernShorts$Result;)V

    .line 418
    return-void

    .line 403
    :cond_50
    :goto_50
    return-void
.end method

.method private static setRefreshing(Landroid/view/View;Z)V
    .registers 8

    .line 816
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

    .line 817
    :catch_1e
    move-exception p0

    :goto_1f
    nop

    .line 818
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 11

    .line 208
    invoke-static {p0}, Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "0"

    const-string v2, "app_lang"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V

    .line 209
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_1e

    return-void

    .line 210
    :cond_1e


    .line 211
    const-string v1, "player"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceGroup;

    if-nez v1, :cond_2c

    move-object v1, v0

    .line 212
    :cond_2c
    const-string v3, "show_shorts_menu"

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    const/4 v5, 0x1

    if-nez v4, :cond_61

    .line 213
    new-instance v4, Landroid/preference/CheckBoxPreference;

    invoke-direct {v4, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 214
    const-string v3, "\u30b5\u30a4\u30c9\u30d0\u30fc\u306b\u30b7\u30e7\u30fc\u30c8\u3092\u8868\u793a"

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v3, "\u30e9\u30f3\u30ad\u30f3\u30b0\u306e\u4e0b\u306b\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u306e\u5165\u53e3\u3092\u8868\u793a\u3057\u307e\u3059"

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 215
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-virtual {v1, v4}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 217
    :cond_61
    const-string v1, "nicoid_patch_version"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 218
    const/4 v3, 0x0

    if-eqz v1, :cond_87

    .line 219
    const-string v4, "v1.7.1-dev.3 @chikuwadon"

    invoke-virtual {v1, v4}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 222
    invoke-virtual {v1, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 223
    invoke-virtual {v1, v5}, Landroid/preference/Preference;->setSelectable(Z)V

    .line 224
    filled-new-array {v3}, [I

    move-result-object v4

    new-array v6, v5, [J

    const-wide/16 v7, 0x0

    aput-wide v7, v6, v3

    .line 225
    new-instance v7, Le/e/a/ModernShorts$$ExternalSyntheticLambda11;

    invoke-direct {v7, v6, v4, p0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda11;-><init>([J[ILandroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v7}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 233
    :cond_87
    const-string v1, "nicoid_share_debug"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    if-nez v4, :cond_130

    .line 234
    new-instance v4, Landroid/preference/PreferenceCategory;

    invoke-direct {v4, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    const-string v6, "nicoid_debug_category"

    invoke-virtual {v4, v6}, Landroid/preference/PreferenceCategory;->setKey(Ljava/lang/String;)V

    const-string v6, "\u30c7\u30d0\u30c3\u30b0"

    invoke-static/range {v6 .. v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static/range {v6 .. v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    .line 235
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v6

    .line 236
    const/4 v7, 0x0

    :goto_ab
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v8

    if-ge v7, v8, :cond_ca

    .line 237
    invoke-virtual {v0, v7}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v8

    .line 238
    invoke-static {v8, v2}, Le/e/a/ModernShorts;->containsPreferenceKey(Landroid/preference/Preference;Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_c7

    const-string v9, "player_lang"

    invoke-static {v8, v9}, Le/e/a/ModernShorts;->containsPreferenceKey(Landroid/preference/Preference;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c4

    goto :goto_c7

    .line 236
    :cond_c4
    add-int/lit8 v7, v7, 0x1

    goto :goto_ab

    .line 239
    :cond_c7
    :goto_c7
    add-int/lit8 v6, v7, 0x1

    .line 240
    nop

    .line 244
    :cond_ca
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 245
    const/4 v7, 0x0

    :goto_d0
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v8

    if-ge v7, v8, :cond_e0

    invoke-virtual {v0, v7}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_d0

    .line 246
    :cond_e0
    nop

    :goto_e1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v3, v7, :cond_fa

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/preference/Preference;

    mul-int/lit8 v8, v3, 0x2

    if-ge v3, v6, :cond_f2

    goto :goto_f4

    :cond_f2
    add-int/lit8 v8, v8, 0x2

    :goto_f4
    invoke-virtual {v7, v8}, Landroid/preference/Preference;->setOrder(I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_e1

    .line 247
    :cond_fa
    mul-int/lit8 v6, v6, 0x2

    sub-int/2addr v6, v5

    invoke-virtual {v4, v6}, Landroid/preference/PreferenceCategory;->setOrder(I)V

    invoke-virtual {v0, v4}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 248
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v1, "\u30c7\u30d0\u30c3\u30b0\u30ed\u30b0\u3092\u5171\u6709"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 249
    const-string v1, "\u518d\u751f\u30a8\u30e9\u30fc\u3084\u901a\u4fe1\u5148\u3001\u5fdc\u7b54\u30b3\u30fc\u30c9\u306a\u3069\u306e\u8a3a\u65ad\u30ed\u30b0\u3092\u5171\u6709\u3057\u307e\u3059\u3002\u4e0d\u5177\u5408\u306e\u5831\u544a\u6642\u306b\u5229\u7528\u3067\u304d\u307e\u3059\u3002\u5171\u6709\u524d\u306b\u30ed\u30b0\u306e\u5185\u5bb9\u3068\u9001\u4fe1\u5148\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 250
    new-instance v1, Le/e/a/ModernShorts$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda12;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 254
    invoke-virtual {v4, v2}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 256
    :cond_130
    invoke-static {v0}, Le/e/a/UiText;->preferences(Landroid/preference/Preference;)V

    .line 257
    return-void
.end method

.method private static showList(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V
    .registers 18

    .line 515
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 516
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

    .line 517
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/16 v7, 0x18

    invoke-static {v0, v7}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v5, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 518
    const v7, 0x1010031

    const v8, -0xe4e2de

    invoke-static {v0, v7, v8}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v9

    invoke-virtual {v5, v9}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 519
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v9, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b"

    invoke-static/range {v9 .. v9}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static/range {v9 .. v9}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v9, 0x41b00000    # 22.0f

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 520
    const v9, 0x1010036

    const/4 v10, -0x1

    invoke-static {v0, v9, v10}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v11

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 521
    new-instance v5, Landroid/widget/ScrollView;

    invoke-direct {v5, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 522
    invoke-virtual {v5, v11}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v12, 0x190

    invoke-static {v0, v12}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v3, v10, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 523
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    .line 524
    const/4 v12, 0x0

    :goto_94
    iget-object v13, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v13, v13, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v12, v13, :cond_1bd

    .line 525
    iget-object v13, v1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v13, v13, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Le/e/a/ModernShorts$Item;

    .line 526
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

    .line 527
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-static {v0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 528
    invoke-static {v0, v7, v8}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 529
    iget v6, v1, Le/e/a/ModernShorts$State;->index:I

    const v9, -0xad335d

    const v10, 0x7f03005e

    if-ne v12, v6, :cond_ef

    const/4 v6, 0x2

    invoke-static {v0, v6}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v0, v10, v9}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v4

    invoke-virtual {v5, v6, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 530
    :cond_ef
    invoke-virtual {v14, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 531
    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v6, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 532
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v7, -0x1

    invoke-direct {v6, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 533
    const-string v7, "\u25b6"

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v7, 0x11

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setGravity(I)V

    invoke-static {v0, v10, v9}, Le/e/a/ModernShorts;->color(Landroid/content/Context;II)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 534
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

    .line 535
    iget-boolean v7, v13, Le/e/a/ModernShorts$Item;->paid:Z

    invoke-static {v4, v7}, Le/e/a/PaidVideos;->show(Landroid/view/ViewGroup;Z)V

    .line 536
    iget-object v4, v13, Le/e/a/ModernShorts$Item;->thumbnail:Ljava/lang/String;

    invoke-static {v4, v5, v6}, Le/e/a/ModernShorts;->loadThumbnail(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 537
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v6, v12, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

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

    .line 538
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    const/16 v5, 0xc

    invoke-static {v0, v5}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v9, 0x0

    invoke-virtual {v4, v7, v9, v9, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 539
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

    .line 540
    new-instance v4, Le/e/a/ModernShorts$$ExternalSyntheticLambda3;

    invoke-direct {v4, v3, v12, v1, v0}, Le/e/a/ModernShorts$$ExternalSyntheticLambda3;-><init>(Landroid/app/AlertDialog;ILe/e/a/ModernShorts$State;Landroid/app/Activity;)V

    invoke-virtual {v14, v4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 541
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x1

    invoke-direct {v4, v9, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {v0, v15}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v11, v14, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 524
    move v12, v6

    const/16 v4, 0x10

    const/16 v6, 0xc

    const v7, 0x1010031

    const v9, 0x1010036

    const/4 v10, -0x1

    goto/16 :goto_94

    .line 543
    :cond_1bd
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v5, 0x800005

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 544
    const-string v5, "\u66f4\u65b0"

    invoke-static/range {v5 .. v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static/range {v5 .. v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Le/e/a/ModernShorts;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    new-instance v6, Le/e/a/ModernShorts$$ExternalSyntheticLambda4;

    invoke-direct {v6, v3, v0, v1}, Le/e/a/ModernShorts$$ExternalSyntheticLambda4;-><init>(Landroid/app/AlertDialog;Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 545
    const-string v1, "\u9589\u3058\u308b"

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/ModernShorts;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Le/e/a/ModernShorts$$ExternalSyntheticLambda5;

    invoke-direct {v1, v3}, Le/e/a/ModernShorts$$ExternalSyntheticLambda5;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 546
    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 547
    invoke-virtual {v3}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_213

    invoke-virtual {v3}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 548
    :cond_213
    return-void
.end method

.method private static step(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V
    .registers 4

    .line 567
    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v0, :cond_48

    iget-boolean v0, p1, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v0, :cond_48

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_f

    goto :goto_48

    .line 568
    :cond_f
    iget v0, p1, Le/e/a/ModernShorts$State;->index:I

    add-int/2addr v0, p2

    .line 569
    if-gez v0, :cond_27

    const-string p1, "\u6700\u521d\u306e\u52d5\u753b\u3067\u3059"

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 570
    :cond_27
    iget-object p2, p1, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p2, p2, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lt v0, p2, :cond_44

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

    .line 571
    :cond_44
    invoke-static {p0, p1, v0}, Le/e/a/ModernShorts;->launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    .line 572
    return-void

    .line 567
    :cond_48
    :goto_48
    return-void
.end method

.method private static thumbnail(Lorg/json/JSONObject;Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 13

    .line 721
    const/4 v0, 0x2

    new-array v1, v0, [Lorg/json/JSONObject;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p0, v1, p1

    const/4 p0, 0x0

    :goto_a
    const-string p1, ""

    if-ge p0, v0, :cond_4f

    aget-object v3, v1, p0

    .line 722
    if-nez v3, :cond_13

    goto :goto_4c

    .line 723
    :cond_13
    const-string v4, "thumbnail"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 724
    const-string v5, "https://"

    if-eqz v4, :cond_3f

    const-string v6, "url"

    const-string v7, "listingUrl"

    const-string v8, "shortUrl"

    const-string v9, "largeUrl"

    const-string v10, "middleUrl"

    filled-new-array {v8, v9, v10, v6, v7}, [Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    :goto_2c
    const/4 v8, 0x5

    if-ge v7, v8, :cond_3f

    aget-object v8, v6, v7

    .line 725
    invoke-virtual {v4, v8, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3c

    return-object v8

    .line 724
    :cond_3c
    add-int/lit8 v7, v7, 0x1

    goto :goto_2c

    .line 727
    :cond_3f
    const-string v4, "thumbnailUrl"

    invoke-virtual {v3, v4, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4c

    return-object p1

    .line 721
    :cond_4c
    :goto_4c
    add-int/lit8 p0, p0, 0x1

    goto :goto_a

    .line 729
    :cond_4f
    return-object p1
.end method

.method private static tint(Landroid/content/Context;Landroid/widget/ProgressBar;)V
    .registers 4

    .line 119
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

    .line 120
    return-void
.end method

.method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 12

    .line 607
    sget-object v0, Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernShorts$State;

    const/4 v1, 0x0

    if-eqz v0, :cond_12f

    iget-object v2, v0, Le/e/a/ModernShorts$State;->video:Landroid/view/View;

    if-eqz v2, :cond_12f

    iget-boolean v2, v0, Le/e/a/ModernShorts$State;->dead:Z

    if-eqz v2, :cond_15

    goto/16 :goto_12f

    .line 608
    :cond_15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 609
    const/4 v3, 0x1

    if-nez v2, :cond_74

    .line 610
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

    .line 611
    iget-boolean v2, v0, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v2, :cond_71

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    iget v4, v0, Le/e/a/ModernShorts$State;->x:F

    iget v5, v0, Le/e/a/ModernShorts$State;->y:F

    invoke-static {v2, v4, v5}, Le/e/a/ModernShorts;->interactive(Landroid/view/View;FF)Z

    move-result v2

    if-nez v2, :cond_71

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    const/16 v4, 0x18

    invoke-static {p0, v4}, Le/e/a/ModernShorts;->dp(Landroid/content/Context;I)I

    move-result v5

    int-to-float v5, v5

    cmpg-float v2, v2, v5

    if-ltz v2, :cond_71

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

    if-lez p0, :cond_70

    goto :goto_71

    :cond_70
    const/4 v3, 0x0

    :cond_71
    :goto_71
    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->blocked:Z

    .line 612
    return v1

    .line 614
    :cond_74
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    if-gt v4, v3, :cond_12c

    const/4 v4, 0x5

    if-ne v2, v4, :cond_7f

    goto/16 :goto_12c

    .line 615
    :cond_7f
    const/4 v4, 0x3

    if-ne v2, v4, :cond_8d

    .line 616
    iget-boolean p0, v0, Le/e/a/ModernShorts$State;->dragging:Z

    .line 617
    iget-boolean p1, v0, Le/e/a/ModernShorts$State;->cancelling:Z

    if-nez p1, :cond_8c

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->dragging:Z

    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->blocked:Z

    .line 618
    :cond_8c
    return p0

    .line 620
    :cond_8d
    if-ne v2, v3, :cond_c3

    iget-boolean v5, v0, Le/e/a/ModernShorts$State;->dragging:Z

    if-nez v5, :cond_c3

    iget-boolean v5, v0, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v5, :cond_c3

    .line 621
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

    if-gez v5, :cond_c3

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

    if-gez v5, :cond_c3

    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->controlsTapped:Z

    .line 622
    :cond_c3
    iget-boolean v5, v0, Le/e/a/ModernShorts$State;->blocked:Z

    if-nez v5, :cond_12b

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v5

    iget-wide v7, v0, Le/e/a/ModernShorts$State;->downTime:J

    cmp-long v9, v5, v7

    if-eqz v9, :cond_d2

    goto :goto_12b

    .line 623
    :cond_d2
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

    .line 624
    const/4 v6, 0x2

    if-ne v2, v6, :cond_11a

    if-eqz v5, :cond_11a

    iget-boolean v6, v0, Le/e/a/ModernShorts$State;->dragging:Z

    if-nez v6, :cond_11a

    .line 625
    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->dragging:Z

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->setAction(I)V

    .line 626
    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->cancelling:Z

    .line 627
    :try_start_102
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_10d
    .catchall {:try_start_102 .. :try_end_10d} :catchall_113

    .line 628
    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->cancelling:Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_11a

    :catchall_113
    move-exception p0

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->cancelling:Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    throw p0

    .line 630
    :cond_11a
    :goto_11a
    if-ne v2, v3, :cond_128

    iget-boolean p1, v0, Le/e/a/ModernShorts$State;->dragging:Z

    if-eqz p1, :cond_128

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->dragging:Z

    if-eqz v5, :cond_127

    invoke-static {p0, v0, v5}, Le/e/a/ModernShorts;->step(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    :cond_127
    return v3

    .line 631
    :cond_128
    iget-boolean p0, v0, Le/e/a/ModernShorts$State;->dragging:Z

    return p0

    .line 622
    :cond_12b
    :goto_12b
    return v1

    .line 614
    :cond_12c
    :goto_12c
    iput-boolean v3, v0, Le/e/a/ModernShorts$State;->blocked:Z

    return v1

    .line 607
    :cond_12f
    :goto_12f
    return v1
.end method

.method private static update(Le/e/a/ModernShorts$State;)V
    .registers 4

    .line 513
    iget-object v0, p0, Le/e/a/ModernShorts$State;->number:Landroid/widget/TextView;

    if-eqz v0, :cond_2c

    iget-object v0, p0, Le/e/a/ModernShorts$State;->number:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Le/e/a/ModernShorts$State;->index:I

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

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

    .line 787
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "androidx.swiperefreshlayout.widget.SwipeRefreshLayout"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5e

    .line 788
    invoke-static {p0}, Le/e/a/ModernShorts;->isRefreshing(Landroid/view/View;)Z

    move-result v0

    .line 789
    sget-object v2, Le/e/a/ModernShorts;->REFRESH_WATCH:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 790
    if-nez v0, :cond_25

    sget-object v0, Le/e/a/ModernShorts;->REFRESH_WATCH:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 791
    :cond_25
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .line 792
    if-nez v2, :cond_35

    sget-object v0, Le/e/a/ModernShorts;->REFRESH_WATCH:Ljava/util/WeakHashMap;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5d

    .line 793
    :cond_35
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x2710

    cmp-long v0, v3, v5

    if-ltz v0, :cond_5d

    .line 794
    invoke-static {p0, v1}, Le/e/a/ModernShorts;->setRefreshing(Landroid/view/View;Z)V

    sget-object v0, Le/e/a/ModernShorts;->REFRESH_WATCH:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 795
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "\u66f4\u65b0\u304c\u5b8c\u4e86\u3057\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u3082\u3046\u4e00\u5ea6\u304a\u8a66\u3057\u304f\u3060\u3055\u3044\u3002"

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 797
    :cond_5d
    :goto_5d
    return-void

    .line 799
    :cond_5e
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_75

    .line 800
    check-cast p0, Landroid/view/ViewGroup;

    .line 801
    nop

    :goto_65
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_75

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ModernShorts;->watchRefresh(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_65

    .line 803
    :cond_75
    return-void
.end method
