.class public Lorg/seamless/util/io/Base64Coder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/seamless/util/io/Base64Coder$OutputStream;,
        Lorg/seamless/util/io/Base64Coder$InputStream;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final DECODE:I = 0x0

.field public static final DONT_GUNZIP:I = 0x4

.field public static final DO_BREAK_LINES:I = 0x8

.field public static final ENCODE:I = 0x1

.field private static final EQUALS_SIGN:B = 0x3dt

.field private static final EQUALS_SIGN_ENC:B = -0x1t

.field public static final GZIP:I = 0x2

.field private static final MAX_LINE_LENGTH:I = 0x4c

.field private static final NEW_LINE:B = 0xat

.field public static final NO_OPTIONS:I = 0x0

.field public static final ORDERED:I = 0x20

.field private static final PREFERRED_ENCODING:Ljava/lang/String; = "US-ASCII"

.field public static final URL_SAFE:I = 0x10

.field private static final WHITE_SPACE_ENC:B = -0x5t

.field private static final _ORDERED_ALPHABET:[B

.field private static final _ORDERED_DECODABET:[B

.field private static final _STANDARD_ALPHABET:[B

.field private static final _STANDARD_DECODABET:[B

.field private static final _URL_SAFE_ALPHABET:[B

.field private static final _URL_SAFE_DECODABET:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/seamless/util/io/Base64Coder;->_STANDARD_ALPHABET:[B

    .line 9
    .line 10
    const/16 v0, 0x100

    .line 11
    .line 12
    new-array v0, v0, [B

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Lorg/seamless/util/io/Base64Coder;->_STANDARD_DECODABET:[B

    .line 18
    .line 19
    const/16 v0, 0x40

    .line 20
    .line 21
    new-array v0, v0, [B

    .line 22
    .line 23
    fill-array-data v0, :array_2

    .line 24
    .line 25
    .line 26
    sput-object v0, Lorg/seamless/util/io/Base64Coder;->_URL_SAFE_ALPHABET:[B

    .line 27
    .line 28
    const/16 v0, 0x100

    .line 29
    .line 30
    new-array v0, v0, [B

    .line 31
    .line 32
    fill-array-data v0, :array_3

    .line 33
    .line 34
    .line 35
    sput-object v0, Lorg/seamless/util/io/Base64Coder;->_URL_SAFE_DECODABET:[B

    .line 36
    .line 37
    const/16 v0, 0x40

    .line 38
    .line 39
    new-array v0, v0, [B

    .line 40
    .line 41
    fill-array-data v0, :array_4

    .line 42
    .line 43
    .line 44
    sput-object v0, Lorg/seamless/util/io/Base64Coder;->_ORDERED_ALPHABET:[B

    .line 45
    .line 46
    const/16 v0, 0x101

    .line 47
    .line 48
    new-array v0, v0, [B

    .line 49
    .line 50
    fill-array-data v0, :array_5

    .line 51
    .line 52
    .line 53
    sput-object v0, Lorg/seamless/util/io/Base64Coder;->_ORDERED_DECODABET:[B

    .line 54
    .line 55
    return-void

    .line 56
    nop

    .line 57
    :array_0
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    :array_1
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
        -0x9t
        0x3ft
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    :array_2
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2dt
        0x5ft
    .end array-data

    :array_3
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3ft
        -0x9t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    :array_4
    .array-data 1
        0x2dt
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x5ft
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
    .end array-data

    :array_5
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        -0x9t
        -0x9t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x25t
        -0x9t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        0x3et
        0x3ft
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000(I)[B
    .locals 0

    .line 1
    invoke-static {p0}, Lorg/seamless/util/io/Base64Coder;->getDecodabet(I)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$100([BII[BII)[B
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lorg/seamless/util/io/Base64Coder;->encode3to4([BII[BII)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$200([BI[BII)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lorg/seamless/util/io/Base64Coder;->decode4to3([BI[BII)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$300([B[BII)[B
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lorg/seamless/util/io/Base64Coder;->encode3to4([B[BII)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 169
    invoke-static {p0, v0}, Lorg/seamless/util/io/Base64Coder;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    return-object p0
.end method

.method public static decode(Ljava/lang/String;I)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    :try_start_0
    const-string v1, "US-ASCII"

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 7
    .line 8
    .line 9
    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    goto :goto_0

    .line 11
    :catch_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    array-length v1, p0

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {p0, v2, v1, p1}, Lorg/seamless/util/io/Base64Coder;->decode([BIII)[B

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x4

    .line 22
    and-int/2addr p1, v1

    .line 23
    const/4 v3, 0x1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    move p1, v3

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    move p1, v2

    .line 29
    :goto_1
    if-eqz p0, :cond_2

    .line 30
    .line 31
    array-length v4, p0

    .line 32
    if-lt v4, v1, :cond_2

    .line 33
    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    aget-byte p1, p0, v2

    .line 37
    .line 38
    and-int/lit16 p1, p1, 0xff

    .line 39
    .line 40
    aget-byte v1, p0, v3

    .line 41
    .line 42
    shl-int/lit8 v1, v1, 0x8

    .line 43
    .line 44
    const v3, 0xff00

    .line 45
    .line 46
    .line 47
    and-int/2addr v1, v3

    .line 48
    or-int/2addr p1, v1

    .line 49
    const v1, 0x8b1f

    .line 50
    .line 51
    .line 52
    if-ne v1, p1, :cond_2

    .line 53
    .line 54
    const/16 p1, 0x800

    .line 55
    .line 56
    new-array p1, p1, [B

    .line 57
    .line 58
    :try_start_1
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 59
    .line 60
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 61
    .line 62
    .line 63
    :try_start_2
    new-instance v3, Ljava/io/ByteArrayInputStream;

    .line 64
    .line 65
    invoke-direct {v3, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 66
    .line 67
    .line 68
    :try_start_3
    new-instance v4, Ljava/util/zip/GZIPInputStream;

    .line 69
    .line 70
    invoke-direct {v4, v3}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 71
    .line 72
    .line 73
    :goto_2
    :try_start_4
    invoke-virtual {v4, p1}, Ljava/io/InputStream;->read([B)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-ltz v0, :cond_1

    .line 78
    .line 79
    invoke-virtual {v1, p1, v2, v0}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 80
    .line 81
    .line 82
    goto :goto_2

    .line 83
    :catchall_0
    move-exception p0

    .line 84
    :goto_3
    move-object v0, v1

    .line 85
    goto :goto_7

    .line 86
    :catch_1
    move-exception p1

    .line 87
    :goto_4
    move-object v0, v1

    .line 88
    goto :goto_6

    .line 89
    :cond_1
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 90
    .line 91
    .line 92
    move-result-object p0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 93
    :try_start_5
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 94
    .line 95
    .line 96
    :catch_2
    :goto_5
    :try_start_6
    invoke-virtual {v4}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    .line 97
    .line 98
    .line 99
    :catch_3
    :try_start_7
    invoke-virtual {v3}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_a

    .line 100
    .line 101
    .line 102
    goto :goto_8

    .line 103
    :catchall_1
    move-exception p0

    .line 104
    move-object v4, v0

    .line 105
    goto :goto_3

    .line 106
    :catch_4
    move-exception p1

    .line 107
    move-object v4, v0

    .line 108
    goto :goto_4

    .line 109
    :catchall_2
    move-exception p0

    .line 110
    move-object v3, v0

    .line 111
    move-object v4, v3

    .line 112
    goto :goto_3

    .line 113
    :catch_5
    move-exception p1

    .line 114
    move-object v3, v0

    .line 115
    move-object v4, v3

    .line 116
    goto :goto_4

    .line 117
    :catchall_3
    move-exception p0

    .line 118
    move-object v3, v0

    .line 119
    move-object v4, v3

    .line 120
    goto :goto_7

    .line 121
    :catch_6
    move-exception p1

    .line 122
    move-object v3, v0

    .line 123
    move-object v4, v3

    .line 124
    :goto_6
    :try_start_8
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 125
    .line 126
    .line 127
    :try_start_9
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2

    .line 128
    .line 129
    .line 130
    goto :goto_5

    .line 131
    :catchall_4
    move-exception p0

    .line 132
    :goto_7
    :try_start_a
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_7

    .line 133
    .line 134
    .line 135
    :catch_7
    :try_start_b
    invoke-virtual {v4}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_8

    .line 136
    .line 137
    .line 138
    :catch_8
    :try_start_c
    invoke-virtual {v3}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_9

    .line 139
    .line 140
    .line 141
    :catch_9
    throw p0

    .line 142
    :catch_a
    :cond_2
    :goto_8
    return-object p0

    .line 143
    :cond_3
    const-string p0, "Input string was null."

    .line 144
    .line 145
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-object v0
.end method

.method public static decode([B)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 170
    array-length v1, p0

    invoke-static {p0, v0, v1, v0}, Lorg/seamless/util/io/Base64Coder;->decode([BIII)[B

    move-result-object p0

    return-object p0
.end method

.method public static decode([BIII)[B
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_8

    if-ltz p1, :cond_7

    add-int v1, p1, p2

    .line 149
    array-length v2, p0

    if-gt v1, v2, :cond_7

    const/4 v2, 0x0

    if-nez p2, :cond_0

    .line 150
    new-array p0, v2, [B

    return-object p0

    :cond_0
    const/4 v3, 0x4

    if-lt p2, v3, :cond_6

    .line 151
    invoke-static {p3}, Lorg/seamless/util/io/Base64Coder;->getDecodabet(I)[B

    move-result-object v0

    const/4 v4, 0x3

    mul-int/2addr p2, v4

    .line 152
    div-int/2addr p2, v3

    .line 153
    new-array p2, p2, [B

    .line 154
    new-array v3, v3, [B

    move v5, v2

    move v6, v5

    :goto_0
    if-ge p1, v1, :cond_5

    .line 155
    aget-byte v7, p0, p1

    and-int/lit16 v8, v7, 0xff

    aget-byte v8, v0, v8

    const/4 v9, -0x5

    if-lt v8, v9, :cond_4

    const/4 v9, -0x1

    if-lt v8, v9, :cond_3

    add-int/lit8 v8, v5, 0x1

    .line 156
    aput-byte v7, v3, v5

    if-le v8, v4, :cond_2

    .line 157
    invoke-static {v3, v2, p2, v6, p3}, Lorg/seamless/util/io/Base64Coder;->decode4to3([BI[BII)I

    move-result v5

    add-int/2addr v6, v5

    .line 158
    aget-byte v5, p0, p1

    const/16 v7, 0x3d

    if-ne v5, v7, :cond_1

    goto :goto_2

    :cond_1
    move v5, v2

    goto :goto_1

    :cond_2
    move v5, v8

    :cond_3
    :goto_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 159
    :cond_4
    new-instance p0, Ljava/io/IOException;

    and-int/lit16 p2, v7, 0xff

    .line 160
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p2, p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 161
    const-string p2, "Bad Base64 input character decimal %d in array position %d"

    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 162
    :cond_5
    :goto_2
    new-array p0, v6, [B

    .line 163
    invoke-static {p2, v2, p0, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p0

    .line 164
    :cond_6
    const-string p0, "Base64-encoded string must have at least four characters, but length specified was "

    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    return-object v0

    .line 165
    :cond_7
    array-length p0, p0

    .line 166
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    move-result-object p0

    .line 167
    const-string p1, "Source array with length %d cannot have offset of %d and process %d bytes."

    invoke-static {p1, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0

    .line 168
    :cond_8
    const-string p0, "Cannot decode null source array."

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    return-object v0
.end method

.method private static decode4to3([BI[BII)I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_5

    .line 3
    .line 4
    if-eqz p2, :cond_4

    .line 5
    .line 6
    if-ltz p1, :cond_3

    .line 7
    .line 8
    add-int/lit8 v1, p1, 0x3

    .line 9
    .line 10
    array-length v2, p0

    .line 11
    if-ge v1, v2, :cond_3

    .line 12
    .line 13
    if-ltz p3, :cond_2

    .line 14
    .line 15
    add-int/lit8 v2, p3, 0x2

    .line 16
    .line 17
    array-length v3, p2

    .line 18
    if-ge v2, v3, :cond_2

    .line 19
    .line 20
    invoke-static {p4}, Lorg/seamless/util/io/Base64Coder;->getDecodabet(I)[B

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    add-int/lit8 v0, p1, 0x2

    .line 25
    .line 26
    aget-byte v0, p0, v0

    .line 27
    .line 28
    const/16 v3, 0x3d

    .line 29
    .line 30
    const/4 v4, 0x1

    .line 31
    if-ne v0, v3, :cond_0

    .line 32
    .line 33
    aget-byte v0, p0, p1

    .line 34
    .line 35
    aget-byte v0, p4, v0

    .line 36
    .line 37
    and-int/lit16 v0, v0, 0xff

    .line 38
    .line 39
    shl-int/lit8 v0, v0, 0x12

    .line 40
    .line 41
    add-int/2addr p1, v4

    .line 42
    aget-byte p0, p0, p1

    .line 43
    .line 44
    aget-byte p0, p4, p0

    .line 45
    .line 46
    and-int/lit16 p0, p0, 0xff

    .line 47
    .line 48
    shl-int/lit8 p0, p0, 0xc

    .line 49
    .line 50
    or-int/2addr p0, v0

    .line 51
    ushr-int/lit8 p0, p0, 0x10

    .line 52
    .line 53
    int-to-byte p0, p0

    .line 54
    aput-byte p0, p2, p3

    .line 55
    .line 56
    return v4

    .line 57
    :cond_0
    aget-byte v1, p0, v1

    .line 58
    .line 59
    if-ne v1, v3, :cond_1

    .line 60
    .line 61
    aget-byte v1, p0, p1

    .line 62
    .line 63
    aget-byte v1, p4, v1

    .line 64
    .line 65
    and-int/lit16 v1, v1, 0xff

    .line 66
    .line 67
    shl-int/lit8 v1, v1, 0x12

    .line 68
    .line 69
    add-int/2addr p1, v4

    .line 70
    aget-byte p0, p0, p1

    .line 71
    .line 72
    aget-byte p0, p4, p0

    .line 73
    .line 74
    and-int/lit16 p0, p0, 0xff

    .line 75
    .line 76
    shl-int/lit8 p0, p0, 0xc

    .line 77
    .line 78
    or-int/2addr p0, v1

    .line 79
    aget-byte p1, p4, v0

    .line 80
    .line 81
    and-int/lit16 p1, p1, 0xff

    .line 82
    .line 83
    shl-int/lit8 p1, p1, 0x6

    .line 84
    .line 85
    or-int/2addr p0, p1

    .line 86
    ushr-int/lit8 p1, p0, 0x10

    .line 87
    .line 88
    int-to-byte p1, p1

    .line 89
    aput-byte p1, p2, p3

    .line 90
    .line 91
    add-int/2addr p3, v4

    .line 92
    ushr-int/lit8 p0, p0, 0x8

    .line 93
    .line 94
    int-to-byte p0, p0

    .line 95
    aput-byte p0, p2, p3

    .line 96
    .line 97
    const/4 p0, 0x2

    .line 98
    return p0

    .line 99
    :cond_1
    aget-byte v3, p0, p1

    .line 100
    .line 101
    aget-byte v3, p4, v3

    .line 102
    .line 103
    and-int/lit16 v3, v3, 0xff

    .line 104
    .line 105
    shl-int/lit8 v3, v3, 0x12

    .line 106
    .line 107
    add-int/2addr p1, v4

    .line 108
    aget-byte p0, p0, p1

    .line 109
    .line 110
    aget-byte p0, p4, p0

    .line 111
    .line 112
    and-int/lit16 p0, p0, 0xff

    .line 113
    .line 114
    shl-int/lit8 p0, p0, 0xc

    .line 115
    .line 116
    or-int/2addr p0, v3

    .line 117
    aget-byte p1, p4, v0

    .line 118
    .line 119
    and-int/lit16 p1, p1, 0xff

    .line 120
    .line 121
    shl-int/lit8 p1, p1, 0x6

    .line 122
    .line 123
    or-int/2addr p0, p1

    .line 124
    aget-byte p1, p4, v1

    .line 125
    .line 126
    and-int/lit16 p1, p1, 0xff

    .line 127
    .line 128
    or-int/2addr p0, p1

    .line 129
    shr-int/lit8 p1, p0, 0x10

    .line 130
    .line 131
    int-to-byte p1, p1

    .line 132
    aput-byte p1, p2, p3

    .line 133
    .line 134
    add-int/2addr p3, v4

    .line 135
    shr-int/lit8 p1, p0, 0x8

    .line 136
    .line 137
    int-to-byte p1, p1

    .line 138
    aput-byte p1, p2, p3

    .line 139
    .line 140
    int-to-byte p0, p0

    .line 141
    aput-byte p0, p2, v2

    .line 142
    .line 143
    const/4 p0, 0x3

    .line 144
    return p0

    .line 145
    :cond_2
    array-length p0, p2

    .line 146
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    const-string p1, "Destination array with length %d cannot have offset of %d and still store three bytes."

    .line 159
    .line 160
    invoke-static {p1, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    return v0

    .line 164
    :cond_3
    array-length p0, p0

    .line 165
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    const-string p1, "Source array with length %d cannot have offset of %d and still process four bytes."

    .line 178
    .line 179
    invoke-static {p1, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    return v0

    .line 183
    :cond_4
    const-string p0, "Destination array was null."

    .line 184
    .line 185
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    return v0

    .line 189
    :cond_5
    const-string p0, "Source array was null."

    .line 190
    .line 191
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    return v0
.end method

.method public static decodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lorg/seamless/util/io/Base64Coder;->decodeFromFile(Ljava/lang/String;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    :try_start_0
    new-instance v1, Ljava/io/BufferedOutputStream;

    .line 7
    .line 8
    new-instance v2, Ljava/io/FileOutputStream;

    .line 9
    .line 10
    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 14
    .line 15
    .line 16
    :try_start_1
    invoke-virtual {v1, p0}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    .line 18
    .line 19
    :try_start_2
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 20
    .line 21
    .line 22
    :catch_0
    return-void

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    move-object v0, v1

    .line 25
    goto :goto_1

    .line 26
    :catch_1
    move-exception p0

    .line 27
    move-object v0, v1

    .line 28
    goto :goto_0

    .line 29
    :catchall_1
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :catch_2
    move-exception p0

    .line 32
    :goto_0
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 33
    :goto_1
    :try_start_4
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 34
    .line 35
    .line 36
    :catch_3
    throw p0
.end method

.method public static decodeFromFile(Ljava/lang/String;)[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "File is too big for this convenience method ("

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    new-instance v2, Ljava/io/File;

    .line 5
    .line 6
    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/io/File;->length()J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    const-wide/32 v5, 0x7fffffff

    .line 14
    .line 15
    .line 16
    cmp-long p0, v3, v5

    .line 17
    .line 18
    if-gtz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/io/File;->length()J

    .line 21
    .line 22
    .line 23
    move-result-wide v3

    .line 24
    long-to-int p0, v3

    .line 25
    new-array p0, p0, [B

    .line 26
    .line 27
    new-instance v0, Lorg/seamless/util/io/Base64Coder$InputStream;

    .line 28
    .line 29
    new-instance v3, Ljava/io/BufferedInputStream;

    .line 30
    .line 31
    new-instance v4, Ljava/io/FileInputStream;

    .line 32
    .line 33
    invoke-direct {v4, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v3, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 37
    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-direct {v0, v3, v2}, Lorg/seamless/util/io/Base64Coder$InputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 41
    .line 42
    .line 43
    move v1, v2

    .line 44
    :goto_0
    const/16 v3, 0x1000

    .line 45
    .line 46
    :try_start_1
    invoke-virtual {v0, p0, v1, v3}, Lorg/seamless/util/io/Base64Coder$InputStream;->read([BII)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-ltz v3, :cond_0

    .line 51
    .line 52
    add-int/2addr v1, v3

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    new-array v3, v1, [B

    .line 55
    .line 56
    invoke-static {p0, v2, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    .line 58
    .line 59
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 60
    .line 61
    .line 62
    :catch_0
    return-object v3

    .line 63
    :catchall_0
    move-exception p0

    .line 64
    move-object v1, v0

    .line 65
    goto :goto_2

    .line 66
    :catch_1
    move-exception p0

    .line 67
    move-object v1, v0

    .line 68
    goto :goto_1

    .line 69
    :catchall_1
    move-exception p0

    .line 70
    goto :goto_2

    .line 71
    :catch_2
    move-exception p0

    .line 72
    goto :goto_1

    .line 73
    :cond_1
    :try_start_3
    new-instance p0, Ljava/io/IOException;

    .line 74
    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/io/File;->length()J

    .line 81
    .line 82
    .line 83
    move-result-wide v4

    .line 84
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v0, " bytes)."

    .line 88
    .line 89
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    throw p0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 100
    :goto_1
    :try_start_4
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 101
    :goto_2
    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 102
    .line 103
    .line 104
    :catch_3
    throw p0
.end method

.method public static decodeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/seamless/util/io/Base64Coder;->decode(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public static decodeToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Lorg/seamless/util/io/Base64Coder$OutputStream;

    .line 3
    .line 4
    new-instance v2, Ljava/io/FileOutputStream;

    .line 5
    .line 6
    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-direct {v1, v2, p1}, Lorg/seamless/util/io/Base64Coder$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    .line 12
    .line 13
    :try_start_1
    const-string p1, "US-ASCII"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v1, p0}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    .line 21
    .line 22
    :try_start_2
    invoke-virtual {v1}, Lorg/seamless/util/io/Base64Coder$OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 23
    .line 24
    .line 25
    :catch_0
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    move-object v0, v1

    .line 28
    goto :goto_1

    .line 29
    :catch_1
    move-exception p0

    .line 30
    move-object v0, v1

    .line 31
    goto :goto_0

    .line 32
    :catchall_1
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :catch_2
    move-exception p0

    .line 35
    :goto_0
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 36
    :goto_1
    :try_start_4
    invoke-virtual {v0}, Lorg/seamless/util/io/Base64Coder$OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 37
    .line 38
    .line 39
    :catch_3
    throw p0
.end method

.method public static decodeToObject(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 69
    invoke-static {p0, v0, v1}, Lorg/seamless/util/io/Base64Coder;->decodeToObject(Ljava/lang/String;ILjava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static decodeToObject(Ljava/lang/String;ILjava/lang/ClassLoader;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lorg/seamless/util/io/Base64Coder;->decode(Ljava/lang/String;I)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 9
    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    :try_start_1
    new-instance p0, Ljava/io/ObjectInputStream;

    .line 14
    .line 15
    invoke-direct {p0, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 16
    .line 17
    .line 18
    :goto_0
    move-object p1, p0

    .line 19
    goto :goto_1

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    move-object p2, p1

    .line 22
    move-object p1, v0

    .line 23
    goto :goto_4

    .line 24
    :catch_0
    move-exception p0

    .line 25
    move-object p2, p1

    .line 26
    move-object p1, v0

    .line 27
    goto :goto_2

    .line 28
    :catch_1
    move-exception p0

    .line 29
    move-object p2, p1

    .line 30
    move-object p1, v0

    .line 31
    goto :goto_3

    .line 32
    :cond_0
    new-instance p0, Lorg/seamless/util/io/Base64Coder$1;

    .line 33
    .line 34
    invoke-direct {p0, v0, p2}, Lorg/seamless/util/io/Base64Coder$1;-><init>(Ljava/io/InputStream;Ljava/lang/ClassLoader;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :goto_1
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 43
    .line 44
    .line 45
    :catch_2
    :try_start_3
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 46
    .line 47
    .line 48
    :catch_3
    return-object p0

    .line 49
    :catchall_1
    move-exception p0

    .line 50
    move-object p2, p1

    .line 51
    goto :goto_4

    .line 52
    :catch_4
    move-exception p0

    .line 53
    move-object p2, p1

    .line 54
    goto :goto_2

    .line 55
    :catch_5
    move-exception p0

    .line 56
    move-object p2, p1

    .line 57
    goto :goto_3

    .line 58
    :goto_2
    :try_start_4
    throw p0

    .line 59
    :catchall_2
    move-exception p0

    .line 60
    goto :goto_4

    .line 61
    :goto_3
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 62
    :goto_4
    :try_start_5
    invoke-virtual {p1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6

    .line 63
    .line 64
    .line 65
    :catch_6
    :try_start_6
    invoke-virtual {p2}, Ljava/io/ObjectInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_7

    .line 66
    .line 67
    .line 68
    :catch_7
    throw p0
.end method

.method public static encode(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v0, 0x3

    .line 42
    new-array v1, v0, [B

    const/4 v2, 0x4

    .line 43
    new-array v2, v2, [B

    .line 44
    :goto_0
    invoke-virtual {p0}, Ljava/nio/Buffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 45
    invoke-virtual {p0}, Ljava/nio/Buffer;->remaining()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v4, 0x0

    .line 46
    invoke-virtual {p0, v1, v4, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 47
    invoke-static {v2, v1, v3, v4}, Lorg/seamless/util/io/Base64Coder;->encode3to4([B[BII)[B

    .line 48
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static encode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;)V
    .locals 6

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    const/4 v2, 0x4

    .line 5
    new-array v3, v2, [B

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 8
    .line 9
    .line 10
    move-result v4

    .line 11
    if-eqz v4, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/nio/Buffer;->remaining()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const/4 v5, 0x0

    .line 22
    invoke-virtual {p0, v1, v5, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    invoke-static {v3, v1, v4, v5}, Lorg/seamless/util/io/Base64Coder;->encode3to4([B[BII)[B

    .line 26
    .line 27
    .line 28
    :goto_0
    if-ge v5, v2, :cond_0

    .line 29
    .line 30
    aget-byte v4, v3, v5

    .line 31
    .line 32
    and-int/lit16 v4, v4, 0xff

    .line 33
    .line 34
    int-to-char v4, v4

    .line 35
    invoke-virtual {p1, v4}, Ljava/nio/CharBuffer;->put(C)Ljava/nio/CharBuffer;

    .line 36
    .line 37
    .line 38
    add-int/lit8 v5, v5, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public static encode([B)[B
    .locals 0

    .line 49
    invoke-static {p0}, Lorg/seamless/util/io/Base64Coder;->encodeBytes([B)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    return-object p0
.end method

.method private static encode3to4([BII[BII)[B
    .locals 4

    .line 1
    invoke-static {p5}, Lorg/seamless/util/io/Base64Coder;->getAlphabet(I)[B

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    const/4 v0, 0x0

    .line 6
    if-lez p2, :cond_0

    .line 7
    .line 8
    aget-byte v1, p0, p1

    .line 9
    .line 10
    shl-int/lit8 v1, v1, 0x18

    .line 11
    .line 12
    ushr-int/lit8 v1, v1, 0x8

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v1, v0

    .line 16
    :goto_0
    const/4 v2, 0x1

    .line 17
    if-le p2, v2, :cond_1

    .line 18
    .line 19
    add-int/lit8 v3, p1, 0x1

    .line 20
    .line 21
    aget-byte v3, p0, v3

    .line 22
    .line 23
    shl-int/lit8 v3, v3, 0x18

    .line 24
    .line 25
    ushr-int/lit8 v3, v3, 0x10

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    move v3, v0

    .line 29
    :goto_1
    or-int/2addr v1, v3

    .line 30
    const/4 v3, 0x2

    .line 31
    if-le p2, v3, :cond_2

    .line 32
    .line 33
    add-int/2addr p1, v3

    .line 34
    aget-byte p0, p0, p1

    .line 35
    .line 36
    shl-int/lit8 p0, p0, 0x18

    .line 37
    .line 38
    ushr-int/lit8 v0, p0, 0x18

    .line 39
    .line 40
    :cond_2
    or-int p0, v1, v0

    .line 41
    .line 42
    const/16 p1, 0x3d

    .line 43
    .line 44
    const/4 v0, 0x3

    .line 45
    if-eq p2, v2, :cond_5

    .line 46
    .line 47
    if-eq p2, v3, :cond_4

    .line 48
    .line 49
    if-eq p2, v0, :cond_3

    .line 50
    .line 51
    return-object p3

    .line 52
    :cond_3
    ushr-int/lit8 p1, p0, 0x12

    .line 53
    .line 54
    aget-byte p1, p5, p1

    .line 55
    .line 56
    aput-byte p1, p3, p4

    .line 57
    .line 58
    add-int/lit8 p1, p4, 0x1

    .line 59
    .line 60
    ushr-int/lit8 p2, p0, 0xc

    .line 61
    .line 62
    and-int/lit8 p2, p2, 0x3f

    .line 63
    .line 64
    aget-byte p2, p5, p2

    .line 65
    .line 66
    aput-byte p2, p3, p1

    .line 67
    .line 68
    add-int/lit8 p1, p4, 0x2

    .line 69
    .line 70
    ushr-int/lit8 p2, p0, 0x6

    .line 71
    .line 72
    and-int/lit8 p2, p2, 0x3f

    .line 73
    .line 74
    aget-byte p2, p5, p2

    .line 75
    .line 76
    aput-byte p2, p3, p1

    .line 77
    .line 78
    add-int/2addr p4, v0

    .line 79
    and-int/lit8 p0, p0, 0x3f

    .line 80
    .line 81
    aget-byte p0, p5, p0

    .line 82
    .line 83
    aput-byte p0, p3, p4

    .line 84
    .line 85
    return-object p3

    .line 86
    :cond_4
    ushr-int/lit8 p2, p0, 0x12

    .line 87
    .line 88
    aget-byte p2, p5, p2

    .line 89
    .line 90
    aput-byte p2, p3, p4

    .line 91
    .line 92
    add-int/lit8 p2, p4, 0x1

    .line 93
    .line 94
    ushr-int/lit8 v1, p0, 0xc

    .line 95
    .line 96
    and-int/lit8 v1, v1, 0x3f

    .line 97
    .line 98
    aget-byte v1, p5, v1

    .line 99
    .line 100
    aput-byte v1, p3, p2

    .line 101
    .line 102
    add-int/lit8 p2, p4, 0x2

    .line 103
    .line 104
    ushr-int/lit8 p0, p0, 0x6

    .line 105
    .line 106
    and-int/lit8 p0, p0, 0x3f

    .line 107
    .line 108
    aget-byte p0, p5, p0

    .line 109
    .line 110
    aput-byte p0, p3, p2

    .line 111
    .line 112
    add-int/2addr p4, v0

    .line 113
    aput-byte p1, p3, p4

    .line 114
    .line 115
    return-object p3

    .line 116
    :cond_5
    ushr-int/lit8 p2, p0, 0x12

    .line 117
    .line 118
    aget-byte p2, p5, p2

    .line 119
    .line 120
    aput-byte p2, p3, p4

    .line 121
    .line 122
    add-int/lit8 p2, p4, 0x1

    .line 123
    .line 124
    ushr-int/lit8 p0, p0, 0xc

    .line 125
    .line 126
    and-int/lit8 p0, p0, 0x3f

    .line 127
    .line 128
    aget-byte p0, p5, p0

    .line 129
    .line 130
    aput-byte p0, p3, p2

    .line 131
    .line 132
    add-int/lit8 p0, p4, 0x2

    .line 133
    .line 134
    aput-byte p1, p3, p0

    .line 135
    .line 136
    add-int/2addr p4, v0

    .line 137
    aput-byte p1, p3, p4

    .line 138
    .line 139
    return-object p3
.end method

.method private static encode3to4([B[BII)[B
    .locals 6

    const/4 v1, 0x0

    const/4 v4, 0x0

    move-object v3, p0

    move-object v0, p1

    move v2, p2

    move v5, p3

    .line 140
    invoke-static/range {v0 .. v5}, Lorg/seamless/util/io/Base64Coder;->encode3to4([BII[BII)[B

    return-object v3
.end method

.method public static encodeBytes([B)Ljava/lang/String;
    .locals 2

    .line 21
    :try_start_0
    array-length v0, p0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, v1}, Lorg/seamless/util/io/Base64Coder;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static encodeBytes([BI)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 19
    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lorg/seamless/util/io/Base64Coder;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static encodeBytes([BII)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 20
    :try_start_0
    invoke-static {p0, p1, p2, v0}, Lorg/seamless/util/io/Base64Coder;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static encodeBytes([BIII)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2, p3}, Lorg/seamless/util/io/Base64Coder;->encodeBytesToBytes([BIII)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :try_start_0
    new-instance p1, Ljava/lang/String;

    .line 6
    .line 7
    const-string p2, "US-ASCII"

    .line 8
    .line 9
    invoke-direct {p1, p0, p2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-object p1

    .line 13
    :catch_0
    new-instance p1, Ljava/lang/String;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([B)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method public static encodeBytesToBytes([B)[B
    .locals 2

    .line 231
    :try_start_0
    array-length v0, p0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, v1}, Lorg/seamless/util/io/Base64Coder;->encodeBytesToBytes([BIII)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static encodeBytesToBytes([BIII)[B
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v6, p1

    .line 4
    .line 5
    move/from16 v7, p2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_b

    .line 9
    .line 10
    if-ltz v6, :cond_a

    .line 11
    .line 12
    if-ltz v7, :cond_9

    .line 13
    .line 14
    add-int v2, v6, v7

    .line 15
    .line 16
    array-length v3, v0

    .line 17
    if-gt v2, v3, :cond_8

    .line 18
    .line 19
    and-int/lit8 v2, p3, 0x2

    .line 20
    .line 21
    const/4 v8, 0x1

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    :try_start_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 27
    .line 28
    .line 29
    :try_start_1
    new-instance v3, Lorg/seamless/util/io/Base64Coder$OutputStream;

    .line 30
    .line 31
    or-int/lit8 v4, p3, 0x1

    .line 32
    .line 33
    invoke-direct {v3, v2, v4}, Lorg/seamless/util/io/Base64Coder$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 34
    .line 35
    .line 36
    :try_start_2
    new-instance v4, Ljava/util/zip/GZIPOutputStream;

    .line 37
    .line 38
    invoke-direct {v4, v3}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 39
    .line 40
    .line 41
    :try_start_3
    invoke-virtual {v4, v0, v6, v7}, Ljava/util/zip/GZIPOutputStream;->write([BII)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 45
    .line 46
    .line 47
    :try_start_4
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 48
    .line 49
    .line 50
    :catch_0
    :try_start_5
    invoke-virtual {v3}, Lorg/seamless/util/io/Base64Coder$OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 51
    .line 52
    .line 53
    :catch_1
    :try_start_6
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 54
    .line 55
    .line 56
    :catch_2
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    return-object v0

    .line 61
    :catchall_0
    move-exception v0

    .line 62
    :goto_0
    move-object v1, v4

    .line 63
    goto :goto_3

    .line 64
    :catch_3
    move-exception v0

    .line 65
    :goto_1
    move-object v1, v2

    .line 66
    goto :goto_2

    .line 67
    :catchall_1
    move-exception v0

    .line 68
    goto :goto_3

    .line 69
    :catch_4
    move-exception v0

    .line 70
    move-object v4, v1

    .line 71
    goto :goto_1

    .line 72
    :catchall_2
    move-exception v0

    .line 73
    move-object v3, v1

    .line 74
    goto :goto_3

    .line 75
    :catch_5
    move-exception v0

    .line 76
    move-object v3, v1

    .line 77
    move-object v4, v3

    .line 78
    goto :goto_1

    .line 79
    :catchall_3
    move-exception v0

    .line 80
    move-object v2, v1

    .line 81
    move-object v3, v2

    .line 82
    goto :goto_3

    .line 83
    :catch_6
    move-exception v0

    .line 84
    move-object v3, v1

    .line 85
    move-object v4, v3

    .line 86
    :goto_2
    :try_start_7
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 87
    :catchall_4
    move-exception v0

    .line 88
    move-object v2, v1

    .line 89
    goto :goto_0

    .line 90
    :goto_3
    :try_start_8
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7

    .line 91
    .line 92
    .line 93
    :catch_7
    :try_start_9
    invoke-virtual {v3}, Lorg/seamless/util/io/Base64Coder$OutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    .line 94
    .line 95
    .line 96
    :catch_8
    :try_start_a
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_9

    .line 97
    .line 98
    .line 99
    :catch_9
    throw v0

    .line 100
    :cond_0
    and-int/lit8 v1, p3, 0x8

    .line 101
    .line 102
    const/4 v9, 0x0

    .line 103
    if-eqz v1, :cond_1

    .line 104
    .line 105
    move v10, v8

    .line 106
    goto :goto_4

    .line 107
    :cond_1
    move v10, v9

    .line 108
    :goto_4
    div-int/lit8 v1, v7, 0x3

    .line 109
    .line 110
    const/4 v11, 0x4

    .line 111
    mul-int/2addr v1, v11

    .line 112
    rem-int/lit8 v2, v7, 0x3

    .line 113
    .line 114
    if-lez v2, :cond_2

    .line 115
    .line 116
    move v2, v11

    .line 117
    goto :goto_5

    .line 118
    :cond_2
    move v2, v9

    .line 119
    :goto_5
    add-int/2addr v1, v2

    .line 120
    if-eqz v10, :cond_3

    .line 121
    .line 122
    div-int/lit8 v2, v1, 0x4c

    .line 123
    .line 124
    add-int/2addr v1, v2

    .line 125
    :cond_3
    move v12, v1

    .line 126
    new-array v3, v12, [B

    .line 127
    .line 128
    add-int/lit8 v13, v7, -0x2

    .line 129
    .line 130
    move v4, v9

    .line 131
    move v14, v4

    .line 132
    move v15, v14

    .line 133
    :goto_6
    if-ge v14, v13, :cond_5

    .line 134
    .line 135
    add-int v1, v14, v6

    .line 136
    .line 137
    const/4 v2, 0x3

    .line 138
    move/from16 v5, p3

    .line 139
    .line 140
    invoke-static/range {v0 .. v5}, Lorg/seamless/util/io/Base64Coder;->encode3to4([BII[BII)[B

    .line 141
    .line 142
    .line 143
    add-int/2addr v15, v11

    .line 144
    if-eqz v10, :cond_4

    .line 145
    .line 146
    const/16 v0, 0x4c

    .line 147
    .line 148
    if-lt v15, v0, :cond_4

    .line 149
    .line 150
    add-int/lit8 v0, v4, 0x4

    .line 151
    .line 152
    const/16 v1, 0xa

    .line 153
    .line 154
    aput-byte v1, v3, v0

    .line 155
    .line 156
    add-int/lit8 v4, v4, 0x1

    .line 157
    .line 158
    move v15, v9

    .line 159
    :cond_4
    add-int/lit8 v14, v14, 0x3

    .line 160
    .line 161
    add-int/2addr v4, v11

    .line 162
    move-object/from16 v0, p0

    .line 163
    .line 164
    goto :goto_6

    .line 165
    :cond_5
    if-ge v14, v7, :cond_6

    .line 166
    .line 167
    add-int v1, v14, v6

    .line 168
    .line 169
    sub-int v2, v7, v14

    .line 170
    .line 171
    move-object/from16 v0, p0

    .line 172
    .line 173
    move/from16 v5, p3

    .line 174
    .line 175
    invoke-static/range {v0 .. v5}, Lorg/seamless/util/io/Base64Coder;->encode3to4([BII[BII)[B

    .line 176
    .line 177
    .line 178
    add-int/lit8 v4, v4, 0x4

    .line 179
    .line 180
    :cond_6
    sub-int/2addr v12, v8

    .line 181
    if-gt v4, v12, :cond_7

    .line 182
    .line 183
    new-array v0, v4, [B

    .line 184
    .line 185
    invoke-static {v3, v9, v0, v9, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 186
    .line 187
    .line 188
    return-object v0

    .line 189
    :cond_7
    return-object v3

    .line 190
    :cond_8
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    array-length v0, v0

    .line 199
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    filled-new-array {v2, v3, v0}, [Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    const-string v2, "Cannot have offset of %d and length of %d with array of length %d"

    .line 208
    .line 209
    invoke-static {v2, v0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    return-object v1

    .line 213
    :cond_9
    const-string v0, "Cannot have length offset: "

    .line 214
    .line 215
    invoke-static {v0, v7}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 216
    .line 217
    .line 218
    return-object v1

    .line 219
    :cond_a
    const-string v0, "Cannot have negative offset: "

    .line 220
    .line 221
    invoke-static {v0, v6}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 222
    .line 223
    .line 224
    return-object v1

    .line 225
    :cond_b
    const-string v0, "Cannot serialize a null array."

    .line 226
    .line 227
    invoke-static {v0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    return-object v1
.end method

.method public static encodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lorg/seamless/util/io/Base64Coder;->encodeFromFile(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    :try_start_0
    new-instance v1, Ljava/io/BufferedOutputStream;

    .line 7
    .line 8
    new-instance v2, Ljava/io/FileOutputStream;

    .line 9
    .line 10
    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 14
    .line 15
    .line 16
    :try_start_1
    const-string p1, "US-ASCII"

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v1, p0}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    .line 24
    .line 25
    :try_start_2
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 26
    .line 27
    .line 28
    :catch_0
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    move-object v0, v1

    .line 31
    goto :goto_1

    .line 32
    :catch_1
    move-exception p0

    .line 33
    move-object v0, v1

    .line 34
    goto :goto_0

    .line 35
    :catchall_1
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :catch_2
    move-exception p0

    .line 38
    :goto_0
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 39
    :goto_1
    :try_start_4
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 40
    .line 41
    .line 42
    :catch_3
    throw p0
.end method

.method public static encodeFromFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/io/File;

    .line 3
    .line 4
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/io/File;->length()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    long-to-double v2, v2

    .line 12
    const-wide v4, 0x3ff6666666666666L    # 1.4

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    mul-double/2addr v2, v4

    .line 18
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 19
    .line 20
    add-double/2addr v2, v4

    .line 21
    double-to-int p0, v2

    .line 22
    const/16 v2, 0x28

    .line 23
    .line 24
    invoke-static {p0, v2}, Ljava/lang/Math;->max(II)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    new-array p0, p0, [B

    .line 29
    .line 30
    new-instance v2, Lorg/seamless/util/io/Base64Coder$InputStream;

    .line 31
    .line 32
    new-instance v3, Ljava/io/BufferedInputStream;

    .line 33
    .line 34
    new-instance v4, Ljava/io/FileInputStream;

    .line 35
    .line 36
    invoke-direct {v4, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {v3, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 40
    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-direct {v2, v3, v1}, Lorg/seamless/util/io/Base64Coder$InputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    move v1, v0

    .line 48
    :goto_0
    const/16 v3, 0x1000

    .line 49
    .line 50
    :try_start_1
    invoke-virtual {v2, p0, v1, v3}, Lorg/seamless/util/io/Base64Coder$InputStream;->read([BII)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-ltz v3, :cond_0

    .line 55
    .line 56
    add-int/2addr v1, v3

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    new-instance v3, Ljava/lang/String;

    .line 59
    .line 60
    const-string v4, "US-ASCII"

    .line 61
    .line 62
    invoke-direct {v3, p0, v0, v1, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    .line 64
    .line 65
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 66
    .line 67
    .line 68
    :catch_0
    return-object v3

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    move-object v0, v2

    .line 71
    goto :goto_2

    .line 72
    :catch_1
    move-exception p0

    .line 73
    move-object v0, v2

    .line 74
    goto :goto_1

    .line 75
    :catchall_1
    move-exception p0

    .line 76
    goto :goto_2

    .line 77
    :catch_2
    move-exception p0

    .line 78
    :goto_1
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 79
    :goto_2
    :try_start_4
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 80
    .line 81
    .line 82
    :catch_3
    throw p0
.end method

.method public static encodeObject(Ljava/io/Serializable;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 136
    invoke-static {p0, v0}, Lorg/seamless/util/io/Base64Coder;->encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_8
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 7
    .line 8
    .line 9
    :try_start_1
    new-instance v2, Lorg/seamless/util/io/Base64Coder$OutputStream;

    .line 10
    .line 11
    or-int/lit8 v3, p1, 0x1

    .line 12
    .line 13
    invoke-direct {v2, v1, v3}, Lorg/seamless/util/io/Base64Coder$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 14
    .line 15
    .line 16
    and-int/lit8 p1, p1, 0x2

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    :try_start_2
    new-instance p1, Ljava/util/zip/GZIPOutputStream;

    .line 21
    .line 22
    invoke-direct {p1, v2}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 23
    .line 24
    .line 25
    :try_start_3
    new-instance v3, Ljava/io/ObjectOutputStream;

    .line 26
    .line 27
    invoke-direct {v3, p1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 28
    .line 29
    .line 30
    move-object v0, v3

    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto/16 :goto_2

    .line 34
    .line 35
    :catch_0
    move-exception p0

    .line 36
    move-object v4, v1

    .line 37
    move-object v1, v0

    .line 38
    move-object v0, v4

    .line 39
    goto :goto_1

    .line 40
    :catchall_1
    move-exception p0

    .line 41
    move-object p1, v0

    .line 42
    goto :goto_2

    .line 43
    :catch_1
    move-exception p0

    .line 44
    move-object p1, v0

    .line 45
    move-object v0, v1

    .line 46
    move-object v1, p1

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    :try_start_4
    new-instance p1, Ljava/io/ObjectOutputStream;

    .line 49
    .line 50
    invoke-direct {p1, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 51
    .line 52
    .line 53
    move-object v4, v0

    .line 54
    move-object v0, p1

    .line 55
    move-object p1, v4

    .line 56
    :goto_0
    :try_start_5
    invoke-virtual {v0, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 57
    .line 58
    .line 59
    :try_start_6
    invoke-virtual {v0}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 60
    .line 61
    .line 62
    :catch_2
    :try_start_7
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    .line 63
    .line 64
    .line 65
    :catch_3
    :try_start_8
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    .line 66
    .line 67
    .line 68
    :catch_4
    :try_start_9
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    .line 69
    .line 70
    .line 71
    :catch_5
    :try_start_a
    new-instance p0, Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string v0, "US-ASCII"

    .line 78
    .line 79
    invoke-direct {p0, p1, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_a .. :try_end_a} :catch_6

    .line 80
    .line 81
    .line 82
    return-object p0

    .line 83
    :catch_6
    new-instance p0, Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-direct {p0, p1}, Ljava/lang/String;-><init>([B)V

    .line 90
    .line 91
    .line 92
    return-object p0

    .line 93
    :catchall_2
    move-exception p0

    .line 94
    move-object p1, v0

    .line 95
    move-object v2, p1

    .line 96
    goto :goto_2

    .line 97
    :catch_7
    move-exception p0

    .line 98
    move-object p1, v0

    .line 99
    move-object v2, p1

    .line 100
    move-object v0, v1

    .line 101
    move-object v1, v2

    .line 102
    goto :goto_1

    .line 103
    :catchall_3
    move-exception p0

    .line 104
    move-object p1, v0

    .line 105
    move-object v1, p1

    .line 106
    move-object v2, v1

    .line 107
    goto :goto_2

    .line 108
    :catch_8
    move-exception p0

    .line 109
    move-object p1, v0

    .line 110
    move-object v1, p1

    .line 111
    move-object v2, v1

    .line 112
    :goto_1
    :try_start_b
    throw p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 113
    :catchall_4
    move-exception p0

    .line 114
    move-object v4, v1

    .line 115
    move-object v1, v0

    .line 116
    move-object v0, v4

    .line 117
    :goto_2
    :try_start_c
    invoke-virtual {v0}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_9

    .line 118
    .line 119
    .line 120
    :catch_9
    :try_start_d
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_a

    .line 121
    .line 122
    .line 123
    :catch_a
    :try_start_e
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_b

    .line 124
    .line 125
    .line 126
    :catch_b
    :try_start_f
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_c

    .line 127
    .line 128
    .line 129
    :catch_c
    throw p0

    .line 130
    :cond_1
    const-string p0, "Cannot serialize a null object."

    .line 131
    .line 132
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-object v0
.end method

.method public static encodeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lorg/seamless/util/io/Base64Coder;->encodeBytes([B)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static encodeToFile([BLjava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :try_start_0
    new-instance v1, Lorg/seamless/util/io/Base64Coder$OutputStream;

    .line 5
    .line 6
    new-instance v2, Ljava/io/FileOutputStream;

    .line 7
    .line 8
    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-direct {v1, v2, p1}, Lorg/seamless/util/io/Base64Coder$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    .line 14
    .line 15
    :try_start_1
    invoke-virtual {v1, p0}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    .line 17
    .line 18
    :try_start_2
    invoke-virtual {v1}, Lorg/seamless/util/io/Base64Coder$OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 19
    .line 20
    .line 21
    :catch_0
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    move-object v0, v1

    .line 24
    goto :goto_1

    .line 25
    :catch_1
    move-exception p0

    .line 26
    move-object v0, v1

    .line 27
    goto :goto_0

    .line 28
    :catchall_1
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :catch_2
    move-exception p0

    .line 31
    :goto_0
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 32
    :goto_1
    :try_start_4
    invoke-virtual {v0}, Lorg/seamless/util/io/Base64Coder$OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 33
    .line 34
    .line 35
    :catch_3
    throw p0

    .line 36
    :cond_0
    const-string p0, "Data to encode was null."

    .line 37
    .line 38
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private static final getAlphabet(I)[B
    .locals 2

    .line 1
    and-int/lit8 v0, p0, 0x10

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    sget-object p0, Lorg/seamless/util/io/Base64Coder;->_URL_SAFE_ALPHABET:[B

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/16 v0, 0x20

    .line 11
    .line 12
    and-int/2addr p0, v0

    .line 13
    if-ne p0, v0, :cond_1

    .line 14
    .line 15
    sget-object p0, Lorg/seamless/util/io/Base64Coder;->_ORDERED_ALPHABET:[B

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    sget-object p0, Lorg/seamless/util/io/Base64Coder;->_STANDARD_ALPHABET:[B

    .line 19
    .line 20
    return-object p0
.end method

.method private static final getDecodabet(I)[B
    .locals 2

    .line 1
    and-int/lit8 v0, p0, 0x10

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    sget-object p0, Lorg/seamless/util/io/Base64Coder;->_URL_SAFE_DECODABET:[B

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/16 v0, 0x20

    .line 11
    .line 12
    and-int/2addr p0, v0

    .line 13
    if-ne p0, v0, :cond_1

    .line 14
    .line 15
    sget-object p0, Lorg/seamless/util/io/Base64Coder;->_ORDERED_DECODABET:[B

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    sget-object p0, Lorg/seamless/util/io/Base64Coder;->_STANDARD_DECODABET:[B

    .line 19
    .line 20
    return-object p0
.end method
