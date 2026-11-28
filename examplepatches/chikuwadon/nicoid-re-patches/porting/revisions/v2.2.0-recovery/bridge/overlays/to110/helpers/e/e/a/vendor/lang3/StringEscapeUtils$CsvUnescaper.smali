.class public final Le/e/a/vendor/lang3/StringEscapeUtils$CsvUnescaper;
.super Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;
.source "SourceFile"


# static fields
.field public static final CSV_QUOTE_STR:Ljava/lang/String;

.field public static final CSV_SEARCH_CHARS:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x22

    .line 78
    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/vendor/lang3/StringEscapeUtils$CsvUnescaper;->CSV_QUOTE_STR:Ljava/lang/String;

    const/4 v0, 0x4

    .line 79
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Le/e/a/vendor/lang3/StringEscapeUtils$CsvUnescaper;->CSV_SEARCH_CHARS:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x2cs
        0x22s
        0xds
        0xas
    .end array-data
.end method


# virtual methods
.method public final translate(Ljava/lang/String;ILjava/io/StringWriter;)I
    .registers 14

    if-nez p2, :cond_7

    .line 86
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    const/4 p2, 0x2

    const/4 v0, 0x0

    if-lt p0, p2, :cond_6

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 p2, 0x22

    if-ne p0, p2, :cond_6

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v1, 0x1

    sub-int/2addr p0, v1

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    if-ne p0, p2, :cond_6

    .line 91
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    sub-int/2addr p0, v1

    invoke-virtual {p1, v1, p0}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1112
    invoke-static {p0}, Le/e/a/vendor/lang3/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_5

    .line 2191
    sget-object p2, Le/e/a/vendor/lang3/StringEscapeUtils$CsvUnescaper;->CSV_SEARCH_CHARS:[C

    if-eqz p2, :cond_0

    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    if-eqz v1, :cond_5

    .line 1115
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1116
    array-length v2, p2

    add-int/lit8 v3, v1, -0x1

    add-int/lit8 v4, v2, -0x1

    move v5, v0

    :goto_1
    if-ge v5, v1, :cond_5

    .line 1120
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    move v7, v0

    :goto_2
    if-ge v7, v2, :cond_4

    .line 1122
    aget-char v8, p2, v7

    if-ne v8, v6, :cond_3

    .line 1123
    invoke-static {v6}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v8

    if-eqz v8, :cond_1

    if-eq v7, v4, :cond_2

    if-ge v5, v3, :cond_3

    add-int/lit8 v8, v7, 0x1

    aget-char v8, p2, v8

    add-int/lit8 v9, v5, 0x1

    .line 1124
    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v8, v9, :cond_3

    goto :goto_3

    :cond_1
    if-eqz v7, :cond_2

    .line 1125
    invoke-static {v6}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v8

    if-eqz v8, :cond_2

    add-int/lit8 v8, v7, -0x1

    aget-char v9, p2, v8

    invoke-static {v9}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v9

    if-eqz v9, :cond_2

    if-lez v5, :cond_3

    aget-char v8, p2, v8

    add-int/lit8 v9, v5, -0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v8, v9, :cond_3

    .line 94
    :cond_2
    :goto_3
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Le/e/a/vendor/lang3/StringEscapeUtils$CsvUnescaper;->CSV_QUOTE_STR:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    sget-object v2, Le/e/a/vendor/lang3/Strings$CsStrings;->CS:Le/e/a/vendor/lang3/Strings$CsStrings;

    invoke-virtual {v2, p0, p2, v1}, Le/e/a/vendor/lang3/Strings$CsStrings;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_4

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 96
    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 98
    :goto_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    invoke-static {p1, v0, p0}, Ljava/lang/Character;->codePointCount(Ljava/lang/CharSequence;II)I

    move-result p0

    return p0

    .line 87
    :cond_6
    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 88
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    invoke-static {p1, v0, p0}, Ljava/lang/Character;->codePointCount(Ljava/lang/CharSequence;II)I

    move-result p0

    return p0

    .line 84
    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "CsvUnescaper should never reach the [1] index"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
