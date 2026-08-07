.class public final enum Lv/emoji/base/apngdecoder/PngColourType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lv/emoji/base/apngdecoder/PngColourType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lv/emoji/base/apngdecoder/PngColourType;

.field public static final enum PNG_GREYSCALE:Lv/emoji/base/apngdecoder/PngColourType;

.field public static final enum PNG_GREYSCALE_WITH_ALPHA:Lv/emoji/base/apngdecoder/PngColourType;

.field public static final enum PNG_INDEXED_COLOUR:Lv/emoji/base/apngdecoder/PngColourType;

.field public static final enum PNG_TRUECOLOUR:Lv/emoji/base/apngdecoder/PngColourType;

.field public static final enum PNG_TRUECOLOUR_WITH_ALPHA:Lv/emoji/base/apngdecoder/PngColourType;


# instance fields
.field public final allowedBitDepths:Ljava/lang/String;

.field public final code:I

.field public final componentsPerPixel:I

.field public final description:Ljava/lang/String;

.field public final name:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lv/emoji/base/apngdecoder/PngColourType;
    .locals 5

    .line 1
    sget-object v0, Lv/emoji/base/apngdecoder/PngColourType;->PNG_GREYSCALE:Lv/emoji/base/apngdecoder/PngColourType;

    .line 2
    .line 3
    sget-object v1, Lv/emoji/base/apngdecoder/PngColourType;->PNG_TRUECOLOUR:Lv/emoji/base/apngdecoder/PngColourType;

    .line 4
    .line 5
    sget-object v2, Lv/emoji/base/apngdecoder/PngColourType;->PNG_INDEXED_COLOUR:Lv/emoji/base/apngdecoder/PngColourType;

    .line 6
    .line 7
    sget-object v3, Lv/emoji/base/apngdecoder/PngColourType;->PNG_GREYSCALE_WITH_ALPHA:Lv/emoji/base/apngdecoder/PngColourType;

    .line 8
    .line 9
    sget-object v4, Lv/emoji/base/apngdecoder/PngColourType;->PNG_TRUECOLOUR_WITH_ALPHA:Lv/emoji/base/apngdecoder/PngColourType;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lv/emoji/base/apngdecoder/PngColourType;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lv/emoji/base/apngdecoder/PngColourType;

    .line 2
    .line 3
    const-string v6, "Greyscale"

    .line 4
    .line 5
    const-string v7, "Each pixel is a greyscale sample"

    .line 6
    .line 7
    const-string v1, "PNG_GREYSCALE"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, 0x1

    .line 12
    const-string v5, "1, 2, 4, 8, 16"

    .line 13
    .line 14
    invoke-direct/range {v0 .. v7}, Lv/emoji/base/apngdecoder/PngColourType;-><init>(Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lv/emoji/base/apngdecoder/PngColourType;->PNG_GREYSCALE:Lv/emoji/base/apngdecoder/PngColourType;

    .line 18
    .line 19
    new-instance v1, Lv/emoji/base/apngdecoder/PngColourType;

    .line 20
    .line 21
    const-string v7, "Truecolour"

    .line 22
    .line 23
    const-string v8, "Each pixel is an R,G,B triple"

    .line 24
    .line 25
    const-string v2, "PNG_TRUECOLOUR"

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    const/4 v4, 0x2

    .line 29
    const/4 v5, 0x3

    .line 30
    const-string v6, "8, 16"

    .line 31
    .line 32
    invoke-direct/range {v1 .. v8}, Lv/emoji/base/apngdecoder/PngColourType;-><init>(Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v1, Lv/emoji/base/apngdecoder/PngColourType;->PNG_TRUECOLOUR:Lv/emoji/base/apngdecoder/PngColourType;

    .line 36
    .line 37
    new-instance v2, Lv/emoji/base/apngdecoder/PngColourType;

    .line 38
    .line 39
    const-string v8, "Indexed-colour"

    .line 40
    .line 41
    const-string v9, "Each pixel is a palette index; a PLTE chunk shall appear."

    .line 42
    .line 43
    const-string v3, "PNG_INDEXED_COLOUR"

    .line 44
    .line 45
    const/4 v6, 0x1

    .line 46
    const-string v7, "1, 2, 4, 8"

    .line 47
    .line 48
    invoke-direct/range {v2 .. v9}, Lv/emoji/base/apngdecoder/PngColourType;-><init>(Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sput-object v2, Lv/emoji/base/apngdecoder/PngColourType;->PNG_INDEXED_COLOUR:Lv/emoji/base/apngdecoder/PngColourType;

    .line 52
    .line 53
    new-instance v3, Lv/emoji/base/apngdecoder/PngColourType;

    .line 54
    .line 55
    const-string v9, "Greyscale with alpha"

    .line 56
    .line 57
    const-string v10, "Each pixel is a greyscale sample followed by an alpha sample."

    .line 58
    .line 59
    const-string v4, "PNG_GREYSCALE_WITH_ALPHA"

    .line 60
    .line 61
    const/4 v6, 0x4

    .line 62
    const/4 v7, 0x2

    .line 63
    const-string v8, "4, 8, 16"

    .line 64
    .line 65
    invoke-direct/range {v3 .. v10}, Lv/emoji/base/apngdecoder/PngColourType;-><init>(Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sput-object v3, Lv/emoji/base/apngdecoder/PngColourType;->PNG_GREYSCALE_WITH_ALPHA:Lv/emoji/base/apngdecoder/PngColourType;

    .line 69
    .line 70
    new-instance v4, Lv/emoji/base/apngdecoder/PngColourType;

    .line 71
    .line 72
    const-string v10, "Truecolour with alpha"

    .line 73
    .line 74
    const-string v11, "Each pixel is an R,G,B triple followed by an alpha sample."

    .line 75
    .line 76
    const-string v5, "PNG_TRUECOLOUR_WITH_ALPHA"

    .line 77
    .line 78
    const/4 v7, 0x6

    .line 79
    const/4 v8, 0x4

    .line 80
    const-string v9, "8, 16"

    .line 81
    .line 82
    invoke-direct/range {v4 .. v11}, Lv/emoji/base/apngdecoder/PngColourType;-><init>(Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    sput-object v4, Lv/emoji/base/apngdecoder/PngColourType;->PNG_TRUECOLOUR_WITH_ALPHA:Lv/emoji/base/apngdecoder/PngColourType;

    .line 86
    .line 87
    invoke-static {}, Lv/emoji/base/apngdecoder/PngColourType;->$values()[Lv/emoji/base/apngdecoder/PngColourType;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    sput-object v0, Lv/emoji/base/apngdecoder/PngColourType;->$VALUES:[Lv/emoji/base/apngdecoder/PngColourType;

    .line 92
    .line 93
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lv/emoji/base/apngdecoder/PngColourType;->code:I

    .line 5
    .line 6
    iput p4, p0, Lv/emoji/base/apngdecoder/PngColourType;->componentsPerPixel:I

    .line 7
    .line 8
    iput-object p5, p0, Lv/emoji/base/apngdecoder/PngColourType;->allowedBitDepths:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p6, p0, Lv/emoji/base/apngdecoder/PngColourType;->name:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p7, p0, Lv/emoji/base/apngdecoder/PngColourType;->description:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static fromByte(B)Lv/emoji/base/apngdecoder/PngColourType;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_4

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    if-eq p0, v0, :cond_3

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_2

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p0, v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lv/emoji/base/apngdecoder/PngColourType;->PNG_GREYSCALE_WITH_ALPHA:Lv/emoji/base/apngdecoder/PngColourType;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "Valid PNG colour types are 0, 2, 3, 4, 6. Type \'%d\' is invalid"

    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return-object p0

    .line 33
    :cond_1
    sget-object p0, Lv/emoji/base/apngdecoder/PngColourType;->PNG_INDEXED_COLOUR:Lv/emoji/base/apngdecoder/PngColourType;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_2
    sget-object p0, Lv/emoji/base/apngdecoder/PngColourType;->PNG_TRUECOLOUR:Lv/emoji/base/apngdecoder/PngColourType;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_3
    sget-object p0, Lv/emoji/base/apngdecoder/PngColourType;->PNG_TRUECOLOUR_WITH_ALPHA:Lv/emoji/base/apngdecoder/PngColourType;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_4
    sget-object p0, Lv/emoji/base/apngdecoder/PngColourType;->PNG_GREYSCALE:Lv/emoji/base/apngdecoder/PngColourType;

    .line 43
    .line 44
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lv/emoji/base/apngdecoder/PngColourType;
    .locals 1

    .line 1
    const-class v0, Lv/emoji/base/apngdecoder/PngColourType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lv/emoji/base/apngdecoder/PngColourType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lv/emoji/base/apngdecoder/PngColourType;
    .locals 1

    .line 1
    sget-object v0, Lv/emoji/base/apngdecoder/PngColourType;->$VALUES:[Lv/emoji/base/apngdecoder/PngColourType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lv/emoji/base/apngdecoder/PngColourType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lv/emoji/base/apngdecoder/PngColourType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public hasAlpha()Z
    .locals 0

    .line 1
    iget p0, p0, Lv/emoji/base/apngdecoder/PngColourType;->code:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x4

    .line 4
    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isIndexed()Z
    .locals 1

    .line 1
    iget p0, p0, Lv/emoji/base/apngdecoder/PngColourType;->code:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    and-int/2addr p0, v0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public supportsSubByteDepth()Z
    .locals 1

    .line 1
    iget p0, p0, Lv/emoji/base/apngdecoder/PngColourType;->code:I

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x3

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method
