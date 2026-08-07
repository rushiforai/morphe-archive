.class public abstract Lcom/tantanapp/common/data/ProtobufAdapter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field public static final INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final TAG_TYPE_BITS:I = 0x3


# instance fields
.field private aa:Lcom/tantanapp/common/data/ProtobufAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private ma:Lcom/tantanapp/common/data/ProtobufAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;>;"
        }
    .end annotation
.end field

.field protected wireFormat:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/ProtobufAdapter$4;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/common/data/ProtobufAdapter$4;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/tantanapp/common/data/ProtobufAdapter$5;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/tantanapp/common/data/ProtobufAdapter$5;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/tantanapp/common/data/ProtobufAdapter$6;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/tantanapp/common/data/ProtobufAdapter$6;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 21
    .line 22
    new-instance v0, Lcom/tantanapp/common/data/ProtobufAdapter$7;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/tantanapp/common/data/ProtobufAdapter$7;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->ma:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->aa:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 11
    .line 12
    return-void
.end method

.method public static ARRAY_ADAPTER(Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "TT;>;)",
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 14
    new-instance v0, Lcom/tantanapp/common/data/ProtobufAdapter$3;

    invoke-direct {v0, p0}, Lcom/tantanapp/common/data/ProtobufAdapter$3;-><init>(Lcom/tantanapp/common/data/ProtobufAdapter;)V

    return-object v0
.end method

.method public static HASH_MAP_ADAPTER(Ll/qcj;Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "TT;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "TT;>;)",
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/ProtobufAdapter$2;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Lcom/tantanapp/common/data/ProtobufAdapter$2;-><init>(Lcom/tantanapp/common/data/ProtobufAdapter;Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static MAP_ADAPTER(Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "TT;>;)",
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;>;"
        }
    .end annotation

    .line 14
    new-instance p0, Lcom/tantanapp/common/data/ProtobufAdapter$1;

    invoke-direct {p0}, Lcom/tantanapp/common/data/ProtobufAdapter$1;-><init>()V

    return-object p0
.end method

.method public static makeTag(II)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    or-int/2addr p0, p1

    return p0
.end method


# virtual methods
.method public ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->aa:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER(Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->aa:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->aa:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 12
    .line 13
    return-object p0
.end method

.method public MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->ma:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER(Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->ma:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->ma:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 12
    .line 13
    return-object p0
.end method

.method public abstract computeAndCacheSize(Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation
.end method

.method public final get([B)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)TT;"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public abstract getSize(Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation
.end method

.method public abstract parse(Ll/nc5;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nc5;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final parse([B)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    :try_start_0
    array-length v1, p1

    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-static {p1, v2, v1}, Ll/nc5;->d([BII)Ll/nc5;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse(Ll/nc5;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0
    :try_end_0
    .catch Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    return-object p0

    .line 16
    :catch_0
    const-string p0, "Reading from a byte array threw an IOException (should never happen)."

    .line 17
    .line 18
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :catch_1
    move-exception p0

    .line 23
    throw p0
.end method

.method public abstract serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/protobuf/nano/CodedOutputByteBufferNano;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public serialize(Ljava/lang/Object;)[B
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->computeAndCacheSize(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    new-array v0, v0, [B

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->x([B)Lcom/google/protobuf/nano/CodedOutputByteBufferNano;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, p1, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->a()V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public toBytes(Ljava/lang/Object;)[B
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)[B"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method
