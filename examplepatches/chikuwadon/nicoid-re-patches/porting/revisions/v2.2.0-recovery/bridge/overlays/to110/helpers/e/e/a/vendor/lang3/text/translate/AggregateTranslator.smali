.class public final Le/e/a/vendor/lang3/text/translate/AggregateTranslator;
.super Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;
.source "SourceFile"


# instance fields
.field public final synthetic $r8$classId:B

.field public final translators:Ljava/lang/Object;


# direct methods
.method public constructor <init>([Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;->$r8$classId:B

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1611
    invoke-virtual {p1}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    .line 44
    check-cast p1, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    iput-object p1, p0, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;->translators:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>([Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;->$r8$classId:B

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    array-length v0, p1

    if-lez v0, :cond_0

    .line 87
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Ljava/util/EnumSet;->copyOf(Ljava/util/Collection;)Ljava/util/EnumSet;

    move-result-object p1

    iput-object p1, p0, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;->translators:Ljava/lang/Object;

    goto :goto_0

    .line 89
    :cond_0
    sget-object p1, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->semiColonRequired:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Ljava/util/EnumSet;->copyOf(Ljava/util/Collection;)Ljava/util/EnumSet;

    move-result-object p1

    iput-object p1, p0, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;->translators:Ljava/lang/Object;

    :goto_0
    return-void
.end method


# virtual methods
.method public final translate(Ljava/lang/String;ILjava/io/StringWriter;)I
    .registers 11

    iget-byte v0, p0, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;->$r8$classId:B

    const/4 v1, 0x0

    iget-object p0, p0, Le/e/a/vendor/lang3/text/translate/AggregateTranslator;->translators:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    .line 108
    check-cast p0, Ljava/util/EnumSet;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 110
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x26

    if-ne v2, v3, :cond_8

    add-int/lit8 v2, v0, -0x2

    if-ge p2, v2, :cond_8

    add-int/lit8 v2, p2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x23

    if-ne v2, v3, :cond_8

    add-int/lit8 v2, p2, 0x2

    .line 113
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x78

    const/4 v5, 0x1

    if-eq v3, v4, :cond_0

    const/16 v4, 0x58

    if-eq v3, v4, :cond_0

    move p2, v1

    goto :goto_0

    :cond_0
    add-int/lit8 v2, p2, 0x3

    if-eq v2, v0, :cond_8

    move p2, v5

    :goto_0
    move v3, v2

    :goto_1
    if-ge v3, v0, :cond_2

    .line 126
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eqz p2, :cond_1

    invoke-static {v4}, Le/e/a/vendor/lang3/CharUtils;->isHex(C)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_2

    :cond_1
    sget v6, Le/e/a/vendor/lang3/CharUtils;->$r8$clinit:I

    const/16 v6, 0x30

    if-lt v4, v6, :cond_2

    const/16 v6, 0x39

    if-gt v4, v6, :cond_2

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    if-eq v3, v0, :cond_3

    .line 129
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v4, 0x3b

    if-ne v0, v4, :cond_3

    move v0, v5

    goto :goto_3

    :cond_3
    move v0, v1

    :goto_3
    if-nez v0, :cond_5

    .line 131
    sget-object v4, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->semiColonRequired:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    if-eqz p0, :cond_4

    .line 100
    invoke-virtual {p0, v4}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    .line 134
    :cond_4
    sget-object v4, Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;->errorIfNoSemiColon:Le/e/a/vendor/lang3/text/translate/NumericEntityUnescaper$OPTION;

    if-eqz p0, :cond_5

    .line 100
    invoke-virtual {p0, v4}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    .line 135
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Semi-colon required at end of numeric entity"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5
    if-eqz p2, :cond_6

    .line 141
    :try_start_0
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x10

    invoke-static {p0, p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    goto :goto_4

    .line 143
    :cond_6
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0xa

    invoke-static {p0, p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_4
    if-ltz p0, :cond_8

    const p1, 0x10ffff

    if-gt p0, p1, :cond_8

    const p1, 0xffff

    if-le p0, p1, :cond_7

    .line 152
    invoke-static {p0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object p0

    .line 153
    aget-char p1, p0, v1

    invoke-virtual {p3, p1}, Ljava/io/Writer;->write(I)V

    .line 154
    aget-char p0, p0, v5

    invoke-virtual {p3, p0}, Ljava/io/Writer;->write(I)V

    goto :goto_5

    .line 156
    :cond_7
    invoke-virtual {p3, p0}, Ljava/io/Writer;->write(I)V

    :goto_5
    add-int/lit8 v3, v3, 0x2

    sub-int/2addr v3, v2

    add-int/2addr v3, p2

    add-int v1, v3, v0

    :catch_0
    :cond_8
    return v1

    .line 54
    :pswitch_0
    check-cast p0, [Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;

    array-length v0, p0

    move v2, v1

    :goto_6
    if-ge v2, v0, :cond_a

    aget-object v3, p0, v2

    .line 55
    invoke-virtual {v3, p1, p2, p3}, Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;->translate(Ljava/lang/String;ILjava/io/StringWriter;)I

    move-result v3

    if-eqz v3, :cond_9

    move v1, v3

    goto :goto_7

    :cond_9
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_a
    :goto_7
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
