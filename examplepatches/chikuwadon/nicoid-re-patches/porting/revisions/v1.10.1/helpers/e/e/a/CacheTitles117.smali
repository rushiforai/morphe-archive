.class public final Le/e/a/CacheTitles117;
.super Ljava/lang/Object;
.source "CacheTitles117.java"


# static fields
.field static final TITLES:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 5
    new-instance v0, Le/e/a/CacheTitles117$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x40

    invoke-direct {v0, v3, v1, v2}, Le/e/a/CacheTitles117$1;-><init>(IFZ)V

    sput-object v0, Le/e/a/CacheTitles117;->TITLES:Ljava/util/LinkedHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bundle(Ljava/lang/Object;)V
    .registers 5

    .line 9
    instance-of v0, p0, Landroid/os/Bundle;

    if-nez v0, :cond_5

    return-void

    :cond_5
    check-cast p0, Landroid/os/Bundle;

    const-string v0, "id"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "videoId"

    invoke-virtual {p0, v2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "videoTitle"

    invoke-virtual {p0, v2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_31

    const-string v3, "null"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_37

    :cond_31
    const-string v2, "title"

    invoke-virtual {p0, v2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_37
    if-eqz v0, :cond_41

    const-string p0, "(?:sm|so|nm|ss)?[0-9]+"

    invoke-virtual {v0, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_58

    :cond_41
    :try_start_41
    const-string p0, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string v1, "t"

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_56} :catch_57

    goto :goto_58

    :catch_57
    move-exception p0

    :cond_58
    :goto_58
    invoke-static {v0, v2}, Le/e/a/CacheTitles117;->remember(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static declared-synchronized known(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const-class v0, Le/e/a/CacheTitles117;

    monitor-enter v0

    .line 8
    :try_start_3
    sget-object v1, Le/e/a/CacheTitles117;->TITLES:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_11

    if-nez v1, :cond_e

    goto :goto_f

    :cond_e
    move-object p0, v1

    :goto_f
    monitor-exit v0

    return-object p0

    .line 8
    :catchall_11
    move-exception p0

    :try_start_12
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    throw p0
.end method

.method static declared-synchronized remember(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    const-class v0, Le/e/a/CacheTitles117;

    monitor-enter v0

    .line 7
    if-eqz p0, :cond_28

    if-eqz p1, :cond_28

    :try_start_7
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_28

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_28

    const-string v1, "null"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_28

    sget-object v1, Le/e/a/CacheTitles117;->TITLES:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p0, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_28

    .line 7
    :catchall_25
    move-exception p0

    monitor-exit v0
    :try_end_27
    .catchall {:try_start_7 .. :try_end_27} :catchall_25

    throw p0

    .line 7
    :cond_28
    :goto_28
    monitor-exit v0

    return-void
.end method

.method static title(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 6
    const-string v0, "videoTitle"

    const-string v1, "title"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_9
    const/4 v2, 0x2

    if-lt v1, v2, :cond_d

    return-object p1

    :cond_d
    aget-object v2, v0, v1

    const-string v3, ""

    invoke-virtual {p0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2e

    const-string v3, "null"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2e

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2e

    return-object v2

    :cond_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_9
.end method
