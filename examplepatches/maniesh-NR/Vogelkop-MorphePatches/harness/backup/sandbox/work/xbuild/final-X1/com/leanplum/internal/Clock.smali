.class public abstract Lcom/leanplum/internal/Clock;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DAY_MILLIS:J = 0x5265c00L

.field private static INSTANCE:Lcom/leanplum/internal/Clock; = null

.field public static final MONTH_MILLIS:J = 0x9a7ec800L

.field public static final SYSTEM:Lcom/leanplum/internal/Clock;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/internal/Clock$1;

    invoke-direct {v0}, Lcom/leanplum/internal/Clock$1;-><init>()V

    sput-object v0, Lcom/leanplum/internal/Clock;->SYSTEM:Lcom/leanplum/internal/Clock;

    sput-object v0, Lcom/leanplum/internal/Clock;->INSTANCE:Lcom/leanplum/internal/Clock;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/leanplum/internal/Clock;
    .registers 1

    sget-object v0, Lcom/leanplum/internal/Clock;->INSTANCE:Lcom/leanplum/internal/Clock;

    return-object v0
.end method

.method public static setInstance(Lcom/leanplum/internal/Clock;)V
    .registers 1

    sput-object p0, Lcom/leanplum/internal/Clock;->INSTANCE:Lcom/leanplum/internal/Clock;

    return-void
.end method


# virtual methods
.method public abstract currentTimeMillis()J
.end method

.method public lessThanMonthAgo(J)Z
    .registers 5

    invoke-virtual {p0}, Lcom/leanplum/internal/Clock;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, p1

    const-wide p0, 0x9a7ec800L

    cmp-long p0, v0, p0

    if-gez p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public abstract newDate()Ljava/util/Date;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method
