.class public final Lcom/immomo/momo/brotlij/BrotliDeCompressor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momo/brotlij/BrotliDeCompressor$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \u001f2\u00020\u0001:\u0001 B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J(\u0010\n\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0008\u001a\u00020\u0006H\u0082 \u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0010\u0010\u000c\u001a\u00020\u0004H\u0082 \u00a2\u0006\u0004\u0008\u000c\u0010\rJ0\u0010\u0013\u001a\u00020\u00102\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0012\u001a\u00020\u0010H\u0082 \u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0018\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0005\u001a\u00020\u0004H\u0082 \u00a2\u0006\u0004\u0008\u0016\u0010\u0017R\u0014\u0010\u0018\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0019R\u0018\u0010\u001a\u001a\u0004\u0018\u00010\u000e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u001bR\u0016\u0010\u001d\u001a\u00020\u001c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010\u001e\u00a8\u0006!"
    }
    d2 = {
        "Lcom/immomo/momo/brotlij/BrotliDeCompressor;",
        "",
        "<init>",
        "()V",
        "",
        "decoderInstance",
        "",
        "inputFilePath",
        "outputFilePath",
        "",
        "nativeDeCompressFile",
        "(JLjava/lang/String;Ljava/lang/String;)Z",
        "nativeCreateBrotliDeCompressorInstance",
        "()J",
        "",
        "data",
        "",
        "startPos",
        "length",
        "nativeDeCompress",
        "(J[BII)I",
        "",
        "nativeDestroyBrotliDeCompressorInstance",
        "(J)V",
        "mDecoderInstance",
        "J",
        "mDataInBuffer",
        "[B",
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
.field public static final Companion:Lcom/immomo/momo/brotlij/BrotliDeCompressor$a;

.field private static final DATA_IN_BUFFER_SIZE:I = 0x4000


# instance fields
.field private mDataInBuffer:[B

.field private final mDecoderInstance:J

.field private mOutputByteArrayOS:Ljava/io/ByteArrayOutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/immomo/momo/brotlij/BrotliDeCompressor$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/immomo/momo/brotlij/BrotliDeCompressor$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/immomo/momo/brotlij/BrotliDeCompressor;->Companion:Lcom/immomo/momo/brotlij/BrotliDeCompressor$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/immomo/momo/brotlij/BrotliDeCompressor;->nativeCreateBrotliDeCompressorInstance()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/immomo/momo/brotlij/BrotliDeCompressor;->mDecoderInstance:J

    .line 9
    .line 10
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/immomo/momo/brotlij/BrotliDeCompressor;->mOutputByteArrayOS:Ljava/io/ByteArrayOutputStream;

    .line 16
    .line 17
    return-void
.end method

.method private final native nativeCreateBrotliDeCompressorInstance()J
.end method

.method private final native nativeDeCompress(J[BII)I
.end method

.method private final native nativeDeCompressFile(JLjava/lang/String;Ljava/lang/String;)Z
.end method

.method private final native nativeDestroyBrotliDeCompressorInstance(J)V
.end method
