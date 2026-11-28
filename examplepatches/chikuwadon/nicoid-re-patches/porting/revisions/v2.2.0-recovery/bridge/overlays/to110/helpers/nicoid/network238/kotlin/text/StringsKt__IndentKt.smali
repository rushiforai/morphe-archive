.class abstract Lnicoid/network238/kotlin/text/StringsKt__IndentKt;
.super Lnicoid/network238/kotlin/text/StringsKt__AppendableKt;
.source "SourceFile"


# direct methods
.method public static synthetic $r8$lambda$7gQTIx5gKXNh0yIHp2Ioy3cIUtg(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    invoke-static {p0}, Lnicoid/network238/kotlin/text/StringsKt__IndentKt;->getIndentFunction$lambda$8$StringsKt__IndentKt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$nNic-LEWSJV9XuSiP33DOd1sLF4(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/text/StringsKt__IndentKt;->getIndentFunction$lambda$9$StringsKt__IndentKt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static final getIndentFunction$StringsKt__IndentKt(Ljava/lang/String;)Lnicoid/network238/kotlin/jvm/functions/Function1;
    .registers 2

    .line 110
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    new-instance p0, Lnicoid/network238/kotlin/text/StringsKt__IndentKt$0;

    invoke-direct {p0}, Lnicoid/network238/kotlin/text/StringsKt__IndentKt$0;-><init>()V

    return-object p0

    .line 111
    :cond_0
    new-instance v0, Lnicoid/network238/kotlin/text/StringsKt__IndentKt$1;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/text/StringsKt__IndentKt$1;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static final getIndentFunction$lambda$8$StringsKt__IndentKt(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method private static final getIndentFunction$lambda$9$StringsKt__IndentKt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final replaceIndentByMargin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 16

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    invoke-static {p2}, Lnicoid/network238/kotlin/text/StringsKt__StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 40
    invoke-static {p0}, Lnicoid/network238/kotlin/text/StringsKt__StringsKt;->lines(Ljava/lang/CharSequence;)Ljava/util/List;

    move-result-object v0

    .line 42
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    mul-int/2addr v1, v2

    add-int/2addr p0, v1

    invoke-static {p1}, Lnicoid/network238/kotlin/text/StringsKt__IndentKt;->getIndentFunction$StringsKt__IndentKt(Ljava/lang/String;)Lnicoid/network238/kotlin/jvm/functions/Function1;

    move-result-object p1

    .line 131
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->getLastIndex(Ljava/util/List;)I

    move-result v1

    .line 133
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 145
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v6, v4, 0x1

    if-gez v4, :cond_0

    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->throwIndexOverflow()V

    .line 143
    :cond_0
    move-object v7, v5

    check-cast v7, Ljava/lang/String;

    const/4 v5, 0x0

    if-eqz v4, :cond_1

    if-eq v4, v1, :cond_1

    goto :goto_1

    .line 146
    :cond_1
    invoke-static {v7}, Lnicoid/network238/kotlin/text/StringsKt__StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    move-object v8, p2

    move-object v7, v5

    goto :goto_5

    :cond_2
    :goto_1
    nop

    .line 150
    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v4

    move v8, v3

    :goto_2
    const/4 v9, -0x1

    if-ge v8, v4, :cond_3

    .line 151
    invoke-interface {v7, v8}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v10

    .line 43
    invoke-static {v10}, Lnicoid/network238/kotlin/text/CharsKt__CharJVMKt;->isWhitespace(C)Z

    move-result v10

    if-eqz v10, :cond_4

    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    :cond_3
    move v8, v9

    :cond_4
    if-ne v8, v9, :cond_5

    move-object v8, p2

    goto :goto_3

    .line 47
    :cond_5
    const/4 v10, 0x0

    const/4 v11, 0x4

    const/4 v12, 0x0

    move v9, v8

    move-object v8, p2

    invoke-static/range {v7 .. v12}, Lnicoid/network238/kotlin/text/StringsKt__StringsJVMKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;IZILjava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr p2, v9

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v7, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_4

    :cond_6
    :goto_3
    nop

    :goto_4
    if-eqz v5, :cond_7

    .line 149
    invoke-interface {p1, v5}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-eqz p2, :cond_7

    move-object v7, p2

    :cond_7
    :goto_5
    if-eqz v7, :cond_8

    .line 143
    invoke-interface {v2, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_8
    move v4, v6

    move-object p2, v8

    goto :goto_0

    .line 159
    :cond_9
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v10, 0x7c

    const/4 v11, 0x0

    const-string v4, "\n"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v2 .. v11}, Lnicoid/network238/kotlin/collections/CollectionsKt;->joinTo$default(Ljava/lang/Iterable;Ljava/lang/Appendable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lnicoid/network238/kotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/Appendable;

    move-result-object p0

    check-cast p0, Ljava/lang/StringBuilder;

    .line 160
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 39
    :cond_a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "marginPrefix must be non-blank string."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final trimMargin(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    const-string v0, ""

    invoke-static {p0, v0, p1}, Lnicoid/network238/kotlin/text/StringsKt__IndentKt;->replaceIndentByMargin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic trimMargin$default(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 27
    const-string p1, "|"

    .line 26
    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/text/StringsKt__IndentKt;->trimMargin(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
