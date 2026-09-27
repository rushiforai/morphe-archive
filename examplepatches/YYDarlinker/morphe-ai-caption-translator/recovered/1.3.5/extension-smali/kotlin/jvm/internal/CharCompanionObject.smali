.class public final Lkotlin/jvm/internal/CharCompanionObject;
.super Ljava/lang/Object;
.source "PrimitiveCompanionObjects.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000c\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u0008\n\u0002\u0008\u0004\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R%\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0006\u0010\u0003R%\u0010\n\u001a\u00020\u00058\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u000b\u0010\u0003R\u000f\u0010\u000c\u001a\u00020\u0005X\u0086\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\r\u001a\u00020\u0005X\u0086\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000e\u001a\u00020\u0005X\u0086\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000f\u001a\u00020\u0005X\u0086\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0010\u001a\u00020\u0005X\u0086\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0011\u001a\u00020\u0005X\u0086\u00d4\u0008\u00a2\u0006\u0002\n\u0000R%\u0010\u0012\u001a\u00020\u00138\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0014\u0010\u0003R%\u0010\u0015\u001a\u00020\u00138\u0006X\u0087\u00d4\u0008r\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0016\u0010\u0003\u00a8\u0006\u0017"
    }
    d2 = {
        "Lkotlin/jvm/internal/CharCompanionObject;",
        "",
        "<init>",
        "()V",
        "MIN_VALUE",
        "",
        "getMIN_VALUE$annotations",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.3",
        "MAX_VALUE",
        "getMAX_VALUE$annotations",
        "MIN_HIGH_SURROGATE",
        "MAX_HIGH_SURROGATE",
        "MIN_LOW_SURROGATE",
        "MAX_LOW_SURROGATE",
        "MIN_SURROGATE",
        "MAX_SURROGATE",
        "SIZE_BYTES",
        "",
        "getSIZE_BYTES$annotations",
        "SIZE_BITS",
        "getSIZE_BITS$annotations",
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
.field public static final INSTANCE:Lkotlin/jvm/internal/CharCompanionObject;

.field public static final MAX_HIGH_SURROGATE:C = '\udbff'

.field public static final MAX_LOW_SURROGATE:C = '\udfff'

.field public static final MAX_SURROGATE:C = '\udfff'

.field public static final MAX_VALUE:C = '\uffff'

.field public static final MIN_HIGH_SURROGATE:C = '\ud800'

.field public static final MIN_LOW_SURROGATE:C = '\udc00'

.field public static final MIN_SURROGATE:C = '\ud800'

.field public static final MIN_VALUE:C = '\u0000'

.field public static final SIZE_BITS:I = 0x10

.field public static final SIZE_BYTES:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lkotlin/jvm/internal/CharCompanionObject;

    invoke-direct {v0}, Lkotlin/jvm/internal/CharCompanionObject;-><init>()V

    sput-object v0, Lkotlin/jvm/internal/CharCompanionObject;->INSTANCE:Lkotlin/jvm/internal/CharCompanionObject;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 95
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

.method public static synthetic getSIZE_BITS$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic getSIZE_BYTES$annotations()V
    .registers 0

    return-void
.end method
