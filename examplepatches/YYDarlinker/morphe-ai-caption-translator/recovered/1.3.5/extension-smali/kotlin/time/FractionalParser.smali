.class public final Lkotlin/time/FractionalParser;
.super Ljava/lang/Object;
.source "Duration.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDuration.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Duration.kt\nkotlin/time/FractionalParser\n+ 2 Strings.kt\nkotlin/text/StringsKt__StringsKt\n*L\n1#1,1629:1\n1367#1,14:1630\n1367#1,14:1644\n1665#2,3:1658\n*S KotlinDebug\n*F\n+ 1 Duration.kt\nkotlin/time/FractionalParser\n*L\n1359#1:1630,14\n1360#1:1644,14\n1361#1:1658,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J@\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2!\u0010\n\u001a\u001d\u0012\u0013\u0012\u00110\t\u00a2\u0006\u000c\u0008\u000c\u0012\u0008\u0008\r\u0012\u0004\u0008\u0008(\u000e\u0012\u0004\u0012\u00020\u000f0\u000bH\u0086\u0088\u0004\u00f8\u0001\u0000JA\u0010\u0010\u001a\u00020\t*\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\t2!\u0010\n\u001a\u001d\u0012\u0013\u0012\u00110\t\u00a2\u0006\u000c\u0008\u000c\u0012\u0008\u0008\r\u0012\u0004\u0008\u0008(\u000e\u0012\u0004\u0012\u00020\u000f0\u000bH\u0082\u0088\u0004\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u0012"
    }
    d2 = {
        "Lkotlin/time/FractionalParser;",
        "",
        "<init>",
        "()V",
        "parse",
        "",
        "value",
        "",
        "startIndex",
        "",
        "callback",
        "Lkotlin/Function1;",
        "Lkotlin/ParameterName;",
        "name",
        "endIndex",
        "",
        "parseDigits",
        "maxDigits",
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
.field public static final INSTANCE:Lkotlin/time/FractionalParser;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lkotlin/time/FractionalParser;

    invoke-direct {v0}, Lkotlin/time/FractionalParser;-><init>()V

    sput-object v0, Lkotlin/time/FractionalParser;->INSTANCE:Lkotlin/time/FractionalParser;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 1346
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final parseDigits(Ljava/lang/String;IILkotlin/jvm/functions/Function1;)I
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;)I"
        }
    .end annotation

    add-int p0, p2, p3

    .line 1368
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v0, 0x0

    move v1, p2

    move v2, v0

    :goto_d
    if-ge v1, p0, :cond_27

    .line 1371
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x30

    if-gt v4, v3, :cond_27

    const/16 v4, 0x3a

    if-ge v3, v4, :cond_27

    shl-int/lit8 v4, v2, 0x3

    shl-int/lit8 v2, v2, 0x1

    add-int/2addr v4, v2

    add-int/lit8 v3, v3, -0x30

    add-int v2, v4, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    :cond_27
    sub-int p0, v1, p2

    sub-int/2addr p3, p0

    :goto_2a
    if-ge v0, p3, :cond_35

    shl-int/lit8 p0, v2, 0x3

    shl-int/lit8 p1, v2, 0x1

    add-int v2, p0, p1

    add-int/lit8 v0, v0, 0x1

    goto :goto_2a

    .line 1379
    :cond_35
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p4, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return v2
.end method


# virtual methods
.method public final parse(Ljava/lang/String;ILkotlin/jvm/functions/Function1;)J
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;)J"
        }
    .end annotation

    const-string p0, "value"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "callback"

    invoke-static {p3, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    add-int/lit8 p0, p2, 0x6

    .line 1631
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v0, 0x0

    move v1, p2

    move v2, v0

    :goto_17
    const/16 v3, 0x3a

    const/16 v4, 0x30

    if-ge v1, p0, :cond_31

    .line 1634
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-gt v4, v5, :cond_31

    if-ge v5, v3, :cond_31

    shl-int/lit8 v3, v2, 0x3

    shl-int/lit8 v2, v2, 0x1

    add-int/2addr v3, v2

    add-int/lit8 v5, v5, -0x30

    add-int v2, v3, v5

    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    :cond_31
    sub-int p0, v1, p2

    rsub-int/lit8 p0, p0, 0x6

    move p2, v0

    :goto_36
    if-ge p2, p0, :cond_40

    shl-int/lit8 v5, v2, 0x3

    shl-int/lit8 v2, v2, 0x1

    add-int/2addr v2, v5

    add-int/lit8 p2, p2, 0x1

    goto :goto_36

    :cond_40
    add-int/lit8 p0, v1, 0x9

    .line 1645
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    invoke-static {p0, p2}, Ljava/lang/Math;->min(II)I

    move-result p0

    move v5, v0

    move p2, v1

    :goto_4c
    if-ge p2, p0, :cond_62

    .line 1648
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-gt v4, v6, :cond_62

    if-ge v6, v3, :cond_62

    shl-int/lit8 v7, v5, 0x3

    shl-int/lit8 v5, v5, 0x1

    add-int/2addr v7, v5

    add-int/lit8 v6, v6, -0x30

    add-int v5, v7, v6

    add-int/lit8 p2, p2, 0x1

    goto :goto_4c

    :cond_62
    sub-int p0, p2, v1

    rsub-int/lit8 p0, p0, 0x9

    :goto_66
    if-ge v0, p0, :cond_70

    shl-int/lit8 v1, v5, 0x3

    shl-int/lit8 v5, v5, 0x1

    add-int/2addr v5, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_66

    .line 1659
    :cond_70
    :goto_70
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    if-ge p2, p0, :cond_81

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p0

    if-gt v4, p0, :cond_81

    if-ge p0, v3, :cond_81

    add-int/lit8 p2, p2, 0x1

    goto :goto_70

    .line 1362
    :cond_81
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p3, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    int-to-long p0, v2

    const-wide/32 p2, 0x3b9aca00

    mul-long/2addr p0, p2

    int-to-long p2, v5

    add-long/2addr p0, p2

    return-wide p0
.end method
