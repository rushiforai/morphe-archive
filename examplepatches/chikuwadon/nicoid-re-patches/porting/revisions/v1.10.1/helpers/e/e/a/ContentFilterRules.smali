.class public final Le/e/a/ContentFilterRules;
.super Ljava/lang/Object;
.source "ContentFilterRules.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ContentFilterRules$Rule;
    }
.end annotation


# static fields
.field private static final cache:Ljava/util/LinkedHashMap;
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
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x100

    invoke-direct {v0, v3, v1, v2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    sput-object v0, Le/e/a/ContentFilterRules;->cache:Ljava/util/LinkedHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 6
    invoke-static {p0}, Le/e/a/ContentFilterRules;->normalized(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static blocked(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 6

    .line 8
    const/4 v0, 0x0

    if-eqz p0, :cond_1d

    array-length v1, p1

    if-nez v1, :cond_7

    goto :goto_1d

    :cond_7
    invoke-static {p0}, Le/e/a/ContentFilterRules;->normalized(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    array-length v1, p1

    const/4 v2, 0x0

    :goto_d
    if-lt v2, v1, :cond_10

    return v0

    :cond_10
    aget-object v3, p1, v2

    invoke-virtual {p0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_1d
    :goto_1d
    return v0
.end method

.method public static keywords(Ljava/lang/String;)[Ljava/lang/String;
    .registers 7

    .line 7
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    const/4 v1, 0x0

    if-eqz p0, :cond_29

    const-string v2, "[,\uff0c\u3001\\r\\n]+"

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v2, p0

    const/4 v3, 0x0

    :goto_10
    if-lt v3, v2, :cond_13

    goto :goto_29

    :cond_13
    aget-object v4, p0, v3

    invoke-static {v4}, Le/e/a/ContentFilterRules;->normalized(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_26

    invoke-virtual {v0, v4}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    :cond_26
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    :cond_29
    :goto_29
    new-array p0, v1, [Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/util/LinkedHashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0
.end method

.method private static declared-synchronized normalized(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const-class v0, Le/e/a/ContentFilterRules;

    monitor-enter v0

    .line 6
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x1000

    if-le v1, v2, :cond_19

    sget-object v1, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    invoke-static {p0, v1}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object p0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_54

    monitor-exit v0

    return-object p0

    :cond_19
    :try_start_19
    sget-object v1, Le/e/a/ContentFilterRules;->cache:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_21
    .catchall {:try_start_19 .. :try_end_21} :catchall_54

    if-eqz v1, :cond_25

    :cond_23
    :goto_23
    monitor-exit v0

    return-object v1

    :cond_25
    :try_start_25
    sget-object v1, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    invoke-static {p0, v1}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Le/e/a/ContentFilterRules;->cache:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p0, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Le/e/a/ContentFilterRules;->cache:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->size()I

    move-result p0

    const/16 v2, 0x100

    if-le p0, v2, :cond_23

    sget-object p0, Le/e/a/ContentFilterRules;->cache:Ljava/util/LinkedHashMap;

    sget-object v2, Le/e/a/ContentFilterRules;->cache:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_23

    .line 6
    :catchall_54
    move-exception p0

    monitor-exit v0
    :try_end_56
    .catchall {:try_start_25 .. :try_end_56} :catchall_54

    throw p0
.end method
