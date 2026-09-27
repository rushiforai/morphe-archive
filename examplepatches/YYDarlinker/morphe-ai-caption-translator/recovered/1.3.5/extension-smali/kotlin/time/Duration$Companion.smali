.class public final Lkotlin/time/Duration$Companion;
.super Ljava/lang/Object;
.source "Duration.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/time/Duration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDuration.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Duration.kt\nkotlin/time/Duration$Companion\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 Duration.kt\nkotlin/time/DurationKt\n*L\n1#1,1629:1\n1#2:1630\n1465#3:1631\n1465#3:1632\n*S KotlinDebug\n*F\n+ 1 Duration.kt\nkotlin/time/Duration$Companion\n*L\n337#1:1631\n347#1:1632\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0010\n\u0002\u0010\u0006\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0016\n\u0002\u0010\u000e\n\u0002\u0008\t\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0019\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0080\u0080\u0004\u00a2\u0006\u0004\u0008\u0008\u0010\tJ&\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001bH\u0087\u0080\u0004b\u0002\u0008\u001dJ\u0019\u0010:\u001a\u00020\u00052\u0006\u0010\u0019\u001a\u00020;H\u0086\u0080\u0004\u00a2\u0006\u0004\u0008<\u0010=J\u0019\u0010>\u001a\u00020\u00052\u0006\u0010\u0019\u001a\u00020;H\u0086\u0080\u0004\u00a2\u0006\u0004\u0008?\u0010=J\u0019\u0010@\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0019\u001a\u00020;H\u0086\u0080\u0004\u00a2\u0006\u0002\u0008AJ\u0019\u0010B\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0019\u001a\u00020;H\u0086\u0080\u0004\u00a2\u0006\u0002\u0008CR\u001d\u0010\n\u001a\u00020\u0005X\u0086\u0084\u0008\u00a2\u0006\u0010\n\u0002\u0010\u000e\u0012\u0004\u0008\u000b\u0010\u0003\u001a\u0004\u0008\u000c\u0010\rR\u0017\u0010\u000f\u001a\u00020\u0005X\u0086\u0084\u0008\u00a2\u0006\n\n\u0002\u0010\u000e\u001a\u0004\u0008\u0010\u0010\rR\u0017\u0010\u0011\u001a\u00020\u0005X\u0080\u0084\u0008\u00a2\u0006\n\n\u0002\u0010\u000e\u001a\u0004\u0008\u0012\u0010\rR\u000f\u0010\u0013\u001a\u00020\u0007X\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u001d\u0010\u0014\u001a\u00020\u0005X\u0080\u0084\u0008\u00a2\u0006\u0010\n\u0002\u0010\u000e\u0012\u0004\u0008\u0015\u0010\u0003\u001a\u0004\u0008\u0016\u0010\rR$\u0010\u001e\u001a\u00020\u0005*\u00020\u001f8\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008 \u0010!\u001a\u0004\u0008\"\u0010#R$\u0010\u001e\u001a\u00020\u0005*\u00020\u00078\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008 \u0010%\u001a\u0004\u0008\"\u0010\tR$\u0010\u001e\u001a\u00020\u0005*\u00020\u00188\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008 \u0010&\u001a\u0004\u0008\"\u0010\'R$\u0010(\u001a\u00020\u0005*\u00020\u001f8\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008)\u0010!\u001a\u0004\u0008*\u0010#R$\u0010(\u001a\u00020\u0005*\u00020\u00078\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008)\u0010%\u001a\u0004\u0008*\u0010\tR$\u0010(\u001a\u00020\u0005*\u00020\u00188\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008)\u0010&\u001a\u0004\u0008*\u0010\'R$\u0010+\u001a\u00020\u0005*\u00020\u001f8\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008,\u0010!\u001a\u0004\u0008-\u0010#R$\u0010+\u001a\u00020\u0005*\u00020\u00078\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008,\u0010%\u001a\u0004\u0008-\u0010\tR$\u0010+\u001a\u00020\u0005*\u00020\u00188\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008,\u0010&\u001a\u0004\u0008-\u0010\'R$\u0010.\u001a\u00020\u0005*\u00020\u001f8\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008/\u0010!\u001a\u0004\u00080\u0010#R$\u0010.\u001a\u00020\u0005*\u00020\u00078\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008/\u0010%\u001a\u0004\u00080\u0010\tR$\u0010.\u001a\u00020\u0005*\u00020\u00188\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u0008/\u0010&\u001a\u0004\u00080\u0010\'R$\u00101\u001a\u00020\u0005*\u00020\u001f8\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u00082\u0010!\u001a\u0004\u00083\u0010#R$\u00101\u001a\u00020\u0005*\u00020\u00078\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u00082\u0010%\u001a\u0004\u00083\u0010\tR$\u00101\u001a\u00020\u0005*\u00020\u00188\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u00082\u0010&\u001a\u0004\u00083\u0010\'R$\u00104\u001a\u00020\u0005*\u00020\u001f8\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u00085\u0010!\u001a\u0004\u00086\u0010#R$\u00104\u001a\u00020\u0005*\u00020\u00078\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u00085\u0010%\u001a\u0004\u00086\u0010\tR$\u00104\u001a\u00020\u0005*\u00020\u00188\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u00085\u0010&\u001a\u0004\u00086\u0010\'R$\u00107\u001a\u00020\u0005*\u00020\u001f8\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u00088\u0010!\u001a\u0004\u00089\u0010#R$\u00107\u001a\u00020\u0005*\u00020\u00078\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u00088\u0010%\u001a\u0004\u00089\u0010\tR$\u00107\u001a\u00020\u0005*\u00020\u00188\u00c6\u0002X\u0087\u0084\u0008r\u0002\u0008$\u00a2\u0006\u000c\u0012\u0004\u00088\u0010&\u001a\u0004\u00089\u0010\'\u00a8\u0006D"
    }
    d2 = {
        "Lkotlin/time/Duration$Companion;",
        "",
        "<init>",
        "()V",
        "fromRawValue",
        "Lkotlin/time/Duration;",
        "rawValue",
        "",
        "fromRawValue-UwyO8pc$kotlin_stdlib",
        "(J)J",
        "ZERO",
        "getZERO-UwyO8pc$annotations",
        "getZERO-UwyO8pc",
        "()J",
        "J",
        "INFINITE",
        "getINFINITE-UwyO8pc",
        "NEG_INFINITE",
        "getNEG_INFINITE-UwyO8pc$kotlin_stdlib",
        "INVALID_RAW_VALUE",
        "INVALID",
        "getINVALID-UwyO8pc$kotlin_stdlib$annotations",
        "getINVALID-UwyO8pc$kotlin_stdlib",
        "convert",
        "",
        "value",
        "sourceUnit",
        "Lkotlin/time/DurationUnit;",
        "targetUnit",
        "Lkotlin/time/ExperimentalTime;",
        "nanoseconds",
        "",
        "getNanoseconds-UwyO8pc$annotations",
        "(I)V",
        "getNanoseconds-UwyO8pc",
        "(I)J",
        "Lkotlin/internal/InlineOnly;",
        "(J)V",
        "(D)V",
        "(D)J",
        "microseconds",
        "getMicroseconds-UwyO8pc$annotations",
        "getMicroseconds-UwyO8pc",
        "milliseconds",
        "getMilliseconds-UwyO8pc$annotations",
        "getMilliseconds-UwyO8pc",
        "seconds",
        "getSeconds-UwyO8pc$annotations",
        "getSeconds-UwyO8pc",
        "minutes",
        "getMinutes-UwyO8pc$annotations",
        "getMinutes-UwyO8pc",
        "hours",
        "getHours-UwyO8pc$annotations",
        "getHours-UwyO8pc",
        "days",
        "getDays-UwyO8pc$annotations",
        "getDays-UwyO8pc",
        "parse",
        "",
        "parse-UwyO8pc",
        "(Ljava/lang/String;)J",
        "parseIsoString",
        "parseIsoString-UwyO8pc",
        "parseOrNull",
        "parseOrNull-FghU774",
        "parseIsoStringOrNull",
        "parseIsoStringOrNull-FghU774",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lkotlin/time/Duration$Companion;-><init>()V

    return-void
.end method

.method private final getDays-UwyO8pc(D)J
    .registers 3

    .line 283
    sget-object p0, Lkotlin/time/DurationUnit;->DAYS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(DLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getDays-UwyO8pc(I)J
    .registers 2

    .line 256
    sget-object p0, Lkotlin/time/DurationUnit;->DAYS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p0}, Lkotlin/time/DurationKt;->toDuration(ILkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getDays-UwyO8pc(J)J
    .registers 3

    .line 268
    sget-object p0, Lkotlin/time/DurationUnit;->DAYS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static synthetic getDays-UwyO8pc$annotations(D)V
    .registers 2

    return-void
.end method

.method public static synthetic getDays-UwyO8pc$annotations(I)V
    .registers 1

    return-void
.end method

.method public static synthetic getDays-UwyO8pc$annotations(J)V
    .registers 2

    return-void
.end method

.method private final getHours-UwyO8pc(D)J
    .registers 3

    .line 243
    sget-object p0, Lkotlin/time/DurationUnit;->HOURS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(DLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getHours-UwyO8pc(I)J
    .registers 2

    .line 224
    sget-object p0, Lkotlin/time/DurationUnit;->HOURS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p0}, Lkotlin/time/DurationKt;->toDuration(ILkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getHours-UwyO8pc(J)J
    .registers 3

    .line 232
    sget-object p0, Lkotlin/time/DurationUnit;->HOURS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static synthetic getHours-UwyO8pc$annotations(D)V
    .registers 2

    return-void
.end method

.method public static synthetic getHours-UwyO8pc$annotations(I)V
    .registers 1

    return-void
.end method

.method public static synthetic getHours-UwyO8pc$annotations(J)V
    .registers 2

    return-void
.end method

.method public static synthetic getINVALID-UwyO8pc$kotlin_stdlib$annotations()V
    .registers 0

    return-void
.end method

.method private final getMicroseconds-UwyO8pc(D)J
    .registers 3

    .line 131
    sget-object p0, Lkotlin/time/DurationUnit;->MICROSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(DLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getMicroseconds-UwyO8pc(I)J
    .registers 2

    .line 112
    sget-object p0, Lkotlin/time/DurationUnit;->MICROSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p0}, Lkotlin/time/DurationKt;->toDuration(ILkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getMicroseconds-UwyO8pc(J)J
    .registers 3

    .line 120
    sget-object p0, Lkotlin/time/DurationUnit;->MICROSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static synthetic getMicroseconds-UwyO8pc$annotations(D)V
    .registers 2

    return-void
.end method

.method public static synthetic getMicroseconds-UwyO8pc$annotations(I)V
    .registers 1

    return-void
.end method

.method public static synthetic getMicroseconds-UwyO8pc$annotations(J)V
    .registers 2

    return-void
.end method

.method private final getMilliseconds-UwyO8pc(D)J
    .registers 3

    .line 159
    sget-object p0, Lkotlin/time/DurationUnit;->MILLISECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(DLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getMilliseconds-UwyO8pc(I)J
    .registers 2

    .line 140
    sget-object p0, Lkotlin/time/DurationUnit;->MILLISECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p0}, Lkotlin/time/DurationKt;->toDuration(ILkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getMilliseconds-UwyO8pc(J)J
    .registers 3

    .line 148
    sget-object p0, Lkotlin/time/DurationUnit;->MILLISECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static synthetic getMilliseconds-UwyO8pc$annotations(D)V
    .registers 2

    return-void
.end method

.method public static synthetic getMilliseconds-UwyO8pc$annotations(I)V
    .registers 1

    return-void
.end method

.method public static synthetic getMilliseconds-UwyO8pc$annotations(J)V
    .registers 2

    return-void
.end method

.method private final getMinutes-UwyO8pc(D)J
    .registers 3

    .line 215
    sget-object p0, Lkotlin/time/DurationUnit;->MINUTES:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(DLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getMinutes-UwyO8pc(I)J
    .registers 2

    .line 196
    sget-object p0, Lkotlin/time/DurationUnit;->MINUTES:Lkotlin/time/DurationUnit;

    invoke-static {p1, p0}, Lkotlin/time/DurationKt;->toDuration(ILkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getMinutes-UwyO8pc(J)J
    .registers 3

    .line 204
    sget-object p0, Lkotlin/time/DurationUnit;->MINUTES:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static synthetic getMinutes-UwyO8pc$annotations(D)V
    .registers 2

    return-void
.end method

.method public static synthetic getMinutes-UwyO8pc$annotations(I)V
    .registers 1

    return-void
.end method

.method public static synthetic getMinutes-UwyO8pc$annotations(J)V
    .registers 2

    return-void
.end method

.method private final getNanoseconds-UwyO8pc(D)J
    .registers 3

    .line 103
    sget-object p0, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(DLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getNanoseconds-UwyO8pc(I)J
    .registers 2

    .line 84
    sget-object p0, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p0}, Lkotlin/time/DurationKt;->toDuration(ILkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getNanoseconds-UwyO8pc(J)J
    .registers 3

    .line 92
    sget-object p0, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static synthetic getNanoseconds-UwyO8pc$annotations(D)V
    .registers 2

    return-void
.end method

.method public static synthetic getNanoseconds-UwyO8pc$annotations(I)V
    .registers 1

    return-void
.end method

.method public static synthetic getNanoseconds-UwyO8pc$annotations(J)V
    .registers 2

    return-void
.end method

.method private final getSeconds-UwyO8pc(D)J
    .registers 3

    .line 187
    sget-object p0, Lkotlin/time/DurationUnit;->SECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(DLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getSeconds-UwyO8pc(I)J
    .registers 2

    .line 168
    sget-object p0, Lkotlin/time/DurationUnit;->SECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p0}, Lkotlin/time/DurationKt;->toDuration(ILkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method private final getSeconds-UwyO8pc(J)J
    .registers 3

    .line 176
    sget-object p0, Lkotlin/time/DurationUnit;->SECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p1, p2, p0}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static synthetic getSeconds-UwyO8pc$annotations(D)V
    .registers 2

    return-void
.end method

.method public static synthetic getSeconds-UwyO8pc$annotations(I)V
    .registers 1

    return-void
.end method

.method public static synthetic getSeconds-UwyO8pc$annotations(J)V
    .registers 2

    return-void
.end method

.method public static synthetic getZERO-UwyO8pc$annotations()V
    .registers 0

    return-void
.end method


# virtual methods
.method public final convert(DLkotlin/time/DurationUnit;Lkotlin/time/DurationUnit;)D
    .registers 5

    const-string p0, "sourceUnit"

    invoke-static {p3, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "targetUnit"

    invoke-static {p4, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    invoke-static {p1, p2, p3, p4}, Lkotlin/time/DurationUnitKt;->convertDurationUnit(DLkotlin/time/DurationUnit;Lkotlin/time/DurationUnit;)D

    move-result-wide p0

    return-wide p0
.end method

.method public final fromRawValue-UwyO8pc$kotlin_stdlib(J)J
    .registers 9

    .line 48
    invoke-static {p1, p2}, Lkotlin/time/Duration;->constructor-impl(J)J

    move-result-wide p0

    .line 49
    invoke-static {}, Lkotlin/time/DurationJvmKt;->getDurationAssertionsEnabled()Z

    move-result p2

    if-eqz p2, :cond_b3

    .line 50
    # invokes: Lkotlin/time/Duration;->isInNanos-impl(J)Z
    invoke-static {p0, p1}, Lkotlin/time/Duration;->access$isInNanos-impl(J)Z

    move-result p2

    if-eqz p2, :cond_42

    .line 51
    # invokes: Lkotlin/time/Duration;->getValue-impl(J)J
    invoke-static {p0, p1}, Lkotlin/time/Duration;->access$getValue-impl(J)J

    move-result-wide v0

    const-wide v2, -0x3ffffffffffa14bfL    # -2.0000000001722644

    cmp-long p2, v2, v0

    if-gtz p2, :cond_27

    const-wide v2, 0x3ffffffffffa14c0L    # 1.999999999913868

    cmp-long p2, v0, v2

    if-gez p2, :cond_27

    return-wide p0

    :cond_27
    new-instance p2, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    # invokes: Lkotlin/time/Duration;->getValue-impl(J)J
    invoke-static {p0, p1}, Lkotlin/time/Duration;->access$getValue-impl(J)J

    move-result-wide p0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " ns is out of nanoseconds range"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p2

    .line 53
    :cond_42
    # invokes: Lkotlin/time/Duration;->getValue-impl(J)J
    invoke-static {p0, p1}, Lkotlin/time/Duration;->access$getValue-impl(J)J

    move-result-wide v0

    const-wide v2, -0x3fffffffffffffffL    # -2.0000000000000004

    cmp-long p2, v2, v0

    const-wide v4, 0x3fffffffffffffffL    # 1.9999999999999998

    if-gez p2, :cond_59

    cmp-long p2, v0, v4

    if-gez p2, :cond_59

    goto :goto_81

    :cond_59
    # invokes: Lkotlin/time/Duration;->getValue-impl(J)J
    invoke-static {p0, p1}, Lkotlin/time/Duration;->access$getValue-impl(J)J

    move-result-wide v0

    cmp-long p2, v0, v4

    if-eqz p2, :cond_81

    cmp-long p2, v0, v2

    if-nez p2, :cond_66

    goto :goto_81

    :cond_66
    new-instance p2, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    # invokes: Lkotlin/time/Duration;->getValue-impl(J)J
    invoke-static {p0, p1}, Lkotlin/time/Duration;->access$getValue-impl(J)J

    move-result-wide p0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " ms is out of milliseconds range"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p2

    .line 54
    :cond_81
    :goto_81
    # invokes: Lkotlin/time/Duration;->getValue-impl(J)J
    invoke-static {p0, p1}, Lkotlin/time/Duration;->access$getValue-impl(J)J

    move-result-wide v0

    const-wide v2, -0x431bde82d7aL

    cmp-long p2, v2, v0

    if-gtz p2, :cond_b3

    const-wide v2, 0x431bde82d7bL

    cmp-long p2, v0, v2

    if-ltz p2, :cond_98

    return-wide p0

    :cond_98
    new-instance p2, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    # invokes: Lkotlin/time/Duration;->getValue-impl(J)J
    invoke-static {p0, p1}, Lkotlin/time/Duration;->access$getValue-impl(J)J

    move-result-wide p0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " ms is denormalized"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p2

    :cond_b3
    return-wide p0
.end method

.method public final getINFINITE-UwyO8pc()J
    .registers 3

    .line 64
    # getter for: Lkotlin/time/Duration;->INFINITE:J
    invoke-static {}, Lkotlin/time/Duration;->access$getINFINITE$cp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final getINVALID-UwyO8pc$kotlin_stdlib()J
    .registers 3

    .line 69
    # getter for: Lkotlin/time/Duration;->INVALID:J
    invoke-static {}, Lkotlin/time/Duration;->access$getINVALID$cp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final getNEG_INFINITE-UwyO8pc$kotlin_stdlib()J
    .registers 3

    .line 65
    # getter for: Lkotlin/time/Duration;->NEG_INFINITE:J
    invoke-static {}, Lkotlin/time/Duration;->access$getNEG_INFINITE$cp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final getZERO-UwyO8pc()J
    .registers 3

    .line 61
    # getter for: Lkotlin/time/Duration;->ZERO:J
    invoke-static {}, Lkotlin/time/Duration;->access$getZERO$cp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final parse-UwyO8pc(Ljava/lang/String;)J
    .registers 6

    const-string p0, "value"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 299
    :try_start_8
    invoke-static {p1, v1, v1, p0, v0}, Lkotlin/time/DurationKt;->parseDuration$default(Ljava/lang/String;ZZILjava/lang/Object;)J

    move-result-wide v0

    sget-object p0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lkotlin/time/Duration;->equals-impl0(JJ)Z

    move-result p0

    if-nez p0, :cond_19

    return-wide v0

    :cond_19
    const-string p0, "invariant failed"

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_25
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8 .. :try_end_25} :catch_25

    :catch_25
    move-exception p0

    .line 301
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid duration string format: \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\'."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    check-cast p0, Ljava/lang/Throwable;

    invoke-direct {v0, p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public final parseIsoString-UwyO8pc(Ljava/lang/String;)J
    .registers 6

    const-string p0, "value"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x4

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 320
    :try_start_9
    invoke-static {p1, v1, v2, p0, v0}, Lkotlin/time/DurationKt;->parseDuration$default(Ljava/lang/String;ZZILjava/lang/Object;)J

    move-result-wide v0

    sget-object p0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lkotlin/time/Duration;->equals-impl0(JJ)Z

    move-result p0

    if-nez p0, :cond_1a

    return-wide v0

    :cond_1a
    const-string p0, "invariant failed"

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_26
    .catch Ljava/lang/IllegalArgumentException; {:try_start_9 .. :try_end_26} :catch_26

    :catch_26
    move-exception p0

    .line 322
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid ISO duration string format: \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\'."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    check-cast p0, Ljava/lang/Throwable;

    invoke-direct {v0, p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public final parseIsoStringOrNull-FghU774(Ljava/lang/String;)Lkotlin/time/Duration;
    .registers 4

    const-string p0, "value"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x1

    const/4 v0, 0x0

    .line 347
    # invokes: Lkotlin/time/DurationKt;->parseDuration(Ljava/lang/String;ZZ)J
    invoke-static {p1, p0, v0}, Lkotlin/time/DurationKt;->access$parseDuration(Ljava/lang/String;ZZ)J

    move-result-wide p0

    .line 1632
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lkotlin/time/Duration;->equals-impl0(JJ)Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 p0, 0x0

    return-object p0

    :cond_19
    invoke-static {p0, p1}, Lkotlin/time/Duration;->box-impl(J)Lkotlin/time/Duration;

    move-result-object p0

    return-object p0
.end method

.method public final parseOrNull-FghU774(Ljava/lang/String;)Lkotlin/time/Duration;
    .registers 4

    const-string p0, "value"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 337
    # invokes: Lkotlin/time/DurationKt;->parseDuration(Ljava/lang/String;ZZ)J
    invoke-static {p1, p0, p0}, Lkotlin/time/DurationKt;->access$parseDuration(Ljava/lang/String;ZZ)J

    move-result-wide p0

    .line 1631
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lkotlin/time/Duration;->equals-impl0(JJ)Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 p0, 0x0

    return-object p0

    :cond_18
    invoke-static {p0, p1}, Lkotlin/time/Duration;->box-impl(J)Lkotlin/time/Duration;

    move-result-object p0

    return-object p0
.end method
