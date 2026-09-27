.class public final Lkotlin/io/LineReader;
.super Ljava/lang/Object;
.source "Console.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nConsole.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Console.kt\nkotlin/io/LineReader\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,304:1\n1#2:305\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0019\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001c\u0010\u0015\u001a\u0004\u0018\u00010\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001aH\u0086\u0080\u0004J\u0012\u0010\u001b\u001a\u00020\u00052\u0006\u0010\u001c\u001a\u00020\tH\u0082\u0080\u0004J\n\u0010\u001d\u001a\u00020\u0005H\u0082\u0080\u0004J\u001a\u0010\u001e\u001a\u00020\u00052\u0006\u0010\u001f\u001a\u00020\u00052\u0006\u0010 \u001a\u00020\u0005H\u0082\u0080\u0004J\u0012\u0010!\u001a\u00020\"2\u0006\u0010\u0019\u001a\u00020\u001aH\u0082\u0080\u0004J\n\u0010#\u001a\u00020\"H\u0082\u0080\u0004J\n\u0010$\u001a\u00020\"H\u0082\u0080\u0004R\u000f\u0010\u0004\u001a\u00020\u0005X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0006\u001a\u00020\u0007X\u0082\u00ae\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0008\u001a\u00020\tX\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\n\u001a\u00020\u000bX\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000c\u001a\u00020\rX\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000e\u001a\u00020\u000fX\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0010\u001a\u00020\u0011X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u0013\u0010\u0012\u001a\u00060\u0013j\u0002`\u0014X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006%"
    }
    d2 = {
        "Lkotlin/io/LineReader;",
        "",
        "<init>",
        "()V",
        "BUFFER_SIZE",
        "",
        "decoder",
        "Ljava/nio/charset/CharsetDecoder;",
        "directEOL",
        "",
        "bytes",
        "",
        "chars",
        "",
        "byteBuf",
        "Ljava/nio/ByteBuffer;",
        "charBuf",
        "Ljava/nio/CharBuffer;",
        "sb",
        "Ljava/lang/StringBuilder;",
        "Lkotlin/text/StringBuilder;",
        "readLine",
        "",
        "inputStream",
        "Ljava/io/InputStream;",
        "charset",
        "Ljava/nio/charset/Charset;",
        "decode",
        "endOfInput",
        "compactBytes",
        "decodeEndOfInput",
        "nBytes",
        "nChars",
        "updateCharset",
        "",
        "resetAll",
        "trimStringBuilder",
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
.field private static final BUFFER_SIZE:I = 0x20

.field public static final INSTANCE:Lkotlin/io/LineReader;

.field private static final byteBuf:Ljava/nio/ByteBuffer;

.field private static final bytes:[B

.field private static final charBuf:Ljava/nio/CharBuffer;

.field private static final chars:[C

.field private static decoder:Ljava/nio/charset/CharsetDecoder;

.field private static directEOL:Z

.field private static final sb:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lkotlin/io/LineReader;

    invoke-direct {v0}, Lkotlin/io/LineReader;-><init>()V

    sput-object v0, Lkotlin/io/LineReader;->INSTANCE:Lkotlin/io/LineReader;

    const/16 v0, 0x20

    .line 182
    new-array v1, v0, [B

    sput-object v1, Lkotlin/io/LineReader;->bytes:[B

    .line 183
    new-array v0, v0, [C

    sput-object v0, Lkotlin/io/LineReader;->chars:[C

    .line 184
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    const-string v2, "wrap(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object v1, Lkotlin/io/LineReader;->byteBuf:Ljava/nio/ByteBuffer;

    .line 185
    invoke-static {v0}, Ljava/nio/CharBuffer;->wrap([C)Ljava/nio/CharBuffer;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object v0, Lkotlin/io/LineReader;->charBuf:Ljava/nio/CharBuffer;

    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v0, Lkotlin/io/LineReader;->sb:Ljava/lang/StringBuilder;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final compactBytes()I
    .registers 3

    .line 262
    sget-object p0, Lkotlin/io/LineReader;->byteBuf:Ljava/nio/ByteBuffer;

    .line 263
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    .line 264
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return v0
.end method

.method private final decode(Z)I
    .registers 7

    .line 246
    :goto_0
    sget-object v0, Lkotlin/io/LineReader;->decoder:Ljava/nio/charset/CharsetDecoder;

    if-nez v0, :cond_a

    const-string v0, "decoder"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_a
    sget-object v1, Lkotlin/io/LineReader;->byteBuf:Ljava/nio/ByteBuffer;

    sget-object v2, Lkotlin/io/LineReader;->charBuf:Ljava/nio/CharBuffer;

    invoke-virtual {v0, v1, v2, p1}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v0

    const-string v1, "decode(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 247
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isError()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 248
    invoke-direct {p0}, Lkotlin/io/LineReader;->resetAll()V

    .line 249
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 251
    :cond_23
    invoke-virtual {v2}, Ljava/nio/CharBuffer;->position()I

    move-result v1

    .line 252
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isOverflow()Z

    move-result v0

    if-nez v0, :cond_2e

    return v1

    .line 254
    :cond_2e
    sget-object v0, Lkotlin/io/LineReader;->sb:Ljava/lang/StringBuilder;

    sget-object v3, Lkotlin/io/LineReader;->chars:[C

    add-int/lit8 v1, v1, -0x1

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 255
    invoke-virtual {v2, v4}, Ljava/nio/CharBuffer;->position(I)Ljava/nio/Buffer;

    const/16 v0, 0x20

    .line 256
    invoke-virtual {v2, v0}, Ljava/nio/CharBuffer;->limit(I)Ljava/nio/Buffer;

    .line 257
    aget-char v0, v3, v1

    invoke-virtual {v2, v0}, Ljava/nio/CharBuffer;->put(C)Ljava/nio/CharBuffer;

    goto :goto_0
.end method

.method private final decodeEndOfInput(II)I
    .registers 4

    .line 269
    sget-object v0, Lkotlin/io/LineReader;->byteBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 270
    sget-object p1, Lkotlin/io/LineReader;->charBuf:Ljava/nio/CharBuffer;

    invoke-virtual {p1, p2}, Ljava/nio/CharBuffer;->position(I)Ljava/nio/Buffer;

    const/4 p1, 0x1

    .line 271
    invoke-direct {p0, p1}, Lkotlin/io/LineReader;->decode(Z)I

    move-result p0

    .line 273
    sget-object p1, Lkotlin/io/LineReader;->decoder:Ljava/nio/charset/CharsetDecoder;

    if-nez p1, :cond_19

    const-string p1, "decoder"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p1, 0x0

    :cond_19
    invoke-virtual {p1}, Ljava/nio/charset/CharsetDecoder;->reset()Ljava/nio/charset/CharsetDecoder;

    const/4 p1, 0x0

    .line 274
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return p0
.end method

.method private final resetAll()V
    .registers 2

    .line 293
    sget-object p0, Lkotlin/io/LineReader;->decoder:Ljava/nio/charset/CharsetDecoder;

    if-nez p0, :cond_a

    const-string p0, "decoder"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_a
    invoke-virtual {p0}, Ljava/nio/charset/CharsetDecoder;->reset()Ljava/nio/charset/CharsetDecoder;

    .line 294
    sget-object p0, Lkotlin/io/LineReader;->byteBuf:Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 295
    sget-object p0, Lkotlin/io/LineReader;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    return-void
.end method

.method private final trimStringBuilder()V
    .registers 2

    .line 300
    sget-object p0, Lkotlin/io/LineReader;->sb:Ljava/lang/StringBuilder;

    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 301
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->trimToSize()V

    return-void
.end method

.method private final updateCharset(Ljava/nio/charset/Charset;)V
    .registers 6

    .line 280
    invoke-virtual {p1}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object p1

    const-string v0, "newDecoder(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object p1, Lkotlin/io/LineReader;->decoder:Ljava/nio/charset/CharsetDecoder;

    .line 282
    sget-object p1, Lkotlin/io/LineReader;->byteBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 283
    sget-object v0, Lkotlin/io/LineReader;->charBuf:Ljava/nio/CharBuffer;

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->clear()Ljava/nio/Buffer;

    const/16 v1, 0xa

    .line 284
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 285
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 286
    sget-object v2, Lkotlin/io/LineReader;->decoder:Ljava/nio/charset/CharsetDecoder;

    if-nez v2, :cond_27

    const-string v2, "decoder"

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v2, 0x0

    :cond_27
    const/4 v3, 0x0

    invoke-virtual {v2, p1, v0, v3}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;Z)Ljava/nio/charset/CoderResult;

    .line 287
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->position()I

    move-result p1

    const/4 v2, 0x1

    if-ne p1, v2, :cond_39

    invoke-virtual {v0, v3}, Ljava/nio/CharBuffer;->get(I)C

    move-result p1

    if-ne p1, v1, :cond_39

    move v3, v2

    :cond_39
    sput-boolean v3, Lkotlin/io/LineReader;->directEOL:Z

    .line 288
    invoke-direct {p0}, Lkotlin/io/LineReader;->resetAll()V

    return-void
.end method


# virtual methods
.method public final declared-synchronized readLine(Ljava/io/InputStream;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 12

    monitor-enter p0

    :try_start_1
    const-string v0, "inputStream"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "charset"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 196
    sget-object v0, Lkotlin/io/LineReader;->decoder:Ljava/nio/charset/CharsetDecoder;

    const/4 v1, 0x0

    if-eqz v0, :cond_22

    if-nez v0, :cond_18

    const-string v0, "decoder"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_18
    invoke-virtual {v0}, Ljava/nio/charset/CharsetDecoder;->charset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-static {v0, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    :cond_22
    invoke-direct {p0, p2}, Lkotlin/io/LineReader;->updateCharset(Ljava/nio/charset/Charset;)V

    :cond_25
    const/4 p2, 0x0

    move v0, p2

    move v2, v0

    .line 200
    :goto_28
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v3

    const/16 v4, 0x20

    const/4 v5, -0x1

    const/16 v6, 0xa

    if-ne v3, v5, :cond_48

    .line 203
    sget-object p1, Lkotlin/io/LineReader;->sb:Ljava/lang/StringBuilder;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1
    :try_end_3b
    .catchall {:try_start_1 .. :try_end_3b} :catchall_c6

    if-nez p1, :cond_43

    if-nez v0, :cond_43

    if-nez v2, :cond_43

    .line 204
    monitor-exit p0

    return-object v1

    .line 206
    :cond_43
    :try_start_43
    invoke-direct {p0, v0, v2}, Lkotlin/io/LineReader;->decodeEndOfInput(II)I

    move-result p1

    goto :goto_76

    .line 210
    :cond_48
    sget-object v5, Lkotlin/io/LineReader;->bytes:[B

    add-int/lit8 v7, v0, 0x1

    int-to-byte v8, v3

    aput-byte v8, v5, v0

    if-eq v3, v6, :cond_5a

    if-eq v7, v4, :cond_5a

    .line 213
    sget-boolean v0, Lkotlin/io/LineReader;->directEOL:Z

    if-nez v0, :cond_58

    goto :goto_5a

    :cond_58
    move v0, v7

    goto :goto_28

    .line 215
    :cond_5a
    :goto_5a
    sget-object v0, Lkotlin/io/LineReader;->byteBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 216
    sget-object v3, Lkotlin/io/LineReader;->charBuf:Ljava/nio/CharBuffer;

    invoke-virtual {v3, v2}, Ljava/nio/CharBuffer;->position(I)Ljava/nio/Buffer;

    .line 217
    invoke-direct {p0, p2}, Lkotlin/io/LineReader;->decode(Z)I

    move-result v2

    if-lez v2, :cond_c0

    .line 219
    sget-object v3, Lkotlin/io/LineReader;->chars:[C

    add-int/lit8 v5, v2, -0x1

    aget-char v3, v3, v5

    if-ne v3, v6, :cond_c0

    .line 220
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move p1, v2

    :goto_76
    if-lez p1, :cond_90

    .line 228
    sget-object v0, Lkotlin/io/LineReader;->chars:[C

    add-int/lit8 v1, p1, -0x1

    aget-char v1, v0, v1

    if-ne v1, v6, :cond_90

    add-int/lit8 v1, p1, -0x1

    if-lez v1, :cond_8f

    add-int/lit8 v2, p1, -0x2

    .line 230
    aget-char v0, v0, v2

    const/16 v2, 0xd

    if-ne v0, v2, :cond_8f

    add-int/lit8 p1, p1, -0x2

    goto :goto_90

    :cond_8f
    move p1, v1

    .line 233
    :cond_90
    :goto_90
    sget-object v0, Lkotlin/io/LineReader;->sb:Ljava/lang/StringBuilder;

    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_a4

    new-instance v0, Ljava/lang/String;

    sget-object v1, Lkotlin/io/LineReader;->chars:[C

    invoke-direct {v0, v1, p2, p1}, Ljava/lang/String;-><init>([CII)V
    :try_end_a2
    .catchall {:try_start_43 .. :try_end_a2} :catchall_c6

    monitor-exit p0

    return-object v0

    .line 235
    :cond_a4
    :try_start_a4
    sget-object v1, Lkotlin/io/LineReader;->chars:[C

    invoke-virtual {v0, v1, p2, p1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 237
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "toString(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 238
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-le v1, v4, :cond_bb

    invoke-direct {p0}, Lkotlin/io/LineReader;->trimStringBuilder()V

    .line 239
    :cond_bb
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->setLength(I)V
    :try_end_be
    .catchall {:try_start_a4 .. :try_end_be} :catchall_c6

    .line 240
    monitor-exit p0

    return-object p1

    .line 224
    :cond_c0
    :try_start_c0
    invoke-direct {p0}, Lkotlin/io/LineReader;->compactBytes()I

    move-result v0

    goto/16 :goto_28

    :catchall_c6
    move-exception p1

    monitor-exit p0
    :try_end_c8
    .catchall {:try_start_c0 .. :try_end_c8} :catchall_c6

    throw p1
.end method
