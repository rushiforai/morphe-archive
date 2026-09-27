.class final Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;
.super Ljava/lang/Object;
.source "RebuildSemantics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;
    }
.end annotation


# static fields
.field static final ANCHORS:[[Ljava/lang/String;

.field static final MODEL:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x4

    .line 11
    new-array v0, v0, [[Ljava/lang/String;

    const-string v1, "\\baircraft carriers?\\b"

    const-string v2, "\u822a\u6bcd|\u822a\u7a7a\u6bcd\u8230|\u822a\u7a7a\u6bcd\u8266|\u822a\u8266"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "\\b(?:fifth|5th)[ -]generation (?:fighters?|aircraft)\\b"

    const-string v2, "\u4e94\u4ee3|\u7b2c\u4e94\u4ee3|\u7b2c5\u4ee3"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "\\btanks?\\b"

    const-string v2, "\u5766\u514b"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "\\bmissiles?\\b"

    const-string v2, "\u5bfc\u5f39|\u98db\u5f48"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->ANCHORS:[[Ljava/lang/String;

    .line 18
    const-string v0, "(?i)(?<![a-z0-9])((?:[a-z]{1,4}(?=-))|(?:(?:t|j|su|mig|f|b|a)(?= )))[- ](\\d{1,3})(?![a-z0-9])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->MODEL:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static chinese(Ljava/lang/String;)Z
    .registers 3

    .line 35
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;)Ljava/util/stream/IntStream;

    move-result-object v0

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$$ExternalSyntheticLambda2;-><init>()V

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/stream/IntStream;Ljava/util/function/IntPredicate;)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 36
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;)Ljava/util/stream/IntStream;

    move-result-object p0

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$$ExternalSyntheticLambda3;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$$ExternalSyntheticLambda3;-><init>()V

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/stream/IntStream;Ljava/util/function/IntPredicate;)Z

    move-result p0

    if-nez p0, :cond_20

    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method static evidence(ILjava/lang/String;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;
    .registers 4

    .line 40
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->supports(ILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object p0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->SUPPORTED:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    return-object p0

    .line 41
    :cond_9
    invoke-static {p0, p2}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->supports(ILjava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2f

    const-string p2, "\\b(?:it|its|they|them|these|those|such|water|fuel|storage)\\b"

    invoke-static {p2, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_18

    goto :goto_2f

    :cond_18
    const/4 p2, 0x0

    .line 42
    :goto_19
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->ANCHORS:[[Ljava/lang/String;

    array-length v0, v0

    if-ge p2, v0, :cond_2c

    if-eq p2, p0, :cond_29

    invoke-static {p2, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->supports(ILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_29

    sget-object p0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->CONTRADICTED:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    return-object p0

    :cond_29
    add-int/lit8 p2, p2, 0x1

    goto :goto_19

    .line 43
    :cond_2c
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->UNKNOWN:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    return-object p0

    .line 41
    :cond_2f
    :goto_2f
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->UNKNOWN:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    return-object p0
.end method

.method static has(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x2

    .line 24
    invoke-static {p0, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$chinese$0(I)Z
    .registers 2

    .line 35
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(I)Ljava/lang/Character$UnicodeScript;

    move-result-object p0

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m()Ljava/lang/Character$UnicodeScript;

    move-result-object v0

    if-ne p0, v0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$chinese$1(I)Z
    .registers 3

    .line 36
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(I)Ljava/lang/Character$UnicodeScript;

    move-result-object v0

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m$1()Ljava/lang/Character$UnicodeScript;

    move-result-object v1

    if-eq v0, v1, :cond_17

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(I)Ljava/lang/Character$UnicodeScript;

    move-result-object p0

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m$2()Ljava/lang/Character$UnicodeScript;

    move-result-object v0

    if-ne p0, v0, :cond_15

    goto :goto_17

    :cond_15
    const/4 p0, 0x0

    return p0

    :cond_17
    :goto_17
    const/4 p0, 0x1

    return p0
.end method

.method static models(Ljava/lang/String;)Ljava/util/Set;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 20
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->MODEL:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 21
    :goto_b
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_39

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_39
    return-object v0
.end method

.method static normalized(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    if-nez p0, :cond_4

    .line 9
    const-string p0, ""

    :cond_4
    return-object p0
.end method

.method static supports(ILjava/lang/String;)Z
    .registers 5

    const/4 v0, 0x2

    const/4 v1, 0x0

    if-ne p0, v0, :cond_d

    .line 27
    const-string v0, "\\b(?:water|fuel|storage|septic|fish)\\b"

    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    return v1

    .line 28
    :cond_d
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->ANCHORS:[[Ljava/lang/String;

    aget-object v0, v0, p0

    aget-object v0, v0, v1

    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1b

    return v2

    :cond_1b
    const/4 v0, 0x3

    if-ne p0, v0, :cond_2f

    .line 30
    const-string p0, "\\bsams?\\b"

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2f

    const-string p0, "\\b(?:chinese|military|missiles?|defen[sc]e|mainland|bases|surface-to-air)\\b"

    .line 31
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2f

    return v2

    :cond_2f
    return v1
.end method

.method static validate(Lapp/yydarlinker/deepseekcaptions/RebuildSource;IILjava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;
        }
    .end annotation

    .line 67
    invoke-virtual {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->text(II)Ljava/lang/String;

    move-result-object p0

    .line 68
    const-string p1, "(?<![\\p{L}\\p{N}])(\\d{1,4}) (\\d{1,4})(?![\\p{L}\\p{N}])"

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 69
    :cond_e
    :goto_e
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p2

    if-eqz p2, :cond_5d

    const/4 p2, 0x2

    .line 71
    invoke-virtual {p1, p2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_21

    goto :goto_e

    .line 72
    :cond_21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\\s*(?:\u81f3|\u5230|\u2014|\u2013|-)\\s*"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 73
    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_e

    const-string p2, "\\b(?:to|through|between|and|range)\\b"

    invoke-static {p2, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_55

    goto :goto_e

    .line 74
    :cond_55
    new-instance p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;

    const-string p1, "numeric_range_invention"

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5d
    return-void
.end method

.method static validatePlan(Lapp/yydarlinker/deepseekcaptions/RebuildSource;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;Ljava/util/List;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource;",
            "Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;
        }
    .end annotation

    .line 49
    iget v0, p1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->from:I

    iget p1, p1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->to:I

    invoke-virtual {p0, v0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->text(II)Ljava/lang/String;

    move-result-object p1

    .line 50
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->models(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    .line 51
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_10
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c5

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;

    .line 52
    iget v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v3, v1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    invoke-virtual {p0, v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->text(II)Ljava/lang/String;

    move-result-object v2

    .line 53
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->models(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v3

    .line 54
    iget-object v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->text:Ljava/lang/String;

    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->models(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_32
    :goto_32
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const-string v6, "-"

    const-string v7, "range="

    const-string v8, "semantic_anchor_leak"

    if-eqz v5, :cond_7a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 55
    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_32

    invoke-interface {v3, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_51

    goto :goto_32

    .line 56
    :cond_51
    new-instance p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "; model="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " belongs elsewhere in this block; translate only the quoted source"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v8, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw p0

    .line 59
    :cond_7a
    iget-object v3, v1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->text:Ljava/lang/String;

    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->chinese(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_10

    const/4 v3, 0x0

    :goto_83
    sget-object v4, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->ANCHORS:[[Ljava/lang/String;

    array-length v5, v4

    if-ge v3, v5, :cond_10

    .line 60
    aget-object v4, v4, v3

    const/4 v5, 0x1

    aget-object v4, v4, v5

    iget-object v5, v1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->text:Ljava/lang/String;

    invoke-static {v4, v5}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_c2

    invoke-static {v3, v2, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->evidence(ILjava/lang/String;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    move-result-object v4

    sget-object v5, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->CONTRADICTED:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    if-eq v4, v5, :cond_9e

    goto :goto_c2

    .line 61
    :cond_9e
    new-instance p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "; incompatible explicit equipment anchor; source="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v8, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Invalid;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw p0

    :cond_c2
    :goto_c2
    add-int/lit8 v3, v3, 0x1

    goto :goto_83

    :cond_c5
    return-void
.end method
