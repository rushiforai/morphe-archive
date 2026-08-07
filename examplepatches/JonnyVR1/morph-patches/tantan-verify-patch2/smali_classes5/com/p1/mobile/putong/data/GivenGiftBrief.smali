.class public Lcom/p1/mobile/putong/data/GivenGiftBrief;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/data/GivenGiftBrief$GiftPriority;
    }
.end annotation


# static fields
.field public static final ADVANCED_GIFT_LEVEL:I = 0xc8

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/GivenGiftBrief;",
            ">;"
        }
    .end annotation
.end field

.field public static final LUXURY_GIFT_LEVEL:I = 0x12c

.field public static final MIDDLE_GIFT_LEVEL:I = 0x64

.field public static final NORMAL_GIFT_LEVEL:I = 0x1

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/GivenGiftBrief;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "givengiftbrief"


# instance fields
.field public comboId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public combos:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public expiredTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public fpUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public from:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public giftLevel:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public id:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public isFirstGivenGift:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public num:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public pollFromNetwork:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public remain:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public stickFacePositionType:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public userName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/GivenGiftBrief$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/GivenGiftBrief$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/GivenGiftBrief$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/GivenGiftBrief$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static isAniToPlay(I)Z
    .locals 1

    const/16 v0, 0x64

    if-eq p0, v0, :cond_1

    const/16 v0, 0xc8

    if-eq p0, v0, :cond_1

    const/16 v0, 0x12c

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static isHighRankGift(I)Z
    .locals 1

    const/16 v0, 0xc8

    if-eq p0, v0, :cond_1

    const/16 v0, 0x12c

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static isMiddleRankGift(I)Z
    .locals 1

    const/16 v0, 0x64

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/GivenGiftBrief;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/GivenGiftBrief;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/GivenGiftBrief;->nullCheck()V

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

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/GivenGiftBrief;->clone()Lcom/p1/mobile/putong/data/GivenGiftBrief;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/GivenGiftBrief;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/GivenGiftBrief;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->id:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->id:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->num:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->num:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->giftLevel:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->giftLevel:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->combos:I

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->combos:I

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->pollFromNetwork:Z

    .line 39
    .line 40
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->pollFromNetwork:Z

    .line 41
    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->stickFacePositionType:I

    .line 43
    .line 44
    iput v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->stickFacePositionType:I

    .line 45
    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->remain:I

    .line 47
    .line 48
    iput v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->remain:I

    .line 49
    .line 50
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->expiredTime:J

    .line 51
    .line 52
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->expiredTime:J

    .line 53
    .line 54
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isFirstGivenGift:Z

    .line 55
    .line 56
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isFirstGivenGift:Z

    .line 57
    .line 58
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/GivenGiftBrief;->clone()Lcom/p1/mobile/putong/data/GivenGiftBrief;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;

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
    check-cast p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->id:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->id:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->num:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->num:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->giftLevel:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->giftLevel:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->combos:I

    .line 72
    .line 73
    iget v3, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->combos:I

    .line 74
    .line 75
    if-ne v1, v3, :cond_2

    .line 76
    .line 77
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->pollFromNetwork:Z

    .line 78
    .line 79
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->pollFromNetwork:Z

    .line 80
    .line 81
    if-ne v1, v3, :cond_2

    .line 82
    .line 83
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->stickFacePositionType:I

    .line 84
    .line 85
    iget v3, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->stickFacePositionType:I

    .line 86
    .line 87
    if-ne v1, v3, :cond_2

    .line 88
    .line 89
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->remain:I

    .line 90
    .line 91
    iget v3, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->remain:I

    .line 92
    .line 93
    if-ne v1, v3, :cond_2

    .line 94
    .line 95
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->expiredTime:J

    .line 96
    .line 97
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->expiredTime:J

    .line 98
    .line 99
    cmp-long v1, v3, v5

    .line 100
    .line 101
    if-nez v1, :cond_2

    .line 102
    .line 103
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isFirstGivenGift:Z

    .line 104
    .line 105
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isFirstGivenGift:Z

    .line 106
    .line 107
    if-ne p0, p1, :cond_2

    .line 108
    .line 109
    return v0

    .line 110
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "givengiftbrief"

    .line 2
    .line 3
    return-object p0
.end method

.method public getGiftPriority()Lcom/p1/mobile/putong/data/GivenGiftBrief$GiftPriority;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->giftLevel:I

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isHighRankGift(I)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/data/GivenGiftBrief$GiftPriority;->ownLuxury:Lcom/p1/mobile/putong/data/GivenGiftBrief$GiftPriority;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/data/GivenGiftBrief$GiftPriority;->owmNormal:Lcom/p1/mobile/putong/data/GivenGiftBrief$GiftPriority;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    invoke-static {p0}, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isHighRankGift(I)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/data/GivenGiftBrief$GiftPriority;->otherLuxury:Lcom/p1/mobile/putong/data/GivenGiftBrief$GiftPriority;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/data/GivenGiftBrief$GiftPriority;->otherNormal:Lcom/p1/mobile/putong/data/GivenGiftBrief$GiftPriority;

    .line 39
    .line 40
    return-object p0
.end method

.method public hashCode()I
    .locals 8

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->id:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->num:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->giftLevel:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v1, v2

    .line 33
    :goto_0
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move v1, v2

    .line 46
    :goto_1
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    move v1, v2

    .line 59
    :goto_2
    add-int/2addr v0, v1

    .line 60
    mul-int/lit8 v0, v0, 0x29

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    :cond_3
    add-int/2addr v0, v2

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->combos:I

    .line 74
    .line 75
    add-int/2addr v0, v1

    .line 76
    mul-int/lit8 v0, v0, 0x29

    .line 77
    .line 78
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->pollFromNetwork:Z

    .line 79
    .line 80
    const/16 v2, 0x4d5

    .line 81
    .line 82
    const/16 v3, 0x4cf

    .line 83
    .line 84
    if-eqz v1, :cond_4

    .line 85
    .line 86
    move v1, v3

    .line 87
    goto :goto_3

    .line 88
    :cond_4
    move v1, v2

    .line 89
    :goto_3
    add-int/2addr v0, v1

    .line 90
    mul-int/lit8 v0, v0, 0x29

    .line 91
    .line 92
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->stickFacePositionType:I

    .line 93
    .line 94
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->remain:I

    .line 98
    .line 99
    add-int/2addr v0, v1

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-wide v4, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->expiredTime:J

    .line 103
    .line 104
    const/16 v1, 0x20

    .line 105
    .line 106
    ushr-long v6, v4, v1

    .line 107
    .line 108
    xor-long/2addr v4, v6

    .line 109
    long-to-int v1, v4

    .line 110
    add-int/2addr v0, v1

    .line 111
    mul-int/lit8 v0, v0, 0x29

    .line 112
    .line 113
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isFirstGivenGift:Z

    .line 114
    .line 115
    if-eqz v1, :cond_5

    .line 116
    .line 117
    move v2, v3

    .line 118
    :cond_5
    add-int/2addr v0, v2

    .line 119
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 120
    .line 121
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/GivenGiftBrief;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
