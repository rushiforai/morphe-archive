.class public Lkotlin/io/encoding/Base64;
.super Ljava/lang/Object;
.source "Base64.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/io/encoding/Base64$Default;,
        Lkotlin/io/encoding/Base64$PaddingOption;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000d\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0012\n\u0002\u0008\u0007\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\r\n\u0002\u0008\u0013\n\u0002\u0010\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0008\u0017\u0018\u0000 F2\u00020\u0001:\u0002EFB)\u0008B\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ \u0010\u0013\u001a\u00020\u00002\u0006\u0010\u0014\u001a\u00020\u0008H\u0087\u0080\u0004b\u000c\u0008\u0015\u0012\u0008\u0008\u0016\u0012\u0004\u0008\u0008(\u0017J&\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0006H\u0086\u0080\u0004J8\u0010\u001d\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001e\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001f\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0006H\u0086\u0080\u0004J&\u0010 \u001a\u00020!2\u0006\u0010\u001a\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0006H\u0086\u0080\u0004JE\u0010\"\u001a\u0002H#\"\u000c\u0008\u0000\u0010#*\u00060$j\u0002`%2\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001e\u001a\u0002H#2\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0006H\u0087\u0080\u0008b\u0002\u0008\'\u00a2\u0006\u0002\u0010&J&\u0010(\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0006H\u0086\u0080\u0004J8\u0010)\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001e\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001f\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0006H\u0086\u0080\u0004J&\u0010(\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020*2\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0006H\u0086\u0080\u0004J8\u0010)\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020*2\u0006\u0010\u001e\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001f\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0006H\u0086\u0080\u0004J\'\u0010+\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001b\u001a\u00020\u00062\u0006\u0010\u001c\u001a\u00020\u0006H\u0080\u0080\u0004\u00a2\u0006\u0002\u0008,J7\u0010-\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001e\u001a\u00020\u00192\u0006\u0010\u001f\u001a\u00020\u00062\u0006\u0010\u001b\u001a\u00020\u00062\u0006\u0010\u001c\u001a\u00020\u0006H\u0080\u0080\u0004\u00a2\u0006\u0002\u0008.J\u0017\u0010/\u001a\u00020\u00062\u0006\u00100\u001a\u00020\u0006H\u0080\u0080\u0004\u00a2\u0006\u0002\u00081J\n\u00102\u001a\u00020\u0003H\u0082\u0080\u0004J2\u00103\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001e\u001a\u00020\u00192\u0006\u0010\u001f\u001a\u00020\u00062\u0006\u0010\u001b\u001a\u00020\u00062\u0006\u0010\u001c\u001a\u00020\u0006H\u0082\u0080\u0004J\'\u00104\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001b\u001a\u00020\u00062\u0006\u0010\u001c\u001a\u00020\u0006H\u0080\u0080\u0004\u00a2\u0006\u0002\u00085J\'\u00106\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020*2\u0006\u0010\u001b\u001a\u00020\u00062\u0006\u0010\u001c\u001a\u00020\u0006H\u0080\u0080\u0004\u00a2\u0006\u0002\u00087J\u0017\u00108\u001a\u00020!2\u0006\u0010\u001a\u001a\u00020\u0019H\u0080\u0080\u0004\u00a2\u0006\u0002\u00089J*\u0010:\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010;\u001a\u00020\u00062\u0006\u0010\u001c\u001a\u00020\u00062\u0006\u0010<\u001a\u00020\u0006H\u0082\u0080\u0004J\u0012\u0010=\u001a\u00020>2\u0006\u0010;\u001a\u00020\u0006H\u0082\u0080\u0004J\"\u0010?\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001b\u001a\u00020\u00062\u0006\u0010\u001c\u001a\u00020\u0006H\u0082\u0080\u0004J\'\u0010@\u001a\u00020>2\u0006\u00100\u001a\u00020\u00062\u0006\u0010\u001b\u001a\u00020\u00062\u0006\u0010\u001c\u001a\u00020\u0006H\u0080\u0080\u0004\u00a2\u0006\u0002\u0008AJ\"\u0010B\u001a\u00020>2\u0006\u0010C\u001a\u00020\u00062\u0006\u0010\u001f\u001a\u00020\u00062\u0006\u0010D\u001a\u00020\u0006H\u0082\u0080\u0004R\u0015\u0010\u0002\u001a\u00020\u0003X\u0080\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0015\u0010\u0004\u001a\u00020\u0003X\u0080\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000cR\u0015\u0010\u0005\u001a\u00020\u0006X\u0080\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0015\u0010\u0007\u001a\u00020\u0008X\u0080\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u000f\u0010\u0012\u001a\u00020\u0006X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\u00ca\u0001\u000c\u0008\u0015\u0012\u0008\u0008\u0016\u0012\u0004\u0008\u0008(H\u00ca\u0001\u0010\u0008I\u0012\u000c\u0008J\u0012\u0008\u0008\u000cJ\u0004\u0008\t0K\u00a8\u0006G"
    }
    d2 = {
        "Lkotlin/io/encoding/Base64;",
        "",
        "isUrlSafe",
        "",
        "isMimeScheme",
        "mimeLineLength",
        "",
        "paddingOption",
        "Lkotlin/io/encoding/Base64$PaddingOption;",
        "<init>",
        "(ZZILkotlin/io/encoding/Base64$PaddingOption;)V",
        "isUrlSafe$kotlin_stdlib",
        "()Z",
        "isMimeScheme$kotlin_stdlib",
        "getMimeLineLength$kotlin_stdlib",
        "()I",
        "getPaddingOption$kotlin_stdlib",
        "()Lkotlin/io/encoding/Base64$PaddingOption;",
        "mimeGroupsPerLine",
        "withPadding",
        "option",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.0",
        "encodeToByteArray",
        "",
        "source",
        "startIndex",
        "endIndex",
        "encodeIntoByteArray",
        "destination",
        "destinationOffset",
        "encode",
        "",
        "encodeToAppendable",
        "A",
        "Ljava/lang/Appendable;",
        "Lkotlin/text/Appendable;",
        "([BLjava/lang/Appendable;II)Ljava/lang/Appendable;",
        "Lkotlin/IgnorableReturnValue;",
        "decode",
        "decodeIntoByteArray",
        "",
        "encodeToByteArrayImpl",
        "encodeToByteArrayImpl$kotlin_stdlib",
        "encodeIntoByteArrayImpl",
        "encodeIntoByteArrayImpl$kotlin_stdlib",
        "encodeSize",
        "sourceSize",
        "encodeSize$kotlin_stdlib",
        "shouldPadOnEncode",
        "decodeImpl",
        "decodeSize",
        "decodeSize$kotlin_stdlib",
        "charsToBytesImpl",
        "charsToBytesImpl$kotlin_stdlib",
        "bytesToStringImpl",
        "bytesToStringImpl$kotlin_stdlib",
        "handlePaddingSymbol",
        "padIndex",
        "byteStart",
        "checkPaddingIsAllowed",
        "",
        "skipIllegalSymbolsIfMime",
        "checkSourceBounds",
        "checkSourceBounds$kotlin_stdlib",
        "checkDestinationBounds",
        "destinationSize",
        "capacityNeeded",
        "PaddingOption",
        "Default",
        "kotlin-stdlib",
        "2.2",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/io/encoding/ExperimentalEncodingApi;"
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
.field public static final Default:Lkotlin/io/encoding/Base64$Default;

.field private static final Mime:Lkotlin/io/encoding/Base64;

.field private static final Pem:Lkotlin/io/encoding/Base64;

.field private static final UrlSafe:Lkotlin/io/encoding/Base64;

.field private static final bitsPerByte:I = 0x8

.field private static final bitsPerSymbol:I = 0x6

.field public static final bytesPerGroup:I = 0x3

.field private static final lineLengthMime:I = 0x4c

.field private static final lineLengthPem:I = 0x40

.field private static final mimeLineSeparatorSymbols:[B

.field public static final padSymbol:B = 0x3dt

.field public static final symbolsPerGroup:I = 0x4


# instance fields
.field private final isMimeScheme:Z

.field private final isUrlSafe:Z

.field private final mimeGroupsPerLine:I

.field private final mimeLineLength:I

.field private final paddingOption:Lkotlin/io/encoding/Base64$PaddingOption;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lkotlin/io/encoding/Base64$Default;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/io/encoding/Base64$Default;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/io/encoding/Base64;->Default:Lkotlin/io/encoding/Base64$Default;

    const/4 v0, 0x2

    .line 719
    new-array v0, v0, [B

    fill-array-data v0, :array_34

    sput-object v0, Lkotlin/io/encoding/Base64;->mimeLineSeparatorSymbols:[B

    .line 736
    new-instance v0, Lkotlin/io/encoding/Base64;

    const/4 v1, -0x1

    sget-object v2, Lkotlin/io/encoding/Base64$PaddingOption;->PRESENT:Lkotlin/io/encoding/Base64$PaddingOption;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Lkotlin/io/encoding/Base64;-><init>(ZZILkotlin/io/encoding/Base64$PaddingOption;)V

    sput-object v0, Lkotlin/io/encoding/Base64;->UrlSafe:Lkotlin/io/encoding/Base64;

    .line 753
    new-instance v0, Lkotlin/io/encoding/Base64;

    const/16 v1, 0x4c

    sget-object v2, Lkotlin/io/encoding/Base64$PaddingOption;->PRESENT:Lkotlin/io/encoding/Base64$PaddingOption;

    invoke-direct {v0, v4, v3, v1, v2}, Lkotlin/io/encoding/Base64;-><init>(ZZILkotlin/io/encoding/Base64$PaddingOption;)V

    sput-object v0, Lkotlin/io/encoding/Base64;->Mime:Lkotlin/io/encoding/Base64;

    .line 770
    new-instance v0, Lkotlin/io/encoding/Base64;

    const/16 v1, 0x40

    sget-object v2, Lkotlin/io/encoding/Base64$PaddingOption;->PRESENT:Lkotlin/io/encoding/Base64$PaddingOption;

    invoke-direct {v0, v4, v3, v1, v2}, Lkotlin/io/encoding/Base64;-><init>(ZZILkotlin/io/encoding/Base64$PaddingOption;)V

    sput-object v0, Lkotlin/io/encoding/Base64;->Pem:Lkotlin/io/encoding/Base64;

    return-void

    nop

    :array_34
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method

.method private constructor <init>(ZZILkotlin/io/encoding/Base64$PaddingOption;)V
    .registers 5

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-boolean p1, p0, Lkotlin/io/encoding/Base64;->isUrlSafe:Z

    .line 59
    iput-boolean p2, p0, Lkotlin/io/encoding/Base64;->isMimeScheme:Z

    .line 60
    iput p3, p0, Lkotlin/io/encoding/Base64;->mimeLineLength:I

    .line 61
    iput-object p4, p0, Lkotlin/io/encoding/Base64;->paddingOption:Lkotlin/io/encoding/Base64$PaddingOption;

    if-eqz p1, :cond_1c

    if-nez p2, :cond_10

    goto :goto_1c

    .line 64
    :cond_10
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Failed requirement."

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 67
    :cond_1c
    :goto_1c
    div-int/lit8 p3, p3, 0x4

    iput p3, p0, Lkotlin/io/encoding/Base64;->mimeGroupsPerLine:I

    return-void
.end method

.method public synthetic constructor <init>(ZZILkotlin/io/encoding/Base64$PaddingOption;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 6

    invoke-direct {p0, p1, p2, p3, p4}, Lkotlin/io/encoding/Base64;-><init>(ZZILkotlin/io/encoding/Base64$PaddingOption;)V

    return-void
.end method

.method public static final synthetic access$getMime$cp()Lkotlin/io/encoding/Base64;
    .registers 1

    .line 55
    sget-object v0, Lkotlin/io/encoding/Base64;->Mime:Lkotlin/io/encoding/Base64;

    return-object v0
.end method

.method public static final synthetic access$getMimeLineSeparatorSymbols$cp()[B
    .registers 1

    .line 55
    sget-object v0, Lkotlin/io/encoding/Base64;->mimeLineSeparatorSymbols:[B

    return-object v0
.end method

.method public static final synthetic access$getPem$cp()Lkotlin/io/encoding/Base64;
    .registers 1

    .line 55
    sget-object v0, Lkotlin/io/encoding/Base64;->Pem:Lkotlin/io/encoding/Base64;

    return-object v0
.end method

.method public static final synthetic access$getUrlSafe$cp()Lkotlin/io/encoding/Base64;
    .registers 1

    .line 55
    sget-object v0, Lkotlin/io/encoding/Base64;->UrlSafe:Lkotlin/io/encoding/Base64;

    return-object v0
.end method

.method private final checkDestinationBounds(III)V
    .registers 7

    .line 677
    const-string p0, ", destination size: "

    if-ltz p2, :cond_2f

    if-gt p2, p1, :cond_2f

    add-int v0, p2, p3

    if-ltz v0, :cond_d

    if-gt v0, p1, :cond_d

    return-void

    .line 683
    :cond_d
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    .line 684
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "The destination array does not have enough capacity, destination offset: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 685
    const-string p0, ", capacity needed: "

    .line 684
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 683
    invoke-direct {v0, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 678
    :cond_2f
    new-instance p3, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "destination offset: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p3, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p3
.end method

.method private final checkPaddingIsAllowed(I)V
    .registers 4

    .line 650
    iget-object p0, p0, Lkotlin/io/encoding/Base64;->paddingOption:Lkotlin/io/encoding/Base64$PaddingOption;

    sget-object v0, Lkotlin/io/encoding/Base64$PaddingOption;->ABSENT:Lkotlin/io/encoding/Base64$PaddingOption;

    if-eq p0, v0, :cond_7

    return-void

    .line 651
    :cond_7
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 652
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "The padding option is set to ABSENT, but the input has a pad character at index "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 651
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic decode$default(Lkotlin/io/encoding/Base64;Ljava/lang/CharSequence;IIILjava/lang/Object;)[B
    .registers 6

    if-nez p5, :cond_14

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_7

    const/4 p2, 0x0

    :cond_7
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_f

    .line 354
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p3

    :cond_f
    invoke-virtual {p0, p1, p2, p3}, Lkotlin/io/encoding/Base64;->decode(Ljava/lang/CharSequence;II)[B

    move-result-object p0

    return-object p0

    :cond_14
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: decode"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic decode$default(Lkotlin/io/encoding/Base64;[BIIILjava/lang/Object;)[B
    .registers 6

    if-nez p5, :cond_11

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_7

    const/4 p2, 0x0

    :cond_7
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_c

    .line 284
    array-length p3, p1

    :cond_c
    invoke-virtual {p0, p1, p2, p3}, Lkotlin/io/encoding/Base64;->decode([BII)[B

    move-result-object p0

    return-object p0

    :cond_11
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: decode"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final decodeImpl([B[BIII)I
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p5

    .line 498
    iget-boolean v3, v0, Lkotlin/io/encoding/Base64;->isUrlSafe:Z

    if-eqz v3, :cond_f

    # getter for: Lkotlin/io/encoding/Base64Kt;->base64UrlDecodeMap:[I
    invoke-static {}, Lkotlin/io/encoding/Base64Kt;->access$getBase64UrlDecodeMap$p()[I

    move-result-object v3

    goto :goto_13

    :cond_f
    # getter for: Lkotlin/io/encoding/Base64Kt;->base64DecodeMap:[I
    invoke-static {}, Lkotlin/io/encoding/Base64Kt;->access$getBase64DecodeMap$p()[I

    move-result-object v3

    :goto_13
    const/4 v5, -0x8

    move/from16 v9, p3

    move/from16 v6, p4

    move v7, v5

    const/4 v8, 0x0

    .line 505
    :goto_1a
    const-string v10, ") at index "

    const-string v11, "toString(...)"

    const-string v12, "\'("

    const/4 v14, -0x2

    if-ge v6, v2, :cond_d4

    if-ne v7, v5, :cond_6e

    add-int/lit8 v4, v6, 0x3

    if-ge v4, v2, :cond_6e

    add-int/lit8 v4, v6, 0x1

    const/16 p4, 0x8

    .line 507
    aget-byte v13, v1, v6

    and-int/lit16 v13, v13, 0xff

    aget v13, v3, v13

    add-int/lit8 v16, v6, 0x2

    .line 508
    aget-byte v4, v1, v4

    and-int/lit16 v4, v4, 0xff

    aget v4, v3, v4

    add-int/lit8 v17, v6, 0x3

    const/16 v18, 0x1

    .line 509
    aget-byte v15, v1, v16

    and-int/lit16 v15, v15, 0xff

    aget v15, v3, v15

    add-int/lit8 v16, v6, 0x4

    .line 510
    aget-byte v5, v1, v17

    and-int/lit16 v5, v5, 0xff

    aget v5, v3, v5

    shl-int/lit8 v13, v13, 0x12

    shl-int/lit8 v4, v4, 0xc

    or-int/2addr v4, v13

    shl-int/lit8 v13, v15, 0x6

    or-int/2addr v4, v13

    or-int/2addr v4, v5

    if-ltz v4, :cond_72

    add-int/lit8 v5, v9, 0x1

    shr-int/lit8 v6, v4, 0x10

    int-to-byte v6, v6

    .line 513
    aput-byte v6, p2, v9

    add-int/lit8 v6, v9, 0x2

    shr-int/lit8 v10, v4, 0x8

    int-to-byte v10, v10

    .line 514
    aput-byte v10, p2, v5

    add-int/lit8 v9, v9, 0x3

    int-to-byte v4, v4

    .line 515
    aput-byte v4, p2, v6

    move/from16 v6, v16

    goto :goto_d1

    :cond_6e
    const/16 p4, 0x8

    const/16 v18, 0x1

    .line 521
    :cond_72
    aget-byte v4, v1, v6

    and-int/lit16 v4, v4, 0xff

    .line 522
    aget v5, v3, v4

    if-gez v5, :cond_b6

    if-ne v5, v14, :cond_83

    .line 526
    invoke-direct {v0, v1, v6, v2, v7}, Lkotlin/io/encoding/Base64;->handlePaddingSymbol([BIII)I

    move-result v6

    move/from16 v4, v18

    goto :goto_d9

    .line 528
    :cond_83
    iget-boolean v5, v0, Lkotlin/io/encoding/Base64;->isMimeScheme:Z

    if-eqz v5, :cond_8a

    add-int/lit8 v6, v6, 0x1

    goto :goto_d1

    .line 532
    :cond_8a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid symbol \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static/range {p4 .. p4}, Lkotlin/text/CharsKt;->checkRadix(I)I

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_b6
    add-int/lit8 v6, v6, 0x1

    shl-int/lit8 v4, v8, 0x6

    or-int v8, v4, v5

    add-int/lit8 v4, v7, 0x6

    if-ltz v4, :cond_d0

    add-int/lit8 v5, v9, 0x1

    ushr-int v10, v8, v4

    int-to-byte v10, v10

    .line 542
    aput-byte v10, p2, v9

    shl-int v4, v18, v4

    add-int/lit8 v4, v4, -0x1

    and-int/2addr v8, v4

    add-int/lit8 v7, v7, -0x2

    move v9, v5

    goto :goto_d1

    :cond_d0
    move v7, v4

    :goto_d1
    const/4 v5, -0x8

    goto/16 :goto_1a

    :cond_d4
    const/16 p4, 0x8

    const/16 v18, 0x1

    const/4 v4, 0x0

    :goto_d9
    if-eq v7, v14, :cond_139

    const/4 v3, -0x8

    if-eq v7, v3, :cond_ef

    if-nez v4, :cond_ef

    .line 554
    iget-object v3, v0, Lkotlin/io/encoding/Base64;->paddingOption:Lkotlin/io/encoding/Base64$PaddingOption;

    sget-object v4, Lkotlin/io/encoding/Base64$PaddingOption;->PRESENT:Lkotlin/io/encoding/Base64$PaddingOption;

    if-eq v3, v4, :cond_e7

    goto :goto_ef

    .line 555
    :cond_e7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The padding option is set to PRESENT, but the input is not properly padded"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_ef
    :goto_ef
    if-nez v8, :cond_131

    .line 561
    invoke-direct {v0, v1, v6, v2}, Lkotlin/io/encoding/Base64;->skipIllegalSymbolsIfMime([BII)I

    move-result v0

    if-lt v0, v2, :cond_fa

    sub-int v9, v9, p3

    return v9

    .line 563
    :cond_fa
    aget-byte v1, v1, v0

    and-int/lit16 v1, v1, 0xff

    .line 564
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Symbol \'"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    int-to-char v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static/range {p4 .. p4}, Lkotlin/text/CharsKt;->checkRadix(I)I

    move-result v4

    invoke-static {v1, v4}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " is prohibited after the pad character"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 558
    :cond_131
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The pad bits must be zeros"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 552
    :cond_139
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The last unit of input does not have enough bits"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic decodeIntoByteArray$default(Lkotlin/io/encoding/Base64;Ljava/lang/CharSequence;[BIIIILjava/lang/Object;)I
    .registers 9

    if-nez p7, :cond_1a

    and-int/lit8 p7, p6, 0x4

    const/4 v0, 0x0

    if-eqz p7, :cond_8

    move p3, v0

    :cond_8
    and-int/lit8 p7, p6, 0x8

    if-eqz p7, :cond_d

    move p4, v0

    :cond_d
    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_15

    .line 388
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p5

    .line 383
    :cond_15
    invoke-virtual/range {p0 .. p5}, Lkotlin/io/encoding/Base64;->decodeIntoByteArray(Ljava/lang/CharSequence;[BIII)I

    move-result p0

    return p0

    :cond_1a
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: decodeIntoByteArray"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic decodeIntoByteArray$default(Lkotlin/io/encoding/Base64;[B[BIIIILjava/lang/Object;)I
    .registers 9

    if-nez p7, :cond_17

    and-int/lit8 p7, p6, 0x4

    const/4 v0, 0x0

    if-eqz p7, :cond_8

    move p3, v0

    :cond_8
    and-int/lit8 p7, p6, 0x8

    if-eqz p7, :cond_d

    move p4, v0

    :cond_d
    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_12

    .line 326
    array-length p5, p1

    .line 321
    :cond_12
    invoke-virtual/range {p0 .. p5}, Lkotlin/io/encoding/Base64;->decodeIntoByteArray([B[BIII)I

    move-result p0

    return p0

    :cond_17
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: decodeIntoByteArray"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic encode$default(Lkotlin/io/encoding/Base64;[BIIILjava/lang/Object;)Ljava/lang/String;
    .registers 6

    if-nez p5, :cond_11

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_7

    const/4 p2, 0x0

    :cond_7
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_c

    .line 230
    array-length p3, p1

    :cond_c
    invoke-virtual {p0, p1, p2, p3}, Lkotlin/io/encoding/Base64;->encode([BII)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_11
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: encode"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic encodeIntoByteArray$default(Lkotlin/io/encoding/Base64;[B[BIIIILjava/lang/Object;)I
    .registers 9

    if-nez p7, :cond_17

    and-int/lit8 p7, p6, 0x4

    const/4 v0, 0x0

    if-eqz p7, :cond_8

    move p3, v0

    :cond_8
    and-int/lit8 p7, p6, 0x8

    if-eqz p7, :cond_d

    move p4, v0

    :cond_d
    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_12

    .line 206
    array-length p5, p1

    .line 201
    :cond_12
    invoke-virtual/range {p0 .. p5}, Lkotlin/io/encoding/Base64;->encodeIntoByteArray([B[BIII)I

    move-result p0

    return p0

    :cond_17
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: encodeIntoByteArray"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic encodeToAppendable$default(Lkotlin/io/encoding/Base64;[BLjava/lang/Appendable;IIILjava/lang/Object;)Ljava/lang/Appendable;
    .registers 7

    if-nez p6, :cond_11

    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_7

    const/4 p3, 0x0

    :cond_7
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_c

    .line 257
    array-length p4, p1

    .line 253
    :cond_c
    invoke-virtual {p0, p1, p2, p3, p4}, Lkotlin/io/encoding/Base64;->encodeToAppendable([BLjava/lang/Appendable;II)Ljava/lang/Appendable;

    move-result-object p0

    return-object p0

    :cond_11
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: encodeToAppendable"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic encodeToByteArray$default(Lkotlin/io/encoding/Base64;[BIIILjava/lang/Object;)[B
    .registers 6

    if-nez p5, :cond_11

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_7

    const/4 p2, 0x0

    :cond_7
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_c

    .line 176
    array-length p3, p1

    :cond_c
    invoke-virtual {p0, p1, p2, p3}, Lkotlin/io/encoding/Base64;->encodeToByteArray([BII)[B

    move-result-object p0

    return-object p0

    :cond_11
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: encodeToByteArray"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final handlePaddingSymbol([BIII)I
    .registers 6

    const/4 v0, -0x8

    if-eq p4, v0, :cond_49

    const/4 v0, -0x6

    if-eq p4, v0, :cond_43

    const/4 v0, -0x4

    if-eq p4, v0, :cond_1b

    const/4 p0, -0x2

    if-ne p4, p0, :cond_f

    add-int/lit8 p2, p2, 0x1

    return p2

    .line 642
    :cond_f
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 645
    const-string p1, "Unreachable"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 633
    :cond_1b
    invoke-direct {p0, p2}, Lkotlin/io/encoding/Base64;->checkPaddingIsAllowed(I)V

    add-int/lit8 p2, p2, 0x1

    .line 634
    invoke-direct {p0, p1, p2, p3}, Lkotlin/io/encoding/Base64;->skipIllegalSymbolsIfMime([BII)I

    move-result p0

    if-eq p0, p3, :cond_2f

    .line 635
    aget-byte p1, p1, p0

    const/16 p2, 0x3d

    if-ne p1, p2, :cond_2f

    add-int/lit8 p0, p0, 0x1

    return p0

    .line 636
    :cond_2f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Missing one pad character at index "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 641
    :cond_43
    invoke-direct {p0, p2}, Lkotlin/io/encoding/Base64;->checkPaddingIsAllowed(I)V

    add-int/lit8 p2, p2, 0x1

    return p2

    .line 629
    :cond_49
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "Redundant pad character at index "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final shouldPadOnEncode()Z
    .registers 3

    .line 489
    iget-object v0, p0, Lkotlin/io/encoding/Base64;->paddingOption:Lkotlin/io/encoding/Base64$PaddingOption;

    sget-object v1, Lkotlin/io/encoding/Base64$PaddingOption;->PRESENT:Lkotlin/io/encoding/Base64$PaddingOption;

    if-eq v0, v1, :cond_f

    iget-object p0, p0, Lkotlin/io/encoding/Base64;->paddingOption:Lkotlin/io/encoding/Base64$PaddingOption;

    sget-object v0, Lkotlin/io/encoding/Base64$PaddingOption;->PRESENT_OPTIONAL:Lkotlin/io/encoding/Base64$PaddingOption;

    if-ne p0, v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 p0, 0x0

    return p0

    :cond_f
    :goto_f
    const/4 p0, 0x1

    return p0
.end method

.method private final skipIllegalSymbolsIfMime([BII)I
    .registers 5

    .line 658
    iget-boolean p0, p0, Lkotlin/io/encoding/Base64;->isMimeScheme:Z

    if-nez p0, :cond_5

    return p2

    :cond_5
    :goto_5
    if-ge p2, p3, :cond_18

    .line 663
    aget-byte p0, p1, p2

    and-int/lit16 p0, p0, 0xff

    .line 664
    # getter for: Lkotlin/io/encoding/Base64Kt;->base64DecodeMap:[I
    invoke-static {}, Lkotlin/io/encoding/Base64Kt;->access$getBase64DecodeMap$p()[I

    move-result-object v0

    aget p0, v0, p0

    const/4 v0, -0x1

    if-eq p0, v0, :cond_15

    goto :goto_18

    :cond_15
    add-int/lit8 p2, p2, 0x1

    goto :goto_5

    :cond_18
    :goto_18
    return p2
.end method


# virtual methods
.method public final bytesToStringImpl$kotlin_stdlib([B)Ljava/lang/String;
    .registers 5

    const-string p0, "source"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 619
    new-instance p0, Ljava/lang/StringBuilder;

    array-length v0, p1

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 620
    array-length v0, p1

    const/4 v1, 0x0

    :goto_d
    if-ge v1, v0, :cond_18

    aget-byte v2, p1, v1

    int-to-char v2, v2

    .line 621
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 623
    :cond_18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final charsToBytesImpl$kotlin_stdlib(Ljava/lang/CharSequence;II)[B
    .registers 7

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 601
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Lkotlin/io/encoding/Base64;->checkSourceBounds$kotlin_stdlib(III)V

    sub-int p0, p3, p2

    .line 603
    new-array p0, p0, [B

    const/4 v0, 0x0

    :goto_11
    if-ge p2, p3, :cond_2c

    .line 606
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/16 v2, 0xff

    if-gt v1, v2, :cond_22

    add-int/lit8 v2, v0, 0x1

    int-to-byte v1, v1

    .line 608
    aput-byte v1, p0, v0

    move v0, v2

    goto :goto_29

    :cond_22
    add-int/lit8 v1, v0, 0x1

    const/16 v2, 0x3f

    .line 612
    aput-byte v2, p0, v0

    move v0, v1

    :goto_29
    add-int/lit8 p2, p2, 0x1

    goto :goto_11

    :cond_2c
    return-object p0
.end method

.method public final checkSourceBounds$kotlin_stdlib(III)V
    .registers 4

    .line 673
    sget-object p0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    invoke-virtual {p0, p2, p3, p1}, Lkotlin/collections/AbstractList$Companion;->checkBoundsIndexes$kotlin_stdlib(III)V

    return-void
.end method

.method public final decode(Ljava/lang/CharSequence;II)[B
    .registers 10

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 355
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_2c

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Lkotlin/io/encoding/Base64;->checkSourceBounds$kotlin_stdlib(III)V

    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string p2, "substring(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object p2, Lkotlin/text/Charsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    const-string p3, "null cannot be cast to non-null type java.lang.String"

    invoke-static {p1, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    const-string p2, "getBytes(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_30

    :cond_2c
    invoke-virtual {p0, p1, p2, p3}, Lkotlin/io/encoding/Base64;->charsToBytesImpl$kotlin_stdlib(Ljava/lang/CharSequence;II)[B

    move-result-object p1

    :goto_30
    move-object v1, p1

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    .line 356
    invoke-static/range {v0 .. v5}, Lkotlin/io/encoding/Base64;->decode$default(Lkotlin/io/encoding/Base64;[BIIILjava/lang/Object;)[B

    move-result-object p0

    return-object p0
.end method

.method public final decode([BII)[B
    .registers 11

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 285
    array-length v0, p1

    invoke-virtual {p0, v0, p2, p3}, Lkotlin/io/encoding/Base64;->checkSourceBounds$kotlin_stdlib(III)V

    .line 287
    invoke-virtual {p0, p1, p2, p3}, Lkotlin/io/encoding/Base64;->decodeSize$kotlin_stdlib([BII)I

    move-result v0

    .line 288
    new-array v3, v0, [B

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move v5, p2

    move v6, p3

    .line 290
    invoke-direct/range {v1 .. v6}, Lkotlin/io/encoding/Base64;->decodeImpl([B[BIII)I

    move-result p0

    if-ne p0, v0, :cond_1b

    return-object v3

    .line 292
    :cond_1b
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Check failed."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final decodeIntoByteArray(Ljava/lang/CharSequence;[BIII)I
    .registers 14

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "destination"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 390
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_31

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0, p4, p5}, Lkotlin/io/encoding/Base64;->checkSourceBounds$kotlin_stdlib(III)V

    invoke-virtual {p1, p4, p5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string p4, "substring(...)"

    invoke-static {p1, p4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object p4, Lkotlin/text/Charsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    const-string p5, "null cannot be cast to non-null type java.lang.String"

    invoke-static {p1, p5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    const-string p4, "getBytes(...)"

    invoke-static {p1, p4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_35

    :cond_31
    invoke-virtual {p0, p1, p4, p5}, Lkotlin/io/encoding/Base64;->charsToBytesImpl$kotlin_stdlib(Ljava/lang/CharSequence;II)[B

    move-result-object p1

    :goto_35
    move-object v1, p1

    const/16 v6, 0x18

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v2, p2

    move v3, p3

    .line 391
    invoke-static/range {v0 .. v7}, Lkotlin/io/encoding/Base64;->decodeIntoByteArray$default(Lkotlin/io/encoding/Base64;[B[BIIIILjava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final decodeIntoByteArray([B[BIII)I
    .registers 8

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "destination"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 328
    array-length v0, p1

    invoke-virtual {p0, v0, p4, p5}, Lkotlin/io/encoding/Base64;->checkSourceBounds$kotlin_stdlib(III)V

    .line 329
    array-length v0, p2

    invoke-virtual {p0, p1, p4, p5}, Lkotlin/io/encoding/Base64;->decodeSize$kotlin_stdlib([BII)I

    move-result v1

    invoke-direct {p0, v0, p3, v1}, Lkotlin/io/encoding/Base64;->checkDestinationBounds(III)V

    .line 331
    invoke-direct/range {p0 .. p5}, Lkotlin/io/encoding/Base64;->decodeImpl([B[BIII)I

    move-result p0

    return p0
.end method

.method public final decodeSize$kotlin_stdlib([BII)I
    .registers 6

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sub-int v0, p3, p2

    if-nez v0, :cond_b

    const/4 p0, 0x0

    return p0

    :cond_b
    const/4 v1, 0x1

    if-eq v0, v1, :cond_48

    .line 579
    iget-boolean p0, p0, Lkotlin/io/encoding/Base64;->isMimeScheme:Z

    if-eqz p0, :cond_2b

    :goto_12
    if-ge p2, p3, :cond_3f

    .line 581
    aget-byte p0, p1, p2

    and-int/lit16 p0, p0, 0xff

    .line 582
    # getter for: Lkotlin/io/encoding/Base64Kt;->base64DecodeMap:[I
    invoke-static {}, Lkotlin/io/encoding/Base64Kt;->access$getBase64DecodeMap$p()[I

    move-result-object v1

    aget p0, v1, p0

    if-gez p0, :cond_28

    const/4 v1, -0x2

    if-ne p0, v1, :cond_26

    sub-int/2addr p3, p2

    sub-int/2addr v0, p3

    goto :goto_3f

    :cond_26
    add-int/lit8 v0, v0, -0x1

    :cond_28
    add-int/lit8 p2, p2, 0x1

    goto :goto_12

    :cond_2b
    add-int/lit8 p0, p3, -0x1

    .line 591
    aget-byte p0, p1, p0

    const/16 p2, 0x3d

    if-ne p0, p2, :cond_3f

    add-int/lit8 p0, v0, -0x1

    add-int/lit8 p3, p3, -0x2

    .line 593
    aget-byte p1, p1, p3

    if-ne p1, p2, :cond_3e

    add-int/lit8 v0, v0, -0x2

    goto :goto_3f

    :cond_3e
    move v0, p0

    :cond_3f
    :goto_3f
    int-to-long p0, v0

    const-wide/16 p2, 0x6

    mul-long/2addr p0, p2

    const-wide/16 p2, 0x8

    .line 597
    div-long/2addr p0, p2

    long-to-int p0, p0

    return p0

    .line 577
    :cond_48
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Input should have at least 2 symbols for Base64 decoding, startIndex: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", endIndex: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final encode([BII)Ljava/lang/String;
    .registers 5

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 231
    invoke-virtual {p0, p1, p2, p3}, Lkotlin/io/encoding/Base64;->encodeToByteArrayImpl$kotlin_stdlib([BII)[B

    move-result-object p0

    new-instance p1, Ljava/lang/String;

    sget-object p2, Lkotlin/text/Charsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {p1, p0, p2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object p1
.end method

.method public final encodeIntoByteArray([B[BIII)I
    .registers 7

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "destination"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 208
    invoke-virtual/range {p0 .. p5}, Lkotlin/io/encoding/Base64;->encodeIntoByteArrayImpl$kotlin_stdlib([B[BIII)I

    move-result p0

    return p0
.end method

.method public final encodeIntoByteArrayImpl$kotlin_stdlib([B[BIII)I
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    const-string v6, "source"

    invoke-static {v1, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "destination"

    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 412
    array-length v6, v1

    invoke-virtual {v0, v6, v4, v5}, Lkotlin/io/encoding/Base64;->checkSourceBounds$kotlin_stdlib(III)V

    .line 413
    array-length v6, v2

    sub-int v7, v5, v4

    invoke-virtual {v0, v7}, Lkotlin/io/encoding/Base64;->encodeSize$kotlin_stdlib(I)I

    move-result v7

    invoke-direct {v0, v6, v3, v7}, Lkotlin/io/encoding/Base64;->checkDestinationBounds(III)V

    .line 415
    iget-boolean v6, v0, Lkotlin/io/encoding/Base64;->isUrlSafe:Z

    if-eqz v6, :cond_2d

    # getter for: Lkotlin/io/encoding/Base64Kt;->base64UrlEncodeMap:[B
    invoke-static {}, Lkotlin/io/encoding/Base64Kt;->access$getBase64UrlEncodeMap$p()[B

    move-result-object v6

    goto :goto_31

    :cond_2d
    # getter for: Lkotlin/io/encoding/Base64Kt;->base64EncodeMap:[B
    invoke-static {}, Lkotlin/io/encoding/Base64Kt;->access$getBase64EncodeMap$p()[B

    move-result-object v6

    .line 418
    :goto_31
    iget-boolean v7, v0, Lkotlin/io/encoding/Base64;->isMimeScheme:Z

    if-eqz v7, :cond_38

    iget v7, v0, Lkotlin/io/encoding/Base64;->mimeGroupsPerLine:I

    goto :goto_3b

    :cond_38
    const v7, 0x7fffffff

    :goto_3b
    move v8, v3

    :cond_3c
    :goto_3c
    add-int/lit8 v9, v4, 0x2

    const/4 v10, 0x1

    if-ge v9, v5, :cond_9f

    sub-int v9, v5, v4

    .line 421
    div-int/lit8 v9, v9, 0x3

    invoke-static {v9, v7}, Ljava/lang/Math;->min(II)I

    move-result v9

    const/4 v11, 0x0

    move v12, v11

    :goto_4b
    if-ge v12, v9, :cond_8c

    add-int/lit8 v13, v4, 0x1

    .line 423
    aget-byte v14, v1, v4

    and-int/lit16 v14, v14, 0xff

    add-int/lit8 v15, v4, 0x2

    .line 424
    aget-byte v13, v1, v13

    and-int/lit16 v13, v13, 0xff

    add-int/lit8 v4, v4, 0x3

    .line 425
    aget-byte v15, v1, v15

    and-int/lit16 v15, v15, 0xff

    shl-int/lit8 v14, v14, 0x10

    shl-int/lit8 v13, v13, 0x8

    or-int/2addr v13, v14

    or-int/2addr v13, v15

    add-int/lit8 v14, v8, 0x1

    ushr-int/lit8 v15, v13, 0x12

    .line 427
    aget-byte v15, v6, v15

    aput-byte v15, v2, v8

    add-int/lit8 v15, v8, 0x2

    ushr-int/lit8 v16, v13, 0xc

    and-int/lit8 v16, v16, 0x3f

    .line 428
    aget-byte v16, v6, v16

    aput-byte v16, v2, v14

    add-int/lit8 v14, v8, 0x3

    ushr-int/lit8 v16, v13, 0x6

    and-int/lit8 v16, v16, 0x3f

    .line 429
    aget-byte v16, v6, v16

    aput-byte v16, v2, v15

    add-int/lit8 v8, v8, 0x4

    and-int/lit8 v13, v13, 0x3f

    .line 430
    aget-byte v13, v6, v13

    aput-byte v13, v2, v14

    add-int/lit8 v12, v12, 0x1

    goto :goto_4b

    :cond_8c
    if-ne v9, v7, :cond_3c

    if-eq v4, v5, :cond_3c

    add-int/lit8 v9, v8, 0x1

    .line 433
    sget-object v12, Lkotlin/io/encoding/Base64;->mimeLineSeparatorSymbols:[B

    aget-byte v11, v12, v11

    aput-byte v11, v2, v8

    add-int/lit8 v8, v8, 0x2

    .line 434
    aget-byte v10, v12, v10

    aput-byte v10, v2, v9

    goto :goto_3c

    :cond_9f
    sub-int v7, v5, v4

    const/16 v9, 0x3d

    if-eq v7, v10, :cond_e0

    const/4 v10, 0x2

    if-eq v7, v10, :cond_a9

    goto :goto_10a

    :cond_a9
    add-int/lit8 v7, v4, 0x1

    .line 450
    aget-byte v11, v1, v4

    and-int/lit16 v11, v11, 0xff

    add-int/lit8 v4, v4, 0x2

    .line 451
    aget-byte v1, v1, v7

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v7, v11, 0xa

    shl-int/2addr v1, v10

    or-int/2addr v1, v7

    add-int/lit8 v7, v8, 0x1

    ushr-int/lit8 v10, v1, 0xc

    .line 453
    aget-byte v10, v6, v10

    aput-byte v10, v2, v8

    add-int/lit8 v10, v8, 0x2

    ushr-int/lit8 v11, v1, 0x6

    and-int/lit8 v11, v11, 0x3f

    .line 454
    aget-byte v11, v6, v11

    aput-byte v11, v2, v7

    add-int/lit8 v7, v8, 0x3

    and-int/lit8 v1, v1, 0x3f

    .line 455
    aget-byte v1, v6, v1

    aput-byte v1, v2, v10

    .line 456
    invoke-direct {v0}, Lkotlin/io/encoding/Base64;->shouldPadOnEncode()Z

    move-result v0

    if-eqz v0, :cond_de

    add-int/lit8 v8, v8, 0x4

    .line 457
    aput-byte v9, v2, v7

    goto :goto_10a

    :cond_de
    move v8, v7

    goto :goto_10a

    :cond_e0
    add-int/lit8 v7, v4, 0x1

    .line 440
    aget-byte v1, v1, v4

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x4

    add-int/lit8 v4, v8, 0x1

    ushr-int/lit8 v10, v1, 0x6

    .line 442
    aget-byte v10, v6, v10

    aput-byte v10, v2, v8

    add-int/lit8 v10, v8, 0x2

    and-int/lit8 v1, v1, 0x3f

    .line 443
    aget-byte v1, v6, v1

    aput-byte v1, v2, v4

    .line 444
    invoke-direct {v0}, Lkotlin/io/encoding/Base64;->shouldPadOnEncode()Z

    move-result v0

    if-eqz v0, :cond_108

    add-int/lit8 v0, v8, 0x3

    .line 445
    aput-byte v9, v2, v10

    add-int/lit8 v8, v8, 0x4

    .line 446
    aput-byte v9, v2, v0

    move v4, v7

    goto :goto_10a

    :cond_108
    move v4, v7

    move v8, v10

    :goto_10a
    if-ne v4, v5, :cond_10e

    sub-int/2addr v8, v3

    return v8

    .line 462
    :cond_10e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final encodeSize$kotlin_stdlib(I)I
    .registers 5

    .line 470
    div-int/lit8 v0, p1, 0x3

    .line 471
    rem-int/lit8 p1, p1, 0x3

    const/4 v1, 0x4

    mul-int/2addr v0, v1

    if-eqz p1, :cond_12

    .line 474
    invoke-direct {p0}, Lkotlin/io/encoding/Base64;->shouldPadOnEncode()Z

    move-result v2

    if-eqz v2, :cond_f

    goto :goto_11

    :cond_f
    add-int/lit8 v1, p1, 0x1

    :goto_11
    add-int/2addr v0, v1

    .line 476
    :cond_12
    const-string p1, "Input is too big"

    if-ltz v0, :cond_2b

    .line 479
    iget-boolean v1, p0, Lkotlin/io/encoding/Base64;->isMimeScheme:Z

    if-eqz v1, :cond_22

    add-int/lit8 v1, v0, -0x1

    .line 480
    iget p0, p0, Lkotlin/io/encoding/Base64;->mimeLineLength:I

    div-int/2addr v1, p0

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    :cond_22
    if-ltz v0, :cond_25

    return v0

    .line 483
    :cond_25
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 477
    :cond_2b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final encodeToAppendable([BLjava/lang/Appendable;II)Ljava/lang/Appendable;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Ljava/lang/Appendable;",
            ">([BTA;II)TA;"
        }
    .end annotation

    .annotation runtime Lkotlin/IgnorableReturnValue;
    .end annotation

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "destination"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 259
    invoke-virtual {p0, p1, p3, p4}, Lkotlin/io/encoding/Base64;->encodeToByteArrayImpl$kotlin_stdlib([BII)[B

    move-result-object p0

    new-instance p1, Ljava/lang/String;

    sget-object p3, Lkotlin/text/Charsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {p1, p0, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 260
    check-cast p1, Ljava/lang/CharSequence;

    invoke-interface {p2, p1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    return-object p2
.end method

.method public final encodeToByteArray([BII)[B
    .registers 5

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 177
    invoke-virtual {p0, p1, p2, p3}, Lkotlin/io/encoding/Base64;->encodeToByteArrayImpl$kotlin_stdlib([BII)[B

    move-result-object p0

    return-object p0
.end method

.method public final encodeToByteArrayImpl$kotlin_stdlib([BII)[B
    .registers 11

    const-string v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 397
    array-length v0, p1

    invoke-virtual {p0, v0, p2, p3}, Lkotlin/io/encoding/Base64;->checkSourceBounds$kotlin_stdlib(III)V

    sub-int v0, p3, p2

    .line 399
    invoke-virtual {p0, v0}, Lkotlin/io/encoding/Base64;->encodeSize$kotlin_stdlib(I)I

    move-result v0

    .line 400
    new-array v3, v0, [B

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move v5, p2

    move v6, p3

    .line 401
    invoke-virtual/range {v1 .. v6}, Lkotlin/io/encoding/Base64;->encodeIntoByteArrayImpl$kotlin_stdlib([B[BIII)I

    return-object v3
.end method

.method public final getMimeLineLength$kotlin_stdlib()I
    .registers 1

    .line 60
    iget p0, p0, Lkotlin/io/encoding/Base64;->mimeLineLength:I

    return p0
.end method

.method public final getPaddingOption$kotlin_stdlib()Lkotlin/io/encoding/Base64$PaddingOption;
    .registers 1

    .line 61
    iget-object p0, p0, Lkotlin/io/encoding/Base64;->paddingOption:Lkotlin/io/encoding/Base64$PaddingOption;

    return-object p0
.end method

.method public final isMimeScheme$kotlin_stdlib()Z
    .registers 1

    .line 59
    iget-boolean p0, p0, Lkotlin/io/encoding/Base64;->isMimeScheme:Z

    return p0
.end method

.method public final isUrlSafe$kotlin_stdlib()Z
    .registers 1

    .line 58
    iget-boolean p0, p0, Lkotlin/io/encoding/Base64;->isUrlSafe:Z

    return p0
.end method

.method public final withPadding(Lkotlin/io/encoding/Base64$PaddingOption;)Lkotlin/io/encoding/Base64;
    .registers 5

    const-string v0, "option"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 151
    iget-object v0, p0, Lkotlin/io/encoding/Base64;->paddingOption:Lkotlin/io/encoding/Base64$PaddingOption;

    if-ne v0, p1, :cond_a

    return-object p0

    .line 152
    :cond_a
    new-instance v0, Lkotlin/io/encoding/Base64;

    iget-boolean v1, p0, Lkotlin/io/encoding/Base64;->isUrlSafe:Z

    iget-boolean v2, p0, Lkotlin/io/encoding/Base64;->isMimeScheme:Z

    iget p0, p0, Lkotlin/io/encoding/Base64;->mimeLineLength:I

    invoke-direct {v0, v1, v2, p0, p1}, Lkotlin/io/encoding/Base64;-><init>(ZZILkotlin/io/encoding/Base64$PaddingOption;)V

    return-object v0
.end method
