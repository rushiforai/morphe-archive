.class Lcom/p1/mobile/putong/account/data/AccountAssetsSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->placeholder:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->intlOnlyPasswordCountryWhiteList:Ljava/util/List;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x2

    .line 23
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    const/4 v0, 0x3

    .line 29
    iget-boolean v1, p1, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->getNumberSwitch:Z

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 37
    .line 38
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 39
    check-cast p1, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;-><init>()V

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
    const-string v1, ""

    .line 11
    .line 12
    if-eqz v0, :cond_4

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_3

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_2

    .line 21
    .line 22
    const/16 v2, 0x18

    .line 23
    .line 24
    if-eq v0, v2, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->placeholder:Ljava/lang/String;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->placeholder:Ljava/lang/String;

    .line 31
    .line 32
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->intlOnlyPasswordCountryWhiteList:Ljava/util/List;

    .line 33
    .line 34
    if-nez p1, :cond_6

    .line 35
    .line 36
    new-instance p1, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->intlOnlyPasswordCountryWhiteList:Ljava/util/List;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->getNumberSwitch:Z

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ljava/util/List;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->intlOnlyPasswordCountryWhiteList:Ljava/util/List;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->placeholder:Ljava/lang/String;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->placeholder:Ljava/lang/String;

    .line 74
    .line 75
    if-nez p1, :cond_5

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->placeholder:Ljava/lang/String;

    .line 78
    .line 79
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->intlOnlyPasswordCountryWhiteList:Ljava/util/List;

    .line 80
    .line 81
    if-nez p1, :cond_6

    .line 82
    .line 83
    new-instance p1, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->intlOnlyPasswordCountryWhiteList:Ljava/util/List;

    .line 89
    .line 90
    :cond_6
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->placeholder:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->intlOnlyPasswordCountryWhiteList:Ljava/util/List;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x2

    .line 20
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 p0, 0x3

    .line 24
    iget-boolean p1, p1, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;->getNumberSwitch:Z

    .line 25
    .line 26
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/data/AccountAssetsSettings$1;->serialize(Lcom/p1/mobile/putong/account/data/AccountAssetsSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
