.class public final Lnicoid/network238/okhttp3/MediaType$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/MediaType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0011\u0010\n\u001a\u00020\u000b*\u00020\u0005H\u0007\u00a2\u0006\u0002\u0008\u000cJ\u0013\u0010\r\u001a\u0004\u0018\u00010\u000b*\u00020\u0005H\u0007\u00a2\u0006\u0002\u0008\u000eJ\u0015\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u0008\u0010J\u0017\u0010\u000e\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u000f\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u0008\u0011R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/MediaType$Companion;",
        "",
        "<init>",
        "()V",
        "TOKEN",
        "",
        "QUOTED",
        "TYPE_SUBTYPE",
        "Lnicoid/network238/kotlin/text/Regex;",
        "PARAMETER",
        "toMediaType",
        "Lnicoid/network238/okhttp3/MediaType;",
        "get",
        "toMediaTypeOrNull",
        "parse",
        "mediaType",
        "-deprecated_get",
        "-deprecated_parse",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/MediaType$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final -deprecated_get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 172
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/MediaType$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object p1

    return-object p1
.end method

.method public final -deprecated_parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 184
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/MediaType$Companion;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object p1

    return-object p1
.end method

.method public final get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;
    .registers 15

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    # getter for: Lnicoid/network238/okhttp3/MediaType;->TYPE_SUBTYPE:Lnicoid/network238/kotlin/text/Regex;
    invoke-static {}, Lnicoid/network238/okhttp3/MediaType;->access$getTYPE_SUBTYPE$cp()Lnicoid/network238/kotlin/text/Regex;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/text/Regex;->matchAt(Ljava/lang/CharSequence;I)Lnicoid/network238/kotlin/text/MatchResult;

    move-result-object v0

    const/16 v2, 0x22

    if-eqz v0, :cond_7

    .line 109
    invoke-interface {v0}, Lnicoid/network238/kotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    invoke-interface {v0}, Lnicoid/network238/kotlin/text/MatchResult;->getGroupValues()Ljava/util/List;

    move-result-object v6

    const/4 v7, 0x2

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 113
    invoke-interface {v0}, Lnicoid/network238/kotlin/text/MatchResult;->getRange()Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result v0

    add-int/2addr v0, v4

    .line 114
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v0, v8, :cond_6

    .line 115
    # getter for: Lnicoid/network238/okhttp3/MediaType;->PARAMETER:Lnicoid/network238/kotlin/text/Regex;
    invoke-static {}, Lnicoid/network238/okhttp3/MediaType;->access$getPARAMETER$cp()Lnicoid/network238/kotlin/text/Regex;

    move-result-object v8

    invoke-virtual {v8, p1, v0}, Lnicoid/network238/kotlin/text/Regex;->matchAt(Ljava/lang/CharSequence;I)Lnicoid/network238/kotlin/text/MatchResult;

    move-result-object v8

    if-eqz v8, :cond_5

    .line 120
    invoke-interface {v8}, Lnicoid/network238/kotlin/text/MatchResult;->getGroups()Lnicoid/network238/kotlin/text/MatchGroupCollection;

    move-result-object v0

    invoke-interface {v0, v4}, Lnicoid/network238/kotlin/text/MatchGroupCollection;->get(I)Lnicoid/network238/kotlin/text/MatchGroup;

    move-result-object v0

    const/4 v9, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lnicoid/network238/kotlin/text/MatchGroup;->getValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_0
    move-object v0, v9

    :goto_1
    if-nez v0, :cond_1

    .line 122
    invoke-interface {v8}, Lnicoid/network238/kotlin/text/MatchResult;->getRange()Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result v0

    add-int/2addr v0, v4

    goto :goto_0

    .line 126
    :cond_1
    invoke-interface {v8}, Lnicoid/network238/kotlin/text/MatchResult;->getGroups()Lnicoid/network238/kotlin/text/MatchGroupCollection;

    move-result-object v10

    invoke-interface {v10, v7}, Lnicoid/network238/kotlin/text/MatchGroupCollection;->get(I)Lnicoid/network238/kotlin/text/MatchGroup;

    move-result-object v10

    if-eqz v10, :cond_2

    invoke-virtual {v10}, Lnicoid/network238/kotlin/text/MatchGroup;->getValue()Ljava/lang/String;

    move-result-object v10

    goto :goto_2

    :cond_2
    move-object v10, v9

    :goto_2
    if-nez v10, :cond_3

    .line 131
    invoke-interface {v8}, Lnicoid/network238/kotlin/text/MatchResult;->getGroups()Lnicoid/network238/kotlin/text/MatchGroupCollection;

    move-result-object v9

    const/4 v10, 0x3

    invoke-interface {v9, v10}, Lnicoid/network238/kotlin/text/MatchGroupCollection;->get(I)Lnicoid/network238/kotlin/text/MatchGroup;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v9}, Lnicoid/network238/kotlin/text/MatchGroup;->getValue()Ljava/lang/String;

    move-result-object v10

    goto :goto_3

    :cond_3
    nop

    .line 134
    const/16 v11, 0x27

    invoke-static {v10, v11, v1, v7, v9}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-static {v10, v11, v1, v7, v9}, Lnicoid/network238/kotlin/text/StringsKt;->endsWith$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v9

    if-le v9, v7, :cond_4

    .line 136
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v4

    invoke-virtual {v10, v4, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 144
    :cond_4
    :goto_3
    invoke-interface {v6, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 145
    invoke-interface {v6, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 146
    invoke-interface {v8}, Lnicoid/network238/kotlin/text/MatchResult;->getRange()Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result v0

    add-int/2addr v0, v4

    goto :goto_0

    .line 117
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Parameter is not formatted correctly: \""

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\" for: \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 116
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 149
    :cond_6
    new-instance v0, Lnicoid/network238/okhttp3/MediaType;

    .line 189
    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v6, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .line 149
    invoke-direct {v0, p1, v3, v5, v1}, Lnicoid/network238/okhttp3/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-object v0

    .line 108
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "No subtype found for: \""

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 157
    :try_start_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/MediaType$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const/4 p1, 0x0

    return-object p1
.end method
