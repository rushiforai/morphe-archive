.class public final Le/e/a/TabSearch228;
.super Ljava/lang/Object;
.source "TabSearch228.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static edit(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 6

    .line 5
    invoke-static {p0}, Le/e/a/TabSearch228;->menu(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    :try_start_7
    const-string v0, "e.e.a.v0"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "a"

    const-class v2, Landroid/content/Context;

    const-class v3, Ljava/lang/String;

    filled-new-array {v2, v3}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {v0, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_23} :catch_24

    goto :goto_2c

    :catch_24
    move-exception p0

    const-string p1, "nicoid-tabs"

    const-string v0, "Cannot open search editor"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2c
    return-void
.end method

.method public static menu(Landroid/app/Activity;)Z
    .registers 3

    .line 6
    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/MultiTabs227$Host;

    if-nez p0, :cond_13

    return v1

    :cond_13
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v0

    if-eqz v0, :cond_24

    iget v1, v0, Le/e/a/SavedTabs227$Tab;->kind:I

    if-nez v1, :cond_24

    goto :goto_25

    :cond_24
    const/4 v0, 0x0

    :goto_25
    invoke-virtual {p0, v0}, Le/e/a/MultiTabs227$Host;->query(Le/e/a/SavedTabs227$Tab;)V

    const/4 p0, 0x1

    return p0
.end method

.method static open(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V
    .registers 7

    .line 8
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 9
    new-instance v1, Le/e/a/TabSearch228$1;

    iget-object p0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v1, p0, v0, p1}, Le/e/a/TabSearch228$1;-><init>(Landroid/content/Context;Ljava/lang/ref/WeakReference;Le/e/a/SavedTabs227$Tab;)V

    .line 18
    const/4 p0, 0x0

    if-nez p1, :cond_11

    move-object v0, p0

    goto :goto_13

    :cond_11
    :try_start_11
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    :goto_13
    invoke-static {v1, v0}, Le/e/a/SearchSnapshot110;->editing(Landroid/content/Context;Ljava/lang/String;)V

    const-string v0, "e.e.a.v0"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1c} :catch_4c

    const-string v2, "a"

    if-nez p1, :cond_36

    :try_start_20
    const-class p1, Landroid/content/Context;

    const-class v3, Ljava/lang/String;

    const-class v4, [I

    filled-new-array {p1, v3, v4}, [Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v0, v2, p1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    filled-new-array {v1, p0, p0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_54

    :cond_36
    const-class v3, Landroid/content/Context;

    const-class v4, Ljava/lang/String;

    filled-new-array {v3, v4}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    filled-new-array {v1, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_4b} :catch_4c

    goto :goto_54

    .line 19
    :catch_4c
    move-exception p0

    const-string p1, "nicoid-tabs"

    const-string v0, "Cannot open native search form"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    :goto_54
    return-void
.end method
