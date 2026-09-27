.class public final Lkotlin/collections/builders/MapBuilder$Companion;
.super Ljava/lang/Object;
.source "MapBuilder.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/collections/builders/MapBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0010\u0001\n\u0002\u0008\u0007\u0008\u0080\u0003\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u0005H\u0082\u0080\u0004J\u0012\u0010\u0010\u001a\u00020\u00052\u0006\u0010\u0011\u001a\u00020\u0005H\u0082\u0080\u0004R\u000f\u0010\u0004\u001a\u00020\u0005X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0006\u001a\u00020\u0005X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0007\u001a\u00020\u0005X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0008\u001a\u00020\u0005X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R!\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000b0\nX\u0080\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u0012"
    }
    d2 = {
        "Lkotlin/collections/builders/MapBuilder$Companion;",
        "",
        "<init>",
        "()V",
        "MAGIC",
        "",
        "INITIAL_CAPACITY",
        "INITIAL_MAX_PROBE_DISTANCE",
        "TOMBSTONE",
        "Empty",
        "Lkotlin/collections/builders/MapBuilder;",
        "",
        "getEmpty$kotlin_stdlib",
        "()Lkotlin/collections/builders/MapBuilder;",
        "computeHashSize",
        "capacity",
        "computeShift",
        "hashSize",
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

    .line 475
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lkotlin/collections/builders/MapBuilder$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$computeHashSize(Lkotlin/collections/builders/MapBuilder$Companion;I)I
    .registers 2

    .line 475
    invoke-direct {p0, p1}, Lkotlin/collections/builders/MapBuilder$Companion;->computeHashSize(I)I

    move-result p0

    return p0
.end method

.method public static final synthetic access$computeShift(Lkotlin/collections/builders/MapBuilder$Companion;I)I
    .registers 2

    .line 475
    invoke-direct {p0, p1}, Lkotlin/collections/builders/MapBuilder$Companion;->computeShift(I)I

    move-result p0

    return p0
.end method

.method private final computeHashSize(I)I
    .registers 2

    const/4 p0, 0x1

    .line 483
    invoke-static {p1, p0}, Lkotlin/ranges/RangesKt;->coerceAtLeast(II)I

    move-result p0

    mul-int/lit8 p0, p0, 0x3

    invoke-static {p0}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result p0

    return p0
.end method

.method private final computeShift(I)I
    .registers 2

    .line 485
    invoke-static {p1}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    return p0
.end method


# virtual methods
.method public final getEmpty$kotlin_stdlib()Lkotlin/collections/builders/MapBuilder;
    .registers 1

    .line 481
    # getter for: Lkotlin/collections/builders/MapBuilder;->Empty:Lkotlin/collections/builders/MapBuilder;
    invoke-static {}, Lkotlin/collections/builders/MapBuilder;->access$getEmpty$cp()Lkotlin/collections/builders/MapBuilder;

    move-result-object p0

    return-object p0
.end method
