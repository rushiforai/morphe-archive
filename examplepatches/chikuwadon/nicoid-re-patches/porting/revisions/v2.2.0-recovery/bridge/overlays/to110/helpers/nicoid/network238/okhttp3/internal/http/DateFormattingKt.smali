.class public final Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000+\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0003\u001a\u000c\u0010\u000c\u001a\u0004\u0018\u00010\r*\u00020\u0007\u001a\n\u0010\u000e\u001a\u00020\u0007*\u00020\r\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u0010\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u0004\"\u0016\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u0006X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u0008\"\u0018\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u0006X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000b\u00a8\u0006\u000f"
    }
    d2 = {
        "MAX_DATE",
        "",
        "STANDARD_DATE_FORMAT",
        "nicoid/network238/okhttp3/internal/http/DateFormattingKt$STANDARD_DATE_FORMAT$1",
        "Lnicoid/network238/okhttp3/internal/http/DateFormattingKt$STANDARD_DATE_FORMAT$1;",
        "BROWSER_COMPATIBLE_DATE_FORMAT_STRINGS",
        "",
        "",
        "[Ljava/lang/String;",
        "BROWSER_COMPATIBLE_DATE_FORMATS",
        "Ljava/text/DateFormat;",
        "[Ljava/text/DateFormat;",
        "toHttpDateOrNull",
        "Ljava/util/Date;",
        "toHttpDateString",
        "okhttp"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final BROWSER_COMPATIBLE_DATE_FORMATS:[Ljava/text/DateFormat;

.field private static final BROWSER_COMPATIBLE_DATE_FORMAT_STRINGS:[Ljava/lang/String;

.field public static final MAX_DATE:J = 0xe677d21fdbffL

.field private static final STANDARD_DATE_FORMAT:Lnicoid/network238/okhttp3/internal/http/DateFormattingKt$STANDARD_DATE_FORMAT$1;


# direct methods
.method static constructor <clinit>()V
    .registers 16

    .line 33
    new-instance v0, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt$STANDARD_DATE_FORMAT$1;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt$STANDARD_DATE_FORMAT$1;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->STANDARD_DATE_FORMAT:Lnicoid/network238/okhttp3/internal/http/DateFormattingKt$STANDARD_DATE_FORMAT$1;

    .line 66
    const-string v14, "EEE, dd-MM-yyyy HH:mm:ss z"

    const-string v15, "EEE MMM d yyyy HH:mm:ss z"

    const-string v1, "EEE, dd MMM yyyy HH:mm:ss zzz"

    const-string v2, "EEEE, dd-MMM-yy HH:mm:ss zzz"

    const-string v3, "EEE MMM d HH:mm:ss yyyy"

    const-string v4, "EEE, dd-MMM-yyyy HH:mm:ss z"

    const-string v5, "EEE, dd-MMM-yyyy HH-mm-ss z"

    const-string v6, "EEE, dd MMM yy HH:mm:ss z"

    const-string v7, "EEE dd-MMM-yyyy HH:mm:ss z"

    const-string v8, "EEE dd MMM yyyy HH:mm:ss z"

    const-string v9, "EEE dd-MMM-yyyy HH-mm-ss z"

    const-string v10, "EEE dd-MMM-yy HH:mm:ss z"

    const-string v11, "EEE dd MMM yy HH:mm:ss z"

    const-string v12, "EEE,dd-MMM-yy HH:mm:ss z"

    const-string v13, "EEE,dd-MMM-yyyy HH:mm:ss z"

    filled-new-array/range {v1 .. v15}, [Ljava/lang/String;

    move-result-object v0

    .line 45
    sput-object v0, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->BROWSER_COMPATIBLE_DATE_FORMAT_STRINGS:[Ljava/lang/String;

    .line 70
    const/16 v0, 0xf

    new-array v0, v0, [Ljava/text/DateFormat;

    sput-object v0, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->BROWSER_COMPATIBLE_DATE_FORMATS:[Ljava/text/DateFormat;

    return-void
.end method

.method public static final toHttpDateOrNull(Ljava/lang/String;)Ljava/util/Date;
    .registers 11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 76
    :cond_0
    new-instance v0, Ljava/text/ParsePosition;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Ljava/text/ParsePosition;-><init>(I)V

    .line 77
    sget-object v3, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->STANDARD_DATE_FORMAT:Lnicoid/network238/okhttp3/internal/http/DateFormattingKt$STANDARD_DATE_FORMAT$1;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/text/DateFormat;

    invoke-virtual {v3, p0, v0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v3

    .line 78
    invoke-virtual {v0}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v4, v5, :cond_1

    return-object v3

    .line 83
    :cond_1
    sget-object v3, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->BROWSER_COMPATIBLE_DATE_FORMAT_STRINGS:[Ljava/lang/String;

    monitor-enter v3

    .line 84
    :try_start_0
    array-length v4, v3

    move v5, v2

    :goto_0
    if-ge v5, v4, :cond_4

    .line 85
    sget-object v6, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->BROWSER_COMPATIBLE_DATE_FORMATS:[Ljava/text/DateFormat;

    aget-object v7, v6, v5

    if-nez v7, :cond_2

    .line 88
    new-instance v7, Ljava/text/SimpleDateFormat;

    sget-object v8, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->BROWSER_COMPATIBLE_DATE_FORMAT_STRINGS:[Ljava/lang/String;

    aget-object v8, v8, v5

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v7, v8, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 91
    sget-object v8, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->UTC:Ljava/util/TimeZone;

    invoke-virtual {v7, v8}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 93
    aput-object v7, v6, v5

    :cond_2
    nop

    .line 95
    invoke-virtual {v0, v2}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 96
    invoke-virtual {v7, p0, v0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v6

    .line 97
    invoke-virtual {v0}, Ljava/text/ParsePosition;->getIndex()I

    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v7, :cond_3

    .line 83
    monitor-exit v3

    return-object v6

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 106
    :cond_4
    :try_start_1
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    monitor-exit v3

    return-object v1

    :catchall_0
    move-exception p0

    monitor-exit v3

    throw p0
.end method

.method public static final toHttpDateString(Ljava/util/Date;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    sget-object v0, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->STANDARD_DATE_FORMAT:Lnicoid/network238/okhttp3/internal/http/DateFormattingKt$STANDARD_DATE_FORMAT$1;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/DateFormat;

    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method
