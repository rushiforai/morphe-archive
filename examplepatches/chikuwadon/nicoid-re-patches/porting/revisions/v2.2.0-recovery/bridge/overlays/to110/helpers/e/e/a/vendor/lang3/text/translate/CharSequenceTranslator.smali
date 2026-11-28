.class public abstract Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final HEX_DIGITS:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x10

    .line 41
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;->HEX_DIGITS:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method


# virtual methods
.method public translate(Ljava/lang/String;ILjava/io/StringWriter;)I
    .registers 14

    if-nez p2, :cond_5

    .line 63
    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object p2, Le/e/a/vendor/lang3/StringEscapeUtils$CsvEscaper;->CSV_SEARCH_CHARS:[C

    sget v0, Le/e/a/vendor/lang3/StringUtils;->$r8$clinit:I

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    if-eqz p2, :cond_4

    .line 1287
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v2, v1, -0x1

    .line 1289
    array-length v3, p2

    add-int/lit8 v4, v3, -0x1

    move v5, v0

    :goto_0
    if-ge v5, v1, :cond_4

    .line 1292
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    move v7, v0

    :goto_1
    if-ge v7, v3, :cond_3

    .line 1294
    aget-char v8, p2, v7

    if-ne v8, v6, :cond_2

    .line 1295
    invoke-static {v6}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v8

    if-eqz v8, :cond_0

    if-eq v7, v4, :cond_1

    if-ge v5, v2, :cond_2

    add-int/lit8 v8, v7, 0x1

    aget-char v8, p2, v8

    add-int/lit8 v9, v5, 0x1

    .line 1296
    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v8, v9, :cond_2

    goto :goto_2

    :cond_0
    if-eqz v7, :cond_1

    .line 1297
    invoke-static {v6}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v8

    if-eqz v8, :cond_1

    add-int/lit8 v8, v7, -0x1

    aget-char v9, p2, v8

    invoke-static {v9}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v9

    if-eqz v9, :cond_1

    if-lez v5, :cond_2

    aget-char v8, p2, v8

    add-int/lit8 v9, v5, -0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v8, v9, :cond_2

    :cond_1
    :goto_2
    const/16 p0, 0x22

    .line 66
    invoke-virtual {p3, p0}, Ljava/io/Writer;->write(I)V

    .line 67
    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p2

    sget-object v1, Le/e/a/vendor/lang3/StringEscapeUtils$CsvEscaper;->CSV_QUOTE_STR:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Le/e/a/vendor/lang3/Strings$CsStrings;->CS:Le/e/a/vendor/lang3/Strings$CsStrings;

    invoke-virtual {v3, p2, v1, v2}, Le/e/a/vendor/lang3/Strings$CsStrings;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 68
    invoke-virtual {p3, p0}, Ljava/io/Writer;->write(I)V

    goto :goto_3

    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 64
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 70
    :goto_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    invoke-static {p1, v0, p0}, Ljava/lang/Character;->codePointCount(Ljava/lang/CharSequence;II)I

    move-result p0

    return p0

    .line 61
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "CsvEscaper should never reach the [1] index"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
