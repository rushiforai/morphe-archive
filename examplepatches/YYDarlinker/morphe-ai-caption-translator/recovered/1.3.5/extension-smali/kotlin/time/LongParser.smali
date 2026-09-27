.class public final Lkotlin/time/LongParser;
.super Ljava/lang/Object;
.source "Duration.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/time/LongParser$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDuration.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Duration.kt\nkotlin/time/LongParser\n+ 2 Strings.kt\nkotlin/text/StringsKt__StringsKt\n*L\n1#1,1629:1\n1665#2,3:1630\n1665#2,3:1633\n*S KotlinDebug\n*F\n+ 1 Duration.kt\nkotlin/time/LongParser\n*L\n1311#1:1630,3\n1318#1:1633,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u0000\u0018\u0000 \u00172\u00020\u0001:\u0001\u0017B\u0019\u0008B\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007Jw\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2K\u0010\u000f\u001aG\u0012\u0013\u0012\u00110\u000e\u00a2\u0006\u000c\u0008\u0011\u0012\u0008\u0008\u0012\u0012\u0004\u0008\u0008(\u0013\u0012\u0013\u0012\u00110\u000e\u00a2\u0006\u000c\u0008\u0011\u0012\u0008\u0008\u0012\u0012\u0004\u0008\u0008(\u0014\u0012\u0013\u0012\u00110\u0005\u00a2\u0006\u000c\u0008\u0011\u0012\u0008\u0008\u0012\u0012\u0004\u0008\u0008(\u0015\u0012\u0004\u0012\u00020\u00160\u0010H\u0086\u0088\u0004\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0003 \u0001R\u000f\u0010\u0002\u001a\u00020\u0003X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0004\u001a\u00020\u0005X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0008\u001a\u00020\u0003X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\t\u001a\u00020\u0003X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u0018"
    }
    d2 = {
        "Lkotlin/time/LongParser;",
        "",
        "overflowLimit",
        "",
        "allowSign",
        "",
        "<init>",
        "(JZ)V",
        "overflowThreshold",
        "lastDigitMax",
        "parse",
        "value",
        "",
        "startIndex",
        "",
        "callback",
        "Lkotlin/Function3;",
        "Lkotlin/ParameterName;",
        "name",
        "endIndex",
        "sign",
        "hasOverflow",
        "",
        "Companion",
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
.field public static final Companion:Lkotlin/time/LongParser$Companion;

.field private static final default:Lkotlin/time/LongParser;

.field private static final iso:Lkotlin/time/LongParser;


# instance fields
.field private final allowSign:Z

.field private final lastDigitMax:J

.field private final overflowLimit:J

.field private final overflowThreshold:J


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lkotlin/time/LongParser$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/time/LongParser$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/time/LongParser;->Companion:Lkotlin/time/LongParser$Companion;

    .line 1330
    new-instance v0, Lkotlin/time/LongParser;

    const-wide v1, 0x3fffffffffffffffL    # 1.9999999999999998

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lkotlin/time/LongParser;-><init>(JZ)V

    sput-object v0, Lkotlin/time/LongParser;->iso:Lkotlin/time/LongParser;

    .line 1331
    new-instance v0, Lkotlin/time/LongParser;

    const-wide v1, 0x7fffffffffffffffL

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lkotlin/time/LongParser;-><init>(JZ)V

    sput-object v0, Lkotlin/time/LongParser;->default:Lkotlin/time/LongParser;

    return-void
.end method

.method private constructor <init>(JZ)V
    .registers 8

    .line 1282
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lkotlin/time/LongParser;->overflowLimit:J

    iput-boolean p3, p0, Lkotlin/time/LongParser;->allowSign:Z

    const-wide/16 v0, 0xa

    .line 1285
    div-long v2, p1, v0

    iput-wide v2, p0, Lkotlin/time/LongParser;->overflowThreshold:J

    .line 1288
    rem-long/2addr p1, v0

    iput-wide p1, p0, Lkotlin/time/LongParser;->lastDigitMax:J

    return-void
.end method

.method public static final synthetic access$getAllowSign$p(Lkotlin/time/LongParser;)Z
    .registers 1

    .line 1282
    iget-boolean p0, p0, Lkotlin/time/LongParser;->allowSign:Z

    return p0
.end method

.method public static final synthetic access$getDefault$cp()Lkotlin/time/LongParser;
    .registers 1

    .line 1282
    sget-object v0, Lkotlin/time/LongParser;->default:Lkotlin/time/LongParser;

    return-object v0
.end method

.method public static final synthetic access$getIso$cp()Lkotlin/time/LongParser;
    .registers 1

    .line 1282
    sget-object v0, Lkotlin/time/LongParser;->iso:Lkotlin/time/LongParser;

    return-object v0
.end method

.method public static final synthetic access$getLastDigitMax$p(Lkotlin/time/LongParser;)J
    .registers 3

    .line 1282
    iget-wide v0, p0, Lkotlin/time/LongParser;->lastDigitMax:J

    return-wide v0
.end method

.method public static final synthetic access$getOverflowLimit$p(Lkotlin/time/LongParser;)J
    .registers 3

    .line 1282
    iget-wide v0, p0, Lkotlin/time/LongParser;->overflowLimit:J

    return-wide v0
.end method

.method public static final synthetic access$getOverflowThreshold$p(Lkotlin/time/LongParser;)J
    .registers 3

    .line 1282
    iget-wide v0, p0, Lkotlin/time/LongParser;->overflowThreshold:J

    return-wide v0
.end method


# virtual methods
.method public final parse(Ljava/lang/String;ILkotlin/jvm/functions/Function3;)J
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Ljava/lang/Integer;",
            "-",
            "Ljava/lang/Integer;",
            "-",
            "Ljava/lang/Boolean;",
            "Lkotlin/Unit;",
            ">;)J"
        }
    .end annotation

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1302
    # getter for: Lkotlin/time/LongParser;->allowSign:Z
    invoke-static {p0}, Lkotlin/time/LongParser;->access$getAllowSign$p(Lkotlin/time/LongParser;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_24

    .line 1303
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x2b

    if-eq v0, v2, :cond_22

    const/16 v2, 0x2d

    if-eq v0, v2, :cond_1e

    goto :goto_24

    :cond_1e
    add-int/lit8 p2, p2, 0x1

    const/4 v0, -0x1

    goto :goto_25

    :cond_22
    add-int/lit8 p2, p2, 0x1

    :cond_24
    :goto_24
    move v0, v1

    .line 1631
    :goto_25
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x30

    if-ge p2, v2, :cond_36

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v3, :cond_36

    add-int/lit8 p2, p2, 0x1

    goto :goto_25

    :cond_36
    const-wide/16 v4, 0x0

    .line 1313
    :goto_38
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge p2, v2, :cond_93

    .line 1314
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-gt v3, v2, :cond_93

    const/16 v6, 0x3a

    if-ge v2, v6, :cond_93

    add-int/lit8 v2, v2, -0x30

    .line 1317
    # getter for: Lkotlin/time/LongParser;->overflowThreshold:J
    invoke-static {p0}, Lkotlin/time/LongParser;->access$getOverflowThreshold$p(Lkotlin/time/LongParser;)J

    move-result-wide v7

    cmp-long v7, v4, v7

    if-gtz v7, :cond_6e

    # getter for: Lkotlin/time/LongParser;->overflowThreshold:J
    invoke-static {p0}, Lkotlin/time/LongParser;->access$getOverflowThreshold$p(Lkotlin/time/LongParser;)J

    move-result-wide v7

    cmp-long v7, v4, v7

    if-nez v7, :cond_64

    int-to-long v7, v2

    # getter for: Lkotlin/time/LongParser;->lastDigitMax:J
    invoke-static {p0}, Lkotlin/time/LongParser;->access$getLastDigitMax$p(Lkotlin/time/LongParser;)J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-lez v7, :cond_64

    goto :goto_6e

    :cond_64
    const/4 v6, 0x3

    shl-long v6, v4, v6

    shl-long/2addr v4, v1

    add-long/2addr v6, v4

    int-to-long v4, v2

    add-long/2addr v4, v6

    add-int/lit8 p2, p2, 0x1

    goto :goto_38

    .line 1634
    :cond_6e
    :goto_6e
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge p2, v2, :cond_7f

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-gt v3, v2, :cond_7f

    if-ge v2, v6, :cond_7f

    add-int/lit8 p2, p2, 0x1

    goto :goto_6e

    .line 1319
    :cond_7f
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p3, p1, p2, v0}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1320
    # getter for: Lkotlin/time/LongParser;->overflowLimit:J
    invoke-static {p0}, Lkotlin/time/LongParser;->access$getOverflowLimit$p(Lkotlin/time/LongParser;)J

    move-result-wide p0

    return-wide p0

    .line 1325
    :cond_93
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-interface {p3, p0, p1, p2}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-wide v4
.end method
