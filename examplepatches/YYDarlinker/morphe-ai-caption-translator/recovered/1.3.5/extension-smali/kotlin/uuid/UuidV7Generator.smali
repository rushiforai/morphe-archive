.class final Lkotlin/uuid/UuidV7Generator;
.super Ljava/lang/Object;
.source "Uuid.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c2\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0086\u0080\u0004R\u000f\u0010\u0004\u001a\u00020\u0005X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0006\u001a\u00020\u0005X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0007\u001a\u00020\u0008X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u0011\u0010\t\u001a\u00020\nX\u0082\u0084\u0008\u00a2\u0006\u0004\n\u0002\u0010\u000b\u00a8\u0006\u0010"
    }
    d2 = {
        "Lkotlin/uuid/UuidV7Generator;",
        "",
        "<init>",
        "()V",
        "TIMESTAMP_BIAS_BITS",
        "",
        "VERSION_MASK",
        "OVERFLOW_MASK",
        "",
        "timestampAndCounter",
        "Lkotlin/concurrent/atomics/AtomicLong;",
        "Ljava/util/concurrent/atomic/AtomicLong;",
        "generate",
        "Lkotlin/uuid/Uuid;",
        "clock",
        "Lkotlin/time/Clock;",
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


# static fields
.field public static final INSTANCE:Lkotlin/uuid/UuidV7Generator;

.field private static final OVERFLOW_MASK:J = 0x8000L

.field private static final TIMESTAMP_BIAS_BITS:I = 0x10

.field private static final VERSION_MASK:I = 0x7000

.field private static final timestampAndCounter:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lkotlin/uuid/UuidV7Generator;

    invoke-direct {v0}, Lkotlin/uuid/UuidV7Generator;-><init>()V

    sput-object v0, Lkotlin/uuid/UuidV7Generator;->INSTANCE:Lkotlin/uuid/UuidV7Generator;

    .line 959
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    sput-object v0, Lkotlin/uuid/UuidV7Generator;->timestampAndCounter:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 940
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final generate(Lkotlin/time/Clock;)Lkotlin/uuid/Uuid;
    .registers 19

    const-string v0, "clock"

    move-object/from16 v1, p1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v0, 0xa

    .line 978
    new-array v0, v0, [B

    .line 979
    invoke-static {v0}, Lkotlin/uuid/UuidKt;->secureRandomBytes([B)V

    const/16 v2, 0x8

    .line 984
    aget-byte v3, v0, v2

    and-int/lit8 v3, v3, 0x7

    shl-int/lit8 v2, v3, 0x8

    const/16 v3, 0x9

    .line 985
    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    or-int/lit16 v2, v2, 0x7000

    .line 991
    :cond_1f
    sget-object v3, Lkotlin/uuid/UuidV7Generator;->timestampAndCounter:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    .line 992
    invoke-interface {v1}, Lkotlin/time/Clock;->now()Lkotlin/time/Instant;

    move-result-object v6

    invoke-virtual {v6}, Lkotlin/time/Instant;->toEpochMilliseconds()J

    move-result-wide v6

    const/16 v8, 0x10

    ushr-long v9, v4, v8

    cmp-long v11, v9, v6

    if-gez v11, :cond_3f

    shl-long/2addr v6, v8

    int-to-long v8, v2

    or-long/2addr v6, v8

    .line 1000
    invoke-virtual {v3, v4, v5, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v3

    if-eqz v3, :cond_1f

    goto :goto_5a

    :cond_3f
    const-wide/16 v6, 0x1

    add-long v11, v4, v6

    const-wide/32 v13, 0x8000

    and-long/2addr v13, v11

    const-wide/16 v15, 0x0

    cmp-long v13, v13, v15

    if-eqz v13, :cond_53

    add-long/2addr v9, v6

    shl-long v6, v9, v8

    int-to-long v8, v2

    or-long/2addr v6, v8

    goto :goto_54

    :cond_53
    move-wide v6, v11

    .line 1012
    :goto_54
    invoke-virtual {v3, v4, v5, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v3

    if-eqz v3, :cond_1f

    :goto_5a
    const/4 v1, 0x0

    .line 1027
    aget-byte v2, v0, v1

    and-int/lit8 v2, v2, 0x3f

    int-to-byte v2, v2

    or-int/lit8 v2, v2, -0x80

    int-to-byte v2, v2

    .line 1029
    aput-byte v2, v0, v1

    .line 1030
    invoke-static {v0, v1}, Lkotlin/uuid/UuidKt;->getLongAt([BI)J

    move-result-wide v0

    .line 1031
    sget-object v2, Lkotlin/uuid/Uuid;->Companion:Lkotlin/uuid/Uuid$Companion;

    invoke-virtual {v2, v6, v7, v0, v1}, Lkotlin/uuid/Uuid$Companion;->fromLongs(JJ)Lkotlin/uuid/Uuid;

    move-result-object v0

    return-object v0
.end method
