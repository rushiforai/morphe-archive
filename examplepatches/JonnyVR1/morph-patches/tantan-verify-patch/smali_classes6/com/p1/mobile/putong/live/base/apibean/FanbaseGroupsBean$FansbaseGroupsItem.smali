.class public Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FansbaseGroupsItem"
.end annotation


# instance fields
.field private avatar:Ljava/lang/String;

.field private canJoin:Z

.field private cannotJoinReason:Ljava/lang/String;

.field private category:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$CategoryBean;

.field private currentMemberCount:I

.field private desc:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private maxMemberCount:I

.field private name:Ljava/lang/String;

.field private statusDesc:Ljava/lang/String;

.field private tags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$TagItemBean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->this$0:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getAvatar()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->avatar:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCannotJoinReason()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->cannotJoinReason:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCategory()Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$CategoryBean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->category:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$CategoryBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentMemberCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->currentMemberCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getDesc()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->desc:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaxMemberCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->maxMemberCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStatusDesc()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->statusDesc:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTags()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$TagItemBean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->tags:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public isCanJoin()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->canJoin:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAvatar(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->avatar:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCanJoin(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->canJoin:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCannotJoinReason(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->cannotJoinReason:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCategory(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$CategoryBean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->category:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$CategoryBean;

    .line 2
    .line 3
    return-void
.end method

.method public setCurrentMemberCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->currentMemberCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setDesc(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->desc:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMaxMemberCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->maxMemberCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setStatusDesc(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->statusDesc:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTags(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$TagItemBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->tags:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "FansbaseGroupsItem{id=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', name=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', tags="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->tags:Ljava/util/List;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", desc=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->desc:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', avatar=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->avatar:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', canJoin="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->canJoin:Z

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", cannotJoinReason=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->cannotJoinReason:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, "\', statusDesc=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->statusDesc:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\', category="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->category:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$CategoryBean;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", maxMemberCount="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->maxMemberCount:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", currentMemberCount="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->currentMemberCount:I

    .line 109
    .line 110
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const/16 p0, 0x7d

    .line 114
    .line 115
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    return-object p0
.end method
