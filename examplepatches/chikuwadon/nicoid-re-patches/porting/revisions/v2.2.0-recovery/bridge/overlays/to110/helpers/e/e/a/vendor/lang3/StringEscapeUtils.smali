.class public Le/e/a/vendor/lang3/StringEscapeUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final UNESCAPE_HTML4:Le/e/a/vendor/lang3/text/translate/AggregateTranslator;


# direct methods
.method static constructor <clinit>()V
    .registers 53

    .line 111
    new-instance v0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    const-string v1, "\""

    const-string v2, "\\\""

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\"

    const-string v5, "\\\\"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v6

    filled-new-array {v3, v6}, [[Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v3, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 461
    sget-object v6, Le/e/a/vendor/lang3/text/translate/EntityArrays;->JAVA_CTRL_CHARS_ESCAPE:[[Ljava/lang/String;

    invoke-virtual {v6}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [[Ljava/lang/String;

    .line 117
    invoke-direct {v3, v7}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    const/4 v7, 0x1

    new-array v8, v7, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    const/4 v9, 0x0

    aput-object v3, v8, v9

    const/4 v3, 0x2

    .line 144
    new-array v10, v3, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 145
    aput-object v0, v10, v9

    .line 146
    new-instance v0, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;

    .line 1489
    invoke-static {v8, v9, v10, v7, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 146
    invoke-direct {v0, v10}, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;-><init>([Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;)V

    .line 75
    new-instance v8, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;

    .line 57
    invoke-direct {v8, v9}, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;-><init>(B)V

    .line 119
    new-array v10, v7, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    aput-object v8, v10, v9

    .line 144
    new-array v8, v3, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 145
    aput-object v0, v8, v9

    .line 1489
    invoke-static {v10, v9, v8, v7, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1611
    invoke-virtual {v8}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 44
    check-cast v0, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 131
    new-instance v0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    const-string v8, "\'"

    const-string v10, "\\\'"

    filled-new-array {v8, v10}, [Ljava/lang/String;

    move-result-object v11

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v12

    const-string v13, "`"

    const-string v14, "\\`"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "${"

    const-string v15, "\\${"

    filled-new-array {v14, v15}, [Ljava/lang/String;

    move-result-object v14

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v15

    move/from16 v17, v7

    const-string v7, "/"

    move/from16 v18, v3

    const-string v3, "\\/"

    filled-new-array {v7, v3}, [Ljava/lang/String;

    move-result-object v16

    filled-new-array/range {v11 .. v16}, [[Ljava/lang/String;

    move-result-object v11

    invoke-direct {v0, v11}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v11, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 461
    invoke-virtual {v6}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [[Ljava/lang/String;

    .line 142
    invoke-direct {v11, v12}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    .line 75
    new-instance v12, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;

    .line 57
    invoke-direct {v12, v9}, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;-><init>(B)V

    const/4 v13, 0x3

    .line 143
    new-array v14, v13, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    aput-object v0, v14, v9

    aput-object v11, v14, v17

    aput-object v12, v14, v18

    .line 1611
    invoke-virtual {v14}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 44
    check-cast v0, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 155
    new-instance v0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v11

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v12

    filled-new-array {v7, v3}, [Ljava/lang/String;

    move-result-object v3

    filled-new-array {v11, v12, v3}, [[Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v3, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 461
    invoke-virtual {v6}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[Ljava/lang/String;

    .line 163
    invoke-direct {v3, v6}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    .line 75
    new-instance v6, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;

    .line 57
    invoke-direct {v6, v9}, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;-><init>(B)V

    .line 164
    new-array v7, v13, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    aput-object v0, v7, v9

    aput-object v3, v7, v17

    aput-object v6, v7, v18

    .line 1611
    invoke-virtual {v7}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 44
    check-cast v0, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 178
    new-instance v0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 364
    sget-object v3, Le/e/a/vendor/lang3/text/translate/EntityArrays;->APOS_ESCAPE:[[Ljava/lang/String;

    invoke-virtual {v3}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[Ljava/lang/String;

    .line 180
    invoke-direct {v0, v6}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v6, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 386
    sget-object v7, Le/e/a/vendor/lang3/text/translate/EntityArrays;->BASIC_ESCAPE:[[Ljava/lang/String;

    invoke-virtual {v7}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[Ljava/lang/String;

    .line 181
    invoke-direct {v6, v11}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    move/from16 v11, v18

    new-array v12, v11, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    aput-object v0, v12, v9

    aput-object v6, v12, v17

    .line 1611
    invoke-virtual {v12}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 44
    check-cast v0, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 193
    new-instance v0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 364
    invoke-virtual {v3}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[Ljava/lang/String;

    .line 195
    invoke-direct {v0, v6}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v6, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 386
    invoke-virtual {v7}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[Ljava/lang/String;

    .line 196
    invoke-direct {v6, v11}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v11, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    const-string v12, "\u0000"

    const-string v14, ""

    filled-new-array {v12, v14}, [Ljava/lang/String;

    move-result-object v19

    const-string v15, "\u0001"

    filled-new-array {v15, v14}, [Ljava/lang/String;

    move-result-object v20

    const-string v15, "\u0002"

    filled-new-array {v15, v14}, [Ljava/lang/String;

    move-result-object v21

    const-string v15, "\u0003"

    filled-new-array {v15, v14}, [Ljava/lang/String;

    move-result-object v22

    const-string v15, "\u0004"

    filled-new-array {v15, v14}, [Ljava/lang/String;

    move-result-object v23

    const-string v15, "\u0005"

    filled-new-array {v15, v14}, [Ljava/lang/String;

    move-result-object v24

    const-string v15, "\u0006"

    filled-new-array {v15, v14}, [Ljava/lang/String;

    move-result-object v25

    const-string v15, "\u0007"

    filled-new-array {v15, v14}, [Ljava/lang/String;

    move-result-object v26

    const-string v15, "\u0008"

    filled-new-array {v15, v14}, [Ljava/lang/String;

    move-result-object v27

    const-string v15, "\u000b"

    filled-new-array {v15, v14}, [Ljava/lang/String;

    move-result-object v28

    move/from16 v16, v9

    const-string v9, "\u000c"

    filled-new-array {v9, v14}, [Ljava/lang/String;

    move-result-object v29

    move/from16 v50, v13

    const-string v13, "\u000e"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v30

    const-string v13, "\u000f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v31

    const-string v13, "\u0010"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v32

    const-string v13, "\u0011"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v33

    const-string v13, "\u0012"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v34

    const-string v13, "\u0013"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v35

    const-string v13, "\u0014"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v36

    const-string v13, "\u0015"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v37

    const-string v13, "\u0016"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v38

    const-string v13, "\u0017"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v39

    const-string v13, "\u0018"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v40

    const-string v13, "\u0019"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v41

    const-string v13, "\u001a"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v42

    const-string v13, "\u001b"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v43

    const-string v13, "\u001c"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v44

    const-string v13, "\u001d"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v45

    const-string v13, "\u001e"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v46

    const-string v13, "\u001f"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v47

    const-string/jumbo v13, "\ufffe"

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v48

    move-object/from16 v51, v0

    const-string/jumbo v0, "\uffff"

    filled-new-array {v0, v14}, [Ljava/lang/String;

    move-result-object v49

    move-object/from16 v52, v3

    filled-new-array/range {v19 .. v49}, [[Ljava/lang/String;

    move-result-object v3

    invoke-direct {v11, v3}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    .line 61
    new-instance v3, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;

    move-object/from16 v19, v6

    const/16 v6, 0x7f

    move-object/from16 v20, v7

    const/16 v7, 0x84

    invoke-direct {v3, v6, v7}, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;-><init>(II)V

    .line 61
    new-instance v6, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;

    const/16 v7, 0x86

    move-object/from16 v23, v3

    const/16 v3, 0x9f

    invoke-direct {v6, v7, v3}, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;-><init>(II)V

    .line 232
    new-instance v3, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;

    move/from16 v7, v17

    .line 57
    invoke-direct {v3, v7}, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;-><init>(B)V

    const/4 v7, 0x6

    move-object/from16 v26, v3

    .line 232
    new-array v3, v7, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    aput-object v51, v3, v16

    aput-object v19, v3, v17

    const/16 v18, 0x2

    aput-object v11, v3, v18

    aput-object v23, v3, v50

    const/4 v11, 0x4

    aput-object v6, v3, v11

    const/4 v6, 0x5

    aput-object v26, v3, v6

    .line 1611
    invoke-virtual {v3}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    .line 44
    check-cast v3, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 245
    new-instance v3, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 364
    invoke-virtual/range {v52 .. v52}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v19

    move/from16 v23, v6

    move-object/from16 v6, v19

    check-cast v6, [[Ljava/lang/String;

    .line 247
    invoke-direct {v3, v6}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v6, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 386
    invoke-virtual/range {v20 .. v20}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v19

    move/from16 v26, v7

    move-object/from16 v7, v19

    check-cast v7, [[Ljava/lang/String;

    .line 248
    invoke-direct {v6, v7}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v7, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    filled-new-array {v12, v14}, [Ljava/lang/String;

    move-result-object v12

    move/from16 v19, v11

    const-string v11, "&#11;"

    filled-new-array {v15, v11}, [Ljava/lang/String;

    move-result-object v11

    const-string v15, "&#12;"

    filled-new-array {v9, v15}, [Ljava/lang/String;

    move-result-object v9

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    filled-new-array {v0, v14}, [Ljava/lang/String;

    move-result-object v0

    filled-new-array {v12, v11, v9, v13, v0}, [[Ljava/lang/String;

    move-result-object v0

    invoke-direct {v7, v0}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    .line 61
    new-instance v0, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;

    const/16 v9, 0x8

    const/4 v11, 0x1

    invoke-direct {v0, v11, v9}, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;-><init>(II)V

    .line 61
    new-instance v12, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;

    const/16 v13, 0xe

    const/16 v15, 0x1f

    invoke-direct {v12, v13, v15}, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;-><init>(II)V

    .line 61
    new-instance v13, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;

    const/16 v9, 0x84

    const/16 v15, 0x7f

    invoke-direct {v13, v15, v9}, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;-><init>(II)V

    .line 61
    new-instance v9, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;

    const/16 v11, 0x9f

    const/16 v15, 0x86

    invoke-direct {v9, v15, v11}, Le/e/a/vendor/lang3/text/translate/NumericEntityEscaper;-><init>(II)V

    .line 260
    new-instance v11, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;

    const/4 v15, 0x1

    .line 57
    invoke-direct {v11, v15}, Le/e/a/vendor/lang3/text/translate/JavaUnicodeEscaper;-><init>(B)V

    move/from16 v21, v15

    const/16 v15, 0x8

    .line 260
    new-array v15, v15, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    aput-object v3, v15, v16

    aput-object v6, v15, v21

    const/16 v18, 0x2

    aput-object v7, v15, v18

    aput-object v0, v15, v50

    aput-object v12, v15, v19

    aput-object v13, v15, v23

    aput-object v9, v15, v26

    const/4 v0, 0x7

    aput-object v11, v15, v0

    .line 1611
    invoke-virtual {v15}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 44
    check-cast v0, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 273
    new-instance v0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 386
    invoke-virtual/range {v20 .. v20}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[Ljava/lang/String;

    .line 275
    invoke-direct {v0, v3}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v3, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 440
    sget-object v6, Le/e/a/vendor/lang3/text/translate/EntityArrays;->ISO8859_1_ESCAPE:[[Ljava/lang/String;

    invoke-virtual {v6}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [[Ljava/lang/String;

    .line 276
    invoke-direct {v3, v7}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    const/4 v11, 0x2

    new-array v7, v11, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    aput-object v0, v7, v16

    const/16 v17, 0x1

    aput-object v3, v7, v17

    .line 1611
    invoke-virtual {v7}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 44
    check-cast v0, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 288
    new-instance v0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 386
    invoke-virtual/range {v20 .. v20}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[Ljava/lang/String;

    .line 290
    invoke-direct {v0, v3}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v3, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 440
    invoke-virtual {v6}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[Ljava/lang/String;

    .line 291
    invoke-direct {v3, v6}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v6, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 406
    sget-object v7, Le/e/a/vendor/lang3/text/translate/EntityArrays;->HTML40_EXTENDED_ESCAPE:[[Ljava/lang/String;

    invoke-virtual {v7}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [[Ljava/lang/String;

    .line 292
    invoke-direct {v6, v7}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    move/from16 v7, v50

    new-array v9, v7, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    aput-object v0, v9, v16

    const/4 v7, 0x1

    aput-object v3, v9, v7

    const/16 v18, 0x2

    aput-object v6, v9, v18

    .line 1611
    invoke-virtual {v9}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 44
    check-cast v0, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 306
    new-instance v0, Le/e/a/vendor/lang3/StringEscapeUtils$CsvEscaper;

    .line 318
    new-instance v0, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;

    new-instance v3, Le/e/a/vendor/lang3/text/translate/OctalUnescaper;

    move/from16 v6, v16

    .line 57
    invoke-direct {v3, v6}, Le/e/a/vendor/lang3/text/translate/OctalUnescaper;-><init>(B)V

    .line 318
    new-instance v6, Le/e/a/vendor/lang3/text/translate/OctalUnescaper;

    .line 57
    invoke-direct {v6, v7}, Le/e/a/vendor/lang3/text/translate/OctalUnescaper;-><init>(B)V

    .line 318
    new-instance v7, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 470
    sget-object v9, Le/e/a/vendor/lang3/text/translate/EntityArrays;->JAVA_CTRL_CHARS_UNESCAPE:[[Ljava/lang/String;

    invoke-virtual {v9}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [[Ljava/lang/String;

    .line 322
    invoke-direct {v7, v9}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v9, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    filled-new-array {v5, v4}, [Ljava/lang/String;

    move-result-object v5

    filled-new-array {v2, v1}, [Ljava/lang/String;

    move-result-object v1

    filled-new-array {v10, v8}, [Ljava/lang/String;

    move-result-object v2

    filled-new-array {v4, v14}, [Ljava/lang/String;

    move-result-object v4

    filled-new-array {v5, v1, v2, v4}, [[Ljava/lang/String;

    move-result-object v1

    invoke-direct {v9, v1}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    move/from16 v1, v19

    new-array v2, v1, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    const/16 v16, 0x0

    aput-object v3, v2, v16

    const/16 v17, 0x1

    aput-object v6, v2, v17

    const/16 v18, 0x2

    aput-object v7, v2, v18

    const/16 v50, 0x3

    aput-object v9, v2, v50

    invoke-direct {v0, v2}, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;-><init>([Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;)V

    .line 363
    new-instance v0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 395
    sget-object v1, Le/e/a/vendor/lang3/text/translate/EntityArrays;->BASIC_UNESCAPE:[[Ljava/lang/String;

    invoke-virtual {v1}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[Ljava/lang/String;

    .line 365
    invoke-direct {v0, v2}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v2, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 449
    sget-object v3, Le/e/a/vendor/lang3/text/translate/EntityArrays;->ISO8859_1_UNESCAPE:[[Ljava/lang/String;

    invoke-virtual {v3}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[Ljava/lang/String;

    .line 366
    invoke-direct {v2, v4}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v4, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;

    const/4 v6, 0x0

    new-array v5, v6, [Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    invoke-direct {v4, v5}, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;-><init>([Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;)V

    const/4 v7, 0x3

    new-array v5, v7, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    aput-object v0, v5, v6

    const/16 v17, 0x1

    aput-object v2, v5, v17

    const/16 v18, 0x2

    aput-object v4, v5, v18

    .line 1611
    invoke-virtual {v5}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 44
    check-cast v0, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 379
    new-instance v0, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;

    new-instance v2, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 395
    invoke-virtual {v1}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[Ljava/lang/String;

    .line 381
    invoke-direct {v2, v4}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v4, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 449
    invoke-virtual {v3}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[Ljava/lang/String;

    .line 382
    invoke-direct {v4, v3}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v3, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 415
    sget-object v5, Le/e/a/vendor/lang3/text/translate/EntityArrays;->HTML40_EXTENDED_UNESCAPE:[[Ljava/lang/String;

    invoke-virtual {v5}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [[Ljava/lang/String;

    .line 383
    invoke-direct {v3, v5}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v5, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;

    const/4 v6, 0x0

    new-array v7, v6, [Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    invoke-direct {v5, v7}, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;-><init>([Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;)V

    const/4 v7, 0x4

    new-array v7, v7, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    aput-object v2, v7, v6

    const/16 v17, 0x1

    aput-object v4, v7, v17

    const/16 v18, 0x2

    aput-object v3, v7, v18

    const/16 v50, 0x3

    aput-object v5, v7, v50

    invoke-direct {v0, v7}, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;-><init>([Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;)V

    sput-object v0, Le/e/a/vendor/lang3/StringEscapeUtils;->UNESCAPE_HTML4:Le/e/a/vendor/lang3/text/translate/AggregateTranslator;

    .line 396
    new-instance v0, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 395
    invoke-virtual {v1}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[Ljava/lang/String;

    .line 398
    invoke-direct {v0, v1}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v1, Le/e/a/vendor/lang3/text/translate/LookupTranslator;

    .line 373
    sget-object v2, Le/e/a/vendor/lang3/text/translate/EntityArrays;->APOS_UNESCAPE:[[Ljava/lang/String;

    invoke-virtual {v2}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[Ljava/lang/String;

    .line 399
    invoke-direct {v1, v2}, Le/e/a/vendor/lang3/text/translate/LookupTranslator;-><init>([[Ljava/lang/CharSequence;)V

    new-instance v2, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;

    const/4 v6, 0x0

    new-array v3, v6, [Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    invoke-direct {v2, v3}, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;-><init>([Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;)V

    const/4 v7, 0x3

    new-array v3, v7, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    aput-object v0, v3, v6

    const/16 v17, 0x1

    aput-object v1, v3, v17

    const/16 v18, 0x2

    aput-object v2, v3, v18

    .line 1611
    invoke-virtual {v3}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 44
    check-cast v0, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    .line 412
    new-instance v0, Le/e/a/vendor/lang3/StringEscapeUtils$CsvUnescaper;

    return-void
.end method

.method public static final unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 797
    sget-object v0, Le/e/a/vendor/lang3/StringEscapeUtils;->UNESCAPE_HTML4:Le/e/a/vendor/lang3/text/translate/AggregateTranslator;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 72
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    shl-int/lit8 v2, v2, 0x1

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 110
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :cond_1
    :goto_0
    if-ge v4, v2, :cond_4

    .line 112
    invoke-virtual {v0, p0, v4, v1}, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;->translate(Ljava/lang/String;ILjava/io/StringWriter;)I

    move-result v5

    if-nez v5, :cond_3

    .line 116
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 117
    invoke-virtual {v1, v5}, Ljava/io/Writer;->write(I)V

    add-int/lit8 v6, v4, 0x1

    .line 119
    invoke-static {v5}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v5

    if-eqz v5, :cond_2

    if-ge v6, v2, :cond_2

    .line 120
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 121
    invoke-static {v5}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 122
    invoke-virtual {v1, v5}, Ljava/io/Writer;->write(I)V

    add-int/lit8 v4, v4, 0x2

    goto :goto_0

    :cond_2
    move v4, v6

    goto :goto_0

    :cond_3
    move v6, v3

    :goto_1
    if-ge v6, v5, :cond_1

    .line 131
    invoke-static {p0, v4}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->charCount(I)I

    move-result v7

    add-int/2addr v4, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 74
    :cond_4
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 77
    new-instance v0, Ljava/io/UncheckedIOException;

    invoke-direct {v0, p0}, Ljava/io/UncheckedIOException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method
