.class public final Lkotlin/jvm/internal/FloatCompanionObject;
.super Ljava/lang/Object;
.source "PrimitiveCompanionObjects.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u0008\n\u0002\u0008\t\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\n\u0010\u0017\u001a\u00020\u0005H\u0086\u0080\u0004J\n\u0010\u0018\u001a\u00020\u0005H\u0086\u0080\u0004J\n\u0010\u0019\u001a\u00020\u0005H\u0086\u0080\u0004J\n\u0010\u001a\u001a\u00020\u0005H\u0086\u0080\u0004J\n\u0010\u001b\u001a\u00020\u0005H\u0086\u0080\u0004R%\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0006\u0010\u0003R%\u0010\n\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u000b\u0010\u0003R%\u0010\u000c\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\r\u0010\u0003R%\u0010\u000e\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u000f\u0010\u0003R%\u0010\u0010\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0011\u0010\u0003R%\u0010\u0012\u001a\u00020\u00138\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0014\u0010\u0003R%\u0010\u0015\u001a\u00020\u00138\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0016\u0010\u0003\u00a8\u0006\u001c"
    }
    d2 = {
        "Lkotlin/jvm/internal/FloatCompanionObject;",
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
.field public static final INSTANCE:Lkotlin/jvm/internal/FloatCompanionObject;

.field public static final MAX_VALUE:F = 3.4028235E38f

.field public static final MIN_VALUE:F = 1.4E-45f

.field public static final NEGATIVE_INFINITY:F = -Infinityf

.field public static final NaN:F = NaNf

.field public static final POSITIVE_INFINITY:F = Infinityf

.field public static final SIZE_BITS:I = 0x20

.field public static final SIZE_BYTES:I = 0x4


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lkotlin/jvm/internal/FloatCompanionObject;

    invoke-direct {v0}, Lkotlin/jvm/internal/FloatCompanionObject;-><init>()V

    sput-object v0, Lkotlin/jvm/internal/FloatCompanionObject;->INSTANCE:Lkotlin/jvm/internal/FloatCompanionObject;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 34
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
.method public final getMAX_VALUE()F
    .registers 1

    const p0, 0x7f7fffff    # Float.MAX_VALUE

    return p0
.end method

.method public final getMIN_VALUE()F
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final getNEGATIVE_INFINITY()F
    .registers 1

    const/high16 p0, -0x800000    # Float.NEGATIVE_INFINITY

    return p0
.end method

.method public final getNaN()F
    .registers 1

    const/high16 p0, 0x7fc00000    # Float.NaN

    return p0
.end method

.method public final getPOSITIVE_INFINITY()F
    .registers 1

    const/high16 p0, 0x7f800000    # Float.POSITIVE_INFINITY

    return p0
.end method
