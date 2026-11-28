.class public final Le/e/a/Dev132;
.super Ljava/lang/Object;
.source "Dev132.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Dev132$TabAdapter;,
        Le/e/a/Dev132$Glyph;
    }
.end annotation


# static fields
.field private static final ADD_KEY:Ljava/lang/String; = "nicoid_tab_add_button"

.field private static final ADD_VALUE:Ljava/lang/String; = "add"

.field public static final BUTTONS_KEY:Ljava/lang/String; = "nicoid_tab_bar_buttons"

.field private static final LIST_KEY:Ljava/lang/String; = "nicoid_tab_list_button"

.field private static final LIST_VALUE:Ljava/lang/String; = "list"

.field private static opened:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/AlertDialog;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$b7QXdrFx3VNewFc9Rs5s-aQw_dM()V
    .registers 0

    invoke-static {}, Le/e/a/Dev132;->refreshBars()V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 2

    .line 47
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/Dev132;->opened:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static accent(Landroid/content/Context;)I
    .registers 7
    .param p0, "c"    # Landroid/content/Context;

    .line 169
    :try_start_0
    const-string v0, "e.e.a.UiDialogs"

    const-string v1, "accent"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    invoke-static {v0, v1, v3, v2}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 170
    :catch_0
    move-exception v0

    .local v0, "err":Ljava/lang/Exception;
    const v1, -0xe97267

    return v1
.end method

.method static synthetic access$000(Landroid/content/Context;)I
    .registers 2
    .param p0, "x0"    # Landroid/content/Context;

    .line 41
    invoke-static {p0}, Le/e/a/Dev132;->accent(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Landroid/content/Context;)I
    .registers 2
    .param p0, "x0"    # Landroid/content/Context;

    .line 41
    invoke-static {p0}, Le/e/a/Dev132;->secondary(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Landroid/content/Context;)I
    .registers 2
    .param p0, "x0"    # Landroid/content/Context;

    .line 41
    invoke-static {p0}, Le/e/a/Dev132;->foreground(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .line 41
    invoke-static {p0, p1, p2, p3}, Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p0, "x0"    # Landroid/app/Activity;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Ljava/lang/Object;

    .line 41
    invoke-static {p0, p1, p2}, Le/e/a/Dev132;->close(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 41
    invoke-static {}, Le/e/a/Dev132;->model()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Ljava/lang/Object;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 41
    invoke-static {p0}, Le/e/a/Dev132;->tabs(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400()Z
    .registers 1

    .line 41
    invoke-static {}, Le/e/a/Dev132;->canRestoreSafe()Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Landroid/app/Activity;Landroid/widget/ListView;I)V
    .registers 3
    .param p0, "x0"    # Landroid/app/Activity;
    .param p1, "x1"    # Landroid/widget/ListView;
    .param p2, "x2"    # I

    .line 41
    invoke-static {p0, p1, p2}, Le/e/a/Dev132;->fitList(Landroid/app/Activity;Landroid/widget/ListView;I)V

    return-void
.end method

.method static synthetic access$600(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Ljava/lang/Object;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 41
    invoke-static {p0, p1}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Landroid/content/Context;F)I
    .registers 3
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # F

    .line 41
    invoke-static {p0, p1}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v0

    return v0
.end method

.method static synthetic access$800(Landroid/content/Context;)I
    .registers 2
    .param p0, "x0"    # Landroid/content/Context;

    .line 41
    invoke-static {p0}, Le/e/a/Dev132;->background(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method static synthetic access$900(Ljava/lang/Object;)I
    .registers 2
    .param p0, "x0"    # Ljava/lang/Object;

    .line 41
    invoke-static {p0}, Le/e/a/Dev132;->glyph(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public static actionName(Landroid/content/Context;)Ljava/lang/String;
    .registers 4
    .param p0, "c"    # Landroid/content/Context;

    .line 60
    const-string v0, "Show tab list"

    const-string/jumbo v1, "\u986f\u793a\u5206\u9801\u6e05\u55ae"

    const-string v2, "\u30bf\u30d6\u4e00\u89a7\u3092\u8868\u793a"

    invoke-static {p0, v2, v0, v1}, Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static addActionName(Landroid/content/Context;)Ljava/lang/String;
    .registers 4
    .param p0, "c"    # Landroid/content/Context;

    .line 63
    const-string v0, "Add tab"

    const-string/jumbo v1, "\u65b0\u589e\u5206\u9801"

    const-string v2, "\u30bf\u30d6\u3092\u8ffd\u52a0"

    invoke-static {p0, v2, v0, v1}, Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static addRankingLabel(Landroid/app/Activity;[Ljava/lang/String;)[Ljava/lang/String;
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "existing"    # [Ljava/lang/String;

    .line 341
    if-eqz p1, :cond_1

    array-length v0, p1

    if-nez v0, :cond_0

    goto :goto_0

    .line 342
    :cond_0
    array-length v0, p1

    const/4 v1, 0x1

    add-int/2addr v0, v1

    new-array v0, v0, [Ljava/lang/String;

    .line 343
    .local v0, "result":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v3, p1, v2

    aput-object v3, v0, v2

    .line 344
    const-string v2, "Ranking"

    const-string/jumbo v3, "\u6392\u884c\u699c"

    const-string v4, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    invoke-static {p0, v4, v2, v3}, Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 345
    array-length v2, p1

    sub-int/2addr v2, v1

    const/4 v3, 0x2

    invoke-static {p1, v1, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 346
    return-object v0

    .line 341
    .end local v0    # "result":[Ljava/lang/String;
    :cond_1
    :goto_0
    return-object p1
.end method

.method public static addRankingTab(Ljava/lang/Object;)V
    .registers 4
    .param p0, "host"    # Ljava/lang/Object;

    .line 350
    if-nez p0, :cond_0

    return-void

    .line 352
    :cond_0
    :try_start_0
    const-string v0, "a"

    invoke-static {p0, v0}, Le/e/a/Dev132;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 353
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 354
    :cond_1
    const-string v1, "menu_ranking"

    invoke-static {v0, v1}, Le/e/a/Dev138;->perform(Landroid/app/Activity;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 357
    nop

    .end local v0    # "activity":Landroid/app/Activity;
    goto :goto_1

    .line 353
    .restart local v0    # "activity":Landroid/app/Activity;
    :cond_2
    :goto_0
    return-void

    .line 355
    .end local v0    # "activity":Landroid/app/Activity;
    :catch_0
    move-exception v0

    .line 356
    .local v0, "error":Ljava/lang/Exception;
    const-string v1, "nicoid-tabs"

    const-string v2, "Unable to open ranking chooser"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 358
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private static background(Landroid/content/Context;)I
    .registers 2

    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/LiveSettings;->tabColor(Landroid/content/Context;Z)I

    move-result v0

    return v0
.end method

.method private static buttons(Landroid/content/Context;)Ljava/util/Set;
    .registers 8
    .param p0, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 476
    invoke-static {p0}, Le/e/a/Dev132;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 477
    .local v0, "shared":Landroid/content/SharedPreferences;
    new-instance v1, Ljava/util/HashSet;

    const-string v2, "list"

    const-string v3, "add"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 478
    .local v1, "all":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v4, "nicoid_tab_bar_buttons"

    invoke-interface {v0, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 479
    :try_start_0
    new-instance v2, Ljava/util/HashSet;

    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 480
    :catch_0
    move-exception v2

    .local v2, "bad":Ljava/lang/ClassCastException;
    return-object v1

    .line 483
    .end local v2    # "bad":Ljava/lang/ClassCastException;
    :cond_0
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 484
    .local v4, "selected":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v5, "nicoid_tab_list_button"

    const/4 v6, 0x1

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 485
    :cond_1
    const-string v2, "nicoid_tab_add_button"

    invoke-interface {v0, v2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 486
    :cond_2
    return-object v4
.end method

.method private static buttonsSummary(Landroid/content/Context;)Ljava/lang/String;
    .registers 4
    .param p0, "c"    # Landroid/content/Context;

    .line 489
    const-string v0, "The left button opens tab management, and + on the right adds a tab. Choose which buttons to display."

    const-string v1, "\u5de6\u5074\u6309\u9215\u958b\u555f\u5206\u9801\u7ba1\u7406\uff0c\u53f3\u5074\uff0b\u6309\u9215\u65b0\u589e\u5206\u9801\uff0c\u53ef\u9078\u64c7\u986f\u793a\u7684\u6309\u9215"

    const-string v2, "\u5de6\u7aef\u306e\u4e00\u89a7\u30dc\u30bf\u30f3\u3067\u30bf\u30d6\u306e\u5207\u66ff\u30fb\u7ba1\u7406\u3001\u53f3\u7aef\u306e\uff0b\u30dc\u30bf\u30f3\u3067\u30bf\u30d6\u3092\u8ffd\u52a0\u3057\u307e\u3059\u3002\u8868\u793a\u3059\u308b\u30dc\u30bf\u30f3\u3092\u9078\u629e\u3067\u304d\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static varargs call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
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

    .line 76
    .local p2, "signature":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 77
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 78
    invoke-virtual {v0, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private static canRestore(Ljava/lang/Object;)Z
    .registers 6
    .param p0, "model"    # Ljava/lang/Object;

    .line 110
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "e.e.a.GestureControls110"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 111
    .local v1, "gesture":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "closed"

    invoke-static {v1, v2}, Le/e/a/Dev132;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 112
    .local v2, "tab":Ljava/lang/Object;
    if-eqz v2, :cond_0

    invoke-static {p0}, Le/e/a/Dev132;->tabs(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/16 v4, 0x40

    if-ge v3, v4, :cond_0

    const-string v3, "id"

    .line 113
    invoke-static {v2, v3}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Le/e/a/Dev132;->find(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v3, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 112
    :goto_0
    return v0

    .line 114
    .end local v1    # "gesture":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "tab":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .local v1, "ignored":Ljava/lang/Exception;
    return v0
.end method

.method private static canRestoreSafe()Z
    .registers 2

    .line 447
    :try_start_0
    invoke-static {}, Le/e/a/Dev132;->model()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Dev132;->canRestore(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/Exception;
    const/4 v1, 0x0

    return v1
.end method

.method private static close(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 8
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "host"    # Ljava/lang/Object;
    .param p2, "tab"    # Ljava/lang/Object;

    .line 149
    :try_start_0
    const-string v0, "close"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    invoke-static {}, Le/e/a/Dev132;->tabType()Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p2, v1, v4

    invoke-static {p1, v0, v2, v1}, Le/e/a/Dev132;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "err":Ljava/lang/Exception;
    const-string v1, "nicoid-tab-list"

    const-string v2, "Tab close failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 151
    .end local v0    # "err":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public static decorateBar(Ljava/lang/Object;Landroid/widget/LinearLayout;)V
    .registers 14
    .param p0, "host"    # Ljava/lang/Object;
    .param p1, "bar"    # Landroid/widget/LinearLayout;

    .line 530
    if-eqz p0, :cond_6

    if-nez p1, :cond_0

    goto/16 :goto_2

    .line 532
    :cond_0
    :try_start_0
    const-string v0, "a"

    invoke-static {p0, v0}, Le/e/a/Dev132;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 533
    .local v0, "activity":Landroid/app/Activity;
    if-nez v0, :cond_1

    return-void

    .line 534
    :cond_1
    invoke-static {v0}, Le/e/a/Dev132;->buttons(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v1

    .line 535
    .local v1, "shown":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 536
    .local v2, "plus":Landroid/view/View;
    const/16 v4, 0x8

    const-string v5, "nicoid-tab-list-trigger"

    const/4 v6, 0x0

    if-eqz v2, :cond_3

    :try_start_1
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 537
    const-string v7, "add"

    invoke-interface {v1, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    const/4 v7, 0x0

    goto :goto_0

    :cond_2
    const/16 v7, 0x8

    :goto_0
    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 538
    :cond_3
    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    .line 539
    .local v7, "holder":Landroid/view/View;
    if-nez v7, :cond_4

    .line 540
    new-instance v8, Landroid/widget/FrameLayout;

    invoke-direct {v8, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 541
    .local v8, "button":Landroid/widget/FrameLayout;
    invoke-virtual {v8, v5}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    .line 542
    invoke-static {v0}, Le/e/a/Dev132;->actionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 543
    new-instance v5, Le/e/a/Dev132$Glyph;

    invoke-direct {v5, v0, v6, v3}, Le/e/a/Dev132$Glyph;-><init>(Landroid/content/Context;IZ)V

    .line 544
    .local v5, "icon":Le/e/a/Dev132$Glyph;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v9, 0x41a80000    # 21.0f

    invoke-static {v0, v9}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v10

    invoke-static {v0, v9}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v9

    const/16 v11, 0x11

    invoke-direct {v3, v10, v9, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 545
    .local v3, "iconSize":Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual {v8, v5, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 546
    new-instance v9, Le/e/a/Dev132$8;

    invoke-direct {v9, v0}, Le/e/a/Dev132$8;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v8, v9}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 547
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x42200000    # 40.0f

    invoke-static {v0, v10}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v10

    const/4 v11, -0x1

    invoke-direct {v9, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v8, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 548
    move-object v7, v8

    .line 550
    .end local v3    # "iconSize":Landroid/widget/FrameLayout$LayoutParams;
    .end local v5    # "icon":Le/e/a/Dev132$Glyph;
    .end local v8    # "button":Landroid/widget/FrameLayout;
    :cond_4
    const-string v3, "list"

    invoke-interface {v1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    const/4 v4, 0x0

    :cond_5
    invoke-virtual {v7, v4}, Landroid/view/View;->setVisibility(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 551
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "shown":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v2    # "plus":Landroid/view/View;
    .end local v7    # "holder":Landroid/view/View;
    goto :goto_1

    :catch_0
    move-exception v0

    .local v0, "err":Ljava/lang/Exception;
    const-string v1, "nicoid-tab-list"

    const-string v2, "Tab bar controls failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 552
    .end local v0    # "err":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 530
    :cond_6
    :goto_2
    return-void
.end method

.method private static dp(Landroid/content/Context;F)I
    .registers 3
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "value"    # F

    .line 51
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float v0, v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private static dragReorder(Landroid/widget/ListView;Le/e/a/Dev132$TabAdapter;Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 14
    .param p0, "list"    # Landroid/widget/ListView;
    .param p1, "adapter"    # Le/e/a/Dev132$TabAdapter;
    .param p2, "activity"    # Landroid/app/Activity;
    .param p3, "host"    # Ljava/lang/Object;

    .line 304
    new-instance v0, Le/e/a/Dev132$4;

    invoke-direct {v0, p1}, Le/e/a/Dev132$4;-><init>(Le/e/a/Dev132$TabAdapter;)V

    invoke-virtual {p0, v0}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 311
    const/4 v0, 0x1

    new-array v0, v0, [J

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    aput-wide v1, v0, v3

    move-object v5, v0

    .line 312
    .local v5, "lastScroll":[J
    new-instance v4, Le/e/a/Dev132$5;

    move-object v7, p0

    move-object v8, p1

    move-object v6, p2

    move-object v9, p3

    .end local p0    # "list":Landroid/widget/ListView;
    .end local p1    # "adapter":Le/e/a/Dev132$TabAdapter;
    .end local p2    # "activity":Landroid/app/Activity;
    .end local p3    # "host":Ljava/lang/Object;
    .local v6, "activity":Landroid/app/Activity;
    .local v7, "list":Landroid/widget/ListView;
    .local v8, "adapter":Le/e/a/Dev132$TabAdapter;
    .local v9, "host":Ljava/lang/Object;
    invoke-direct/range {v4 .. v9}, Le/e/a/Dev132$5;-><init>([JLandroid/app/Activity;Landroid/widget/ListView;Le/e/a/Dev132$TabAdapter;Ljava/lang/Object;)V

    invoke-static {v7, v4}, Le/e/a/ReorderMotion98;->install(Landroid/view/View;Landroid/view/View$OnDragListener;)V

    .line 338
    return-void
.end method

.method private static field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
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

    .line 66
    .local p0, "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v0, p0

    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-eqz v0, :cond_0

    .line 67
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .local v1, "value":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 68
    .end local v1    # "value":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v1

    .line 66
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 70
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    new-instance v0, Ljava/lang/NoSuchFieldException;

    invoke-direct {v0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static find(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 6
    .param p0, "model"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 106
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const-string v2, "find"

    invoke-static {p0, v2, v1, v0}, Le/e/a/Dev132;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static fitList(Landroid/app/Activity;Landroid/widget/ListView;I)V
    .registers 8
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "list"    # Landroid/widget/ListView;
    .param p2, "count"    # I

    .line 437
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/widget/ListView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 438
    :cond_0
    const/high16 v0, 0x42500000    # 52.0f

    invoke-static {p0, v0}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v1

    const/4 v2, 0x1

    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result v2

    mul-int v1, v1, v2

    const/high16 v2, 0x42ec0000    # 118.0f

    invoke-static {p0, v2}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v3

    add-int/2addr v1, v3

    .line 439
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v3, v3

    const v4, 0x3f451eb8    # 0.77f

    mul-float v3, v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 438
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 440
    .local v1, "height":I
    invoke-static {p0, v0}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-static {p0, v2}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v2

    sub-int v2, v1, v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 441
    .local v0, "target":I
    invoke-virtual {p1}, Landroid/widget/ListView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v2, v0, :cond_1

    .line 442
    invoke-virtual {p1}, Landroid/widget/ListView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 443
    invoke-virtual {p1}, Landroid/widget/ListView;->requestLayout()V

    .line 445
    :cond_1
    return-void

    .line 437
    .end local v0    # "target":I
    .end local v1    # "height":I
    :cond_2
    :goto_0
    return-void
.end method

.method private static foreground(Landroid/content/Context;)I
    .registers 2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/LiveSettings;->tabColor(Landroid/content/Context;Z)I

    move-result v0

    return v0
.end method

.method private static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "receiver"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 73
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/Dev132;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static glyph(Ljava/lang/Object;)I
    .registers 9
    .param p0, "tab"    # Ljava/lang/Object;

    .line 231
    :try_start_0
    const-string v0, "screen"

    invoke-static {p0, v0}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, "screen":Ljava/lang/String;
    const-string v1, "url"

    invoke-static {p0, v1}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 232
    .local v1, "url":Ljava/lang/String;
    const-string v2, "kind"

    invoke-static {p0, v2}, Le/e/a/Dev132;->integer(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v2

    .local v2, "kind":I
    const-string v3, "type"

    invoke-static {p0, v3}, Le/e/a/Dev132;->integer(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v3

    .line 233
    .local v3, "type":I
    const-string v4, "playlist"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    const-string v4, "mylist"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_1

    .line 234
    :cond_0
    const-string v4, "mypage"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x6

    if-eqz v4, :cond_1

    return v5

    .line 235
    :cond_1
    const-string v4, "following"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v4, 0x7

    return v4

    .line 236
    :cond_2
    const-string v4, "cache"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/16 v6, 0x8

    if-eqz v4, :cond_3

    return v6

    .line 237
    :cond_3
    const-string v4, "nicorepo"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/16 v4, 0xa

    return v4

    .line 238
    :cond_4
    const/16 v4, 0x9

    if-eq v3, v4, :cond_9

    const-string v7, "deflist"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    goto :goto_0

    .line 239
    :cond_5
    const/4 v4, 0x4

    if-ne v3, v4, :cond_6

    return v4

    .line 240
    :cond_6
    if-ne v3, v6, :cond_7

    const/4 v4, 0x3

    return v4

    .line 241
    :cond_7
    if-nez v2, :cond_8

    const/4 v4, 0x1

    return v4

    .line 242
    :cond_8
    if-ne v3, v5, :cond_b

    const-string v4, "/ranking/"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v4, :cond_b

    const/4 v4, 0x2

    return v4

    .line 238
    :cond_9
    :goto_0
    return v4

    .line 233
    :cond_a
    :goto_1
    const/4 v4, 0x5

    return v4

    .line 243
    .end local v0    # "screen":Ljava/lang/String;
    .end local v1    # "url":Ljava/lang/String;
    .end local v2    # "kind":I
    .end local v3    # "type":I
    :catch_0
    move-exception v0

    :cond_b
    nop

    .line 244
    const/4 v0, 0x0

    return v0
.end method

.method public static installSettings(Landroid/preference/PreferenceActivity;)V
    .registers 12
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 495
    if-nez p0, :cond_0

    return-void

    .line 496
    :cond_0
    const-string v0, "multiple_video_tabs"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 497
    .local v0, "tabs":Landroid/preference/Preference;
    if-nez v0, :cond_1

    return-void

    .line 498
    :cond_1
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-static {v1, v0}, Le/e/a/Dev132;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    .line 499
    .local v1, "group":Landroid/preference/PreferenceGroup;
    if-nez v1, :cond_2

    return-void

    .line 500
    :cond_2
    const-string v2, "nicoid_tab_bar_buttons"

    invoke-virtual {p0, v2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    if-eqz v3, :cond_3

    return-void

    .line 501
    :cond_3
    invoke-static {p0}, Le/e/a/Dev132;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 502
    .local v3, "shared":Landroid/content/SharedPreferences;
    invoke-static {p0}, Le/e/a/Dev132;->buttons(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v4

    .line 503
    .local v4, "previous":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v3, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 504
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 505
    :cond_4
    const-string v5, "nicoid_tab_list_button"

    const-string v6, "nicoid_tab_add_button"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_0
    const/4 v8, 0x2

    if-ge v7, v8, :cond_6

    aget-object v8, v5, v7

    .line 506
    .local v8, "legacy":Ljava/lang/String;
    invoke-virtual {p0, v8}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v9

    .line 507
    .local v9, "obsolete":Landroid/preference/Preference;
    if-eqz v9, :cond_5

    .line 508
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v10

    invoke-static {v10, v9}, Le/e/a/Dev132;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v10

    .line 509
    .local v10, "owner":Landroid/preference/PreferenceGroup;
    if-eqz v10, :cond_5

    invoke-virtual {v10, v9}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 505
    .end local v8    # "legacy":Ljava/lang/String;
    .end local v9    # "obsolete":Landroid/preference/Preference;
    .end local v10    # "owner":Landroid/preference/PreferenceGroup;
    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 512
    :cond_6
    new-instance v5, Landroid/preference/MultiSelectListPreference;

    invoke-direct {v5, p0}, Landroid/preference/MultiSelectListPreference;-><init>(Landroid/content/Context;)V

    .line 513
    .local v5, "option":Landroid/preference/MultiSelectListPreference;
    invoke-virtual {v5, v2}, Landroid/preference/MultiSelectListPreference;->setKey(Ljava/lang/String;)V

    .line 514
    const-string v2, "Tab bar buttons"

    const-string v7, "\u5206\u9801\u5217\u6309\u9215\u986f\u793a"

    const-string v9, "\u30bf\u30d6\u30d0\u30fc\u306e\u30dc\u30bf\u30f3\u8868\u793a"

    invoke-static {p0, v9, v2, v7}, Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/preference/MultiSelectListPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 515
    new-array v2, v8, [Ljava/lang/CharSequence;

    .line 516
    const-string v7, "\u30bf\u30d6\u4e00\u89a7\u30dc\u30bf\u30f3\u3092\u8868\u793a"

    const-string v9, "Show tab list button"

    const-string/jumbo v10, "\u986f\u793a\u5206\u9801\u6e05\u55ae\u6309\u9215"

    invoke-static {p0, v7, v9, v10}, Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v6

    .line 517
    const-string v7, "\u30bf\u30d6\u8ffd\u52a0\u30dc\u30bf\u30f3\u3092\u8868\u793a"

    const-string v9, "Show add tab button"

    const-string/jumbo v10, "\u986f\u793a\u65b0\u589e\u5206\u9801\u6309\u9215"

    invoke-static {p0, v7, v9, v10}, Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x1

    aput-object v7, v2, v9

    .line 515
    invoke-virtual {v5, v2}, Landroid/preference/MultiSelectListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 518
    new-array v2, v8, [Ljava/lang/CharSequence;

    const-string v7, "list"

    aput-object v7, v2, v6

    const-string v6, "add"

    aput-object v6, v2, v9

    invoke-virtual {v5, v2}, Landroid/preference/MultiSelectListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 519
    new-instance v2, Ljava/util/HashSet;

    filled-new-array {v7, v6}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v5, v2}, Landroid/preference/MultiSelectListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 520
    invoke-static {p0}, Le/e/a/Dev132;->buttonsSummary(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/preference/MultiSelectListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 521
    new-instance v2, Le/e/a/Dev132$7;

    invoke-direct {v2, p0}, Le/e/a/Dev132$7;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v5, v2}, Landroid/preference/MultiSelectListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 527
    invoke-virtual {v1, v5}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 528
    return-void
.end method

.method private static integer(Ljava/lang/Object;Ljava/lang/String;)I
    .registers 4
    .param p0, "tab"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 103
    invoke-static {p0, p1}, Le/e/a/Dev132;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .local v0, "value":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/Number;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method static synthetic lambda$decorateBar$7(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "v"    # Landroid/view/View;

    .line 546
    invoke-static {p0}, Le/e/a/Dev132;->show(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$dragReorder$0(Le/e/a/Dev132$TabAdapter;Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 10
    .param p0, "adapter"    # Le/e/a/Dev132$TabAdapter;
    .param p1, "parent"    # Landroid/widget/AdapterView;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .line 306
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p3}, Le/e/a/Dev132$TabAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "id"

    invoke-static {v1, v2}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 307
    .local v1, "tabId":Ljava/lang/String;
    const-string v2, "nicoid-tab"

    invoke-static {v2, v1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v2

    invoke-static {p2}, Le/e/a/ReorderMotion98;->shadow(Landroid/view/View;)Landroid/view/View$DragShadowBuilder;

    move-result-object v3

    invoke-virtual {p2, v2, v3, v1, v0}, Landroid/view/View;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 309
    .end local v1    # "tabId":Ljava/lang/String;
    :catch_0
    move-exception v1

    .local v1, "err":Ljava/lang/Exception;
    return v0
.end method

.method static synthetic lambda$dragReorder$1([JLandroid/app/Activity;Landroid/widget/ListView;Le/e/a/Dev132$TabAdapter;Ljava/lang/Object;Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 17
    .param p0, "lastScroll"    # [J
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "list"    # Landroid/widget/ListView;
    .param p3, "adapter"    # Le/e/a/Dev132$TabAdapter;
    .param p4, "host"    # Ljava/lang/Object;
    .param p5, "target"    # Landroid/view/View;
    .param p6, "event"    # Landroid/view/DragEvent;

    .line 313
    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getAction()I

    move-result v0

    .line 314
    .local v0, "action":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/String;

    return v1

    .line 315
    :cond_0
    const/4 v2, 0x2

    const/4 v3, 0x0

    if-ne v0, v2, :cond_3

    .line 316
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    .line 317
    .local v4, "now":J
    aget-wide v6, p0, v3

    sub-long v6, v4, v6

    const-wide/16 v8, 0x5a

    cmp-long v2, v6, v8

    if-lez v2, :cond_2

    .line 318
    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getY()F

    move-result v2

    .line 319
    .local v2, "y":F
    const/high16 v6, 0x42300000    # 44.0f

    invoke-static {p1, v6}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v7

    int-to-float v7, v7

    const/16 v8, 0x6e

    const/high16 v9, 0x42340000    # 45.0f

    cmpg-float v7, v2, v7

    if-gez v7, :cond_1

    invoke-static {p1, v9}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v6

    neg-int v6, v6

    invoke-virtual {p2, v6, v8}, Landroid/widget/ListView;->smoothScrollBy(II)V

    aput-wide v4, p0, v3

    goto :goto_0

    .line 320
    :cond_1
    invoke-virtual {p2}, Landroid/widget/ListView;->getHeight()I

    move-result v7

    invoke-static {p1, v6}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v6

    sub-int/2addr v7, v6

    int-to-float v6, v7

    cmpl-float v6, v2, v6

    if-lez v6, :cond_2

    invoke-static {p1, v9}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-virtual {p2, v6, v8}, Landroid/widget/ListView;->smoothScrollBy(II)V

    aput-wide v4, p0, v3

    .line 322
    .end local v2    # "y":F
    :cond_2
    :goto_0
    return v1

    .line 324
    .end local v4    # "now":J
    :cond_3
    const/4 v2, 0x3

    if-ne v0, v2, :cond_7

    .line 325
    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 326
    .local v2, "source":Ljava/lang/String;
    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getX()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getY()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-virtual {p2, v4, v5}, Landroid/widget/ListView;->pointToPosition(II)I

    move-result v4

    .line 327
    .local v4, "destination":I
    const/4 v5, -0x1

    if-ne v4, v5, :cond_5

    .line 328
    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getY()F

    move-result v5

    const/4 v6, 0x0

    cmpg-float v5, v5, v6

    if-gez v5, :cond_4

    goto :goto_1

    :cond_4
    invoke-virtual {p3}, Le/e/a/Dev132$TabAdapter;->getCount()I

    move-result v3

    sub-int/2addr v3, v1

    :goto_1
    move v4, v3

    .line 330
    :cond_5
    if-eqz v2, :cond_6

    if-ltz v4, :cond_6

    .line 331
    invoke-static {p1, p4, v2, v4}, Le/e/a/Dev132;->move(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;I)V

    .line 332
    invoke-virtual {p3}, Le/e/a/Dev132$TabAdapter;->reload()V

    .line 334
    :cond_6
    return v1

    .line 336
    .end local v2    # "source":Ljava/lang/String;
    .end local v4    # "destination":I
    :cond_7
    return v1
.end method

.method static synthetic lambda$installSettings$6(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 5
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "value"    # Ljava/lang/Object;

    .line 522
    instance-of v0, p2, Ljava/util/Set;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 523
    :cond_0
    invoke-static {p0}, Le/e/a/Dev132;->buttonsSummary(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 524
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Le/e/a/Dev132$6;

    invoke-direct {v1}, Le/e/a/Dev132$6;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 525
    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$show$2(Le/e/a/Dev132$TabAdapter;Landroid/app/AlertDialog;Ljava/lang/Object;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 15
    .param p0, "adapter"    # Le/e/a/Dev132$TabAdapter;
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "host"    # Ljava/lang/Object;
    .param p3, "parent"    # Landroid/widget/AdapterView;
    .param p4, "view"    # Landroid/view/View;
    .param p5, "index"    # I
    .param p6, "id"    # J

    .line 412
    :try_start_0
    invoke-virtual {p0, p5}, Le/e/a/Dev132$TabAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    .line 413
    .local v0, "tab":Ljava/lang/Object;
    const-string v1, "id"

    invoke-static {v0, v1}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 414
    .local v1, "tabId":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 415
    const-string v2, "select"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v1, v3, v6

    invoke-static {p2, v2, v4, v3}, Le/e/a/Dev132;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 416
    nop

    .end local v0    # "tab":Ljava/lang/Object;
    .end local v1    # "tabId":Ljava/lang/String;
    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "err":Ljava/lang/Exception;
    const-string v1, "nicoid-tab-list"

    const-string v2, "Tab switch failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 417
    .end local v0    # "err":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static synthetic lambda$show$3(Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 2
    .param p0, "dialog"    # Landroid/app/AlertDialog;
    .param p1, "v"    # Landroid/view/View;

    .line 419
    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$show$4(Landroid/app/Activity;Ljava/lang/Object;Le/e/a/Dev132$TabAdapter;Landroid/view/View;)V
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "host"    # Ljava/lang/Object;
    .param p2, "adapter"    # Le/e/a/Dev132$TabAdapter;
    .param p3, "v"    # Landroid/view/View;

    .line 422
    invoke-static {}, Le/e/a/Dev132;->canRestoreSafe()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1, p2}, Le/e/a/Dev132;->restore(Landroid/app/Activity;Ljava/lang/Object;Le/e/a/Dev132$TabAdapter;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$show$5(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .registers 3
    .param p0, "dialog"    # Landroid/app/AlertDialog;
    .param p1, "v"    # Landroid/content/DialogInterface;

    .line 423
    sget-object v0, Le/e/a/Dev132;->opened:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    sget-object v0, Le/e/a/Dev132;->opened:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_0
    return-void
.end method

.method private static model()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 83
    invoke-static {}, Le/e/a/Dev132;->multi()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-string v3, "data"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 84
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 85
    const/4 v2, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private static move(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;I)V
    .registers 11
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "host"    # Ljava/lang/Object;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "to"    # I

    .line 154
    :try_start_0
    invoke-static {}, Le/e/a/Dev132;->model()Ljava/lang/Object;

    move-result-object v0

    .line 155
    .local v0, "model":Ljava/lang/Object;
    invoke-static {v0}, Le/e/a/Dev132;->tabs(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    .line 156
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/4 v2, -0x1

    .line 157
    .local v2, "from":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    const-string v5, "id"

    invoke-static {v4, v5}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v2, v3

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 158
    .end local v3    # "i":I
    :cond_1
    :goto_1
    if-ltz v2, :cond_3

    if-ltz p3, :cond_3

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge p3, v3, :cond_3

    if-ne v2, p3, :cond_2

    goto :goto_2

    .line 159
    :cond_2
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v3

    .line 160
    .local v3, "moving":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {p3, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {v1, v4, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 161
    invoke-static {}, Le/e/a/Dev132;->save()V

    .line 162
    const-string v4, "bar"

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Class;

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p1, v4, v6, v5}, Le/e/a/Dev132;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    nop

    .end local v0    # "model":Ljava/lang/Object;
    .end local v1    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v2    # "from":I
    .end local v3    # "moving":Ljava/lang/Object;
    goto :goto_3

    .line 158
    .restart local v0    # "model":Ljava/lang/Object;
    .restart local v1    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v2    # "from":I
    :cond_3
    :goto_2
    return-void

    .line 163
    .end local v0    # "model":Ljava/lang/Object;
    .end local v1    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v2    # "from":I
    :catch_0
    move-exception v0

    .local v0, "err":Ljava/lang/Exception;
    const-string v1, "nicoid-tab-list"

    const-string v2, "Reorder failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 164
    .end local v0    # "err":Ljava/lang/Exception;
    :goto_3
    return-void
.end method

.method private static multi()Ljava/lang/Class;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 80
    const-string v0, "e.e.a.MultiTabs227"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method private static parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 5
    .param p0, "root"    # Landroid/preference/PreferenceGroup;
    .param p1, "target"    # Landroid/preference/Preference;

    .line 468
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 469
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    .line 470
    .local v1, "p":Landroid/preference/Preference;
    if-ne v1, p1, :cond_0

    return-object p0

    .line 471
    :cond_0
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1

    move-object v2, v1

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/Dev132;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    .local v2, "found":Landroid/preference/PreferenceGroup;
    if-eqz v2, :cond_1

    return-object v2

    .line 468
    .end local v1    # "p":Landroid/preference/Preference;
    .end local v2    # "found":Landroid/preference/PreferenceGroup;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 473
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 2
    .param p0, "c"    # Landroid/content/Context;

    .line 54
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private static refreshBars()V
    .registers 5

    .line 460
    :try_start_0
    invoke-static {}, Le/e/a/Dev132;->multi()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "HOSTS"

    invoke-static {v0, v1}, Le/e/a/Dev132;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 461
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<**>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 462
    .local v2, "host":Ljava/lang/Object;
    const-string v3, "bar"

    invoke-static {v2, v3}, Le/e/a/Dev132;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 463
    .local v3, "view":Landroid/view/View;
    instance-of v4, v3, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_0

    move-object v4, v3

    check-cast v4, Landroid/widget/LinearLayout;

    invoke-static {v2, v4}, Le/e/a/Dev132;->decorateBar(Ljava/lang/Object;Landroid/widget/LinearLayout;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 464
    .end local v2    # "host":Ljava/lang/Object;
    .end local v3    # "view":Landroid/view/View;
    :cond_0
    goto :goto_0

    .line 461
    .end local v0    # "map":Ljava/util/Map;, "Ljava/util/Map<**>;"
    :cond_1
    goto :goto_1

    .line 465
    :catch_0
    move-exception v0

    :goto_1
    nop

    .line 466
    return-void
.end method

.method public static rememberClosed(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p0, "host"    # Ljava/lang/Object;
    .param p1, "tab"    # Ljava/lang/Object;

    .line 137
    if-nez p1, :cond_0

    return-void

    .line 139
    :cond_0
    :try_start_0
    invoke-static {}, Le/e/a/Dev132;->model()Ljava/lang/Object;

    move-result-object v0

    .line 140
    .local v0, "model":Ljava/lang/Object;
    invoke-static {v0}, Le/e/a/Dev132;->tabs(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 141
    .local v1, "index":I
    if-gez v1, :cond_1

    return-void

    .line 142
    :cond_1
    const-string v2, "e.e.a.GestureControls110"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 143
    .local v2, "gesture":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "closed"

    invoke-static {v2, v3}, Le/e/a/Dev132;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 144
    const-string v3, "closedAt"

    invoke-static {v2, v3}, Le/e/a/Dev132;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v4, v1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .end local v0    # "model":Ljava/lang/Object;
    .end local v1    # "index":I
    .end local v2    # "gesture":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "err":Ljava/lang/Exception;
    const-string v1, "nicoid-tab-list"

    const-string v2, "Unable to remember tab"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 146
    .end local v0    # "err":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private static restore(Landroid/app/Activity;Ljava/lang/Object;Le/e/a/Dev132$TabAdapter;)V
    .registers 13
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "host"    # Ljava/lang/Object;
    .param p2, "adapter"    # Le/e/a/Dev132$TabAdapter;

    .line 118
    :try_start_0
    invoke-static {}, Le/e/a/Dev132;->model()Ljava/lang/Object;

    move-result-object v0

    .line 119
    .local v0, "model":Ljava/lang/Object;
    const-string v1, "e.e.a.GestureControls110"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 120
    .local v1, "gesture":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "closed"

    invoke-static {v1, v2}, Le/e/a/Dev132;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 121
    .local v2, "tab":Ljava/lang/Object;
    invoke-static {v0}, Le/e/a/Dev132;->canRestore(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    if-nez v2, :cond_0

    goto :goto_0

    .line 122
    :cond_0
    const-string v4, "closedAt"

    invoke-static {v1, v4}, Le/e/a/Dev132;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v3

    .line 123
    .local v3, "previous":I
    invoke-static {v0}, Le/e/a/Dev132;->tabs(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    .line 124
    .local v4, "wasEmpty":Z
    invoke-static {v0}, Le/e/a/Dev132;->tabs(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-static {v0}, Le/e/a/Dev132;->tabs(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-static {v3, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    const/4 v7, 0x0

    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-virtual {v5, v6, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 125
    invoke-static {}, Le/e/a/Dev132;->save()V

    .line 128
    if-eqz v4, :cond_1

    const-string v5, "select"

    const/4 v6, 0x1

    new-array v8, v6, [Ljava/lang/Class;

    const-class v9, Ljava/lang/String;

    aput-object v9, v8, v7

    const-string v9, "id"

    invoke-static {v2, v9}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v9, v6, v7

    invoke-static {p1, v5, v8, v6}, Le/e/a/Dev132;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    :cond_1
    const-string v5, "bar"

    new-array v6, v7, [Ljava/lang/Class;

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {p1, v5, v6, v7}, Le/e/a/Dev132;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    invoke-virtual {p2}, Le/e/a/Dev132$TabAdapter;->reload()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    .end local v0    # "model":Ljava/lang/Object;
    .end local v1    # "gesture":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "tab":Ljava/lang/Object;
    .end local v3    # "previous":I
    .end local v4    # "wasEmpty":Z
    goto :goto_1

    .line 121
    .restart local v0    # "model":Ljava/lang/Object;
    .restart local v1    # "gesture":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "tab":Ljava/lang/Object;
    :cond_2
    :goto_0
    return-void

    .line 131
    .end local v0    # "model":Ljava/lang/Object;
    .end local v1    # "gesture":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "tab":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 132
    .local v0, "err":Ljava/lang/Exception;
    const-string v1, "nicoid-tab-list"

    const-string v2, "Tab restore failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 134
    .end local v0    # "err":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method public static sameRanking(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 12
    .param p0, "first"    # Ljava/lang/Object;
    .param p1, "second"    # Ljava/lang/Object;

    .line 451
    const-string v0, "url"

    const-string v1, "screen"

    const-string v2, "type"

    const/4 v3, 0x0

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 453
    :cond_0
    nop

    .line 454
    :try_start_0
    invoke-static {p0, v2}, Le/e/a/Dev132;->integer(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v4

    invoke-static {p0, v1}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v0}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 455
    invoke-static {p1, v2}, Le/e/a/Dev132;->integer(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v7

    invoke-static {p1, v1}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {p1, v0}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 453
    invoke-static/range {v4 .. v9}, Le/e/a/RankingTabIdentity133;->same(ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 456
    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/Exception;
    return v3

    .line 451
    .end local v0    # "ignored":Ljava/lang/Exception;
    :cond_1
    :goto_0
    return v3
.end method

.method private static save()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 96
    invoke-static {}, Le/e/a/Dev132;->multi()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-string v3, "save"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .local v0, "save":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    const/4 v2, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    return-void
.end method

.method private static secondary(Landroid/content/Context;)I
    .registers 3
    .param p0, "c"    # Landroid/content/Context;

    .line 166
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v0, v0, 0x30

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    const v0, -0x58524b

    goto :goto_0

    :cond_0
    const v0, -0x9d958e

    :goto_0
    return v0
.end method

.method private static selectedHost(Landroid/app/Activity;)Ljava/lang/Object;
    .registers 3
    .param p0, "a"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 92
    invoke-static {}, Le/e/a/Dev132;->multi()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "HOSTS"

    invoke-static {v0, v1}, Le/e/a/Dev132;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 93
    .local v0, "hosts":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static show(Landroid/app/Activity;)V
    .registers 20
    .param p0, "activity"    # Landroid/app/Activity;

    .line 373
    if-eqz p0, :cond_8

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_8

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_4

    .line 375
    :cond_0
    :try_start_0
    invoke-static/range {p0 .. p0}, Le/e/a/Dev132;->selectedHost(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v2

    .line 376
    .local v2, "host":Ljava/lang/Object;
    if-nez v2, :cond_1

    return-void

    .line 377
    :cond_1
    sget-object v0, Le/e/a/Dev132;->opened:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlertDialog;

    move-object v6, v0

    .line 378
    .local v6, "previous":Landroid/app/AlertDialog;
    if-eqz v6, :cond_2

    invoke-virtual {v6}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {v6}, Landroid/app/AlertDialog;->dismiss()V

    .line 379
    :cond_2
    move-object/from16 v7, p0

    .line 380
    .local v7, "c":Landroid/content/Context;
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v7}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v8, v0

    .local v8, "wrapper":Landroid/widget/LinearLayout;
    const/4 v0, 0x1

    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 381
    const/high16 v1, 0x41600000    # 14.0f

    invoke-static {v7, v1}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v3

    const/high16 v4, 0x41400000    # 12.0f

    invoke-static {v7, v4}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {v7, v1}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v1

    const/high16 v5, 0x41200000    # 10.0f

    invoke-static {v7, v5}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-virtual {v8, v3, v4, v1, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 382
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v7}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v9, v1

    .local v9, "header":Landroid/widget/LinearLayout;
    const/16 v1, 0x10

    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 383
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v7}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object v10, v3

    .local v10, "title":Landroid/widget/TextView;
    const-string v3, "\u30bf\u30d6\u4e00\u89a7"

    const-string v4, "Tabs"

    const-string v5, "\u5206\u9801\u6e05\u55ae"

    invoke-static {v7, v3, v4, v5}, Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 384
    invoke-static {v7}, Le/e/a/Dev132;->foreground(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setTextSize(F)V

    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v10, v3, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 385
    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v3, 0x41800000    # 16.0f

    invoke-static {v7, v3}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v3

    const/4 v11, 0x0

    invoke-virtual {v10, v3, v11, v11, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 386
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42400000    # 48.0f

    invoke-static {v7, v4}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v4

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v3, v11, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v9, v10, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 387
    new-instance v3, Landroid/widget/FrameLayout;

    invoke-direct {v3, v7}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    move-object v12, v3

    .line 388
    .local v12, "dismiss":Landroid/widget/FrameLayout;
    const-string v3, "\u30bf\u30d6\u4e00\u89a7\u3092\u9589\u3058\u308b"

    const-string v4, "Close tab list"

    const-string/jumbo v5, "\u95dc\u9589\u5206\u9801\u6e05\u55ae"

    invoke-static {v7, v3, v4, v5}, Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v3}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 389
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    move-object v13, v3

    .line 391
    .local v13, "dismissBackground":Landroid/graphics/drawable/GradientDrawable;
    invoke-static {v7}, Le/e/a/Dev132;->accent(Landroid/content/Context;)I

    move-result v3

    const v4, 0xffffff

    and-int/2addr v3, v4

    const/high16 v4, 0x22000000

    or-int/2addr v3, v4

    invoke-virtual {v13, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 392
    const/high16 v3, 0x41a00000    # 20.0f

    invoke-static {v7, v3}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v13, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 393
    invoke-virtual {v12, v13}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 394
    invoke-virtual {v12, v0}, Landroid/widget/FrameLayout;->setClickable(Z)V

    invoke-virtual {v12, v0}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 395
    new-instance v3, Le/e/a/Dev132$Glyph;

    const/16 v4, 0xb

    invoke-direct {v3, v7, v4, v0}, Le/e/a/Dev132$Glyph;-><init>(Landroid/content/Context;IZ)V

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 396
    const/high16 v5, 0x41b00000    # 22.0f

    invoke-static {v7, v5}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v14

    invoke-static {v7, v5}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v5

    const/16 v15, 0x11

    invoke-direct {v4, v14, v5, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 395
    invoke-virtual {v12, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 397
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42300000    # 44.0f

    invoke-static {v7, v4}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {v7, v4}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v12, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 398
    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 399
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v7}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .local v4, "undo":Landroid/widget/TextView;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u21b6  "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "\u76f4\u524d\u306b\u9589\u3058\u305f\u30bf\u30d6\u3092\u5fa9\u5143"

    const-string v14, "Restore most recently closed tab"

    const-string v15, "\u5fa9\u539f\u6700\u8fd1\u95dc\u9589\u7684\u5206\u9801"

    invoke-static {v7, v5, v14, v15}, Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 400
    invoke-static {v7}, Le/e/a/Dev132;->accent(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 401
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 402
    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {v7, v1}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-static {v7, v1}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v4, v3, v11, v1, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 403
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42200000    # 40.0f

    invoke-static {v7, v3}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v3

    const/4 v5, -0x1

    invoke-direct {v1, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 404
    new-instance v1, Landroid/widget/ListView;

    invoke-direct {v1, v7}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .local v1, "list":Landroid/widget/ListView;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setVerticalScrollBarEnabled(Z)V

    .line 405
    invoke-virtual {v1, v11}, Landroid/widget/ListView;->setChoiceMode(I)V

    invoke-virtual {v1, v11}, Landroid/widget/ListView;->setBackgroundColor(I)V

    .line 406
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x2

    invoke-direct {v0, v5, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 407
    invoke-static/range {p0 .. p0}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    .line 408
    .local v3, "dialog":Landroid/app/AlertDialog;
    new-instance v0, Le/e/a/Dev132$TabAdapter;

    move-object v5, v1

    move-object/from16 v1, p0

    .end local v1    # "list":Landroid/widget/ListView;
    .local v5, "list":Landroid/widget/ListView;
    invoke-direct/range {v0 .. v5}, Le/e/a/Dev132$TabAdapter;-><init>(Landroid/app/Activity;Ljava/lang/Object;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/widget/ListView;)V

    .line 409
    .local v0, "adapter":Le/e/a/Dev132$TabAdapter;
    invoke-virtual {v5, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 410
    new-instance v15, Le/e/a/Dev132$0;

    invoke-direct {v15, v0, v3, v2}, Le/e/a/Dev132$0;-><init>(Le/e/a/Dev132$TabAdapter;Landroid/app/AlertDialog;Ljava/lang/Object;)V

    invoke-virtual {v5, v15}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-static/range {v5 .. v5}, Le/e/a/PressFeedback;->list(Landroid/widget/AbsListView;)V

    .line 418
    invoke-static {v5, v0, v1, v2}, Le/e/a/Dev132;->dragReorder(Landroid/widget/ListView;Le/e/a/Dev132$TabAdapter;Landroid/app/Activity;Ljava/lang/Object;)V

    .line 419
    new-instance v15, Le/e/a/Dev132$1;

    invoke-direct {v15, v3}, Le/e/a/Dev132$1;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {v12, v15}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 420
    invoke-static {}, Le/e/a/Dev132;->model()Ljava/lang/Object;

    move-result-object v15

    invoke-static {v15}, Le/e/a/Dev132;->canRestore(Ljava/lang/Object;)Z

    move-result v15

    invoke-virtual {v4, v15}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 421
    invoke-virtual {v4}, Landroid/widget/TextView;->isEnabled()Z

    move-result v15

    if-nez v15, :cond_3

    const v15, 0x3ecccccd    # 0.4f

    invoke-virtual {v4, v15}, Landroid/widget/TextView;->setAlpha(F)V

    .line 422
    :cond_3
    new-instance v15, Le/e/a/Dev132$2;

    invoke-direct {v15, v1, v2, v0}, Le/e/a/Dev132$2;-><init>(Landroid/app/Activity;Ljava/lang/Object;Le/e/a/Dev132$TabAdapter;)V

    invoke-virtual {v4, v15}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 423
    new-instance v15, Le/e/a/Dev132$3;

    invoke-direct {v15, v3}, Le/e/a/Dev132$3;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {v3, v15}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 424
    invoke-static {v3}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    .line 425
    new-instance v15, Ljava/lang/ref/WeakReference;

    invoke-direct {v15, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v15, Le/e/a/Dev132;->opened:Ljava/lang/ref/WeakReference;

    .line 426
    invoke-virtual {v3}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v15

    .line 427
    .local v15, "window":Landroid/view/Window;
    if-eqz v15, :cond_4

    const/high16 v11, 0x43d70000    # 430.0f

    invoke-static {v7, v11}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v11

    .line 428
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v14

    iget v14, v14, Landroid/util/DisplayMetrics;->widthPixels:I

    move-object/from16 v16, v2

    .end local v2    # "host":Ljava/lang/Object;
    .local v16, "host":Ljava/lang/Object;
    const/high16 v2, 0x42000000    # 32.0f

    invoke-static {v7, v2}, Le/e/a/Dev132;->dp(Landroid/content/Context;F)I

    move-result v2

    sub-int/2addr v14, v2

    .line 427
    invoke-static {v11, v14}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v11, -0x2

    invoke-virtual {v15, v2, v11}, Landroid/view/Window;->setLayout(II)V

    goto :goto_0

    .end local v16    # "host":Ljava/lang/Object;
    .restart local v2    # "host":Ljava/lang/Object;
    :cond_4
    move-object/from16 v16, v2

    .line 430
    .end local v2    # "host":Ljava/lang/Object;
    .restart local v16    # "host":Ljava/lang/Object;
    :goto_0
    invoke-virtual {v0}, Le/e/a/Dev132$TabAdapter;->getCount()I

    move-result v2

    invoke-static {v1, v5, v2}, Le/e/a/Dev132;->fitList(Landroid/app/Activity;Landroid/widget/ListView;I)V

    .line 431
    invoke-static {}, Le/e/a/Dev132;->model()Ljava/lang/Object;

    move-result-object v2

    const-string v11, "selected"

    invoke-static {v2, v11}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 432
    .local v2, "selected":Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "index":I
    iget-object v14, v0, Le/e/a/Dev132$TabAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_6

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v18, v17

    move-object/from16 v17, v0

    .end local v0    # "adapter":Le/e/a/Dev132$TabAdapter;
    .local v17, "adapter":Le/e/a/Dev132$TabAdapter;
    .local v18, "t":Ljava/lang/Object;
    const-string v0, "id"

    move-object/from16 v1, v18

    .end local v18    # "t":Ljava/lang/Object;
    .local v1, "t":Ljava/lang/Object;
    invoke-static {v1, v0}, Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_2

    .end local v1    # "t":Ljava/lang/Object;
    :cond_5
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v1, p0

    move-object/from16 v0, v17

    goto :goto_1

    .end local v17    # "adapter":Le/e/a/Dev132$TabAdapter;
    .restart local v0    # "adapter":Le/e/a/Dev132$TabAdapter;
    :cond_6
    move-object/from16 v17, v0

    .line 433
    .end local v0    # "adapter":Le/e/a/Dev132$TabAdapter;
    .restart local v17    # "adapter":Le/e/a/Dev132$TabAdapter;
    :goto_2
    invoke-virtual/range {v17 .. v17}, Le/e/a/Dev132$TabAdapter;->getCount()I

    move-result v0

    if-ge v11, v0, :cond_7

    add-int/lit8 v0, v11, -0x2

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {v5, v0}, Landroid/widget/ListView;->setSelection(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 434
    .end local v2    # "selected":Ljava/lang/String;
    .end local v3    # "dialog":Landroid/app/AlertDialog;
    .end local v4    # "undo":Landroid/widget/TextView;
    .end local v5    # "list":Landroid/widget/ListView;
    .end local v6    # "previous":Landroid/app/AlertDialog;
    .end local v7    # "c":Landroid/content/Context;
    .end local v8    # "wrapper":Landroid/widget/LinearLayout;
    .end local v9    # "header":Landroid/widget/LinearLayout;
    .end local v10    # "title":Landroid/widget/TextView;
    .end local v11    # "index":I
    .end local v12    # "dismiss":Landroid/widget/FrameLayout;
    .end local v13    # "dismissBackground":Landroid/graphics/drawable/GradientDrawable;
    .end local v15    # "window":Landroid/view/Window;
    .end local v16    # "host":Ljava/lang/Object;
    .end local v17    # "adapter":Le/e/a/Dev132$TabAdapter;
    :cond_7
    goto :goto_3

    :catch_0
    move-exception v0

    .local v0, "err":Ljava/lang/Exception;
    const-string v1, "nicoid-tab-list"

    const-string v2, "Unable to display tabs"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 435
    .end local v0    # "err":Ljava/lang/Exception;
    :goto_3
    return-void

    .line 373
    :cond_8
    :goto_4
    return-void
.end method

.method public static showAddTab(Landroid/app/Activity;)V
    .registers 6
    .param p0, "activity"    # Landroid/app/Activity;

    .line 361
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 363
    :cond_0
    :try_start_0
    invoke-static {p0}, Le/e/a/Dev132;->selectedHost(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v0

    .line 364
    .local v0, "host":Ljava/lang/Object;
    if-nez v0, :cond_1

    return-void

    .line 365
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "add"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 366
    .local v1, "add":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 367
    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 370
    nop

    .end local v0    # "host":Ljava/lang/Object;
    .end local v1    # "add":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 368
    :catch_0
    move-exception v0

    .line 369
    .local v0, "error":Ljava/lang/Exception;
    const-string v1, "nicoid-tabs"

    const-string v2, "Unable to open add-tab menu"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 371
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 361
    :cond_2
    :goto_1
    return-void
.end method

.method private static tabType()Ljava/lang/Class;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 81
    const-string v0, "e.e.a.SavedTabs227$Tab"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method private static tabs(Ljava/lang/Object;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "model"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 89
    const-string v0, "tabs"

    invoke-static {p0, v0}, Le/e/a/Dev132;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    return-object v0
.end method

.method private static text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "tab"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 99
    invoke-static {p0, p1}, Le/e/a/Dev132;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 100
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "ja"    # Ljava/lang/String;
    .param p2, "en"    # Ljava/lang/String;
    .param p3, "zh"    # Ljava/lang/String;

    .line 57
    invoke-static {p0, p1, p2, p3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
