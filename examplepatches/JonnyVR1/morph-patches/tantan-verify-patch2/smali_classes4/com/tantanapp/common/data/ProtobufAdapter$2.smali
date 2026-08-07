.class Lcom/tantanapp/common/data/ProtobufAdapter$2;
.super Lcom/tantanapp/common/data/ProtobufAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/data/ProtobufAdapter;->HASH_MAP_ADAPTER(Ll/qcj;Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ProtobufAdapter<",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field itemTag:I

.field final synthetic val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

.field final synthetic val$keySelector:Ll/qcj;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/ProtobufAdapter;Ll/qcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$keySelector:Ll/qcj;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/common/data/ProtobufAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p2, 0x2

    .line 9
    iput p2, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 10
    .line 11
    const/4 p2, 0x1

    .line 12
    iget p1, p1, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 13
    .line 14
    invoke-static {p2, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->makeTag(II)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->itemTag:I

    .line 19
    .line 20
    return-void
.end method

.method private removeCacheSize(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)V"
        }
    .end annotation

    .line 1
    instance-of p0, p1, Lcom/tantanapp/common/data/ValueObject;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/tantanapp/common/data/ValueObject;

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 86
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter$2;->computeAndCacheSize(Ljava/util/Map;)I

    move-result p0

    return p0
.end method

.method public computeAndCacheSize(Ljava/util/Map;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v1, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 16
    .line 17
    iget v1, v1, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    const/4 v3, 0x1

    .line 21
    if-ne v1, v2, :cond_3

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-direct {p0, v1}, Lcom/tantanapp/common/data/ProtobufAdapter$2;->removeCacheSize(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->w(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    add-int/2addr v0, v1

    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return v0

    .line 52
    :cond_3
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_5

    .line 61
    .line 62
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    if-nez v1, :cond_4

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_4
    invoke-direct {p0, v1}, Lcom/tantanapp/common/data/ProtobufAdapter$2;->removeCacheSize(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->getSize(Ljava/lang/Object;)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-static {v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->q(I)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    add-int/2addr v1, v2

    .line 83
    add-int/2addr v0, v1

    .line 84
    goto :goto_1

    .line 85
    :cond_5
    :goto_2
    return v0
.end method

.method public bridge synthetic getSize(Ljava/lang/Object;)I
    .locals 0

    .line 86
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter$2;->getSize(Ljava/util/Map;)I

    move-result p0

    return p0
.end method

.method public getSize(Ljava/util/Map;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v1, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 16
    .line 17
    iget v1, v1, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    const/4 v3, 0x1

    .line 21
    if-ne v1, v2, :cond_3

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-direct {p0, v1}, Lcom/tantanapp/common/data/ProtobufAdapter$2;->removeCacheSize(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->w(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    add-int/2addr v0, v1

    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return v0

    .line 52
    :cond_3
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_5

    .line 61
    .line 62
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    if-nez v1, :cond_4

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_4
    invoke-direct {p0, v1}, Lcom/tantanapp/common/data/ProtobufAdapter$2;->removeCacheSize(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->getSize(Ljava/lang/Object;)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-static {v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->q(I)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    add-int/2addr v1, v2

    .line 83
    add-int/2addr v0, v1

    .line 84
    goto :goto_1

    .line 85
    :cond_5
    :goto_2
    return v0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 118
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter$2;->parse(Ll/nc5;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public parse(Ll/nc5;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nc5;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
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
    new-instance p0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    iget v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->itemTag:I

    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/ghq0;->a(Ll/nc5;I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    new-instance v1, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {v1, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v3, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v3, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$keySelector:Ll/qcj;

    .line 43
    .line 44
    invoke-interface {v3, v2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 54
    .line 55
    .line 56
    add-int/lit8 v4, v4, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object p0, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$keySelector:Ll/qcj;

    .line 64
    .line 65
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v1, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    return-object v1

    .line 75
    :cond_2
    :goto_1
    add-int/lit8 v2, v0, -0x1

    .line 76
    .line 77
    iget-object v3, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    if-ge v4, v2, :cond_3

    .line 80
    .line 81
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse(Ll/nc5;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    iget-object v3, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$keySelector:Ll/qcj;

    .line 86
    .line 87
    invoke-interface {v3, v2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 97
    .line 98
    .line 99
    add-int/lit8 v4, v4, 0x1

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_3
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse(Ll/nc5;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object p0, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$keySelector:Ll/qcj;

    .line 107
    .line 108
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    check-cast p0, Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v1, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    return-object v1
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/data/ProtobufAdapter$2;->serialize(Ljava/util/Map;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method

.method public serialize(Ljava/util/Map;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
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
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object v1, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    iget v1, v1, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {p2, v2, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->U(II)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    iget v2, v1, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 42
    .line 43
    const/4 v3, 0x2

    .line 44
    if-ne v2, v3, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->getSize(Ljava/lang/Object;)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p2, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->P(I)V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object v1, p0, Lcom/tantanapp/common/data/ProtobufAdapter$2;->val$from:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    invoke-virtual {v1, v0, p2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    :goto_1
    return-void
.end method
