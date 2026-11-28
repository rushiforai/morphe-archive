.class public final Le/e/a/vendor/lang3/StringEscapeUtils$CsvEscaper;
.super Le/e/a/vendor/lang3/text/translate/CharSequenceTranslator;
.source "SourceFile"


# static fields
.field public static final CSV_QUOTE_STR:Ljava/lang/String;

.field public static final CSV_SEARCH_CHARS:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x22

    .line 55
    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/vendor/lang3/StringEscapeUtils$CsvEscaper;->CSV_QUOTE_STR:Ljava/lang/String;

    const/4 v0, 0x4

    .line 56
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Le/e/a/vendor/lang3/StringEscapeUtils$CsvEscaper;->CSV_SEARCH_CHARS:[C

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
