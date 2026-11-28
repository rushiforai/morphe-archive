.class public final Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000e\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000eJ\u0010\u0010\u000f\u001a\u00020\u000c2\u0006\u0010\u0010\u001a\u00020\u0011H\u0002J\u001f\u0010\u0012\u001a\u00020\u000c*\u00020\u00032\u0006\u0010\u0013\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u0014\u001a\u00020\tH\u0082\u0010J\u0010\u0010\u0015\u001a\u00020\u000c2\u0006\u0010\u0016\u001a\u00020\u0017H\u0002J\u0010\u0010\u0018\u001a\u00020\u000c2\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J\u0010\u0010\u001b\u001a\u00020\u000c2\u0006\u0010\u0019\u001a\u00020\u001cH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\t0\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001d"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "<init>",
        "(Lnicoid/network238/okio/Buffer;)V",
        "labelToOffset",
        "",
        "Lnicoid/network238/okio/ByteString;",
        "",
        "messageStart",
        "write",
        "",
        "message",
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessage;",
        "writeQuestion",
        "question",
        "Lnicoid/network238/okhttp3/internal/dns/Question;",
        "writeName",
        "name",
        "receiverOffset",
        "writeResourceRecord",
        "resourceRecord",
        "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
        "writeIpAddress",
        "record",
        "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;",
        "writeHttps",
        "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;",
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
.field private final labelToOffset:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lnicoid/network238/okio/ByteString;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final messageStart:J

.field private final sink:Lnicoid/network238/okio/Buffer;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Buffer;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    .line 44
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->labelToOffset:Ljava/util/Map;

    .line 45
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->messageStart:J

    return-void
.end method

.method private final writeHttps(Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;)V
    .registers 15

    .line 137
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    sget-object v7, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v2

    const/4 v5, 0x2

    const/4 v6, 0x0

    const-wide/16 v3, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->writeName$default(Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;JILjava/lang/Object;)V

    .line 138
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    const/16 v1, 0x41

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 139
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 140
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getTimeToLive()I

    move-result v2

    invoke-virtual {v0, v2}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    .line 142
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 143
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getPriority()I

    move-result v2

    invoke-virtual {v0, v2}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 145
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getTargetName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v2

    .line 146
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v3}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    const-wide/16 v5, 0x2

    add-long/2addr v3, v5

    .line 144
    invoke-direct {p0, v0, v2, v3, v4}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->writeName(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;J)V

    .line 149
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getAlpnIds()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x2

    const/4 v4, 0x3

    const/4 v5, 0x0

    if-eqz v2, :cond_4

    .line 150
    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 151
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getAlpnIds()Ljava/util/List;

    move-result-object v1

    .line 204
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 205
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Ljava/lang/String;

    .line 151
    sget-object v8, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v8}, Lnicoid/network238/okhttp3/Protocol;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 205
    invoke-interface {v2, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 152
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    const-wide/16 v6, 0x0

    move v8, v5

    :goto_1
    const/4 v9, 0x0

    if-ge v8, v1, :cond_2

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v8, v8, 0x1

    check-cast v10, Ljava/lang/String;

    invoke-static {v10, v5, v5, v4, v9}, Lnicoid/network238/okio/Utf8;->size$default(Ljava/lang/String;IIILjava/lang/Object;)J

    move-result-wide v9

    const-wide/16 v11, 0x1

    add-long/2addr v9, v11

    add-long/2addr v6, v9

    goto :goto_1

    :cond_2
    long-to-int v1, v6

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 153
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v6, v5

    :goto_2
    if-ge v6, v1, :cond_3

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Ljava/lang/String;

    .line 154
    invoke-static {v7, v5, v5, v4, v9}, Lnicoid/network238/okio/Utf8;->size$default(Ljava/lang/String;IIILjava/lang/Object;)J

    move-result-wide v10

    long-to-int v8, v10

    invoke-virtual {v0, v8}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 155
    invoke-virtual {v0, v7}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    goto :goto_2

    .line 157
    :cond_3
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getAlpnIds()Ljava/util/List;

    move-result-object v1

    sget-object v2, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Protocol;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 158
    invoke-virtual {v0, v3}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 159
    invoke-virtual {v0, v5}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 163
    :cond_4
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getPort()I

    move-result v1

    const/16 v2, 0x1bb

    if-eq v1, v2, :cond_5

    .line 164
    invoke-virtual {v0, v4}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 165
    invoke-virtual {v0, v3}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 166
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 169
    :cond_5
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getIpAddressHints()Ljava/util/List;

    move-result-object v1

    .line 207
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 216
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    instance-of v6, v4, Ljava/net/Inet4Address;

    if-eqz v6, :cond_6

    invoke-interface {v2, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 170
    :cond_7
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    const/4 v4, 0x4

    if-nez v1, :cond_8

    .line 171
    invoke-virtual {v0, v4}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 172
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    shl-int/2addr v1, v3

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 173
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v3, v5

    :goto_4
    if-ge v3, v1, :cond_8

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v3, v3, 0x1

    check-cast v6, Ljava/net/Inet4Address;

    .line 174
    invoke-virtual {v6}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v6}, Lnicoid/network238/okio/Buffer;->write([B)Lnicoid/network238/okio/Buffer;

    goto :goto_4

    .line 180
    :cond_8
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getEchConfigList()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 181
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 182
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getEchConfigList()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 183
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getEchConfigList()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    .line 186
    :cond_9
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getIpAddressHints()Ljava/util/List;

    move-result-object p1

    .line 218
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 227
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_a
    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Ljava/net/Inet6Address;

    if-eqz v3, :cond_a

    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 187
    :cond_b
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_c

    .line 188
    const/4 p1, 0x6

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 189
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    shl-int/2addr p1, v4

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 190
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_6
    if-ge v5, p1, :cond_c

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v5, v5, 0x1

    check-cast v2, Ljava/net/Inet6Address;

    .line 191
    invoke-virtual {v2}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v2}, Lnicoid/network238/okio/Buffer;->write([B)Lnicoid/network238/okio/Buffer;

    goto :goto_6

    .line 195
    :cond_c
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/32 v3, 0xffff

    cmp-long p1, v1, v3

    if-gez p1, :cond_d

    .line 196
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {p1, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 197
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J

    return-void

    .line 195
    :cond_d
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "record too long"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final writeIpAddress(Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;)V
    .registers 10

    .line 120
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    .line 121
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    sget-object v1, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v3

    const/4 v6, 0x2

    const/4 v7, 0x0

    const-wide/16 v4, 0x0

    move-object v1, p0

    invoke-static/range {v1 .. v7}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->writeName$default(Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;JILjava/lang/Object;)V

    .line 122
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    .line 123
    array-length v2, v0

    const/4 v3, 0x4

    const/4 v4, 0x1

    if-eq v2, v3, :cond_1

    const/16 v3, 0x10

    if-ne v2, v3, :cond_0

    const/16 v2, 0x1c

    goto :goto_0

    .line 125
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 126
    const-string v0, "unexpected address"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    move v2, v4

    .line 122
    :goto_0
    invoke-virtual {v1, v2}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 129
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1, v4}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 130
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->getTimeToLive()I

    move-result p1

    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    .line 131
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    array-length v1, v0

    invoke-virtual {p1, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 132
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->write([B)Lnicoid/network238/okio/Buffer;

    return-void
.end method

.method private final writeName(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;J)V
    .registers 12

    .line 80
    :goto_0
    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 81
    invoke-virtual {p1, v1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    return-void

    .line 86
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->labelToOffset:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-eqz v0, :cond_1

    .line 88
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    long-to-int p2, p2

    const p3, 0xc000

    or-int/2addr p2, p3

    invoke-virtual {p1, p2}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    return-void

    .line 93
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->labelToOffset:Ljava/util/Map;

    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    add-long/2addr v2, p3

    iget-wide v4, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->messageStart:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, p2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    # getter for: Lnicoid/network238/okhttp3/internal/dns/_DnsMessageWriterKt;->LABEL_SEPARATOR:Lnicoid/network238/okio/ByteString;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/dns/_DnsMessageWriterKt;->access$getLABEL_SEPARATOR$p()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {p2, v0, v1, v2, v3}, Lnicoid/network238/okio/ByteString;->indexOf$default(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;IILjava/lang/Object;)I

    move-result v0

    const/4 v4, -0x1

    const-string v5, "label too long"

    const/16 v6, 0x40

    if-ne v0, v4, :cond_3

    .line 98
    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p3

    if-ge p3, v6, :cond_2

    .line 99
    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p3

    invoke-virtual {p1, p3}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 100
    invoke-virtual {p1, p2}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    .line 101
    invoke-virtual {p1, v1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    return-void

    .line 98
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    if-ge v0, v6, :cond_4

    .line 107
    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 108
    invoke-virtual {p1, p2, v1, v0}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;II)Lnicoid/network238/okio/Buffer;

    add-int/lit8 v0, v0, 0x1

    .line 109
    invoke-static {p2, v0, v1, v2, v3}, Lnicoid/network238/okio/ByteString;->substring$default(Lnicoid/network238/okio/ByteString;IIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object p2

    goto :goto_0

    .line 106
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic writeName$default(Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;JILjava/lang/Object;)V
    .registers 7

    and-int/lit8 p5, p5, 0x2

    if-eqz p5, :cond_0

    const-wide/16 p3, 0x0

    .line 75
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->writeName(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;J)V

    return-void
.end method

.method private final writeQuestion(Lnicoid/network238/okhttp3/internal/dns/Question;)V
    .registers 9

    .line 70
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/Question;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v2

    const/4 v5, 0x2

    const/4 v6, 0x0

    const-wide/16 v3, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->writeName$default(Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;JILjava/lang/Object;)V

    .line 71
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/Question;->getType()I

    move-result v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 72
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/Question;->getClass()I

    move-result p1

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    return-void
.end method

.method private final writeResourceRecord(Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;)V
    .registers 3

    .line 114
    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->writeHttps(Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;)V

    return-void

    .line 115
    :cond_0
    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;

    if-eqz v0, :cond_1

    check-cast p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->writeIpAddress(Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;)V

    return-void

    .line 113
    :cond_1
    new-instance p1, Lnicoid/network238/kotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lnicoid/network238/kotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1
.end method


# virtual methods
.method public final write(Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getId()S

    move-result v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 49
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getFlags()I

    move-result v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 50
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getQuestions()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 51
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getAnswers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 52
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getAuthorityRecords()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 53
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->sink:Lnicoid/network238/okio/Buffer;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getAdditionalRecords()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 55
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getQuestions()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/dns/Question;

    .line 56
    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->writeQuestion(Lnicoid/network238/okhttp3/internal/dns/Question;)V

    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getAnswers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;

    .line 59
    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->writeResourceRecord(Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;)V

    goto :goto_1

    .line 61
    :cond_1
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getAuthorityRecords()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;

    .line 62
    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->writeResourceRecord(Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;)V

    goto :goto_2

    .line 64
    :cond_2
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getAdditionalRecords()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;

    .line 65
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/dns/DnsMessageWriter;->writeResourceRecord(Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;)V

    goto :goto_3

    :cond_3
    return-void
.end method
