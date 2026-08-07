.class public final Lcom/alibaba/fastjson/serializer/SerializeWriter;
.super Ljava/io/Writer;
.source "SourceFile"


# static fields
.field private static BUFFER_THRESHOLD:I

.field private static final bufLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "[C>;"
        }
    .end annotation
.end field

.field private static final bytesBufLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "[B>;"
        }
    .end annotation
.end field

.field static final nonDirectFeatures:I


# instance fields
.field protected beanToArray:Z

.field protected browserSecure:Z

.field protected buf:[C

.field protected count:I

.field protected disableCircularReferenceDetect:Z

.field protected features:I

.field protected keySeperator:C

.field protected maxBufSize:I

.field protected notWriteDefaultValue:Z

.field protected quoteFieldNames:Z

.field protected sepcialBits:J

.field protected sortField:Z

.field protected useSingleQuotes:Z

.field protected writeDirect:Z

.field protected writeEnumUsingName:Z

.field protected writeEnumUsingToString:Z

.field protected writeNonStringValueAsString:Z

.field private final writer:Ljava/io/Writer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bufLocal:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bytesBufLocal:Ljava/lang/ThreadLocal;

    .line 14
    .line 15
    const/high16 v0, 0x20000

    .line 16
    .line 17
    sput v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->BUFFER_THRESHOLD:I

    .line 18
    .line 19
    :try_start_0
    const-string v0, "fastjson.serializer_buffer_threshold"

    .line 20
    .line 21
    invoke-static {v0}, Lcom/alibaba/fastjson/util/IOUtils;->getStringProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-lez v1, :cond_0

    .line 32
    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/16 v1, 0x40

    .line 38
    .line 39
    if-lt v0, v1, :cond_0

    .line 40
    .line 41
    const/high16 v1, 0x10000

    .line 42
    .line 43
    if-gt v0, v1, :cond_0

    .line 44
    .line 45
    mul-int/lit16 v0, v0, 0x400

    .line 46
    .line 47
    sput v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->BUFFER_THRESHOLD:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    :catchall_0
    :cond_0
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseSingleQuotes:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 50
    .line 51
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 52
    .line 53
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 54
    .line 55
    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 56
    .line 57
    or-int/2addr v0, v1

    .line 58
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 59
    .line 60
    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 61
    .line 62
    or-int/2addr v0, v1

    .line 63
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingToString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 64
    .line 65
    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 66
    .line 67
    or-int/2addr v0, v1

    .line 68
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNonStringValueAsString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 69
    .line 70
    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 71
    .line 72
    or-int/2addr v0, v1

    .line 73
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 74
    .line 75
    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 76
    .line 77
    or-int/2addr v0, v1

    .line 78
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->IgnoreErrorGetter:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 79
    .line 80
    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 81
    .line 82
    or-int/2addr v0, v1

    .line 83
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 84
    .line 85
    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 86
    .line 87
    or-int/2addr v0, v1

    .line 88
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->NotWriteDefaultValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 89
    .line 90
    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 91
    .line 92
    or-int/2addr v0, v1

    .line 93
    sput v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->nonDirectFeatures:I

    .line 94
    .line 95
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 55
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, v0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;)V
    .locals 2

    .line 52
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->EMPTY:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-direct {p0, p1, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;I)V
    .locals 1

    .line 57
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    const/4 v0, -0x1

    .line 58
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->maxBufSize:I

    .line 59
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-lez p2, :cond_0

    .line 60
    new-array p1, p2, [C

    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 61
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->computeFeatures()V

    return-void

    .line 62
    :cond_0
    const-string p0, "Negative initial size: "

    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    const/4 p0, 0x0

    throw p0
.end method

.method public varargs constructor <init>(Ljava/io/Writer;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->maxBufSize:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 8
    .line 9
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bufLocal:Ljava/lang/ThreadLocal;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, [C

    .line 16
    .line 17
    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/16 p1, 0x800

    .line 27
    .line 28
    new-array p1, p1, [C

    .line 29
    .line 30
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 31
    .line 32
    :goto_0
    array-length p1, p3

    .line 33
    const/4 v0, 0x0

    .line 34
    :goto_1
    if-ge v0, p1, :cond_1

    .line 35
    .line 36
    aget-object v1, p3, v0

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    or-int/2addr p2, v1

    .line 43
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    iput p2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->computeFeatures()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public varargs constructor <init>(Ljava/io/Writer;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .locals 1

    const/4 v0, 0x0

    .line 54
    invoke-direct {p0, p1, v0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    return-void
.end method

.method public varargs constructor <init>([Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .locals 1

    const/4 v0, 0x0

    .line 53
    invoke-direct {p0, v0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    return-void
.end method

.method private encodeToUTF8(Ljava/io/OutputStream;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 2
    .line 3
    int-to-double v0, v0

    .line 4
    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    .line 5
    .line 6
    mul-double/2addr v0, v2

    .line 7
    double-to-int v0, v0

    .line 8
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bytesBufLocal:Ljava/lang/ThreadLocal;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, [B

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    const/16 v2, 0x2000

    .line 19
    .line 20
    new-array v2, v2, [B

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    array-length v1, v2

    .line 26
    if-ge v1, v0, :cond_1

    .line 27
    .line 28
    new-array v2, v0, [B

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 31
    .line 32
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-static {v0, v1, p0, v2}, Lcom/alibaba/fastjson/util/IOUtils;->encodeUTF8([CII[B)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-virtual {p1, v2, v1, p0}, Ljava/io/OutputStream;->write([BII)V

    .line 40
    .line 41
    .line 42
    return p0
.end method

.method private encodeToUTF8Bytes()[B
    .locals 4

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 2
    .line 3
    int-to-double v0, v0

    .line 4
    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    .line 5
    .line 6
    mul-double/2addr v0, v2

    .line 7
    double-to-int v0, v0

    .line 8
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bytesBufLocal:Ljava/lang/ThreadLocal;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, [B

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    const/16 v2, 0x2000

    .line 19
    .line 20
    new-array v2, v2, [B

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    array-length v1, v2

    .line 26
    if-ge v1, v0, :cond_1

    .line 27
    .line 28
    new-array v2, v0, [B

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 31
    .line 32
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-static {v0, v1, p0, v2}, Lcom/alibaba/fastjson/util/IOUtils;->encodeUTF8([CII[B)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    new-array v0, p0, [B

    .line 40
    .line 41
    invoke-static {v2, v1, v0, v1, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    .line 43
    .line 44
    return-object v0
.end method

.method private writeEnumFieldValue(CLjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValueStringWithDoubleQuote(CLjava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private writeKeyWithSingleQuoteIfHasSpecial(Ljava/lang/String;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    sget-object v2, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    iget v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 12
    .line 13
    add-int/2addr v4, v3

    .line 14
    const/4 v5, 0x1

    .line 15
    add-int/2addr v4, v5

    .line 16
    iget-object v6, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 17
    .line 18
    array-length v6, v6

    .line 19
    const/16 v7, 0x5c

    .line 20
    .line 21
    const/16 v8, 0x3a

    .line 22
    .line 23
    const/4 v9, 0x0

    .line 24
    const/16 v10, 0x27

    .line 25
    .line 26
    if-le v4, v6, :cond_8

    .line 27
    .line 28
    iget-object v6, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 29
    .line 30
    if-eqz v6, :cond_7

    .line 31
    .line 32
    if-nez v3, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    move v4, v9

    .line 45
    :goto_0
    if-ge v4, v3, :cond_2

    .line 46
    .line 47
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    array-length v11, v2

    .line 52
    if-ge v6, v11, :cond_1

    .line 53
    .line 54
    aget-byte v6, v2, v6

    .line 55
    .line 56
    if-eqz v6, :cond_1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    move v5, v9

    .line 63
    :goto_1
    if-eqz v5, :cond_3

    .line 64
    .line 65
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 66
    .line 67
    .line 68
    :cond_3
    :goto_2
    if-ge v9, v3, :cond_5

    .line 69
    .line 70
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    array-length v6, v2

    .line 75
    if-ge v4, v6, :cond_4

    .line 76
    .line 77
    aget-byte v6, v2, v4

    .line 78
    .line 79
    if-eqz v6, :cond_4

    .line 80
    .line 81
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 82
    .line 83
    .line 84
    sget-object v6, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 85
    .line 86
    aget-char v4, v6, v4

    .line 87
    .line 88
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 89
    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_4
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 93
    .line 94
    .line 95
    :goto_3
    add-int/lit8 v9, v9, 0x1

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_5
    if-eqz v5, :cond_6

    .line 99
    .line 100
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 101
    .line 102
    .line 103
    :cond_6
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_7
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 108
    .line 109
    .line 110
    :cond_8
    iget v6, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 111
    .line 112
    if-nez v3, :cond_a

    .line 113
    .line 114
    add-int/lit8 v1, v6, 0x3

    .line 115
    .line 116
    iget-object v2, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 117
    .line 118
    array-length v2, v2

    .line 119
    if-le v1, v2, :cond_9

    .line 120
    .line 121
    add-int/lit8 v6, v6, 0x3

    .line 122
    .line 123
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 124
    .line 125
    .line 126
    :cond_9
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 127
    .line 128
    iget v2, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 129
    .line 130
    add-int/lit8 v3, v2, 0x1

    .line 131
    .line 132
    iput v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 133
    .line 134
    aput-char v10, v1, v2

    .line 135
    .line 136
    add-int/lit8 v4, v2, 0x2

    .line 137
    .line 138
    iput v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 139
    .line 140
    aput-char v10, v1, v3

    .line 141
    .line 142
    add-int/lit8 v2, v2, 0x3

    .line 143
    .line 144
    iput v2, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 145
    .line 146
    aput-char v8, v1, v4

    .line 147
    .line 148
    return-void

    .line 149
    :cond_a
    add-int v11, v6, v3

    .line 150
    .line 151
    iget-object v12, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 152
    .line 153
    invoke-virtual {v1, v9, v3, v12, v6}, Ljava/lang/String;->getChars(II[CI)V

    .line 154
    .line 155
    .line 156
    iput v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 157
    .line 158
    move v1, v6

    .line 159
    move v3, v9

    .line 160
    :goto_4
    iget-object v12, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 161
    .line 162
    if-ge v1, v11, :cond_f

    .line 163
    .line 164
    aget-char v13, v12, v1

    .line 165
    .line 166
    array-length v14, v2

    .line 167
    if-ge v13, v14, :cond_e

    .line 168
    .line 169
    aget-byte v14, v2, v13

    .line 170
    .line 171
    if-eqz v14, :cond_e

    .line 172
    .line 173
    if-nez v3, :cond_c

    .line 174
    .line 175
    add-int/lit8 v4, v4, 0x3

    .line 176
    .line 177
    array-length v3, v12

    .line 178
    if-le v4, v3, :cond_b

    .line 179
    .line 180
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 181
    .line 182
    .line 183
    :cond_b
    iput v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 184
    .line 185
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 186
    .line 187
    add-int/lit8 v12, v1, 0x1

    .line 188
    .line 189
    add-int/lit8 v14, v1, 0x3

    .line 190
    .line 191
    sub-int v15, v11, v1

    .line 192
    .line 193
    sub-int/2addr v15, v5

    .line 194
    invoke-static {v3, v12, v3, v14, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 195
    .line 196
    .line 197
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 198
    .line 199
    invoke-static {v3, v9, v3, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 200
    .line 201
    .line 202
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 203
    .line 204
    aput-char v10, v3, v6

    .line 205
    .line 206
    aput-char v7, v3, v12

    .line 207
    .line 208
    add-int/lit8 v1, v1, 0x2

    .line 209
    .line 210
    sget-object v12, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 211
    .line 212
    aget-char v12, v12, v13

    .line 213
    .line 214
    aput-char v12, v3, v1

    .line 215
    .line 216
    add-int/lit8 v11, v11, 0x2

    .line 217
    .line 218
    iget v12, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 219
    .line 220
    add-int/lit8 v12, v12, -0x2

    .line 221
    .line 222
    aput-char v10, v3, v12

    .line 223
    .line 224
    move v3, v5

    .line 225
    move/from16 v16, v3

    .line 226
    .line 227
    goto :goto_5

    .line 228
    :cond_c
    add-int/lit8 v4, v4, 0x1

    .line 229
    .line 230
    array-length v12, v12

    .line 231
    if-le v4, v12, :cond_d

    .line 232
    .line 233
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 234
    .line 235
    .line 236
    :cond_d
    iput v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 237
    .line 238
    iget-object v12, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 239
    .line 240
    add-int/lit8 v14, v1, 0x1

    .line 241
    .line 242
    add-int/lit8 v15, v1, 0x2

    .line 243
    .line 244
    move/from16 v16, v5

    .line 245
    .line 246
    sub-int v5, v11, v1

    .line 247
    .line 248
    invoke-static {v12, v14, v12, v15, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 249
    .line 250
    .line 251
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 252
    .line 253
    aput-char v7, v5, v1

    .line 254
    .line 255
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 256
    .line 257
    aget-char v1, v1, v13

    .line 258
    .line 259
    aput-char v1, v5, v14

    .line 260
    .line 261
    add-int/lit8 v11, v11, 0x1

    .line 262
    .line 263
    move v1, v14

    .line 264
    goto :goto_5

    .line 265
    :cond_e
    move/from16 v16, v5

    .line 266
    .line 267
    :goto_5
    add-int/lit8 v1, v1, 0x1

    .line 268
    .line 269
    move/from16 v5, v16

    .line 270
    .line 271
    goto :goto_4

    .line 272
    :cond_f
    move/from16 v16, v5

    .line 273
    .line 274
    add-int/lit8 v4, v4, -0x1

    .line 275
    .line 276
    aput-char v8, v12, v4

    .line 277
    .line 278
    return-void
.end method


# virtual methods
.method public append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .locals 0

    .line 30
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .locals 2

    if-nez p1, :cond_0

    .line 27
    const-string p1, "null"

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;II)V

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;II)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "null"

    .line 4
    .line 5
    :cond_0
    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 p2, 0x0

    .line 14
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public bridge synthetic append(C)Ljava/io/Writer;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/io/Writer;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/io/Writer;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 23
    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;II)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 24
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 25
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 26
    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;II)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object p0

    return-object p0
.end method

.method public close()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->flush()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 13
    .line 14
    array-length v1, v0

    .line 15
    sget v2, Lcom/alibaba/fastjson/serializer/SerializeWriter;->BUFFER_THRESHOLD:I

    .line 16
    .line 17
    if-gt v1, v2, :cond_1

    .line 18
    .line 19
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bufLocal:Ljava/lang/ThreadLocal;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 26
    .line 27
    return-void
.end method

.method public computeFeatures()V
    .locals 8

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 2
    .line 3
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->QuoteFieldNames:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 4
    .line 5
    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 6
    .line 7
    and-int/2addr v1, v0

    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    move v1, v3

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v1, v2

    .line 15
    :goto_0
    iput-boolean v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    .line 16
    .line 17
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseSingleQuotes:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 18
    .line 19
    iget v4, v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 20
    .line 21
    and-int/2addr v4, v0

    .line 22
    if-eqz v4, :cond_1

    .line 23
    .line 24
    move v4, v3

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move v4, v2

    .line 27
    :goto_1
    iput-boolean v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    .line 28
    .line 29
    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->SortField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 30
    .line 31
    iget v5, v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 32
    .line 33
    and-int/2addr v5, v0

    .line 34
    if-eqz v5, :cond_2

    .line 35
    .line 36
    move v5, v3

    .line 37
    goto :goto_2

    .line 38
    :cond_2
    move v5, v2

    .line 39
    :goto_2
    iput-boolean v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->sortField:Z

    .line 40
    .line 41
    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->DisableCircularReferenceDetect:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 42
    .line 43
    iget v5, v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 44
    .line 45
    and-int/2addr v5, v0

    .line 46
    if-eqz v5, :cond_3

    .line 47
    .line 48
    move v5, v3

    .line 49
    goto :goto_3

    .line 50
    :cond_3
    move v5, v2

    .line 51
    :goto_3
    iput-boolean v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->disableCircularReferenceDetect:Z

    .line 52
    .line 53
    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BeanToArray:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 54
    .line 55
    iget v5, v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 56
    .line 57
    and-int/2addr v5, v0

    .line 58
    if-eqz v5, :cond_4

    .line 59
    .line 60
    move v5, v3

    .line 61
    goto :goto_4

    .line 62
    :cond_4
    move v5, v2

    .line 63
    :goto_4
    iput-boolean v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->beanToArray:Z

    .line 64
    .line 65
    sget-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNonStringValueAsString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 66
    .line 67
    iget v6, v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 68
    .line 69
    and-int/2addr v6, v0

    .line 70
    if-eqz v6, :cond_5

    .line 71
    .line 72
    move v6, v3

    .line 73
    goto :goto_5

    .line 74
    :cond_5
    move v6, v2

    .line 75
    :goto_5
    iput-boolean v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNonStringValueAsString:Z

    .line 76
    .line 77
    sget-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->NotWriteDefaultValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 78
    .line 79
    iget v6, v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 80
    .line 81
    and-int/2addr v6, v0

    .line 82
    if-eqz v6, :cond_6

    .line 83
    .line 84
    move v6, v3

    .line 85
    goto :goto_6

    .line 86
    :cond_6
    move v6, v2

    .line 87
    :goto_6
    iput-boolean v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->notWriteDefaultValue:Z

    .line 88
    .line 89
    sget-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 90
    .line 91
    iget v6, v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 92
    .line 93
    and-int/2addr v6, v0

    .line 94
    if-eqz v6, :cond_7

    .line 95
    .line 96
    move v6, v3

    .line 97
    goto :goto_7

    .line 98
    :cond_7
    move v6, v2

    .line 99
    :goto_7
    iput-boolean v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingName:Z

    .line 100
    .line 101
    sget-object v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingToString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 102
    .line 103
    iget v7, v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 104
    .line 105
    and-int/2addr v7, v0

    .line 106
    if-eqz v7, :cond_8

    .line 107
    .line 108
    move v7, v3

    .line 109
    goto :goto_8

    .line 110
    :cond_8
    move v7, v2

    .line 111
    :goto_8
    iput-boolean v7, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingToString:Z

    .line 112
    .line 113
    if-eqz v1, :cond_a

    .line 114
    .line 115
    sget v1, Lcom/alibaba/fastjson/serializer/SerializeWriter;->nonDirectFeatures:I

    .line 116
    .line 117
    and-int/2addr v1, v0

    .line 118
    if-nez v1, :cond_a

    .line 119
    .line 120
    if-nez v5, :cond_9

    .line 121
    .line 122
    if-eqz v6, :cond_a

    .line 123
    .line 124
    :cond_9
    move v1, v3

    .line 125
    goto :goto_9

    .line 126
    :cond_a
    move v1, v2

    .line 127
    :goto_9
    iput-boolean v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeDirect:Z

    .line 128
    .line 129
    if-eqz v4, :cond_b

    .line 130
    .line 131
    const/16 v1, 0x27

    .line 132
    .line 133
    goto :goto_a

    .line 134
    :cond_b
    const/16 v1, 0x22

    .line 135
    .line 136
    :goto_a
    iput-char v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    .line 137
    .line 138
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserSecure:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 139
    .line 140
    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 141
    .line 142
    and-int/2addr v1, v0

    .line 143
    if-eqz v1, :cond_c

    .line 144
    .line 145
    move v2, v3

    .line 146
    :cond_c
    iput-boolean v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->browserSecure:Z

    .line 147
    .line 148
    if-eqz v2, :cond_d

    .line 149
    .line 150
    const-wide v0, 0x50000304ffffffffL    # 2.3175490007226655E77

    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    goto :goto_b

    .line 156
    :cond_d
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 157
    .line 158
    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 159
    .line 160
    and-int/2addr v0, v1

    .line 161
    if-eqz v0, :cond_e

    .line 162
    .line 163
    const-wide v0, 0x8004ffffffffL

    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    goto :goto_b

    .line 169
    :cond_e
    const-wide v0, 0x4ffffffffL

    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    :goto_b
    iput-wide v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->sepcialBits:J

    .line 175
    .line 176
    return-void
.end method

.method public config(Lcom/alibaba/fastjson/serializer/SerializerFeature;Z)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    or-int/2addr p2, v0

    .line 10
    iput p2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 11
    .line 12
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingToString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 13
    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    not-int p1, p1

    .line 23
    and-int/2addr p1, p2

    .line 24
    iput p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 28
    .line 29
    if-ne p1, v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    not-int p1, p1

    .line 36
    and-int/2addr p1, p2

    .line 37
    iput p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {p1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    not-int p1, p1

    .line 45
    and-int/2addr p1, v0

    .line 46
    iput p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 47
    .line 48
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->computeFeatures()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public expandCapacity(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->maxBufSize:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    if-ge p1, v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    .line 10
    .line 11
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->maxBufSize:I

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "serialize exceeded MAX_OUTPUT_LENGTH="

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, ", minimumCapacity="

    .line 24
    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw v0

    .line 39
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 40
    .line 41
    array-length v1, v0

    .line 42
    array-length v2, v0

    .line 43
    shr-int/lit8 v2, v2, 0x1

    .line 44
    .line 45
    add-int/2addr v1, v2

    .line 46
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    if-ge v1, p1, :cond_2

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    move p1, v1

    .line 52
    :goto_1
    new-array p1, p1, [C

    .line 53
    .line 54
    iget v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 61
    .line 62
    array-length v0, v0

    .line 63
    sget v1, Lcom/alibaba/fastjson/serializer/SerializeWriter;->BUFFER_THRESHOLD:I

    .line 64
    .line 65
    if-ge v0, v1, :cond_4

    .line 66
    .line 67
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bufLocal:Ljava/lang/ThreadLocal;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, [C

    .line 74
    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    array-length v1, v1

    .line 78
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 79
    .line 80
    array-length v2, v2

    .line 81
    if-ge v1, v2, :cond_4

    .line 82
    .line 83
    :cond_3
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    :cond_4
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 89
    .line 90
    return-void
.end method

.method public flush()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 7
    .line 8
    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/Writer;->write([CII)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    iput v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0, p0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public getBufferLength()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public getMaxBufSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->maxBufSize:I

    .line 2
    .line 3
    return p0
.end method

.method public isEnabled(I)Z
    .locals 0

    .line 12
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    and-int/2addr p0, p1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 2
    .line 3
    iget p1, p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 4
    .line 5
    and-int/2addr p0, p1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isNotWriteDefaultValue()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->notWriteDefaultValue:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSortField()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->sortField:Z

    .line 2
    .line 3
    return p0
.end method

.method public setMaxBufSize(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    if-lt p1, v0, :cond_0

    .line 5
    .line 6
    iput p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->maxBufSize:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p1, Lcom/alibaba/fastjson/JSONException;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 12
    .line 13
    array-length p0, p0

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "must > "

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-direct {p1, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw p1
.end method

.method public size()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 2
    .line 3
    return p0
.end method

.method public toBytes(Ljava/lang/String;)[B
    .locals 1

    if-eqz p1, :cond_1

    .line 36
    const-string v0, "UTF-8"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 37
    :cond_0
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p1

    goto :goto_1

    .line 38
    :cond_1
    :goto_0
    sget-object p1, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    :goto_1
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->toBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    return-object p0
.end method

.method public toBytes(Ljava/nio/charset/Charset;)[B
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->encodeToUTF8Bytes()[B

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 20
    .line 21
    invoke-direct {v0, v1, v2, p0}, Ljava/lang/String;-><init>([CII)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    const-string p0, "writer not null"

    .line 30
    .line 31
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public toCharArray()[C
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 6
    .line 7
    new-array v1, v0, [C

    .line 8
    .line 9
    iget-object p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {p0, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    const-string p0, "writer not null"

    .line 17
    .line 18
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public toCharArrayForSpringWebSocket()[C
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 6
    .line 7
    add-int/lit8 v1, v0, -0x2

    .line 8
    .line 9
    new-array v1, v1, [C

    .line 10
    .line 11
    iget-object p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    add-int/lit8 v0, v0, -0x2

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    invoke-static {p0, v3, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    .line 19
    .line 20
    return-object v1

    .line 21
    :cond_0
    const-string p0, "writer not null"

    .line 22
    .line 23
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, p0}, Ljava/lang/String;-><init>([CII)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public write(I)V
    .locals 3

    .line 227
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    .line 228
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v2, v2

    if-le v0, v2, :cond_1

    .line 229
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-nez v2, :cond_0

    .line 230
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    goto :goto_0

    .line 231
    :cond_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->flush()V

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v0

    .line 232
    :goto_1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    int-to-char p1, p1

    aput-char p1, v0, v2

    .line 233
    iput v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    return-void
.end method

.method public write(Ljava/lang/String;)V
    .locals 2

    if-nez p1, :cond_0

    .line 225
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 226
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;II)V

    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .locals 4

    .line 214
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/2addr v0, p3

    .line 215
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v1, v1

    if-le v0, v1, :cond_2

    .line 216
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-nez v1, :cond_0

    .line 217
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    goto :goto_1

    .line 218
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v1, v0

    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    sub-int/2addr v1, v2

    add-int v3, p2, v1

    .line 219
    invoke-virtual {p1, p2, v3, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 220
    iget-object p2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length p2, p2

    iput p2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 221
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->flush()V

    sub-int/2addr p3, v1

    .line 222
    iget-object p2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length p2, p2

    if-gt p3, p2, :cond_1

    move v0, p3

    move p2, v3

    goto :goto_1

    :cond_1
    move p2, v3

    goto :goto_0

    :cond_2
    :goto_1
    add-int/2addr p3, p2

    .line 223
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-virtual {p1, p2, p3, v1, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 224
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    return-void
.end method

.method public write(Ljava/util/List;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p1, "[]"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    move v4, v0

    .line 21
    move v3, v2

    .line 22
    :goto_0
    const/16 v5, 0x5d

    .line 23
    .line 24
    if-ge v3, v1, :cond_d

    .line 25
    .line 26
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    check-cast v6, Ljava/lang/String;

    .line 31
    .line 32
    const/16 v7, 0x22

    .line 33
    .line 34
    const/4 v8, 0x1

    .line 35
    if-nez v6, :cond_1

    .line 36
    .line 37
    move v11, v8

    .line 38
    goto :goto_4

    .line 39
    :cond_1
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result v9

    .line 43
    move v10, v2

    .line 44
    move v11, v10

    .line 45
    :goto_1
    if-ge v10, v9, :cond_5

    .line 46
    .line 47
    invoke-virtual {v6, v10}, Ljava/lang/String;->charAt(I)C

    .line 48
    .line 49
    .line 50
    move-result v11

    .line 51
    const/16 v12, 0x20

    .line 52
    .line 53
    if-lt v11, v12, :cond_3

    .line 54
    .line 55
    const/16 v12, 0x7e

    .line 56
    .line 57
    if-gt v11, v12, :cond_3

    .line 58
    .line 59
    if-eq v11, v7, :cond_3

    .line 60
    .line 61
    const/16 v12, 0x5c

    .line 62
    .line 63
    if-ne v11, v12, :cond_2

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_2
    move v11, v2

    .line 67
    goto :goto_3

    .line 68
    :cond_3
    :goto_2
    move v11, v8

    .line 69
    :goto_3
    if-eqz v11, :cond_4

    .line 70
    .line 71
    goto :goto_4

    .line 72
    :cond_4
    add-int/lit8 v10, v10, 0x1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_5
    :goto_4
    const/16 v9, 0x2c

    .line 76
    .line 77
    const/16 v10, 0x5b

    .line 78
    .line 79
    if-eqz v11, :cond_9

    .line 80
    .line 81
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 82
    .line 83
    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 84
    .line 85
    .line 86
    move v0, v2

    .line 87
    :goto_5
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-ge v0, v1, :cond_8

    .line 92
    .line 93
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Ljava/lang/String;

    .line 98
    .line 99
    if-eqz v0, :cond_6

    .line 100
    .line 101
    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 102
    .line 103
    .line 104
    :cond_6
    if-nez v1, :cond_7

    .line 105
    .line 106
    const-string v1, "null"

    .line 107
    .line 108
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    goto :goto_6

    .line 112
    :cond_7
    invoke-virtual {p0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 113
    .line 114
    .line 115
    :goto_6
    add-int/lit8 v0, v0, 0x1

    .line 116
    .line 117
    goto :goto_5

    .line 118
    :cond_8
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_9
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    add-int/2addr v5, v4

    .line 127
    add-int/lit8 v11, v5, 0x3

    .line 128
    .line 129
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 130
    .line 131
    .line 132
    move-result v12

    .line 133
    sub-int/2addr v12, v8

    .line 134
    if-ne v3, v12, :cond_a

    .line 135
    .line 136
    add-int/lit8 v11, v5, 0x4

    .line 137
    .line 138
    :cond_a
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 139
    .line 140
    array-length v5, v5

    .line 141
    if-le v11, v5, :cond_b

    .line 142
    .line 143
    iput v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 144
    .line 145
    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 146
    .line 147
    .line 148
    :cond_b
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 149
    .line 150
    if-nez v3, :cond_c

    .line 151
    .line 152
    add-int/lit8 v8, v4, 0x1

    .line 153
    .line 154
    aput-char v10, v5, v4

    .line 155
    .line 156
    goto :goto_7

    .line 157
    :cond_c
    add-int/lit8 v8, v4, 0x1

    .line 158
    .line 159
    aput-char v9, v5, v4

    .line 160
    .line 161
    :goto_7
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 162
    .line 163
    add-int/lit8 v5, v8, 0x1

    .line 164
    .line 165
    aput-char v7, v4, v8

    .line 166
    .line 167
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 168
    .line 169
    .line 170
    move-result v4

    .line 171
    iget-object v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 172
    .line 173
    invoke-virtual {v6, v2, v4, v8, v5}, Ljava/lang/String;->getChars(II[CI)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 177
    .line 178
    .line 179
    move-result v4

    .line 180
    add-int/2addr v5, v4

    .line 181
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 182
    .line 183
    add-int/lit8 v6, v5, 0x1

    .line 184
    .line 185
    aput-char v7, v4, v5

    .line 186
    .line 187
    add-int/lit8 v3, v3, 0x1

    .line 188
    .line 189
    move v4, v6

    .line 190
    goto/16 :goto_0

    .line 191
    .line 192
    :cond_d
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 193
    .line 194
    add-int/lit8 v0, v4, 0x1

    .line 195
    .line 196
    aput-char v5, p1, v4

    .line 197
    .line 198
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 199
    .line 200
    return-void
.end method

.method public write(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 234
    const-string p1, "true"

    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    return-void

    .line 235
    :cond_0
    const-string p1, "false"

    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    return-void
.end method

.method public write([CII)V
    .locals 3

    if-ltz p2, :cond_3

    .line 201
    array-length v0, p1

    if-gt p2, v0, :cond_3

    if-ltz p3, :cond_3

    add-int v0, p2, p3

    array-length v1, p1

    if-gt v0, v1, :cond_3

    if-ltz v0, :cond_3

    if-nez p3, :cond_0

    return-void

    .line 202
    :cond_0
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/2addr v0, p3

    .line 203
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v1, v1

    if-le v0, v1, :cond_2

    .line 204
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-nez v1, :cond_1

    .line 205
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    goto :goto_0

    .line 206
    :cond_1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v1, v0

    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    sub-int/2addr v1, v2

    .line 207
    invoke-static {p1, p2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 208
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v0, v0

    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 209
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->flush()V

    sub-int/2addr p3, v1

    add-int/2addr p2, v1

    .line 210
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v0, v0

    if-gt p3, v0, :cond_1

    move v0, p3

    .line 211
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 212
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    return-void

    .line 213
    :cond_3
    invoke-static {}, Ll/onl;->a()V

    return-void
.end method

.method public writeByteArray([B)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 6
    .line 7
    iget v2, v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 8
    .line 9
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(I)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeHex([B)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    array-length v2, v1

    .line 20
    iget-boolean v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    .line 21
    .line 22
    if-eqz v3, :cond_1

    .line 23
    .line 24
    const/16 v4, 0x27

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/16 v4, 0x22

    .line 28
    .line 29
    :goto_0
    if-nez v2, :cond_3

    .line 30
    .line 31
    if-eqz v3, :cond_2

    .line 32
    .line 33
    const-string v1, "\'\'"

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    const-string v1, "\"\""

    .line 37
    .line 38
    :goto_1
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_3
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->CA:[C

    .line 43
    .line 44
    div-int/lit8 v5, v2, 0x3

    .line 45
    .line 46
    mul-int/lit8 v5, v5, 0x3

    .line 47
    .line 48
    add-int/lit8 v6, v2, -0x1

    .line 49
    .line 50
    div-int/lit8 v7, v6, 0x3

    .line 51
    .line 52
    add-int/lit8 v7, v7, 0x1

    .line 53
    .line 54
    const/4 v8, 0x2

    .line 55
    shl-int/2addr v7, v8

    .line 56
    iget v9, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 57
    .line 58
    add-int/2addr v7, v9

    .line 59
    add-int/lit8 v10, v7, 0x2

    .line 60
    .line 61
    iget-object v11, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 62
    .line 63
    array-length v11, v11

    .line 64
    const/16 v12, 0x3d

    .line 65
    .line 66
    const/4 v13, 0x0

    .line 67
    if-le v10, v11, :cond_9

    .line 68
    .line 69
    iget-object v11, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 70
    .line 71
    if-eqz v11, :cond_8

    .line 72
    .line 73
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 74
    .line 75
    .line 76
    move v7, v13

    .line 77
    :goto_2
    if-ge v7, v5, :cond_4

    .line 78
    .line 79
    add-int/lit8 v9, v7, 0x1

    .line 80
    .line 81
    aget-byte v10, v1, v7

    .line 82
    .line 83
    and-int/lit16 v10, v10, 0xff

    .line 84
    .line 85
    shl-int/lit8 v10, v10, 0x10

    .line 86
    .line 87
    add-int/lit8 v11, v7, 0x2

    .line 88
    .line 89
    aget-byte v9, v1, v9

    .line 90
    .line 91
    and-int/lit16 v9, v9, 0xff

    .line 92
    .line 93
    shl-int/lit8 v9, v9, 0x8

    .line 94
    .line 95
    or-int/2addr v9, v10

    .line 96
    add-int/lit8 v7, v7, 0x3

    .line 97
    .line 98
    aget-byte v10, v1, v11

    .line 99
    .line 100
    and-int/lit16 v10, v10, 0xff

    .line 101
    .line 102
    or-int/2addr v9, v10

    .line 103
    ushr-int/lit8 v10, v9, 0x12

    .line 104
    .line 105
    and-int/lit8 v10, v10, 0x3f

    .line 106
    .line 107
    aget-char v10, v3, v10

    .line 108
    .line 109
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 110
    .line 111
    .line 112
    ushr-int/lit8 v10, v9, 0xc

    .line 113
    .line 114
    and-int/lit8 v10, v10, 0x3f

    .line 115
    .line 116
    aget-char v10, v3, v10

    .line 117
    .line 118
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 119
    .line 120
    .line 121
    ushr-int/lit8 v10, v9, 0x6

    .line 122
    .line 123
    and-int/lit8 v10, v10, 0x3f

    .line 124
    .line 125
    aget-char v10, v3, v10

    .line 126
    .line 127
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 128
    .line 129
    .line 130
    and-int/lit8 v9, v9, 0x3f

    .line 131
    .line 132
    aget-char v9, v3, v9

    .line 133
    .line 134
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 135
    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_4
    sub-int/2addr v2, v5

    .line 139
    if-lez v2, :cond_7

    .line 140
    .line 141
    aget-byte v5, v1, v5

    .line 142
    .line 143
    and-int/lit16 v5, v5, 0xff

    .line 144
    .line 145
    shl-int/lit8 v5, v5, 0xa

    .line 146
    .line 147
    if-ne v2, v8, :cond_5

    .line 148
    .line 149
    aget-byte v1, v1, v6

    .line 150
    .line 151
    and-int/lit16 v1, v1, 0xff

    .line 152
    .line 153
    shl-int/lit8 v13, v1, 0x2

    .line 154
    .line 155
    :cond_5
    or-int v1, v5, v13

    .line 156
    .line 157
    shr-int/lit8 v5, v1, 0xc

    .line 158
    .line 159
    aget-char v5, v3, v5

    .line 160
    .line 161
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 162
    .line 163
    .line 164
    ushr-int/lit8 v5, v1, 0x6

    .line 165
    .line 166
    and-int/lit8 v5, v5, 0x3f

    .line 167
    .line 168
    aget-char v5, v3, v5

    .line 169
    .line 170
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 171
    .line 172
    .line 173
    if-ne v2, v8, :cond_6

    .line 174
    .line 175
    and-int/lit8 v1, v1, 0x3f

    .line 176
    .line 177
    aget-char v1, v3, v1

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_6
    move v1, v12

    .line 181
    :goto_3
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 185
    .line 186
    .line 187
    :cond_7
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_8
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 192
    .line 193
    .line 194
    :cond_9
    iput v10, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 195
    .line 196
    iget-object v10, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 197
    .line 198
    add-int/lit8 v11, v9, 0x1

    .line 199
    .line 200
    aput-char v4, v10, v9

    .line 201
    .line 202
    move v9, v13

    .line 203
    :goto_4
    if-ge v9, v5, :cond_a

    .line 204
    .line 205
    add-int/lit8 v10, v9, 0x1

    .line 206
    .line 207
    aget-byte v14, v1, v9

    .line 208
    .line 209
    and-int/lit16 v14, v14, 0xff

    .line 210
    .line 211
    shl-int/lit8 v14, v14, 0x10

    .line 212
    .line 213
    add-int/lit8 v15, v9, 0x2

    .line 214
    .line 215
    aget-byte v10, v1, v10

    .line 216
    .line 217
    and-int/lit16 v10, v10, 0xff

    .line 218
    .line 219
    shl-int/lit8 v10, v10, 0x8

    .line 220
    .line 221
    or-int/2addr v10, v14

    .line 222
    add-int/lit8 v9, v9, 0x3

    .line 223
    .line 224
    aget-byte v14, v1, v15

    .line 225
    .line 226
    and-int/lit16 v14, v14, 0xff

    .line 227
    .line 228
    or-int/2addr v10, v14

    .line 229
    iget-object v14, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 230
    .line 231
    add-int/lit8 v15, v11, 0x1

    .line 232
    .line 233
    ushr-int/lit8 v16, v10, 0x12

    .line 234
    .line 235
    and-int/lit8 v16, v16, 0x3f

    .line 236
    .line 237
    aget-char v16, v3, v16

    .line 238
    .line 239
    aput-char v16, v14, v11

    .line 240
    .line 241
    add-int/lit8 v16, v11, 0x2

    .line 242
    .line 243
    ushr-int/lit8 v17, v10, 0xc

    .line 244
    .line 245
    and-int/lit8 v17, v17, 0x3f

    .line 246
    .line 247
    aget-char v17, v3, v17

    .line 248
    .line 249
    aput-char v17, v14, v15

    .line 250
    .line 251
    add-int/lit8 v15, v11, 0x3

    .line 252
    .line 253
    ushr-int/lit8 v17, v10, 0x6

    .line 254
    .line 255
    and-int/lit8 v17, v17, 0x3f

    .line 256
    .line 257
    aget-char v17, v3, v17

    .line 258
    .line 259
    aput-char v17, v14, v16

    .line 260
    .line 261
    add-int/lit8 v11, v11, 0x4

    .line 262
    .line 263
    and-int/lit8 v10, v10, 0x3f

    .line 264
    .line 265
    aget-char v10, v3, v10

    .line 266
    .line 267
    aput-char v10, v14, v15

    .line 268
    .line 269
    goto :goto_4

    .line 270
    :cond_a
    sub-int/2addr v2, v5

    .line 271
    if-lez v2, :cond_d

    .line 272
    .line 273
    aget-byte v5, v1, v5

    .line 274
    .line 275
    and-int/lit16 v5, v5, 0xff

    .line 276
    .line 277
    shl-int/lit8 v5, v5, 0xa

    .line 278
    .line 279
    if-ne v2, v8, :cond_b

    .line 280
    .line 281
    aget-byte v1, v1, v6

    .line 282
    .line 283
    and-int/lit16 v1, v1, 0xff

    .line 284
    .line 285
    shl-int/lit8 v13, v1, 0x2

    .line 286
    .line 287
    :cond_b
    or-int v1, v5, v13

    .line 288
    .line 289
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 290
    .line 291
    add-int/lit8 v6, v7, -0x3

    .line 292
    .line 293
    shr-int/lit8 v9, v1, 0xc

    .line 294
    .line 295
    aget-char v9, v3, v9

    .line 296
    .line 297
    aput-char v9, v5, v6

    .line 298
    .line 299
    add-int/lit8 v6, v7, -0x2

    .line 300
    .line 301
    ushr-int/lit8 v9, v1, 0x6

    .line 302
    .line 303
    and-int/lit8 v9, v9, 0x3f

    .line 304
    .line 305
    aget-char v9, v3, v9

    .line 306
    .line 307
    aput-char v9, v5, v6

    .line 308
    .line 309
    add-int/lit8 v6, v7, -0x1

    .line 310
    .line 311
    if-ne v2, v8, :cond_c

    .line 312
    .line 313
    and-int/lit8 v1, v1, 0x3f

    .line 314
    .line 315
    aget-char v1, v3, v1

    .line 316
    .line 317
    goto :goto_5

    .line 318
    :cond_c
    move v1, v12

    .line 319
    :goto_5
    aput-char v1, v5, v6

    .line 320
    .line 321
    aput-char v12, v5, v7

    .line 322
    .line 323
    :cond_d
    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 324
    .line 325
    add-int/lit8 v7, v7, 0x1

    .line 326
    .line 327
    aput-char v4, v0, v7

    .line 328
    .line 329
    return-void
.end method

.method public writeDouble(DZ)V
    .locals 3

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_4

    .line 6
    .line 7
    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 15
    .line 16
    add-int/lit8 v0, v0, 0x18

    .line 17
    .line 18
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 19
    .line 20
    array-length v1, v1

    .line 21
    const/16 v2, 0x44

    .line 22
    .line 23
    if-le v0, v1, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 26
    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-static {p1, p2}, Lcom/alibaba/fastjson/util/RyuDouble;->toString(D)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const/4 p2, 0x0

    .line 38
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p0, p1, p2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;II)V

    .line 43
    .line 44
    .line 45
    if-eqz p3, :cond_3

    .line 46
    .line 47
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 60
    .line 61
    iget v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 62
    .line 63
    invoke-static {p1, p2, v0, v1}, Lcom/alibaba/fastjson/util/RyuDouble;->toString(D[CI)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iget p2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 68
    .line 69
    add-int/2addr p2, p1

    .line 70
    iput p2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 71
    .line 72
    if-eqz p3, :cond_3

    .line 73
    .line 74
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_3

    .line 81
    .line 82
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 83
    .line 84
    .line 85
    :cond_3
    return-void

    .line 86
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public writeEnum(Ljava/lang/Enum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum<",
            "*>;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingName:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingToString:Z

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingToString:Z

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    goto :goto_0

    .line 29
    :cond_2
    const/4 v0, 0x0

    .line 30
    :goto_0
    if-eqz v0, :cond_4

    .line 31
    .line 32
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseSingleQuotes:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_3

    .line 39
    .line 40
    const/16 p1, 0x27

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_3
    const/16 p1, 0x22

    .line 44
    .line 45
    :goto_1
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public writeFieldName(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 95
    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;Z)V

    return-void
.end method

.method public writeFieldName(Ljava/lang/String;Z)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "null:"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-boolean p2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    .line 12
    .line 13
    const/16 v1, 0x3a

    .line 14
    .line 15
    if-eqz p2, :cond_2

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithSingleQuote(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-direct {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeKeyWithSingleQuoteIfHasSpecial(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    if-eqz v0, :cond_3

    .line 31
    .line 32
    invoke-virtual {p0, p1, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    const/4 v0, 0x0

    .line 41
    const/4 v2, 0x1

    .line 42
    if-nez p2, :cond_4

    .line 43
    .line 44
    move p2, v2

    .line 45
    goto :goto_0

    .line 46
    :cond_4
    move p2, v0

    .line 47
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-ge v0, v3, :cond_7

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const/16 v4, 0x40

    .line 58
    .line 59
    if-ge v3, v4, :cond_5

    .line 60
    .line 61
    iget-wide v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->sepcialBits:J

    .line 62
    .line 63
    const-wide/16 v6, 0x1

    .line 64
    .line 65
    shl-long/2addr v6, v3

    .line 66
    and-long/2addr v4, v6

    .line 67
    const-wide/16 v6, 0x0

    .line 68
    .line 69
    cmp-long v4, v4, v6

    .line 70
    .line 71
    if-nez v4, :cond_8

    .line 72
    .line 73
    :cond_5
    const/16 v4, 0x5c

    .line 74
    .line 75
    if-ne v3, v4, :cond_6

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_6
    add-int/lit8 v0, v0, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_7
    move v2, p2

    .line 82
    :cond_8
    :goto_1
    if-eqz v2, :cond_9

    .line 83
    .line 84
    invoke-virtual {p0, p1, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_9
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public writeFieldNameDirect(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 6
    .line 7
    add-int/2addr v1, v0

    .line 8
    add-int/lit8 v2, v1, 0x3

    .line 9
    .line 10
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 11
    .line 12
    array-length v3, v3

    .line 13
    if-le v2, v3, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 19
    .line 20
    add-int/lit8 v4, v3, 0x1

    .line 21
    .line 22
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 23
    .line 24
    const/16 v6, 0x22

    .line 25
    .line 26
    aput-char v6, v5, v3

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {p1, v3, v0, v5, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 30
    .line 31
    .line 32
    iput v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 33
    .line 34
    iget-object p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 35
    .line 36
    add-int/lit8 p1, v1, 0x1

    .line 37
    .line 38
    aput-char v6, p0, p1

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x2

    .line 41
    .line 42
    const/16 p1, 0x3a

    .line 43
    .line 44
    aput-char p1, p0, v1

    .line 45
    .line 46
    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;C)V
    .locals 0

    .line 166
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 167
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    if-nez p3, :cond_0

    .line 168
    const-string p1, "\u0000"

    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    return-void

    .line 169
    :cond_0
    invoke-static {p3}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;D)V
    .locals 0

    .line 173
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 174
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 175
    invoke-virtual {p0, p3, p4, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeDouble(DZ)V

    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;F)V
    .locals 0

    .line 170
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 171
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 172
    invoke-virtual {p0, p3, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFloat(FZ)V

    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;I)V
    .locals 5

    const/high16 v0, -0x80000000

    if-eq p3, v0, :cond_4

    .line 145
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    if-gez p3, :cond_1

    neg-int v0, p3

    .line 146
    invoke-static {v0}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    invoke-static {p3}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(I)I

    move-result v0

    .line 147
    :goto_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    .line 148
    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/2addr v2, v1

    add-int/lit8 v2, v2, 0x4

    add-int/2addr v2, v0

    .line 149
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v0, v0

    if-le v2, v0, :cond_3

    .line 150
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v0, :cond_2

    .line 151
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 152
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 153
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    return-void

    .line 154
    :cond_2
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 155
    :cond_3
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 156
    iput v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 157
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char p1, v2, v0

    add-int p1, v0, v1

    add-int/lit8 v3, v0, 0x1

    .line 158
    iget-char v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    aput-char v4, v2, v3

    const/4 v3, 0x0

    add-int/lit8 v0, v0, 0x2

    .line 159
    invoke-virtual {p2, v3, v1, v2, v0}, Ljava/lang/String;->getChars(II[CI)V

    .line 160
    iget-object p2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v0, p1, 0x2

    iget-char v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    aput-char v1, p2, v0

    add-int/lit8 p1, p1, 0x3

    const/16 v0, 0x3a

    .line 161
    aput-char v0, p2, p1

    .line 162
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-static {p3, p0, p2}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    return-void

    .line 163
    :cond_4
    :goto_1
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 164
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 165
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;J)V
    .locals 5

    .line 1
    const-wide/high16 v0, -0x8000000000000000L

    .line 2
    .line 3
    cmp-long v0, p3, v0

    .line 4
    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    .line 8
    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 12
    .line 13
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    cmp-long v0, p3, v0

    .line 25
    .line 26
    if-gez v0, :cond_1

    .line 27
    .line 28
    neg-long v0, p3

    .line 29
    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(J)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-static {p3, p4}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(J)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    :goto_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 45
    .line 46
    add-int/2addr v2, v1

    .line 47
    add-int/lit8 v2, v2, 0x4

    .line 48
    .line 49
    add-int/2addr v2, v0

    .line 50
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 51
    .line 52
    array-length v0, v0

    .line 53
    if-le v2, v0, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p3, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 70
    .line 71
    .line 72
    :cond_3
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 73
    .line 74
    iput v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 75
    .line 76
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 77
    .line 78
    aput-char p1, v2, v0

    .line 79
    .line 80
    add-int p1, v0, v1

    .line 81
    .line 82
    add-int/lit8 v3, v0, 0x1

    .line 83
    .line 84
    iget-char v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    .line 85
    .line 86
    aput-char v4, v2, v3

    .line 87
    .line 88
    const/4 v3, 0x0

    .line 89
    add-int/lit8 v0, v0, 0x2

    .line 90
    .line 91
    invoke-virtual {p2, v3, v1, v2, v0}, Ljava/lang/String;->getChars(II[CI)V

    .line 92
    .line 93
    .line 94
    iget-object p2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 95
    .line 96
    add-int/lit8 v0, p1, 0x2

    .line 97
    .line 98
    iget-char v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    .line 99
    .line 100
    aput-char v1, p2, v0

    .line 101
    .line 102
    add-int/lit8 p1, p1, 0x3

    .line 103
    .line 104
    const/16 v0, 0x3a

    .line 105
    .line 106
    aput-char v0, p2, p1

    .line 107
    .line 108
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 109
    .line 110
    invoke-static {p3, p4, p0, p2}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(JI[C)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_4
    :goto_1
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, p3, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;Ljava/lang/Enum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C",
            "Ljava/lang/String;",
            "Ljava/lang/Enum<",
            "*>;)V"
        }
    .end annotation

    if-nez p3, :cond_0

    .line 191
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 192
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 193
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    return-void

    .line 194
    :cond_0
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingName:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingToString:Z

    if-nez v0, :cond_1

    .line 195
    invoke-virtual {p3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumFieldValue(CLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 196
    :cond_1
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingToString:Z

    if-eqz v0, :cond_2

    .line 197
    invoke-virtual {p3}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumFieldValue(CLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 198
    :cond_2
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 176
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    if-eqz v0, :cond_3

    .line 177
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-eqz v0, :cond_1

    .line 178
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 179
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    if-nez p3, :cond_0

    .line 180
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    return-void

    .line 181
    :cond_0
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    return-void

    .line 182
    :cond_1
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 183
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    const/16 p1, 0x3a

    .line 184
    invoke-virtual {p0, p2, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    const/4 p1, 0x0

    .line 185
    invoke-virtual {p0, p3, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    return-void

    .line 186
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValueStringWithDoubleQuoteCheck(CLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 187
    :cond_3
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 188
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    if-nez p3, :cond_4

    .line 189
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    return-void

    .line 190
    :cond_4
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;Ljava/math/BigDecimal;)V
    .locals 0

    .line 199
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 200
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    if-nez p3, :cond_0

    .line 201
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    return-void

    .line 202
    :cond_0
    invoke-virtual {p3}, Ljava/math/BigDecimal;->scale()I

    move-result p1

    .line 203
    sget-object p2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteBigDecimalAsPlain:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result p2

    if-eqz p2, :cond_1

    const/16 p2, -0x64

    if-lt p1, p2, :cond_1

    const/16 p2, 0x64

    if-ge p1, p2, :cond_1

    .line 204
    invoke-virtual {p3}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 205
    :cond_1
    invoke-virtual {p3}, Ljava/math/BigDecimal;->toString()Ljava/lang/String;

    move-result-object p1

    .line 206
    :goto_0
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;Z)V
    .locals 6

    .line 124
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    if-nez v0, :cond_0

    .line 125
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 126
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 127
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Z)V

    return-void

    :cond_0
    const/4 v0, 0x5

    const/4 v1, 0x4

    if-eqz p3, :cond_1

    move v2, v1

    goto :goto_0

    :cond_1
    move v2, v0

    .line 128
    :goto_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    .line 129
    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/2addr v4, v3

    add-int/2addr v4, v1

    add-int/2addr v4, v2

    .line 130
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v1, v1

    if-le v4, v1, :cond_3

    .line 131
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v1, :cond_2

    .line 132
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 133
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    const/16 p1, 0x3a

    .line 134
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 135
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Z)V

    return-void

    .line 136
    :cond_2
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 137
    :cond_3
    iget v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 138
    iput v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 139
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char p1, v2, v1

    add-int p1, v1, v3

    add-int/lit8 v4, v1, 0x1

    .line 140
    iget-char v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    aput-char v5, v2, v4

    add-int/lit8 v1, v1, 0x2

    const/4 v4, 0x0

    .line 141
    invoke-virtual {p2, v4, v3, v2, v1}, Ljava/lang/String;->getChars(II[CI)V

    .line 142
    iget-object p2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v1, p1, 0x2

    iget-char v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    aput-char v2, p2, v1

    if-eqz p3, :cond_4

    .line 143
    const-string p2, ":true"

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object p2

    iget-object p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 p1, p1, 0x3

    invoke-static {p2, v4, p0, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void

    .line 144
    :cond_4
    const-string p2, ":false"

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object p2

    iget-object p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 p1, p1, 0x3

    const/4 p3, 0x6

    invoke-static {p2, v4, p0, p1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public writeFieldValueStringWithDoubleQuote(CLjava/lang/String;Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    add-int v3, v0, v2

    .line 12
    .line 13
    add-int/lit8 v3, v3, 0x6

    .line 14
    .line 15
    add-int/2addr v1, v3

    .line 16
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 17
    .line 18
    array-length v3, v3

    .line 19
    const/16 v4, 0x3a

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    if-le v1, v3, :cond_1

    .line 23
    .line 24
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 25
    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p2, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p3, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 42
    .line 43
    iget v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 44
    .line 45
    aput-char p1, v3, v6

    .line 46
    .line 47
    add-int/lit8 p1, v6, 0x2

    .line 48
    .line 49
    add-int v7, p1, v0

    .line 50
    .line 51
    add-int/lit8 v6, v6, 0x1

    .line 52
    .line 53
    const/16 v8, 0x22

    .line 54
    .line 55
    aput-char v8, v3, v6

    .line 56
    .line 57
    invoke-virtual {p2, v5, v0, v3, p1}, Ljava/lang/String;->getChars(II[CI)V

    .line 58
    .line 59
    .line 60
    iput v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 61
    .line 62
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 63
    .line 64
    aput-char v8, p1, v7

    .line 65
    .line 66
    add-int/lit8 p2, v7, 0x1

    .line 67
    .line 68
    add-int/lit8 v0, v7, 0x2

    .line 69
    .line 70
    aput-char v4, p1, p2

    .line 71
    .line 72
    add-int/lit8 v7, v7, 0x3

    .line 73
    .line 74
    aput-char v8, p1, v0

    .line 75
    .line 76
    invoke-virtual {p3, v5, v2, p1, v7}, Ljava/lang/String;->getChars(II[CI)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 80
    .line 81
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 82
    .line 83
    add-int/lit8 p0, p0, -0x1

    .line 84
    .line 85
    aput-char v8, p1, p0

    .line 86
    .line 87
    return-void
.end method

.method public writeFieldValueStringWithDoubleQuoteCheck(CLjava/lang/String;Ljava/lang/String;)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    iget v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    add-int/lit8 v6, v3, 0x8

    .line 16
    .line 17
    add-int/2addr v4, v6

    .line 18
    const/4 v6, 0x4

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    add-int v7, v3, v6

    .line 25
    .line 26
    add-int/lit8 v7, v7, 0x6

    .line 27
    .line 28
    add-int/2addr v4, v7

    .line 29
    :goto_0
    iget-object v7, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 30
    .line 31
    array-length v7, v7

    .line 32
    const/16 v8, 0x3a

    .line 33
    .line 34
    const/4 v9, 0x0

    .line 35
    if-le v4, v7, :cond_2

    .line 36
    .line 37
    iget-object v7, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 38
    .line 39
    if-eqz v7, :cond_1

    .line 40
    .line 41
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-object v7, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 55
    .line 56
    iget v10, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 57
    .line 58
    aput-char p1, v7, v10

    .line 59
    .line 60
    add-int/lit8 v11, v10, 0x2

    .line 61
    .line 62
    add-int v12, v11, v3

    .line 63
    .line 64
    const/4 v13, 0x1

    .line 65
    add-int/2addr v10, v13

    .line 66
    const/16 v14, 0x22

    .line 67
    .line 68
    aput-char v14, v7, v10

    .line 69
    .line 70
    invoke-virtual {v1, v9, v3, v7, v11}, Ljava/lang/String;->getChars(II[CI)V

    .line 71
    .line 72
    .line 73
    iput v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 74
    .line 75
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 76
    .line 77
    aput-char v14, v1, v12

    .line 78
    .line 79
    add-int/lit8 v3, v12, 0x1

    .line 80
    .line 81
    add-int/lit8 v7, v12, 0x2

    .line 82
    .line 83
    aput-char v8, v1, v3

    .line 84
    .line 85
    const/16 v3, 0x75

    .line 86
    .line 87
    if-nez v2, :cond_3

    .line 88
    .line 89
    add-int/lit8 v0, v12, 0x3

    .line 90
    .line 91
    const/16 v2, 0x6e

    .line 92
    .line 93
    aput-char v2, v1, v7

    .line 94
    .line 95
    add-int/lit8 v2, v12, 0x4

    .line 96
    .line 97
    aput-char v3, v1, v0

    .line 98
    .line 99
    add-int/lit8 v12, v12, 0x5

    .line 100
    .line 101
    const/16 v0, 0x6c

    .line 102
    .line 103
    aput-char v0, v1, v2

    .line 104
    .line 105
    aput-char v0, v1, v12

    .line 106
    .line 107
    return-void

    .line 108
    :cond_3
    add-int/lit8 v12, v12, 0x3

    .line 109
    .line 110
    aput-char v14, v1, v7

    .line 111
    .line 112
    add-int v7, v12, v6

    .line 113
    .line 114
    invoke-virtual {v2, v9, v6, v1, v12}, Ljava/lang/String;->getChars(II[CI)V

    .line 115
    .line 116
    .line 117
    const/4 v1, -0x1

    .line 118
    move v10, v1

    .line 119
    move v11, v10

    .line 120
    move v6, v9

    .line 121
    move v8, v12

    .line 122
    :goto_1
    move/from16 p1, v3

    .line 123
    .line 124
    move/from16 v16, v14

    .line 125
    .line 126
    const/16 v5, 0x2029

    .line 127
    .line 128
    const/16 v15, 0x2028

    .line 129
    .line 130
    const/16 v3, 0x5c

    .line 131
    .line 132
    if-ge v8, v7, :cond_e

    .line 133
    .line 134
    iget-object v14, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 135
    .line 136
    aget-char v14, v14, v8

    .line 137
    .line 138
    const/16 v13, 0x5d

    .line 139
    .line 140
    if-lt v14, v13, :cond_8

    .line 141
    .line 142
    const/16 v3, 0x7f

    .line 143
    .line 144
    if-lt v14, v3, :cond_4

    .line 145
    .line 146
    if-eq v14, v15, :cond_5

    .line 147
    .line 148
    if-eq v14, v5, :cond_5

    .line 149
    .line 150
    const/16 v3, 0xa0

    .line 151
    .line 152
    if-ge v14, v3, :cond_4

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_4
    move v13, v1

    .line 156
    goto :goto_7

    .line 157
    :cond_5
    :goto_2
    if-ne v10, v1, :cond_6

    .line 158
    .line 159
    move v10, v8

    .line 160
    :cond_6
    add-int/lit8 v9, v9, 0x1

    .line 161
    .line 162
    add-int/lit8 v4, v4, 0x4

    .line 163
    .line 164
    move v13, v1

    .line 165
    :cond_7
    move v11, v8

    .line 166
    :goto_3
    move v6, v14

    .line 167
    goto :goto_7

    .line 168
    :cond_8
    const/16 v5, 0x40

    .line 169
    .line 170
    if-ge v14, v5, :cond_9

    .line 171
    .line 172
    iget-wide v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->sepcialBits:J

    .line 173
    .line 174
    const-wide/16 v20, 0x1

    .line 175
    .line 176
    shl-long v20, v20, v14

    .line 177
    .line 178
    and-long v1, v1, v20

    .line 179
    .line 180
    const-wide/16 v20, 0x0

    .line 181
    .line 182
    cmp-long v1, v1, v20

    .line 183
    .line 184
    if-nez v1, :cond_a

    .line 185
    .line 186
    :cond_9
    if-ne v14, v3, :cond_d

    .line 187
    .line 188
    :cond_a
    add-int/lit8 v9, v9, 0x1

    .line 189
    .line 190
    const/16 v1, 0x28

    .line 191
    .line 192
    if-eq v14, v1, :cond_c

    .line 193
    .line 194
    const/16 v1, 0x29

    .line 195
    .line 196
    if-eq v14, v1, :cond_c

    .line 197
    .line 198
    const/16 v1, 0x3c

    .line 199
    .line 200
    if-eq v14, v1, :cond_c

    .line 201
    .line 202
    const/16 v1, 0x3e

    .line 203
    .line 204
    if-eq v14, v1, :cond_c

    .line 205
    .line 206
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 207
    .line 208
    array-length v2, v1

    .line 209
    if-ge v14, v2, :cond_b

    .line 210
    .line 211
    aget-byte v1, v1, v14

    .line 212
    .line 213
    const/4 v2, 0x4

    .line 214
    if-ne v1, v2, :cond_b

    .line 215
    .line 216
    goto :goto_5

    .line 217
    :cond_b
    :goto_4
    const/4 v13, -0x1

    .line 218
    goto :goto_6

    .line 219
    :cond_c
    :goto_5
    add-int/lit8 v4, v4, 0x4

    .line 220
    .line 221
    goto :goto_4

    .line 222
    :goto_6
    if-ne v10, v13, :cond_7

    .line 223
    .line 224
    move v10, v8

    .line 225
    move v11, v10

    .line 226
    goto :goto_3

    .line 227
    :cond_d
    const/4 v13, -0x1

    .line 228
    :goto_7
    add-int/lit8 v8, v8, 0x1

    .line 229
    .line 230
    move/from16 v3, p1

    .line 231
    .line 232
    move-object/from16 v2, p3

    .line 233
    .line 234
    move v1, v13

    .line 235
    move/from16 v14, v16

    .line 236
    .line 237
    const/4 v13, 0x1

    .line 238
    goto :goto_1

    .line 239
    :cond_e
    if-lez v9, :cond_20

    .line 240
    .line 241
    add-int/2addr v4, v9

    .line 242
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 243
    .line 244
    array-length v1, v1

    .line 245
    if-le v4, v1, :cond_f

    .line 246
    .line 247
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 248
    .line 249
    .line 250
    :cond_f
    iput v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 251
    .line 252
    const/4 v1, 0x1

    .line 253
    if-ne v9, v1, :cond_15

    .line 254
    .line 255
    const/16 v2, 0x30

    .line 256
    .line 257
    const/16 v4, 0x32

    .line 258
    .line 259
    if-ne v6, v15, :cond_10

    .line 260
    .line 261
    add-int/lit8 v5, v11, 0x1

    .line 262
    .line 263
    add-int/lit8 v6, v11, 0x6

    .line 264
    .line 265
    sub-int/2addr v7, v11

    .line 266
    sub-int/2addr v7, v1

    .line 267
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 268
    .line 269
    invoke-static {v1, v5, v1, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 270
    .line 271
    .line 272
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 273
    .line 274
    aput-char v3, v1, v11

    .line 275
    .line 276
    aput-char p1, v1, v5

    .line 277
    .line 278
    add-int/lit8 v3, v11, 0x2

    .line 279
    .line 280
    aput-char v4, v1, v3

    .line 281
    .line 282
    add-int/lit8 v3, v11, 0x3

    .line 283
    .line 284
    aput-char v2, v1, v3

    .line 285
    .line 286
    add-int/lit8 v2, v11, 0x4

    .line 287
    .line 288
    aput-char v4, v1, v2

    .line 289
    .line 290
    add-int/lit8 v11, v11, 0x5

    .line 291
    .line 292
    const/16 v2, 0x38

    .line 293
    .line 294
    aput-char v2, v1, v11

    .line 295
    .line 296
    goto/16 :goto_d

    .line 297
    .line 298
    :cond_10
    if-ne v6, v5, :cond_11

    .line 299
    .line 300
    add-int/lit8 v1, v11, 0x1

    .line 301
    .line 302
    add-int/lit8 v5, v11, 0x6

    .line 303
    .line 304
    sub-int/2addr v7, v11

    .line 305
    const/16 v17, 0x1

    .line 306
    .line 307
    add-int/lit8 v7, v7, -0x1

    .line 308
    .line 309
    iget-object v6, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 310
    .line 311
    invoke-static {v6, v1, v6, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 312
    .line 313
    .line 314
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 315
    .line 316
    aput-char v3, v5, v11

    .line 317
    .line 318
    aput-char p1, v5, v1

    .line 319
    .line 320
    add-int/lit8 v1, v11, 0x2

    .line 321
    .line 322
    aput-char v4, v5, v1

    .line 323
    .line 324
    add-int/lit8 v1, v11, 0x3

    .line 325
    .line 326
    aput-char v2, v5, v1

    .line 327
    .line 328
    add-int/lit8 v1, v11, 0x4

    .line 329
    .line 330
    aput-char v4, v5, v1

    .line 331
    .line 332
    add-int/lit8 v11, v11, 0x5

    .line 333
    .line 334
    const/16 v1, 0x39

    .line 335
    .line 336
    aput-char v1, v5, v11

    .line 337
    .line 338
    goto/16 :goto_d

    .line 339
    .line 340
    :cond_11
    const/16 v1, 0x28

    .line 341
    .line 342
    if-eq v6, v1, :cond_14

    .line 343
    .line 344
    const/16 v1, 0x29

    .line 345
    .line 346
    if-eq v6, v1, :cond_14

    .line 347
    .line 348
    const/16 v1, 0x3c

    .line 349
    .line 350
    if-eq v6, v1, :cond_14

    .line 351
    .line 352
    const/16 v1, 0x3e

    .line 353
    .line 354
    if-ne v6, v1, :cond_12

    .line 355
    .line 356
    goto :goto_8

    .line 357
    :cond_12
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 358
    .line 359
    array-length v2, v1

    .line 360
    if-ge v6, v2, :cond_13

    .line 361
    .line 362
    aget-byte v1, v1, v6

    .line 363
    .line 364
    const/4 v2, 0x4

    .line 365
    if-ne v1, v2, :cond_13

    .line 366
    .line 367
    add-int/lit8 v1, v11, 0x1

    .line 368
    .line 369
    add-int/lit8 v2, v11, 0x6

    .line 370
    .line 371
    sub-int/2addr v7, v11

    .line 372
    const/16 v17, 0x1

    .line 373
    .line 374
    add-int/lit8 v7, v7, -0x1

    .line 375
    .line 376
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 377
    .line 378
    invoke-static {v4, v1, v4, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 379
    .line 380
    .line 381
    iget-object v2, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 382
    .line 383
    aput-char v3, v2, v11

    .line 384
    .line 385
    add-int/lit8 v3, v11, 0x2

    .line 386
    .line 387
    aput-char p1, v2, v1

    .line 388
    .line 389
    add-int/lit8 v1, v11, 0x3

    .line 390
    .line 391
    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 392
    .line 393
    ushr-int/lit8 v5, v6, 0xc

    .line 394
    .line 395
    and-int/lit8 v5, v5, 0xf

    .line 396
    .line 397
    aget-char v5, v4, v5

    .line 398
    .line 399
    aput-char v5, v2, v3

    .line 400
    .line 401
    add-int/lit8 v3, v11, 0x4

    .line 402
    .line 403
    ushr-int/lit8 v5, v6, 0x8

    .line 404
    .line 405
    and-int/lit8 v5, v5, 0xf

    .line 406
    .line 407
    aget-char v5, v4, v5

    .line 408
    .line 409
    aput-char v5, v2, v1

    .line 410
    .line 411
    add-int/lit8 v11, v11, 0x5

    .line 412
    .line 413
    ushr-int/lit8 v1, v6, 0x4

    .line 414
    .line 415
    and-int/lit8 v1, v1, 0xf

    .line 416
    .line 417
    aget-char v1, v4, v1

    .line 418
    .line 419
    aput-char v1, v2, v3

    .line 420
    .line 421
    and-int/lit8 v1, v6, 0xf

    .line 422
    .line 423
    aget-char v1, v4, v1

    .line 424
    .line 425
    aput-char v1, v2, v11

    .line 426
    .line 427
    goto/16 :goto_d

    .line 428
    .line 429
    :cond_13
    add-int/lit8 v1, v11, 0x1

    .line 430
    .line 431
    add-int/lit8 v2, v11, 0x2

    .line 432
    .line 433
    sub-int/2addr v7, v11

    .line 434
    const/16 v17, 0x1

    .line 435
    .line 436
    add-int/lit8 v7, v7, -0x1

    .line 437
    .line 438
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 439
    .line 440
    invoke-static {v4, v1, v4, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 441
    .line 442
    .line 443
    iget-object v2, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 444
    .line 445
    aput-char v3, v2, v11

    .line 446
    .line 447
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 448
    .line 449
    aget-char v3, v3, v6

    .line 450
    .line 451
    aput-char v3, v2, v1

    .line 452
    .line 453
    goto/16 :goto_d

    .line 454
    .line 455
    :cond_14
    :goto_8
    add-int/lit8 v1, v11, 0x1

    .line 456
    .line 457
    add-int/lit8 v2, v11, 0x6

    .line 458
    .line 459
    sub-int/2addr v7, v11

    .line 460
    const/16 v17, 0x1

    .line 461
    .line 462
    add-int/lit8 v7, v7, -0x1

    .line 463
    .line 464
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 465
    .line 466
    invoke-static {v4, v1, v4, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 467
    .line 468
    .line 469
    iget-object v2, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 470
    .line 471
    aput-char v3, v2, v11

    .line 472
    .line 473
    add-int/lit8 v3, v11, 0x2

    .line 474
    .line 475
    aput-char p1, v2, v1

    .line 476
    .line 477
    add-int/lit8 v1, v11, 0x3

    .line 478
    .line 479
    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 480
    .line 481
    ushr-int/lit8 v5, v6, 0xc

    .line 482
    .line 483
    and-int/lit8 v5, v5, 0xf

    .line 484
    .line 485
    aget-char v5, v4, v5

    .line 486
    .line 487
    aput-char v5, v2, v3

    .line 488
    .line 489
    add-int/lit8 v3, v11, 0x4

    .line 490
    .line 491
    ushr-int/lit8 v5, v6, 0x8

    .line 492
    .line 493
    and-int/lit8 v5, v5, 0xf

    .line 494
    .line 495
    aget-char v5, v4, v5

    .line 496
    .line 497
    aput-char v5, v2, v1

    .line 498
    .line 499
    add-int/lit8 v11, v11, 0x5

    .line 500
    .line 501
    ushr-int/lit8 v1, v6, 0x4

    .line 502
    .line 503
    and-int/lit8 v1, v1, 0xf

    .line 504
    .line 505
    aget-char v1, v4, v1

    .line 506
    .line 507
    aput-char v1, v2, v3

    .line 508
    .line 509
    and-int/lit8 v1, v6, 0xf

    .line 510
    .line 511
    aget-char v1, v4, v1

    .line 512
    .line 513
    aput-char v1, v2, v11

    .line 514
    .line 515
    goto/16 :goto_d

    .line 516
    .line 517
    :cond_15
    if-le v9, v1, :cond_20

    .line 518
    .line 519
    sub-int v1, v10, v12

    .line 520
    .line 521
    :goto_9
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    .line 522
    .line 523
    .line 524
    move-result v2

    .line 525
    if-ge v1, v2, :cond_20

    .line 526
    .line 527
    move-object/from16 v2, p3

    .line 528
    .line 529
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 530
    .line 531
    .line 532
    move-result v4

    .line 533
    iget-boolean v6, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->browserSecure:Z

    .line 534
    .line 535
    if-eqz v6, :cond_18

    .line 536
    .line 537
    const/16 v6, 0x28

    .line 538
    .line 539
    const/16 v7, 0x29

    .line 540
    .line 541
    const/16 v8, 0x3c

    .line 542
    .line 543
    if-eq v4, v6, :cond_16

    .line 544
    .line 545
    if-eq v4, v7, :cond_16

    .line 546
    .line 547
    const/16 v9, 0x3e

    .line 548
    .line 549
    if-eq v4, v8, :cond_17

    .line 550
    .line 551
    if-ne v4, v9, :cond_19

    .line 552
    .line 553
    goto :goto_a

    .line 554
    :cond_16
    const/16 v9, 0x3e

    .line 555
    .line 556
    :cond_17
    :goto_a
    iget-object v11, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 557
    .line 558
    add-int/lit8 v12, v10, 0x1

    .line 559
    .line 560
    aput-char v3, v11, v10

    .line 561
    .line 562
    add-int/lit8 v13, v10, 0x2

    .line 563
    .line 564
    aput-char p1, v11, v12

    .line 565
    .line 566
    add-int/lit8 v12, v10, 0x3

    .line 567
    .line 568
    sget-object v14, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 569
    .line 570
    ushr-int/lit8 v19, v4, 0xc

    .line 571
    .line 572
    and-int/lit8 v19, v19, 0xf

    .line 573
    .line 574
    aget-char v19, v14, v19

    .line 575
    .line 576
    aput-char v19, v11, v13

    .line 577
    .line 578
    add-int/lit8 v13, v10, 0x4

    .line 579
    .line 580
    ushr-int/lit8 v19, v4, 0x8

    .line 581
    .line 582
    and-int/lit8 v19, v19, 0xf

    .line 583
    .line 584
    aget-char v19, v14, v19

    .line 585
    .line 586
    aput-char v19, v11, v12

    .line 587
    .line 588
    add-int/lit8 v12, v10, 0x5

    .line 589
    .line 590
    ushr-int/lit8 v19, v4, 0x4

    .line 591
    .line 592
    and-int/lit8 v19, v19, 0xf

    .line 593
    .line 594
    aget-char v19, v14, v19

    .line 595
    .line 596
    aput-char v19, v11, v13

    .line 597
    .line 598
    add-int/lit8 v10, v10, 0x6

    .line 599
    .line 600
    and-int/lit8 v4, v4, 0xf

    .line 601
    .line 602
    aget-char v4, v14, v4

    .line 603
    .line 604
    aput-char v4, v11, v12

    .line 605
    .line 606
    const/4 v14, 0x4

    .line 607
    goto/16 :goto_c

    .line 608
    .line 609
    :cond_18
    const/16 v6, 0x28

    .line 610
    .line 611
    const/16 v7, 0x29

    .line 612
    .line 613
    const/16 v8, 0x3c

    .line 614
    .line 615
    const/16 v9, 0x3e

    .line 616
    .line 617
    :cond_19
    sget-object v11, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 618
    .line 619
    array-length v12, v11

    .line 620
    if-ge v4, v12, :cond_1a

    .line 621
    .line 622
    aget-byte v12, v11, v4

    .line 623
    .line 624
    if-nez v12, :cond_1b

    .line 625
    .line 626
    :cond_1a
    const/16 v12, 0x2f

    .line 627
    .line 628
    if-ne v4, v12, :cond_1d

    .line 629
    .line 630
    sget-object v12, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 631
    .line 632
    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 633
    .line 634
    .line 635
    move-result v12

    .line 636
    if-eqz v12, :cond_1d

    .line 637
    .line 638
    :cond_1b
    iget-object v12, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 639
    .line 640
    add-int/lit8 v13, v10, 0x1

    .line 641
    .line 642
    aput-char v3, v12, v10

    .line 643
    .line 644
    aget-byte v11, v11, v4

    .line 645
    .line 646
    const/4 v14, 0x4

    .line 647
    if-ne v11, v14, :cond_1c

    .line 648
    .line 649
    add-int/lit8 v11, v10, 0x2

    .line 650
    .line 651
    aput-char p1, v12, v13

    .line 652
    .line 653
    add-int/lit8 v13, v10, 0x3

    .line 654
    .line 655
    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 656
    .line 657
    ushr-int/lit8 v19, v4, 0xc

    .line 658
    .line 659
    and-int/lit8 v19, v19, 0xf

    .line 660
    .line 661
    aget-char v19, v18, v19

    .line 662
    .line 663
    aput-char v19, v12, v11

    .line 664
    .line 665
    add-int/lit8 v11, v10, 0x4

    .line 666
    .line 667
    ushr-int/lit8 v19, v4, 0x8

    .line 668
    .line 669
    and-int/lit8 v19, v19, 0xf

    .line 670
    .line 671
    aget-char v19, v18, v19

    .line 672
    .line 673
    aput-char v19, v12, v13

    .line 674
    .line 675
    add-int/lit8 v13, v10, 0x5

    .line 676
    .line 677
    ushr-int/lit8 v19, v4, 0x4

    .line 678
    .line 679
    and-int/lit8 v19, v19, 0xf

    .line 680
    .line 681
    aget-char v19, v18, v19

    .line 682
    .line 683
    aput-char v19, v12, v11

    .line 684
    .line 685
    add-int/lit8 v10, v10, 0x6

    .line 686
    .line 687
    and-int/lit8 v4, v4, 0xf

    .line 688
    .line 689
    aget-char v4, v18, v4

    .line 690
    .line 691
    aput-char v4, v12, v13

    .line 692
    .line 693
    goto :goto_c

    .line 694
    :cond_1c
    add-int/lit8 v10, v10, 0x2

    .line 695
    .line 696
    sget-object v11, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 697
    .line 698
    aget-char v4, v11, v4

    .line 699
    .line 700
    aput-char v4, v12, v13

    .line 701
    .line 702
    goto :goto_c

    .line 703
    :cond_1d
    const/4 v14, 0x4

    .line 704
    if-eq v4, v15, :cond_1f

    .line 705
    .line 706
    if-ne v4, v5, :cond_1e

    .line 707
    .line 708
    goto :goto_b

    .line 709
    :cond_1e
    iget-object v11, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 710
    .line 711
    add-int/lit8 v12, v10, 0x1

    .line 712
    .line 713
    aput-char v4, v11, v10

    .line 714
    .line 715
    move v10, v12

    .line 716
    goto :goto_c

    .line 717
    :cond_1f
    :goto_b
    iget-object v11, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 718
    .line 719
    add-int/lit8 v12, v10, 0x1

    .line 720
    .line 721
    aput-char v3, v11, v10

    .line 722
    .line 723
    add-int/lit8 v13, v10, 0x2

    .line 724
    .line 725
    aput-char p1, v11, v12

    .line 726
    .line 727
    add-int/lit8 v12, v10, 0x3

    .line 728
    .line 729
    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 730
    .line 731
    ushr-int/lit8 v19, v4, 0xc

    .line 732
    .line 733
    and-int/lit8 v19, v19, 0xf

    .line 734
    .line 735
    aget-char v19, v18, v19

    .line 736
    .line 737
    aput-char v19, v11, v13

    .line 738
    .line 739
    add-int/lit8 v13, v10, 0x4

    .line 740
    .line 741
    ushr-int/lit8 v19, v4, 0x8

    .line 742
    .line 743
    and-int/lit8 v19, v19, 0xf

    .line 744
    .line 745
    aget-char v19, v18, v19

    .line 746
    .line 747
    aput-char v19, v11, v12

    .line 748
    .line 749
    add-int/lit8 v12, v10, 0x5

    .line 750
    .line 751
    ushr-int/lit8 v19, v4, 0x4

    .line 752
    .line 753
    and-int/lit8 v19, v19, 0xf

    .line 754
    .line 755
    aget-char v19, v18, v19

    .line 756
    .line 757
    aput-char v19, v11, v13

    .line 758
    .line 759
    add-int/lit8 v10, v10, 0x6

    .line 760
    .line 761
    and-int/lit8 v4, v4, 0xf

    .line 762
    .line 763
    aget-char v4, v18, v4

    .line 764
    .line 765
    aput-char v4, v11, v12

    .line 766
    .line 767
    :goto_c
    add-int/lit8 v1, v1, 0x1

    .line 768
    .line 769
    goto/16 :goto_9

    .line 770
    .line 771
    :cond_20
    :goto_d
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 772
    .line 773
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 774
    .line 775
    const/16 v17, 0x1

    .line 776
    .line 777
    add-int/lit8 v0, v0, -0x1

    .line 778
    .line 779
    aput-char v16, v1, v0

    .line 780
    .line 781
    return-void
.end method

.method public writeFloat(FZ)V
    .locals 3

    .line 1
    cmpl-float v0, p1, p1

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    .line 6
    .line 7
    cmpl-float v0, p1, v0

    .line 8
    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    const/high16 v0, -0x800000    # Float.NEGATIVE_INFINITY

    .line 12
    .line 13
    cmpl-float v0, p1, v0

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 19
    .line 20
    add-int/lit8 v0, v0, 0xf

    .line 21
    .line 22
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 23
    .line 24
    array-length v1, v1

    .line 25
    const/16 v2, 0x46

    .line 26
    .line 27
    if-le v0, v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 30
    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-static {p1}, Lcom/alibaba/fastjson/util/RyuFloat;->toString(F)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p0, p1, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    if-eqz p2, :cond_3

    .line 50
    .line 51
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 64
    .line 65
    iget v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 66
    .line 67
    invoke-static {p1, v0, v1}, Lcom/alibaba/fastjson/util/RyuFloat;->toString(F[CI)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 72
    .line 73
    add-int/2addr v0, p1

    .line 74
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 75
    .line 76
    if-eqz p2, :cond_3

    .line 77
    .line 78
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 87
    .line 88
    .line 89
    :cond_3
    return-void

    .line 90
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public writeHex([B)V
    .locals 11

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 2
    .line 3
    array-length v1, p1

    .line 4
    const/4 v2, 0x2

    .line 5
    mul-int/2addr v1, v2

    .line 6
    add-int/2addr v0, v1

    .line 7
    add-int/lit8 v0, v0, 0x3

    .line 8
    .line 9
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 10
    .line 11
    array-length v1, v1

    .line 12
    const/16 v3, 0x78

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    const/16 v5, 0x37

    .line 16
    .line 17
    const/16 v6, 0x30

    .line 18
    .line 19
    const/16 v7, 0xa

    .line 20
    .line 21
    const/16 v8, 0x27

    .line 22
    .line 23
    if-le v0, v1, :cond_4

    .line 24
    .line 25
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 26
    .line 27
    if-eqz v1, :cond_3

    .line 28
    .line 29
    array-length v0, p1

    .line 30
    mul-int/2addr v0, v2

    .line 31
    add-int/lit8 v0, v0, 0x3

    .line 32
    .line 33
    new-array v0, v0, [C

    .line 34
    .line 35
    aput-char v3, v0, v4

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    aput-char v8, v0, v1

    .line 39
    .line 40
    :goto_0
    array-length v1, p1

    .line 41
    if-ge v4, v1, :cond_2

    .line 42
    .line 43
    aget-byte v1, p1, v4

    .line 44
    .line 45
    and-int/lit16 v3, v1, 0xff

    .line 46
    .line 47
    shr-int/lit8 v3, v3, 0x4

    .line 48
    .line 49
    and-int/lit8 v1, v1, 0xf

    .line 50
    .line 51
    add-int/lit8 v9, v2, 0x1

    .line 52
    .line 53
    if-ge v3, v7, :cond_0

    .line 54
    .line 55
    move v10, v6

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    move v10, v5

    .line 58
    :goto_1
    add-int/2addr v3, v10

    .line 59
    int-to-char v3, v3

    .line 60
    aput-char v3, v0, v2

    .line 61
    .line 62
    add-int/lit8 v2, v2, 0x2

    .line 63
    .line 64
    if-ge v1, v7, :cond_1

    .line 65
    .line 66
    move v3, v6

    .line 67
    goto :goto_2

    .line 68
    :cond_1
    move v3, v5

    .line 69
    :goto_2
    add-int/2addr v1, v3

    .line 70
    int-to-char v1, v1

    .line 71
    aput-char v1, v0, v9

    .line 72
    .line 73
    add-int/lit8 v4, v4, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    aput-char v8, v0, v2

    .line 77
    .line 78
    :try_start_0
    iget-object p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ljava/io/Writer;->write([C)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :catch_0
    move-exception p0

    .line 85
    const-string p1, "writeBytes error."

    .line 86
    .line 87
    invoke-static {p1, p0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 92
    .line 93
    .line 94
    :cond_4
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 95
    .line 96
    iget v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 97
    .line 98
    add-int/lit8 v9, v1, 0x1

    .line 99
    .line 100
    iput v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 101
    .line 102
    aput-char v3, v0, v1

    .line 103
    .line 104
    add-int/2addr v1, v2

    .line 105
    iput v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 106
    .line 107
    aput-char v8, v0, v9

    .line 108
    .line 109
    :goto_3
    array-length v0, p1

    .line 110
    if-ge v4, v0, :cond_7

    .line 111
    .line 112
    aget-byte v0, p1, v4

    .line 113
    .line 114
    and-int/lit16 v1, v0, 0xff

    .line 115
    .line 116
    shr-int/lit8 v1, v1, 0x4

    .line 117
    .line 118
    and-int/lit8 v0, v0, 0xf

    .line 119
    .line 120
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 121
    .line 122
    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 123
    .line 124
    add-int/lit8 v9, v3, 0x1

    .line 125
    .line 126
    iput v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 127
    .line 128
    if-ge v1, v7, :cond_5

    .line 129
    .line 130
    move v10, v6

    .line 131
    goto :goto_4

    .line 132
    :cond_5
    move v10, v5

    .line 133
    :goto_4
    add-int/2addr v1, v10

    .line 134
    int-to-char v1, v1

    .line 135
    aput-char v1, v2, v3

    .line 136
    .line 137
    add-int/lit8 v3, v3, 0x2

    .line 138
    .line 139
    iput v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 140
    .line 141
    if-ge v0, v7, :cond_6

    .line 142
    .line 143
    move v1, v6

    .line 144
    goto :goto_5

    .line 145
    :cond_6
    move v1, v5

    .line 146
    :goto_5
    add-int/2addr v0, v1

    .line 147
    int-to-char v0, v0

    .line 148
    aput-char v0, v2, v9

    .line 149
    .line 150
    add-int/lit8 v4, v4, 0x1

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_7
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 154
    .line 155
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 156
    .line 157
    add-int/lit8 v1, v0, 0x1

    .line 158
    .line 159
    iput v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 160
    .line 161
    aput-char v8, p1, v0

    .line 162
    .line 163
    return-void
.end method

.method public writeInt(I)V
    .locals 3

    .line 1
    const/high16 v0, -0x80000000

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const-string p1, "-2147483648"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    if-gez p1, :cond_1

    .line 12
    .line 13
    neg-int v0, p1

    .line 14
    invoke-static {v0}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-static {p1}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    :goto_0
    iget v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 26
    .line 27
    add-int/2addr v1, v0

    .line 28
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 29
    .line 30
    array-length v2, v2

    .line 31
    if-le v1, v2, :cond_3

    .line 32
    .line 33
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 34
    .line 35
    if-nez v2, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    new-array v1, v0, [C

    .line 42
    .line 43
    invoke-static {p1, v0, v1}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 44
    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    invoke-virtual {p0, v1, p1, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write([CII)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 52
    .line 53
    invoke-static {p1, v1, v0}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 54
    .line 55
    .line 56
    iput v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 57
    .line 58
    return-void
.end method

.method public writeLong(J)V
    .locals 6

    .line 1
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    const-wide v3, 0x1fffffffffffffL

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    cmp-long v0, p1, v3

    .line 25
    .line 26
    if-gtz v0, :cond_0

    .line 27
    .line 28
    const-wide v3, -0x1fffffffffffffL

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    cmp-long v0, p1, v3

    .line 34
    .line 35
    if-gez v0, :cond_1

    .line 36
    .line 37
    :cond_0
    move v0, v2

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v0, v1

    .line 40
    :goto_0
    const-wide/high16 v3, -0x8000000000000000L

    .line 41
    .line 42
    cmp-long v3, p1, v3

    .line 43
    .line 44
    if-nez v3, :cond_3

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    const-string p1, "\"-9223372036854775808\""

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    const-string p1, "-9223372036854775808"

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    const-wide/16 v3, 0x0

    .line 61
    .line 62
    cmp-long v3, p1, v3

    .line 63
    .line 64
    if-gez v3, :cond_4

    .line 65
    .line 66
    neg-long v3, p1

    .line 67
    invoke-static {v3, v4}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(J)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    add-int/2addr v3, v2

    .line 72
    goto :goto_1

    .line 73
    :cond_4
    invoke-static {p1, p2}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(J)I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    :goto_1
    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 78
    .line 79
    add-int/2addr v2, v3

    .line 80
    if-eqz v0, :cond_5

    .line 81
    .line 82
    add-int/lit8 v2, v2, 0x2

    .line 83
    .line 84
    :cond_5
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 85
    .line 86
    array-length v4, v4

    .line 87
    const/16 v5, 0x22

    .line 88
    .line 89
    if-le v2, v4, :cond_8

    .line 90
    .line 91
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 92
    .line 93
    if-nez v4, :cond_6

    .line 94
    .line 95
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_6
    new-array v2, v3, [C

    .line 100
    .line 101
    invoke-static {p1, p2, v3, v2}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(JI[C)V

    .line 102
    .line 103
    .line 104
    if-eqz v0, :cond_7

    .line 105
    .line 106
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, v2, v1, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write([CII)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_7
    invoke-virtual {p0, v2, v1, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write([CII)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_8
    :goto_2
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 121
    .line 122
    if-eqz v0, :cond_9

    .line 123
    .line 124
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 125
    .line 126
    aput-char v5, v1, v0

    .line 127
    .line 128
    add-int/lit8 v0, v2, -0x1

    .line 129
    .line 130
    invoke-static {p1, p2, v0, v1}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(JI[C)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 134
    .line 135
    aput-char v5, p1, v0

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_9
    invoke-static {p1, p2, v2, v1}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(JI[C)V

    .line 139
    .line 140
    .line 141
    :goto_3
    iput v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 142
    .line 143
    return-void
.end method

.method public writeLongAndChar(JC)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public writeNull()V
    .locals 1

    .line 66
    const-string v0, "null"

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    return-void
.end method

.method public writeNull(II)V
    .locals 0

    .line 1
    and-int/2addr p1, p2

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 5
    .line 6
    and-int/2addr p1, p2

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullListAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 14
    .line 15
    iget p1, p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 16
    .line 17
    if-ne p2, p1, :cond_1

    .line 18
    .line 19
    const-string p1, "[]"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullStringAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 26
    .line 27
    iget p1, p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 28
    .line 29
    if-ne p2, p1, :cond_2

    .line 30
    .line 31
    const-string p1, ""

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullBooleanAsFalse:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 38
    .line 39
    iget p1, p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 40
    .line 41
    if-ne p2, p1, :cond_3

    .line 42
    .line 43
    const-string p1, "false"

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    sget-object p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullNumberAsZero:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 50
    .line 51
    iget p1, p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 52
    .line 53
    if-ne p2, p1, :cond_4

    .line 54
    .line 55
    const/16 p1, 0x30

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_4
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public writeNull(Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .locals 1

    const/4 v0, 0x0

    .line 65
    iget p1, p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-virtual {p0, v0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(II)V

    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 1

    .line 19
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-eqz v0, :cond_0

    .line 20
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithSingleQuote(Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    return-void
.end method

.method public writeString(Ljava/lang/String;C)V
    .locals 1

    .line 22
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-eqz v0, :cond_0

    .line 23
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithSingleQuote(Ljava/lang/String;)V

    .line 24
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    return-void

    .line 25
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    return-void
.end method

.method public writeString([C)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithSingleQuote([C)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([C)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, v0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public writeStringWithDoubleQuote(Ljava/lang/String;C)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 10
    .line 11
    .line 12
    if-eqz v2, :cond_d

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    iget v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 23
    .line 24
    add-int/2addr v4, v3

    .line 25
    add-int/lit8 v5, v4, 0x2

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    add-int/lit8 v5, v4, 0x3

    .line 30
    .line 31
    :cond_1
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 32
    .line 33
    array-length v4, v4

    .line 34
    const/16 v11, 0x3e

    .line 35
    .line 36
    const/16 v12, 0x3c

    .line 37
    .line 38
    const/16 v13, 0x29

    .line 39
    .line 40
    const/16 v14, 0x28

    .line 41
    .line 42
    const/16 v10, 0x22

    .line 43
    .line 44
    const/16 v6, 0x8

    .line 45
    .line 46
    const/16 v15, 0xc

    .line 47
    .line 48
    const/16 v7, 0x75

    .line 49
    .line 50
    const/16 v8, 0x5c

    .line 51
    .line 52
    if-le v5, v4, :cond_f

    .line 53
    .line 54
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 55
    .line 56
    if-eqz v4, :cond_e

    .line 57
    .line 58
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 59
    .line 60
    .line 61
    const/4 v3, 0x0

    .line 62
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-ge v3, v4, :cond_c

    .line 67
    .line 68
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserSecure:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 73
    .line 74
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    if-eqz v5, :cond_2

    .line 79
    .line 80
    if-eq v4, v14, :cond_3

    .line 81
    .line 82
    if-eq v4, v13, :cond_3

    .line 83
    .line 84
    if-eq v4, v12, :cond_3

    .line 85
    .line 86
    if-ne v4, v11, :cond_2

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_2
    const/16 v20, 0x1

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_3
    :goto_1
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 96
    .line 97
    .line 98
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 99
    .line 100
    ushr-int/lit8 v16, v4, 0xc

    .line 101
    .line 102
    and-int/lit8 v16, v16, 0xf

    .line 103
    .line 104
    const/16 v20, 0x1

    .line 105
    .line 106
    aget-char v9, v5, v16

    .line 107
    .line 108
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 109
    .line 110
    .line 111
    ushr-int/lit8 v9, v4, 0x8

    .line 112
    .line 113
    and-int/lit8 v9, v9, 0xf

    .line 114
    .line 115
    aget-char v9, v5, v9

    .line 116
    .line 117
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 118
    .line 119
    .line 120
    ushr-int/lit8 v9, v4, 0x4

    .line 121
    .line 122
    and-int/lit8 v9, v9, 0xf

    .line 123
    .line 124
    aget-char v9, v5, v9

    .line 125
    .line 126
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 127
    .line 128
    .line 129
    and-int/lit8 v4, v4, 0xf

    .line 130
    .line 131
    aget-char v4, v5, v4

    .line 132
    .line 133
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 134
    .line 135
    .line 136
    goto/16 :goto_4

    .line 137
    .line 138
    :goto_2
    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 139
    .line 140
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    if-eqz v5, :cond_7

    .line 145
    .line 146
    if-eq v4, v6, :cond_6

    .line 147
    .line 148
    if-eq v4, v15, :cond_6

    .line 149
    .line 150
    const/16 v5, 0xa

    .line 151
    .line 152
    if-eq v4, v5, :cond_6

    .line 153
    .line 154
    const/16 v5, 0xd

    .line 155
    .line 156
    if-eq v4, v5, :cond_6

    .line 157
    .line 158
    const/16 v5, 0x9

    .line 159
    .line 160
    if-eq v4, v5, :cond_6

    .line 161
    .line 162
    if-eq v4, v10, :cond_6

    .line 163
    .line 164
    const/16 v5, 0x2f

    .line 165
    .line 166
    if-eq v4, v5, :cond_6

    .line 167
    .line 168
    if-ne v4, v8, :cond_4

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_4
    const/16 v5, 0x20

    .line 172
    .line 173
    if-ge v4, v5, :cond_5

    .line 174
    .line 175
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 179
    .line 180
    .line 181
    const/16 v5, 0x30

    .line 182
    .line 183
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 187
    .line 188
    .line 189
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->ASCII_CHARS:[C

    .line 190
    .line 191
    mul-int/lit8 v4, v4, 0x2

    .line 192
    .line 193
    aget-char v9, v5, v4

    .line 194
    .line 195
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 196
    .line 197
    .line 198
    add-int/lit8 v4, v4, 0x1

    .line 199
    .line 200
    aget-char v4, v5, v4

    .line 201
    .line 202
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 203
    .line 204
    .line 205
    goto/16 :goto_4

    .line 206
    .line 207
    :cond_5
    const/16 v5, 0x7f

    .line 208
    .line 209
    if-lt v4, v5, :cond_b

    .line 210
    .line 211
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 215
    .line 216
    .line 217
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 218
    .line 219
    ushr-int/lit8 v9, v4, 0xc

    .line 220
    .line 221
    and-int/lit8 v9, v9, 0xf

    .line 222
    .line 223
    aget-char v9, v5, v9

    .line 224
    .line 225
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 226
    .line 227
    .line 228
    ushr-int/lit8 v9, v4, 0x8

    .line 229
    .line 230
    and-int/lit8 v9, v9, 0xf

    .line 231
    .line 232
    aget-char v9, v5, v9

    .line 233
    .line 234
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 235
    .line 236
    .line 237
    ushr-int/lit8 v9, v4, 0x4

    .line 238
    .line 239
    and-int/lit8 v9, v9, 0xf

    .line 240
    .line 241
    aget-char v9, v5, v9

    .line 242
    .line 243
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 244
    .line 245
    .line 246
    and-int/lit8 v4, v4, 0xf

    .line 247
    .line 248
    aget-char v4, v5, v4

    .line 249
    .line 250
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 251
    .line 252
    .line 253
    goto :goto_4

    .line 254
    :cond_6
    :goto_3
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 255
    .line 256
    .line 257
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 258
    .line 259
    aget-char v4, v5, v4

    .line 260
    .line 261
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 262
    .line 263
    .line 264
    goto :goto_4

    .line 265
    :cond_7
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 266
    .line 267
    array-length v9, v5

    .line 268
    if-ge v4, v9, :cond_8

    .line 269
    .line 270
    aget-byte v9, v5, v4

    .line 271
    .line 272
    if-nez v9, :cond_9

    .line 273
    .line 274
    :cond_8
    const/16 v9, 0x2f

    .line 275
    .line 276
    if-ne v4, v9, :cond_b

    .line 277
    .line 278
    sget-object v9, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 279
    .line 280
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 281
    .line 282
    .line 283
    move-result v9

    .line 284
    if-eqz v9, :cond_b

    .line 285
    .line 286
    :cond_9
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 287
    .line 288
    .line 289
    aget-byte v5, v5, v4

    .line 290
    .line 291
    const/4 v9, 0x4

    .line 292
    if-ne v5, v9, :cond_a

    .line 293
    .line 294
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 295
    .line 296
    .line 297
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 298
    .line 299
    ushr-int/lit8 v9, v4, 0xc

    .line 300
    .line 301
    and-int/lit8 v9, v9, 0xf

    .line 302
    .line 303
    aget-char v9, v5, v9

    .line 304
    .line 305
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 306
    .line 307
    .line 308
    ushr-int/lit8 v9, v4, 0x8

    .line 309
    .line 310
    and-int/lit8 v9, v9, 0xf

    .line 311
    .line 312
    aget-char v9, v5, v9

    .line 313
    .line 314
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 315
    .line 316
    .line 317
    ushr-int/lit8 v9, v4, 0x4

    .line 318
    .line 319
    and-int/lit8 v9, v9, 0xf

    .line 320
    .line 321
    aget-char v9, v5, v9

    .line 322
    .line 323
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 324
    .line 325
    .line 326
    and-int/lit8 v4, v4, 0xf

    .line 327
    .line 328
    aget-char v4, v5, v4

    .line 329
    .line 330
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 331
    .line 332
    .line 333
    goto :goto_4

    .line 334
    :cond_a
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 335
    .line 336
    aget-char v4, v5, v4

    .line 337
    .line 338
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 339
    .line 340
    .line 341
    goto :goto_4

    .line 342
    :cond_b
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 343
    .line 344
    .line 345
    :goto_4
    add-int/lit8 v3, v3, 0x1

    .line 346
    .line 347
    goto/16 :goto_0

    .line 348
    .line 349
    :cond_c
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 350
    .line 351
    .line 352
    if-eqz v2, :cond_d

    .line 353
    .line 354
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 355
    .line 356
    .line 357
    :cond_d
    return-void

    .line 358
    :cond_e
    const/16 v20, 0x1

    .line 359
    .line 360
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 361
    .line 362
    .line 363
    goto :goto_5

    .line 364
    :cond_f
    const/16 v20, 0x1

    .line 365
    .line 366
    :goto_5
    iget v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 367
    .line 368
    add-int/lit8 v9, v4, 0x1

    .line 369
    .line 370
    move/from16 v21, v7

    .line 371
    .line 372
    add-int v7, v9, v3

    .line 373
    .line 374
    iget-object v11, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 375
    .line 376
    aput-char v10, v11, v4

    .line 377
    .line 378
    const/4 v4, 0x0

    .line 379
    invoke-virtual {v1, v4, v3, v11, v9}, Ljava/lang/String;->getChars(II[CI)V

    .line 380
    .line 381
    .line 382
    iput v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 383
    .line 384
    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 385
    .line 386
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 387
    .line 388
    .line 389
    move-result v3

    .line 390
    const/4 v11, -0x1

    .line 391
    if-eqz v3, :cond_1f

    .line 392
    .line 393
    move v1, v9

    .line 394
    :goto_6
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 395
    .line 396
    if-ge v1, v7, :cond_15

    .line 397
    .line 398
    aget-char v3, v3, v1

    .line 399
    .line 400
    if-eq v3, v10, :cond_13

    .line 401
    .line 402
    const/16 v4, 0x2f

    .line 403
    .line 404
    if-eq v3, v4, :cond_13

    .line 405
    .line 406
    if-ne v3, v8, :cond_10

    .line 407
    .line 408
    goto :goto_9

    .line 409
    :cond_10
    if-eq v3, v6, :cond_13

    .line 410
    .line 411
    if-eq v3, v15, :cond_13

    .line 412
    .line 413
    const/16 v4, 0xa

    .line 414
    .line 415
    if-eq v3, v4, :cond_13

    .line 416
    .line 417
    const/16 v4, 0xd

    .line 418
    .line 419
    if-eq v3, v4, :cond_13

    .line 420
    .line 421
    const/16 v4, 0x9

    .line 422
    .line 423
    if-ne v3, v4, :cond_11

    .line 424
    .line 425
    goto :goto_9

    .line 426
    :cond_11
    const/16 v4, 0x20

    .line 427
    .line 428
    if-ge v3, v4, :cond_12

    .line 429
    .line 430
    :goto_7
    add-int/lit8 v5, v5, 0x5

    .line 431
    .line 432
    :goto_8
    move v11, v1

    .line 433
    goto :goto_a

    .line 434
    :cond_12
    const/16 v4, 0x7f

    .line 435
    .line 436
    if-lt v3, v4, :cond_14

    .line 437
    .line 438
    goto :goto_7

    .line 439
    :cond_13
    :goto_9
    add-int/lit8 v5, v5, 0x1

    .line 440
    .line 441
    goto :goto_8

    .line 442
    :cond_14
    :goto_a
    add-int/lit8 v1, v1, 0x1

    .line 443
    .line 444
    goto :goto_6

    .line 445
    :cond_15
    array-length v1, v3

    .line 446
    if-le v5, v1, :cond_16

    .line 447
    .line 448
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 449
    .line 450
    .line 451
    :cond_16
    iput v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 452
    .line 453
    :goto_b
    if-lt v11, v9, :cond_1d

    .line 454
    .line 455
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 456
    .line 457
    aget-char v3, v1, v11

    .line 458
    .line 459
    if-eq v3, v6, :cond_1b

    .line 460
    .line 461
    if-eq v3, v15, :cond_1b

    .line 462
    .line 463
    const/16 v4, 0xa

    .line 464
    .line 465
    if-eq v3, v4, :cond_1b

    .line 466
    .line 467
    const/16 v5, 0xd

    .line 468
    .line 469
    if-eq v3, v5, :cond_1b

    .line 470
    .line 471
    const/16 v12, 0x9

    .line 472
    .line 473
    if-ne v3, v12, :cond_17

    .line 474
    .line 475
    :goto_c
    const/16 v13, 0x20

    .line 476
    .line 477
    goto/16 :goto_10

    .line 478
    .line 479
    :cond_17
    if-eq v3, v10, :cond_18

    .line 480
    .line 481
    const/16 v13, 0x2f

    .line 482
    .line 483
    if-eq v3, v13, :cond_18

    .line 484
    .line 485
    if-ne v3, v8, :cond_19

    .line 486
    .line 487
    :cond_18
    const/16 v13, 0x20

    .line 488
    .line 489
    goto :goto_e

    .line 490
    :cond_19
    const/16 v13, 0x20

    .line 491
    .line 492
    if-ge v3, v13, :cond_1a

    .line 493
    .line 494
    add-int/lit8 v14, v11, 0x1

    .line 495
    .line 496
    add-int/lit8 v4, v11, 0x6

    .line 497
    .line 498
    sub-int v16, v7, v11

    .line 499
    .line 500
    add-int/lit8 v5, v16, -0x1

    .line 501
    .line 502
    invoke-static {v1, v14, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 503
    .line 504
    .line 505
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 506
    .line 507
    aput-char v8, v1, v11

    .line 508
    .line 509
    aput-char v21, v1, v14

    .line 510
    .line 511
    add-int/lit8 v4, v11, 0x2

    .line 512
    .line 513
    const/16 v18, 0x30

    .line 514
    .line 515
    aput-char v18, v1, v4

    .line 516
    .line 517
    add-int/lit8 v4, v11, 0x3

    .line 518
    .line 519
    aput-char v18, v1, v4

    .line 520
    .line 521
    add-int/lit8 v4, v11, 0x4

    .line 522
    .line 523
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->ASCII_CHARS:[C

    .line 524
    .line 525
    mul-int/lit8 v3, v3, 0x2

    .line 526
    .line 527
    aget-char v14, v5, v3

    .line 528
    .line 529
    aput-char v14, v1, v4

    .line 530
    .line 531
    add-int/lit8 v4, v11, 0x5

    .line 532
    .line 533
    add-int/lit8 v3, v3, 0x1

    .line 534
    .line 535
    aget-char v3, v5, v3

    .line 536
    .line 537
    aput-char v3, v1, v4

    .line 538
    .line 539
    :goto_d
    add-int/lit8 v7, v7, 0x5

    .line 540
    .line 541
    goto :goto_11

    .line 542
    :cond_1a
    const/16 v4, 0x7f

    .line 543
    .line 544
    if-lt v3, v4, :cond_1c

    .line 545
    .line 546
    add-int/lit8 v4, v11, 0x1

    .line 547
    .line 548
    add-int/lit8 v5, v11, 0x6

    .line 549
    .line 550
    sub-int v14, v7, v11

    .line 551
    .line 552
    add-int/lit8 v14, v14, -0x1

    .line 553
    .line 554
    invoke-static {v1, v4, v1, v5, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 555
    .line 556
    .line 557
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 558
    .line 559
    aput-char v8, v1, v11

    .line 560
    .line 561
    aput-char v21, v1, v4

    .line 562
    .line 563
    add-int/lit8 v4, v11, 0x2

    .line 564
    .line 565
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 566
    .line 567
    ushr-int/lit8 v14, v3, 0xc

    .line 568
    .line 569
    and-int/lit8 v14, v14, 0xf

    .line 570
    .line 571
    aget-char v14, v5, v14

    .line 572
    .line 573
    aput-char v14, v1, v4

    .line 574
    .line 575
    add-int/lit8 v4, v11, 0x3

    .line 576
    .line 577
    ushr-int/lit8 v14, v3, 0x8

    .line 578
    .line 579
    and-int/lit8 v14, v14, 0xf

    .line 580
    .line 581
    aget-char v14, v5, v14

    .line 582
    .line 583
    aput-char v14, v1, v4

    .line 584
    .line 585
    add-int/lit8 v4, v11, 0x4

    .line 586
    .line 587
    ushr-int/lit8 v14, v3, 0x4

    .line 588
    .line 589
    and-int/lit8 v14, v14, 0xf

    .line 590
    .line 591
    aget-char v14, v5, v14

    .line 592
    .line 593
    aput-char v14, v1, v4

    .line 594
    .line 595
    add-int/lit8 v4, v11, 0x5

    .line 596
    .line 597
    and-int/lit8 v3, v3, 0xf

    .line 598
    .line 599
    aget-char v3, v5, v3

    .line 600
    .line 601
    aput-char v3, v1, v4

    .line 602
    .line 603
    goto :goto_d

    .line 604
    :goto_e
    add-int/lit8 v4, v11, 0x1

    .line 605
    .line 606
    add-int/lit8 v5, v11, 0x2

    .line 607
    .line 608
    sub-int v14, v7, v11

    .line 609
    .line 610
    add-int/lit8 v14, v14, -0x1

    .line 611
    .line 612
    invoke-static {v1, v4, v1, v5, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 613
    .line 614
    .line 615
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 616
    .line 617
    aput-char v8, v1, v11

    .line 618
    .line 619
    aput-char v3, v1, v4

    .line 620
    .line 621
    :goto_f
    add-int/lit8 v7, v7, 0x1

    .line 622
    .line 623
    goto :goto_11

    .line 624
    :cond_1b
    const/16 v12, 0x9

    .line 625
    .line 626
    goto/16 :goto_c

    .line 627
    .line 628
    :goto_10
    add-int/lit8 v4, v11, 0x1

    .line 629
    .line 630
    add-int/lit8 v5, v11, 0x2

    .line 631
    .line 632
    sub-int v14, v7, v11

    .line 633
    .line 634
    add-int/lit8 v14, v14, -0x1

    .line 635
    .line 636
    invoke-static {v1, v4, v1, v5, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 637
    .line 638
    .line 639
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 640
    .line 641
    aput-char v8, v1, v11

    .line 642
    .line 643
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 644
    .line 645
    aget-char v3, v5, v3

    .line 646
    .line 647
    aput-char v3, v1, v4

    .line 648
    .line 649
    goto :goto_f

    .line 650
    :cond_1c
    :goto_11
    add-int/lit8 v11, v11, -0x1

    .line 651
    .line 652
    goto/16 :goto_b

    .line 653
    .line 654
    :cond_1d
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 655
    .line 656
    if-eqz v2, :cond_1e

    .line 657
    .line 658
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 659
    .line 660
    add-int/lit8 v3, v0, -0x2

    .line 661
    .line 662
    aput-char v10, v1, v3

    .line 663
    .line 664
    add-int/lit8 v0, v0, -0x1

    .line 665
    .line 666
    aput-char v2, v1, v0

    .line 667
    .line 668
    return-void

    .line 669
    :cond_1e
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 670
    .line 671
    add-int/lit8 v0, v0, -0x1

    .line 672
    .line 673
    aput-char v10, v1, v0

    .line 674
    .line 675
    return-void

    .line 676
    :cond_1f
    move v15, v4

    .line 677
    move v3, v9

    .line 678
    move/from16 v19, v10

    .line 679
    .line 680
    move v6, v11

    .line 681
    move/from16 v16, v6

    .line 682
    .line 683
    :goto_12
    const/16 v10, 0x2029

    .line 684
    .line 685
    const/16 v12, 0x2028

    .line 686
    .line 687
    if-ge v3, v7, :cond_2a

    .line 688
    .line 689
    iget-object v13, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 690
    .line 691
    aget-char v13, v13, v3

    .line 692
    .line 693
    const/16 v14, 0x5d

    .line 694
    .line 695
    if-lt v13, v14, :cond_24

    .line 696
    .line 697
    const/16 v14, 0x7f

    .line 698
    .line 699
    if-lt v13, v14, :cond_20

    .line 700
    .line 701
    if-eq v13, v12, :cond_21

    .line 702
    .line 703
    if-eq v13, v10, :cond_21

    .line 704
    .line 705
    const/16 v10, 0xa0

    .line 706
    .line 707
    if-ge v13, v10, :cond_20

    .line 708
    .line 709
    goto :goto_13

    .line 710
    :cond_20
    move/from16 v22, v15

    .line 711
    .line 712
    goto :goto_15

    .line 713
    :cond_21
    :goto_13
    if-ne v6, v11, :cond_22

    .line 714
    .line 715
    move v6, v3

    .line 716
    :cond_22
    add-int/lit8 v15, v15, 0x1

    .line 717
    .line 718
    add-int/lit8 v5, v5, 0x4

    .line 719
    .line 720
    :cond_23
    move/from16 v16, v3

    .line 721
    .line 722
    :goto_14
    move v4, v13

    .line 723
    goto :goto_16

    .line 724
    :cond_24
    const/16 v14, 0x7f

    .line 725
    .line 726
    const/16 v10, 0x40

    .line 727
    .line 728
    move/from16 v22, v15

    .line 729
    .line 730
    if-ge v13, v10, :cond_25

    .line 731
    .line 732
    iget-wide v14, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->sepcialBits:J

    .line 733
    .line 734
    const-wide/16 v23, 0x1

    .line 735
    .line 736
    shl-long v23, v23, v13

    .line 737
    .line 738
    and-long v14, v14, v23

    .line 739
    .line 740
    const-wide/16 v23, 0x0

    .line 741
    .line 742
    cmp-long v10, v14, v23

    .line 743
    .line 744
    if-nez v10, :cond_26

    .line 745
    .line 746
    :cond_25
    if-ne v13, v8, :cond_29

    .line 747
    .line 748
    :cond_26
    add-int/lit8 v15, v22, 0x1

    .line 749
    .line 750
    const/16 v4, 0x28

    .line 751
    .line 752
    if-eq v13, v4, :cond_27

    .line 753
    .line 754
    const/16 v4, 0x29

    .line 755
    .line 756
    if-eq v13, v4, :cond_27

    .line 757
    .line 758
    const/16 v4, 0x3c

    .line 759
    .line 760
    if-eq v13, v4, :cond_27

    .line 761
    .line 762
    const/16 v4, 0x3e

    .line 763
    .line 764
    if-eq v13, v4, :cond_27

    .line 765
    .line 766
    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 767
    .line 768
    array-length v10, v4

    .line 769
    if-ge v13, v10, :cond_28

    .line 770
    .line 771
    aget-byte v4, v4, v13

    .line 772
    .line 773
    const/4 v10, 0x4

    .line 774
    if-ne v4, v10, :cond_28

    .line 775
    .line 776
    :cond_27
    add-int/lit8 v5, v5, 0x4

    .line 777
    .line 778
    :cond_28
    if-ne v6, v11, :cond_23

    .line 779
    .line 780
    move v6, v3

    .line 781
    move/from16 v16, v6

    .line 782
    .line 783
    goto :goto_14

    .line 784
    :cond_29
    :goto_15
    move/from16 v15, v22

    .line 785
    .line 786
    :goto_16
    add-int/lit8 v3, v3, 0x1

    .line 787
    .line 788
    const/16 v12, 0x3c

    .line 789
    .line 790
    const/16 v13, 0x29

    .line 791
    .line 792
    const/16 v14, 0x28

    .line 793
    .line 794
    goto :goto_12

    .line 795
    :cond_2a
    move/from16 v22, v15

    .line 796
    .line 797
    if-lez v22, :cond_3c

    .line 798
    .line 799
    add-int v5, v5, v22

    .line 800
    .line 801
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 802
    .line 803
    array-length v3, v3

    .line 804
    if-le v5, v3, :cond_2b

    .line 805
    .line 806
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 807
    .line 808
    .line 809
    :cond_2b
    iput v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 810
    .line 811
    move/from16 v3, v20

    .line 812
    .line 813
    move/from16 v15, v22

    .line 814
    .line 815
    if-ne v15, v3, :cond_31

    .line 816
    .line 817
    const/16 v1, 0x32

    .line 818
    .line 819
    if-ne v4, v12, :cond_2c

    .line 820
    .line 821
    add-int/lit8 v4, v16, 0x1

    .line 822
    .line 823
    add-int/lit8 v5, v16, 0x6

    .line 824
    .line 825
    sub-int v7, v7, v16

    .line 826
    .line 827
    sub-int/2addr v7, v3

    .line 828
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 829
    .line 830
    invoke-static {v3, v4, v3, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 831
    .line 832
    .line 833
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 834
    .line 835
    aput-char v8, v3, v16

    .line 836
    .line 837
    aput-char v21, v3, v4

    .line 838
    .line 839
    add-int/lit8 v4, v16, 0x2

    .line 840
    .line 841
    aput-char v1, v3, v4

    .line 842
    .line 843
    add-int/lit8 v4, v16, 0x3

    .line 844
    .line 845
    const/16 v18, 0x30

    .line 846
    .line 847
    aput-char v18, v3, v4

    .line 848
    .line 849
    add-int/lit8 v4, v16, 0x4

    .line 850
    .line 851
    aput-char v1, v3, v4

    .line 852
    .line 853
    add-int/lit8 v16, v16, 0x5

    .line 854
    .line 855
    const/16 v1, 0x38

    .line 856
    .line 857
    aput-char v1, v3, v16

    .line 858
    .line 859
    goto/16 :goto_1e

    .line 860
    .line 861
    :cond_2c
    if-ne v4, v10, :cond_2d

    .line 862
    .line 863
    add-int/lit8 v3, v16, 0x1

    .line 864
    .line 865
    add-int/lit8 v4, v16, 0x6

    .line 866
    .line 867
    sub-int v7, v7, v16

    .line 868
    .line 869
    const/16 v20, 0x1

    .line 870
    .line 871
    add-int/lit8 v7, v7, -0x1

    .line 872
    .line 873
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 874
    .line 875
    invoke-static {v5, v3, v5, v4, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 876
    .line 877
    .line 878
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 879
    .line 880
    aput-char v8, v4, v16

    .line 881
    .line 882
    aput-char v21, v4, v3

    .line 883
    .line 884
    add-int/lit8 v3, v16, 0x2

    .line 885
    .line 886
    aput-char v1, v4, v3

    .line 887
    .line 888
    add-int/lit8 v3, v16, 0x3

    .line 889
    .line 890
    const/16 v18, 0x30

    .line 891
    .line 892
    aput-char v18, v4, v3

    .line 893
    .line 894
    add-int/lit8 v3, v16, 0x4

    .line 895
    .line 896
    aput-char v1, v4, v3

    .line 897
    .line 898
    add-int/lit8 v16, v16, 0x5

    .line 899
    .line 900
    const/16 v1, 0x39

    .line 901
    .line 902
    aput-char v1, v4, v16

    .line 903
    .line 904
    goto/16 :goto_1e

    .line 905
    .line 906
    :cond_2d
    const/16 v1, 0x28

    .line 907
    .line 908
    if-eq v4, v1, :cond_30

    .line 909
    .line 910
    const/16 v1, 0x29

    .line 911
    .line 912
    if-eq v4, v1, :cond_30

    .line 913
    .line 914
    const/16 v1, 0x3c

    .line 915
    .line 916
    if-eq v4, v1, :cond_30

    .line 917
    .line 918
    const/16 v1, 0x3e

    .line 919
    .line 920
    if-ne v4, v1, :cond_2e

    .line 921
    .line 922
    goto :goto_17

    .line 923
    :cond_2e
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 924
    .line 925
    array-length v3, v1

    .line 926
    if-ge v4, v3, :cond_2f

    .line 927
    .line 928
    aget-byte v1, v1, v4

    .line 929
    .line 930
    const/4 v9, 0x4

    .line 931
    if-ne v1, v9, :cond_2f

    .line 932
    .line 933
    add-int/lit8 v1, v16, 0x1

    .line 934
    .line 935
    add-int/lit8 v3, v16, 0x6

    .line 936
    .line 937
    sub-int v7, v7, v16

    .line 938
    .line 939
    const/16 v20, 0x1

    .line 940
    .line 941
    add-int/lit8 v7, v7, -0x1

    .line 942
    .line 943
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 944
    .line 945
    invoke-static {v5, v1, v5, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 946
    .line 947
    .line 948
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 949
    .line 950
    aput-char v8, v3, v16

    .line 951
    .line 952
    add-int/lit8 v5, v16, 0x2

    .line 953
    .line 954
    aput-char v21, v3, v1

    .line 955
    .line 956
    add-int/lit8 v1, v16, 0x3

    .line 957
    .line 958
    sget-object v6, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 959
    .line 960
    ushr-int/lit8 v7, v4, 0xc

    .line 961
    .line 962
    and-int/lit8 v7, v7, 0xf

    .line 963
    .line 964
    aget-char v7, v6, v7

    .line 965
    .line 966
    aput-char v7, v3, v5

    .line 967
    .line 968
    add-int/lit8 v5, v16, 0x4

    .line 969
    .line 970
    ushr-int/lit8 v7, v4, 0x8

    .line 971
    .line 972
    and-int/lit8 v7, v7, 0xf

    .line 973
    .line 974
    aget-char v7, v6, v7

    .line 975
    .line 976
    aput-char v7, v3, v1

    .line 977
    .line 978
    add-int/lit8 v16, v16, 0x5

    .line 979
    .line 980
    ushr-int/lit8 v1, v4, 0x4

    .line 981
    .line 982
    and-int/lit8 v1, v1, 0xf

    .line 983
    .line 984
    aget-char v1, v6, v1

    .line 985
    .line 986
    aput-char v1, v3, v5

    .line 987
    .line 988
    and-int/lit8 v1, v4, 0xf

    .line 989
    .line 990
    aget-char v1, v6, v1

    .line 991
    .line 992
    aput-char v1, v3, v16

    .line 993
    .line 994
    goto/16 :goto_1e

    .line 995
    .line 996
    :cond_2f
    add-int/lit8 v1, v16, 0x1

    .line 997
    .line 998
    add-int/lit8 v3, v16, 0x2

    .line 999
    .line 1000
    sub-int v7, v7, v16

    .line 1001
    .line 1002
    const/16 v20, 0x1

    .line 1003
    .line 1004
    add-int/lit8 v7, v7, -0x1

    .line 1005
    .line 1006
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 1007
    .line 1008
    invoke-static {v5, v1, v5, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1009
    .line 1010
    .line 1011
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 1012
    .line 1013
    aput-char v8, v3, v16

    .line 1014
    .line 1015
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 1016
    .line 1017
    aget-char v4, v5, v4

    .line 1018
    .line 1019
    aput-char v4, v3, v1

    .line 1020
    .line 1021
    goto/16 :goto_1e

    .line 1022
    .line 1023
    :cond_30
    :goto_17
    add-int/lit8 v1, v16, 0x1

    .line 1024
    .line 1025
    add-int/lit8 v3, v16, 0x6

    .line 1026
    .line 1027
    sub-int v7, v7, v16

    .line 1028
    .line 1029
    const/16 v20, 0x1

    .line 1030
    .line 1031
    add-int/lit8 v7, v7, -0x1

    .line 1032
    .line 1033
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 1034
    .line 1035
    invoke-static {v5, v1, v5, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1036
    .line 1037
    .line 1038
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 1039
    .line 1040
    aput-char v8, v3, v16

    .line 1041
    .line 1042
    aput-char v21, v3, v1

    .line 1043
    .line 1044
    add-int/lit8 v1, v16, 0x2

    .line 1045
    .line 1046
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 1047
    .line 1048
    ushr-int/lit8 v6, v4, 0xc

    .line 1049
    .line 1050
    and-int/lit8 v6, v6, 0xf

    .line 1051
    .line 1052
    aget-char v6, v5, v6

    .line 1053
    .line 1054
    aput-char v6, v3, v1

    .line 1055
    .line 1056
    add-int/lit8 v1, v16, 0x3

    .line 1057
    .line 1058
    ushr-int/lit8 v6, v4, 0x8

    .line 1059
    .line 1060
    and-int/lit8 v6, v6, 0xf

    .line 1061
    .line 1062
    aget-char v6, v5, v6

    .line 1063
    .line 1064
    aput-char v6, v3, v1

    .line 1065
    .line 1066
    add-int/lit8 v1, v16, 0x4

    .line 1067
    .line 1068
    ushr-int/lit8 v6, v4, 0x4

    .line 1069
    .line 1070
    and-int/lit8 v6, v6, 0xf

    .line 1071
    .line 1072
    aget-char v6, v5, v6

    .line 1073
    .line 1074
    aput-char v6, v3, v1

    .line 1075
    .line 1076
    add-int/lit8 v16, v16, 0x5

    .line 1077
    .line 1078
    and-int/lit8 v1, v4, 0xf

    .line 1079
    .line 1080
    aget-char v1, v5, v1

    .line 1081
    .line 1082
    aput-char v1, v3, v16

    .line 1083
    .line 1084
    goto/16 :goto_1e

    .line 1085
    .line 1086
    :cond_31
    if-le v15, v3, :cond_3c

    .line 1087
    .line 1088
    sub-int v3, v6, v9

    .line 1089
    .line 1090
    :goto_18
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 1091
    .line 1092
    .line 1093
    move-result v4

    .line 1094
    if-ge v3, v4, :cond_3c

    .line 1095
    .line 1096
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    .line 1097
    .line 1098
    .line 1099
    move-result v4

    .line 1100
    iget-boolean v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->browserSecure:Z

    .line 1101
    .line 1102
    if-eqz v5, :cond_34

    .line 1103
    .line 1104
    const/16 v5, 0x28

    .line 1105
    .line 1106
    const/16 v7, 0x29

    .line 1107
    .line 1108
    const/16 v9, 0x3c

    .line 1109
    .line 1110
    if-eq v4, v5, :cond_32

    .line 1111
    .line 1112
    if-eq v4, v7, :cond_32

    .line 1113
    .line 1114
    const/16 v11, 0x3e

    .line 1115
    .line 1116
    if-eq v4, v9, :cond_33

    .line 1117
    .line 1118
    if-ne v4, v11, :cond_35

    .line 1119
    .line 1120
    goto :goto_19

    .line 1121
    :cond_32
    const/16 v11, 0x3e

    .line 1122
    .line 1123
    :cond_33
    :goto_19
    iget-object v13, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 1124
    .line 1125
    add-int/lit8 v14, v6, 0x1

    .line 1126
    .line 1127
    aput-char v8, v13, v6

    .line 1128
    .line 1129
    add-int/lit8 v15, v6, 0x2

    .line 1130
    .line 1131
    aput-char v21, v13, v14

    .line 1132
    .line 1133
    add-int/lit8 v14, v6, 0x3

    .line 1134
    .line 1135
    sget-object v16, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 1136
    .line 1137
    ushr-int/lit8 v17, v4, 0xc

    .line 1138
    .line 1139
    and-int/lit8 v17, v17, 0xf

    .line 1140
    .line 1141
    aget-char v17, v16, v17

    .line 1142
    .line 1143
    aput-char v17, v13, v15

    .line 1144
    .line 1145
    add-int/lit8 v15, v6, 0x4

    .line 1146
    .line 1147
    ushr-int/lit8 v17, v4, 0x8

    .line 1148
    .line 1149
    and-int/lit8 v17, v17, 0xf

    .line 1150
    .line 1151
    aget-char v17, v16, v17

    .line 1152
    .line 1153
    aput-char v17, v13, v14

    .line 1154
    .line 1155
    add-int/lit8 v14, v6, 0x5

    .line 1156
    .line 1157
    ushr-int/lit8 v17, v4, 0x4

    .line 1158
    .line 1159
    and-int/lit8 v17, v17, 0xf

    .line 1160
    .line 1161
    aget-char v17, v16, v17

    .line 1162
    .line 1163
    aput-char v17, v13, v15

    .line 1164
    .line 1165
    add-int/lit8 v6, v6, 0x6

    .line 1166
    .line 1167
    and-int/lit8 v4, v4, 0xf

    .line 1168
    .line 1169
    aget-char v4, v16, v4

    .line 1170
    .line 1171
    aput-char v4, v13, v14

    .line 1172
    .line 1173
    const/4 v5, 0x4

    .line 1174
    const/16 v14, 0x2f

    .line 1175
    .line 1176
    goto/16 :goto_1d

    .line 1177
    .line 1178
    :cond_34
    const/16 v5, 0x28

    .line 1179
    .line 1180
    const/16 v7, 0x29

    .line 1181
    .line 1182
    const/16 v9, 0x3c

    .line 1183
    .line 1184
    const/16 v11, 0x3e

    .line 1185
    .line 1186
    :cond_35
    sget-object v13, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 1187
    .line 1188
    array-length v14, v13

    .line 1189
    if-ge v4, v14, :cond_36

    .line 1190
    .line 1191
    aget-byte v14, v13, v4

    .line 1192
    .line 1193
    if-nez v14, :cond_37

    .line 1194
    .line 1195
    :cond_36
    const/16 v14, 0x2f

    .line 1196
    .line 1197
    goto :goto_1a

    .line 1198
    :cond_37
    const/16 v14, 0x2f

    .line 1199
    .line 1200
    goto :goto_1b

    .line 1201
    :goto_1a
    if-ne v4, v14, :cond_39

    .line 1202
    .line 1203
    sget-object v15, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 1204
    .line 1205
    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 1206
    .line 1207
    .line 1208
    move-result v15

    .line 1209
    if-eqz v15, :cond_39

    .line 1210
    .line 1211
    :goto_1b
    iget-object v15, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 1212
    .line 1213
    add-int/lit8 v16, v6, 0x1

    .line 1214
    .line 1215
    aput-char v8, v15, v6

    .line 1216
    .line 1217
    aget-byte v13, v13, v4

    .line 1218
    .line 1219
    const/4 v5, 0x4

    .line 1220
    if-ne v13, v5, :cond_38

    .line 1221
    .line 1222
    add-int/lit8 v13, v6, 0x2

    .line 1223
    .line 1224
    aput-char v21, v15, v16

    .line 1225
    .line 1226
    add-int/lit8 v16, v6, 0x3

    .line 1227
    .line 1228
    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 1229
    .line 1230
    ushr-int/lit8 v18, v4, 0xc

    .line 1231
    .line 1232
    and-int/lit8 v18, v18, 0xf

    .line 1233
    .line 1234
    aget-char v18, v17, v18

    .line 1235
    .line 1236
    aput-char v18, v15, v13

    .line 1237
    .line 1238
    add-int/lit8 v13, v6, 0x4

    .line 1239
    .line 1240
    ushr-int/lit8 v18, v4, 0x8

    .line 1241
    .line 1242
    and-int/lit8 v18, v18, 0xf

    .line 1243
    .line 1244
    aget-char v18, v17, v18

    .line 1245
    .line 1246
    aput-char v18, v15, v16

    .line 1247
    .line 1248
    add-int/lit8 v16, v6, 0x5

    .line 1249
    .line 1250
    ushr-int/lit8 v18, v4, 0x4

    .line 1251
    .line 1252
    and-int/lit8 v18, v18, 0xf

    .line 1253
    .line 1254
    aget-char v18, v17, v18

    .line 1255
    .line 1256
    aput-char v18, v15, v13

    .line 1257
    .line 1258
    add-int/lit8 v6, v6, 0x6

    .line 1259
    .line 1260
    and-int/lit8 v4, v4, 0xf

    .line 1261
    .line 1262
    aget-char v4, v17, v4

    .line 1263
    .line 1264
    aput-char v4, v15, v16

    .line 1265
    .line 1266
    goto :goto_1d

    .line 1267
    :cond_38
    add-int/lit8 v6, v6, 0x2

    .line 1268
    .line 1269
    sget-object v13, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 1270
    .line 1271
    aget-char v4, v13, v4

    .line 1272
    .line 1273
    aput-char v4, v15, v16

    .line 1274
    .line 1275
    goto :goto_1d

    .line 1276
    :cond_39
    const/4 v5, 0x4

    .line 1277
    if-eq v4, v12, :cond_3b

    .line 1278
    .line 1279
    if-ne v4, v10, :cond_3a

    .line 1280
    .line 1281
    goto :goto_1c

    .line 1282
    :cond_3a
    iget-object v13, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 1283
    .line 1284
    add-int/lit8 v15, v6, 0x1

    .line 1285
    .line 1286
    aput-char v4, v13, v6

    .line 1287
    .line 1288
    move v6, v15

    .line 1289
    goto :goto_1d

    .line 1290
    :cond_3b
    :goto_1c
    iget-object v13, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 1291
    .line 1292
    add-int/lit8 v15, v6, 0x1

    .line 1293
    .line 1294
    aput-char v8, v13, v6

    .line 1295
    .line 1296
    add-int/lit8 v16, v6, 0x2

    .line 1297
    .line 1298
    aput-char v21, v13, v15

    .line 1299
    .line 1300
    add-int/lit8 v15, v6, 0x3

    .line 1301
    .line 1302
    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 1303
    .line 1304
    ushr-int/lit8 v18, v4, 0xc

    .line 1305
    .line 1306
    and-int/lit8 v18, v18, 0xf

    .line 1307
    .line 1308
    aget-char v18, v17, v18

    .line 1309
    .line 1310
    aput-char v18, v13, v16

    .line 1311
    .line 1312
    add-int/lit8 v16, v6, 0x4

    .line 1313
    .line 1314
    ushr-int/lit8 v18, v4, 0x8

    .line 1315
    .line 1316
    and-int/lit8 v18, v18, 0xf

    .line 1317
    .line 1318
    aget-char v18, v17, v18

    .line 1319
    .line 1320
    aput-char v18, v13, v15

    .line 1321
    .line 1322
    add-int/lit8 v15, v6, 0x5

    .line 1323
    .line 1324
    ushr-int/lit8 v18, v4, 0x4

    .line 1325
    .line 1326
    and-int/lit8 v18, v18, 0xf

    .line 1327
    .line 1328
    aget-char v18, v17, v18

    .line 1329
    .line 1330
    aput-char v18, v13, v16

    .line 1331
    .line 1332
    add-int/lit8 v6, v6, 0x6

    .line 1333
    .line 1334
    and-int/lit8 v4, v4, 0xf

    .line 1335
    .line 1336
    aget-char v4, v17, v4

    .line 1337
    .line 1338
    aput-char v4, v13, v15

    .line 1339
    .line 1340
    :goto_1d
    add-int/lit8 v3, v3, 0x1

    .line 1341
    .line 1342
    goto/16 :goto_18

    .line 1343
    .line 1344
    :cond_3c
    :goto_1e
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 1345
    .line 1346
    if-eqz v2, :cond_3d

    .line 1347
    .line 1348
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1349
    .line 1350
    add-int/lit8 v3, v0, -0x2

    .line 1351
    .line 1352
    aput-char v19, v1, v3

    .line 1353
    .line 1354
    const/16 v20, 0x1

    .line 1355
    .line 1356
    add-int/lit8 v0, v0, -0x1

    .line 1357
    .line 1358
    aput-char v2, v1, v0

    .line 1359
    .line 1360
    return-void

    .line 1361
    :cond_3d
    const/16 v20, 0x1

    .line 1362
    .line 1363
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1364
    .line 1365
    add-int/lit8 v0, v0, -0x1

    .line 1366
    .line 1367
    aput-char v19, v1, v0

    .line 1368
    .line 1369
    return-void
.end method

.method public writeStringWithDoubleQuote([CC)V
    .locals 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    if-nez v1, :cond_0

    .line 1370
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    if-eqz v2, :cond_d

    .line 1371
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    return-void

    .line 1372
    :cond_0
    array-length v3, v1

    .line 1373
    iget v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/2addr v4, v3

    add-int/lit8 v5, v4, 0x2

    if-eqz v2, :cond_1

    add-int/lit8 v5, v4, 0x3

    .line 1374
    :cond_1
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v4, v4

    const/16 v11, 0x3e

    const/16 v12, 0x3c

    const/16 v13, 0x29

    const/16 v14, 0x28

    const/16 v10, 0x22

    const/16 v6, 0x8

    const/16 v15, 0xc

    const/16 v7, 0x75

    const/16 v8, 0x5c

    if-le v5, v4, :cond_f

    .line 1375
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v4, :cond_e

    .line 1376
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    const/4 v3, 0x0

    .line 1377
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_c

    .line 1378
    aget-char v4, v1, v3

    .line 1379
    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserSecure:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v5

    if-eqz v5, :cond_2

    if-eq v4, v14, :cond_3

    if-eq v4, v13, :cond_3

    if-eq v4, v12, :cond_3

    if-ne v4, v11, :cond_2

    goto :goto_1

    :cond_2
    const/16 v20, 0x1

    goto :goto_2

    .line 1380
    :cond_3
    :goto_1
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1381
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1382
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v16, v4, 0xc

    and-int/lit8 v16, v16, 0xf

    const/16 v20, 0x1

    aget-char v9, v5, v16

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    ushr-int/lit8 v9, v4, 0x8

    and-int/lit8 v9, v9, 0xf

    .line 1383
    aget-char v9, v5, v9

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    ushr-int/lit8 v9, v4, 0x4

    and-int/lit8 v9, v9, 0xf

    .line 1384
    aget-char v9, v5, v9

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    and-int/lit8 v4, v4, 0xf

    .line 1385
    aget-char v4, v5, v4

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_4

    .line 1386
    :goto_2
    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v5

    if-eqz v5, :cond_7

    if-eq v4, v6, :cond_6

    if-eq v4, v15, :cond_6

    const/16 v5, 0xa

    if-eq v4, v5, :cond_6

    const/16 v5, 0xd

    if-eq v4, v5, :cond_6

    const/16 v5, 0x9

    if-eq v4, v5, :cond_6

    if-eq v4, v10, :cond_6

    const/16 v5, 0x2f

    if-eq v4, v5, :cond_6

    if-ne v4, v8, :cond_4

    goto :goto_3

    :cond_4
    const/16 v5, 0x20

    if-ge v4, v5, :cond_5

    .line 1387
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1388
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    const/16 v5, 0x30

    .line 1389
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1390
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1391
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->ASCII_CHARS:[C

    mul-int/lit8 v4, v4, 0x2

    aget-char v9, v5, v4

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    add-int/lit8 v4, v4, 0x1

    .line 1392
    aget-char v4, v5, v4

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_4

    :cond_5
    const/16 v5, 0x7f

    if-lt v4, v5, :cond_b

    .line 1393
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1394
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1395
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v9, v4, 0xc

    and-int/lit8 v9, v9, 0xf

    aget-char v9, v5, v9

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    ushr-int/lit8 v9, v4, 0x8

    and-int/lit8 v9, v9, 0xf

    .line 1396
    aget-char v9, v5, v9

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    ushr-int/lit8 v9, v4, 0x4

    and-int/lit8 v9, v9, 0xf

    .line 1397
    aget-char v9, v5, v9

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    and-int/lit8 v4, v4, 0xf

    .line 1398
    aget-char v4, v5, v4

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_4

    .line 1399
    :cond_6
    :goto_3
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1400
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v4, v5, v4

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_4

    .line 1401
    :cond_7
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    array-length v9, v5

    if-ge v4, v9, :cond_8

    aget-byte v9, v5, v4

    if-nez v9, :cond_9

    :cond_8
    const/16 v9, 0x2f

    if-ne v4, v9, :cond_b

    sget-object v9, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 1402
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 1403
    :cond_9
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1404
    aget-byte v5, v5, v4

    const/4 v9, 0x4

    if-ne v5, v9, :cond_a

    .line 1405
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1406
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v9, v4, 0xc

    and-int/lit8 v9, v9, 0xf

    aget-char v9, v5, v9

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    ushr-int/lit8 v9, v4, 0x8

    and-int/lit8 v9, v9, 0xf

    .line 1407
    aget-char v9, v5, v9

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    ushr-int/lit8 v9, v4, 0x4

    and-int/lit8 v9, v9, 0xf

    .line 1408
    aget-char v9, v5, v9

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    and-int/lit8 v4, v4, 0xf

    .line 1409
    aget-char v4, v5, v4

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_4

    .line 1410
    :cond_a
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v4, v5, v4

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_4

    .line 1411
    :cond_b
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 1412
    :cond_c
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    if-eqz v2, :cond_d

    .line 1413
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    :cond_d
    return-void

    :cond_e
    const/16 v20, 0x1

    .line 1414
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    goto :goto_5

    :cond_f
    const/16 v20, 0x1

    .line 1415
    :goto_5
    iget v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v9, v4, 0x1

    add-int/2addr v3, v9

    move/from16 v21, v7

    .line 1416
    iget-object v7, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v10, v7, v4

    .line 1417
    array-length v4, v1

    const/4 v11, 0x0

    invoke-static {v1, v11, v7, v9, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1418
    iput v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1419
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    const/4 v7, -0x1

    if-eqz v4, :cond_20

    move v1, v9

    .line 1420
    :goto_6
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    if-ge v1, v3, :cond_15

    .line 1421
    aget-char v4, v4, v1

    if-eq v4, v10, :cond_13

    const/16 v11, 0x2f

    if-eq v4, v11, :cond_13

    if-ne v4, v8, :cond_10

    goto :goto_9

    :cond_10
    if-eq v4, v6, :cond_13

    if-eq v4, v15, :cond_13

    const/16 v11, 0xa

    if-eq v4, v11, :cond_13

    const/16 v11, 0xd

    if-eq v4, v11, :cond_13

    const/16 v11, 0x9

    if-ne v4, v11, :cond_11

    goto :goto_9

    :cond_11
    const/16 v11, 0x20

    if-ge v4, v11, :cond_12

    :goto_7
    add-int/lit8 v5, v5, 0x5

    :goto_8
    move v7, v1

    goto :goto_a

    :cond_12
    const/16 v11, 0x7f

    if-lt v4, v11, :cond_14

    goto :goto_7

    :cond_13
    :goto_9
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    :cond_14
    :goto_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 1422
    :cond_15
    array-length v1, v4

    if-le v5, v1, :cond_16

    .line 1423
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1424
    :cond_16
    iput v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    :goto_b
    if-lt v7, v9, :cond_1e

    .line 1425
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aget-char v4, v1, v7

    if-eq v4, v6, :cond_1c

    if-eq v4, v15, :cond_1c

    const/16 v5, 0xa

    if-eq v4, v5, :cond_1c

    const/16 v11, 0xd

    const/16 v12, 0x9

    if-eq v4, v11, :cond_17

    if-ne v4, v12, :cond_18

    :cond_17
    :goto_c
    const/16 v13, 0x20

    goto/16 :goto_10

    :cond_18
    if-eq v4, v10, :cond_19

    const/16 v13, 0x2f

    if-eq v4, v13, :cond_19

    if-ne v4, v8, :cond_1a

    :cond_19
    const/16 v13, 0x20

    goto :goto_e

    :cond_1a
    const/16 v13, 0x20

    if-ge v4, v13, :cond_1b

    add-int/lit8 v14, v7, 0x1

    add-int/lit8 v5, v7, 0x6

    sub-int v16, v3, v7

    add-int/lit8 v6, v16, -0x1

    .line 1426
    invoke-static {v1, v14, v1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1427
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v8, v1, v7

    .line 1428
    aput-char v21, v1, v14

    add-int/lit8 v5, v7, 0x2

    const/16 v18, 0x30

    .line 1429
    aput-char v18, v1, v5

    add-int/lit8 v5, v7, 0x3

    .line 1430
    aput-char v18, v1, v5

    add-int/lit8 v5, v7, 0x4

    .line 1431
    sget-object v6, Lcom/alibaba/fastjson/util/IOUtils;->ASCII_CHARS:[C

    mul-int/lit8 v4, v4, 0x2

    aget-char v14, v6, v4

    aput-char v14, v1, v5

    add-int/lit8 v5, v7, 0x5

    add-int/lit8 v4, v4, 0x1

    .line 1432
    aget-char v4, v6, v4

    aput-char v4, v1, v5

    :goto_d
    add-int/lit8 v3, v3, 0x5

    goto :goto_11

    :cond_1b
    const/16 v5, 0x7f

    if-lt v4, v5, :cond_1d

    add-int/lit8 v5, v7, 0x1

    add-int/lit8 v6, v7, 0x6

    sub-int v14, v3, v7

    add-int/lit8 v14, v14, -0x1

    .line 1433
    invoke-static {v1, v5, v1, v6, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1434
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v8, v1, v7

    .line 1435
    aput-char v21, v1, v5

    add-int/lit8 v5, v7, 0x2

    .line 1436
    sget-object v6, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v14, v4, 0xc

    and-int/lit8 v14, v14, 0xf

    aget-char v14, v6, v14

    aput-char v14, v1, v5

    add-int/lit8 v5, v7, 0x3

    ushr-int/lit8 v14, v4, 0x8

    and-int/lit8 v14, v14, 0xf

    .line 1437
    aget-char v14, v6, v14

    aput-char v14, v1, v5

    add-int/lit8 v5, v7, 0x4

    ushr-int/lit8 v14, v4, 0x4

    and-int/lit8 v14, v14, 0xf

    .line 1438
    aget-char v14, v6, v14

    aput-char v14, v1, v5

    add-int/lit8 v5, v7, 0x5

    and-int/lit8 v4, v4, 0xf

    .line 1439
    aget-char v4, v6, v4

    aput-char v4, v1, v5

    goto :goto_d

    :goto_e
    add-int/lit8 v5, v7, 0x1

    add-int/lit8 v6, v7, 0x2

    sub-int v14, v3, v7

    add-int/lit8 v14, v14, -0x1

    .line 1440
    invoke-static {v1, v5, v1, v6, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1441
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v8, v1, v7

    .line 1442
    aput-char v4, v1, v5

    :goto_f
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    :cond_1c
    const/16 v11, 0xd

    const/16 v12, 0x9

    goto/16 :goto_c

    :goto_10
    add-int/lit8 v5, v7, 0x1

    add-int/lit8 v6, v7, 0x2

    sub-int v14, v3, v7

    add-int/lit8 v14, v14, -0x1

    .line 1443
    invoke-static {v1, v5, v1, v6, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1444
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v8, v1, v7

    .line 1445
    sget-object v6, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v4, v6, v4

    aput-char v4, v1, v5

    goto :goto_f

    :cond_1d
    :goto_11
    add-int/lit8 v7, v7, -0x1

    const/16 v6, 0x8

    goto/16 :goto_b

    .line 1446
    :cond_1e
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    if-eqz v2, :cond_1f

    .line 1447
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v3, v0, -0x2

    aput-char v10, v1, v3

    add-int/lit8 v0, v0, -0x1

    .line 1448
    aput-char v2, v1, v0

    return-void

    .line 1449
    :cond_1f
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v0, v0, -0x1

    aput-char v10, v1, v0

    return-void

    :cond_20
    move v6, v7

    move/from16 v16, v6

    move v4, v9

    move/from16 v19, v10

    move v15, v11

    :goto_12
    const/16 v10, 0x2029

    const/16 v12, 0x2028

    if-ge v4, v3, :cond_2b

    .line 1450
    iget-object v13, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aget-char v13, v13, v4

    const/16 v14, 0x5d

    if-lt v13, v14, :cond_25

    const/16 v14, 0x7f

    if-lt v13, v14, :cond_21

    if-eq v13, v12, :cond_22

    if-eq v13, v10, :cond_22

    const/16 v10, 0xa0

    if-ge v13, v10, :cond_21

    goto :goto_13

    :cond_21
    move/from16 v22, v15

    goto :goto_15

    :cond_22
    :goto_13
    if-ne v6, v7, :cond_23

    move v6, v4

    :cond_23
    add-int/lit8 v15, v15, 0x1

    add-int/lit8 v5, v5, 0x4

    :cond_24
    move/from16 v16, v4

    :goto_14
    move v11, v13

    goto :goto_16

    :cond_25
    const/16 v14, 0x7f

    const/16 v10, 0x40

    move/from16 v22, v15

    if-ge v13, v10, :cond_26

    .line 1451
    iget-wide v14, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->sepcialBits:J

    const-wide/16 v23, 0x1

    shl-long v23, v23, v13

    and-long v14, v14, v23

    const-wide/16 v23, 0x0

    cmp-long v10, v14, v23

    if-nez v10, :cond_27

    :cond_26
    if-ne v13, v8, :cond_2a

    :cond_27
    add-int/lit8 v15, v22, 0x1

    const/16 v10, 0x28

    if-eq v13, v10, :cond_28

    const/16 v10, 0x29

    if-eq v13, v10, :cond_28

    const/16 v10, 0x3c

    if-eq v13, v10, :cond_28

    const/16 v10, 0x3e

    if-eq v13, v10, :cond_28

    .line 1452
    sget-object v10, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    array-length v11, v10

    if-ge v13, v11, :cond_29

    aget-byte v10, v10, v13

    const/4 v11, 0x4

    if-ne v10, v11, :cond_29

    :cond_28
    add-int/lit8 v5, v5, 0x4

    :cond_29
    if-ne v6, v7, :cond_24

    move v6, v4

    move/from16 v16, v6

    goto :goto_14

    :cond_2a
    :goto_15
    move/from16 v15, v22

    :goto_16
    add-int/lit8 v4, v4, 0x1

    const/16 v12, 0x3c

    const/16 v13, 0x29

    const/16 v14, 0x28

    goto :goto_12

    :cond_2b
    move/from16 v22, v15

    if-lez v22, :cond_3d

    add-int v5, v5, v22

    .line 1453
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v4, v4

    if-le v5, v4, :cond_2c

    .line 1454
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1455
    :cond_2c
    iput v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v4, v20

    move/from16 v15, v22

    if-ne v15, v4, :cond_32

    const/16 v1, 0x32

    if-ne v11, v12, :cond_2d

    add-int/lit8 v5, v16, 0x1

    add-int/lit8 v6, v16, 0x6

    sub-int v3, v3, v16

    sub-int/2addr v3, v4

    .line 1456
    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-static {v4, v5, v4, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1457
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v8, v3, v16

    .line 1458
    aput-char v21, v3, v5

    add-int/lit8 v4, v16, 0x2

    .line 1459
    aput-char v1, v3, v4

    add-int/lit8 v4, v16, 0x3

    const/16 v18, 0x30

    .line 1460
    aput-char v18, v3, v4

    add-int/lit8 v4, v16, 0x4

    .line 1461
    aput-char v1, v3, v4

    add-int/lit8 v16, v16, 0x5

    const/16 v1, 0x38

    .line 1462
    aput-char v1, v3, v16

    goto/16 :goto_1e

    :cond_2d
    if-ne v11, v10, :cond_2e

    add-int/lit8 v4, v16, 0x1

    add-int/lit8 v5, v16, 0x6

    sub-int v3, v3, v16

    const/16 v20, 0x1

    add-int/lit8 v3, v3, -0x1

    .line 1463
    iget-object v6, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-static {v6, v4, v6, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1464
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v8, v3, v16

    .line 1465
    aput-char v21, v3, v4

    add-int/lit8 v4, v16, 0x2

    .line 1466
    aput-char v1, v3, v4

    add-int/lit8 v4, v16, 0x3

    const/16 v18, 0x30

    .line 1467
    aput-char v18, v3, v4

    add-int/lit8 v4, v16, 0x4

    .line 1468
    aput-char v1, v3, v4

    add-int/lit8 v16, v16, 0x5

    const/16 v1, 0x39

    .line 1469
    aput-char v1, v3, v16

    goto/16 :goto_1e

    :cond_2e
    const/16 v10, 0x28

    if-eq v11, v10, :cond_31

    const/16 v10, 0x29

    if-eq v11, v10, :cond_31

    const/16 v10, 0x3c

    if-eq v11, v10, :cond_31

    const/16 v10, 0x3e

    if-ne v11, v10, :cond_2f

    goto :goto_17

    .line 1470
    :cond_2f
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    array-length v4, v1

    if-ge v11, v4, :cond_30

    aget-byte v1, v1, v11

    const/4 v9, 0x4

    if-ne v1, v9, :cond_30

    add-int/lit8 v1, v16, 0x1

    add-int/lit8 v4, v16, 0x6

    sub-int v3, v3, v16

    const/16 v20, 0x1

    add-int/lit8 v3, v3, -0x1

    .line 1471
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-static {v5, v1, v5, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1472
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v8, v3, v16

    add-int/lit8 v4, v16, 0x2

    .line 1473
    aput-char v21, v3, v1

    add-int/lit8 v1, v16, 0x3

    .line 1474
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v6, v11, 0xc

    and-int/lit8 v6, v6, 0xf

    aget-char v6, v5, v6

    aput-char v6, v3, v4

    add-int/lit8 v4, v16, 0x4

    ushr-int/lit8 v6, v11, 0x8

    and-int/lit8 v6, v6, 0xf

    .line 1475
    aget-char v6, v5, v6

    aput-char v6, v3, v1

    add-int/lit8 v16, v16, 0x5

    ushr-int/lit8 v1, v11, 0x4

    and-int/lit8 v1, v1, 0xf

    .line 1476
    aget-char v1, v5, v1

    aput-char v1, v3, v4

    and-int/lit8 v1, v11, 0xf

    .line 1477
    aget-char v1, v5, v1

    aput-char v1, v3, v16

    goto/16 :goto_1e

    :cond_30
    add-int/lit8 v1, v16, 0x1

    add-int/lit8 v4, v16, 0x2

    sub-int v3, v3, v16

    const/16 v20, 0x1

    add-int/lit8 v3, v3, -0x1

    .line 1478
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-static {v5, v1, v5, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1479
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v8, v3, v16

    .line 1480
    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v4, v4, v11

    aput-char v4, v3, v1

    goto/16 :goto_1e

    :cond_31
    :goto_17
    add-int/lit8 v1, v16, 0x1

    add-int/lit8 v4, v16, 0x6

    sub-int v3, v3, v16

    const/16 v20, 0x1

    add-int/lit8 v3, v3, -0x1

    .line 1481
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-static {v5, v1, v5, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1482
    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v8, v3, v16

    .line 1483
    aput-char v21, v3, v1

    add-int/lit8 v1, v16, 0x2

    .line 1484
    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v5, v11, 0xc

    and-int/lit8 v5, v5, 0xf

    aget-char v5, v4, v5

    aput-char v5, v3, v1

    add-int/lit8 v1, v16, 0x3

    ushr-int/lit8 v5, v11, 0x8

    and-int/lit8 v5, v5, 0xf

    .line 1485
    aget-char v5, v4, v5

    aput-char v5, v3, v1

    add-int/lit8 v1, v16, 0x4

    ushr-int/lit8 v5, v11, 0x4

    and-int/lit8 v5, v5, 0xf

    .line 1486
    aget-char v5, v4, v5

    aput-char v5, v3, v1

    add-int/lit8 v16, v16, 0x5

    and-int/lit8 v1, v11, 0xf

    .line 1487
    aget-char v1, v4, v1

    aput-char v1, v3, v16

    goto/16 :goto_1e

    :cond_32
    if-le v15, v4, :cond_3d

    sub-int v3, v6, v9

    .line 1488
    :goto_18
    array-length v4, v1

    if-ge v3, v4, :cond_3d

    .line 1489
    aget-char v4, v1, v3

    .line 1490
    iget-boolean v5, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->browserSecure:Z

    if-eqz v5, :cond_35

    const/16 v5, 0x28

    const/16 v7, 0x29

    const/16 v9, 0x3c

    if-eq v4, v5, :cond_33

    if-eq v4, v7, :cond_33

    const/16 v11, 0x3e

    if-eq v4, v9, :cond_34

    if-ne v4, v11, :cond_36

    goto :goto_19

    :cond_33
    const/16 v11, 0x3e

    .line 1491
    :cond_34
    :goto_19
    iget-object v13, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v14, v6, 0x1

    aput-char v8, v13, v6

    add-int/lit8 v15, v6, 0x2

    .line 1492
    aput-char v21, v13, v14

    add-int/lit8 v14, v6, 0x3

    .line 1493
    sget-object v16, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v17, v4, 0xc

    and-int/lit8 v17, v17, 0xf

    aget-char v17, v16, v17

    aput-char v17, v13, v15

    add-int/lit8 v15, v6, 0x4

    ushr-int/lit8 v17, v4, 0x8

    and-int/lit8 v17, v17, 0xf

    .line 1494
    aget-char v17, v16, v17

    aput-char v17, v13, v14

    add-int/lit8 v14, v6, 0x5

    ushr-int/lit8 v17, v4, 0x4

    and-int/lit8 v17, v17, 0xf

    .line 1495
    aget-char v17, v16, v17

    aput-char v17, v13, v15

    add-int/lit8 v6, v6, 0x6

    and-int/lit8 v4, v4, 0xf

    .line 1496
    aget-char v4, v16, v4

    aput-char v4, v13, v14

    const/4 v5, 0x4

    const/16 v14, 0x2f

    goto/16 :goto_1d

    :cond_35
    const/16 v5, 0x28

    const/16 v7, 0x29

    const/16 v9, 0x3c

    const/16 v11, 0x3e

    .line 1497
    :cond_36
    sget-object v13, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    array-length v14, v13

    if-ge v4, v14, :cond_37

    aget-byte v14, v13, v4

    if-nez v14, :cond_38

    :cond_37
    const/16 v14, 0x2f

    goto :goto_1a

    :cond_38
    const/16 v14, 0x2f

    goto :goto_1b

    :goto_1a
    if-ne v4, v14, :cond_3a

    sget-object v15, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 1498
    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v15

    if-eqz v15, :cond_3a

    .line 1499
    :goto_1b
    iget-object v15, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v16, v6, 0x1

    aput-char v8, v15, v6

    .line 1500
    aget-byte v13, v13, v4

    const/4 v5, 0x4

    if-ne v13, v5, :cond_39

    add-int/lit8 v13, v6, 0x2

    .line 1501
    aput-char v21, v15, v16

    add-int/lit8 v16, v6, 0x3

    .line 1502
    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v18, v4, 0xc

    and-int/lit8 v18, v18, 0xf

    aget-char v18, v17, v18

    aput-char v18, v15, v13

    add-int/lit8 v13, v6, 0x4

    ushr-int/lit8 v18, v4, 0x8

    and-int/lit8 v18, v18, 0xf

    .line 1503
    aget-char v18, v17, v18

    aput-char v18, v15, v16

    add-int/lit8 v16, v6, 0x5

    ushr-int/lit8 v18, v4, 0x4

    and-int/lit8 v18, v18, 0xf

    .line 1504
    aget-char v18, v17, v18

    aput-char v18, v15, v13

    add-int/lit8 v6, v6, 0x6

    and-int/lit8 v4, v4, 0xf

    .line 1505
    aget-char v4, v17, v4

    aput-char v4, v15, v16

    goto :goto_1d

    :cond_39
    add-int/lit8 v6, v6, 0x2

    .line 1506
    sget-object v13, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v4, v13, v4

    aput-char v4, v15, v16

    goto :goto_1d

    :cond_3a
    const/4 v5, 0x4

    if-eq v4, v12, :cond_3c

    if-ne v4, v10, :cond_3b

    goto :goto_1c

    .line 1507
    :cond_3b
    iget-object v13, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v15, v6, 0x1

    aput-char v4, v13, v6

    move v6, v15

    goto :goto_1d

    .line 1508
    :cond_3c
    :goto_1c
    iget-object v13, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v15, v6, 0x1

    aput-char v8, v13, v6

    add-int/lit8 v16, v6, 0x2

    .line 1509
    aput-char v21, v13, v15

    add-int/lit8 v15, v6, 0x3

    .line 1510
    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v18, v4, 0xc

    and-int/lit8 v18, v18, 0xf

    aget-char v18, v17, v18

    aput-char v18, v13, v16

    add-int/lit8 v16, v6, 0x4

    ushr-int/lit8 v18, v4, 0x8

    and-int/lit8 v18, v18, 0xf

    .line 1511
    aget-char v18, v17, v18

    aput-char v18, v13, v15

    add-int/lit8 v15, v6, 0x5

    ushr-int/lit8 v18, v4, 0x4

    and-int/lit8 v18, v18, 0xf

    .line 1512
    aget-char v18, v17, v18

    aput-char v18, v13, v16

    add-int/lit8 v6, v6, 0x6

    and-int/lit8 v4, v4, 0xf

    .line 1513
    aget-char v4, v17, v4

    aput-char v4, v13, v15

    :goto_1d
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_18

    .line 1514
    :cond_3d
    :goto_1e
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    if-eqz v2, :cond_3e

    .line 1515
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v3, v0, -0x2

    aput-char v19, v1, v3

    const/16 v20, 0x1

    add-int/lit8 v0, v0, -0x1

    .line 1516
    aput-char v2, v1, v0

    return-void

    :cond_3e
    const/16 v20, 0x1

    .line 1517
    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v0, v0, -0x1

    aput-char v19, v1, v0

    return-void
.end method

.method public writeStringWithSingleQuote(Ljava/lang/String;)V
    .locals 13

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p1, :cond_1

    .line 5
    .line 6
    const/4 p1, 0x4

    .line 7
    add-int/2addr v0, p1

    .line 8
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 9
    .line 10
    array-length v2, v2

    .line 11
    if-le v0, v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 17
    .line 18
    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 19
    .line 20
    const-string v4, "null"

    .line 21
    .line 22
    invoke-virtual {v4, v1, p1, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 23
    .line 24
    .line 25
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    add-int/2addr v0, v2

    .line 33
    add-int/lit8 v0, v0, 0x2

    .line 34
    .line 35
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 36
    .line 37
    array-length v3, v3

    .line 38
    const/16 v4, 0x2f

    .line 39
    .line 40
    const/16 v5, 0xd

    .line 41
    .line 42
    const/16 v6, 0x5c

    .line 43
    .line 44
    const/16 v7, 0x27

    .line 45
    .line 46
    if-le v0, v3, :cond_6

    .line 47
    .line 48
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 49
    .line 50
    if-eqz v3, :cond_5

    .line 51
    .line 52
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 53
    .line 54
    .line 55
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-ge v1, v0, :cond_4

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-le v0, v5, :cond_3

    .line 66
    .line 67
    if-eq v0, v6, :cond_3

    .line 68
    .line 69
    if-eq v0, v7, :cond_3

    .line 70
    .line 71
    if-ne v0, v4, :cond_2

    .line 72
    .line 73
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 74
    .line 75
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_2

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 83
    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_3
    :goto_1
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 87
    .line 88
    .line 89
    sget-object v2, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 90
    .line 91
    aget-char v0, v2, v0

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 94
    .line 95
    .line 96
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_4
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 104
    .line 105
    .line 106
    :cond_6
    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 107
    .line 108
    add-int/lit8 v8, v3, 0x1

    .line 109
    .line 110
    add-int v9, v8, v2

    .line 111
    .line 112
    iget-object v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 113
    .line 114
    aput-char v7, v10, v3

    .line 115
    .line 116
    invoke-virtual {p1, v1, v2, v10, v8}, Ljava/lang/String;->getChars(II[CI)V

    .line 117
    .line 118
    .line 119
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 120
    .line 121
    const/4 p1, -0x1

    .line 122
    move v10, p1

    .line 123
    move v2, v1

    .line 124
    move v3, v8

    .line 125
    :goto_3
    iget-object v11, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 126
    .line 127
    if-ge v3, v9, :cond_9

    .line 128
    .line 129
    aget-char v11, v11, v3

    .line 130
    .line 131
    if-le v11, v5, :cond_7

    .line 132
    .line 133
    if-eq v11, v6, :cond_7

    .line 134
    .line 135
    if-eq v11, v7, :cond_7

    .line 136
    .line 137
    if-ne v11, v4, :cond_8

    .line 138
    .line 139
    sget-object v12, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 140
    .line 141
    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 142
    .line 143
    .line 144
    move-result v12

    .line 145
    if-eqz v12, :cond_8

    .line 146
    .line 147
    :cond_7
    add-int/lit8 v1, v1, 0x1

    .line 148
    .line 149
    move v10, v3

    .line 150
    move v2, v11

    .line 151
    :cond_8
    add-int/lit8 v3, v3, 0x1

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_9
    add-int/2addr v0, v1

    .line 155
    array-length v3, v11

    .line 156
    if-le v0, v3, :cond_a

    .line 157
    .line 158
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 159
    .line 160
    .line 161
    :cond_a
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 162
    .line 163
    const/4 v0, 0x1

    .line 164
    if-ne v1, v0, :cond_b

    .line 165
    .line 166
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 167
    .line 168
    add-int/lit8 v1, v10, 0x1

    .line 169
    .line 170
    add-int/lit8 v3, v10, 0x2

    .line 171
    .line 172
    sub-int/2addr v9, v10

    .line 173
    sub-int/2addr v9, v0

    .line 174
    invoke-static {p1, v1, p1, v3, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 178
    .line 179
    aput-char v6, p1, v10

    .line 180
    .line 181
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 182
    .line 183
    aget-char v2, v3, v2

    .line 184
    .line 185
    aput-char v2, p1, v1

    .line 186
    .line 187
    goto :goto_5

    .line 188
    :cond_b
    if-le v1, v0, :cond_e

    .line 189
    .line 190
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 191
    .line 192
    add-int/lit8 v3, v10, 0x1

    .line 193
    .line 194
    add-int/lit8 v11, v10, 0x2

    .line 195
    .line 196
    sub-int v12, v9, v10

    .line 197
    .line 198
    sub-int/2addr v12, v0

    .line 199
    invoke-static {v1, v3, v1, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 200
    .line 201
    .line 202
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 203
    .line 204
    aput-char v6, v1, v10

    .line 205
    .line 206
    sget-object v11, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 207
    .line 208
    aget-char v2, v11, v2

    .line 209
    .line 210
    aput-char v2, v1, v3

    .line 211
    .line 212
    add-int/2addr v9, v0

    .line 213
    add-int/2addr v10, p1

    .line 214
    :goto_4
    if-lt v10, v8, :cond_e

    .line 215
    .line 216
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 217
    .line 218
    aget-char p1, p1, v10

    .line 219
    .line 220
    if-le p1, v5, :cond_c

    .line 221
    .line 222
    if-eq p1, v6, :cond_c

    .line 223
    .line 224
    if-eq p1, v7, :cond_c

    .line 225
    .line 226
    if-ne p1, v4, :cond_d

    .line 227
    .line 228
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 229
    .line 230
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    if-eqz v1, :cond_d

    .line 235
    .line 236
    :cond_c
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 237
    .line 238
    add-int/lit8 v2, v10, 0x1

    .line 239
    .line 240
    add-int/lit8 v3, v10, 0x2

    .line 241
    .line 242
    sub-int v11, v9, v10

    .line 243
    .line 244
    sub-int/2addr v11, v0

    .line 245
    invoke-static {v1, v2, v1, v3, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 246
    .line 247
    .line 248
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 249
    .line 250
    aput-char v6, v1, v10

    .line 251
    .line 252
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 253
    .line 254
    aget-char p1, v3, p1

    .line 255
    .line 256
    aput-char p1, v1, v2

    .line 257
    .line 258
    add-int/lit8 v9, v9, 0x1

    .line 259
    .line 260
    :cond_d
    add-int/lit8 v10, v10, -0x1

    .line 261
    .line 262
    goto :goto_4

    .line 263
    :cond_e
    :goto_5
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 264
    .line 265
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 266
    .line 267
    sub-int/2addr p0, v0

    .line 268
    aput-char v7, p1, p0

    .line 269
    .line 270
    return-void
.end method

.method public writeStringWithSingleQuote([C)V
    .locals 13

    .line 271
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    const/4 v1, 0x0

    if-nez p1, :cond_1

    const/4 p1, 0x4

    add-int/2addr v0, p1

    .line 272
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v2, v2

    if-le v0, v2, :cond_0

    .line 273
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 274
    :cond_0
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    const-string v4, "null"

    invoke-virtual {v4, v1, p1, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 275
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    return-void

    .line 276
    :cond_1
    array-length v2, p1

    add-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x2

    .line 277
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v3, v3

    const/16 v4, 0x2f

    const/16 v5, 0xd

    const/16 v6, 0x5c

    const/16 v7, 0x27

    if-le v0, v3, :cond_6

    .line 278
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v3, :cond_5

    .line 279
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 280
    :goto_0
    array-length v0, p1

    if-ge v1, v0, :cond_4

    .line 281
    aget-char v0, p1, v1

    if-le v0, v5, :cond_3

    if-eq v0, v6, :cond_3

    if-eq v0, v7, :cond_3

    if-ne v0, v4, :cond_2

    .line 282
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 283
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    .line 284
    :cond_2
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_2

    .line 285
    :cond_3
    :goto_1
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 286
    sget-object v2, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v0, v2, v0

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 287
    :cond_4
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    return-void

    .line 288
    :cond_5
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 289
    :cond_6
    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v8, v3, 0x1

    add-int/2addr v2, v8

    .line 290
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v7, v9, v3

    .line 291
    array-length v3, p1

    invoke-static {p1, v1, v9, v8, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 292
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    const/4 p1, -0x1

    move v10, p1

    move v3, v1

    move v9, v8

    .line 293
    :goto_3
    iget-object v11, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    if-ge v9, v2, :cond_9

    .line 294
    aget-char v11, v11, v9

    if-le v11, v5, :cond_7

    if-eq v11, v6, :cond_7

    if-eq v11, v7, :cond_7

    if-ne v11, v4, :cond_8

    .line 295
    sget-object v12, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 296
    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v12

    if-eqz v12, :cond_8

    :cond_7
    add-int/lit8 v1, v1, 0x1

    move v10, v9

    move v3, v11

    :cond_8
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    :cond_9
    add-int/2addr v0, v1

    .line 297
    array-length v9, v11

    if-le v0, v9, :cond_a

    .line 298
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 299
    :cond_a
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    const/4 v0, 0x1

    if-ne v1, v0, :cond_b

    .line 300
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v1, v10, 0x1

    add-int/lit8 v4, v10, 0x2

    sub-int/2addr v2, v10

    sub-int/2addr v2, v0

    invoke-static {p1, v1, p1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 301
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v6, p1, v10

    .line 302
    sget-object v2, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v2, v2, v3

    aput-char v2, p1, v1

    goto :goto_5

    :cond_b
    if-le v1, v0, :cond_e

    .line 303
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v9, v10, 0x1

    add-int/lit8 v11, v10, 0x2

    sub-int v12, v2, v10

    sub-int/2addr v12, v0

    invoke-static {v1, v9, v1, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 304
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v6, v1, v10

    .line 305
    sget-object v11, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v3, v11, v3

    aput-char v3, v1, v9

    add-int/2addr v2, v0

    add-int/2addr v10, p1

    :goto_4
    if-lt v10, v8, :cond_e

    .line 306
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aget-char p1, p1, v10

    if-le p1, v5, :cond_c

    if-eq p1, v6, :cond_c

    if-eq p1, v7, :cond_c

    if-ne p1, v4, :cond_d

    .line 307
    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 308
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 309
    :cond_c
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v3, v10, 0x1

    add-int/lit8 v9, v10, 0x2

    sub-int v11, v2, v10

    sub-int/2addr v11, v0

    invoke-static {v1, v3, v1, v9, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 310
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char v6, v1, v10

    .line 311
    sget-object v9, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char p1, v9, p1

    aput-char p1, v1, v3

    add-int/lit8 v2, v2, 0x1

    :cond_d
    add-int/lit8 v10, v10, -0x1

    goto :goto_4

    .line 312
    :cond_e
    :goto_5
    iget-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    sub-int/2addr p0, v0

    aput-char v7, p1, p0

    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 20
    invoke-static {p2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeTo(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeToEx(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)I

    return-void
.end method

.method public writeTo(Ljava/io/Writer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, p0}, Ljava/io/Writer;->write([CII)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "writer not null"

    .line 15
    .line 16
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public writeToEx(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    .line 6
    .line 7
    if-ne p2, v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->encodeToUTF8(Ljava/io/OutputStream;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 20
    .line 21
    invoke-direct {v0, v1, v2, p0}, Ljava/lang/String;-><init>([CII)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 29
    .line 30
    .line 31
    array-length p0, p0

    .line 32
    return p0

    .line 33
    :cond_1
    const-string p0, "writer not null"

    .line 34
    .line 35
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return p0
.end method
