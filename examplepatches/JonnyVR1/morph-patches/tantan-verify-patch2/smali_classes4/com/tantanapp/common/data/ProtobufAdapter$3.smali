.class Lcom/tantanapp/common/data/ProtobufAdapter$3;
.super Lcom/tantanapp/common/data/ProtobufAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER(Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ProtobufAdapter<",
        "Ljava/util/List<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field itemTag:I

.field final synthetic val$from:Lcom/tantanapp/common/data/ProtobufAdapter;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/ProtobufAdapter;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantanapp/common/data/ProtobufAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    iput v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iget p1, p1, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->makeTag(II)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->itemTag:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 66
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter$3;->computeAndCacheSize(Ljava/util/List;)I

    move-result p0

    return p0
.end method

.method public computeAndCacheSize(Ljava/util/List;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    iget-object v1, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 5
    .line 6
    iget v1, v1, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    const/4 v3, 0x1

    .line 10
    if-ne v1, v2, :cond_2

    .line 11
    .line 12
    move v1, v0

    .line 13
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v0, v2, :cond_1

    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v4, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    invoke-static {v3, v2, v4}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    add-int/2addr v1, v2

    .line 32
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return v1

    .line 36
    :cond_2
    move v1, v0

    .line 37
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-ge v0, v2, :cond_4

    .line 42
    .line 43
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    if-eqz v2, :cond_3

    .line 48
    .line 49
    iget-object v4, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    invoke-virtual {v4, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->computeAndCacheSize(Ljava/lang/Object;)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-static {v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->q(I)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    add-int/2addr v2, v4

    .line 60
    add-int/2addr v1, v2

    .line 61
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_4
    return v1

    .line 65
    :cond_5
    return v0
.end method

.method public bridge synthetic getSize(Ljava/lang/Object;)I
    .locals 0

    .line 66
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter$3;->getSize(Ljava/util/List;)I

    move-result p0

    return p0
.end method

.method public getSize(Ljava/util/List;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    iget-object v1, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 5
    .line 6
    iget v1, v1, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    const/4 v3, 0x1

    .line 10
    if-ne v1, v2, :cond_2

    .line 11
    .line 12
    move v1, v0

    .line 13
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v0, v2, :cond_1

    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v4, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    invoke-static {v3, v2, v4}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->w(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    add-int/2addr v1, v2

    .line 32
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return v1

    .line 36
    :cond_2
    move v1, v0

    .line 37
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-ge v0, v2, :cond_4

    .line 42
    .line 43
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    if-eqz v2, :cond_3

    .line 48
    .line 49
    iget-object v4, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    invoke-virtual {v4, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->getSize(Ljava/lang/Object;)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-static {v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->q(I)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    add-int/2addr v2, v4

    .line 60
    add-int/2addr v1, v2

    .line 61
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_4
    return v1

    .line 65
    :cond_5
    return v0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter$3;->parse(Ll/nc5;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public parse(Ll/nc5;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nc5;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    iget v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->itemTag:I

    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/ghq0;->a(Ll/nc5;I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    new-instance v1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    iget v2, v2, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 27
    .line 28
    const/4 v3, 0x2

    .line 29
    const/4 v4, 0x0

    .line 30
    if-ne v2, v3, :cond_2

    .line 31
    .line 32
    :goto_0
    add-int/lit8 v2, v0, -0x1

    .line 33
    .line 34
    iget-object v3, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    if-ge v4, v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 46
    .line 47
    .line 48
    add-int/lit8 v4, v4, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    return-object v1

    .line 59
    :cond_2
    :goto_1
    add-int/lit8 v2, v0, -0x1

    .line 60
    .line 61
    iget-object v3, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    if-ge v4, v2, :cond_3

    .line 64
    .line 65
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse(Ll/nc5;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 73
    .line 74
    .line 75
    add-int/lit8 v4, v4, 0x1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse(Ll/nc5;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    return-object v1
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/data/ProtobufAdapter$3;->serialize(Ljava/util/List;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method

.method public serialize(Ljava/util/List;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;",
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
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_2

    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget-object v2, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    iget v2, v2, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    invoke-virtual {p2, v3, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->U(II)V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    iget v3, v2, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 27
    .line 28
    const/4 v4, 0x2

    .line 29
    if-ne v3, v4, :cond_0

    .line 30
    .line 31
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->getSize(Ljava/lang/Object;)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {p2, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->P(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v2, p0, Lcom/tantanapp/common/data/ProtobufAdapter$3;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {v2, v1, p2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    return-void
.end method
