.class public final enum Lnicoid/network238/kotlin/time/DurationUnit;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field private static final synthetic $ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lnicoid/network238/kotlin/time/DurationUnit;

.field public static final enum DAYS:Lnicoid/network238/kotlin/time/DurationUnit;

.field public static final enum HOURS:Lnicoid/network238/kotlin/time/DurationUnit;

.field public static final enum MICROSECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

.field public static final enum MILLISECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

.field public static final enum MINUTES:Lnicoid/network238/kotlin/time/DurationUnit;

.field public static final enum NANOSECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

.field public static final enum SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;


# instance fields
.field private final timeUnit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method private static final synthetic $values()[Lnicoid/network238/kotlin/time/DurationUnit;
    .registers 7

    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->NANOSECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v1, Lnicoid/network238/kotlin/time/DurationUnit;->MICROSECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v2, Lnicoid/network238/kotlin/time/DurationUnit;->MILLISECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v3, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v4, Lnicoid/network238/kotlin/time/DurationUnit;->MINUTES:Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v5, Lnicoid/network238/kotlin/time/DurationUnit;->HOURS:Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v6, Lnicoid/network238/kotlin/time/DurationUnit;->DAYS:Lnicoid/network238/kotlin/time/DurationUnit;

    filled-new-array/range {v0 .. v6}, [Lnicoid/network238/kotlin/time/DurationUnit;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 4

    .line 19
    new-instance v0, Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    const-string v2, "NANOSECONDS"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lnicoid/network238/kotlin/time/DurationUnit;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    sput-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->NANOSECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    .line 23
    new-instance v0, Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    const-string v2, "MICROSECONDS"

    const/4 v3, 0x1

    invoke-direct {v0, v2, v3, v1}, Lnicoid/network238/kotlin/time/DurationUnit;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    sput-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->MICROSECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    .line 27
    new-instance v0, Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-string v2, "MILLISECONDS"

    const/4 v3, 0x2

    invoke-direct {v0, v2, v3, v1}, Lnicoid/network238/kotlin/time/DurationUnit;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    sput-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->MILLISECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    .line 31
    new-instance v0, Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-string v2, "SECONDS"

    const/4 v3, 0x3

    invoke-direct {v0, v2, v3, v1}, Lnicoid/network238/kotlin/time/DurationUnit;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    sput-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    .line 35
    new-instance v0, Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-string v2, "MINUTES"

    const/4 v3, 0x4

    invoke-direct {v0, v2, v3, v1}, Lnicoid/network238/kotlin/time/DurationUnit;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    sput-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->MINUTES:Lnicoid/network238/kotlin/time/DurationUnit;

    .line 39
    new-instance v0, Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-string v2, "HOURS"

    const/4 v3, 0x5

    invoke-direct {v0, v2, v3, v1}, Lnicoid/network238/kotlin/time/DurationUnit;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    sput-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->HOURS:Lnicoid/network238/kotlin/time/DurationUnit;

    .line 43
    new-instance v0, Lnicoid/network238/kotlin/time/DurationUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    const-string v2, "DAYS"

    const/4 v3, 0x6

    invoke-direct {v0, v2, v3, v1}, Lnicoid/network238/kotlin/time/DurationUnit;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    sput-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->DAYS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {}, Lnicoid/network238/kotlin/time/DurationUnit;->$values()[Lnicoid/network238/kotlin/time/DurationUnit;

    move-result-object v0

    sput-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->$VALUES:[Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {v0}, Lnicoid/network238/kotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lnicoid/network238/kotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V
    .registers 4

    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lnicoid/network238/kotlin/time/DurationUnit;->timeUnit:Ljava/util/concurrent/TimeUnit;

    return-void
.end method


# virtual methods
.method public final getTimeUnit$kotlin_stdlib()Ljava/util/concurrent/TimeUnit;
    .registers 2

    .line 15
    iget-object v0, p0, Lnicoid/network238/kotlin/time/DurationUnit;->timeUnit:Ljava/util/concurrent/TimeUnit;

    return-object v0
.end method
