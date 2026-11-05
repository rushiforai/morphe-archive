.class public final Le/e/a/RowDates194;
.super Ljava/lang/Object;
.source "RowDates194.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/RowDates194$Formats;
    }
.end annotation


# static fields
.field private static final DATE:Ljava/util/regex/Pattern;

.field private static final EPOCH:Ljava/util/regex/Pattern;

.field private static final FORMATS:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Le/e/a/RowDates194$Formats;",
            ">;"
        }
    .end annotation
.end field

.field private static final PARSED:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final PATTERNS:[Ljava/lang/String;

.field private static final TAGS:Ljava/util/regex/Pattern;

.field private static final ZONE:Ljava/util/TimeZone;

.field private static final ZONE_SUFFIX:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 6
    const-string v0, "<[^>]*>"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/RowDates194;->TAGS:Ljava/util/regex/Pattern;

    const-string v0, "[0-9]{10}|[0-9]{13}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/RowDates194;->EPOCH:Ljava/util/regex/Pattern;

    .line 7
    const-string v0, "[0-9]{4}(?:[-/][0-9]{2}[-/][0-9]{2}[ T][0-9]{2}:[0-9]{2}(?::[0-9]{2}(?:\\.[0-9]+)?)?(?:Z|[+-][0-9]{2}:?[0-9]{2})?|\u5e74[0-9]{2}\u6708[0-9]{2}\u65e5 [0-9]{2}(?:\u6642[0-9]{2}\u5206|:[0-9]{2}))"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/RowDates194;->DATE:Ljava/util/regex/Pattern;

    .line 8
    const-string v0, "(?:Z|[+-][0-9]{2}:?[0-9]{2})$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/RowDates194;->ZONE_SUFFIX:Ljava/util/regex/Pattern;

    .line 9
    const-string v0, "Asia/Tokyo"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Le/e/a/RowDates194;->ZONE:Ljava/util/TimeZone;

    .line 10
    const-string v7, "yyyy\u5e74MM\u6708dd\u65e5 HH\u6642mm\u5206"

    const-string v8, "yyyy\u5e74MM\u6708dd\u65e5 HH:mm"

    const-string v1, "yyyy-MM-dd HH:mm"

    const-string v2, "yyyy-MM-dd HH:mm:ss"

    const-string v3, "yyyy-MM-dd HH:mm:ss.SSS"

    const-string v4, "yyyy-MM-dd HH:mmXXX"

    const-string v5, "yyyy-MM-dd HH:mm:ssXXX"

    const-string v6, "yyyy-MM-dd HH:mm:ss.SSSXXX"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/RowDates194;->PATTERNS:[Ljava/lang/String;

    .line 11
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/RowDates194;->FORMATS:Ljava/lang/ThreadLocal;

    .line 12
    new-instance v0, Le/e/a/RowDates194$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x100

    invoke-direct {v0, v3, v1, v2}, Le/e/a/RowDates194$1;-><init>(IFZ)V

    sput-object v0, Le/e/a/RowDates194;->PARSED:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()[Ljava/lang/String;
    .registers 1

    .line 10
    sget-object v0, Le/e/a/RowDates194;->PATTERNS:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Ljava/lang/String;)Ljava/text/SimpleDateFormat;
    .registers 1

    .line 14
    invoke-static {p0}, Le/e/a/RowDates194;->create(Ljava/lang/String;)Ljava/text/SimpleDateFormat;

    move-result-object p0

    return-object p0
.end method

.method private static create(Ljava/lang/String;)Ljava/text/SimpleDateFormat;
    .registers 3

    .line 14
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v0, p0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    sget-object p0, Le/e/a/RowDates194;->ZONE:Ljava/util/TimeZone;

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    return-object v0
.end method

.method public static format(JLjava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 25
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gtz v2, :cond_9

    const-string p0, ""

    goto :goto_33

    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Le/e/a/RowDates194;->formats()Le/e/a/RowDates194$Formats;

    move-result-object v1

    iget-object v1, v1, Le/e/a/RowDates194$Formats;->output:Ljava/text/SimpleDateFormat;

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, " "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_33
    return-object p0
.end method

.method private static formats()Le/e/a/RowDates194$Formats;
    .registers 2

    .line 15
    sget-object v0, Le/e/a/RowDates194;->FORMATS:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/RowDates194$Formats;

    if-nez v0, :cond_15

    new-instance v0, Le/e/a/RowDates194$Formats;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le/e/a/RowDates194$Formats;-><init>(Le/e/a/RowDates194$Formats;)V

    sget-object v1, Le/e/a/RowDates194;->FORMATS:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_15
    return-object v0
.end method

.method public static millis(Ljava/lang/String;)J
    .registers 6

    .line 16
    if-nez p0, :cond_5

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x800

    if-gt v0, v1, :cond_25

    sget-object v0, Le/e/a/RowDates194;->PARSED:Ljava/util/Map;

    monitor-enter v0

    :try_start_10
    sget-object v2, Le/e/a/RowDates194;->PARSED:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    if-eqz v2, :cond_20

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    :cond_20
    monitor-exit v0

    goto :goto_25

    :catchall_22
    move-exception p0

    monitor-exit v0
    :try_end_24
    .catchall {:try_start_10 .. :try_end_24} :catchall_22

    throw p0

    :cond_25
    :goto_25
    invoke-static {p0}, Le/e/a/RowDates194;->parse(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_40

    sget-object v0, Le/e/a/RowDates194;->PARSED:Ljava/util/Map;

    monitor-enter v0

    :try_start_32
    sget-object v1, Le/e/a/RowDates194;->PARSED:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v1, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    goto :goto_40

    :catchall_3d
    move-exception p0

    monitor-exit v0
    :try_end_3f
    .catchall {:try_start_32 .. :try_end_3f} :catchall_3d

    throw p0

    :cond_40
    :goto_40
    return-wide v2
.end method

.method private static parse(Ljava/lang/String;)J
    .registers 10

    .line 17
    sget-object v0, Le/e/a/RowDates194;->TAGS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Le/e/a/RowDates194;->EPOCH:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_31

    :try_start_1e
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_1e .. :try_end_26} :catch_2f

    const/16 v2, 0xa

    if-ne p0, v2, :cond_2e

    const-wide/16 v2, 0x3e8

    mul-long v0, v0, v2

    :cond_2e
    return-wide v0

    :catch_2f
    move-exception p0

    return-wide v2

    :cond_31
    sget-object v1, Le/e/a/RowDates194;->DATE:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_3e

    return-wide v2

    :cond_3e
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object p0

    .line 18
    const/16 v1, 0x5e74

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v4, 0x7

    const/4 v5, 0x0

    if-ltz v1, :cond_57

    const/16 v0, 0x6642

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_116

    const/4 v4, 0x6

    goto/16 :goto_116

    .line 19
    :cond_57
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v1, v4, :cond_63

    return-wide v2

    :cond_63
    const/16 v1, 0x2f

    const/16 v4, 0x2d

    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x54

    const/16 v4, 0x20

    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    sget-object v1, Le/e/a/RowDates194;->ZONE_SUFFIX:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_83

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v0

    :cond_83
    if-eqz v4, :cond_8d

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v1

    invoke-virtual {p0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 20
    :cond_8d
    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x10

    if-le v6, v7, :cond_9d

    const/4 v6, 0x1

    goto :goto_9e

    :cond_9d
    const/4 v6, 0x0

    :goto_9e
    const/4 v7, 0x3

    if-ltz v1, :cond_da

    add-int/lit8 v6, v1, 0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-virtual {p0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v8, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "."

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "000"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v6, 0x2

    .line 21
    :cond_da
    if-eqz v4, :cond_104

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v4, 0x5

    if-ne v1, v4, :cond_102

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ":"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_102
    add-int/lit8 v6, v6, 0x3

    :cond_104
    move v4, v6

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 23
    :cond_116
    :goto_116
    invoke-static {}, Le/e/a/RowDates194;->formats()Le/e/a/RowDates194$Formats;

    move-result-object v0

    invoke-virtual {v0, v4}, Le/e/a/RowDates194$Formats;->get(I)Ljava/text/SimpleDateFormat;

    move-result-object v0

    sget-object v1, Le/e/a/RowDates194;->ZONE:Ljava/util/TimeZone;

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    new-instance v1, Ljava/text/ParsePosition;

    invoke-direct {v1, v5}, Ljava/text/ParsePosition;-><init>(I)V

    invoke-virtual {v0, p0, v1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v0

    if-eqz v0, :cond_13c

    invoke-virtual {v1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-ne v1, p0, :cond_13c

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    :cond_13c
    return-wide v2
.end method
