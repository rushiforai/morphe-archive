.class final Lapp/yydarlinker/deepseekcaptions/RebuildSource;
.super Ljava/lang/Object;
.source "RebuildSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;,
        Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;,
        Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;,
        Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;
    }
.end annotation


# static fields
.field private static final KEY_EDGE:Ljava/util/regex/Pattern;

.field static final TOKEN:Ljava/util/regex/Pattern;


# instance fields
.field final coarseCueCount:I

.field final coarseCueReconstructed:Z

.field final words:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 63
    const-string v0, "[\\p{IsHan}\\p{IsHiragana}\\p{IsKatakana}\\p{IsHangul}]|[+-]?\\p{N}+(?:[.,:/-]\\p{N}+)*(?:[a-zA-Z]+)?(?:%|\uff05)?|[\\p{L}\\p{M}]+(?:[.\'\u2019_\\-][\\p{L}\\p{M}\\p{N}]+)*|[^\\s]"

    .line 64
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->TOKEN:Ljava/util/regex/Pattern;

    .line 87
    const-string v0, "^[^\\p{L}\\p{N}+\\-]+|[^\\p{L}\\p{N}%]+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->KEY_EDGE:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 54
    invoke-direct {p0, p1, v0, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;-><init>(Ljava/util/List;ZI)V

    return-void
.end method

.method private constructor <init>(Ljava/util/List;ZI)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;",
            ">;ZI)V"
        }
    .end annotation

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    .line 59
    iput-boolean p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->coarseCueReconstructed:Z

    .line 60
    iput p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->coarseCueCount:I

    return-void
.end method

.method private static add(Ljava/util/List;Ljava/lang/String;JJIZ)V
    .registers 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;",
            ">;",
            "Ljava/lang/String;",
            "JJIZ)V"
        }
    .end annotation

    const/16 v0, 0xa0

    const/16 v1, 0x20

    .line 329
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->tokens(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 330
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_79

    cmp-long v1, p4, p2

    if-gtz v1, :cond_17

    goto :goto_79

    :cond_17
    sub-long v1, p4, p2

    .line 331
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    int-to-long v3, v3

    cmp-long v3, v1, v3

    if-gez v3, :cond_36

    .line 332
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    sget-object v11, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->ESTIMATED:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    move-wide v6, p2

    move-wide/from16 v8, p4

    move/from16 v10, p6

    invoke-direct/range {v4 .. v11}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;-><init>(Ljava/lang/String;JJILapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;)V

    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    :cond_36
    const/4 p1, 0x0

    .line 336
    :goto_37
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge p1, v3, :cond_79

    int-to-long v3, p1

    mul-long/2addr v3, v1

    .line 337
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    int-to-long v5, v5

    div-long/2addr v3, v5

    add-long v5, p2, v3

    add-int/lit8 v11, p1, 0x1

    int-to-long v3, v11

    mul-long/2addr v3, v1

    .line 338
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    int-to-long v7, v7

    div-long/2addr v3, v7

    add-long v7, p2, v3

    cmp-long v3, v7, v5

    if-lez v3, :cond_77

    .line 340
    new-instance v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    .line 342
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    if-eqz p7, :cond_6c

    .line 346
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    const/4 v9, 0x1

    if-ne p1, v9, :cond_6c

    sget-object p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->NATIVE:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    goto :goto_6e

    :cond_6c
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->ESTIMATED:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    :goto_6e
    move-object v10, p1

    move/from16 v9, p6

    invoke-direct/range {v3 .. v10}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;-><init>(Ljava/lang/String;JJILapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;)V

    .line 340
    invoke-interface {p0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_77
    move p1, v11

    goto :goto_37

    :cond_79
    :goto_79
    return-void
.end method

.method private static appendFrame(Ljava/util/List;Ljava/lang/String;JJIZLapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;)Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;
    .registers 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;",
            ">;",
            "Ljava/lang/String;",
            "JJIZ",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;",
            ")",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;"
        }
    .end annotation

    move-object/from16 v0, p8

    .line 285
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->tokens(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 286
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_d

    return-object v0

    :cond_d
    const/4 p1, 0x0

    if-eqz v0, :cond_61

    if-nez p7, :cond_61

    .line 289
    iget-wide v2, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->end:J

    cmp-long v2, p2, v2

    if-gez v2, :cond_61

    .line 291
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    iget-object v3, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->tokens:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v2, v3, :cond_3a

    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->tokens:Ljava/util/List;

    iget-object v3, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->tokens:Ljava/util/List;

    .line 292
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v2, p1, v1, p1, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->sameRange(Ljava/util/List;ILjava/util/List;II)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 294
    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->tokens:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    goto :goto_63

    .line 296
    :cond_3a
    iget-boolean v2, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->rolling:Z

    if-eqz v2, :cond_61

    .line 297
    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->tokens:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    :goto_4c
    if-lez v2, :cond_61

    .line 298
    iget-object v3, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->tokens:Ljava/util/List;

    iget-object v5, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->tokens:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v2

    invoke-static {v3, v5, v1, p1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->sameRange(Ljava/util/List;ILjava/util/List;II)Z

    move-result v3

    if-eqz v3, :cond_5e

    goto :goto_63

    :cond_5e
    add-int/lit8 v2, v2, -0x1

    goto :goto_4c

    :cond_61
    move v2, p1

    move v4, v2

    :goto_63
    if-nez v0, :cond_68

    move/from16 v0, p6

    goto :goto_6a

    .line 305
    :cond_68
    iget v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->lastCue:I

    .line 306
    :goto_6a
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_c5

    .line 307
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 308
    :goto_75
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_b0

    .line 309
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 310
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_aa

    .line 311
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_aa

    .line 312
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->codePointBefore(I)I

    move-result v5

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->cjk(I)Z

    move-result v5

    if-nez v5, :cond_aa

    .line 313
    invoke-virtual {v3, p1}, Ljava/lang/String;->codePointAt(I)I

    move-result v5

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->cjk(I)Z

    move-result v5

    if-nez v5, :cond_aa

    const/16 v5, 0x20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 314
    :cond_aa
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_75

    .line 316
    :cond_b0
    new-instance v5, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v12, 0x0

    move-wide v7, p2

    move-wide/from16 v9, p4

    move/from16 v11, p6

    invoke-direct/range {v5 .. v12}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;-><init>(Ljava/lang/String;JJIZ)V

    invoke-interface {p0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move/from16 v5, p6

    goto :goto_c6

    :cond_c5
    move v5, v0

    .line 319
    :goto_c6
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;

    move-wide/from16 v2, p4

    invoke-direct/range {v0 .. v5}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;-><init>(Ljava/util/List;JZI)V

    return-object v0
.end method

.method static cjk(I)Z
    .registers 2

    .line 97
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(I)Ljava/lang/Character$UnicodeScript;

    move-result-object p0

    .line 98
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m()Ljava/lang/Character$UnicodeScript;

    move-result-object v0

    if-eq p0, v0, :cond_1f

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m$1()Ljava/lang/Character$UnicodeScript;

    move-result-object v0

    if-eq p0, v0, :cond_1f

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m$2()Ljava/lang/Character$UnicodeScript;

    move-result-object v0

    if-eq p0, v0, :cond_1f

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m$3()Ljava/lang/Character$UnicodeScript;

    move-result-object v0

    if-ne p0, v0, :cond_1d

    goto :goto_1f

    :cond_1d
    const/4 p0, 0x0

    return p0

    :cond_1f
    :goto_1f
    const/4 p0, 0x1

    return p0
.end method

.method private static gram(Ljava/util/List;I)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;",
            ">;I)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 384
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, p1, 0x1

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v2, v2, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, 0x2

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static join(Ljava/util/List;II)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;",
            ">;II)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    :goto_5
    if-gt p1, p2, :cond_56

    .line 107
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_50

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_50

    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->codePointBefore(I)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    .line 110
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->cjk(I)Z

    move-result v4

    if-nez v4, :cond_50

    .line 111
    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->cjk(I)Z

    move-result v4

    if-nez v4, :cond_50

    .line 112
    invoke-static {v3}, Ljava/lang/Character;->isLetterOrDigit(I)Z

    move-result v3

    if-eqz v3, :cond_50

    new-instance v3, Ljava/lang/String;

    .line 113
    invoke-static {v2}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([C)V

    const-string v2, "([{\uff08\u3010\u300a\u201c\u2018"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_50

    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 115
    :cond_50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, 0x1

    goto :goto_5

    .line 117
    :cond_56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 89
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->KEY_EDGE:Ljava/util/regex/Pattern;

    sget-object v1, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    invoke-static {p0, v1}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object p0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 90
    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x2019

    const/16 v2, 0x27

    .line 91
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x2212

    const/16 v2, 0x2d

    .line 92
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, ""

    .line 93
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$read$0(Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;)J
    .registers 3

    .line 218
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->start:J

    return-wide v0
.end method

.method static lexical(Ljava/lang/String;)Z
    .registers 2

    .line 80
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;)Ljava/util/stream/IntStream;

    move-result-object p0

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/stream/IntStream;Ljava/util/function/IntPredicate;)Z

    move-result p0

    return p0
.end method

.method private static ngrams(Ljava/util/List;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 388
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    :goto_6
    add-int/lit8 v2, v1, 0x2

    .line 389
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_25

    .line 390
    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->gram(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v2

    .line 391
    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v3, -0x1

    goto :goto_1b

    :cond_1a
    move v3, v1

    :goto_1b
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_25
    return-object v0
.end method

.method static nonSpeech(Ljava/lang/String;)Z
    .registers 2

    .line 130
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 131
    const-string v0, "[\u266a\u266b\\s]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "[\\[\uff08(\u3010]\\s*(music|applause|laughter|\u97f3\u4e50|\u638c\u58f0|\u7b11\u58f0)\\s*[\\]\uff09)\u3011]"

    .line 132
    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1b

    goto :goto_1d

    :cond_1b
    const/4 p0, 0x0

    return p0

    :cond_1d
    :goto_1d
    const/4 p0, 0x1

    return p0
.end method

.method private static opening(Ljava/lang/String;)Z
    .registers 2

    .line 84
    const-string v0, "([{\uff08\u3010\u300a\u201c\u2018\""

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method

.method static read([BLapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;)Lapp/yydarlinker/deepseekcaptions/RebuildSource;
    .registers 33
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 136
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 137
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 138
    new-instance v1, Ljava/lang/String;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    move-object/from16 v3, p0

    invoke-direct {v1, v3, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 139
    const-string v2, "{"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v10, 0x0

    if-eqz v2, :cond_1e4

    .line 140
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "events"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    if-eqz v12, :cond_1e4

    move v7, v10

    .line 142
    :goto_2e
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v7, v1, :cond_1e4

    .line 143
    invoke-virtual {v12, v7}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    if-nez v1, :cond_3c

    goto/16 :goto_1df

    .line 145
    :cond_3c
    const-string v2, "segs"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    if-nez v13, :cond_46

    goto/16 :goto_1df

    .line 147
    :cond_46
    const-string v3, "tStartMs"

    const-wide/16 v14, -0x1

    invoke-virtual {v1, v3, v14, v15}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    const-string v6, "dDurationMs"

    invoke-virtual {v1, v6, v14, v15}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v16

    const-wide/16 v18, 0x0

    cmp-long v6, v4, v18

    if-gez v6, :cond_5c

    goto/16 :goto_1df

    :cond_5c
    add-int/lit8 v6, v7, 0x1

    .line 150
    :goto_5e
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v8

    const-wide v20, 0x7fffffffffffffffL

    if-ge v6, v8, :cond_85

    .line 151
    invoke-virtual {v12, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    if-eqz v8, :cond_82

    .line 152
    invoke-virtual {v8, v3, v14, v15}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v22

    cmp-long v22, v22, v4

    if-lez v22, :cond_82

    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v22

    if-eqz v22, :cond_82

    .line 153
    invoke-virtual {v8, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    goto :goto_87

    :cond_82
    add-int/lit8 v6, v6, 0x1

    goto :goto_5e

    :cond_85
    move-wide/from16 v2, v20

    :goto_87
    cmp-long v6, v16, v18

    if-lez v6, :cond_8e

    add-long v2, v4, v16

    goto :goto_95

    :cond_8e
    cmp-long v6, v2, v20

    if-nez v6, :cond_95

    const-wide/16 v2, 0x7d0

    add-long/2addr v2, v4

    :cond_95
    :goto_95
    cmp-long v6, v2, v4

    if-gtz v6, :cond_9b

    goto/16 :goto_1df

    :cond_9b
    move v6, v10

    move v8, v6

    .line 160
    :goto_9d
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v14

    const-string v15, "tOffsetMs"

    if-ge v6, v14, :cond_b8

    .line 161
    invoke-virtual {v13, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    if-eqz v14, :cond_b3

    .line 162
    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_b3

    const/4 v14, 0x1

    goto :goto_b4

    :cond_b3
    move v14, v10

    :goto_b4
    or-int/2addr v8, v14

    add-int/lit8 v6, v6, 0x1

    goto :goto_9d

    .line 164
    :cond_b8
    const-string v14, ""

    const-string v6, "utf8"

    if-nez v8, :cond_133

    .line 165
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    move v15, v10

    .line 166
    :goto_c4
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v15, v11, :cond_da

    .line 167
    invoke-virtual {v13, v15}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    if-eqz v11, :cond_d7

    .line 168
    invoke-virtual {v11, v6, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_d7
    add-int/lit8 v15, v15, 0x1

    goto :goto_c4

    .line 170
    :cond_da
    const-string v6, "wWinId"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_11c

    .line 171
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    .line 173
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 176
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v13, "aAppend"

    .line 180
    invoke-virtual {v1, v13, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v13, 0x1

    if-ne v1, v13, :cond_fb

    move v1, v6

    move v6, v7

    const/4 v7, 0x1

    goto :goto_fe

    :cond_fb
    move v1, v6

    move v6, v7

    move v7, v10

    .line 181
    :goto_fe
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v9, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;

    move-object/from16 v29, v8

    move-object v8, v1

    move-object/from16 v1, v29

    move-wide/from16 v29, v4

    move-wide v4, v2

    move-wide/from16 v2, v29

    .line 174
    invoke-static/range {v0 .. v8}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->appendFrame(Ljava/util/List;Ljava/lang/String;JJIZLapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;)Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;

    move-result-object v1

    move v7, v6

    .line 172
    invoke-interface {v9, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1df

    :cond_11c
    move-wide/from16 v29, v4

    move-wide v5, v2

    move-wide/from16 v2, v29

    .line 182
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v8, 0x0

    move-object v2, v4

    move-wide/from16 v3, v29

    invoke-direct/range {v1 .. v8}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;-><init>(Ljava/lang/String;JJIZ)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1df

    :cond_133
    move-wide/from16 v22, v2

    move-wide/from16 v20, v4

    .line 186
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    move v1, v10

    move-wide/from16 v2, v18

    .line 188
    :goto_13f
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v8, 0x1

    if-ge v1, v4, :cond_1c4

    .line 189
    invoke-virtual {v13, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-nez v4, :cond_152

    move/from16 v25, v1

    move-object v1, v11

    move-object v11, v6

    goto/16 :goto_1bc

    .line 191
    :cond_152
    invoke-virtual {v4, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1ac

    move-object/from16 v24, v11

    const-wide/16 v10, -0x1

    .line 192
    invoke-virtual {v4, v15, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v16

    cmp-long v5, v16, v2

    if-ltz v5, :cond_1a4

    cmp-long v25, v16, v18

    if-ltz v25, :cond_1a4

    add-long v25, v20, v16

    cmp-long v27, v25, v22

    if-gez v27, :cond_1a4

    if-lez v5, :cond_19f

    .line 196
    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_192

    move v5, v1

    .line 197
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    move-wide/from16 v27, v2

    .line 198
    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    add-long v27, v20, v27

    move-object v10, v4

    move-object v11, v6

    move-wide/from16 v3, v27

    move-wide/from16 v29, v25

    move/from16 v25, v5

    move-wide/from16 v5, v29

    invoke-direct/range {v1 .. v8}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;-><init>(Ljava/lang/String;JJIZ)V

    .line 197
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_196

    :cond_192
    move/from16 v25, v1

    move-object v10, v4

    move-object v11, v6

    :goto_196
    move-object/from16 v1, v24

    const/4 v2, 0x0

    .line 199
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    move-wide/from16 v2, v16

    goto :goto_1b5

    :cond_19f
    move/from16 v25, v1

    move-object/from16 v1, v24

    goto :goto_1af

    .line 194
    :cond_1a4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source_offset_order"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1ac
    move/from16 v25, v1

    move-object v1, v11

    :goto_1af
    move-wide/from16 v27, v2

    move-object v10, v4

    move-object v11, v6

    move-wide/from16 v2, v27

    .line 204
    :goto_1b5
    invoke-virtual {v10, v11, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1bc
    add-int/lit8 v4, v25, 0x1

    move-object v6, v11

    const/4 v10, 0x0

    move-object v11, v1

    move v1, v4

    goto/16 :goto_13f

    :cond_1c4
    move-wide/from16 v27, v2

    move-object v1, v11

    .line 206
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_1df

    move-object/from16 v24, v1

    .line 207
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    add-long v3, v20, v27

    move-wide/from16 v5, v22

    invoke-direct/range {v1 .. v8}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;-><init>(Ljava/lang/String;JJIZ)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1df
    :goto_1df
    add-int/lit8 v7, v7, 0x1

    const/4 v10, 0x0

    goto/16 :goto_2e

    .line 211
    :cond_1e4
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_216

    .line 213
    invoke-interface/range {p1 .. p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;->cues()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v8, 0x0

    :goto_1f3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_216

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    .line 214
    new-instance v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    move-object v4, v3

    iget-object v3, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->text:Ljava/lang/String;

    move-object v6, v4

    iget-wide v4, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    iget-wide v9, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->endMs:J

    add-int/lit8 v11, v8, 0x1

    move-object v2, v6

    move-wide v6, v9

    const/4 v9, 0x0

    invoke-direct/range {v2 .. v9}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;-><init>(Ljava/lang/String;JJIZ)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v8, v11

    goto :goto_1f3

    .line 218
    :cond_216
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$$ExternalSyntheticLambda2;-><init>()V

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/List;Ljava/util/Comparator;)V

    .line 219
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 220
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 221
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_230
    :goto_230
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2e6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    .line 222
    iget-object v4, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->text:Ljava/lang/String;

    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->tokens(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 223
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_230

    iget-wide v5, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->end:J

    iget-wide v7, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->start:J

    cmp-long v5, v5, v7

    if-gtz v5, :cond_251

    goto :goto_230

    .line 224
    :cond_251
    iget-boolean v5, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->nativeOffset:Z

    if-eqz v5, :cond_284

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    const/4 v13, 0x1

    if-ne v5, v13, :cond_284

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v6, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->start:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v6, "|"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v6, 0x0

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_285

    goto :goto_230

    :cond_284
    const/4 v6, 0x0

    .line 226
    :cond_285
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2e1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    const/4 v13, 0x1

    sub-int/2addr v4, v13

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    iget-wide v4, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->start:J

    iget-wide v7, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->start:J

    cmp-long v4, v4, v7

    if-nez v4, :cond_2e1

    .line 227
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v13

    invoke-interface {v1, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    .line 229
    new-instance v7, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->text:Ljava/lang/String;

    .line 231
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->text:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-wide v9, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->start:J

    iget-wide v11, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->end:J

    iget-wide v13, v3, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->end:J

    .line 233
    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    iget v13, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->cue:I

    const/4 v14, 0x0

    invoke-direct/range {v7 .. v14}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;-><init>(Ljava/lang/String;JJIZ)V

    .line 229
    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_230

    .line 236
    :cond_2e1
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_230

    :cond_2e6
    const/4 v6, 0x0

    .line 238
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    move v0, v6

    move v2, v0

    move v3, v2

    .line 241
    :goto_2ef
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_341

    .line 242
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    .line 243
    iget-boolean v5, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->nativeOffset:Z

    if-eqz v5, :cond_30f

    iget-object v5, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->text:Ljava/lang/String;

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->tokens(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    const/4 v7, 0x1

    if-eq v5, v7, :cond_30d

    goto :goto_310

    :cond_30d
    move v13, v6

    goto :goto_311

    :cond_30f
    const/4 v7, 0x1

    :goto_310
    move v13, v7

    :goto_311
    if-eqz v13, :cond_315

    add-int/lit8 v0, v0, 0x1

    .line 245
    :cond_315
    iget-wide v9, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->end:J

    add-int/lit8 v2, v2, 0x1

    .line 246
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_334

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    iget-wide v11, v5, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->start:J

    cmp-long v5, v11, v9

    if-gez v5, :cond_334

    .line 247
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;

    iget-wide v9, v5, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->start:J

    or-int/2addr v3, v13

    :cond_334
    move-wide v12, v9

    .line 250
    iget-object v9, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->text:Ljava/lang/String;

    iget-wide v10, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->start:J

    iget v14, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->cue:I

    iget-boolean v15, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->nativeOffset:Z

    invoke-static/range {v8 .. v15}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->add(Ljava/util/List;Ljava/lang/String;JJIZ)V

    goto :goto_2ef

    :cond_341
    const/4 v7, 0x1

    .line 252
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_376

    move v11, v7

    .line 253
    :goto_349
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v1

    if-ge v11, v1, :cond_370

    .line 254
    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-wide v1, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    add-int/lit8 v4, v11, -0x1

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-wide v4, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->end:J

    cmp-long v1, v1, v4

    if-ltz v1, :cond_368

    add-int/lit8 v11, v11, 0x1

    goto :goto_349

    .line 255
    :cond_368
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source_time_order"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 256
    :cond_370
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    invoke-direct {v1, v8, v3, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;-><init>(Ljava/util/List;ZI)V

    return-object v1

    .line 252
    :cond_376
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source_empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static sameRange(Ljava/util/List;ILjava/util/List;II)Z
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;II)Z"
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    if-ge v1, p4, :cond_26

    add-int v2, p1, v1

    .line 323
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    add-int v3, p3, v1

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_23

    return v0

    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_26
    if-lez p4, :cond_2a

    const/4 p0, 0x1

    return p0

    :cond_2a
    return v0
.end method

.method static terminal(Ljava/lang/String;)Z
    .registers 2

    .line 125
    const-string v0, "(?s).*[.!?\u3002\uff01\uff1f][\\\"\'\u201d\u2019\uff09)]*$"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v0, "(?i).*(?:\\bMr|\\bMrs|\\bDr|\\bProf|\\bvs|\\betc)\\."

    .line 126
    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method static tokens(Ljava/lang/String;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->TOKEN:Ljava/util/regex/Pattern;

    if-nez p0, :cond_b

    const-string p0, ""

    :cond_b
    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 70
    :goto_f
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_54

    .line 71
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v1

    .line 72
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->lexical(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_50

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_50

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->opening(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_50

    .line 73
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_f

    .line 74
    :cond_50
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_54
    return-object v0
.end method


# virtual methods
.method align(Lapp/yydarlinker/deepseekcaptions/RebuildSource;)Lapp/yydarlinker/deepseekcaptions/RebuildSource;
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 352
    iget-object v2, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->ngrams(Ljava/util/List;)Ljava/util/Map;

    move-result-object v2

    iget-object v3, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->ngrams(Ljava/util/List;)Ljava/util/Map;

    move-result-object v3

    .line 353
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    const/4 v5, -0x1

    const/4 v7, 0x0

    :goto_17
    add-int/lit8 v8, v7, 0x2

    .line 355
    iget-object v9, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-ge v8, v9, :cond_a4

    .line 356
    iget-object v9, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-static {v9, v7}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->gram(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v9

    .line 357
    invoke-interface {v2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-interface {v3, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    if-eqz v11, :cond_a0

    .line 358
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    if-ne v11, v7, :cond_a0

    if-eqz v9, :cond_a0

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v11

    if-ltz v11, :cond_a0

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v11

    if-gt v11, v5, :cond_4a

    goto :goto_a0

    :cond_4a
    const/4 v11, 0x0

    const/4 v12, 0x1

    :goto_4c
    const/4 v13, 0x3

    if-ge v11, v13, :cond_7d

    .line 361
    iget-object v13, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    add-int v14, v7, v11

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-wide v13, v13, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    iget-object v15, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v16

    add-int v6, v16, v11

    invoke-interface {v15, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    move/from16 v16, v11

    const/4 v15, 0x1

    iget-wide v10, v6, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    sub-long/2addr v13, v10

    invoke-static {v13, v14}, Ljava/lang/Math;->abs(J)J

    move-result-wide v10

    const-wide/16 v13, 0x2710

    cmp-long v6, v10, v13

    if-lez v6, :cond_7a

    const/4 v12, 0x0

    :cond_7a
    add-int/lit8 v11, v16, 0x1

    goto :goto_4c

    :cond_7d
    const/4 v15, 0x1

    if-eqz v12, :cond_a1

    const/4 v5, 0x0

    :goto_81
    if-ge v5, v13, :cond_98

    add-int v6, v7, v5

    .line 364
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v10

    add-int/2addr v10, v5

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v4, v6, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :goto_81

    .line 365
    :cond_98
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v5, v5, 0x2

    move v7, v8

    goto :goto_a1

    :cond_a0
    :goto_a0
    const/4 v15, 0x1

    :cond_a1
    :goto_a1
    add-int/2addr v7, v15

    goto/16 :goto_17

    :cond_a4
    const/4 v15, 0x1

    .line 369
    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v2

    const/4 v3, 0x6

    if-ge v2, v3, :cond_ae

    goto/16 :goto_12d

    .line 370
    :cond_ae
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 371
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_bd
    :goto_bd
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_110

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 372
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 373
    iget-object v6, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v7, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    .line 374
    iget-object v7, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->precision:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    sget-object v8, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->NATIVE:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    if-ne v7, v8, :cond_bd

    .line 375
    new-instance v16, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-object v7, v6, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    iget-wide v8, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    iget-wide v10, v4, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->end:J

    iget v4, v6, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->cue:I

    sget-object v23, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->ALIGNED:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    move/from16 v22, v4

    move-object/from16 v17, v7

    move-wide/from16 v18, v8

    move-wide/from16 v20, v10

    invoke-direct/range {v16 .. v23}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;-><init>(Ljava/lang/String;JJILapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;)V

    move-object/from16 v4, v16

    invoke-interface {v2, v5, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_bd

    :cond_110
    move v10, v15

    .line 378
    :goto_111
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    if-ge v10, v1, :cond_131

    .line 379
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-wide v3, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    add-int/lit8 v1, v10, -0x1

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-wide v5, v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->end:J

    cmp-long v1, v3, v5

    if-gez v1, :cond_12e

    :goto_12d
    return-object v0

    :cond_12e
    add-int/lit8 v10, v10, 0x1

    goto :goto_111

    .line 380
    :cond_131
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource;

    iget-boolean v3, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->coarseCueReconstructed:Z

    iget v0, v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->coarseCueCount:I

    invoke-direct {v1, v2, v3, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;-><init>(Ljava/util/List;ZI)V

    return-object v1
.end method

.method text(II)Ljava/lang/String;
    .registers 3

    .line 121
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-static {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->join(Ljava/util/List;II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
