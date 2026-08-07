.class public final Lcom/immomo/momo/brotlij/BrotliCompressor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momo/brotlij/BrotliCompressor$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0012\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \'2\u00020\u0001:\u0001(B/\u0012\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0008\u0010\tJ(\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000e\u001a\u00020\u000cH\u0082 \u00a2\u0006\u0004\u0008\u0010\u0010\u0011J0\u0010\u0012\u001a\u00020\n2\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0004H\u0082 \u00a2\u0006\u0004\u0008\u0012\u0010\u0013J@\u0010\u001a\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u00042\u0006\u0010\u0017\u001a\u00020\u00042\u0006\u0010\u0018\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00020\u000fH\u0082 \u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u0018\u0010\u001d\u001a\u00020\u001c2\u0006\u0010\u000b\u001a\u00020\nH\u0082 \u00a2\u0006\u0004\u0008\u001d\u0010\u001eR\u0016\u0010\u001f\u001a\u00020\n8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001f\u0010 R\u0018\u0010!\u001a\u0004\u0018\u00010\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008!\u0010\"R\u0018\u0010#\u001a\u0004\u0018\u00010\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008#\u0010\"R\u0016\u0010%\u001a\u00020$8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008%\u0010&\u00a8\u0006)"
    }
    d2 = {
        "Lcom/immomo/momo/brotlij/BrotliCompressor;",
        "",
        "Lcom/immomo/momo/brotlij/Brotli$Mode;",
        "mode",
        "",
        "quality",
        "lgwin",
        "lgblock",
        "<init>",
        "(Lcom/immomo/momo/brotlij/Brotli$Mode;III)V",
        "",
        "encoderInstance",
        "",
        "inputFilePath",
        "outputFilePath",
        "",
        "nativeCompressFile",
        "(JLjava/lang/String;Ljava/lang/String;)Z",
        "nativeCreateBrotliCompressorInstance",
        "(IIII)J",
        "",
        "data",
        "startPos",
        "length",
        "compressedData",
        "isEof",
        "nativeCompress",
        "(J[BII[BZ)I",
        "",
        "nativeDestroyBrotliCompressorInstance",
        "(J)V",
        "mEncoderInstance",
        "J",
        "mDataInBuffer",
        "[B",
        "mDataOutBuffer",
        "Ljava/io/ByteArrayOutputStream;",
        "mOutputByteArrayOS",
        "Ljava/io/ByteArrayOutputStream;",
        "Companion",
        "a",
        "brotlij_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Lcom/immomo/momo/brotlij/BrotliCompressor$a;

.field private static final DATA_IN_BUFFER_MAX_SIZE:I = 0x8000

.field private static final DATA_IN_BUFFER_MIN_SIZE:I = 0x2000

.field private static final DATA_OUT_BUFFER_MAX_SIZE:I = 0x10000

.field private static final DATA_OUT_BUFFER_MIN_SIZE:I = 0x4000


# instance fields
.field private mDataInBuffer:[B

.field private mDataOutBuffer:[B

.field private mEncoderInstance:J

.field private mOutputByteArrayOS:Ljava/io/ByteArrayOutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/immomo/momo/brotlij/BrotliCompressor$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/immomo/momo/brotlij/BrotliCompressor$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/immomo/momo/brotlij/BrotliCompressor;->Companion:Lcom/immomo/momo/brotlij/BrotliCompressor$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 7

    .line 34
    const/16 v5, 0xf

    const/4 v6, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/immomo/momo/brotlij/BrotliCompressor;-><init>(Lcom/immomo/momo/brotlij/Brotli$Mode;IIIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lcom/immomo/momo/brotlij/Brotli$Mode;III)V
    .locals 0
    .param p1    # Lcom/immomo/momo/brotlij/Brotli$Mode;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-virtual {p1}, Lcom/immomo/momo/brotlij/Brotli$Mode;->getMode()I

    move-result p1

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/momo/brotlij/BrotliCompressor;->nativeCreateBrotliCompressorInstance(IIII)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/immomo/momo/brotlij/BrotliCompressor;->mEncoderInstance:J

    .line 33
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object p1, p0, Lcom/immomo/momo/brotlij/BrotliCompressor;->mOutputByteArrayOS:Ljava/io/ByteArrayOutputStream;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/immomo/momo/brotlij/Brotli$Mode;IIIILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p6, p5, 0x1

    .line 2
    .line 3
    if-eqz p6, :cond_0

    .line 4
    .line 5
    sget-object p1, Lcom/immomo/momo/brotlij/Brotli;->INSTANCE:Lcom/immomo/momo/brotlij/Brotli;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/immomo/momo/brotlij/Brotli;->a()Lcom/immomo/momo/brotlij/Brotli$Mode;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    and-int/lit8 p6, p5, 0x2

    .line 12
    .line 13
    if-eqz p6, :cond_1

    .line 14
    .line 15
    const/4 p2, 0x6

    .line 16
    :cond_1
    and-int/lit8 p6, p5, 0x4

    .line 17
    .line 18
    if-eqz p6, :cond_2

    .line 19
    .line 20
    const/16 p3, 0x16

    .line 21
    .line 22
    :cond_2
    and-int/lit8 p5, p5, 0x8

    .line 23
    .line 24
    if-eqz p5, :cond_3

    .line 25
    .line 26
    const/4 p4, 0x0

    .line 27
    :cond_3
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/momo/brotlij/BrotliCompressor;-><init>(Lcom/immomo/momo/brotlij/Brotli$Mode;III)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private final native nativeCompress(J[BII[BZ)I
.end method

.method private final native nativeCompressFile(JLjava/lang/String;Ljava/lang/String;)Z
.end method

.method private final native nativeCreateBrotliCompressorInstance(IIII)J
.end method

.method private final native nativeDestroyBrotliCompressorInstance(J)V
.end method
