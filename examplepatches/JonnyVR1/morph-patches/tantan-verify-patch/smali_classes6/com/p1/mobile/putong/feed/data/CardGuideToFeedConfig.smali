.class public Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "cardguidetofeedconfig"


# instance fields
.field public disLikeFollowTypeTipsFemal:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public disLikeFollowTypeTipsMale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public disLikeLikeTypeTipsFemal:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public disLikeLikeTypeTipsMale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public disLikeNewUserLimite:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public disLikeNoFollowTypeTipsFemal:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public disLikeNoFollowTypeTipsMale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public disLikeSwipeCountLimite:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public isAvailable:Z

.field public misMatchFollowTypeTipsFemal:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public misMatchFollowTypeTipsMale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public misMatchLikeTypeTipsFemal:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public misMatchLikeTypeTipsMale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public misMatchNewUserLimite:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public misMatchNoFollowTypeTipsFemal:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public misMatchNoFollowTypeTipsMale:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public misMatchSwipeCountLimite:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->clone()Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNewUserLimite:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNewUserLimite:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNewUserLimite:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNewUserLimite:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeSwipeCountLimite:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeSwipeCountLimite:I

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchSwipeCountLimite:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchSwipeCountLimite:I

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 67
    .line 68
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 69
    .line 70
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->clone()Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNewUserLimite:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNewUserLimite:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNewUserLimite:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNewUserLimite:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeSwipeCountLimite:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeSwipeCountLimite:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchSwipeCountLimite:I

    .line 32
    .line 33
    iget v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchSwipeCountLimite:I

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_2

    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 128
    .line 129
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_2

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 138
    .line 139
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_2

    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 148
    .line 149
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-eqz p0, :cond_2

    .line 156
    .line 157
    return v0

    .line 158
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "cardguidetofeedconfig"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_c

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNewUserLimite:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNewUserLimite:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeSwipeCountLimite:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchSwipeCountLimite:I

    .line 23
    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move v1, v2

    .line 38
    :goto_0
    add-int/2addr v0, v1

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    move v1, v2

    .line 51
    :goto_1
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    move v1, v2

    .line 64
    :goto_2
    add-int/2addr v0, v1

    .line 65
    mul-int/lit8 v0, v0, 0x29

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz v1, :cond_3

    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    goto :goto_3

    .line 76
    :cond_3
    move v1, v2

    .line 77
    :goto_3
    add-int/2addr v0, v1

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz v1, :cond_4

    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    goto :goto_4

    .line 89
    :cond_4
    move v1, v2

    .line 90
    :goto_4
    add-int/2addr v0, v1

    .line 91
    mul-int/lit8 v0, v0, 0x29

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz v1, :cond_5

    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    goto :goto_5

    .line 102
    :cond_5
    move v1, v2

    .line 103
    :goto_5
    add-int/2addr v0, v1

    .line 104
    mul-int/lit8 v0, v0, 0x29

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 107
    .line 108
    if-eqz v1, :cond_6

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    goto :goto_6

    .line 115
    :cond_6
    move v1, v2

    .line 116
    :goto_6
    add-int/2addr v0, v1

    .line 117
    mul-int/lit8 v0, v0, 0x29

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 120
    .line 121
    if-eqz v1, :cond_7

    .line 122
    .line 123
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    goto :goto_7

    .line 128
    :cond_7
    move v1, v2

    .line 129
    :goto_7
    add-int/2addr v0, v1

    .line 130
    mul-int/lit8 v0, v0, 0x29

    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 133
    .line 134
    if-eqz v1, :cond_8

    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    goto :goto_8

    .line 141
    :cond_8
    move v1, v2

    .line 142
    :goto_8
    add-int/2addr v0, v1

    .line 143
    mul-int/lit8 v0, v0, 0x29

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 146
    .line 147
    if-eqz v1, :cond_9

    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    goto :goto_9

    .line 154
    :cond_9
    move v1, v2

    .line 155
    :goto_9
    add-int/2addr v0, v1

    .line 156
    mul-int/lit8 v0, v0, 0x29

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 159
    .line 160
    if-eqz v1, :cond_a

    .line 161
    .line 162
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    goto :goto_a

    .line 167
    :cond_a
    move v1, v2

    .line 168
    :goto_a
    add-int/2addr v0, v1

    .line 169
    mul-int/lit8 v0, v0, 0x29

    .line 170
    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 172
    .line 173
    if-eqz v1, :cond_b

    .line 174
    .line 175
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    :cond_b
    add-int/2addr v0, v2

    .line 180
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 181
    .line 182
    :cond_c
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsFemal:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsFemal:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeFollowTypeTipsMale:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchFollowTypeTipsMale:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsFemal:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeNoFollowTypeTipsMale:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchNoFollowTypeTipsMale:Ljava/lang/String;

    .line 50
    .line 51
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_8

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsFemal:Ljava/lang/String;

    .line 56
    .line 57
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_9

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsFemal:Ljava/lang/String;

    .line 62
    .line 63
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v0, :cond_a

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->disLikeLikeTypeTipsMale:Ljava/lang/String;

    .line 68
    .line 69
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 70
    .line 71
    if-nez v0, :cond_b

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->misMatchLikeTypeTipsMale:Ljava/lang/String;

    .line 74
    .line 75
    :cond_b
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CardGuideToFeedConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
