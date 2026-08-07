.class final enum Lnet/jpountz/lz4/LZ4Utils;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/jpountz/lz4/LZ4Utils$Match;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lnet/jpountz/lz4/LZ4Utils;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lnet/jpountz/lz4/LZ4Utils;

.field private static final MAX_INPUT_SIZE:I = 0x7e000000


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lnet/jpountz/lz4/LZ4Utils;

    .line 3
    .line 4
    sput-object v0, Lnet/jpountz/lz4/LZ4Utils;->$VALUES:[Lnet/jpountz/lz4/LZ4Utils;

    .line 5
    .line 6
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V
    .locals 1

    .line 1
    iget v0, p0, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 2
    .line 3
    iput v0, p1, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 4
    .line 5
    iget v0, p0, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 6
    .line 7
    iput v0, p1, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 8
    .line 9
    iget p0, p0, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    .line 10
    .line 11
    iput p0, p1, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    .line 12
    .line 13
    return-void
.end method

.method public static hash(I)I
    .locals 1

    const v0, -0x61c8864f

    mul-int/2addr p0, v0

    ushr-int/lit8 p0, p0, 0x14

    return p0
.end method

.method public static hash64k(I)I
    .locals 1

    const v0, -0x61c8864f

    mul-int/2addr p0, v0

    ushr-int/lit8 p0, p0, 0x13

    return p0
.end method

.method public static hashHC(I)I
    .locals 1

    const v0, -0x61c8864f

    mul-int/2addr p0, v0

    ushr-int/lit8 p0, p0, 0x11

    return p0
.end method

.method public static maxCompressedLength(I)I
    .locals 1

    .line 1
    if-ltz p0, :cond_1

    .line 2
    .line 3
    const/high16 v0, 0x7e000000

    .line 4
    .line 5
    if-ge p0, v0, :cond_0

    .line 6
    .line 7
    div-int/lit16 v0, p0, 0xff

    .line 8
    .line 9
    add-int/2addr p0, v0

    .line 10
    add-int/lit8 p0, p0, 0x10

    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    const-string p0, "length must be < 2113929216"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    const-string v0, "length must be >= 0, got "

    .line 21
    .line 22
    invoke-static {v0, p0}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lnet/jpountz/lz4/LZ4Utils;
    .locals 1

    .line 1
    const-class v0, Lnet/jpountz/lz4/LZ4Utils;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lnet/jpountz/lz4/LZ4Utils;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lnet/jpountz/lz4/LZ4Utils;
    .locals 1

    .line 1
    sget-object v0, Lnet/jpountz/lz4/LZ4Utils;->$VALUES:[Lnet/jpountz/lz4/LZ4Utils;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lnet/jpountz/lz4/LZ4Utils;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lnet/jpountz/lz4/LZ4Utils;

    .line 8
    .line 9
    return-object v0
.end method
