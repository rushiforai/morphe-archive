.class public final Lkotlin/jvm/internal/DoubleCompanionObject;
.super Ljava/lang/Object;
.source "PrimitiveCompanionObjects.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0006\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u0008\n\u0002\u0008\t\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\n\u0010\u0017\u001a\u00020\u0005H\u0086\u0080\u0004J\n\u0010\u0018\u001a\u00020\u0005H\u0086\u0080\u0004J\n\u0010\u0019\u001a\u00020\u0005H\u0086\u0080\u0004J\n\u0010\u001a\u001a\u00020\u0005H\u0086\u0080\u0004J\n\u0010\u001b\u001a\u00020\u0005H\u0086\u0080\u0004R%\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0006\u0010\u0003R%\u0010\n\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u000b\u0010\u0003R%\u0010\u000c\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\r\u0010\u0003R%\u0010\u000e\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u000f\u0010\u0003R%\u0010\u0010\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0011\u0010\u0003R%\u0010\u0012\u001a\u00020\u00138\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0014\u0010\u0003R%\u0010\u0015\u001a\u00020\u00138\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0016\u0010\u0003\u00a8\u0006\u001c"
    }
    d2 = {
        "Lkotlin/jvm/internal/DoubleCompanionObject;",
        "",
        "<init>",
        "()V",
        "MIN_VALUE",
        "",
        "getMIN_VALUE$annotations",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.4",
        "MAX_VALUE",
        "getMAX_VALUE$annotations",
        "POSITIVE_INFINITY",
        "getPOSITIVE_INFINITY$annotations",
        "NEGATIVE_INFINITY",
        "getNEGATIVE_INFINITY$annotations",
        "NaN",
        "getNaN$annotations",
        "SIZE_BYTES",
        "",
        "getSIZE_BYTES$annotations",
        "SIZE_BITS",
        "getSIZE_BITS$annotations",
        "getMIN_VALUE",
        "getMAX_VALUE",
        "getPOSITIVE_INFINITY",
        "getNEGATIVE_INFINITY",
        "getNaN",
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
.field public static final INSTANCE:Lkotlin/jvm/internal/DoubleCompanionObject;

.field public static final MAX_VALUE:D = 1.7976931348623157E308

.field public static final MIN_VALUE:D = 4.9E-324

.field public static final NEGATIVE_INFINITY:D = -Infinity

.field public static final NaN:D = NaN

.field public static final POSITIVE_INFINITY:D = Infinity

.field public static final SIZE_BITS:I = 0x40

.field public static final SIZE_BYTES:I = 0x8


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lkotlin/jvm/internal/DoubleCompanionObject;

    invoke-direct {v0}, Lkotlin/jvm/internal/DoubleCompanionObject;-><init>()V

    sput-object v0, Lkotlin/jvm/internal/DoubleCompanionObject;->INSTANCE:Lkotlin/jvm/internal/DoubleCompanionObject;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic getMAX_VALUE$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic getMIN_VALUE$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic getNEGATIVE_INFINITY$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic getNaN$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic getPOSITIVE_INFINITY$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic getSIZE_BITS$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic getSIZE_BYTES$annotations()V
    .registers 0

    return-void
.end method


# virtual methods
.method public final getMAX_VALUE()D
    .registers 3

    const-wide v0, 0x7fefffffffffffffL    # Double.MAX_VALUE

    return-wide v0
.end method

.method public final getMIN_VALUE()D
    .registers 3

    const-wide/16 v0, 0x1

    return-wide v0
.end method

.method public final getNEGATIVE_INFINITY()D
    .registers 3

    const-wide/high16 v0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    return-wide v0
.end method

.method public final getNaN()D
    .registers 3

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    return-wide v0
.end method

.method public final getPOSITIVE_INFINITY()D
    .registers 3

    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    return-wide v0
.end method
