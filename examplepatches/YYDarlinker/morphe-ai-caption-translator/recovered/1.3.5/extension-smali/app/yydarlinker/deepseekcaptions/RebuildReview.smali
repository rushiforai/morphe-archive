.class final Lapp/yydarlinker/deepseekcaptions/RebuildReview;
.super Ljava/lang/Object;
.source "RebuildReview.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;
    }
.end annotation


# static fields
.field static final MAX_SESSION_REPAIRS:I = 0x6


# direct methods
.method constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static blocked(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;)Z
    .registers 5

    .line 121
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_52

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v2, "layout_overflow"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_44

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v2, "paragraph"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_44

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v2, "possible_polarity_change"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_44

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v2, "possible_arithmetic_misread"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_44

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v2, "possible_subject_attachment"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_44
    iget v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->from:I

    iget v2, p1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    if-gt v1, v2, :cond_6

    iget v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->to:I

    iget v1, p1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    if-lt v0, v1, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_52
    const/4 p0, 0x0

    return p0
.end method

.method private static incompleteSourceEnd(Ljava/lang/String;)Z
    .registers 2

    .line 104
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 105
    const-string v0, "(?s).*\\b(?:have|has|had|is|are|was|were|be|been|being|will|would|can|could|should|might|must|and|or|but|because|if|while|that|which|who|than|then|with|of|to|for|from|in|on|at|by|as|after|before|every|a|an|the|more|less|not)\\b"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static inspect(Lapp/yydarlinker/deepseekcaptions/RebuildSource;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;Ljava/util/List;)Ljava/util/List;
    .registers 35
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource;",
            "Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;",
            ">;)",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 19
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 21
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4b7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;

    .line 22
    iget v10, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v11, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    invoke-virtual {v0, v10, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->text(II)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->text:Ljava/lang/String;

    .line 23
    invoke-static {v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->chinese(Ljava/lang/String;)Z

    move-result v12

    .line 24
    const-string v13, "\\s+"

    invoke-virtual {v10, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    array-length v13, v13

    .line 25
    invoke-static {v11}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;)Ljava/util/stream/IntStream;

    move-result-object v14

    new-instance v15, Lapp/yydarlinker/deepseekcaptions/RebuildReview$$ExternalSyntheticLambda2;

    invoke-direct {v15}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$$ExternalSyntheticLambda2;-><init>()V

    invoke-static {v14, v15}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/stream/IntStream;Ljava/util/function/IntPredicate;)Ljava/util/stream/IntStream;

    move-result-object v14

    invoke-static {v14}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/stream/IntStream;)J

    move-result-wide v14

    .line 26
    invoke-static {v11}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;)Ljava/util/stream/IntStream;

    move-result-object v8

    const/16 v16, 0x1

    new-instance v9, Lapp/yydarlinker/deepseekcaptions/RebuildReview$$ExternalSyntheticLambda3;

    invoke-direct {v9}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$$ExternalSyntheticLambda3;-><init>()V

    invoke-static {v8, v9}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/stream/IntStream;Ljava/util/function/IntPredicate;)Ljava/util/stream/IntStream;

    move-result-object v8

    invoke-static {v8}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/stream/IntStream;)J

    move-result-wide v8

    long-to-int v8, v8

    .line 27
    const-string v9, "(?s).*[a-zA-Z]{3}.*"

    invoke-virtual {v10, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6f

    invoke-static {v10}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;)Ljava/util/stream/IntStream;

    move-result-object v9

    new-instance v4, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$$ExternalSyntheticLambda5;

    invoke-direct {v4}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$$ExternalSyntheticLambda5;-><init>()V

    invoke-static {v9, v4}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/stream/IntStream;Ljava/util/function/IntPredicate;)Z

    move-result v4

    if-nez v4, :cond_6f

    move/from16 v4, v16

    goto :goto_70

    :cond_6f
    const/4 v4, 0x0

    :goto_70
    const/4 v9, 0x6

    if-le v13, v9, :cond_79

    const-wide/16 v17, 0x7

    cmp-long v9, v14, v17

    if-gtz v9, :cond_7b

    :cond_79
    add-int/lit8 v5, v5, 0x1

    :cond_7b
    if-eqz v4, :cond_98

    if-eqz v12, :cond_98

    const/16 v9, 0x18

    if-lt v13, v9, :cond_98

    move-object v9, v3

    move/from16 v17, v4

    long-to-double v3, v14

    move-wide/from16 v18, v3

    int-to-double v3, v13

    const-wide v20, 0x3fe999999999999aL    # 0.8

    mul-double v3, v3, v20

    cmpg-double v3, v18, v3

    if-gez v3, :cond_9b

    move/from16 v3, v16

    goto :goto_9c

    :cond_98
    move-object v9, v3

    move/from16 v17, v4

    :cond_9b
    const/4 v3, 0x0

    .line 30
    :goto_9c
    const-string v4, "\\b(?:cannot|can\'t|couldn\'t|won\'t|never)\\b"

    invoke-static {v4, v10}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    move/from16 v18, v3

    .line 31
    const-string v3, "\u4e0d|\u6ca1|\u672a|\u65e0|\u96e3|\u96be|\u975e|\u52ff|\u5426|\u4f11\u60f3|\u522b\u60f3"

    invoke-static {v3, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v18, :cond_c9

    if-eqz v4, :cond_c9

    if-nez v3, :cond_c9

    .line 33
    new-instance v19, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v23, "Source contains a negative conclusion but this short translation may omit it. Re-read every predicate, object, condition and modality; retain the conclusion without summarizing."

    const/16 v24, 0x1

    const-string v22, "possible_omission"

    move/from16 v20, v3

    move/from16 v21, v4

    invoke-direct/range {v19 .. v24}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v19

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e3

    :cond_c9
    if-eqz v18, :cond_e3

    .line 35
    new-instance v18, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v22, "Unusually short translation for this source; not proof of omission."

    const/16 v23, 0x0

    const-string v21, "compression_watch"

    move/from16 v19, v3

    move/from16 v20, v4

    invoke-direct/range {v18 .. v23}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v18

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_e3
    :goto_e3
    if-eqz v17, :cond_118

    if-eqz v12, :cond_118

    const/16 v3, 0xc

    if-lt v13, v3, :cond_118

    int-to-long v3, v13

    cmp-long v3, v14, v3

    if-gez v3, :cond_118

    .line 36
    const-string v3, "\\b(?:could|can) reach (?:the )?[a-z]+(?: [a-z]+){0,2} with\\b"

    .line 37
    invoke-static {v3, v10}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_118

    const-string v3, "\u8fbe|\u53ca|\u8986\u76d6|\u8986\u84cb|\u5c04\u7a0b|\u89e6|\u89f8|\u62b5|\u5230|\u6253\u51fb|\u6253\u64ca"

    .line 38
    invoke-static {v3, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_118

    .line 39
    new-instance v18, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v22, "Check the source reach/place relation and its object; translation may retain equipment but omit where it can reach."

    const/16 v23, 0x1

    const-string v21, "possible_relation_omission"

    move/from16 v19, v3

    move/from16 v20, v4

    invoke-direct/range {v18 .. v23}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v18

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_118
    if-eqz v17, :cond_144

    if-eqz v12, :cond_144

    .line 40
    const-string v3, "(?i)(?:aren\'t|isn\'t|not) always"

    invoke-static {v3, v10}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_144

    const-string v3, "\u901a\u5e38\u4e0d|\u4e00\u822c\u4e0d|\u5f80\u5f80\u4e0d"

    invoke-static {v3, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_144

    .line 41
    new-instance v18, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v22, "Not always means not in every case, not usually not. Preserve the quantifier scope."

    const/16 v23, 0x1

    const-string v21, "possible_polarity_change"

    move/from16 v19, v3

    move/from16 v20, v4

    invoke-direct/range {v18 .. v23}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v18

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_144
    if-eqz v17, :cond_178

    if-eqz v12, :cond_178

    .line 42
    const-string v3, "(?i)a product of"

    invoke-static {v3, v10}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_178

    const-string v3, "\u4e58\u79ef|\u76f8\u4e58"

    invoke-static {v3, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_178

    const-string v3, "(?i)multiply|multiplication|equation|mathematical"

    invoke-static {v3, v10}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_178

    .line 43
    new-instance v18, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v22, "Product of may express dependence rather than multiplication. Read the revenue/sales relationship in context."

    const/16 v23, 0x1

    const-string v21, "possible_arithmetic_misread"

    move/from16 v19, v3

    move/from16 v20, v4

    invoke-direct/range {v18 .. v23}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v18

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_178
    if-eqz v17, :cond_1a4

    if-eqz v12, :cond_1a4

    .line 44
    const-string v3, "(?is).*\\bwould follow [a-z\'-]+ reduced\\b.*"

    invoke-virtual {v10, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1a4

    const-string v3, "\u4e4b\u540e|\u4e4b\u5f8c"

    invoke-static {v3, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1a4

    .line 45
    new-instance v18, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v22, "A new subject followed by reduced may start a new clause after would follow. Preserve the actor of the reduction; do not attach that actor to the prior relative clause."

    const/16 v23, 0x1

    const-string v21, "possible_subject_attachment"

    move/from16 v19, v3

    move/from16 v20, v4

    invoke-direct/range {v18 .. v23}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v18

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1a4
    if-eqz v17, :cond_1d4

    if-eqz v12, :cond_1d4

    .line 46
    const-string v3, "(?s).*(?:\u5ef6\u4f38\u81f3|\u5ef6\u4f38\u5230|\u8fbe\u5230|\u53d6\u51b3\u4e8e)[\uff0c\u3002\uff1b]?$"

    invoke-virtual {v11, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1d4

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    add-int/lit8 v3, v3, 0x1

    iget-object v4, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_1d4

    .line 47
    new-instance v18, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v22, "The target ends with an incomplete relation. Retain its source-owned complement, using neighboring context only to understand it."

    const/16 v23, 0x1

    const-string v21, "open_complement"

    move/from16 v19, v3

    move/from16 v20, v4

    invoke-direct/range {v18 .. v23}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v18

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    :cond_1d4
    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    if-lez v3, :cond_1ea

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    add-int/lit8 v3, v3, -0x30

    const/4 v4, 0x0

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v3, v4}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->text(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_1ec

    :cond_1ea
    const-string v3, ""

    :goto_1ec
    if-eqz v17, :cond_220

    if-eqz v12, :cond_220

    .line 49
    const-string v4, "(?is)^(?:(?:than|then) )?they are with\\b.*"

    invoke-virtual {v10, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_220

    const-string v4, "\\b(?:more|less)\\b[\\s\\S]{0,260}\\b(?:than|then)\\s*$"

    .line 50
    invoke-static {v4, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_220

    const-string v3, "\u4e00\u8d77|\u5171\u540c|\u4e00\u540c"

    .line 51
    invoke-static {v3, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_220

    .line 52
    new-instance v18, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v22, "Context compares reactions to A versus B; this fragment may not mean jointly participating with B. Preserve comparison direction and resolve ASR then/than without editing source."

    const/16 v23, 0x1

    const-string v21, "possible_comparison_misread"

    move/from16 v19, v3

    move/from16 v20, v4

    invoke-direct/range {v18 .. v23}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v18

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_220
    if-eqz v17, :cond_22b

    .line 54
    invoke-static {v10}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->incompleteSourceEnd(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_22b

    move/from16 v3, v16

    goto :goto_22c

    :cond_22b
    const/4 v3, 0x0

    :goto_22c
    if-eqz v17, :cond_24f

    .line 55
    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    move/from16 v18, v3

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "(?:and|but|then|well)\\b.*"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_251

    const-wide/16 v3, 0x6

    cmp-long v3, v14, v3

    if-lez v3, :cond_24c

    const/16 v3, 0x8

    if-gt v8, v3, :cond_251

    :cond_24c
    move/from16 v3, v16

    goto :goto_252

    :cond_24f
    move/from16 v18, v3

    :cond_251
    const/4 v3, 0x0

    :goto_252
    const-wide/16 v19, 0x708

    const/4 v8, 0x3

    if-eqz v17, :cond_28d

    if-eqz v12, :cond_28d

    if-lt v13, v8, :cond_28d

    move/from16 v21, v5

    .line 57
    iget-wide v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->end:J

    move-object/from16 v23, v9

    iget-wide v8, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->start:J

    sub-long/2addr v4, v8

    cmp-long v4, v4, v19

    if-gez v4, :cond_291

    const-wide/16 v4, 0x4

    cmp-long v4, v14, v4

    if-gtz v4, :cond_291

    if-nez v18, :cond_272

    if-eqz v3, :cond_291

    .line 58
    :cond_272
    new-instance v25, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v29, "Source ends or begins at a grammatical dependency, while the translation is too short to carry the predicate and its argument. Join it with a coherent neighboring source range; do not split target text to create times."

    const/16 v30, 0x1

    const-string v28, "fragmentary_translation"

    move/from16 v26, v3

    move/from16 v27, v4

    invoke-direct/range {v25 .. v30}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v25

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_2f2

    :cond_28d
    move/from16 v21, v5

    move-object/from16 v23, v9

    :cond_291
    const-wide/16 v3, 0x2

    if-eqz v17, :cond_2c2

    if-eqz v12, :cond_2c2

    cmp-long v5, v14, v3

    if-gtz v5, :cond_2c2

    const/4 v5, 0x3

    if-lt v13, v5, :cond_2c2

    .line 60
    iget-wide v8, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->end:J

    move-wide/from16 v24, v3

    iget-wide v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->start:J

    sub-long/2addr v8, v3

    cmp-long v3, v8, v19

    if-gez v3, :cond_2c4

    .line 61
    new-instance v26, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v30, "Very short translation for multiple source words. Check that the predicate and its argument have not been lost; join only by reassigning coherent source ranges."

    const/16 v31, 0x0

    const-string v29, "fragmentary_translation"

    move/from16 v27, v3

    move/from16 v28, v4

    invoke-direct/range {v26 .. v31}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v26

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2f2

    :cond_2c2
    move-wide/from16 v24, v3

    :cond_2c4
    if-eqz v17, :cond_2f2

    if-eqz v12, :cond_2f2

    cmp-long v3, v14, v24

    if-gtz v3, :cond_2f2

    const/4 v3, 0x2

    if-lt v13, v3, :cond_2f2

    .line 62
    iget-wide v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->end:J

    iget-wide v8, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->start:J

    sub-long/2addr v3, v8

    const-wide/16 v8, 0x3e8

    cmp-long v3, v3, v8

    if-gez v3, :cond_2f2

    .line 63
    new-instance v24, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v28, "Sub-second isolated discourse marker; inspect neighboring source/target continuity without assuming omission."

    const/16 v29, 0x0

    const-string v27, "micro_event_watch"

    move/from16 v25, v3

    move/from16 v26, v4

    invoke-direct/range {v24 .. v29}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v24

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2f2
    :goto_2f2
    if-eqz v17, :cond_323

    if-eqz v12, :cond_323

    const/16 v3, 0x19

    if-lt v13, v3, :cond_323

    const-wide/16 v3, 0x20

    cmp-long v3, v14, v3

    if-ltz v3, :cond_323

    .line 64
    iget-wide v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->end:J

    iget-wide v8, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->start:J

    sub-long/2addr v3, v8

    const-wide/16 v8, 0x1f40

    cmp-long v3, v3, v8

    if-ltz v3, :cond_323

    .line 65
    new-instance v24, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v28, "Long multi-clause caption; verify readable timing and coherent source boundaries at the preferred font."

    const/16 v29, 0x0

    const-string v27, "dense_long_event_watch"

    move/from16 v25, v3

    move/from16 v26, v4

    invoke-direct/range {v24 .. v29}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v24

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_323
    if-eqz v17, :cond_34f

    if-eqz v12, :cond_34f

    .line 66
    const-string v3, "\\blicensed or unlicensed\\b"

    invoke-static {v3, v10}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_34f

    const-string v3, "\u5408\u6cd5.*\u975e\u6cd5|\u975e\u6cd5.*\u5408\u6cd5"

    .line 67
    invoke-static {v3, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_34f

    .line 68
    new-instance v24, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v28, "Licensed/unlicensed means authorized/unauthorized, not necessarily legal/illegal; check source meaning and repair the wording if needed."

    const/16 v29, 0x1

    const-string v27, "possible_authorization_expansion"

    move/from16 v25, v3

    move/from16 v26, v4

    invoke-direct/range {v24 .. v29}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v24

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_34f
    if-eqz v17, :cond_37b

    if-eqz v12, :cond_37b

    .line 69
    const-string v3, "\\btank fleet\\b"

    invoke-static {v3, v10}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_37b

    const-string v3, "\u5766\u514b\u8230\u961f|\u5766\u514b\u8266\u968a"

    .line 70
    invoke-static {v3, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_37b

    .line 71
    new-instance v24, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v28, "Tank fleet means the tanks as a force, not a naval fleet; preserve the intended military unit and repair the wording."

    const/16 v29, 0x1

    const-string v27, "possible_equipment_term"

    move/from16 v25, v3

    move/from16 v26, v4

    invoke-direct/range {v24 .. v29}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v24

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    :cond_37b
    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    iget v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->to:I

    if-ge v3, v4, :cond_3a1

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->protectedCut(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result v3

    if-eqz v3, :cond_3a1

    .line 73
    new-instance v24, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v28, "Boundary may split a noun phrase, comparison or subject+verb. Reassign coherent SOURCE ranges, then translate each whole range; never divide target text to create times."

    const/16 v29, 0x1

    const-string v27, "dependent_boundary"

    move/from16 v25, v3

    move/from16 v26, v4

    invoke-direct/range {v24 .. v29}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v24

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    :cond_3a1
    const-string v3, "\\b(\\d{1,3}) (\\d{1,2})\\b"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 76
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_461

    move/from16 v4, v16

    .line 77
    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    .line 78
    new-instance v24, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v8, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v28, "Adjacent source numbers; do not silently invent a range or model identifier."

    const/16 v29, 0x0

    const-string v27, "source_number_ambiguity"

    move/from16 v25, v4

    move/from16 v26, v8

    invoke-direct/range {v24 .. v29}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v4, v24

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v8, "(?<![0-9])"

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "(?![0-9])"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    .line 80
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v4, :cond_40a

    if-nez v8, :cond_422

    .line 82
    :cond_40a
    new-instance v24, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v8, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v28, "Original ASR has two adjacent numbers; translation omits at least one. Keep the uncertainty explicit rather than silently selecting one."

    const/16 v29, 0x1

    const-string v27, "possible_number_loss"

    move/from16 v25, v4

    move/from16 v26, v8

    invoke-direct/range {v24 .. v29}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v4, v24

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    :cond_422
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v8, "(?s)(?<![0-9])"

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\\s*(?:\u81f3|\u5230|[-\u2014~]|\u578b|\u578b\u53f7|\u53f7|\u67b6|\u8258|\u8f86|\u679a)\\s*"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 84
    invoke-static {v3, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_461

    .line 85
    new-instance v24, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v3, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v28, "Adjacent source numbers were joined as a range, model, or unit relation that the source does not state. Preserve the unresolved ASR locally."

    const/16 v29, 0x1

    const-string v27, "possible_number_range_invention"

    move/from16 v25, v3

    move/from16 v26, v4

    invoke-direct/range {v24 .. v29}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v3, v24

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_461
    if-eqz v12, :cond_4a6

    const/4 v3, 0x0

    .line 87
    :goto_464
    sget-object v4, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->ANCHORS:[[Ljava/lang/String;

    array-length v4, v4

    if-ge v3, v4, :cond_4a6

    .line 88
    sget-object v4, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->ANCHORS:[[Ljava/lang/String;

    aget-object v4, v4, v3

    const/16 v16, 0x1

    aget-object v4, v4, v16

    invoke-static {v4, v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->has(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4a3

    .line 89
    invoke-static {v3, v10}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->supports(ILjava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4a3

    iget v4, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->from:I

    iget v5, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->to:I

    .line 90
    invoke-virtual {v0, v4, v5}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->text(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;->supports(ILjava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4a3

    .line 91
    new-instance v24, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v4, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v5, v7, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v28, "Entity ownership is uncertain (possible synonym/reference); not a hard rejection or automatic repair."

    const/16 v29, 0x0

    const-string v27, "anchor_unknown"

    move/from16 v25, v4

    move/from16 v26, v5

    invoke-direct/range {v24 .. v29}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v4, v24

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4a3
    add-int/lit8 v3, v3, 0x1

    goto :goto_464

    .line 92
    :cond_4a6
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    const/16 v4, 0x10

    if-lt v3, v4, :cond_4b1

    move/from16 v5, v21

    goto :goto_4b7

    :cond_4b1
    move/from16 v5, v21

    move-object/from16 v3, v23

    goto/16 :goto_f

    .line 94
    :cond_4b7
    :goto_4b7
    iget v0, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->to:I

    iget v3, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->from:I

    sub-int/2addr v0, v3

    const/4 v4, 0x1

    add-int/2addr v0, v4

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-double v7, v0

    .line 95
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-double v9, v0

    div-double/2addr v7, v9

    .line 96
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    const/16 v3, 0x10

    if-ge v0, v3, :cond_50b

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v0

    const/16 v3, 0x9

    if-lt v0, v3, :cond_50b

    const-wide/high16 v9, 0x4022000000000000L    # 9.0

    cmpg-double v0, v7, v9

    if-gez v0, :cond_50b

    mul-int/lit8 v5, v5, 0x64

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x3c

    if-lt v5, v0, :cond_50b

    if-gtz v6, :cond_4fa

    .line 97
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v0

    const/16 v3, 0xe

    if-lt v0, v3, :cond_4f8

    goto :goto_4fa

    :cond_4f8
    const/4 v10, 0x0

    goto :goto_4fb

    :cond_4fa
    :goto_4fa
    move v10, v4

    .line 98
    :goto_4fb
    new-instance v5, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v6, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->from:I

    iget v7, v1, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->to:I

    const-string v8, "fragmented_plan"

    const-string v9, "The block is over-segmented into many short events. Prefer fewer clause-complete events; never split discourse markers, auxiliaries, or complements merely to follow estimated word times."

    invoke-direct/range {v5 .. v10}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    :cond_50b
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$inspect$0(I)Z
    .registers 2

    .line 25
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

.method static synthetic lambda$inspect$1(I)Z
    .registers 1

    .line 26
    invoke-static {p0}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method static prefer(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;
    .registers 4

    if-nez p0, :cond_3

    goto :goto_3a

    .line 146
    :cond_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->semanticScore(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)I

    move-result v0

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->semanticScore(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)I

    move-result v1

    if-eq v0, v1, :cond_10

    if-ge v0, v1, :cond_3a

    goto :goto_3b

    .line 148
    :cond_10
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->segmentationPenalty(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)I

    move-result v0

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->segmentationPenalty(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)I

    move-result v1

    if-eq v0, v1, :cond_1d

    if-ge v1, v0, :cond_3b

    goto :goto_3a

    .line 150
    :cond_1d
    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->score(Ljava/util/List;)I

    move-result v0

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->score(Ljava/util/List;)I

    move-result v1

    if-ne v0, v1, :cond_2c

    goto :goto_3b

    .line 151
    :cond_2c
    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->score(Ljava/util/List;)I

    move-result v0

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->score(Ljava/util/List;)I

    move-result v1

    if-ge v0, v1, :cond_3b

    :cond_3a
    :goto_3a
    return-object p1

    :cond_3b
    :goto_3b
    return-object p0
.end method

.method static repair(Ljava/util/List;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Advisory fidelity review, not a proven error. Check these ranges against source and context; preserve already correct meanings. "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_b
    :goto_b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget-boolean v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->repair:Z

    if-eqz v2, :cond_b

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-virtual {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->describe()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    const/16 v3, 0x4b0

    if-le v2, v3, :cond_2d

    goto :goto_3a

    :cond_2d
    invoke-virtual {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->describe()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 128
    :cond_3a
    :goto_3a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static score(Ljava/util/List;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;",
            ">;)I"
        }
    .end annotation

    .line 124
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :cond_5
    :goto_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget-boolean v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->repair:Z

    if-eqz v1, :cond_5

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_18
    return v0
.end method

.method private static segmentationPenalty(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)I
    .registers 5

    .line 137
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :cond_7
    :goto_7
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    .line 138
    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v3, "fragmented_plan"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    add-int/lit8 v0, v0, 0x3

    goto :goto_7

    .line 139
    :cond_20
    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v3, "fragmentary_translation"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    add-int/lit8 v0, v0, 0x2

    goto :goto_7

    .line 140
    :cond_2d
    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v2, "micro_event_watch"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_3a
    return v0
.end method

.method private static semanticScore(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)I
    .registers 5

    .line 132
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :cond_7
    :goto_7
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_42

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget-boolean v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->repair:Z

    if-eqz v2, :cond_7

    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v3, "layout_overflow"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v3, "paragraph"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v3, "fragmented_plan"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v2, "fragmentary_translation"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_42
    return v0
.end method

.method static shouldRepair(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;IIJJ)Z
    .registers 7

    .line 164
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->score(Ljava/util/List;)I

    move-result p0

    if-lez p0, :cond_14

    const/4 p0, 0x2

    if-ge p1, p0, :cond_14

    const/4 p0, 0x6

    if-ge p2, p0, :cond_14

    cmp-long p0, p3, p5

    if-gez p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method static structuralRetry(Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    :cond_4
    const/16 v1, 0x3b

    .line 156
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_10

    .line 157
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 158
    :cond_10
    const-string v1, "source_quote_mismatch"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_42

    const-string v1, "source_coverage"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_42

    const-string v1, "missing_source"

    .line 159
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_42

    const-string v1, "crosses_source_break"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_42

    const-string v1, "block_identity"

    .line 160
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_42

    const-string v1, "source_quote_required"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_41

    goto :goto_42

    :cond_41
    return v0

    :cond_42
    :goto_42
    const/4 p0, 0x1

    return p0
.end method

.method static uncertainNumbers(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;)Z
    .registers 5

    .line 117
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    const-string v2, "source_number_ambiguity"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    iget v1, v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->from:I

    iget v2, p1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    if-gt v1, v2, :cond_6

    iget v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->to:I

    iget v1, p1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    if-lt v0, v1, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_2a
    const/4 p0, 0x0

    return p0
.end method

.method static withLayoutReview(Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;Ljava/util/function/Predicate;)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;",
            "Ljava/util/function/Predicate<",
            "Ljava/lang/String;",
            ">;)",
            "Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;"
        }
    .end annotation

    if-nez p1, :cond_3

    goto :goto_42

    .line 110
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 111
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->events:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_10
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;

    .line 112
    iget-object v3, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->text:Ljava/lang/String;

    invoke-static {p1, v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/function/Predicate;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_10

    .line 113
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;

    iget v5, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    iget v6, v2, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    const-string v8, "This event does not fit the current measured caption budget; keep the complete event and repair its SOURCE boundary rather than rejecting the whole block."

    const/4 v9, 0x1

    const-string v7, "layout_overflow"

    invoke-direct/range {v4 .. v9}, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 114
    :cond_36
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne p1, v1, :cond_43

    :goto_42
    return-object p0

    :cond_43
    new-instance p1, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->events:Ljava/util/List;

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->json:Ljava/lang/String;

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->reboundEvents:I

    invoke-direct {p1, v1, v2, v0, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;I)V

    return-object p1
.end method
