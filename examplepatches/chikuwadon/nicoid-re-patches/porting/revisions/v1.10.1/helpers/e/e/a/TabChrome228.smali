.class public final Le/e/a/TabChrome228;
.super Ljava/lang/Object;
.source "TabChrome228.java"


# static fields
.field static final CHROME:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/TabChrome228;->CHROME:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static bar(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/CharSequence;)V
    .registers 7

    .line 8
    const/4 v0, 0x1

    :try_start_1
    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Ljava/lang/CharSequence;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p2, v0, v3

    invoke-static {p0, p1, v1, v0}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_f} :catch_10

    goto :goto_18

    :catch_10
    move-exception p0

    const-string p1, "nicoid-tabs"

    const-string p2, "Cannot update native toolbar"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_18
    return-void
.end method

.method static current(Ljava/lang/Object;)Z
    .registers 4

    .line 7
    const/4 v0, 0x1

    :try_start_1
    const-string v1, "o0"

    invoke-static {p0, v1}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    sget-object v2, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/MultiTabs227$Host;

    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v2

    if-eqz v2, :cond_1f

    if-eqz v1, :cond_1f

    iget-object v1, v1, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1b} :catch_20

    if-eq v1, p0, :cond_1f

    const/4 p0, 0x0

    return p0

    :cond_1f
    return v0

    :catch_20
    move-exception p0

    return v0
.end method

.method public static fragmentIntent(Ljava/lang/Object;Landroid/app/Activity;)Landroid/content/Intent;
    .registers 5

    .line 6
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "d0"

    invoke-static {p0, v2}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v1, "type"

    const-string v2, "g0"

    invoke-static {p0, v2}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_27} :catch_28

    return-object p0

    :catch_28
    move-exception p0

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method static restore(Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V
    .registers 7

    .line 11
    :try_start_0
    const-string v0, "o0"

    invoke-static {p0, v0}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const-string v1, "t"

    invoke-static {v0, v1}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Le/e/a/TabChrome228;->CHROME:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    if-nez v2, :cond_1b

    iget-object v3, p1, Le/e/a/SavedTabs227$Tab;->subtitle:Ljava/lang/String;

    goto :goto_1e

    :cond_1b
    const/4 v3, 0x1

    aget-object v3, v2, v3
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1e} :catch_4a

    :goto_1e
    if-nez v2, :cond_34

    :try_start_20
    const-string v2, "c0"

    invoke-static {p0, v2}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v4, "d"

    invoke-static {v2, v4}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_34

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_32} :catch_33

    goto :goto_34

    :catch_33
    move-exception v2

    :cond_34
    :goto_34
    :try_start_34
    iget-object v2, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "b"

    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-static {v1, v0, p1}, Le/e/a/TabChrome228;->bar(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/CharSequence;)V

    const-string p1, "a"

    invoke-static {p0, v3}, Le/e/a/RankingCaption232;->subtitle(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-static {v1, p1, p0}, Le/e/a/TabChrome228;->bar(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/CharSequence;)V
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_49} :catch_4a

    goto :goto_52

    :catch_4a
    move-exception p0

    const-string p1, "nicoid-tabs"

    const-string v0, "Cannot restore list toolbar"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_52
    return-void
.end method

.method public static subtitle(Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/Object;)V
    .registers 7

    .line 10
    invoke-static {p2, p1}, Le/e/a/RankingCaption232;->subtitle(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    sget-object v0, Le/e/a/TabChrome228;->CHROME:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const/4 v1, 0x1

    const-string v2, ""

    if-nez v0, :cond_1e

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v0, v3

    aput-object v2, v0, v1

    sget-object v3, Le/e/a/TabChrome228;->CHROME:Ljava/util/WeakHashMap;

    invoke-virtual {v3, p2, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1e
    if-nez p1, :cond_21

    goto :goto_25

    :cond_21
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_25
    aput-object v2, v0, v1

    invoke-static {p2}, Le/e/a/TabChrome228;->current(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_32

    const-string p2, "a"

    invoke-static {p0, p2, p1}, Le/e/a/TabChrome228;->bar(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/CharSequence;)V

    :cond_32
    return-void
.end method

.method public static title(Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/Object;)V
    .registers 7

    .line 9
    sget-object v0, Le/e/a/TabChrome228;->CHROME:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, ""

    if-nez v0, :cond_1a

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v3, 0x1

    aput-object v2, v0, v3

    sget-object v3, Le/e/a/TabChrome228;->CHROME:Ljava/util/WeakHashMap;

    invoke-virtual {v3, p2, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1a
    if-nez p1, :cond_1d

    goto :goto_21

    :cond_1d
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_21
    aput-object v2, v0, v1

    invoke-static {p2}, Le/e/a/TabChrome228;->current(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2e

    const-string p2, "b"

    invoke-static {p0, p2, p1}, Le/e/a/TabChrome228;->bar(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/CharSequence;)V

    :cond_2e
    return-void
.end method
