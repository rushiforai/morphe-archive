.class public Lcom/p1/mobile/putong/data/UssTags;
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
            "Lcom/p1/mobile/putong/data/UssTags;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/UssTags;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "usstags"


# instance fields
.field public avatarIdentifier:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public cardStyle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public debugInfo:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public eventInfo:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public newUser:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public onlineStatus:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public onlyShowAboutMeInside:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public profileShowFollowButton:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public repeatedUser:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public selected:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public showAboutMeOnCard:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public subTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UssTags$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UssTags$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/UssTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/UssTags$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UssTags$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/UssTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/UssTags;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UssTags;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UssTags;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/UssTags;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UssTags;->clone()Lcom/p1/mobile/putong/data/UssTags;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/UssTags;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UssTags;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UssTags;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/data/UssTags;->onlineStatus:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/data/UssTags;->onlineStatus:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/UssTags;->selected:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/UssTags;->selected:I

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->newUser:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/UssTags;->newUser:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->repeatedUser:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/UssTags;->repeatedUser:Z

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 45
    .line 46
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->showAboutMeOnCard:Z

    .line 47
    .line 48
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/UssTags;->showAboutMeOnCard:Z

    .line 49
    .line 50
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->onlyShowAboutMeInside:Z

    .line 51
    .line 52
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/UssTags;->onlyShowAboutMeInside:Z

    .line 53
    .line 54
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UssTags;->profileShowFollowButton:Z

    .line 55
    .line 56
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/UssTags;->profileShowFollowButton:Z

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UssTags;->clone()Lcom/p1/mobile/putong/data/UssTags;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/UssTags;

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
    check-cast p1, Lcom/p1/mobile/putong/data/UssTags;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/data/UssTags;->onlineStatus:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/data/UssTags;->onlineStatus:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/data/UssTags;->selected:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/data/UssTags;->selected:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->newUser:Z

    .line 26
    .line 27
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/UssTags;->newUser:Z

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->repeatedUser:Z

    .line 52
    .line 53
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/UssTags;->repeatedUser:Z

    .line 54
    .line 55
    if-ne v1, v3, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->showAboutMeOnCard:Z

    .line 98
    .line 99
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/UssTags;->showAboutMeOnCard:Z

    .line 100
    .line 101
    if-ne v1, v3, :cond_2

    .line 102
    .line 103
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->onlyShowAboutMeInside:Z

    .line 104
    .line 105
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/UssTags;->onlyShowAboutMeInside:Z

    .line 106
    .line 107
    if-ne v1, v3, :cond_2

    .line 108
    .line 109
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UssTags;->profileShowFollowButton:Z

    .line 110
    .line 111
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/UssTags;->profileShowFollowButton:Z

    .line 112
    .line 113
    if-ne p0, p1, :cond_2

    .line 114
    .line 115
    return v0

    .line 116
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "usstags"

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
    if-nez v0, :cond_b

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/data/UssTags;->onlineStatus:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/data/UssTags;->selected:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->newUser:Z

    .line 18
    .line 19
    const/16 v2, 0x4d5

    .line 20
    .line 21
    const/16 v3, 0x4cf

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    move v1, v3

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v1, v2

    .line 28
    :goto_0
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    move v1, v4

    .line 42
    :goto_1
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    move v1, v4

    .line 55
    :goto_2
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->repeatedUser:Z

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    move v1, v3

    .line 63
    goto :goto_3

    .line 64
    :cond_3
    move v1, v2

    .line 65
    :goto_3
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x29

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    goto :goto_4

    .line 77
    :cond_4
    move v1, v4

    .line 78
    :goto_4
    add-int/2addr v0, v1

    .line 79
    mul-int/lit8 v0, v0, 0x29

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    goto :goto_5

    .line 90
    :cond_5
    move v1, v4

    .line 91
    :goto_5
    add-int/2addr v0, v1

    .line 92
    mul-int/lit8 v0, v0, 0x29

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz v1, :cond_6

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    goto :goto_6

    .line 103
    :cond_6
    move v1, v4

    .line 104
    :goto_6
    add-int/2addr v0, v1

    .line 105
    mul-int/lit8 v0, v0, 0x29

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 108
    .line 109
    if-eqz v1, :cond_7

    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    :cond_7
    add-int/2addr v0, v4

    .line 116
    mul-int/lit8 v0, v0, 0x29

    .line 117
    .line 118
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->showAboutMeOnCard:Z

    .line 119
    .line 120
    if-eqz v1, :cond_8

    .line 121
    .line 122
    move v1, v3

    .line 123
    goto :goto_7

    .line 124
    :cond_8
    move v1, v2

    .line 125
    :goto_7
    add-int/2addr v0, v1

    .line 126
    mul-int/lit8 v0, v0, 0x29

    .line 127
    .line 128
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->onlyShowAboutMeInside:Z

    .line 129
    .line 130
    if-eqz v1, :cond_9

    .line 131
    .line 132
    move v1, v3

    .line 133
    goto :goto_8

    .line 134
    :cond_9
    move v1, v2

    .line 135
    :goto_8
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UssTags;->profileShowFollowButton:Z

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    move v2, v3

    .line 143
    :cond_a
    add-int/2addr v0, v2

    .line 144
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 145
    .line 146
    :cond_b
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->cardStyle:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->title:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->subTitle:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->debugInfo:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UssTags;->eventInfo:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/UssTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
