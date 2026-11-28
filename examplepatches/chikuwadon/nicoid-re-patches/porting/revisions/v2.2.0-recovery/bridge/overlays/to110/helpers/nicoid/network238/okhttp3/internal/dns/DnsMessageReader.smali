.class public final Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0006\u0010\u0007\u001a\u00020\u0008J\u000c\u0010\t\u001a\u00020\n*\u00020\u0003H\u0002J\u000c\u0010\u000b\u001a\u00020\u000c*\u00020\u0003H\u0002J\u001f\u0010\u000b\u001a\u00020\r*\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u000f2\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u0011H\u0082\u0010J\u000c\u0010\u0012\u001a\u0004\u0018\u00010\u0013*\u00020\u0003J\u001c\u0010\u0014\u001a\u00020\u0015*\u00020\u00032\u0006\u0010\u0016\u001a\u00020\u000c2\u0006\u0010\u0017\u001a\u00020\u0011H\u0002R\u000e\u0010\u0006\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;",
        "",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSource;)V",
        "sourceOffsetZero",
        "read",
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessage;",
        "readQuestion",
        "Lnicoid/network238/okhttp3/internal/dns/Question;",
        "readName",
        "",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "maxOffset",
        "",
        "readResourceRecord",
        "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
        "readHttpsResourceRecord",
        "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;",
        "name",
        "timeToLive",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final source:Lnicoid/network238/okio/BufferedSource;

.field private final sourceOffsetZero:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/BufferedSource;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->sourceOffsetZero:Lnicoid/network238/okio/BufferedSource;

    .line 47
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->peek()Lnicoid/network238/okio/BufferedSource;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->source:Lnicoid/network238/okio/BufferedSource;

    return-void
.end method

.method private final readHttpsResourceRecord(Lnicoid/network238/okio/BufferedSource;Ljava/lang/String;I)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;
    .registers 26

    .line 297
    move-object/from16 v0, p1

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v1

    invoke-static {v1}, Lnicoid/network238/kotlin/UShort;->constructor-impl(S)S

    move-result v1

    .line 196
    invoke-direct/range {p0 .. p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->readName(Lnicoid/network238/okio/BufferedSource;)Ljava/lang/String;

    move-result-object v6

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/16 v5, 0x1bb

    move-object v7, v3

    move-object v10, v7

    move v8, v5

    const/4 v5, 0x0

    .line 204
    :goto_0
    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->exhausted()Z

    move-result v9

    const-string v11, "malformed HTTPS / no-default-alpn"

    const v12, 0xffff

    if-nez v9, :cond_11

    .line 298
    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v9

    invoke-static {v9}, Lnicoid/network238/kotlin/UShort;->constructor-impl(S)S

    move-result v9

    and-int/2addr v9, v12

    if-le v9, v2, :cond_10

    .line 299
    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v2

    invoke-static {v2}, Lnicoid/network238/kotlin/UShort;->constructor-impl(S)S

    move-result v2

    int-to-long v13, v2

    const-wide/32 v15, 0xffff

    and-long/2addr v13, v15

    move v15, v5

    const-wide/16 v4, 0x2

    const-wide/16 v16, 0x0

    packed-switch v9, :pswitch_data_0

    .line 266
    invoke-interface {v0, v13, v14}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    goto/16 :goto_5

    :pswitch_0
    if-nez v3, :cond_0

    .line 257
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    nop

    .line 258
    const-wide/16 v4, 0x10

    rem-long v11, v13, v4

    cmp-long v11, v11, v16

    if-nez v11, :cond_3

    .line 259
    const/4 v2, 0x0

    invoke-static {v2, v13, v14}, Lnicoid/network238/kotlin/ranges/RangesKt;->until(IJ)Lnicoid/network238/kotlin/ranges/LongRange;

    move-result-object v11

    invoke-static {v11, v4, v5}, Lnicoid/network238/kotlin/ranges/RangesKt;->step(Lnicoid/network238/kotlin/ranges/LongProgression;J)Lnicoid/network238/kotlin/ranges/LongProgression;

    move-result-object v11

    invoke-virtual {v11}, Lnicoid/network238/kotlin/ranges/LongProgression;->getFirst()J

    move-result-wide v12

    invoke-virtual {v11}, Lnicoid/network238/kotlin/ranges/LongProgression;->getLast()J

    move-result-wide v18

    invoke-virtual {v11}, Lnicoid/network238/kotlin/ranges/LongProgression;->getStep()J

    move-result-wide v20

    cmp-long v11, v20, v16

    if-lez v11, :cond_1

    cmp-long v14, v12, v18

    if-lez v14, :cond_2

    :cond_1
    if-gez v11, :cond_f

    cmp-long v11, v18, v12

    if-gtz v11, :cond_f

    :cond_2
    :goto_1
    nop

    .line 260
    invoke-interface {v0, v4, v5}, Lnicoid/network238/okio/BufferedSource;->readByteArray(J)[B

    move-result-object v11

    invoke-static {v11}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v11

    invoke-interface {v3, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    cmp-long v11, v12, v18

    if-eqz v11, :cond_f

    add-long v12, v12, v20

    goto :goto_1

    .line 258
    :cond_3
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "malformed HTTPS / ipv6hint"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 253
    :pswitch_1
    invoke-interface {v0, v13, v14}, Lnicoid/network238/okio/BufferedSource;->readByteString(J)Lnicoid/network238/okio/ByteString;

    move-result-object v10

    move v2, v9

    move v5, v15

    goto/16 :goto_0

    .line 245
    :pswitch_2
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 246
    const-wide/16 v4, 0x4

    rem-long v11, v13, v4

    cmp-long v11, v11, v16

    if-nez v11, :cond_6

    .line 247
    const/4 v2, 0x0

    invoke-static {v2, v13, v14}, Lnicoid/network238/kotlin/ranges/RangesKt;->until(IJ)Lnicoid/network238/kotlin/ranges/LongRange;

    move-result-object v11

    invoke-static {v11, v4, v5}, Lnicoid/network238/kotlin/ranges/RangesKt;->step(Lnicoid/network238/kotlin/ranges/LongProgression;J)Lnicoid/network238/kotlin/ranges/LongProgression;

    move-result-object v11

    invoke-virtual {v11}, Lnicoid/network238/kotlin/ranges/LongProgression;->getFirst()J

    move-result-wide v12

    invoke-virtual {v11}, Lnicoid/network238/kotlin/ranges/LongProgression;->getLast()J

    move-result-wide v18

    invoke-virtual {v11}, Lnicoid/network238/kotlin/ranges/LongProgression;->getStep()J

    move-result-wide v20

    cmp-long v11, v20, v16

    if-lez v11, :cond_4

    cmp-long v14, v12, v18

    if-lez v14, :cond_5

    :cond_4
    if-gez v11, :cond_f

    cmp-long v11, v18, v12

    if-gtz v11, :cond_f

    :cond_5
    :goto_2
    nop

    .line 248
    invoke-interface {v0, v4, v5}, Lnicoid/network238/okio/BufferedSource;->readByteArray(J)[B

    move-result-object v11

    invoke-static {v11}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v11

    invoke-interface {v3, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    cmp-long v11, v12, v18

    if-eqz v11, :cond_f

    add-long v12, v12, v20

    goto :goto_2

    .line 246
    :cond_6
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "malformed HTTPS / ipv4hint"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_3
    cmp-long v4, v13, v4

    if-nez v4, :cond_7

    .line 302
    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v4

    invoke-static {v4}, Lnicoid/network238/kotlin/UShort;->constructor-impl(S)S

    move-result v4

    and-int v8, v4, v12

    move v2, v9

    move v5, v15

    goto/16 :goto_0

    .line 240
    :cond_7
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "malformed HTTPS / port"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_4
    cmp-long v4, v13, v16

    if-nez v4, :cond_8

    const/4 v5, 0x1

    move v2, v9

    goto/16 :goto_0

    .line 235
    :cond_8
    new-instance v0, Ljava/net/ProtocolException;

    invoke-direct {v0, v11}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :pswitch_5
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    :goto_3
    cmp-long v5, v16, v13

    if-gez v5, :cond_a

    .line 301
    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v5

    invoke-static {v5}, Lnicoid/network238/kotlin/UByte;->constructor-impl(B)B

    move-result v5

    int-to-long v11, v5

    const-wide/16 v18, 0xff

    and-long v11, v11, v18

    const-wide/16 v18, 0x1

    add-long v16, v16, v18

    add-long v16, v16, v11

    cmp-long v5, v16, v13

    if-gtz v5, :cond_9

    .line 229
    invoke-interface {v0, v11, v12}, Lnicoid/network238/okio/BufferedSource;->readUtf8(J)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 227
    :cond_9
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "malformed HTTPS / alpn"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :cond_a
    move-object v7, v4

    goto :goto_5

    .line 227
    :pswitch_6
    nop

    .line 211
    rem-long v18, v13, v4

    cmp-long v11, v18, v16

    if-nez v11, :cond_e

    .line 212
    const/4 v2, 0x0

    invoke-static {v2, v13, v14}, Lnicoid/network238/kotlin/ranges/RangesKt;->until(IJ)Lnicoid/network238/kotlin/ranges/LongRange;

    move-result-object v11

    invoke-static {v11, v4, v5}, Lnicoid/network238/kotlin/ranges/RangesKt;->step(Lnicoid/network238/kotlin/ranges/LongProgression;J)Lnicoid/network238/kotlin/ranges/LongProgression;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/kotlin/ranges/LongProgression;->getFirst()J

    move-result-wide v13

    invoke-virtual {v4}, Lnicoid/network238/kotlin/ranges/LongProgression;->getLast()J

    move-result-wide v18

    invoke-virtual {v4}, Lnicoid/network238/kotlin/ranges/LongProgression;->getStep()J

    move-result-wide v4

    cmp-long v11, v4, v16

    if-lez v11, :cond_b

    cmp-long v16, v13, v18

    if-lez v16, :cond_c

    :cond_b
    if-gez v11, :cond_f

    cmp-long v11, v18, v13

    if-gtz v11, :cond_f

    .line 300
    :cond_c
    :goto_4
    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v11

    invoke-static {v11}, Lnicoid/network238/kotlin/UShort;->constructor-impl(S)S

    move-result v11

    and-int/2addr v11, v12

    if-ltz v11, :cond_d

    const/4 v2, 0x7

    if-ge v11, v2, :cond_d

    cmp-long v2, v13, v18

    if-eqz v2, :cond_f

    add-long/2addr v13, v4

    const/4 v2, 0x0

    goto :goto_4

    .line 215
    :cond_d
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "unsupported HTTPS mandatory parameter "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :cond_e
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "malformed HTTPS / mandatory"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 215
    :cond_f
    :goto_5
    move v2, v9

    move v5, v15

    goto/16 :goto_0

    .line 206
    :cond_10
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "malformed HTTPS resource record"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_11
    move v15, v5

    if-eqz v15, :cond_13

    if-eqz v7, :cond_12

    goto :goto_6

    .line 272
    :cond_12
    new-instance v0, Ljava/net/ProtocolException;

    invoke-direct {v0, v11}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    if-eqz v7, :cond_14

    .line 273
    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Protocol;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v7, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    .line 274
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Protocol;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 277
    :cond_14
    :goto_6
    new-instance v2, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;

    and-int v5, v1, v12

    if-nez v3, :cond_15

    .line 284
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v3

    move-object v9, v3

    goto :goto_7

    .line 277
    :cond_15
    move-object v9, v3

    :goto_7
    move-object/from16 v3, p2

    move/from16 v4, p3

    invoke-direct/range {v2 .. v10}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;)V

    return-object v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final readName(Lnicoid/network238/okio/BufferedSource;)Ljava/lang/String;
    .registers 8

    .line 106
    new-instance v2, Lnicoid/network238/okio/Buffer;

    invoke-direct {v2}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 107
    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->readName$default(Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/Buffer;IILjava/lang/Object;)V

    .line 108
    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private final readName(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/Buffer;I)V
    .registers 10

    .line 294
    :cond_0
    :goto_0
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v0

    invoke-static {v0}, Lnicoid/network238/kotlin/UByte;->constructor-impl(B)B

    move-result v0

    and-int/lit16 v1, v0, 0xc0

    and-int/lit8 v0, v0, 0x3f

    if-eqz v1, :cond_3

    const/16 v2, 0x40

    if-eq v1, v2, :cond_2

    const/16 v2, 0x80

    if-eq v1, v2, :cond_2

    const/16 v2, 0xc0

    if-ne v1, v2, :cond_0

    shl-int/lit8 v0, v0, 0x8

    .line 295
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result p1

    invoke-static {p1}, Lnicoid/network238/kotlin/UByte;->constructor-impl(B)B

    move-result p1

    and-int/lit16 p1, p1, 0xff

    or-int/2addr p1, v0

    if-ge p1, p3, :cond_1

    .line 136
    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->sourceOffsetZero:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {p3}, Lnicoid/network238/okio/BufferedSource;->peek()Lnicoid/network238/okio/BufferedSource;

    move-result-object p3

    int-to-long v0, p1

    .line 137
    invoke-interface {p3, v0, v1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    move-object v5, p3

    move p3, p1

    move-object p1, v5

    goto :goto_0

    .line 133
    :cond_1
    new-instance p1, Ljava/net/ProtocolException;

    const-string p2, "malformed DNS message"

    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 142
    :cond_2
    new-instance p1, Ljava/net/ProtocolException;

    const-string p2, "unsupported label type"

    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    if-nez v0, :cond_4

    return-void

    .line 123
    :cond_4
    invoke-virtual {p2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_5

    const/16 v1, 0x2e

    invoke-virtual {p2, v1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    :cond_5
    int-to-long v0, v0

    .line 124
    invoke-virtual {p2, p1, v0, v1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Source;J)Lnicoid/network238/okio/Buffer;

    goto :goto_0
.end method

.method static synthetic readName$default(Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/Buffer;IILjava/lang/Object;)V
    .registers 6

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    const p3, 0x7fffffff

    .line 111
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->readName(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okio/Buffer;I)V

    return-void
.end method

.method private final readQuestion(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okhttp3/internal/dns/Question;
    .registers 5

    .line 95
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->readName(Lnicoid/network238/okio/BufferedSource;)Ljava/lang/String;

    move-result-object v0

    .line 96
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v1

    .line 97
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result p1

    .line 98
    new-instance v2, Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-direct {v2, v0, v1, p1}, Lnicoid/network238/okhttp3/internal/dns/Question;-><init>(Ljava/lang/String;II)V

    return-object v2
.end method


# virtual methods
.method public final read()Lnicoid/network238/okhttp3/internal/dns/DnsMessage;
    .registers 11

    .line 50
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v2

    .line 51
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v3

    .line 53
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->source:Lnicoid/network238/okio/BufferedSource;

    .line 290
    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v0

    invoke-static {v0}, Lnicoid/network238/kotlin/UShort;->constructor-impl(S)S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    .line 54
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->source:Lnicoid/network238/okio/BufferedSource;

    .line 291
    invoke-interface {v4}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v4

    invoke-static {v4}, Lnicoid/network238/kotlin/UShort;->constructor-impl(S)S

    move-result v4

    and-int/2addr v4, v1

    .line 55
    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->source:Lnicoid/network238/okio/BufferedSource;

    .line 292
    invoke-interface {v5}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v5

    invoke-static {v5}, Lnicoid/network238/kotlin/UShort;->constructor-impl(S)S

    move-result v5

    and-int/2addr v5, v1

    .line 56
    iget-object v6, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->source:Lnicoid/network238/okio/BufferedSource;

    .line 293
    invoke-interface {v6}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v6

    invoke-static {v6}, Lnicoid/network238/kotlin/UShort;->constructor-impl(S)S

    move-result v6

    and-int/2addr v6, v1

    .line 58
    move v1, v4

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v7, 0x0

    move v8, v7

    :goto_0
    if-ge v8, v0, :cond_0

    .line 60
    iget-object v9, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-direct {p0, v9}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->readQuestion(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okhttp3/internal/dns/Question;

    move-result-object v9

    invoke-interface {v4, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 63
    :cond_0
    move v0, v5

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v1}, Ljava/util/ArrayList;-><init>(I)V

    move v8, v7

    :goto_1
    if-ge v8, v1, :cond_2

    .line 65
    iget-object v9, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-virtual {p0, v9}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->readResourceRecord(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;

    move-result-object v9

    if-eqz v9, :cond_1

    invoke-interface {v5, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 68
    :cond_2
    move v1, v6

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v0}, Ljava/util/ArrayList;-><init>(I)V

    move v8, v7

    :goto_2
    if-ge v8, v0, :cond_4

    .line 70
    iget-object v9, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-virtual {p0, v9}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->readResourceRecord(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;

    move-result-object v9

    if-eqz v9, :cond_3

    invoke-interface {v6, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 73
    :cond_4
    move v0, v7

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 78
    :goto_3
    iget-object v8, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->source:Lnicoid/network238/okio/BufferedSource;

    if-ge v0, v1, :cond_6

    .line 75
    invoke-virtual {p0, v8}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->readResourceRecord(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;

    move-result-object v8

    if-eqz v8, :cond_5

    invoke-interface {v7, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 78
    :cond_6
    invoke-interface {v8}, Lnicoid/network238/okio/BufferedSource;->exhausted()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 82
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->sourceOffsetZero:Lnicoid/network238/okio/BufferedSource;

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->skipAll(Lnicoid/network238/okio/BufferedSource;)V

    .line 84
    new-instance v1, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    invoke-direct/range {v1 .. v7}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;-><init>(SILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v1

    .line 79
    :cond_7
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "unexpected trailing data in message"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final readResourceRecord(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;
    .registers 16

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 150
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->readName(Lnicoid/network238/okio/BufferedSource;)Ljava/lang/String;

    move-result-object v0

    .line 151
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v1

    .line 152
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v2

    .line 153
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readInt()I

    move-result v3

    .line 296
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readShort()S

    move-result v4

    invoke-static {v4}, Lnicoid/network238/kotlin/UShort;->constructor-impl(S)S

    move-result v4

    int-to-long v4, v4

    const-wide/32 v6, 0xffff

    and-long v9, v4, v6

    const-string v4, "unexpected record length"

    const/4 v5, 0x1

    if-ne v2, v5, :cond_1

    if-ne v1, v5, :cond_1

    const-wide/16 v1, 0x4

    cmp-long v5, v9, v1

    if-nez v5, :cond_0

    .line 159
    invoke-interface {p1, v1, v2}, Lnicoid/network238/okio/BufferedSource;->readByteArray(J)[B

    move-result-object p1

    invoke-static {p1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object p1

    .line 160
    new-instance v1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;

    .line 163
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 160
    invoke-direct {v1, v0, v3, p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;-><init>(Ljava/lang/String;ILjava/net/InetAddress;)V

    return-object v1

    .line 158
    :cond_0
    new-instance p1, Ljava/net/ProtocolException;

    invoke-direct {p1, v4}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    if-ne v2, v5, :cond_3

    const/16 v6, 0x1c

    if-ne v1, v6, :cond_3

    const-wide/16 v1, 0x10

    cmp-long v5, v9, v1

    if-nez v5, :cond_2

    .line 169
    invoke-interface {p1, v1, v2}, Lnicoid/network238/okio/BufferedSource;->readByteArray(J)[B

    move-result-object p1

    invoke-static {p1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object p1

    .line 170
    new-instance v1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;

    .line 173
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 170
    invoke-direct {v1, v0, v3, p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;-><init>(Ljava/lang/String;ILjava/net/InetAddress;)V

    return-object v1

    .line 168
    :cond_2
    new-instance p1, Ljava/net/ProtocolException;

    invoke-direct {p1, v4}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    if-ne v2, v5, :cond_4

    const/16 v2, 0x41

    if-ne v1, v2, :cond_4

    .line 178
    const/4 v11, 0x0

    const/4 v12, 0x2

    const/4 v13, 0x0

    move-object v8, p1

    invoke-static/range {v8 .. v13}, Lnicoid/network238/okio/Okio;->limit$default(Lnicoid/network238/okio/Source;JZILjava/lang/Object;)Lnicoid/network238/okio/Source;

    move-result-object p1

    .line 179
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object p1

    .line 180
    invoke-direct {p0, p1, v0, v3}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageReader;->readHttpsResourceRecord(Lnicoid/network238/okio/BufferedSource;Ljava/lang/String;I)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;

    move-result-object p1

    return-object p1

    .line 168
    :cond_4
    move-object v8, p1

    .line 184
    invoke-interface {v8, v9, v10}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    const/4 p1, 0x0

    return-object p1
.end method
