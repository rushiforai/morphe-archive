.class Lcom/p1/mobile/putong/core/data/MeetRelation$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MeetRelation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MeetRelation;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/MessageNanoAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MeetRelation;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MeetRelation;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/RelationshipExt;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 39
    .line 40
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 41
    check-cast p1, Lcom/p1/mobile/putong/core/data/MeetRelation;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MeetRelation$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MeetRelation;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MeetRelation;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MeetRelation;-><init>()V

    .line 4
    .line 5
    .line 6
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_5

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_4

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_3

    .line 19
    .line 20
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_2

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 49
    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 51
    .line 52
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 53
    .line 54
    if-nez p1, :cond_8

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RelationshipExt;->new_()Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/RelationshipExt;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 97
    .line 98
    if-nez p1, :cond_6

    .line 99
    .line 100
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 107
    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 109
    .line 110
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 111
    .line 112
    if-nez p1, :cond_7

    .line 113
    .line 114
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 121
    .line 122
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 123
    .line 124
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 125
    .line 126
    if-nez p1, :cond_8

    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RelationshipExt;->new_()Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 133
    .line 134
    :cond_8
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 135
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MeetRelation$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MeetRelation;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MeetRelation;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MeetRelation;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 p1, 0x3

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/data/RelationshipExt;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/data/MeetRelation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MeetRelation$1;->serialize(Lcom/p1/mobile/putong/core/data/MeetRelation;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
