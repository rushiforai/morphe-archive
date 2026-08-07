.class public Lcom/tantanapp/common/data/EnumProtobufAdapter;
.super Lcom/tantanapp/common/data/ProtobufAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Enum;",
        ">",
        "Lcom/tantanapp/common/data/ProtobufAdapter<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private final VALUES:[Ljava/lang/Enum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TE;"
        }
    .end annotation
.end field

.field private getOrdinal:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "TE;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Ljava/lang/Enum;Ll/qcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;",
            "Ll/qcj<",
            "TE;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ProtobufAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantanapp/common/data/EnumProtobufAdapter;->VALUES:[Ljava/lang/Enum;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/tantanapp/common/data/EnumProtobufAdapter;->getOrdinal:Ll/qcj;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public computeAndCacheSize(Ljava/lang/Enum;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)I"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/EnumProtobufAdapter;->getOrdinal:Ll/qcj;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->i(I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 18
    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/EnumProtobufAdapter;->computeAndCacheSize(Ljava/lang/Enum;)I

    move-result p0

    return p0
.end method

.method public getSize(Ljava/lang/Enum;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)I"
        }
    .end annotation

    .line 8
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/EnumProtobufAdapter;->computeAndCacheSize(Ljava/lang/Enum;)I

    move-result p0

    return p0
.end method

.method public bridge synthetic getSize(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Enum;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/EnumProtobufAdapter;->getSize(Ljava/lang/Enum;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public parse(Ll/nc5;)Ljava/lang/Enum;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nc5;",
            ")TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/EnumProtobufAdapter;->VALUES:[Ljava/lang/Enum;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    add-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    aget-object p0, p0, p1

    .line 10
    .line 11
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/EnumProtobufAdapter;->parse(Ll/nc5;)Ljava/lang/Enum;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Ljava/lang/Enum;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/protobuf/nano/CodedOutputByteBufferNano;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/EnumProtobufAdapter;->getOrdinal:Ll/qcj;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p2, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->H(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 17
    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/data/EnumProtobufAdapter;->serialize(Ljava/lang/Enum;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
