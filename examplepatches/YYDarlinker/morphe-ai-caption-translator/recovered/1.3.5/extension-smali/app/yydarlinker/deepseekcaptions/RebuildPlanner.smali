.class final Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;
.super Ljava/lang/Object;
.source "RebuildPlanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;
    }
.end annotation


# static fields
.field static final MAX_CHARS:I = 0x640

.field static final MAX_SPAN:J = 0x7530L

.field static final MAX_WORDS:I = 0xa0

.field private static final PATTERNS:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/regex/Pattern;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 7
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->PATTERNS:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static boundary(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z
    .registers 7

    .line 135
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->terminal(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4a

    add-int/lit8 v0, p1, 0x1

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    .line 136
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_4a

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    .line 137
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-wide v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-wide v3, p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->end:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x28a

    cmp-long p1, v1, v3

    if-gez p1, :cond_4a

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    .line 138
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    const-string p1, ">>"

    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_48

    goto :goto_4a

    :cond_48
    const/4 p0, 0x0

    return p0

    :cond_4a
    :goto_4a
    const/4 p0, 0x1

    return p0
.end method

.method static context(Lapp/yydarlinker/deepseekcaptions/RebuildSource;II)Ljava/lang/String;
    .registers 8

    .line 142
    const-string v0, ""

    if-le p1, p2, :cond_5

    return-object v0

    :cond_5
    const/4 v1, 0x0

    .line 143
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 144
    invoke-virtual {p0, v1, p2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->text(II)Ljava/lang/String;

    move-result-object v2

    .line 145
    :goto_1a
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x168

    if-le v3, v4, :cond_30

    if-le p2, v1, :cond_30

    if-gez p1, :cond_29

    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    :cond_29
    add-int/lit8 p2, p2, -0x1

    .line 148
    :goto_2b
    invoke-virtual {p0, v1, p2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->text(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_1a

    .line 150
    :cond_30
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p0

    if-gt p0, v4, :cond_37

    return-object v2

    :cond_37
    return-object v0
.end method

.method static dependentEnding(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z
    .registers 7

    const/4 v0, 0x0

    if-ltz p1, :cond_7d

    .line 77
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt p1, v1, :cond_c

    goto :goto_7d

    .line 78
    :cond_c
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->terminal(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1d

    return v0

    .line 79
    :cond_1d
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->key:Ljava/lang/String;

    if-lez p1, :cond_36

    .line 80
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    add-int/lit8 v3, p1, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v2, v2, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->key:Ljava/lang/String;

    goto :goto_38

    :cond_36
    const-string v2, ""

    .line 82
    :goto_38
    const-string v3, "from"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_65

    const-string v3, "come|comes|coming|came"

    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_65

    add-int/2addr p1, v4

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge p1, v3, :cond_65

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    .line 83
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->key:Ljava/lang/String;

    const-string p1, "and|but|however"

    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_65

    return v0

    .line 84
    :cond_65
    const-string p0, "firstly|secondly|thirdly|finally|then"

    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_76

    const-string p0, "and|but|or"

    invoke-static {v2, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_76

    return v4

    .line 85
    :cond_76
    const-string p0, "(?i)(if|because|although|though|while|which|that|so|as|than|and|or|but|to|of|with|without|for|from|in|on|at|by|about|including|into|between|like|rather|whether|unless|until|before|after|where|when|what|who|how|more|less|not|no|its|their|his|her|this|that|a|an|the|every|each|any|some|another|firstly|secondly|thirdly)"

    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_7d
    :goto_7d
    return v0
.end method

.method static matches(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    .line 8
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->PATTERNS:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v0, p1, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/concurrent/ConcurrentHashMap;Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/regex/Pattern;

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    return p0
.end method

.method static plan(Lapp/yydarlinker/deepseekcaptions/RebuildSource;)Ljava/util/List;
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource;",
            ")",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 33
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    .line 35
    :goto_9
    iget-object v4, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_10a

    .line 37
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1a

    const-wide/16 v7, 0x1770

    goto :goto_1c

    :cond_1a
    const-wide/16 v7, 0x36b0

    :goto_1c
    const/4 v4, -0x1

    move v10, v2

    move v9, v3

    move v11, v9

    .line 38
    :goto_20
    iget-object v12, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    if-ge v9, v12, :cond_b5

    .line 39
    iget-object v12, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v12, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    .line 40
    iget-wide v13, v12, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->end:J

    iget-object v15, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v15, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    const-wide/16 v16, 0x1770

    iget-wide v5, v15, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    sub-long/2addr v13, v5

    if-le v9, v3, :cond_59

    sub-int v5, v9, v3

    const/16 v6, 0xa0

    if-ge v5, v6, :cond_b5

    const-wide/16 v5, 0x7530

    cmp-long v5, v13, v5

    if-gtz v5, :cond_b5

    .line 41
    iget-object v5, v12, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    .line 42
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v10

    const/16 v6, 0x640

    if-le v5, v6, :cond_59

    goto :goto_b5

    .line 45
    :cond_59
    iget-object v5, v12, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v10, v5

    .line 46
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_83

    cmp-long v5, v13, v16

    if-ltz v5, :cond_83

    add-int/lit8 v5, v9, 0x1

    iget-object v6, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_83

    invoke-static {v0, v9}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->safeCut(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result v5

    if-eqz v5, :cond_83

    invoke-static {v0, v9}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->resourceScore(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)I

    move-result v5

    const/16 v6, 0x32

    if-lt v5, v6, :cond_83

    goto :goto_b6

    .line 47
    :cond_83
    invoke-static {v0, v9}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->boundary(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result v5

    if-eqz v5, :cond_af

    cmp-long v4, v13, v7

    if-gez v4, :cond_ad

    add-int/lit8 v4, v9, 0x1

    .line 49
    iget-object v5, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-eq v4, v5, :cond_ad

    iget-object v5, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-wide v4, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    iget-wide v11, v12, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->end:J

    sub-long/2addr v4, v11

    const-wide/16 v11, 0x384

    cmp-long v4, v4, v11

    if-ltz v4, :cond_ab

    goto :goto_ad

    :cond_ab
    move v4, v9

    goto :goto_af

    :cond_ad
    :goto_ad
    move v4, v9

    goto :goto_b6

    :cond_af
    :goto_af
    add-int/lit8 v5, v9, 0x1

    move v11, v9

    move v9, v5

    goto/16 :goto_20

    :cond_b5
    :goto_b5
    move v9, v11

    :goto_b6
    if-lt v4, v3, :cond_b9

    goto :goto_fa

    :cond_b9
    add-int/lit8 v4, v9, 0x1

    .line 55
    iget-object v5, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_f9

    const/high16 v4, -0x80000000

    move v7, v4

    move v5, v9

    move v6, v5

    :goto_c8
    sub-int v8, v9, v3

    .line 57
    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v3

    if-le v6, v8, :cond_e1

    .line 58
    invoke-static {v0, v6}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->safeCut(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result v8

    if-nez v8, :cond_d6

    goto :goto_de

    .line 59
    :cond_d6
    invoke-static {v0, v6}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->resourceScore(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)I

    move-result v8

    if-le v8, v7, :cond_de

    move v5, v6

    move v7, v8

    :cond_de
    :goto_de
    add-int/lit8 v6, v6, -0x1

    goto :goto_c8

    :cond_e1
    if-eq v7, v4, :cond_e5

    move v4, v5

    goto :goto_fa

    .line 68
    :cond_e5
    invoke-static {v0, v9}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->dependentEnding(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result v4

    if-eqz v4, :cond_f9

    add-int/lit8 v4, v9, -0x1

    :goto_ed
    if-lt v4, v3, :cond_f9

    invoke-static {v0, v4}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->safeCut(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result v5

    if-eqz v5, :cond_f6

    goto :goto_fa

    :cond_f6
    add-int/lit8 v4, v4, -0x1

    goto :goto_ed

    :cond_f9
    move v4, v9

    .line 70
    :goto_fa
    new-instance v5, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v5, v6, v3, v4, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;-><init>(IIILapp/yydarlinker/deepseekcaptions/RebuildSource;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v4, 0x1

    goto/16 :goto_9

    .line 73
    :cond_10a
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static protectedCut(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z
    .registers 7

    const/4 v0, 0x0

    if-ltz p1, :cond_9d

    add-int/lit8 v1, p1, 0x1

    .line 98
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_9d

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->boundary(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result v2

    if-eqz v2, :cond_15

    goto/16 :goto_9d

    .line 99
    :cond_15
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v2, v2, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->key:Ljava/lang/String;

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->key:Ljava/lang/String;

    .line 100
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 101
    const-string v4, "(?i)(modernization picture|out past|ballistic missiles?|cruise missiles?|surface-to-air missiles?|aircraft carriers?|fifth generation|5th generation|generation (fighters?|aircraft)|korean peninsula|purchasing power|power parity)"

    invoke-static {v3, v4}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_47

    return v4

    .line 103
    :cond_47
    const-string v3, "than|then"

    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_62

    add-int/lit8 v3, p1, -0x23

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {p0, v3, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->text(II)Ljava/lang/String;

    move-result-object p0

    const-string p1, "(?s).*\\b(more|less|rather)\\b.*"

    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_62

    return v4

    .line 104
    :cond_62
    const-string p0, "past"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_73

    const-string p0, "[a-z][a-z-]+"

    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_73

    return v4

    .line 105
    :cond_73
    const-string p0, "universally"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_84

    const-string p0, "phased|replaced|adopted"

    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_84

    return v4

    .line 107
    :cond_84
    const-string p0, "[a-z][a-z\'-]+"

    invoke-static {v2, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_9d

    const-string p0, "and|or|but|then|also|was|were|is|are|be|been|being|has|have|had|can|could|will|would|not|never|that|which|who"

    invoke-static {v2, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_9d

    const-string p0, "reduced|increased|announced|decided|said|argued|explained|aims|plans"

    .line 108
    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_9d

    return v4

    :cond_9d
    :goto_9d
    return v0
.end method

.method static resourceScore(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)I
    .registers 6

    .line 112
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->key:Ljava/lang/String;

    .line 115
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->dependentEnding(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result v1

    if-nez v1, :cond_ca

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->protectedCut(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result v1

    if-nez v1, :cond_ca

    const-string v1, "(?i)(a|an|the|of|to|with|without|and|or|not|no|very|particularly|more|less|than|as)"

    .line 116
    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_ca

    const-string v1, "[+-]?[0-9].*"

    .line 117
    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_28

    goto/16 :goto_ca

    :cond_28
    add-int/lit8 v1, p1, 0x1

    .line 118
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    add-int/lit8 v3, p1, 0x7

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->text(II)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 119
    const-string v3, "^(if|because|although|unless|but|while|however|whereas|instead|secondly|thirdly|finally)\\b.*"

    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c7

    const-string v3, "^and (then|so|finally|critically|yet|i|we|it|this|that)\\b.*"

    .line 120
    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_54

    goto/16 :goto_c7

    .line 121
    :cond_54
    const-string v3, "^(it|this|that|they|we|he|she|i) (is|was|were|are|has|have|had|will|would|can|could|do|did)\\b.*"

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c4

    const-string v3, "^(the|a|an) [a-z]+(?: [a-z]+)? (is|was|were|are|has|have|had|will|would|can|could)\\b.*"

    .line 124
    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c4

    const-string v3, "^[a-z][a-z\'-]+ (reduced|increased|announced|decided|said|argued|explained|aims|plans)\\b.*"

    .line 125
    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c4

    const-string v3, "^in [12][0-9]{3} (?:[a-z]+ ){1,2}(?:could|can|had|has|was|were|is|are)\\b.*"

    .line 126
    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c4

    const-string v3, "^the (reality|creation|question|point|goal|reason|problem|result|argument)\\b.*"

    .line 127
    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->matches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c4

    const-string v3, "i\'m "

    .line 128
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c4

    const-string v3, "let\'s "

    .line 129
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8d

    goto :goto_c4

    .line 130
    :cond_8d
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c1

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a6

    goto :goto_c1

    .line 131
    :cond_a6
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget p1, p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->cue:I

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->cue:I

    if-eq p1, p0, :cond_bf

    const/16 p0, 0xa

    return p0

    :cond_bf
    const/4 p0, 0x0

    return p0

    :cond_c1
    :goto_c1
    const/16 p0, 0x1e

    return p0

    :cond_c4
    :goto_c4
    const/16 p0, 0x32

    return p0

    :cond_c7
    :goto_c7
    const/16 p0, 0x3c

    return p0

    :cond_ca
    :goto_ca
    const/16 p0, -0x64

    return p0
.end method

.method static safeCut(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z
    .registers 3

    if-ltz p1, :cond_18

    .line 94
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_18

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->dependentEnding(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result v0

    if-nez v0, :cond_18

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->protectedCut(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result p0

    if-nez p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method static strongDependentEnding(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z
    .registers 3

    .line 89
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->boundary(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return p0

    .line 90
    :cond_8
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->key:Ljava/lang/String;

    const-string p1, "(?i)(if|because|although|unless|whether|including|the|an)"

    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
