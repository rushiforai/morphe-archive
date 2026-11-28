.class public final Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Https"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u001a\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0008\u0086\u0008\u0018\u00002\u00020\u0001Bc\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0003\u0012\u0010\u0008\u0002\u0010\u0008\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\t\u0012\u0008\u0008\u0002\u0010\n\u001a\u00020\u0005\u0012\u000e\u0008\u0002\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\t\u0012\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u000e\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\t\u0010\u001f\u001a\u00020\u0003H\u00c6\u0003J\t\u0010 \u001a\u00020\u0005H\u00c6\u0003J\t\u0010!\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\"\u001a\u00020\u0003H\u00c6\u0003J\u0011\u0010#\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\tH\u00c6\u0003J\t\u0010$\u001a\u00020\u0005H\u00c6\u0003J\u000f\u0010%\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\tH\u00c6\u0003J\u000b\u0010&\u001a\u0004\u0018\u00010\u000eH\u00c6\u0003Ji\u0010\'\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00032\u0010\u0008\u0002\u0010\u0008\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\t2\u0008\u0008\u0002\u0010\n\u001a\u00020\u00052\u000e\u0008\u0002\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\t2\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u000eH\u00c6\u0001J\u0013\u0010(\u001a\u00020)2\u0008\u0010*\u001a\u0004\u0018\u00010+H\u00d6\u0003J\t\u0010,\u001a\u00020\u0005H\u00d6\u0001J\t\u0010-\u001a\u00020\u0003H\u00d6\u0001R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0011\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0014R\u0011\u0010\u0007\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0012R\u0019\u0010\u0008\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018R\u001a\u0010\n\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0019\u0010\u0014\"\u0004\u0008\u001a\u0010\u001bR\u0017\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u0018R\u0013\u0010\r\u001a\u0004\u0018\u00010\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001d\u0010\u001e\u00a8\u0006."
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;",
        "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
        "name",
        "",
        "timeToLive",
        "",
        "priority",
        "targetName",
        "alpnIds",
        "",
        "port",
        "ipAddressHints",
        "Ljava/net/InetAddress;",
        "echConfigList",
        "Lnicoid/network238/okio/ByteString;",
        "<init>",
        "(Ljava/lang/String;IILjava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;)V",
        "getName",
        "()Ljava/lang/String;",
        "getTimeToLive",
        "()I",
        "getPriority",
        "getTargetName",
        "getAlpnIds",
        "()Ljava/util/List;",
        "getPort",
        "setPort",
        "(I)V",
        "getIpAddressHints",
        "getEchConfigList",
        "()Lnicoid/network238/okio/ByteString;",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "component7",
        "component8",
        "copy",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "toString",
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
.field private final alpnIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final echConfigList:Lnicoid/network238/okio/ByteString;

.field private final ipAddressHints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;

.field private port:I

.field private final priority:I

.field private final targetName:Ljava/lang/String;

.field private final timeToLive:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/util/List<",
            "+",
            "Ljava/net/InetAddress;",
            ">;",
            "Lnicoid/network238/okio/ByteString;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->name:Ljava/lang/String;

    .line 91
    iput p2, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->timeToLive:I

    .line 92
    iput p3, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->priority:I

    .line 93
    iput-object p4, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->targetName:Ljava/lang/String;

    .line 94
    iput-object p5, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->alpnIds:Ljava/util/List;

    .line 95
    iput p6, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->port:I

    .line 96
    iput-object p7, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->ipAddressHints:Ljava/util/List;

    .line 97
    iput-object p8, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->echConfigList:Lnicoid/network238/okio/ByteString;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;IILjava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 20

    move/from16 v0, p9

    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_0

    const/4 p3, 0x1

    :cond_0
    move v3, p3

    and-int/lit8 p3, v0, 0x8

    if-eqz p3, :cond_1

    .line 93
    const-string p4, ""

    move-object v4, p4

    goto :goto_0

    .line 0
    :cond_1
    move-object v4, p4

    .line 93
    :goto_0
    and-int/lit8 p3, v0, 0x10

    const/4 p4, 0x0

    if-eqz p3, :cond_2

    move-object v5, p4

    goto :goto_1

    :cond_2
    move-object v5, p5

    :goto_1
    and-int/lit8 p3, v0, 0x20

    if-eqz p3, :cond_3

    const/16 p3, 0x1bb

    move v6, p3

    goto :goto_2

    :cond_3
    move v6, p6

    :goto_2
    and-int/lit8 p3, v0, 0x40

    if-eqz p3, :cond_4

    .line 96
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p3

    move-object v7, p3

    goto :goto_3

    .line 93
    :cond_4
    move-object/from16 v7, p7

    .line 96
    :goto_3
    and-int/lit16 p3, v0, 0x80

    if-eqz p3, :cond_5

    move-object v8, p4

    goto :goto_4

    :cond_5
    move-object/from16 v8, p8

    .line 89
    :goto_4
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v8}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;)V

    return-void
.end method

.method public static synthetic copy$default(Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;Ljava/lang/String;IILjava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;
    .registers 11

    and-int/lit8 p10, p9, 0x1

    if-eqz p10, :cond_0

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->name:Ljava/lang/String;

    :cond_0
    and-int/lit8 p10, p9, 0x2

    if-eqz p10, :cond_1

    iget p2, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->timeToLive:I

    :cond_1
    and-int/lit8 p10, p9, 0x4

    if-eqz p10, :cond_2

    iget p3, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->priority:I

    :cond_2
    and-int/lit8 p10, p9, 0x8

    if-eqz p10, :cond_3

    iget-object p4, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->targetName:Ljava/lang/String;

    :cond_3
    and-int/lit8 p10, p9, 0x10

    if-eqz p10, :cond_4

    iget-object p5, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->alpnIds:Ljava/util/List;

    :cond_4
    and-int/lit8 p10, p9, 0x20

    if-eqz p10, :cond_5

    iget p6, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->port:I

    :cond_5
    and-int/lit8 p10, p9, 0x40

    if-eqz p10, :cond_6

    iget-object p7, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->ipAddressHints:Ljava/util/List;

    :cond_6
    and-int/lit16 p9, p9, 0x80

    if-eqz p9, :cond_7

    iget-object p8, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->echConfigList:Lnicoid/network238/okio/ByteString;

    :cond_7
    move-object p9, p7

    move-object p10, p8

    move-object p7, p5

    move p8, p6

    move p5, p3

    move-object p6, p4

    move-object p3, p1

    move p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p10}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->copy(Ljava/lang/String;IILjava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()I
    .registers 2

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->timeToLive:I

    return v0
.end method

.method public final component3()I
    .registers 2

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->priority:I

    return v0
.end method

.method public final component4()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->targetName:Ljava/lang/String;

    return-object v0
.end method

.method public final component5()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->alpnIds:Ljava/util/List;

    return-object v0
.end method

.method public final component6()I
    .registers 2

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->port:I

    return v0
.end method

.method public final component7()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->ipAddressHints:Ljava/util/List;

    return-object v0
.end method

.method public final component8()Lnicoid/network238/okio/ByteString;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->echConfigList:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method

.method public final copy(Ljava/lang/String;IILjava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/util/List<",
            "+",
            "Ljava/net/InetAddress;",
            ">;",
            "Lnicoid/network238/okio/ByteString;",
            ")",
            "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p7 .. p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->name:Ljava/lang/String;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->name:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->timeToLive:I

    iget v1, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->timeToLive:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->priority:I

    iget v1, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->priority:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->targetName:Ljava/lang/String;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->targetName:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->alpnIds:Ljava/util/List;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->alpnIds:Ljava/util/List;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->port:I

    iget v1, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->port:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->ipAddressHints:Ljava/util/List;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->ipAddressHints:Ljava/util/List;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->echConfigList:Lnicoid/network238/okio/ByteString;

    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->echConfigList:Lnicoid/network238/okio/ByteString;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public final getAlpnIds()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 94
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->alpnIds:Ljava/util/List;

    return-object v0
.end method

.method public final getEchConfigList()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 97
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->echConfigList:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method

.method public final getIpAddressHints()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation

    .line 96
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->ipAddressHints:Ljava/util/List;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .line 90
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final getPort()I
    .registers 2

    .line 95
    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->port:I

    return v0
.end method

.method public final getPriority()I
    .registers 2

    .line 92
    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->priority:I

    return v0
.end method

.method public final getTargetName()Ljava/lang/String;
    .registers 2

    .line 93
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->targetName:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeToLive()I
    .registers 2

    .line 91
    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->timeToLive:I

    return v0
.end method

.method public hashCode()I
    .registers 4

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->timeToLive:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->priority:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->targetName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->alpnIds:Ljava/util/List;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->port:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->ipAddressHints:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->echConfigList:Lnicoid/network238/okio/ByteString;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->hashCode()I

    move-result v2

    :cond_1
    add-int/2addr v0, v2

    return v0
.end method

.method public final setPort(I)V
    .registers 2

    .line 95
    iput p1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->port:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Https(name="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", timeToLive="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->timeToLive:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", priority="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->priority:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", targetName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->targetName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", alpnIds="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->alpnIds:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", port="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", ipAddressHints="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->ipAddressHints:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", echConfigList="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->echConfigList:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
