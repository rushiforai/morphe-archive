.class public Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;
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
            "Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "tacittestprofilecard"


# instance fields
.field public otherUserState:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public otherUserStateText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public questionLib:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public questionTypes:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public tacitTestNewQuestion:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public triggerMsgGuideCard:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public updateText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public userState:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public userStateText:Ljava/lang/String;
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
    new-instance v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->nullCheck()V

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

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->clone()Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileCard;->clone()Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 23
    .line 24
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->triggerMsgGuideCard:Z

    .line 25
    .line 26
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->triggerMsgGuideCard:Z

    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userState:Z

    .line 29
    .line 30
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userState:Z

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 35
    .line 36
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserState:Z

    .line 37
    .line 38
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserState:Z

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 43
    .line 44
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->tacitTestNewQuestion:Z

    .line 45
    .line 46
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->tacitTestNewQuestion:Z

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 49
    .line 50
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 51
    .line 52
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->clone()Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 36
    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->triggerMsgGuideCard:Z

    .line 44
    .line 45
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->triggerMsgGuideCard:Z

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userState:Z

    .line 50
    .line 51
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userState:Z

    .line 52
    .line 53
    if-ne v1, v3, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserState:Z

    .line 66
    .line 67
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserState:Z

    .line 68
    .line 69
    if-ne v1, v3, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->tacitTestNewQuestion:Z

    .line 82
    .line 83
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->tacitTestNewQuestion:Z

    .line 84
    .line 85
    if-ne v1, v3, :cond_2

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 88
    .line 89
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_2

    .line 96
    .line 97
    return v0

    .line 98
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "tacittestprofilecard"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_a

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    add-int/2addr v0, v1

    .line 19
    mul-int/lit8 v0, v0, 0x29

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileCard;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->triggerMsgGuideCard:Z

    .line 48
    .line 49
    const/16 v3, 0x4d5

    .line 50
    .line 51
    const/16 v4, 0x4cf

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    move v1, v4

    .line 56
    goto :goto_3

    .line 57
    :cond_3
    move v1, v3

    .line 58
    :goto_3
    add-int/2addr v0, v1

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userState:Z

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    move v1, v4

    .line 66
    goto :goto_4

    .line 67
    :cond_4
    move v1, v3

    .line 68
    :goto_4
    add-int/2addr v0, v1

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz v1, :cond_5

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    goto :goto_5

    .line 80
    :cond_5
    move v1, v2

    .line 81
    :goto_5
    add-int/2addr v0, v1

    .line 82
    mul-int/lit8 v0, v0, 0x29

    .line 83
    .line 84
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserState:Z

    .line 85
    .line 86
    if-eqz v1, :cond_6

    .line 87
    .line 88
    move v1, v4

    .line 89
    goto :goto_6

    .line 90
    :cond_6
    move v1, v3

    .line 91
    :goto_6
    add-int/2addr v0, v1

    .line 92
    mul-int/lit8 v0, v0, 0x29

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz v1, :cond_7

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    goto :goto_7

    .line 103
    :cond_7
    move v1, v2

    .line 104
    :goto_7
    add-int/2addr v0, v1

    .line 105
    mul-int/lit8 v0, v0, 0x29

    .line 106
    .line 107
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->tacitTestNewQuestion:Z

    .line 108
    .line 109
    if-eqz v1, :cond_8

    .line 110
    .line 111
    move v3, v4

    .line 112
    :cond_8
    add-int/2addr v0, v3

    .line 113
    mul-int/lit8 v0, v0, 0x29

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz v1, :cond_9

    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    :cond_9
    add-int/2addr v0, v2

    .line 124
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 125
    .line 126
    :cond_a
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionLib:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->questionTypes:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileCard;->new_()Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->profileCard:Lcom/p1/mobile/putong/core/data/ProfileCard;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->userStateText:Ljava/lang/String;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->otherUserStateText:Ljava/lang/String;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->updateText:Ljava/lang/String;

    .line 42
    .line 43
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
