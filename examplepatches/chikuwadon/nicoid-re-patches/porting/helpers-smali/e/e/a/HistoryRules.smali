.class public final Le/e/a/HistoryRules;
.super Ljava/lang/Object;
.source "HistoryRules.java"


# static fields
.field private static final ID:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 9
    const-string v0, "(?:^|/(?:watch|shorts)/)((?:sm|nm|so|ss)?[0-9]+)(?:[/?#].*)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/HistoryRules;->ID:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static accountViewedAt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "template"    # Ljava/lang/String;

    .line 18
    if-eqz p0, :cond_3f

    if-nez p1, :cond_5

    goto :goto_3f

    .line 19
    :cond_5
    const-string v0, "<[^>]*>"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 20
    .local v0, "plain":Ljava/lang/String;
    const-string v1, "%s"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .local v2, "first":I
    add-int/lit8 v3, v2, 0x2

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 21
    .local v1, "second":I
    if-ltz v2, :cond_3e

    if-gez v1, :cond_1e

    goto :goto_3e

    .line 22
    :cond_1e
    add-int/lit8 v3, v2, 0x2

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 23
    .local v3, "separator":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2c

    const/4 v4, -0x1

    goto :goto_30

    :cond_2c
    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 24
    .local v4, "end":I
    :goto_30
    if-gez v4, :cond_34

    move-object v5, p0

    goto :goto_3d

    :cond_34
    const/4 v5, 0x0

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    :goto_3d
    return-object v5

    .line 21
    .end local v3    # "separator":Ljava/lang/String;
    .end local v4    # "end":I
    :cond_3e
    :goto_3e
    return-object p0

    .line 18
    .end local v0    # "plain":Ljava/lang/String;
    .end local v1    # "second":I
    .end local v2    # "first":I
    :cond_3f
    :goto_3f
    return-object p0
.end method

.method public static contains(Ljava/util/Set;Ljava/lang/Object;)Z
    .registers 5
    .param p1, "stored"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "*>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .line 30
    .local p0, "selected":Ljava/util/Set;, "Ljava/util/Set<*>;"
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .local v1, "value":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_4

    move-object v2, v1

    check-cast v2, Ljava/lang/String;

    invoke-static {v2, p1}, Le/e/a/HistoryRules;->same(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const/4 v0, 0x1

    return v0

    .line 31
    .end local v1    # "value":Ljava/lang/Object;
    :cond_1d
    const/4 v0, 0x0

    return v0
.end method

.method public static id(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .line 11
    if-nez p0, :cond_4

    const/4 v0, 0x0

    return-object v0

    .line 12
    :cond_4
    sget-object v0, Le/e/a/HistoryRules;->ID:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 13
    .local v0, "match":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_1a

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1b

    :cond_1a
    move-object v1, p0

    :goto_1b
    return-object v1
.end method

.method public static same(Ljava/lang/String;Ljava/lang/Object;)Z
    .registers 4
    .param p0, "first"    # Ljava/lang/String;
    .param p1, "second"    # Ljava/lang/Object;

    .line 27
    if-eqz p0, :cond_19

    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_19

    invoke-static {p0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v0, 0x1

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    return v0
.end method
