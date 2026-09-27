.class final Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;
.super Ljava/lang/Object;
.source "NativeAsrTrackReference.java"


# static fields
.field private static final tracks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 9
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;->tracks:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized candidates(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-class v0, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;

    monitor-enter v0

    .line 20
    :try_start_3
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;->tracks:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-nez p0, :cond_11

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_60

    monitor-exit v0

    return-object p0

    .line 21
    :cond_11
    :try_start_11
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1e
    :goto_1e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_40

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4, p1}, Lapp/yydarlinker/deepseekcaptions/WordTimingReference;->sameLanguage(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1e

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 23
    :cond_40
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_48
    :goto_48
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_5e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_48

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5d
    .catchall {:try_start_11 .. :try_end_5d} :catchall_60

    goto :goto_48

    .line 24
    :cond_5e
    monitor-exit v0

    return-object v1

    :catchall_60
    move-exception p0

    :try_start_61
    monitor-exit v0
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_60

    throw p0
.end method

.method static declared-synchronized clear()V
    .registers 2

    const-class v0, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;

    monitor-enter v0

    .line 27
    :try_start_3
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;->tracks:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_a

    monitor-exit v0

    return-void

    :catchall_a
    move-exception v1

    :try_start_b
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_b .. :try_end_c} :catchall_a

    throw v1
.end method

.method static declared-synchronized find(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const-class v0, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;

    monitor-enter v0

    .line 26
    :try_start_3
    const-string v1, ""

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;->candidates(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_12

    const-string p0, ""

    goto :goto_19

    :cond_12
    const/4 v1, 0x0

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_1b

    :goto_19
    monitor-exit v0

    return-object p0

    :catchall_1b
    move-exception p0

    :try_start_1c
    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1b

    throw p0
.end method

.method static synthetic lambda$remember$0(Ljava/lang/String;)Ljava/util/Map;
    .registers 1

    .line 16
    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    return-object p0
.end method

.method private static query(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 28
    :try_start_0
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_36

    const-string v0, "&"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_13
    if-ge v2, v0, :cond_36

    aget-object v3, p0, v2

    const-string v4, "="

    const/4 v5, 0x2

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    if-ne v4, v5, :cond_33

    aget-object v4, v3, v1

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_33

    const/4 p0, 0x1

    aget-object p0, v3, p0

    const-string p1, "UTF-8"

    invoke-static {p0, p1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_32} :catch_36

    return-object p0

    :cond_33
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    :catch_36
    :cond_36
    const-string p0, ""

    return-object p0
.end method

.method static declared-synchronized remember(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    const-class v0, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;

    monitor-enter v0

    if-eqz p0, :cond_77

    .line 11
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_77

    if-eqz p1, :cond_77

    const-string v1, "a."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_16

    goto :goto_77

    .line 12
    :cond_16
    const-string p1, "v"

    invoke-static {p2, p1}, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;->query(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lapp/yydarlinker/deepseekcaptions/WordTimingReference;->safe(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1
    :try_end_20
    .catchall {:try_start_5 .. :try_end_20} :catchall_74

    if-nez v1, :cond_24

    monitor-exit v0

    return-void

    .line 13
    :cond_24
    :try_start_24
    const-string v1, "lang"

    invoke-static {p2, v1}, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;->query(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_38

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1
    :try_end_34
    .catchall {:try_start_24 .. :try_end_34} :catchall_74

    if-nez v1, :cond_38

    monitor-exit v0

    return-void

    .line 15
    :cond_38
    :try_start_38
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;->tracks:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_56

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v2

    const/4 v3, 0x4

    if-lt v2, v3, :cond_56

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    :cond_56
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v1, p1, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/Map;Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    .line 17
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    const/16 v2, 0x10

    if-lt v1, v2, :cond_6f

    invoke-interface {p1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_72

    :cond_6f
    invoke-interface {p1, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_72
    .catchall {:try_start_38 .. :try_end_72} :catchall_74

    .line 18
    :cond_72
    monitor-exit v0

    return-void

    :catchall_74
    move-exception p0

    :try_start_75
    monitor-exit v0
    :try_end_76
    .catchall {:try_start_75 .. :try_end_76} :catchall_74

    throw p0

    .line 11
    :cond_77
    :goto_77
    monitor-exit v0

    return-void
.end method
